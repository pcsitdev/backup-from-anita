import { useEffect, useMemo, useState } from 'react'
import { Link } from 'react-router-dom'
import { useSelector } from 'react-redux'
import { FaArrowRight, FaCamera, FaCheckCircle, FaUserEdit } from 'react-icons/fa'
import Layout from '../components/Layout'
import API from '../services/api'
import './Dashboard.css'

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

const formatList = (value) => {
  if (!value) return []
  return Array.isArray(value)
    ? value.filter(Boolean)
    : String(value)
        .split(',')
        .map((item) => item.trim())
        .filter(Boolean)
}

const getInvitationStatus = (invitation) => {
  const rawStatus = invitation.status || invitation.invitationStatus || 'PENDING'
  return rawStatus.toUpperCase()
}

const getInvitationActivityStatus = (invitation) => {
  const status = getInvitationStatus(invitation)

  if (status === 'NOT_INTERESTED' || status === 'REJECTED_BY_VENDOR') return 'completed'
  if (
    status === 'INTERESTED' ||
    status === 'SHORTLISTED' ||
    status === 'INTERVIEW_SCHEDULED' ||
    status === 'SELECTED' ||
    status === 'ONBOARDED'
  ) {
    return 'accepted'
  }
  return 'pending'
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

  if (vendorName !== 'a vendor' || trainingTitle !== 'a training program') {
    return `${vendorName} invited you to ${trainingTitle}`
  }

  return invitation.message || 'You have a new training invitation.'
}

const getAssetUrl = (assetPath) => {
  if (!assetPath) return ''
  if (/^(https?:|blob:|data:)/i.test(assetPath)) return assetPath

  const apiBase = API.defaults.baseURL?.replace(/\/$/, '') || ''
  const apiOrigin = apiBase.replace(/\/api$/, '')
  const normalizedPath = assetPath.startsWith('/') ? assetPath : `/${assetPath}`

  return `${apiOrigin}${normalizedPath}`
}

const getProfileCompletion = (user) => {
  const completionFields = [
    user?.name,
    user?.mobile,
    user?.location,
    user?.education,
    user?.experience,
    user?.bio,
    user?.skills,
    user?.certifications,
    user?.trainingDomains,
    user?.trainingModes,
    user?.languages,
    user?.profileImage,
    user?.resume,
    user?.resumeUrl,
    user?.cv,
  ]

  const completeCount = completionFields.filter((value) => {
    if (!value) return false
    return String(value).trim().length > 0
  }).length

  return Math.min(100, Math.round((completeCount / completionFields.length) * 100))
}

