import { useEffect, useState } from 'react'
import { useParams, Link } from 'react-router-dom'
import { FaEye, FaUser } from 'react-icons/fa'
import Layout from '../components/Layout'
import API from '../services/api'

const Applications = () => {
  const { trainingId } = useParams()
  const [applications, setApplications] = useState([])
  const [trainers, setTrainers] = useState([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState('')
  const [success, setSuccess] = useState('')

  const getTrainerId = (application) => {
    const directTrainerId =
      application.trainerId ??
      application.trainer?.id ??
      application.trainer?.trainerId ??
      application.userId

    if (directTrainerId) {
      return directTrainerId
    }

    const matchedTrainer = trainers.find((trainer) => {
      const emailMatches =
        application.email &&
        trainer.email &&
        trainer.email.toLowerCase() === application.email.toLowerCase()

      const nameMatches =
        application.trainerName &&
        trainer.name &&
        trainer.name.toLowerCase() === application.trainerName.toLowerCase()

      return emailMatches || nameMatches
    })

    return matchedTrainer?.id
  }

  const formatSkills = (skills) => {
    if (!skills) return []
    return Array.isArray(skills) ? skills : skills.split(',').map((skill) => skill.trim()).filter(Boolean)
  }

  const fetchApplications = async () => {
    setLoading(true)
    setError('')

    try {
      const response = await API.get(`/applications/training/${trainingId}`)
      setApplications(response.data)
    } catch (fetchError) {
      console.error(fetchError)
      setError('Unable to load trainer applications for this requirement.')
    } finally {
      setLoading(false)
    }
  }

  const fetchTrainers = async () => {
    try {
      const response = await API.get('/trainers')
      setTrainers(response.data)
    } catch (fetchError) {
      console.error(fetchError)
    }
  }

  useEffect(() => {
    fetchApplications()
    fetchTrainers()
  }, [trainingId])

  const handleAccept = async (id) => {
    setSuccess('')
    setError('')

    try {
      await API.put(`/applications/${id}/accept`)
      setSuccess('Application accepted successfully.')
      fetchApplications()
    } catch (actionError) {
      setError('Error accepting application.')
    }
  }

  const handleReject = async (id) => {
    setSuccess('')
    setError('')

    try {
      await API.put(`/applications/${id}/reject`)
      setSuccess('Application rejected successfully.')
      fetchApplications()
    } catch (actionError) {
      setError('Error rejecting application.')
    }
  }

  return (
    <Layout>
      <section className="dashboard-hero">
        <div>
          <p className="dashboard-eyebrow">Vendor workflow</p>
          <h2 className="dashboard-page-title">Review trainer applications for this requirement.</h2>
          <p className="dashboard-copy">
            Evaluate expertise, experience, and skill alignment before confirming trainer selections.
          </p>
        </div>
      </section>

      {loading ? <div className="state-banner info">Loading trainer applications...</div> : null}
      {success ? <div className="state-banner success">{success}</div> : null}
      {error ? <div className="state-banner error">{error}</div> : null}

      {!loading ? (
        <section className="table-shell-card">
          <div className="applications-table-wrap">
            <table className="applications-table">
              <thead>
                <tr>
                  <th>Trainer</th>
                  <th>Email</th>
                  <th>Experience</th>
                  <th>Skills</th>
                  <th>Status</th>
                  <th>Actions</th>
                </tr>
              </thead>

              <tbody>
                {applications.length > 0 ? (
                  applications.map((application) => {
                    const trainerId = getTrainerId(application)
                    const trainerName = application.trainerName || application.trainer?.name || 'Trainer'

                    return (
                      <tr key={application.id}>
                        <td>
                          <div className="trainer-info">
                            {trainerId ? (
                              <>
                                <Link
                                  to={`/vendor/trainer/${trainerId}`}
                                  className="trainer-name-link"
                                >
                                  <FaUser />
                                  {trainerName}
                                </Link>
                                <Link
                                  to={`/vendor/trainer/${trainerId}`}
                                  className="view-profile-link"
                                >
                                  <FaEye /> View Profile
                                </Link>
                              </>
                            ) : (
                              <>
                                <span className="trainer-name-link">
                                  <FaUser />
                                  {trainerName}
                                </span>
                                <span className="view-profile-link">Profile unavailable</span>
                              </>
                            )}
                          </div>
                        </td>
                        <td>{application.email}</td>
                        <td>{application.experience} yrs</td>
                        <td>
                          <div className="feature-tag-row compact">
                            {formatSkills(application.skills).map((skill, index) => (
                              <span key={index} className="feature-tag">
                                {skill}
                              </span>
                            ))}
                          </div>
                        </td>
                        <td>
                          <span className="feature-status-pill">{application.status}</span>
                        </td>
                        <td>
                          <div className="table-action-row">
                            <button
                              onClick={() => handleAccept(application.id)}
                              className="table-action approve"
                              disabled={application.status === 'ACCEPTED'}
                            >
                              Accept
                            </button>
                            <button
                              onClick={() => handleReject(application.id)}
                              className="table-action reject"
                              disabled={application.status === 'REJECTED'}
                            >
                              Reject
                            </button>
                          </div>
                        </td>
                      </tr>
                    )
                  })
                ) : (
                  <tr>
                    <td colSpan="6">
                      <div className="empty-state-inline">No applications found for this training.</div>
                    </td>
                  </tr>
                )}
              </tbody>
            </table>
          </div>
        </section>
      ) : null}
    </Layout>
  )
}

export default Applications
