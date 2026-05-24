import { useEffect, useState } from 'react'
import { useParams, useNavigate } from 'react-router-dom'
import { FaArrowLeft, FaBriefcase, FaDownload, FaFileAlt, FaIdBadge, FaMapMarkerAlt, FaStar, FaEnvelope, FaPhone, FaPaperPlane } from 'react-icons/fa'
import Layout from '../components/Layout'
import API from '../services/api'
import LoadingSpinner from '../components/LoadingSpinner'
import { useToast } from '../components/Toast'
import './TrainerProfileView.css'

const TrainerProfileView = () => {
  const { trainerId } = useParams()
  const navigate = useNavigate()
  const { showSuccess, showError } = useToast()
  const [trainer, setTrainer] = useState(null)
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState('')
  const [trainings, setTrainings] = useState([])
  const [showInviteModal, setShowInviteModal] = useState(false)
  const [selectedTraining, setSelectedTraining] = useState('')
  const [inviting, setInviting] = useState(false)
  const [invitations, setInvitations] = useState([])
  const [resumeLabel, setResumeLabel] = useState('Trainer Resume')

  const fetchTrainerProfile = async () => {
    setLoading(true)
    setError('')

    try {
      const response = await API.get(`/trainers/${trainerId}`)
      setTrainer(response.data)
    } catch (fetchError) {
      console.error(fetchError)
      setError('Unable to load trainer profile.')
    } finally {
      setLoading(false)
    }
  }

  const fetchVendorTrainings = async () => {
    try {
      const response = await API.get('/trainings/vendor')
      setTrainings(response.data)
    } catch (fetchError) {
      console.error('Error fetching trainings:', fetchError)
    }
  }

  const fetchVendorInvitations = async () => {
    try {
      const response = await API.get('/invitations/vendor')
      setInvitations(Array.isArray(response.data) ? response.data : [])
    } catch (fetchError) {
      console.error('Error fetching invitations:', fetchError)
    }
  }

  useEffect(() => {
    fetchTrainerProfile()
    fetchVendorTrainings()
    fetchVendorInvitations()
  }, [trainerId])

  const isAlreadyInvited = (trainingId) =>
    invitations.some(
      (invitation) =>
        Number(invitation.trainerId) === Number(trainerId) &&
        Number(invitation.trainingId) === Number(trainingId)
    )

  const handleInvite = async () => {
    if (!selectedTraining) {
      showError('Please select a training to invite the trainer to.')
      return
    }

    if (isAlreadyInvited(selectedTraining)) {
      showError('This trainer has already been invited to the selected training.')
      return
    }

    setInviting(true)
    try {
      const response = await API.post('/invitations', {
        trainerId: Number(trainerId),
        trainingId: Number(selectedTraining),
        message: `We would like to invite you to apply for our ${trainings.find(t => t.id === Number(selectedTraining))?.title} training program.`
      })
      setInvitations((current) => [response.data, ...current])
      showSuccess('Invitation sent successfully!')
      setShowInviteModal(false)
      setSelectedTraining('')
    } catch (inviteError) {
      console.error(inviteError)
      const status = inviteError.response?.status
      const message = inviteError.response?.data?.message

      if (status === 409) {
        showError(message || 'This trainer has already been invited to this training.')
      } else {
        showError(message || 'Failed to send invitation. Please try again.')
      }
    } finally {
      setInviting(false)
    }
  }

  const formatSkills = (skills) => {
    if (!skills) return []
    return typeof skills === 'string' ? skills.split(',').map(s => s.trim()) : skills
  }

  const formatCertifications = (certifications) => {
    if (!certifications) return []
    return typeof certifications === 'string' ? certifications.split(',').map(c => c.trim()) : certifications
  }

  const formatTrainingDomains = (domains) => {
    if (!domains) return []
    return typeof domains === 'string' ? domains.split(',').map(d => d.trim()) : domains
  }

  const formatList = (value) => {
    if (!value) return []
    return Array.isArray(value) ? value.filter(Boolean) : value.split(',').map((item) => item.trim()).filter(Boolean)
  }

  const getResumeSource = () =>
    trainer?.resume ||
    trainer?.resumeUrl ||
    trainer?.resumePath ||
    trainer?.resumeFile ||
    trainer?.resumeFilePath ||
    trainer?.resumeDocument ||
    trainer?.cv ||
    trainer?.cvUrl ||
    trainer?.cvPath ||
    trainer?.documents?.resume ||
    trainer?.documents?.cv

  const getAssetUrl = (assetPath) => {
    if (!assetPath) return ''
    if (/^(https?:|blob:|data:)/i.test(assetPath)) return assetPath

    const apiBase = API.defaults.baseURL.replace(/\/$/, '')
    const apiOrigin = apiBase.replace(/\/api$/, '')
    const normalizedPath = assetPath.startsWith('/') ? assetPath : `/${assetPath}`

    return `${apiOrigin}${normalizedPath}`
  }

  const getResumeFilename = (source) => {
    if (!source) {
      return 'Trainer Resume'
    }

    const cleanName = source.split('/').pop()?.split('?')[0]
    return cleanName && cleanName.length < 80 ? cleanName : 'Trainer Resume'
  }

  useEffect(() => {
    setResumeLabel(getResumeFilename(getResumeSource()))
  }, [trainer])

  const resumeSource = getResumeSource()
  const resumeUrl = getAssetUrl(resumeSource)

  if (loading) {
    return (
      <Layout>
        <div className="profile-loading">
          <LoadingSpinner size="large" message="Loading trainer profile..." />
        </div>
      </Layout>
    )
  }

  if (error) {
    return (
      <Layout>
        <div className="profile-error">
          <div className="error-content">
            <h2>Unable to Load Profile</h2>
            <p>{error}</p>
            <button onClick={() => navigate(-1)} className="back-btn">
              <FaArrowLeft /> Go Back
            </button>
          </div>
        </div>
      </Layout>
    )
  }

  if (!trainer) {
    return (
      <Layout>
        <div className="profile-not-found">
          <div className="not-found-content">
            <h2>Trainer Not Found</h2>
            <p>The trainer profile you're looking for doesn't exist.</p>
            <button onClick={() => navigate(-1)} className="back-btn">
              <FaArrowLeft /> Go Back
            </button>
          </div>
        </div>
      </Layout>
    )
  }

  return (
    <Layout>
      {/* Header */}
      <div className="profile-header">
        <button onClick={() => navigate(-1)} className="back-button">
          <FaArrowLeft /> Back to Applications
        </button>
        <div className="profile-actions">
          <button
            onClick={() => {
              setSelectedTraining('')
              setShowInviteModal(true)
            }}
            className="invite-btn"
          >
            <FaPaperPlane /> Invite to Training
          </button>
        </div>
      </div>

      {/* Profile Hero */}
      <section className="profile-hero">
        <div className="profile-avatar">
          {trainer.profileImage ? (
            <img src={getAssetUrl(trainer.profileImage)} alt={trainer.name} />
          ) : (
            <div className="avatar-placeholder">
              <FaIdBadge />
            </div>
          )}
        </div>
        <div className="profile-info">
          <h1 className="profile-name">{trainer.name}</h1>
          <div className="profile-meta">
            <span className="profile-location">
              <FaMapMarkerAlt /> {trainer.location || 'Location not specified'}
            </span>
            <span className="profile-experience">
              <FaBriefcase /> {trainer.experience || '0'} years experience
            </span>
          </div>
          <p className="profile-bio">{trainer.bio || 'No bio available'}</p>
        </div>
        <div className="profile-rating">
          <div className="rating-stars">
            {[...Array(5)].map((_, i) => (
              <FaStar key={i} className={i < (trainer.rating || 0) ? 'filled' : ''} />
            ))}
          </div>
          <span className="rating-score">{trainer.rating || '0.0'}</span>
        </div>
      </section>

      {/* Profile Content */}
      <div className="profile-content">

        {/* Contact Information */}
        <section className="profile-section">
          <h2>Contact Information</h2>
          <div className="contact-grid">
            <div className="contact-item">
              <FaEnvelope />
              <span>{trainer.email}</span>
            </div>
            {trainer.mobile && (
              <div className="contact-item">
                <FaPhone />
                <span>{trainer.mobile}</span>
              </div>
            )}
          </div>
        </section>

        {/* Skills */}
        <section className="profile-section">
          <h2>Technical Skills</h2>
          <div className="skills-grid">
            {formatSkills(trainer.skills).map((skill, index) => (
              <span key={index} className="skill-tag">{skill}</span>
            ))}
          </div>
        </section>

        {/* Certifications */}
        {formatCertifications(trainer.certifications).length > 0 && (
          <section className="profile-section">
            <h2>Certifications</h2>
            <div className="certifications-list">
              {formatCertifications(trainer.certifications).map((cert, index) => (
                <div key={index} className="certification-item">
                  <FaFileAlt />
                  <span>{cert}</span>
                </div>
              ))}
            </div>
          </section>
        )}

        {/* Resume */}
        {resumeSource && (
          <section className="profile-section">
            <h2>Resume</h2>
            <div className="resume-card">
              <div className="resume-summary">
                <FaFileAlt />
                <div>
                  <strong>{resumeLabel}</strong>
                  <p>Open or download the trainer resume file.</p>
                </div>
              </div>
              {resumeUrl ? (
                <a
                  href={resumeUrl}
                  target="_blank"
                  rel="noreferrer"
                  className="resume-link"
                >
                  <FaDownload /> View Resume
                </a>
              ) : (
                <button type="button" className="resume-link disabled" disabled>
                  <FaDownload /> Resume Unavailable
                </button>
              )}
            </div>
          </section>
        )}

        {/* Training Domains */}
        <section className="profile-section">
          <h2>Training Domains</h2>
          <div className="domains-grid">
            {formatTrainingDomains(trainer.trainingDomains).map((domain, index) => (
              <span key={index} className="domain-tag">{domain}</span>
            ))}
          </div>
        </section>

        {/* Training Modes */}
        {trainer.trainingModes && (
          <section className="profile-section">
            <h2>Preferred Training Modes</h2>
            <div className="modes-list">
              {formatList(trainer.trainingModes).map((mode, index) => (
                <span key={index} className="mode-tag">{mode.trim()}</span>
              ))}
            </div>
          </section>
        )}

        {/* Languages */}
        {trainer.languages && (
          <section className="profile-section">
            <h2>Languages</h2>
            <div className="languages-list">
              {formatList(trainer.languages).map((lang, index) => (
                <span key={index} className="language-tag">{lang.trim()}</span>
              ))}
            </div>
          </section>
        )}

        {/* Education */}
        {trainer.education && (
          <section className="profile-section">
            <h2>Education</h2>
            <p className="education-text">{trainer.education}</p>
          </section>
        )}

      </div>

      {/* Invite Modal */}
      {showInviteModal && (
        <div className="modal-overlay">
          <div className="invite-modal">
            <h3>Invite {trainer.name} to Training</h3>
            <p>Select a training program to invite this trainer to:</p>

            <select
              value={selectedTraining}
              onChange={(e) => setSelectedTraining(e.target.value)}
              className="training-select"
            >
              <option value="">Select a training...</option>
              {trainings.map(training => (
                <option key={training.id} value={training.id} disabled={isAlreadyInvited(training.id)}>
                  {training.title} - {training.location}
                </option>
              ))}
            </select>

            {selectedTraining && isAlreadyInvited(selectedTraining) ? (
              <p className="error-message">This trainer has already been invited to the selected training.</p>
            ) : null}

            <div className="modal-actions">
              <button
                onClick={() => setShowInviteModal(false)}
                className="cancel-btn"
                disabled={inviting}
              >
                Cancel
              </button>
              <button
                onClick={handleInvite}
                className="invite-confirm-btn"
                disabled={inviting || !selectedTraining}
              >
                {inviting ? 'Sending...' : 'Send Invitation'}
              </button>
            </div>
          </div>
        </div>
      )}
    </Layout>
  )
}

export default TrainerProfileView
