const navItems = [
  { key: 'landing', label: 'Landing' },
  { key: 'register', label: 'Register' },
  { key: 'login', label: 'Login' },
  { key: 'dashboard', label: 'Dashboard' },
]

function Navbar({ page, onNavigate, sessionUser }) {
  return (
    <header className="app-header">
      <button type="button" className="brand-lockup brand-button" onClick={() => onNavigate('landing')}>
        <div className="brand-mark" aria-hidden="true">
          PT
        </div>
        <div>
          <p className="brand-name">The ProfessionalTutor</p>
          <p className="brand-tag">Tutor and student marketplace</p>
        </div>
      </button>

      <nav className="page-nav" aria-label="Main navigation">
        {navItems.map((item) => (
          <button
            key={item.key}
            type="button"
            className={page === item.key ? 'nav-pill nav-pill-active' : 'nav-pill'}
            onClick={() => onNavigate(item.key)}
          >
            {item.label}
          </button>
        ))}
      </nav>

      <div className="navbar-actions">
        {sessionUser ? (
          <div className="session-chip">
            <strong>{sessionUser.fullName}</strong>
            <span>{sessionUser.role}</span>
          </div>
        ) : (
          <>
            <button type="button" className="ghost-button" onClick={() => onNavigate('login')}>
              Sign in
            </button>
            <button type="button" className="solid-button" onClick={() => onNavigate('register')}>
              Join now
            </button>
          </>
        )}
      </div>
    </header>
  )
}

export default Navbar
