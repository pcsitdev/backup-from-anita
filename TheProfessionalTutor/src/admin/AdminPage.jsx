import { useEffect, useState } from 'react'
import { fetchDashboardData } from '../shared/api'
import { adminQueue } from '../shared/mockData'

function AdminPage({ onNavigate, sessionUser }) {
  const [data, setData] = useState(null)
  const [status, setStatus] = useState('loading')

  useEffect(() => {
    let active = true

    async function loadAdminData() {
      try {
        const result = await fetchDashboardData('admin')
        if (active) {
          setData(result)
          setStatus('ready')
        }
      } catch {
        if (active) {
          setStatus('error')
        }
      }
    }

    loadAdminData()

    return () => {
      active = false
    }
  }, [])

  const stats = data?.summary
    ? [
        { label: 'Pending tutor approvals', value: data.summary.pendingTutorApprovals },
        { label: 'New student requirements', value: data.summary.newStudentRequirements },
        { label: 'Collected admin fees', value: data.summary.collectedAdminFees },
        { label: 'Disputes resolved this week', value: data.summary.disputesResolved },
      ]
    : []

  return (
    <section className="page-frame">
      <div className="page-hero page-hero-admin">
        <div>
          <p className="eyebrow">Admin dashboard</p>
          <h1>Approve tutors, manage payments, and control privilege codes.</h1>
          <p className="hero-text">
            This interface gives the admin a command center for tutor verification, lead flow, fee collection,
            and role-based access across the marketplace.
          </p>
          {sessionUser && <p className="status-text">Welcome, {sessionUser.fullName}.</p>}
          {status === 'error' && <p className="status-text error-text">Admin dashboard data is unavailable.</p>}
        </div>

        <button type="button" className="ghost-button" onClick={() => onNavigate('dashboard')}>
          Back to dashboard
        </button>
      </div>

      <div className="dashboard-grid">
        <section className="stats-grid four-up">
          {stats.map((metric) => (
            <article className="metric-card" key={metric.label}>
              <strong>{metric.value}</strong>
              <span>{metric.label}</span>
            </article>
          ))}
        </section>

        <section className="surface-section">
          <div className="section-heading">
            <div>
              <p className="eyebrow">Privilege map</p>
              <h2>Code-based access control</h2>
            </div>
          </div>

          <div className="table-like">
            {data?.privilegeCodes?.map((item) => (
              <div className="table-row" key={item.code}>
                <span className="table-code">{item.code}</span>
                <div>
                  <strong>{item.title}</strong>
                  <p>{item.detail}</p>
                </div>
              </div>
            ))}
          </div>
        </section>
      </div>

      <div className="content-grid">
        <section className="surface-section">
          <div className="section-heading">
            <div>
              <p className="eyebrow">Approval queue</p>
              <h2>Tutors waiting for action</h2>
            </div>
          </div>

          <div className="lead-list">
            {adminQueue.map((item) => (
              <article className="lead-card" key={item.name}>
                <div className="lead-head">
                  <span className="status-pill neutral-pill">Code {item.code}</span>
                  <strong>{item.subject}</strong>
                </div>
                <h3>{item.name}</h3>
                <p>{item.action}</p>
                <div className="card-actions">
                  <button type="button" className="solid-button small-button">
                    Approve
                  </button>
                  <button type="button" className="ghost-button small-button">
                    Review
                  </button>
                </div>
              </article>
            ))}
          </div>
        </section>

        <section className="surface-section surface-section-accent">
          <div className="section-heading">
            <div>
              <p className="eyebrow">Revenue controls</p>
              <h2>Admin business panel</h2>
            </div>
          </div>

          <div className="request-list">
            <article className="request-card">
              <p className="request-user">Lead fees</p>
              <h3>Dynamic lead pricing by demand</h3>
              <p className="tiny-note">Set different prices for online, home tuition, and exam-prep categories.</p>
            </article>
            <article className="request-card">
              <p className="request-user">Featured placement</p>
              <h3>Boost verified tutors to the top of search</h3>
              <p className="tiny-note">Use privilege codes and manual overrides to control ranking.</p>
            </article>
            <article className="request-card">
              <p className="request-user">Dispute handling</p>
              <h3>Track refunds, no-shows, and tutoring quality complaints</h3>
              <p className="tiny-note">Keep the marketplace trusted for both parents and tutors.</p>
            </article>
          </div>
        </section>
      </div>
    </section>
  )
}

export default AdminPage
