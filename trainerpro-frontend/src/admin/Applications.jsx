import { useEffect, useMemo, useState } from 'react'
import Layout from '../components/Layout'
import API from '../services/api'

const formatList = (value) => {
  if (!Array.isArray(value) || value.length === 0) return 'No skills listed'
  return value.join(', ')
}

const AdminApplications = () => {
  const [applications, setApplications] = useState([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState('')
  const [search, setSearch] = useState('')

  useEffect(() => {
    let isMounted = true

    const fetchApplications = async () => {
      setLoading(true)
      setError('')

      try {
        const response = await API.get('/admin/applications')
        if (!isMounted) return
        setApplications(Array.isArray(response.data) ? response.data : [])
      } catch (fetchError) {
        if (!isMounted) return
        setError('Unable to load applications right now.')
      } finally {
        if (isMounted) {
          setLoading(false)
        }
      }
    }

    fetchApplications()

    return () => {
      isMounted = false
    }
  }, [])

  const filteredApplications = useMemo(() => {
    const query = search.trim().toLowerCase()
    if (!query) return applications

    return applications.filter((application) =>
      [
        application.trainerName,
        application.trainerEmail,
        application.trainingTitle,
        application.vendorName,
        application.status,
      ]
        .filter(Boolean)
        .join(' ')
        .toLowerCase()
        .includes(query)
    )
  }, [applications, search])

  return (
    <Layout>
      <section className="dashboard-hero">
        <div>
          <p className="dashboard-eyebrow">Admin oversight</p>
          <h2 className="dashboard-page-title">Track every trainer application across the platform.</h2>
          <p className="dashboard-copy">
            Review who applied, which vendor requirement they targeted, and how the pipeline is moving without switching vendor accounts.
          </p>
        </div>
      </section>

      <section className="table-shell-card">
        <div className="admin-toolbar">
          <div className="admin-toolbar-group grow">
            <label className="admin-toolbar-field grow">
              <span>Search applications</span>
              <input
                type="text"
                value={search}
                onChange={(event) => setSearch(event.target.value)}
                placeholder="Search trainer, vendor, training, or status"
              />
            </label>
          </div>
        </div>

        {loading ? <div className="state-banner info">Loading applications...</div> : null}
        {error ? <div className="state-banner error">{error}</div> : null}

        {!loading && !error ? (
          <div className="applications-table-wrap">
            <table className="applications-table">
              <thead>
                <tr>
                  <th>Trainer</th>
                  <th>Training</th>
                  <th>Vendor</th>
                  <th>Experience</th>
                  <th>Status</th>
                </tr>
              </thead>
              <tbody>
                {filteredApplications.length > 0 ? (
                  filteredApplications.map((application) => (
                    <tr key={application.id}>
                      <td>
                        <div className="trainer-info">
                          <strong>{application.trainerName || 'Trainer'}</strong>
                          <span>{application.trainerEmail}</span>
                          <span>{formatList(application.trainerSkills)}</span>
                        </div>
                      </td>
                      <td>
                        <div className="trainer-info">
                          <strong>{application.trainingTitle || 'Training'}</strong>
                          <span>{application.trainingLocation || 'Location not available'}</span>
                        </div>
                      </td>
                      <td>
                        <div className="trainer-info">
                          <strong>{application.vendorName || 'Vendor'}</strong>
                          <span>{application.vendorEmail || 'Email unavailable'}</span>
                        </div>
                      </td>
                      <td>{application.trainerExperience || 'Not provided'}</td>
                      <td>
                        <span className="feature-status-pill">{application.status || 'PENDING'}</span>
                      </td>
                    </tr>
                  ))
                ) : (
                  <tr>
                    <td colSpan="5">
                      <div className="empty-state-inline">No applications match your search right now.</div>
                    </td>
                  </tr>
                )}
              </tbody>
            </table>
          </div>
        ) : null}
      </section>
    </Layout>
  )
}

export default AdminApplications
