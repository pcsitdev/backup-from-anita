import { useEffect, useState } from 'react'
import { fetchLandingData } from '../shared/api'

function LandingPage({ onNavigate }) {
  const [landingData, setLandingData] = useState({
    heroTitle: 'Launch a tutor marketplace with onboarding, payments, and role-based dashboards.',
    featuredTutors: [],
    privilegeCodes: [],
  })
  const [status, setStatus] = useState('loading')

  useEffect(() => {
    let active = true

    async function loadLanding() {
      try {
        const data = await fetchLandingData()
        if (active) {
          setLandingData(data)
          setStatus('ready')
        }
      } catch {
        if (active) {
          setStatus('error')
        }
      }
    }

    loadLanding()

    return () => {
      active = false
    }
  }, [])

  return (
    <section className="page-frame hero-frame">
      <section className="landing-hero">
        <div className="hero-copy">
          <p className="eyebrow">UrbanPro and MyPrivateTutor style platform</p>
          <h1>{landingData.heroTitle}</h1>
          <p className="hero-text">
            The ProfessionalTutor connects students with verified tutors while giving admins full control over
            approvals, payment status, lead access, and privilege codes.
          </p>

          <div className="hero-actions">
            <button type="button" className="solid-button" onClick={() => onNavigate('register')}>
              Create account
            </button>
            <button type="button" className="ghost-button" onClick={() => onNavigate('dashboard')}>
              Explore dashboard
            </button>
          </div>
          {status === 'loading' && <p className="status-text">Loading landing data from backend...</p>}
          {status === 'error' && <p className="status-text error-text">Backend not reachable. Showing page shell.</p>}
        </div>

        <aside className="preview-card hero-side-panel">
          <p className="panel-title">Platform model</p>
          <div className="table-like compact-table">
            <div className="table-row">
              <span className="table-code">S</span>
              <div>
                <strong>Students</strong>
                <p>Search tutors, post learning requirements, and book demo sessions.</p>
              </div>
            </div>
            <div className="table-row">
              <span className="table-code">T</span>
              <div>
                <strong>Tutors</strong>
                <p>Showcase expertise, unlock leads, and manage classes from one dashboard.</p>
              </div>
            </div>
            <div className="table-row">
              <span className="table-code">A</span>
              <div>
                <strong>Admin</strong>
                <p>Verify tutors, collect fees, and control privilege-based listing rules.</p>
              </div>
            </div>
          </div>
        </aside>
      </section>

      <section className="surface-section">
        <div className="section-heading">
          <div>
            <p className="eyebrow">Featured tutors</p>
            <h2>Profiles that inspire trust quickly</h2>
          </div>
          <button type="button" className="ghost-button" onClick={() => onNavigate('student')}>
            View student page
          </button>
        </div>

        <div className="tutor-grid">
          {landingData.featuredTutors.map((tutor) => (
            <article className="tutor-card" key={tutor.id ?? tutor.name}>
              <div className="avatar-badge" aria-hidden="true">
                {tutor.name
                  .split(' ')
                  .map((part) => part[0])
                  .join('')}
              </div>
              <span className="status-pill neutral-pill">{tutor.privilegeCode ?? tutor.badge}</span>
              <h3>{tutor.name}</h3>
              <p className="tutor-subject">{tutor.subject}</p>
              <ul className="meta-list">
                <li>{tutor.experience}</li>
                <li>{tutor.mode ?? tutor.format}</li>
                <li>Starting from {tutor.rate}</li>
              </ul>
            </article>
          ))}
        </div>
      </section>

      <section className="surface-section surface-section-accent">
        <div className="section-heading">
          <div>
            <p className="eyebrow">Privilege codes</p>
            <h2>Admin-controlled tutor access</h2>
          </div>
        </div>

        <div className="code-grid">
          {landingData.privilegeCodes.map((item) => (
            <article className="request-card" key={item.code}>
              <p className="request-user">Code {item.code}</p>
              <h3>{item.title}</h3>
              <p className="tiny-note">{item.detail}</p>
            </article>
          ))}
        </div>
      </section>
    </section>
  )
}

export default LandingPage
