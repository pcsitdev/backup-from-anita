import { useEffect, useMemo, useState } from 'react'
import Layout from '../components/Layout'
import API from '../services/api'

const formatDate = (value) => {
  if (!value) return 'Recently'
  const date = new Date(value)
  if (Number.isNaN(date.getTime())) return 'Recently'
  return date.toLocaleDateString()
}

const AdminInvitations = () => {
  const [invitations, setInvitations] = useState([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState('')
  const [search, setSearch] = useState('')

  useEffect(() => {
    let isMounted = true

    const fetchInvitations = async () => {
      setLoading(true)
      setError('')

      try {
        const response = await API.get('/admin/invitations')
        if (!isMounted) return
        setInvitations(Array.isArray(response.data) ? response.data : [])
      } catch (fetchError) {
        if (!isMounted) return
        setError('Unable to load invitations right now.')
      } finally {
        if (isMounted) {
          setLoading(false)
        }
      }
    }

    fetchInvitations()

    return () => {
      isMounted = false
    }
  }, [])

  const filteredInvitations = useMemo(() => {
    const query = search.trim().toLowerCase()
    if (!query) return invitations

    return invitations.filter((invitation) =>
      [
        invitation.trainerName,
        invitation.trainerEmail,
        invitation.vendorName,
        invitation.trainingTitle,
        invitation.status,
        invitation.message,
      ]
        .filter(Boolean)
        .join(' ')
        .toLowerCase()
        .includes(query)
    )
  }, [invitations, search])

  return (
    <Layout>
      <section className="dashboard-hero">
        <div>
          <p className="dashboard-eyebrow">Admin oversight</p>
          <h2 className="dashboard-page-title">Monitor trainer invitations and vendor outreach quality.</h2>
          <p className="dashboard-copy">
            See invitation volume, trainer responses, and vendor activity from a single operations view.
          </p>
        </div>
      </section>

      <section className="table-shell-card">
        <div className="admin-toolbar">
          <div className="admin-toolbar-group grow">
            <label className="admin-toolbar-field grow">
              <span>Search invitations</span>
              <input
                type="text"
                value={search}
                onChange={(event) => setSearch(event.target.value)}
                placeholder="Search trainer, vendor, training, or status"
              />
            </label>
          </div>
        </div>

        {loading ? <div className="state-banner info">Loading invitations...</div> : null}
        {error ? <div className="state-banner error">{error}</div> : null}

        {!loading && !error ? (
          <div className="applications-table-wrap">
            <table className="applications-table">
              <thead>
                <tr>
                  <th>Trainer</th>
                  <th>Training</th>
                  <th>Vendor</th>
                  <th>Message</th>
                  <th>Status</th>
                </tr>
              </thead>
              <tbody>
                {filteredInvitations.length > 0 ? (
                  filteredInvitations.map((invitation) => (
                    <tr key={invitation.id}>
                      <td>
                        <div className="trainer-info">
                          <strong>{invitation.trainerName || 'Trainer'}</strong>
                          <span>{invitation.trainerEmail}</span>
                          <span>Sent {formatDate(invitation.createdAt)}</span>
                        </div>
                      </td>
                      <td>
                        <div className="trainer-info">
                          <strong>{invitation.trainingTitle || 'Training'}</strong>
                          <span>{invitation.trainingLocation || 'Location not available'}</span>
                        </div>
                      </td>
                      <td>{invitation.vendorName || 'Vendor'}</td>
                      <td>{invitation.message || 'No message'}</td>
                      <td>
                        <span className="feature-status-pill">{invitation.status || 'PENDING'}</span>
                      </td>
                    </tr>
                  ))
                ) : (
                  <tr>
                    <td colSpan="5">
                      <div className="empty-state-inline">No invitations match your search right now.</div>
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

export default AdminInvitations