const TrainerDashboard = () => {
  const { user } = useSelector((state) => state.auth)
  const [applications, setApplications] = useState([])
  const [invitations, setInvitations] = useState([])
  const [trainings, setTrainings] = useState([])
  const [loading, setLoading] = useState(true)
  const [inviteError, setInviteError] = useState('')

  useEffect(() => {
    let isMounted = true

    const fetchInvitations = async () => {
      try {
        const response = await API.get('/invitations/trainer')
        if (!isMounted) return

        const payload = getCollection(response.data)
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

        setInvitations(filteredPayload)
        setInviteError('')
      } catch (error) {
        if (!isMounted) return

        setInvitations([])
        setInviteError('Unable to load invitations right now.')
      }
    }

    const loadDashboard = async () => {
      setLoading(true)

      try {
        const [applicationsResponse, trainingsResponse] = await Promise.allSettled([
          API.get('/applications/my'),
          API.get('/trainings'),
        ])

        if (!isMounted) return

        if (applicationsResponse.status === 'fulfilled') {
          setApplications(Array.isArray(applicationsResponse.value.data) ? applicationsResponse.value.data : [])
        }

        if (trainingsResponse.status === 'fulfilled') {
          setTrainings(Array.isArray(trainingsResponse.value.data) ? trainingsResponse.value.data : [])
        }

        await fetchInvitations()
      } finally {
        if (isMounted) {
          setLoading(false)
        }
      }
    }

    loadDashboard()

    return () => {
      isMounted = false
    }
  }, [user?.id])

  const pendingInvitations = useMemo(
    () => invitations.filter((invitation) => getInvitationStatus(invitation) === 'PENDING'),
    [invitations]
  )

  const invitationActivity = useMemo(
    () =>
      invitations.slice(0, 4).map((invitation) => ({
        type: 'invitation',
        message: getInvitationMessage(invitation),
        time: getRelativeTime(invitation.sentAt || invitation.createdAt || invitation.updatedAt),
        rawTime: invitation.sentAt || invitation.createdAt || invitation.updatedAt,
        status: getInvitationActivityStatus(invitation),
      })),
    [invitations]
  )

  const applicationActivity = useMemo(
    () =>
      applications.slice(0, 4).map((application) => ({
        type: 'application',
        message: `Application update for ${application.trainingTitle || application.title || 'a training program'}`,
        time: getRelativeTime(application.appliedAt || application.updatedAt || application.createdAt),
        rawTime: application.appliedAt || application.updatedAt || application.createdAt,
        status:
          application.status === 'ACCEPTED'
            ? 'accepted'
            : application.status === 'REJECTED'
              ? 'completed'
              : 'pending',
      })),
    [applications]
  )

  const recentActivity = [...invitationActivity, ...applicationActivity]
    .sort((left, right) => {
      const leftTime = left.rawTime ? new Date(left.rawTime).getTime() : 0
      const rightTime = right.rawTime ? new Date(right.rawTime).getTime() : 0
      return rightTime - leftTime
    })
    .slice(0, 6)

  const profileCompletion = getProfileCompletion(user)
  const profileCompletionLabel =
    profileCompletion < 100
      ? 'Complete your profile to improve visibility with vendors.'
      : 'Your profile is complete and ready for opportunities.'
  const profileCompletionMissing = Math.max(0, 100 - profileCompletion)
  const avatarUrl = getAssetUrl(user?.profileImage)
  const pendingApplicationCount = applications.filter((application) => application.status === 'PENDING').length
  const acceptedApplicationCount = applications.filter((application) => application.status === 'ACCEPTED').length

  const trainerStats = [
    {
      title: 'Available trainings',
      value: String(trainings.length),
      accent: 'blue',
      change: 'Open opportunities',
      icon: 'Target',
    },
    {
      title: 'Applications sent',
      value: String(applications.length),
      accent: 'teal',
      change: `${pendingApplicationCount} pending`,
      icon: 'Inbox',
    },
    {
      title: 'Pending invites',
      value: String(pendingInvitations.length),
      accent: 'gold',
      change: invitations.length > 0 ? `${invitations.length} total invitations` : 'Awaiting new invites',
      icon: 'Mail',
    },
    {
      title: 'Profile strength',
      value: `${profileCompletion}%`,
      accent: 'purple',
      change: `${formatList(user?.skills).length} skills listed`,
      icon: 'Profile',
    },
  ]

  const trainerHighlights = [
    {
      title: 'Profile readiness',
      value: `${profileCompletion}%`,
      detail: profileCompletionLabel,
    },
    {
      title: 'Application velocity',
      value: `${acceptedApplicationCount}/${applications.length || 0}`,
      detail: `${pendingApplicationCount} currently pending review`,
    },
    {
      title: 'Visibility signals',
      value: `${formatList(user?.trainingDomains).length} domains`,
      detail: `${formatList(user?.skills).length} skills and ${formatList(user?.languages).length} languages`,
    },
  ]

  return (
    <Layout>
      <section className="trainer-top-banner">
        <div className="trainer-profile-spotlight">
          <div className="trainer-avatar-frame">
            {avatarUrl ? (
              <img src={avatarUrl} alt={user?.name || 'Trainer profile'} />
            ) : (
              <div className="trainer-avatar-fallback">
                {user?.name?.charAt(0)?.toUpperCase() || 'T'}
              </div>
            )}
            <span className="trainer-avatar-badge">
              <FaCamera />
            </span>
          </div>

          <div className="trainer-profile-copy">
            <p className="dashboard-eyebrow">Trainer workspace</p>
            <h2 className="dashboard-page-title">Welcome back, {user?.name || 'Trainer'}.</h2>
            <p className="dashboard-copy">
              Track opportunities, invitations, and profile momentum from a polished enterprise workspace.
            </p>

            <div className="trainer-status-row">
              <span className="trainer-status-pill">
                <FaCheckCircle />
                {user?.role || 'TRAINER'}
              </span>
              <span className="trainer-status-pill subtle">
                <FaUserEdit />
                {profileCompletion}% profile complete
              </span>
            </div>

            <div className="trainer-highlight-strip">
              {trainerHighlights.map((item) => (
                <article key={item.title} className="trainer-highlight-card">
                  <p>{item.title}</p>
                  <strong>{item.value}</strong>
                  <span>{item.detail}</span>
                </article>
              ))}
            </div>
          </div>
        </div>

        <div className={`profile-completion-card ${profileCompletion < 100 ? 'needs-completion' : 'complete'}`}>
          <div className="profile-completion-header">
            <div>
              <p className="profile-completion-label">Profile completion</p>
              <strong>{profileCompletion}% complete</strong>
            </div>
            <span className="profile-completion-chip">
              {profileCompletionMissing > 0 ? `${profileCompletionMissing}% left` : 'Done'}
            </span>
          </div>

          <div
            className="completion-track"
            role="progressbar"
            aria-valuenow={profileCompletion}
            aria-valuemin="0"
            aria-valuemax="100"
          >
            <div className="completion-fill" style={{ width: `${profileCompletion}%` }} />
          </div>

          <p className="profile-completion-copy">{profileCompletionLabel}</p>

          {profileCompletion < 100 && (
            <Link to="/trainer/profile" className="completion-cta">
              Complete profile <FaArrowRight />
            </Link>
          )}
        </div>
      </section>

      <section className="dashboard-grid">
        {trainerStats.map((item) => (
          <article key={item.title} className={`dashboard-stat-card ${item.accent}`}>
            <div className="stat-header">
              <span className="stat-icon">{item.icon}</span>
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
              <h3>Vendor Invitations</h3>
              <Link to="/trainer/invitations" className="panel-link">
                View all
              </Link>
            </div>
            {loading ? (
              <div className="state-banner info">Loading invitations...</div>
            ) : inviteError ? (
              <div className="state-banner error">{inviteError}</div>
            ) : invitations.length > 0 ? (
              <div className="dashboard-invite-summary">
                <div className="dashboard-invite-summary-copy">
                  <p>{pendingInvitations.length} pending invites need your response.</p>
                  <span>Open the dedicated invitations page to review vendor details and respond.</span>
                </div>
                <Link to="/trainer/invitations" className="action-btn primary">
                  <span>Invite</span>
                  Review invitations
                </Link>
              </div>
            ) : (
              <div className="empty-dashboard-state">
                <p>No vendor invitations yet.</p>
                <span>When a vendor invites you to a training, you can review it from the invitations page.</span>
              </div>
            )}
          </article>

          <article className="dashboard-panel">
            <div className="panel-header-row">
              <h3>Quick Actions</h3>
              <span className="panel-link subtle">Role shortcuts</span>
            </div>
            <div className="quick-actions">
              <Link to="/trainer/trainings" className="action-btn primary">
                <span>Search</span>
                Browse Trainings
              </Link>
              <Link to="/trainer/applications" className="action-btn secondary">
                <span>List</span>
                My Applications
              </Link>
              <Link to="/trainer/invitations" className="action-btn secondary">
                <span>Mail</span>
                Invitations
              </Link>
              <Link to="/trainer/profile" className="action-btn secondary">
                <span>Edit</span>
                Update Profile
              </Link>
            </div>
          </article>
        </section>

        <section className="dashboard-panels">
          <article className="dashboard-panel panel-accent">
            <div className="panel-header-row">
              <h3>Recent Activity</h3>
              <span className="panel-link subtle">{recentActivity.length} items</span>
            </div>
            {recentActivity.length > 0 ? (
              <div className="activity-list">
                {recentActivity.map((activity, index) => (
                  <div key={`${activity.type}-${index}`} className={`activity-item ${activity.status}`}>
                    <div className="activity-content">
                      <p className="activity-message">{activity.message}</p>
                      <span className="activity-time">{activity.time}</span>
                    </div>
                    <span className={`activity-status ${activity.status}`}>
                      {activity.status === 'pending' && 'Queued'}
                      {activity.status === 'viewed' && 'Viewed'}
                      {activity.status === 'accepted' && 'Accepted'}
                      {activity.status === 'completed' && 'Closed'}
                    </span>
                  </div>
                ))}
              </div>
            ) : (
              <div className="empty-dashboard-state">
                <p>No recent activity yet.</p>
                <span>Apply to trainings or wait for vendor invites to start seeing updates here.</span>
              </div>
            )}
          </article>

          <article className="dashboard-panel">
            <div className="panel-header-row">
              <h3>Profile Visibility</h3>
              <span className="panel-link subtle">Search readiness</span>
            </div>
            <div className="profile-visibility">
              <div className="visibility-item spotlight">
                <span className="visibility-label">Profile Completion</span>
                <div className="progress-bar">
                  <div className="progress-fill" style={{ width: `${profileCompletion}%` }} />
                </div>
                <span className="progress-text">{profileCompletion}% Complete</span>
              </div>
              <div className="visibility-item">
                <span className="visibility-label">Skills Listed</span>
                <span className="skill-count">{formatList(user?.skills).length} skills</span>
              </div>
              <div className="visibility-item">
                <span className="visibility-label">Training Domains</span>
                <span className="cert-count">{formatList(user?.trainingDomains).length} domains</span>
              </div>
            </div>
          </article>
        </section>
      </div>
    </Layout>
  )
}

export default TrainerDashboard
