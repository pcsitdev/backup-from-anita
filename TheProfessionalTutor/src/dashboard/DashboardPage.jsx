import { useEffect, useState } from 'react'
import { fetchDashboardData } from '../shared/api'

const roleCards = [
  {
    key: 'student',
    eyebrow: 'Student dashboard',
    title: 'Track tutor responses and manage your learning requests',
    text: 'Search tutors, shortlist matches, and schedule trial classes from one place.',
  },
  {
    key: 'tutor',
    eyebrow: 'Tutor dashboard',
    title: 'Unlock leads and grow your teaching business',
    text: 'See profile performance, buy leads, and respond to students quickly.',
  },
  {
    key: 'admin',
    eyebrow: 'Admin dashboard',
    title: 'Control approvals, payments, and privilege codes',
    text: 'Monitor tutor onboarding, fee collection, and listing rules across the marketplace.',
  },
]

function DashboardPage({ onNavigate, sessionUser }) {
  const activeRole = sessionUser?.role ?? 'student'
  const [summary, setSummary] = useState(null)
  const [status, setStatus] = useState('loading')

  useEffect(() => {
    let active = true

    async function loadDashboard() {
      try {
        const data = await fetchDashboardData(activeRole)
        if (active) {
          setSummary(data.summary)
          setStatus('ready')
        }
      } catch {
        if (active) {
          setStatus('error')
        }
      }
    }

    loadDashboard()

    return () => {
      active = false
    }
  }, [activeRole])

  return (
    <section className="page-frame">
      <section className="page-hero dashboard-hero">
        <div>
          <p className="eyebrow">Dashboard hub</p>
          <h1>Choose the role experience you want to manage.</h1>
          <p className="hero-text">
            This page acts as the main dashboard entry, so users can move into student, tutor, or admin
            interfaces from one place.
          </p>
          {sessionUser && (
            <p className="status-text">
              Signed in as {sessionUser.fullName} with role `{sessionUser.role}`.
            </p>
          )}
          {status === 'error' && <p className="status-text error-text">Dashboard API is not reachable.</p>}
        </div>

        <button type="button" className="ghost-button" onClick={() => onNavigate('landing')}>
          Back to landing
        </button>
      </section>

      {summary && (
        <section className="stats-grid summary-grid">
          {Object.entries(summary).map(([key, value]) => (
            <article className="metric-card" key={key}>
              <strong>{value}</strong>
              <span>{formatLabel(key)}</span>
            </article>
          ))}
        </section>
      )}

      <div className="dashboard-role-grid">
        {roleCards.map((role) => (
          <article className="preview-card role-card" key={role.key}>
            <p className="panel-title">{role.eyebrow}</p>
            <h2>{role.title}</h2>
            <p className="tiny-note">{role.text}</p>
            <button type="button" className="solid-button role-button" onClick={() => onNavigate(role.key)}>
              Open {role.key} page
            </button>
          </article>
        ))}
      </div>
    </section>
  )
}

function formatLabel(value) {
  return value
    .replace(/([A-Z])/g, ' $1')
    .replace(/^./, (letter) => letter.toUpperCase())
}

export default DashboardPage
