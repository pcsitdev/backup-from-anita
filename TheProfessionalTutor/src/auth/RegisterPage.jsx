import { useState } from 'react'
import { register } from '../shared/api'

function RegisterPage({ onNavigate, onAuthSuccess }) {
  const [formData, setFormData] = useState({
    fullName: '',
    email: '',
    phone: '',
    role: 'student',
    password: '',
  })
  const [status, setStatus] = useState({ type: 'idle', message: '' })

  const handleChange = (event) => {
    const { name, value } = event.target
    setFormData((current) => ({ ...current, [name]: value }))
  }

  const handleSubmit = async (event) => {
    event.preventDefault()
    setStatus({ type: 'loading', message: 'Creating account...' })

    try {
      const result = await register(formData)
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
          <p className="eyebrow">Register</p>
          <h1>Create your marketplace account</h1>
          <p className="hero-text">
            Join as a student, tutor, or admin team member and start using the platform with the right role.
          </p>

          <form className="auth-form auth-form-wide" onSubmit={handleSubmit}>
            <label className="auth-field">
              <span>Full name</span>
              <input
                name="fullName"
                type="text"
                value={formData.fullName}
                onChange={handleChange}
                placeholder="Enter your full name"
              />
            </label>
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
              <span>Phone number</span>
              <input
                name="phone"
                type="tel"
                value={formData.phone}
                onChange={handleChange}
                placeholder="+91 98765 43210"
              />
            </label>
            <label className="auth-field">
              <span>Register as</span>
              <select name="role" value={formData.role} onChange={handleChange}>
                <option value="student">Student</option>
                <option value="tutor">Tutor</option>
                <option value="admin">Admin</option>
              </select>
            </label>
            <label className="auth-field auth-field-full">
              <span>Password</span>
              <input
                name="password"
                type="password"
                value={formData.password}
                onChange={handleChange}
                placeholder="Create a strong password"
              />
            </label>
            <button type="submit" className="solid-button auth-submit">
              Register
            </button>
            {status.message && (
              <p className={status.type === 'error' ? 'status-text error-text' : 'status-text'}>{status.message}</p>
            )}
          </form>
        </section>

        <aside className="preview-card auth-side">
          <p className="panel-title">Why join</p>
          <h2>One account gives you a role-specific experience.</h2>
          <p className="tiny-note">
            Tutors can complete profiles, students can post requirements, and admins can control access codes.
          </p>
          <div className="hero-actions">
            <button type="button" className="ghost-button" onClick={() => onNavigate('login')}>
              Already have an account?
            </button>
          </div>
        </aside>
      </div>
    </section>
  )
}

export default RegisterPage
