import { useEffect, useState } from 'react'
import { fetchDashboardData } from '../shared/api'

function TutorPage({ onNavigate, sessionUser }) {
  const [data, setData] = useState(null)
  const [status, setStatus] = useState('loading')

  useEffect(() => {
    let active = true

    async function loadTutorData() {
      try {
        const result = await fetchDashboardData('tutor')
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

    loadTutorData()

    return () => {
      active = false
    }
  }, [])

  const stats = data?.summary
    ? [
        { label: 'Profile score', value: data.summary.profileScore },
        { label: 'Student callbacks', value: data.summary.callbacks },
        { label: 'Lead credits left', value: data.summary.leadCredits },
        { label: 'Admin privilege code', value: data.summary.privilegeCode },
      ]
    : []

  return (
    <section className="page-frame">
      <div className="page-hero page-hero-tutor">
        <div>
          <p className="eyebrow">Tutor dashboard</p>
          <h1>Track your profile, unlock student leads, and grow your classes.</h1>
          <p className="hero-text">
            This screen is built for tutors who need visibility into profile strength, lead credits,
            applications, and admin-managed privileges.
          </p>
          {sessionUser && <p className="status-text">Welcome, {sessionUser.fullName}.</p>}
          {status === 'error' && <p className="status-text error-text">Tutor dashboard data is unavailable.</p>}
        </div>

        <button type="button" className="ghost-button" onClick={() => onNavigate('dashboard')}>
          Back to dashboard
        </button>
      </div>

      <section className="stats-grid four-up">
        {stats.map((stat) => (
          <article className="metric-card" key={stat.label}>
            <strong>{stat.value}</strong>
            <span>{stat.label}</span>
          </article>
        ))}
      </section>

      <div className="content-grid">
        <section className="surface-section">
          <div className="section-heading">
            <div>
              <p className="eyebrow">Available leads</p>
              <h2>Student requests matching your subjects</h2>
            </div>
          </div>

          <div className="lead-list">
            {data?.studentRequests?.map((request) => (
              <article className="lead-card" key={request.id}>
                <div className="lead-head">
                  <span className="status-pill active-pill">Lead match</span>
                  <strong>{request.budget}</strong>
                </div>
                <h3>{request.title}</h3>
                <p>{request.mode}</p>
                <div className="card-actions">
                  <button type="button" className="solid-button small-button">
                    Unlock lead
                  </button>
                  <button type="button" className="ghost-button small-button">
                    Save
                  </button>
                </div>
              </article>
            ))}
          </div>
        </section>

        <section className="surface-section surface-section-accent">
          <div className="section-heading">
            <div>
              <p className="eyebrow">Profile completion</p>
              <h2>What improves ranking</h2>
            </div>
          </div>

          <div className="table-like">
            <div className="table-row">
              <span className="table-code">{data?.summary?.profileScore ?? '92%'}</span>
              <div>
                <strong>Profile quality score</strong>
                <p>Add demo video, student reviews, and subject certificates.</p>
              </div>
            </div>
            <div className="table-row">
              <span className="table-code">{data?.summary?.privilegeCode ?? '11'}</span>
              <div>
                <strong>Privilege code</strong>
                <p>Verified and paid tutors get better placement and faster student contact.</p>
              </div>
            </div>
            <div className="table-row">
              <span className="table-code">{data?.summary?.leadCredits ?? '26'}</span>
              <div>
                <strong>Credits remaining</strong>
                <p>Use lead credits carefully on the highest intent student requests.</p>
              </div>
            </div>
          </div>
        </section>
      </div>
    </section>
  )
}

export default TutorPage
