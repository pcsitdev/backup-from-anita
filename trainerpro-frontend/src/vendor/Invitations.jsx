import { useEffect, useMemo, useState } from 'react'
import { Link } from 'react-router-dom'
import { FaArrowRight, FaBriefcase, FaEnvelopeOpenText, FaMapMarkerAlt, FaSearch, FaUserTie } from 'react-icons/fa'
import Layout from '../components/Layout'
import API from '../services/api'
import './Invitations.css'

const getCollection = (payload) => {
  if (Array.isArray(payload)) return payload
  if (Array.isArray(payload?.content)) return payload.content
  if (Array.isArray(payload?.data)) return payload.data
  if (Array.isArray(payload?.invitations)) return payload.invitations
  if (Array.isArray(payload?.items)) return payload.items
  return []
}

const getInvitationStatus = (invitation) => {
  const rawStatus = invitation.status || invitation.invitationStatus || 'PENDING'
  return rawStatus.toUpperCase()
}

const getStatusLabel = (status) => {
  if (status === 'INTERESTED') return 'Interested'
  if (status === 'NOT_INTERESTED') return 'Not Interested'
  if (status === 'SHORTLISTED') return 'Shortlisted'
  if (status === 'INTERVIEW_SCHEDULED') return 'Interview Scheduled'
  if (status === 'SELECTED') return 'Selected'
  if (status === 'ONBOARDED') return 'Onboarded'
  if (status === 'REJECTED_BY_VENDOR') return 'Rejected by Vendor'
  return 'Pending Response'
}

const getRelativeTime = (value) => {
  if (!value) return 'Recently'

  const date = new Date(value)
  if (Number.isNaN(date.getTime())) return value

  const diffMs = Date.now() - date.getTime()
  const diffMinutes = Math.max(1, Math.floor(diffMs / 60000))

  if (diffMinutes < 60) return `${diffMinutes} min ago`

  const diffHours = Math.floor(diffMinutes / 60)
  if (diffHours < 24) return `${diffHours} hour${diffHours > 1 ? 's' : ''} ago`

  const diffDays = Math.floor(diffHours / 24)
  if (diffDays < 7) return `${diffDays} day${diffDays > 1 ? 's' : ''} ago`

  return date.toLocaleDateString()
}

const formatBudget = (value) => {
  if (value === null || value === undefined || value === '') return 'TBD'

  const numericValue = Number(value)
  if (Number.isNaN(numericValue)) return 'TBD'

  return new Intl.NumberFormat('en-IN', {
    style: 'currency',
    currency: 'INR',
    maximumFractionDigits: 0,
  }).format(numericValue)
}

const formatSkills = (skills) => {
  if (!skills) return []
  return Array.isArray(skills) ? skills.filter(Boolean) : String(skills).split(',').map((item) => item.trim()).filter(Boolean)
}

const getApiErrorMessage = (error, fallbackMessage) => {
  const payload = error?.response?.data

  if (typeof payload === 'string' && payload.trim()) {
    return payload
  }

  if (typeof payload?.message === 'string' && payload.message.trim()) {
    return payload.message
  }

  if (error?.message === 'Network Error') {
    return 'Unable to reach backend service. Please verify backend is running and try again.'
  }

  return fallbackMessage
}

const statusFilters = ['ALL', 'PENDING', 'INTERESTED', 'SHORTLISTED', 'INTERVIEW_SCHEDULED', 'SELECTED', 'ONBOARDED', 'NOT_INTERESTED', 'REJECTED_BY_VENDOR']

const getNextVendorActions = (status) => {
  if (status === 'INTERESTED') {
    return ['SHORTLISTED', 'SELECTED', 'REJECTED_BY_VENDOR']
  }
  if (status === 'SHORTLISTED') {
    return ['INTERVIEW_SCHEDULED', 'SELECTED', 'REJECTED_BY_VENDOR']
  }
  if (status === 'INTERVIEW_SCHEDULED') {
    return ['SELECTED', 'REJECTED_BY_VENDOR']
  }
  if (status === 'SELECTED') {
    return ['ONBOARDED']
  }
  return []
}

