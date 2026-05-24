import { useEffect, useMemo, useState } from 'react'
import { Link } from 'react-router-dom'
import {
  FaCalendarAlt,
  FaBuilding,
  FaMapMarkerAlt,
  FaPaperPlane,
  FaSearch,
  FaTag,
} from 'react-icons/fa'
import Layout from '../components/Layout'
import API from '../services/api'
import './MyApplications.css'

const MyApplications = () => {
  const [applications, setApplications] = useState([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState('')

  const fetchApplications = async () => {
    setLoading(true)
    setError('')

    try {
      const response = await API.get('/applications/my')
      setApplications(Array.isArray(response.data) ? response.data : [])
    } catch (fetchError) {
      console.error(fetchError)
      setError('Unable to load your applications right now.')
    } finally {
      setLoading(false)
    }
  }

  useEffect(() => {
    fetchApplications()
  }, [])

  const getStatusTone = (status) => {
    const normalized = String(status || '').toUpperCase()

    if (normalized.includes('ACCEPT')) return 'accepted'
    if (normalized.includes('REJECT')) return 'rejected'
    if (normalized.includes('SHORT')) return 'review'
    if (normalized.includes('PENDING')) return 'pending'
    return 'submitted'
  }

  const formatList = (value) => {
    if (!value) return []
    if (Array.isArray(value)) return value.filter(Boolean)
    return String(value)
      .split(',')
      .map((item) => item.trim())
      .filter(Boolean)
  }

  const formatDate = (value) => {
    if (!value) return 'Recently'
    const date = new Date(value)
    if (Number.isNaN(date.getTime())) return String(value)
    return date.toLocaleDateString('en-IN', {
      day: 'numeric',
      month: 'short',
      year: 'numeric',
    })
  }

  const summary = useMemo(() => {
    const total = applications.length
    const accepted = applications.filter((item) => getStatusTone(item.status) === 'accepted').length
    const pending = applications.filter((item) => getStatusTone(item.status) === 'pending').length
    const rejected = applications.filter((item) => getStatusTone(item.status) === 'rejected').length

    return [
      { label: 'Submitted', value: total, tone: 'submitted' },
      { label: 'Under review', value: pending, tone: 'review' },
      { label: 'Accepted', value: accepted, tone: 'accepted' },
      { label: 'Rejected', value: rejected, tone: 'rejected' },
    ]
  }, [applications])

  return (
    <Layout>
      <section className="applications-hero">
        <div className="applications-hero-copy">
          <p className="applications-eyebrow">Trainer workflow</p>
          <h2 className="applications-page-title">Track your submitted applications.</h2>
          <p className="applications-copy">
            Review application progress, compare status at a glance, and follow up on the opportunities
            you have already applied for.
          </p>
          <div className="applications-badges">
            <span>Pipeline visibility</span>
            <span>Commercial follow-up</span>
            <span>Status tracking</span>
          </div>
        </div>

        <div className="applications-hero-stats" aria-label="Application stats">
          {summary.map((item) => (
            <article key={item.label} className={`application-stat ${item.tone}`}>
              <strong>{item.value}</strong>
              <span>{item.label}</span>
            </article>
          ))}
        </div>
      </section>

      {loading ? (
        <section className="applications-shell">
          <div className="state-banner info">Loading your applications...</div>
        </section>
      ) : error ? (
        <section className="applications-shell">
          <div className="state-banner error">{error}</div>
        </section>
      ) : applications.length > 0 ? (
        <section className="applications-shell">
          <div className="applications-toolbar">
            <div className="applications-toolbar-copy">
              <FaSearch />
              <span>{applications.length} application records</span>
            </div>
            <Link to="/trainer/trainings" className="applications-toolbar-link">
              Browse trainings
            </Link>
          </div>

          <div className="applications-directory-head">
            <div>Application</div>
            <div>Commercial details</div>
            <div>Status</div>
          </div>

          <div className="applications-directory-body">
            {applications.map((application) => {
              const statusTone = getStatusTone(application.status)
              const skillList = formatList(application.skills)

              return (
                <article key={application.id} className={`application-row ${statusTone}`}>
                  <div className="application-col primary">
                    <div className="application-row-topline">
                      <div>
                        <p className="application-tag">Submitted application</p>
                        <h3>{application.trainingTitle || application.title || 'Training opportunity'}</h3>
                      </div>
                      <span className={`application-pill ${statusTone}`}>{application.status || 'SUBMITTED'}</span>
                    </div>

                    <p className="application-copy">
                      {application.description ||
                        'Application details are available through the training record and vendor review workflow.'}
                    </p>

                    <div className="application-chip-row">
                      {skillList.slice(0, 5).map((skill) => (
                        <span key={skill} className="application-chip">
                          <FaTag />
                          {skill}
                        </span>
                      ))}
                    </div>
                  </div>

                  <div className="application-col meta">
                    <div className="application-meta-item">
                      <FaBuilding />
                      <div>
                        <span className="meta-label">Vendor</span>
                        <strong>{application.vendorName || 'Assigned vendor'}</strong>
                      </div>
                    </div>

                    <div className="application-meta-item">
                      <FaMapMarkerAlt />
                      <div>
                        <span className="meta-label">Location</span>
                        <strong>{application.location || 'Not specified'}</strong>
                      </div>
                    </div>

                    <div className="application-meta-item">
                      <FaCalendarAlt />
                      <div>
                        <span className="meta-label">Applied on</span>
                        <strong>{formatDate(application.appliedAt || application.createdAt)}</strong>
                      </div>
                    </div>

                    <div className="application-meta-item">
                      <FaPaperPlane />
                      <div>
                        <span className="meta-label">Mode</span>
                        <strong>{application.mode || application.deliveryMode || 'Not specified'}</strong>
                      </div>
                    </div>
                  </div>

                  <div className="application-col status">
                    <span className={`application-pill status-block ${statusTone}`}>
                      {application.status || 'SUBMITTED'}
                    </span>
                    <p className="application-status-copy">
                      {statusTone === 'accepted'
                        ? 'This application has moved forward in the vendor pipeline.'
                        : statusTone === 'rejected'
                          ? 'This opportunity is closed for this application.'
                          : statusTone === 'review'
                            ? 'Your profile is being evaluated by the vendor team.'
                            : 'Your application is queued for vendor review.'}
                    </p>
                    <Link to="/trainer/trainings" className="application-action">
                      Browse trainings
                    </Link>
                  </div>
                </article>
              )
            })}
          </div>
        </section>
      ) : (
        <section className="applications-empty">
          <div className="applications-empty-icon">
            <FaSearch />
          </div>
          <p className="applications-empty-kicker">No submissions yet</p>
          <h3>No applications yet</h3>
          <p>Apply to a training opportunity and it will appear here for tracking.</p>
          <Link to="/trainer/trainings" className="applications-empty-action">
            Browse trainings
          </Link>
        </section>
      )}
    </Layout>
  )
}

export default MyApplications
