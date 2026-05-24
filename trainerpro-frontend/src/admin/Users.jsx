import { useEffect, useState } from 'react'
import Layout from '../components/Layout'
import API from '../services/api'

const roleOptions = ['ALL', 'TRAINER', 'VENDOR', 'ADMIN']
const statusOptions = ['ALL', 'PENDING', 'ACTIVE', 'INACTIVE', 'REJECTED']

const formatDate = (value) => {
  if (!value) return 'Recently'
  const date = new Date(value)
  if (Number.isNaN(date.getTime())) return 'Recently'
  return date.toLocaleDateString()
}

const getUserStatus = (user) => {
  if (user?.rejected) return 'Rejected'
  if (!user?.approved) return 'Pending Approval'
  return user?.active ? 'Active' : 'Inactive'
}

const formatRole = (role) => {
  if (!role) return 'Unknown'
  return String(role).toUpperCase()
}

const AdminUsers = () => {
  const [users, setUsers] = useState([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState('')
  const [savingId, setSavingId] = useState(null)
  const [actionMessage, setActionMessage] = useState('')
  const [filters, setFilters] = useState({
    role: 'ALL',
    status: 'ALL',
    search: '',
  })

  const fetchUsers = async (nextFilters = filters) => {
    setLoading(true)
    setError('')
    setActionMessage('')

    try {
      const response = await API.get('/admin/users', {
        params: {
          role: nextFilters.role,
          status: nextFilters.status,
          search: nextFilters.search.trim(),
        },
      })
      setUsers(Array.isArray(response.data) ? response.data : [])
    } catch (fetchError) {
      setError('Unable to load platform users right now.')
    } finally {
      setLoading(false)
    }
  }

  useEffect(() => {
    fetchUsers()
  }, [])

  const handleFilterChange = (key, value) => {
    const nextFilters = { ...filters, [key]: value }
    setFilters(nextFilters)
  }

  const applyFilters = () => {
    fetchUsers(filters)
  }

  const updateUser = async (userId, payload) => {
    setSavingId(userId)
    setError('')
    setActionMessage('')

    try {
      await API.patch(`/admin/users/${userId}`, payload)
      await fetchUsers(filters)
      setActionMessage('User status updated successfully.')
      return true
    } catch (updateError) {
      setError(updateError?.response?.data?.message || 'Unable to update this user right now.')
      return false
    } finally {
      setSavingId(null)
    }
  }

  const handleReject = async (user) => {
    const response = window.prompt(
      `Enter a rejection reason for ${user.name || user.email}:`,
      user.rejectionReason || ''
    )

    if (response === null) {
      return
    }

    const trimmedReason = response.trim()
    if (!trimmedReason) {
      setError('Please enter a rejection reason before rejecting this registration.')
      return
    }

    await updateUser(user.id, {
      rejected: true,
      rejectionReason: trimmedReason,
    })
  }

  return (
    <Layout>
      <section className="dashboard-hero">
        <div>
          <p className="dashboard-eyebrow">Admin workflow</p>
          <h2 className="dashboard-page-title">Manage registered users, roles, and account status.</h2>
          <p className="dashboard-copy">
            Review pending registrations, approve trainer and vendor profiles, and manage role or account status from one control plane.
          </p>
        </div>
      </section>

      <section className="table-shell-card">
        <div className="admin-toolbar">
          <div className="admin-toolbar-group">
            <label className="admin-toolbar-field">
              <span>Role</span>
              <select
                value={filters.role}
                onChange={(event) => handleFilterChange('role', event.target.value)}
              >
                {roleOptions.map((option) => (
                  <option key={option} value={option}>
                    {option}
                  </option>
                ))}
              </select>
            </label>

            <label className="admin-toolbar-field">
              <span>Status</span>
              <select
                value={filters.status}
                onChange={(event) => handleFilterChange('status', event.target.value)}
              >
                {statusOptions.map((option) => (
                  <option key={option} value={option}>
                    {option}
                  </option>
                ))}
              </select>
            </label>
          </div>

          <div className="admin-toolbar-group grow">
            <label className="admin-toolbar-field grow">
              <span>Search</span>
              <input
                type="text"
                value={filters.search}
                onChange={(event) => handleFilterChange('search', event.target.value)}
                placeholder="Search by name or email"
              />
            </label>

            <button type="button" className="feature-primary-action" onClick={applyFilters}>
              Apply filters
            </button>
          </div>
        </div>

        {loading ? <div className="state-banner info">Loading users...</div> : null}
        {error ? <div className="state-banner error">{error}</div> : null}
        {actionMessage ? <div className="state-banner success">{actionMessage}</div> : null}

        {!loading && !error ? (
          <div className="applications-table-wrap">
            <table className="applications-table">
              <thead>
                <tr>
                  <th>User</th>
                  <th>Role</th>
                  <th>Status</th>
                  <th>Created</th>
                  <th>Actions</th>
                </tr>
              </thead>

              <tbody>
                {users.length > 0 ? (
                  users.map((user) => (
                    <tr key={user.id || user.email}>
                      <td>
                        <div className="trainer-info">
                          <strong>{user.name || 'User'}</strong>
                          <span>{user.email}</span>
                        </div>
                      </td>
                      <td>
                        <span className="feature-status-pill">{formatRole(user.role)}</span>
                      </td>
                      <td>
                        <span className={`feature-status-pill ${user.rejected ? 'danger' : user.approved ? (user.active ? '' : 'danger') : 'muted'}`}>
                          {getUserStatus(user)}
                        </span>
                        {user.rejected && user.rejectionReason ? (
                          <div className="admin-status-note">{user.rejectionReason}</div>
                        ) : null}
                      </td>
                      <td>{formatDate(user.createdAt)}</td>
                      <td>
                        <div className="table-action-row">
                          {user.rejected ? (
                            <button
                              type="button"
                              className="table-action approve"
                              disabled={savingId === user.id}
                              onClick={() => updateUser(user.id, { approved: true })}
                            >
                              {savingId === user.id ? 'Saving...' : 'Approve'}
                            </button>
                          ) : null}
                          {!user.approved && !user.rejected ? (
                            <button
                              type="button"
                              className="table-action approve"
                              disabled={savingId === user.id}
                              onClick={() => updateUser(user.id, { approved: true })}
                            >
                              {savingId === user.id ? 'Saving...' : 'Approve'}
                            </button>
                          ) : null}
                          {!user.approved && !user.rejected ? (
                            <button
                              type="button"
                              className="table-action reject"
                              disabled={savingId === user.id}
                              onClick={() => handleReject(user)}
                            >
                              Reject
                            </button>
                          ) : null}
                          {user.approved ? (
                            <button
                              type="button"
                              className={`table-action ${user.active ? 'reject' : 'approve'}`}
                              disabled={savingId === user.id}
                              onClick={() => updateUser(user.id, { active: !user.active })}
                            >
                              {savingId === user.id ? 'Saving...' : user.active ? 'Deactivate' : 'Activate'}
                            </button>
                          ) : null}
                        </div>
                      </td>
                    </tr>
                  ))
                ) : (
                  <tr>
                    <td colSpan="5">
                      <div className="empty-state-inline">No users match the current filters.</div>
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

export default AdminUsers
