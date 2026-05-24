import { useState } from 'react'
import { Link } from 'react-router-dom'
import {
  FaArrowRight,
  FaFacebookF,
  FaInstagram,
  FaLinkedinIn,
  FaTwitter,
  FaUserTie,
  FaBuilding,
  FaShieldAlt,
} from 'react-icons/fa'
import '../App.css'
import './Discovery.css'

const navItems = [
  { label: 'Home', href: '/' },
  { label: 'Find Trainers', href: '/discover/trainers' },
  { label: 'Find Trainings', href: '/discover/trainings' },
  { label: 'Login', href: '/login' },
  { label: 'Register', href: '/register' },
]

const PublicShell = ({ children }) => {
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
              <Link key={item.label} to={item.href} onClick={handleNavClick}>
                {item.label}
              </Link>
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

      <main className="public-discovery-shell">
        <div className="public-discovery-wrap">{children}</div>
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
            <Link to="/" onClick={handleNavClick}>
              Home
            </Link>
            <Link to="/discover/trainers" onClick={handleNavClick}>
              Find Trainers
            </Link>
            <Link to="/discover/trainings" onClick={handleNavClick}>
              Find Trainings
            </Link>
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
          <div className="footer-link-group">
            <span>Modules</span>
            <a href="/#trainer-module" onClick={handleNavClick}>
              Trainer Hub
            </a>
            <a href="/#vendor-module" onClick={handleNavClick}>
              Vendor Hub
            </a>
            <a href="/#admin-module" onClick={handleNavClick}>
              Admin Hub
            </a>
          </div>
        </div>
      </footer>
    </>
  )
}

export default PublicShell
