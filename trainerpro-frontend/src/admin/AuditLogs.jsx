import { useEffect, useMemo, useState } from 'react'
import Layout from '../components/Layout'
import API from '../services/api'

const defaultFilters = {
  actorRole: 'ALL',
  actionType: 'ALL',
  entityType: 'ALL',
  dateFrom: '',
  dateTo: '',
}

const formatDateTime = (value) => {
  if (!value) return 'Recently'
  const date = new Date(value)
  if (Number.isNaN(date.getTime())) return 'Recently'
  return date.toLocaleString()
}

const formatText = (value) => {
  if (!value) return 'Unknown'
  return String(value)
    .toLowerCase()
    .split('_')
    .map((part) => part.charAt(0).toUpperCase() + part.slice(1))
    .join(' ')
}

const AdminAuditLogs = () => {
  const [logs, setLogs] = useState([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState('')
  const [search, setSearch] = useState('')
  const [filters, setFilters] = useState(defaultFilters)

  useEffect(() => {
    let isMounted = true

    const fetchLogs = async () => {
      setLoading(true)
      setError('')

      try {
        const response = await API.get('/admin/audit-logs')
        if (!isMounted) return
        setLogs(Array.isArray(response.data) ? response.data : [])
      } catch (fetchError) {
        if (!isMounted) return
        setError('Unable to load audit logs right now.')
      } finally {
        if (isMounted) {
          setLoading(false)
        }
      }
    }

    fetchLogs()

    return () => {
      isMounted = false
    }
  }, [])

  const actorRoleOptions = useMemo(() => {
    const roles = Array.from(
      new Set(logs.map((log) => log.actorRole).filter(Boolean))
    ).sort()
    return ['ALL', ...roles]
  }, [logs])

  const actionTypeOptions = useMemo(() => {
    const actions = Array.from(
      new Set(logs.map((log) => log.actionType).filter(Boolean))
    ).sort()
    return ['ALL', ...actions]
  }, [logs])

  const entityTypeOptions = useMemo(() => {
    const entities = Array.from(
      new Set(logs.map((log) => log.entityType).filter(Boolean))
    ).sort()
    return ['ALL', ...entities]
  }, [logs])

  const filteredLogs = useMemo(() => {
    const query = search.trim().toLowerCase()
    return logs.filter((log) => {
      const roleMatches =
        filters.actorRole === 'ALL' || log.actorRole === filters.actorRole

      const actionMatches =
        filters.actionType === 'ALL' || log.actionType === filters.actionType

      const entityMatches =
        filters.entityType === 'ALL' || log.entityType === filters.entityType

      const createdAt = log.createdAt ? new Date(log.createdAt) : null
      const isValidDate = createdAt && !Number.isNaN(createdAt.getTime())

      const fromMatches =
        !filters.dateFrom ||
        (isValidDate && createdAt >= new Date(`${filters.dateFrom}T00:00:00`))

      const toMatches =
        !filters.dateTo ||
        (isValidDate && createdAt <= new Date(`${filters.dateTo}T23:59:59`))

      const textMatches =
        !query ||
        [
          log.adminEmail,
          log.actorRole,
          log.actionType,
          log.entityType,
          log.entityLabel,
          log.description,
          log.metadata,
        ]
          .filter(Boolean)
          .join(' ')
          .toLowerCase()
          .includes(query)

      return roleMatches && actionMatches && entityMatches && fromMatches && toMatches && textMatches
    })
  }, [filters, logs, search])

  const stats = useMemo(
    () => [
      { label: 'Visible logs', value: String(filteredLogs.length), accent: 'blue' },
      { label: 'Total logs', value: String(logs.length), accent: 'teal' },
      {
        label: 'Actors',
        value: String(
          new Set(filteredLogs.map((log) => `${log.actorRole}-${log.adminEmail}`)).size
        ),
        accent: 'gold',
      },
      {
        label: 'Actions',
        value: String(new Set(filteredLogs.map((log) => log.actionType)).size),
        accent: 'rose',
      },
    ],
    [filteredLogs, logs.length]
  )

  const handleFilterChange = (key, value) => {
    setFilters((current) => ({ ...current, [key]: value }))
  }

  const clearFilters = () => {
    setSearch('')
    setFilters(defaultFilters)
  }

  return (
    <Layout>
      <section className="dashboard-hero">
        <div>
          <p className="dashboard-eyebrow">Platform governance</p>
          <h2 className="dashboard-page-title">Track admin, vendor, and trainer actions in one activity trail.</h2>
          <p className="dashboard-copy">
            Review user approvals plus marketplace events like training creation, applications, and invitation updates across the platform.
          </p>
        </div>
      </section>

      <section className="table-shell-card">
        <div className="audit-filter-shell">
          <div className="audit-filter-header">
            <div>
              <p className="audit-filter-eyebrow">Filter Console</p>
              <h3>Refine the activity stream with enterprise-grade controls.</h3>
            </div>
            <button type="button" className="audit-filter-clear" onClick={clearFilters}>
              Reset Filters
            </button>
          </div>

          <div className="audit-filter-grid">
            <section className="audit-filter-panel">
              <div className="audit-filter-panel-head">
                <strong>Activity Scope</strong>
                <span>Choose who acted and what changed.</span>
              </div>

              <div className="audit-filter-fields audit-filter-fields--triple">
                <label className="audit-filter-field">
                  <span>Actor role</span>
                  <select
                    value={filters.actorRole}
                    onChange={(event) => handleFilterChange('actorRole', event.target.value)}
                  >
                    {actorRoleOptions.map((option) => (
                      <option key={option} value={option}>
                        {option === 'ALL' ? 'All roles' : formatText(option)}
                      </option>
                    ))}
                  </select>
                </label>

                <label className="audit-filter-field">
                  <span>Action type</span>
                  <select
                    value={filters.actionType}
                    onChange={(event) => handleFilterChange('actionType', event.target.value)}
                  >
                    {actionTypeOptions.map((option) => (
                      <option key={option} value={option}>
                        {option === 'ALL' ? 'All actions' : formatText(option)}
                      </option>
                    ))}
                  </select>
                </label>

                <label className="audit-filter-field">
                  <span>Entity type</span>
                  <select
                    value={filters.entityType}
                    onChange={(event) => handleFilterChange('entityType', event.target.value)}
                  >
                    {entityTypeOptions.map((option) => (
                      <option key={option} value={option}>
                        {option === 'ALL' ? 'All entities' : formatText(option)}
                      </option>
                    ))}
                  </select>
                </label>
              </div>
            </section>

            <section className="audit-filter-panel audit-filter-panel--accent">
              <div className="audit-filter-panel-head">
                <strong>Search Window</strong>
                <span>Target specific actors, records, notes, and time ranges.</span>
              </div>

              <div className="audit-filter-fields audit-filter-fields--search">
                <label className="audit-filter-field audit-filter-field--search">
                  <span>Search audit logs</span>
                  <input
                    type="text"
                    value={search}
                    onChange={(event) => setSearch(event.target.value)}
                    placeholder="Search actor, action, entity, description, or metadata"
                  />
                </label>

                <label className="audit-filter-field">
                  <span>From</span>
                  <input
                    type="date"
                    value={filters.dateFrom}
                    onChange={(event) => handleFilterChange('dateFrom', event.target.value)}
                  />
                </label>

                <label className="audit-filter-field">
                  <span>To</span>
                  <input
                    type="date"
                    value={filters.dateTo}
                    onChange={(event) => handleFilterChange('dateTo', event.target.value)}
                  />
                </label>
              </div>
            </section>
          </div>
        </div>

        {!loading && !error ? (
          <div className="audit-summary-row">
            {stats.map((item) => (
              <article key={item.label} className={`audit-summary-card ${item.accent}`}>
                <span>{item.label}</span>
                <strong>{item.value}</strong>
              </article>
            ))}
          </div>
        ) : null}

        {loading ? <div className="state-banner info">Loading audit logs...</div> : null}
        {error ? <div className="state-banner error">{error}</div> : null}

        {!loading && !error ? (
          <div className="applications-table-wrap">
            <table className="applications-table">
              <thead>
                <tr>
                  <th>When</th>
                  <th>Actor</th>
                  <th>Action</th>
                  <th>Entity</th>
                  <th>Summary</th>
                </tr>
              </thead>

              <tbody>
                {filteredLogs.length > 0 ? (
                  filteredLogs.map((log) => (
                    <tr key={log.id}>
                      <td>{formatDateTime(log.createdAt)}</td>
                      <td>
                        <div className="trainer-info">
                          <strong>{log.adminEmail || 'System'}</strong>
                          <span>{formatText(log.actorRole)} | ID {log.adminId}</span>
                        </div>
                      </td>
                      <td>
                        <span className="feature-status-pill">{formatText(log.actionType)}</span>
                      </td>
                      <td>
                        <div className="trainer-info">
                          <strong>{formatText(log.entityType)}</strong>
                          <span>{log.entityLabel || `Record #${log.entityId}`}</span>
                        </div>
                      </td>
                      <td>
                        <div className="trainer-info">
                          <strong>{log.description || 'Admin action recorded'}</strong>
                          <span>{log.metadata || 'No extra metadata'}</span>
                        </div>
                      </td>
                    </tr>
                  ))
                ) : (
                  <tr>
                    <td colSpan="5">
                      <div className="empty-state-inline">No audit logs match your search right now.</div>
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

export default AdminAuditLogs
