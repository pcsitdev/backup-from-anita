import { useEffect, useMemo, useState } from 'react'
import { Link } from 'react-router-dom'
import { FaArrowRight, FaCheckCircle, FaUserShield } from 'react-icons/fa'
import Layout from '../components/Layout'
import API from '../services/api'
import '../trainer/Dashboard.css'

const emptyDashboard = {
  counts: {},
  userBreakdown: {},
  trainingBreakdown: {},
  applicationBreakdown: {},
  invitationBreakdown: {},
  recentUsers: [],
  recentTrainings: [],
}

const formatStatus = (value) => {
  if (!value) return 'Unknown'
  return String(value)
    .toLowerCase()
    .split('_')
    .map((part) => part.charAt(0).toUpperCase() + part.slice(1))
    .join(' ')
}

const AdminDashboard = () => {
  const [dashboard, setDashboard] = useState(emptyDashboard)
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState('')

  useEffect(() => {
    let isMounted = true

    const fetchDashboard = async () => {
      setLoading(true)
      setError('')

      try {
        const response = await API.get('/admin/dashboard')

        if (!isMounted) return
        setDashboard(response.data || emptyDashboard)
      } catch (fetchError) {
        if (!isMounted) return
        setError('Unable to load admin dashboard right now.')
      } finally {
        if (isMounted) {
          setLoading(false)
        }
      }
    }

    fetchDashboard()

    return () => {
      isMounted = false
    }
  }, [])

  const cards = useMemo(
    () => [
      {
        title: 'Platform users',
        value: String(dashboard.counts?.users || 0),
        accent: 'blue',
        change: `${dashboard.counts?.pendingUsers || 0} pending approvals`,
      },
      {
        title: 'Open trainings',
        value: String(dashboard.counts?.openTrainings || 0),
        accent: 'teal',
        change: `${dashboard.counts?.trainings || 0} total requirements`,
      },
      {
        title: 'Applications',
        value: String(dashboard.counts?.applications || 0),
        accent: 'gold',
        change: `${dashboard.counts?.invitations || 0} invitations sent`,
      },
    ],
    [dashboard]
  )

  const roleStats = [
    { label: 'Trainers', value: dashboard.counts?.trainers || 0 },
    { label: 'Vendors', value: dashboard.counts?.vendors || 0 },
    { label: 'Admins', value: dashboard.counts?.admins || 0 },
  ]

  const trainingHighlights = Object.entries(dashboard.trainingBreakdown || {})
  const applicationHighlights = Object.entries(dashboard.applicationBreakdown || {})
  const invitationHighlights = Object.entries(dashboard.invitationBreakdown || {})

  return (
    <Layout>
      <section className="dashboard-hero">
        <div>
          <p className="dashboard-eyebrow">Admin workspace</p>
          <h2 className="dashboard-page-title">Control access, monitor demand, and keep the platform healthy.</h2>
          <p className="dashboard-copy">
            The admin module now tracks real platform counts, role distribution, training demand, and user activity from the backend.
          </p>
        </div>
      </section>

      {loading ? <div className="state-banner info">Loading admin dashboard...</div> : null}
      {error ? <div className="state-banner error">{error}</div> : null}

      {!loading && !error ? (
        <>
          <section className="dashboard-grid">
            {cards.map((item) => (
              <article key={item.title} className={`dashboard-stat-card ${item.accent}`}>
                <div className="stat-header">
                  <span className="stat-icon">{item.title.slice(0, 1)}</span>
                  <span className="stat-change">{item.change}</span>
                </div>
                <p>{item.title}</p>
                <strong>{item.value}</strong>
              </article>
            ))}
          </section>

          <div className="dashboard-content-grid">
            <section className="dashboard-panels">
              <article className="dashboard-panel panel-accent">
                <div className="panel-header-row">
                  <h3>User Footprint</h3>
                  <Link to="/admin/users" className="panel-link">
                    Open users
                  </Link>
                </div>
                <div className="admin-metric-grid">
                  {roleStats.map((item) => (
                  <div key={item.label} className="admin-metric-card">
                      <span>{item.label}</span>
                      <strong>{item.value}</strong>
                    </div>
                  ))}
                </div>
                <div className="dashboard-list">
                  <div className="dashboard-list-item">
                    Pending approvals: {dashboard.userBreakdown?.pending || 0}
                  </div>
                  <div className="dashboard-list-item">
                    Active accounts: {dashboard.userBreakdown?.active || 0}
                  </div>
                  <div className="dashboard-list-item">
                    Inactive accounts: {dashboard.userBreakdown?.inactive || 0}
                  </div>
                </div>
              </article>

              <article className="dashboard-panel">
                <div className="panel-header-row">
                  <h3>Quick Actions</h3>
                  <span className="panel-link subtle">Admin shortcuts</span>
                </div>
                <div className="quick-actions">
                  <Link to="/admin/users" className="action-btn primary">
                    <span>Users</span>
                    Review accounts
                  </Link>
                  <Link to="/admin/trainings" className="action-btn secondary">
                    <span>Trainings</span>
                    Inspect postings
                  </Link>
                  <Link to="/admin/applications" className="action-btn secondary">
                    <span>Apps</span>
                    Review applications
                  </Link>
                  <Link to="/admin/invitations" className="action-btn secondary">
                    <span>Invites</span>
                    Review invitations
                  </Link>
                </div>
                <div className="dashboard-list">
                  <div className="dashboard-list-item">Keep an eye on inactive accounts and role misalignment.</div>
                  <div className="dashboard-list-item">Use training oversight to spot stale or overloaded marketplace flow.</div>
                  <div className="dashboard-list-item">Use applications and invitations to monitor conversion across the platform.</div>
                </div>
              </article>
            </section>

            <section className="dashboard-panels">
              <article className="dashboard-panel panel-accent">
                <div className="panel-header-row">
                  <h3>Operational Signals</h3>
                  <span className="panel-link subtle">Live breakdowns</span>
                </div>
                <div className="insights-list">
                  {trainingHighlights.map(([key, value]) => (
                    <div key={`training-${key}`} className="insight-item">
                      <span className="insight-icon">
                        <FaCheckCircle />
                      </span>
                      <div className="insight-content">
                        <p>Trainings: {formatStatus(key)}</p>
                        <span className="insight-trend positive">{value}</span>
                      </div>
                    </div>
                  ))}
                  {applicationHighlights.map(([key, value]) => (
                    <div key={`application-${key}`} className="insight-item">
                      <span className="insight-icon">
                        <FaArrowRight />
                      </span>
                      <div className="insight-content">
                        <p>Applications: {formatStatus(key)}</p>
                        <span className="insight-trend neutral">{value}</span>
                      </div>
                    </div>
                  ))}
                  {invitationHighlights.map(([key, value]) => (
                    <div key={`invitation-${key}`} className="insight-item">
                      <span className="insight-icon">
                        <FaUserShield />
                      </span>
                      <div className="insight-content">
                        <p>Invitations: {formatStatus(key)}</p>
                        <span className="insight-trend positive">{value}</span>
                      </div>
                    </div>
                  ))}
                </div>
              </article>

              <article className="dashboard-panel">
                <div className="panel-header-row">
                  <h3>Recent Platform Activity</h3>
                  <span className="panel-link subtle">Newest records</span>
                </div>
                <div className="activity-list">
                  {dashboard.recentUsers?.map((user) => (
                    <div key={`user-${user.id}`} className="activity-item accepted">
                      <div className="activity-content">
                        <p className="activity-message">{user.name || 'User'} joined or updated access</p>
                        <span className="activity-description">
                          {user.email} | {user.role}
                        </span>
                      </div>
                      <span className={`feature-status-pill ${user.active ? '' : 'muted'}`}>
                        {user.active ? 'Active' : 'Inactive'}
                      </span>
                    </div>
                  ))}
                  {dashboard.recentTrainings?.slice(0, 3).map((training) => (
                    <div key={`training-${training.id}`} className="activity-item pending">
                      <div className="activity-content">
                        <p className="activity-message">{training.title}</p>
                        <span className="activity-description">
                          {training.vendorName || 'Vendor'} | {training.location}
                        </span>
                      </div>
                      <span className="feature-status-pill">{training.status || 'Open'}</span>
                    </div>
                  ))}
                </div>
              </article>
            </section>
          </div>
        </>
      ) : null}
    </Layout>
  )
}

export default AdminDashboard