const VendorInvitations = () => {
  const [invitations, setInvitations] = useState([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState('')
  const [query, setQuery] = useState('')
  const [statusFilter, setStatusFilter] = useState('ALL')
  const [expandedInvitationId, setExpandedInvitationId] = useState(null)
  const [updatingInvitationId, setUpdatingInvitationId] = useState(null)

  useEffect(() => {
    let isMounted = true

    const loadInvitations = async () => {
      setLoading(true)
      setError('')

      try {
        const response = await API.get('/invitations/vendor')
        if (!isMounted) return

        const payload = getCollection(response.data).map((invitation) => ({
          ...invitation,
          trainingSkills: formatSkills(invitation.trainingSkills),
        }))

        setInvitations(payload)
        setExpandedInvitationId(payload[0]?.id ?? null)
      } catch (loadError) {
        if (!isMounted) return
        setInvitations([])
        setExpandedInvitationId(null)
        setError(getApiErrorMessage(loadError, 'Unable to load invitation pipeline right now.'))
      } finally {
        if (isMounted) {
          setLoading(false)
        }
      }
    }

    loadInvitations()

    return () => {
      isMounted = false
    }
  }, [])

  const invitationSummary = useMemo(() => {
    const pending = invitations.filter((item) => getInvitationStatus(item) === 'PENDING').length
    const interested = invitations.filter((item) => getInvitationStatus(item) === 'INTERESTED').length
    const progressed = invitations.filter((item) => ['SHORTLISTED', 'INTERVIEW_SCHEDULED', 'SELECTED', 'ONBOARDED'].includes(getInvitationStatus(item))).length
    const notInterested = invitations.filter((item) => getInvitationStatus(item) === 'NOT_INTERESTED').length

    return {
      total: invitations.length,
      pending,
      interested,
      progressed,
      notInterested,
    }
  }, [invitations])

  const updateVendorStatus = async (invitationId, nextStatus) => {
    setUpdatingInvitationId(invitationId)
    setError('')

    try {
      const response = await API.put(`/invitations/${invitationId}/vendor-status`, {
        status: nextStatus,
      })

      setInvitations((current) =>
        current.map((invitation) =>
          invitation.id === invitationId
            ? {
                ...invitation,
                ...response.data,
                trainingSkills: formatSkills(response.data?.trainingSkills || invitation.trainingSkills),
              }
            : invitation
        )
      )
    } catch (updateError) {
      setError(getApiErrorMessage(updateError, 'Unable to update invitation status right now.'))
    } finally {
      setUpdatingInvitationId(null)
    }
  }

  const filteredInvitations = useMemo(() => {
    const normalizedQuery = query.trim().toLowerCase()

    return invitations.filter((invitation) => {
      const status = getInvitationStatus(invitation)
      const matchesStatus = statusFilter === 'ALL' || status === statusFilter
      const matchesQuery =
        !normalizedQuery ||
        invitation.trainerName?.toLowerCase().includes(normalizedQuery) ||
        invitation.trainerEmail?.toLowerCase().includes(normalizedQuery) ||
        invitation.trainingTitle?.toLowerCase().includes(normalizedQuery) ||
        invitation.trainingLocation?.toLowerCase().includes(normalizedQuery)

      return matchesStatus && matchesQuery
    })
  }, [invitations, query, statusFilter])

  return (
    <Layout>
      <section className="vendor-invitations-hero">
        <div>
          <p className="vendor-invitations-eyebrow">Vendor invitation pipeline</p>
          <h2 className="vendor-invitations-title">Track trainer responses from invite to decision.</h2>
          <p className="vendor-invitations-copy">
            Send invitations from trainer discovery, then manage responses, trainer interest, and next actions from one commercial workflow.
          </p>
        </div>

        <div className="vendor-invitations-stat-grid">
          <article className="vendor-invite-stat">
            <span>Total invites</span>
            <strong>{invitationSummary.total}</strong>
          </article>
          <article className="vendor-invite-stat">
            <span>Awaiting response</span>
            <strong>{invitationSummary.pending}</strong>
          </article>
          <article className="vendor-invite-stat positive">
            <span>Interested</span>
            <strong>{invitationSummary.interested}</strong>
          </article>
          <article className="vendor-invite-stat">
            <span>In Progress</span>
            <strong>{invitationSummary.progressed}</strong>
          </article>
          <article className="vendor-invite-stat muted">
            <span>Not interested</span>
            <strong>{invitationSummary.notInterested}</strong>
          </article>
        </div>
      </section>

      <section className="vendor-invitations-shell">
        <div className="vendor-invitations-toolbar">
          <div className="vendor-invitations-search">
            <FaSearch />
            <input
              type="text"
              value={query}
              onChange={(event) => setQuery(event.target.value)}
              placeholder="Search by trainer, email, training, or location"
            />
          </div>

          <div className="vendor-invitations-filters">
            {statusFilters.map((status) => (
              <button
                key={status}
                type="button"
                className={`vendor-invite-filter ${statusFilter === status ? 'active' : ''}`}
                onClick={() => setStatusFilter(status)}
              >
                {status === 'ALL' ? 'All' : getStatusLabel(status)}
              </button>
            ))}
          </div>
        </div>

        {loading ? <div className="state-banner info">Loading invitation pipeline...</div> : null}
        {error ? <div className="state-banner error">{error}</div> : null}

        {!loading && !error ? (
          filteredInvitations.length > 0 ? (
            <div className="vendor-invitations-list">
              {filteredInvitations.map((invitation) => {
                const status = getInvitationStatus(invitation)
                const isExpanded = expandedInvitationId === invitation.id

                return (
                  <article key={invitation.id} className={`vendor-invitation-row ${status.toLowerCase()}`}>
                    <button
                      type="button"
                      className="vendor-invitation-summary"
                      onClick={() =>
                        setExpandedInvitationId((current) => (current === invitation.id ? null : invitation.id))
                      }
                    >
                      <div className="vendor-invitation-main">
                        <div className="vendor-invitation-person">
                          <FaUserTie />
                          <div>
                            <span>Trainer</span>
                            <strong>{invitation.trainerName || 'Trainer'}</strong>
                            <small>{invitation.trainerEmail || 'No email shared'}</small>
                          </div>
                        </div>

                        <div className="vendor-invitation-training">
                          <span>Training</span>
                          <strong>{invitation.trainingTitle || 'Training'}</strong>
                          <small>{invitation.trainingLocation || 'Location TBD'}</small>
                        </div>
                      </div>

                      <div className="vendor-invitation-meta">
                        <span className="vendor-invitation-chip">
                          <FaBriefcase /> {invitation.trainingDuration || 'Duration TBD'}
                        </span>
                        <span className="vendor-invitation-chip">
                          <FaMapMarkerAlt /> {formatBudget(invitation.trainingBudget)}
                        </span>
                        <span className={`vendor-invitation-status ${status.toLowerCase()}`}>
                          {getStatusLabel(status)}
                        </span>
                        <span className="vendor-invitation-time">
                          {getRelativeTime(invitation.createdAt)}
                        </span>
                      </div>
                    </button>

                    {isExpanded ? (
                      <div className="vendor-invitation-panel">
                        <div className="vendor-invitation-grid">
                          <div className="vendor-invitation-field">
                            <span>Training status</span>
                            <strong>{invitation.trainingStatus || 'Open'}</strong>
                          </div>
                          <div className="vendor-invitation-field">
                            <span>Budget</span>
                            <strong>{formatBudget(invitation.trainingBudget)}</strong>
                          </div>
                          <div className="vendor-invitation-field full">
                            <span>Training overview</span>
                            <p>{invitation.trainingDescription || 'No training overview available.'}</p>
                          </div>
                          <div className="vendor-invitation-field full">
                            <span>Required skills</span>
                            {invitation.trainingSkills?.length > 0 ? (
                              <div className="vendor-invitation-skill-list">
                                {invitation.trainingSkills.map((skill) => (
                                  <span key={skill} className="vendor-invitation-skill">
                                    {skill}
                                  </span>
                                ))}
                              </div>
                            ) : (
                              <p>No specific skills listed.</p>
                            )}
                          </div>
                          <div className="vendor-invitation-field full">
                            <span>Invitation note</span>
                            <p>{invitation.message || 'No note was attached to this invitation.'}</p>
                          </div>
                        </div>

                        <div className="vendor-invitation-actions">
                          {getNextVendorActions(status).map((nextStatus) => (
                            <button
                              key={nextStatus}
                              type="button"
                              className="vendor-invitation-action tertiary"
                              onClick={() => updateVendorStatus(invitation.id, nextStatus)}
                              disabled={updatingInvitationId === invitation.id}
                            >
                              {updatingInvitationId === invitation.id ? 'Updating...' : getStatusLabel(nextStatus)}
                            </button>
                          ))}
                          <Link to={`/vendor/trainer/${invitation.trainerId}`} className="vendor-invitation-action primary">
                            View Trainer Profile <FaArrowRight />
                          </Link>
                          <Link to={`/vendor/applications/${invitation.trainingId}`} className="vendor-invitation-action secondary">
                            Open Training Pipeline <FaArrowRight />
                          </Link>
                        </div>
                      </div>
                    ) : null}
                  </article>
                )
              })}
            </div>
          ) : (
            <div className="vendor-invitations-empty">
              <p>No invitations match the current view.</p>
              <span>Send invites from Browse Trainers or open a different filter to review more activity.</span>
            </div>
          )
        ) : null}
      </section>
    </Layout>
  )
}

export default VendorInvitations
