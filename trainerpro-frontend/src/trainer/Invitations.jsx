import { useEffect, useMemo, useState } from 'react'
import { Link } from 'react-router-dom'
import { useSelector } from 'react-redux'
import Layout from '../components/Layout'
import { useToast } from '../components/Toast'
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

const getInvitationTrainerId = (invitation) =>
  invitation.trainerId ||
  invitation.trainer?.id ||
  invitation.trainer?.trainerId ||
  invitation.userId ||
  invitation.receiverId ||
  invitation.recipientId

const matchesCurrentTrainer = (invitation, user) => {
  const trainerId = getInvitationTrainerId(invitation)
  const invitationEmail =
    invitation.trainerEmail ||
    invitation.email ||
    invitation.trainer?.email ||
    invitation.receiverEmail ||
    invitation.recipientEmail
  const invitationName =
    invitation.trainerName ||
    invitation.name ||
    invitation.trainer?.name ||
    invitation.receiverName ||
    invitation.recipientName

  if (trainerId && user?.id) {
    return Number(trainerId) === Number(user.id)
  }

  if (invitationEmail && user?.email) {
    return invitationEmail.toLowerCase() === user.email.toLowerCase()
  }

  if (invitationName && user?.name) {
    return invitationName.toLowerCase() === user.name.toLowerCase()
  }

  return false
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

const getInvitationStatus = (invitation) => {
  const rawStatus = invitation.status || invitation.invitationStatus || 'PENDING'
  return rawStatus.toUpperCase()
}

const getInvitationStatusLabel = (invitation) => {
  const status = getInvitationStatus(invitation)

  if (status === 'INTERESTED') return 'Interested'
  if (status === 'NOT_INTERESTED') return 'Not Interested'
  if (status === 'SHORTLISTED') return 'Shortlisted'
  if (status === 'INTERVIEW_SCHEDULED') return 'Interview Scheduled'
  if (status === 'SELECTED') return 'Selected'
  if (status === 'ONBOARDED') return 'Onboarded'
  if (status === 'REJECTED_BY_VENDOR') return 'Not Selected'
  return 'Pending'
}

const getInvitationMessage = (invitation) => {
  const trainingTitle =
    invitation.trainingTitle ||
    invitation.training?.title ||
    invitation.title ||
    'a training program'

  const vendorName =
    invitation.vendorName ||
    invitation.vendor?.name ||
    invitation.senderName ||
    invitation.sender?.name ||
    invitation.createdByName ||
    'a vendor'

  return `${vendorName} invited you to ${trainingTitle}`
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
  const responseData = error?.response?.data

  if (typeof responseData === 'string' && responseData.trim()) {
    return responseData
  }

  if (typeof responseData?.message === 'string' && responseData.message.trim()) {
    return responseData.message
  }

  if (error?.message === 'Network Error') {
    return 'Unable to reach the backend service. Please verify the backend is running and then refresh.'
  }

  return fallbackMessage
}

const buildTrainingLookup = (items) =>
  new Map(
    items
      .filter((item) => item?.id)
      .map((item) => [Number(item.id), item])
  )

const enrichInvitation = (invitation, trainingLookup) => {
  const training = trainingLookup.get(Number(invitation.trainingId))

  return {
    ...invitation,
    trainingTitle: invitation.trainingTitle || training?.title || 'Training',
    trainingDescription: invitation.trainingDescription || training?.description || '',
    trainingLocation: invitation.trainingLocation || training?.location || '',
    trainingBudget:
      invitation.trainingBudget !== null && invitation.trainingBudget !== undefined
        ? invitation.trainingBudget
        : training?.budget,
    trainingDuration: invitation.trainingDuration || training?.duration || '',
    trainingSkills:
      formatSkills(invitation.trainingSkills).length > 0
        ? formatSkills(invitation.trainingSkills)
        : formatSkills(training?.skills),
    trainingStatus: invitation.trainingStatus || training?.status || '',
  }
}

const TrainerInvitations = () => {
  const { user } = useSelector((state) => state.auth)
  const { showError, showSuccess } = useToast()
  const [invitations, setInvitations] = useState([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState('')
  const [updatingInvitationId, setUpdatingInvitationId] = useState(null)
  const [expandedInvitationId, setExpandedInvitationId] = useState(null)

  useEffect(() => {
    let isMounted = true

    const loadInvitations = async () => {
      setLoading(true)
      setError('')

      try {
        const [invitationResponse, trainingResponse] = await Promise.allSettled([
          API.get('/invitations/trainer'),
          API.get('/trainings'),
        ])

        if (!isMounted) return

        if (invitationResponse.status !== 'fulfilled') {
          throw invitationResponse.reason
        }

        const trainingLookup =
          trainingResponse.status === 'fulfilled'
            ? buildTrainingLookup(getCollection(trainingResponse.value.data))
            : new Map()

        const payload = getCollection(invitationResponse.value.data)
        const filteredPayload = payload.filter((invitation) => {
          const hasTrainerReference =
            getInvitationTrainerId(invitation) ||
            invitation.trainerEmail ||
            invitation.email ||
            invitation.trainer?.email ||
            invitation.receiverEmail ||
            invitation.recipientEmail ||
            invitation.trainerName ||
            invitation.trainer?.name

          return hasTrainerReference ? matchesCurrentTrainer(invitation, user) : true
        })

        const enrichedInvitations = filteredPayload.map((invitation) =>
          enrichInvitation(invitation, trainingLookup)
        )

        setInvitations(enrichedInvitations)
        setExpandedInvitationId(enrichedInvitations[0]?.id ?? null)
      } catch (loadError) {
        if (!isMounted) return
        setInvitations([])
        setExpandedInvitationId(null)
        setError(
          getApiErrorMessage(
            loadError,
            'Unable to load invitations right now. If the backend was changed recently, restart it and refresh this page.'
          )
        )
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
  }, [user?.id])

  const pendingInvitations = useMemo(
    () => invitations.filter((invitation) => getInvitationStatus(invitation) === 'PENDING'),
    [invitations]
  )

  const handleInvitationResponse = async (invitationId, action) => {
    setUpdatingInvitationId(invitationId)

    try {
      const endpoint =
        action === 'INTERESTED'
          ? `/invitations/${invitationId}/interested`
          : `/invitations/${invitationId}/not-interested`

      const response = await API.put(endpoint)
      const updatedInvitation = response.data

      setInvitations((current) =>
        current.map((invitation) =>
          invitation.id === invitationId
            ? {
                ...invitation,
                ...updatedInvitation,
                trainingSkills:
                  formatSkills(updatedInvitation.trainingSkills).length > 0
                    ? formatSkills(updatedInvitation.trainingSkills)
                    : invitation.trainingSkills,
              }
            : invitation
        )
      )

      if (action === 'INTERESTED') {
        showSuccess('Your interest has been shared with the vendor.')
      } else {
        showSuccess('The vendor has been informed that you are not interested.')
      }
    } catch (requestError) {
      const message = getApiErrorMessage(
        requestError,
        'Unable to update invitation right now. Please try again.'
      )
      showError(message)
    } finally {
      setUpdatingInvitationId(null)
    }
  }

  return (
    <Layout>
      <section className="trainer-invitations-hero">
        <div>
          <p className="trainer-invitations-eyebrow">Trainer invitations</p>
          <h2 className="trainer-invitations-title">Invitation review workspace</h2>
          <p className="trainer-invitations-copy">
            Review vendor requests, compare training details, and respond from a cleaner enterprise queue.
          </p>
        </div>
        <div className="trainer-invitations-summary">
          <span>{pendingInvitations.length}</span>
          <p>Pending invitations</p>
        </div>
      </section>

      <section className="trainer-invitations-shell">
        <div className="trainer-invitations-toolbar">
          <div>
            <h3>Vendor Invitations</h3>
            <p>{invitations.length} invitations in your queue</p>
          </div>
          <Link to="/trainer/dashboard" className="trainer-invitations-backlink">
            Back to Dashboard
          </Link>
        </div>

        {loading ? <div className="state-banner info">Loading invitations...</div> : null}
        {error ? <div className="state-banner error">{error}</div> : null}

        {!loading && !error ? (
          invitations.length > 0 ? (
            <div className="trainer-invitations-list">
              {invitations.map((invitation) => {
                const status = getInvitationStatus(invitation)
                const isExpanded = expandedInvitationId === invitation.id

                return (
                  <article key={invitation.id} className={`trainer-invitation-row ${status.toLowerCase()}`}>
                    <button
                      type="button"
                      className="trainer-invitation-summary"
                      onClick={() =>
                        setExpandedInvitationId((current) => (current === invitation.id ? null : invitation.id))
                      }
                    >
                      <div className="trainer-invitation-summary-main">
                        <div className="trainer-invitation-party">
                          <p className="trainer-invitation-label">Vendor</p>
                          <strong>{invitation.vendorName || 'Vendor'}</strong>
                        </div>
                        <div className="trainer-invitation-party">
                          <p className="trainer-invitation-label">Training</p>
                          <strong>{invitation.trainingTitle || 'Training'}</strong>
                        </div>
                      </div>

                      <div className="trainer-invitation-summary-meta">
                        <span className="trainer-invitation-meta-chip">
                          {invitation.trainingLocation || 'Location TBD'}
                        </span>
                        <span className="trainer-invitation-meta-chip">
                          {invitation.trainingDuration || 'Duration TBD'}
                        </span>
                        <span className="trainer-invitation-meta-chip">
                          {formatBudget(invitation.trainingBudget)}
                        </span>
                        <span className={`trainer-invitation-status ${status.toLowerCase()}`}>
                          {getInvitationStatusLabel(invitation)}
                        </span>
                        <span className="trainer-invitation-time">
                          {getRelativeTime(invitation.createdAt || invitation.updatedAt)}
                        </span>
                        <span className={`trainer-invitation-toggle ${isExpanded ? 'open' : ''}`}>
                          Details
                        </span>
                      </div>
                    </button>

                    {isExpanded ? (
                      <div className="trainer-invitation-panel">
                        <div className="trainer-invitation-grid">
                          <div className="trainer-invitation-field">
                            <span>Invitation</span>
                            <strong>{getInvitationMessage(invitation)}</strong>
                          </div>
                          <div className="trainer-invitation-field">
                            <span>Training status</span>
                            <strong>{invitation.trainingStatus || 'Open'}</strong>
                          </div>
                          <div className="trainer-invitation-field full">
                            <span>Training overview</span>
                            <p>{invitation.trainingDescription || 'Training overview will be shared during follow-up.'}</p>
                          </div>
                          <div className="trainer-invitation-field full">
                            <span>Required skills</span>
                            {formatSkills(invitation.trainingSkills).length > 0 ? (
                              <div className="trainer-invitation-skill-list">
                                {formatSkills(invitation.trainingSkills).map((skill) => (
                                  <span key={skill} className="trainer-invitation-skill">
                                    {skill}
                                  </span>
                                ))}
                              </div>
                            ) : (
                              <p>No specific skills listed.</p>
                            )}
                          </div>
                          {invitation.message ? (
                            <div className="trainer-invitation-field full vendor-note">
                              <span>Vendor note</span>
                              <p>{invitation.message}</p>
                            </div>
                          ) : null}
                        </div>

                        {status === 'PENDING' ? (
                          <div className="trainer-invitation-actions">
                            <button
                              type="button"
                              className="trainer-invitation-btn primary"
                              onClick={() => handleInvitationResponse(invitation.id, 'INTERESTED')}
                              disabled={updatingInvitationId === invitation.id}
                            >
                              {updatingInvitationId === invitation.id ? 'Updating...' : 'I am Interested'}
                            </button>
                            <button
                              type="button"
                              className="trainer-invitation-btn secondary"
                              onClick={() => handleInvitationResponse(invitation.id, 'NOT_INTERESTED')}
                              disabled={updatingInvitationId === invitation.id}
                            >
                              {updatingInvitationId === invitation.id ? 'Updating...' : 'Not Interested'}
                            </button>
                          </div>
                        ) : null}
                      </div>
                    ) : null}
                  </article>
                )
              })}
            </div>
          ) : (
            <div className="trainer-invitations-empty">
              <p>No vendor invitations yet.</p>
              <span>When a vendor invites you to a training, you will see the full details here.</span>
            </div>
          )
        ) : null}
      </section>
    </Layout>
  )
}

export default TrainerInvitations
