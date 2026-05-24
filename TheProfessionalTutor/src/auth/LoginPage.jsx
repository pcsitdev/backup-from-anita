import { useState } from 'react'
import { login } from '../shared/api'

function LoginPage({ onNavigate, onAuthSuccess }) {
  const [formData, setFormData] = useState({
    email: 'student@example.com',
    password: 'student123',
    role: 'student',
  })
  const [status, setStatus] = useState({ type: 'idle', message: '' })

  const handleChange = (event) => {
    const { name, value } = event.target
    setFormData((current) => ({ ...current, [name]: value }))
  }

  const handleSubmit = async (event) => {
    event.preventDefault()
    setStatus({ type: 'loading', message: 'Signing in...' })

    try {
      const result = await login(formData)
      setStatus({ type: 'success', message: result.message })
      onAuthSuccess(result.user)
    } catch (error) {
      setStatus({ type: 'error', message: error.message })
    }
  }

  return (
    <section className="page-frame auth-frame">
      <div className="auth-layout">
        <section className="auth-panel">
          <p className="eyebrow">Login</p>
          <h1>Welcome back to The ProfessionalTutor</h1>
          <p className="hero-text">
            Sign in as a student, tutor, or admin to manage your account, leads, and tutoring activity.
          </p>

          <form className="auth-form" onSubmit={handleSubmit}>
            <label className="auth-field">
              <span>Email address</span>
              <input
                name="email"
                type="email"
                value={formData.email}
                onChange={handleChange}
                placeholder="name@example.com"
              />
            </label>
            <label className="auth-field">
              <span>Password</span>
              <input
                name="password"
                type="password"
                value={formData.password}
                onChange={handleChange}
                placeholder="Enter your password"
              />
            </label>
            <label className="auth-field">
              <span>Login as</span>
              <select name="role" value={formData.role} onChange={handleChange}>
                <option value="student">Student</option>
                <option value="tutor">Tutor</option>
                <option value="admin">Admin</option>
              </select>
            </label>
            <button type="submit" className="solid-button auth-submit">
              Login
            </button>
            {status.message && (
              <p className={status.type === 'error' ? 'status-text error-text' : 'status-text'}>{status.message}</p>
            )}
          </form>
        </section>

        <aside className="preview-card auth-side">
          <p className="panel-title">Quick access</p>
          <h2>Move straight into the right dashboard after login.</h2>
          <p className="tiny-note">Students check responses, tutors unlock leads, and admins review approvals.</p>
          <div className="hero-actions">
            <button type="button" className="ghost-button" onClick={() => onNavigate('register')}>
              Need an account?
            </button>
          </div>
        </aside>
      </div>
    </section>
  )
}

export default LoginPage
