import { useEffect, useState } from 'react'
import { Link } from 'react-router-dom'
import { FaTrash } from 'react-icons/fa'
import Layout from '../components/Layout'
import API from '../services/api'

const MyTrainings = () => {
  const [trainings, setTrainings] = useState([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState('')
  const [success, setSuccess] = useState('')

  const fetchTrainings = async () => {
    setLoading(true)
    setError('')

    try {
      const response = await API.get('/trainings/my')
      setTrainings(response.data)
    } catch (fetchError) {
      console.error(fetchError)
      setError('Unable to load your training requirements.')
    } finally {
      setLoading(false)
    }
  }

  useEffect(() => {
    fetchTrainings()
  }, [])

  const handleDelete = async (id) => {
    if (!window.confirm('Are you sure you want to delete this training?')) return

    setSuccess('')
    setError('')

    try {
      await API.delete(`/trainings/${id}`)
      setTrainings((current) => current.filter((training) => training.id !== id))
      setSuccess('Training requirement deleted successfully.')
    } catch (deleteError) {
      setError('Error deleting training requirement.')
    }
  }

  return (
    <Layout>
      <section className="dashboard-hero">
        <div>
          <p className="dashboard-eyebrow">Vendor workflow</p>
          <h2 className="dashboard-page-title">Review and manage your posted trainings.</h2>
          <p className="dashboard-copy">
            Keep track of active requirements, monitor status, and remove outdated postings.
          </p>
        </div>
      </section>

      {loading ? <div className="state-banner info">Loading your training postings...</div> : null}
      {success ? <div className="state-banner success">{success}</div> : null}
      {error ? <div className="state-banner error">{error}</div> : null}

      {!loading ? (
        <section className="feature-grid">
          {trainings.length > 0 ? (
            trainings.map((training) => (
              <article key={training.id} className="feature-card">
                <div className="feature-card-header">
                  <div>
                    <p className="feature-card-label">Posted requirement</p>
                    <h3>{training.title}</h3>
                  </div>
                  <span className="feature-status-pill">{training.status || 'Open'}</span>
                </div>

                <p className="feature-card-copy">{training.description}</p>

                <div className="feature-meta">
                  <div className="feature-meta-item">
                    <span>Location</span>
                    <strong>{training.location}</strong>
                  </div>
                  <div className="feature-meta-item">
                    <span>Budget</span>
                    <strong>INR {training.budget}</strong>
                  </div>
                  <div className="feature-meta-item">
                    <span>Duration</span>
                    <strong>{training.duration}</strong>
                  </div>
                </div>

                <div className="feature-tag-row">
                  {training.skills?.map((skill, index) => (
                    <span key={index} className="feature-tag">
                      {skill}
                    </span>
                  ))}
                </div>

                <div className="feature-action-row">
                  <Link to={`/vendor/applications/${training.id}`} className="feature-primary-action linkish">
                    View applications
                  </Link>
                  <button
                    onClick={() => handleDelete(training.id)}
                    className="feature-secondary-danger"
                  >
                    <FaTrash /> Delete posting
                  </button>
                </div>
              </article>
            ))
          ) : (
            <div className="empty-state-card">
              <h3>No posted trainings yet</h3>
              <p>Create your first vendor requirement to start receiving trainer applications.</p>
            </div>
          )}
        </section>
      ) : null}
    </Layout>
  )
}

export default MyTrainings
