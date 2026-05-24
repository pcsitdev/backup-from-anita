import { useState } from 'react'
import { Link } from 'react-router-dom'
import {
  FaArrowRight,
  FaBuilding,
  FaFacebookF,
  FaInstagram,
  FaLinkedinIn,
  FaShieldAlt,
  FaTwitter,
  FaUserTie,
  FaLayerGroup,
  FaCheckCircle,
} from 'react-icons/fa'
import './App.css'

const navItems = [
  { label: 'Home', href: '#top' },
  { label: 'Trainer Hub', href: '#trainer-module' },
  { label: 'Vendor Hub', href: '#vendor-module' },
  { label: 'Workflows', href: '#workflow' },
  { label: 'Contact', href: '#footer' },
]

const stats = [
  { value: '3', label: 'Dedicated role suites' },
  { value: '1', label: 'Unified operations platform' },
  { value: '24/7', label: 'Business process visibility' },
  { value: '100%', label: 'Workflow-driven collaboration' },
]

const roleCards = [
  {
    title: 'Trainer',
    subtitle: 'Showcase expertise and win quality assignments',
    icon: FaUserTie,
    tone: 'tone-blue',
    points: [
      'Register with domain expertise, skills, and experience.',
      'Browse available trainings posted by vendors.',
      'Apply and track application status from one place.',
    ],
    action: 'Explore trainer flow',
    href: '#trainer-module',
    badge: 'Talent side',
  },
  {
    title: 'Vendor',
    subtitle: 'Source trusted trainers and deliver at scale',
    icon: FaBuilding,
    tone: 'tone-teal',
    points: [
      'Register as a vendor with organization details.',
      'Post new training requirements with budget and duration.',
      'Review trainer applications and manage open programs.',
    ],
    action: 'Explore vendor flow',
    href: '#vendor-module',
    badge: 'Demand side',
  },
  {
    title: 'Admin',
    subtitle: 'Govern quality, compliance, and platform operations',
    icon: FaShieldAlt,
    tone: 'tone-gold',
    points: [
      'Oversee onboarding across trainers and vendors.',
      'Track platform activity, approvals, and modules.',
      'Manage the health of the training marketplace.',
    ],
    action: 'Explore admin flow',
    href: '#admin-module',
    badge: 'Control layer',
  },
]

const platformHighlights = [
  {
    label: 'Trainer management',
    value: 'Profiles, capabilities, and applications',
  },
  {
    label: 'Vendor management',
    value: 'Requirements, postings, and sourcing pipeline',
  },
  {
    label: 'Admin visibility',
    value: 'Operational oversight across all modules',
  },
]

const workflow = [
  {
    step: '01',
    title: 'Onboard stakeholders',
    description:
      'Trainers and vendors create their accounts and enter role-specific business details.',
  },
  {
    step: '02',
    title: 'Publish demand and discover opportunities',
    description:
      'Vendors post training requirements, and trainers discover matching opportunities.',
  },
  {
    step: '03',
    title: 'Evaluate, select, and deliver',
    description:
      'Trainers apply for programs while vendors review applicants and move the process forward.',
  },
]

const moduleDetails = [
  {
    id: 'trainer-module',
    title: 'Trainer Module',
    intro:
      'Built for independent and institutional trainers to present expertise and apply for relevant programs.',
    icon: FaUserTie,
    tone: 'tone-blue',
    items: ['Trainer registration', 'Training discovery', 'Application tracking'],
  },
  {
    id: 'vendor-module',
    title: 'Vendor Module',
    intro:
      'Designed for enterprises and partners to publish requirements and manage capacity planning efficiently.',
    icon: FaBuilding,
    tone: 'tone-teal',
    items: ['Vendor registration', 'Post training requirement', 'Manage posted trainings'],
  },
  {
    id: 'admin-module',
    title: 'Admin Module',
    intro:
      'Central command layer for monitoring performance, activity, and governance across the ecosystem.',
    icon: FaLayerGroup,
    tone: 'tone-gold',
    items: ['Dashboard overview', 'User monitoring', 'Platform governance'],
  },
]

