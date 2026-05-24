import { useEffect, useMemo, useState } from 'react'
import Layout from '../components/Layout'
import API from '../services/api'

const formatCurrency = (value) => {
  const amount = Number(value)
  if (!Number.isFinite(amount)) return value || 'N/A'
  return new Intl.NumberFormat('en-IN', {
    style: 'currency',
    currency: 'INR',
    maximumFractionDigits: 0,
  }).format(amount)
}

const AdminTrainings = () => {
  const [trainings, setTrainings] = useState([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState('')
  const [search, setSearch] = useState('')

  useEffect(() => {
    let isMounted = true

    const fetchTrainings = async () => {
      setLoading(true)
      setError('')

      try {
        const response = await API.get('/admin/trainings')
        if (!isMounted) return
        setTrainings(Array.isArray(response.data) ? response.data : [])
      } catch (fetchError) {
        if (!isMounted) return
        setError('Unable to load trainings right now.')
      } finally {
        if (isMounted) {
          setLoading(false)
        }
      }
    }

    fetchTrainings()

    return () => {
      isMounted = false
    }
  }, [])

  const filteredTrainings = useMemo(() => {
    const query = search.trim().toLowerCase()
    if (!query) return trainings

    return trainings.filter((training) => {
      const haystack = [
        training.title,
        training.vendorName,
        training.vendorEmail,
        training.location,
        training.status,
      ]
        .filter(Boolean)
        .join(' ')
        .toLowerCase()

      return haystack.includes(query)
    })
  }, [search, trainings])

  return (
    <Layout>
      <section className="dashboard-hero">
        <div>
          <p className="dashboard-eyebrow">Admin oversight</p>
          <h2 className="dashboard-page-title">Review marketplace trainings across all vendors.</h2>
          <p className="dashboard-copy">
            This view gives admins one searchable list of all posted trainings, ownership, budget, and current status.
          </p>
        </div>
      </section>

      <section className="table-shell-card">
        <div className="admin-toolbar">
          <div className="admin-toolbar-group grow">
            <label className="admin-toolbar-field grow">
              <span>Search trainings</span>
              <input
                type="text"
                value={search}
                onChange={(event) => setSearch(event.target.value)}
                placeholder="Search title, vendor, location, or status"
              />
            </label>
          </div>
        </div>

        {loading ? <div className="state-banner info">Loading trainings...</div> : null}
        {error ? <div className="state-banner error">{error}</div> : null}

        {!loading && !error ? (
          <div className="applications-table-wrap">
            <table className="applications-table">
              <thead>
                <tr>
                  <th>Training</th>
                  <th>Vendor</th>
                  <th>Location</th>
                  <th>Budget</th>
                  <th>Status</th>
                </tr>
              </thead>
              <tbody>
                {filteredTrainings.length > 0 ? (
                  filteredTrainings.map((training) => (
                    <tr key={training.id}>
                      <td>
                        <div className="trainer-info">
                          <strong>{training.title}</strong>
                          <span>{training.duration || 'Duration not provided'}</span>
                        </div>
                      </td>
                      <td>
                        <div className="trainer-info">
                          <strong>{training.vendorName || 'Vendor'}</strong>
                          <span>{training.vendorEmail || 'Email unavailable'}</span>
                        </div>
                      </td>
                      <td>{training.location || 'Remote / Flexible'}</td>
                      <td>{formatCurrency(training.budget)}</td>
                      <td>
                        <span className="feature-status-pill">{training.status || 'OPEN'}</span>
                      </td>
                    </tr>
                  ))
                ) : (
                  <tr>
                    <td colSpan="5">
                      <div className="empty-state-inline">No trainings match your search right now.</div>
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

export default AdminTrainings
