import { useEffect, useMemo, useState } from 'react'
import { Link } from 'react-router-dom'
import {
  FaChartBar,
  FaClipboardList,
  FaEnvelopeOpenText,
  FaPlus,
  FaUsers,
  FaCheckCircle,
  FaClock,
} from 'react-icons/fa'
import Layout from '../components/Layout'
import LoadingSpinner from '../components/LoadingSpinner'
import API from '../services/api'

const VendorDashboard = () => {
  const [isLoading, setIsLoading] = useState(true)
  const [dashboardData, setDashboardData] = useState({
    stats: [],
    recentActivity: [],
    upcomingDeadlines: [],
  })

  useEffect(() => {
    const loadDashboard = async () => {
      setIsLoading(true)

      try {
        const [trainingsResponse, invitationsResponse] = await Promise.allSettled([
          API.get('/trainings/vendor'),
          API.get('/invitations/vendor'),
        ])

        const trainings =
          trainingsResponse.status === 'fulfilled' && Array.isArray(trainingsResponse.value.data)
            ? trainingsResponse.value.data
            : []

        const invitations =
          invitationsResponse.status === 'fulfilled' && Array.isArray(invitationsResponse.value.data)
            ? invitationsResponse.value.data
            : []

        const pendingInvitations = invitations.filter((item) => item.status === 'PENDING')
        const interestedInvitations = invitations.filter((item) => item.status === 'INTERESTED')
        const recentInvitationActivity = invitations
          .slice(0, 3)
          .map((invitation) => ({
            title:
              invitation.status === 'INTERESTED'
                ? 'Trainer expressed interest'
                : invitation.status === 'NOT_INTERESTED'
                  ? 'Trainer declined invitation'
                  : 'Invitation awaiting response',
            description: `${invitation.trainerName || 'Trainer'} | ${invitation.trainingTitle || 'Training'}`,
            time: invitation.createdAt ? new Date(invitation.createdAt).toLocaleDateString() : 'Recently',
            urgent: invitation.status === 'INTERESTED',
          }))

        setDashboardData({
          stats: [
            {
              title: 'Active Requirements',
              value: String(trainings.length),
              change: trainings.length > 0 ? `${trainings.filter((item) => item.status === 'OPEN').length} open now` : 'No open postings',
              accent: 'blue',
              icon: <FaClipboardList />,
              description: 'Published training requirements',
            },
            {
              title: 'Invitations Sent',
              value: String(invitations.length),
              change: pendingInvitations.length > 0 ? `${pendingInvitations.length} awaiting reply` : 'No pending replies',
              accent: 'teal',
              icon: <FaEnvelopeOpenText />,
              description: 'Trainer outreach pipeline',
            },
            {
              title: 'Interested Trainers',
              value: String(interestedInvitations.length),
              change: interestedInvitations.length > 0 ? 'Follow up now' : 'No confirmations yet',
              accent: 'gold',
              icon: <FaUsers />,
              description: 'Invites accepted by trainers',
            },
            {
              title: 'Pipeline Health',
              value: invitations.length > 0 ? `${Math.round((interestedInvitations.length / invitations.length) * 100)}%` : '0%',
              change: invitations.length > 0 ? 'Interest conversion' : 'Build your invite pipeline',
              accent: 'purple',
              icon: <FaChartBar />,
              description: 'Response quality across invites',
            },
          ],
          recentActivity:
            recentInvitationActivity.length > 0
              ? recentInvitationActivity
              : [
                  {
                    title: 'Start inviting trainers',
                    description: 'Use Browse Trainers to build your outreach pipeline.',
                    time: 'Next step',
                    urgent: false,
                  },
                ],
          upcomingDeadlines: [
            { title: 'Review interested trainers', due: interestedInvitations.length > 0 ? 'Today' : 'When available', priority: interestedInvitations.length > 0 ? 'high' : 'low' },
            { title: 'Check pending invitation replies', due: pendingInvitations.length > 0 ? 'This week' : 'On next campaign', priority: pendingInvitations.length > 0 ? 'medium' : 'low' },
            { title: 'Post new requirements if needed', due: trainings.length > 0 ? 'This month' : 'Now', priority: trainings.length > 0 ? 'low' : 'high' },
          ],
        })
      } finally {
        setIsLoading(false)
      }
    }

    loadDashboard()
  }, [])

  if (isLoading) {
    return (
      <Layout>
        <div className="dashboard-loading">
          <LoadingSpinner size="large" message="Loading dashboard..." />
        </div>
      </Layout>
    )
  }

  return (
    <Layout>
      <section className="dashboard-hero">
        <div>
          <p className="dashboard-eyebrow">Vendor workspace</p>
          <h2 className="dashboard-page-title">Manage requirements and monitor trainer pipeline.</h2>
          <p className="dashboard-copy">
            Track posted requirements, invitation responses, and commercial follow-up from one clean vendor workspace.
          </p>
        </div>
      </section>

      <section className="dashboard-grid">
        {dashboardData.stats.map((stat) => (
          <article key={stat.title} className={`dashboard-stat-card ${stat.accent}`}>
            <div className="stat-header">
              <span className="stat-icon">{stat.icon}</span>
              <span className="stat-change">{stat.change}</span>
            </div>
            <p>{stat.title}</p>
            <strong>{stat.value}</strong>
            <small className="stat-description">{stat.description}</small>
          </article>
        ))}
      </section>

      <div className="dashboard-content-grid">
        <section className="dashboard-panels">
          <article className="dashboard-panel">
            <h3>Recent Activity</h3>
            <div className="activity-list">
              {dashboardData.recentActivity.map((activity, index) => (
                <div key={index} className={`activity-item ${activity.urgent ? 'urgent' : ''}`}>
                  <div className="activity-content">
                    <p className="activity-message">{activity.title}</p>
                    <span className="activity-description">{activity.description}</span>
                    <span className="activity-time">{activity.time}</span>
                  </div>
                  {activity.urgent ? (
                    <span className="feature-status-pill">Urgent</span>
                  ) : (
                    <span className="activity-status neutral">
                      <FaClock />
                    </span>
                  )}
                </div>
              ))}
            </div>
          </article>

          <article className="dashboard-panel">
            <h3>Priority Actions</h3>
            <div className="quick-actions">
              <Link to="/vendor/post-training" className="action-btn primary">
                <FaPlus />
                Post New Training
              </Link>
              <Link to="/vendor/invitations" className="action-btn secondary">
                <FaEnvelopeOpenText />
                Review Invitations
              </Link>
            </div>
            <div className="dashboard-list" style={{ marginTop: '16px' }}>
              <div className="dashboard-list-item">Use the left navigation for Browse Trainers, Invitations, and My Trainings.</div>
              <div className="dashboard-list-item">Keep the dashboard focused on pipeline health, response tracking, and urgent follow-up.</div>
            </div>
          </article>
        </section>

        <section className="dashboard-panels">
          <article className="dashboard-panel">
            <h3>Upcoming Deadlines</h3>
            <div className="insights-list">
              {dashboardData.upcomingDeadlines.map((deadline, index) => (
                <div key={index} className="insight-item">
                  <span className="insight-icon">
                    <FaClock />
                  </span>
                  <div className="insight-content">
                    <p>{deadline.title}</p>
                    <span className={`insight-trend ${deadline.priority === 'high' ? 'negative' : deadline.priority === 'medium' ? 'neutral' : 'positive'}`}>
                      Due: {deadline.due}
                    </span>
                  </div>
                </div>
              ))}
            </div>
          </article>

          <article className="dashboard-panel">
            <h3>Operational Focus</h3>
            <div className="dashboard-list">
              <div className="dashboard-list-item">Respond quickly to new trainer applications.</div>
              <div className="dashboard-list-item">Keep training requirements updated and visible.</div>
              <div className="dashboard-list-item">Monitor cohort start dates and delivery readiness.</div>
            </div>
          </article>
        </section>
      </div>
    </Layout>
  )
}

export default VendorDashboard