const accessCards = [
  {
    title: 'Secure Login',
    description: 'Enterprise-ready sign-in for trainers, vendors, and administrators.',
    action: 'Open login',
    href: '/login',
    icon: FaCheckCircle,
  },
  {
    title: 'Business Registration',
    description: 'Onboard new trainers and vendors with a structured commercial workflow.',
    action: 'Create account',
    href: '/register',
    icon: FaArrowRight,
  },
  {
    title: 'Browse Trainings',
    description: 'Public discovery for trainers who want to review opportunities before signing in.',
    action: 'Search trainings',
    href: '/discover/trainings',
    icon: FaUserTie,
  },
  {
    title: 'Browse Trainers',
    description: 'Public discovery for vendors who want to shortlist trainers before login.',
    action: 'Search trainers',
    href: '/discover/trainers',
    icon: FaBuilding,
  },
]

function App() {
  const [menuOpen, setMenuOpen] = useState(false)

  const handleNavClick = () => {
    setMenuOpen(false)
  }

  return (
    <>
      <header className="site-header" id="top">
        <div className="header-topbar">
          <div className="topbar-left">
            <span>+91 98765 43210</span>
            <span>support@trainerspro360.com</span>
          </div>
          <div className="topbar-right">
            <a href="#" aria-label="Facebook">
              <FaFacebookF />
            </a>
            <a href="#" aria-label="Instagram">
              <FaInstagram />
            </a>
            <a href="#" aria-label="LinkedIn">
              <FaLinkedinIn />
            </a>
            <a href="#" aria-label="Twitter">
              <FaTwitter />
            </a>
          </div>
        </div>

        <div className="header-logobar">
          <Link to="/" className="brand-mark" onClick={handleNavClick}>
            <img
              src="/trainerspro360-logo.svg"
              className="brand-logo"
              alt="Trainers Pro 360 logo"
            />
            <span className="brand-copy">
              <strong>Trainers Pro 360</strong>
              <small>Trainer and Vendor Collaboration Platform</small>
            </span>
          </Link>

          <p className="motivation-quote">
            "Where training capability meets business demand, growth becomes repeatable."
          </p>
        </div>

        <div className="header-navbar-row">
          <button
            type="button"
            className="menu-toggle"
            aria-label={menuOpen ? 'Close navigation menu' : 'Open navigation menu'}
            aria-expanded={menuOpen}
            onClick={() => setMenuOpen((current) => !current)}
          >
            <span />
            <span />
            <span />
          </button>

          <nav className={`topnav ${menuOpen ? 'is-open' : ''}`} aria-label="Primary">
            {navItems.map((item) => (
              <a key={item.label} href={item.href} onClick={handleNavClick}>
                {item.label}
              </a>
            ))}
          </nav>

          <div className="header-cta">
            <Link className="finder-button trainer" to="/discover/trainers" onClick={handleNavClick}>
              Find your trainer
            </Link>
            <Link className="finder-button training" to="/discover/trainings" onClick={handleNavClick}>
              Find trainings
            </Link>
            <Link className="ghost-link" to="/login" onClick={handleNavClick}>
              Login
            </Link>
            <Link className="primary-button compact" to="/register" onClick={handleNavClick}>
              Register
            </Link>
          </div>
        </div>
      </header>

      <main className="landing-shell">
        <section className="hero-section">
          <div className="hero-copy">
            <p className="eyebrow">Enterprise training marketplace</p>
            <h1>Commercial training marketplace built for enterprise delivery teams.</h1>
            <p className="hero-text">
              Trainers Pro 360 is a role-based operations platform where trainers
              build trusted profiles, vendors publish high-priority requirements, and
              administrators oversee delivery quality through one connected system.
            </p>

            <div className="hero-actions">
              <Link className="primary-button" to="/login">
                Enter Platform
              </Link>
              
              <a className="secondary-button" href="#roles">
                Explore Modules
              </a>
            </div>
          </div>

          <aside className="hero-panel">
            <p className="panel-label">Platform focus</p>
            <div className="signal-card">
              <strong>One software, three business roles</strong>
              <p>
                Structured operations for trainer onboarding, vendor demand management,
                and administrative governance.
              </p>
            </div>

            <div className="highlight-list">
              {platformHighlights.map((item) => (
                <div key={item.label} className="highlight-item">
                  <span>{item.label}</span>
                  <strong>{item.value}</strong>
                </div>
              ))}
            </div>
          </aside>
        </section>

        <section className="stats-strip" aria-label="Platform summary">
          {stats.map((item) => (
            <article key={item.label} className="stat-card">
              <strong>{item.value}</strong>
              <span>{item.label}</span>
            </article>
          ))}
        </section>

        <section className="access-section">
          {accessCards.map((card) => (
            <article key={card.title} className="access-card">
              <div className="access-topline">
                <div className="access-icon" aria-hidden="true">
                  <card.icon />
                </div>
                <div className="access-copy">
                  <p className="eyebrow">Quick access</p>
                  <h2>{card.title}</h2>
                  <p>{card.description}</p>
                </div>
              </div>
              <Link className="text-link" to={card.href} onClick={handleNavClick}>
                {card.action}
              </Link>
            </article>
          ))}
        </section>

        <section className="roles-section" id="roles">
          <div className="section-heading">
            <p className="eyebrow">Role-based modules</p>
            <h2>Each user type gets a dedicated workflow.</h2>
            <p>
              Dedicated experiences for trainers, vendors, and administrators ensure
              cleaner execution, faster turnaround, and accountable workflows.
            </p>
          </div>

          <div className="role-grid">
            {roleCards.map((role) => (
              <article key={role.title} className={`role-card ${role.tone}`}>
                <div className="card-topline">
                  <p className="role-title">{role.badge}</p>
                  <div className="role-icon" aria-hidden="true">
                    <role.icon />
                  </div>
                </div>

                <div className="card-copy">
                  <h3>{role.title}</h3>
                  <p className="role-subtitle">{role.subtitle}</p>
                </div>

                <div className="bullet-list">
                  {role.points.map((point) => (
                    <p key={point}>{point}</p>
                  ))}
                </div>

                <a className="text-link" href={role.href} onClick={handleNavClick}>
                  {role.action}
                </a>
              </article>
            ))}
          </div>
        </section>

        <section className="workflow-section" id="workflow">
          <div className="section-heading">
            <p className="eyebrow">Business flow</p>
            <h2>How Trainers Pro 360 works in practice.</h2>
          </div>

          <div className="workflow-grid">
            {workflow.map((item) => (
              <article key={item.step} className="workflow-card">
                <span className="step-badge">{item.step}</span>
                <h3>{item.title}</h3>
                <p>{item.description}</p>
              </article>
            ))}
          </div>
        </section>

        <section className="modules-section" id="modules">
          {moduleDetails.map((module) => (
            <article key={module.id} id={module.id} className={`module-panel ${module.tone}`}>
              <div className="module-heading">
                <div className="module-icon" aria-hidden="true">
                  <module.icon />
                </div>
                <div className="module-copy">
                  <p className="module-tag">Dedicated module</p>
                  <h2>{module.title}</h2>
                  <p>{module.intro}</p>
                </div>
              </div>

              <div className="module-list">
                {module.items.map((item) => (
                  <div key={item} className="module-item">
                    {item}
                  </div>
                ))}
              </div>
            </article>
          ))}
        </section>
      </main>

      <footer className="footer-section" id="footer">
        <div className="footer-brand">
          <p className="eyebrow footer-eyebrow">Built for modern training ops</p>
          <strong>Trainers Pro 360</strong>
          <p>
            Market-ready training operations platform for managing trainer supply,
            vendor demand, and enterprise governance from one product layer.
          </p>
          <div className="footer-actions">
            <Link className="footer-cta primary" to="/register" onClick={handleNavClick}>
              Start onboarding
            </Link>
            <Link className="footer-cta secondary" to="/login" onClick={handleNavClick}>
              Member login
            </Link>
          </div>
        </div>

        <div className="footer-links">
          <div className="footer-link-group">
            <span>Navigate</span>
            <a href="#roles" onClick={handleNavClick}>
              Roles
            </a>
            <a href="#modules" onClick={handleNavClick}>
              Modules
            </a>
            <a href="#workflow" onClick={handleNavClick}>
              Workflow
            </a>
          </div>
          <div className="footer-link-group">
            <span>Access</span>
            <Link to="/login" onClick={handleNavClick}>
              Login
            </Link>
            <Link to="/register" onClick={handleNavClick}>
              Register
            </Link>
          </div>
        </div>
      </footer>
    </>
  )
}

export default App
