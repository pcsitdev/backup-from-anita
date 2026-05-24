import { useEffect, useState } from 'react'
import { fetchDashboardData } from '../shared/api'

function StudentPage({ onNavigate, sessionUser }) {
  const [data, setData] = useState(null)
  const [status, setStatus] = useState('loading')

  useEffect(() => {
    let active = true

    async function loadStudentData() {
      try {
        const result = await fetchDashboardData('student')
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

    loadStudentData()

    return () => {
      active = false
    }
  }, [])

  const stats = data?.summary
    ? [
        { title: 'Active requirements', value: String(data.summary.activeRequirements).padStart(2, '0') },
        { title: 'Tutor responses', value: String(data.summary.tutorResponses).padStart(2, '0') },
        { title: 'Demo classes scheduled', value: String(data.summary.demoClasses).padStart(2, '0') },
      ]
    : []

  return (
    <section className="page-frame">
      <div className="page-hero page-hero-student">
        <div>
          <p className="eyebrow">Student dashboard</p>
          <h1>Find tutors, post needs, and manage your learning plan.</h1>
          <p className="hero-text">
            This UI is focused on students and parents who want quick tutor discovery, request posting, and
            a clean view of responses.
          </p>
          {sessionUser && <p className="status-text">Welcome, {sessionUser.fullName}.</p>}
          {status === 'error' && <p className="status-text error-text">Student dashboard data is unavailable.</p>}
        </div>

        <button type="button" className="ghost-button" onClick={() => onNavigate('dashboard')}>
          Back to dashboard
        </button>
      </div>

      <div className="dashboard-grid">
        <section className="surface-section">
          <div className="section-heading">
            <div>
              <p className="eyebrow">Quick search</p>
              <h2>Search for the right tutor</h2>
            </div>
          </div>

          <form className="search-panel">
            <div className="search-field">
              <label htmlFor="student-subject">Subject</label>
              <input id="student-subject" type="text" placeholder="Maths, English, IELTS, coding" />
            </div>
            <div className="search-field">
              <label htmlFor="student-location">Location</label>
              <input id="student-location" type="text" placeholder="City or online" />
            </div>
            <button type="button" className="search-button">
              Find tutors
            </button>
          </form>
        </section>

        <section className="stats-grid">
          {stats.map((card) => (
            <article className="metric-card" key={card.title}>
              <strong>{card.value}</strong>
              <span>{card.title}</span>
            </article>
          ))}
        </section>
      </div>

      <div className="content-grid">
        <section className="surface-section">
          <div className="section-heading">
            <div>
              <p className="eyebrow">Matched tutors</p>
              <h2>Recommended profiles</h2>
            </div>
          </div>

          <div className="tutor-grid">
            {data?.tutors?.map((tutor) => (
              <article className="tutor-card" key={tutor.id}>
                <div className="avatar-badge" aria-hidden="true">
                  {tutor.name
                    .split(' ')
                    .map((part) => part[0])
                    .join('')}
                </div>
                <span className="status-pill neutral-pill">{tutor.privilegeCode}</span>
                <h3>{tutor.name}</h3>
                <p className="tutor-subject">{tutor.subject}</p>
                <ul className="meta-list">
                  <li>{tutor.experience}</li>
                  <li>{tutor.mode}</li>
                  <li>Starting from {tutor.rate}</li>
                </ul>
              </article>
            ))}
          </div>
        </section>

        <section className="surface-section surface-section-accent">
          <div className="section-heading">
            <div>
              <p className="eyebrow">My requests</p>
              <h2>Open learning requirements</h2>
            </div>
          </div>

          <div className="request-list">
            {data?.studentRequests?.map((request) => (
              <article className="request-card" key={request.id}>
                <p className="request-user">{request.learner}</p>
                <h3>{request.title}</h3>
                <div className="request-meta">
                  <span>{request.budget}</span>
                  <span>{request.mode}</span>
                </div>
                <p className="request-status">{request.status}</p>
              </article>
            ))}
          </div>
        </section>
      </div>
    </section>
  )
}

export default StudentPage
