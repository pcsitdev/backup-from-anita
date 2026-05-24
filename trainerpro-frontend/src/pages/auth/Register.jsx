import { useState } from 'react'
import { Link, useNavigate } from 'react-router-dom'
import { FaBuilding, FaEnvelope, FaLock, FaUser, FaArrowRight, FaShieldAlt, FaUsers } from 'react-icons/fa'
import API from '../../services/api'

const publicRoles = ['TRAINER', 'VENDOR']

const initialForm = {
  name: '',
  email: '',
  password: '',
  role: 'TRAINER',
}

const buildRegisterPayload = (form) => ({
  name: form.name.trim(),
  email: form.email.trim().toLowerCase(),
  password: form.password,
  role: form.role,
})

const getRegisterErrorMessage = (error) => {
  const status = error?.response?.status
  const apiMessage =
    error?.response?.data?.message ||
    error?.response?.data?.error ||
    error?.message

  if (status === 409) {
    return apiMessage &&
      apiMessage.toString().trim() &&
      apiMessage.toString().toLowerCase() !== 'conflict'
      ? apiMessage
      : 'An account with this email already exists. Please use a different email or login instead.'
  }

  return apiMessage || 'Registration failed. Please try again.'
}

const Register = () => {
  const navigate = useNavigate()
  const [form, setForm] = useState(initialForm)
  const [submitting, setSubmitting] = useState(false)
  const [errors, setErrors] = useState({})
  const [statusMessage, setStatusMessage] = useState({ type: '', text: '' })

  const validateForm = () => {
    const newErrors = {}

    // Name validation
    if (!form.name.trim()) {
      newErrors.name = 'Full name is required'
    } else if (form.name.trim().length < 2) {
      newErrors.name = 'Name must be at least 2 characters long'
    }

    // Email validation
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/
    if (!form.email.trim()) {
      newErrors.email = 'Email is required'
    } else if (!emailRegex.test(form.email)) {
      newErrors.email = 'Please enter a valid email address'
    }

    // Password validation
    if (!form.password) {
      newErrors.password = 'Password is required'
    } else if (form.password.length < 8) {
      newErrors.password = 'Password must be at least 8 characters long'
    } else if (!/(?=.*[a-z])(?=.*[A-Z])(?=.*\d)/.test(form.password)) {
      newErrors.password = 'Password must contain at least one uppercase letter, one lowercase letter, and one number'
    }

    // Role validation
    if (!form.role) {
      newErrors.role = 'Please select a role'
    } else if (!publicRoles.includes(form.role)) {
      newErrors.role = 'Only trainer and vendor accounts can be created here'
    }

    setErrors(newErrors)
    if (Object.keys(newErrors).length > 0) {
      setStatusMessage({ type: 'error', text: 'Please fix the highlighted fields and try again.' })
    }
    return Object.keys(newErrors).length === 0
  }

  const handleChange = (event) => {
    const { name, value } = event.target
    setForm((current) => ({ ...current, [name]: value }))
    if (statusMessage.text) {
      setStatusMessage({ type: '', text: '' })
    }

    // Clear error when user starts typing
    if (errors[name]) {
      setErrors(prev => ({ ...prev, [name]: '' }))
    }
  }

  const handleSubmit = async (event) => {
    event.preventDefault()

    if (!validateForm()) {
      return
    }

    setSubmitting(true)
    setStatusMessage({ type: '', text: '' })

    try {
      const payload = buildRegisterPayload(form)
      await API.post('/auth/register', payload)
      navigate('/login', {
        state: {
          successMessage: 'Registration submitted successfully. Please wait for admin approval before logging in.',
        },
      })
    } catch (error) {
      setStatusMessage({ type: 'error', text: getRegisterErrorMessage(error) })
    } finally {
      setSubmitting(false)
    }
  }

  return (
    <div className="auth-shell auth-shell-register">
      <aside className="auth-panel">
        <div className="auth-panel-brand">
          <img src="/trainerspro360-logo.svg" alt="Trainers Pro 360 logo" className="auth-logo" />
          <div>
            <p className="auth-panel-eyebrow">Commercial onboarding</p>
            <strong>Trainers Pro 360</strong>
          </div>
        </div>

        <h2>Create a polished workspace account in minutes.</h2>
        <p className="auth-panel-copy">
          Register as a trainer or vendor and join a structured marketplace built for
          enterprise collaboration.
        </p>

        <div className="auth-panel-points">
          <div className="auth-panel-point">
            <span className="auth-panel-icon gold">
              <FaUsers />
            </span>
            <div>
              <strong>Role-based onboarding</strong>
              <p>Choose your access level and join the right workflow.</p>
            </div>
          </div>
          <div className="auth-panel-point">
            <span className="auth-panel-icon blue">
              <FaShieldAlt />
            </span>
            <div>
              <strong>Secure by design</strong>
              <p>Set up a strong account with clean validation.</p>
            </div>
          </div>
        </div>

        <div className="auth-panel-badge-row">
          <span>Trusted</span>
          <span>Scalable</span>
          <span>Professional</span>
        </div>
      </aside>

      <div className="auth-card auth-card--enterprise">
        <div className="auth-card-header">
          <p className="auth-eyebrow">Trainers Pro access</p>
          <h1>Create your account</h1>
          <p className="auth-copy">
            Register as a trainer or vendor to access the platform modules.
          </p>
        </div>

        <div className="success-message auth-form-message">
          New trainer and vendor accounts require admin approval before first login.
        </div>

        {statusMessage.text ? (
          <div className={statusMessage.type === 'error' ? 'error-message auth-form-message' : 'success-message auth-form-message'}>
            {statusMessage.text}
          </div>
        ) : null}

        <form className="auth-form" onSubmit={handleSubmit}>
          <label className="auth-field">
            <span>Full name</span>
            <div className={`auth-input-wrap ${errors.name ? 'error' : ''}`}>
              <FaUser className="auth-input-icon" />
              <input
                type="text"
                name="name"
                placeholder="Enter your full name"
                value={form.name}
                onChange={handleChange}
                required
                className={errors.name ? 'error' : ''}
              />
            </div>
            {errors.name && <span className="error-message">{errors.name}</span>}
          </label>

          <label className="auth-field">
            <span>Email address</span>
            <div className={`auth-input-wrap ${errors.email ? 'error' : ''}`}>
              <FaEnvelope className="auth-input-icon" />
              <input
                type="email"
                name="email"
                placeholder="name@company.com"
                value={form.email}
                onChange={handleChange}
                required
                className={errors.email ? 'error' : ''}
              />
            </div>
            {errors.email && <span className="error-message">{errors.email}</span>}
          </label>

          <label className="auth-field">
            <span>Password</span>
            <div className={`auth-input-wrap ${errors.password ? 'error' : ''}`}>
              <FaLock className="auth-input-icon" />
              <input
                type="password"
                name="password"
                placeholder="Create a strong password"
                value={form.password}
                onChange={handleChange}
                required
                className={errors.password ? 'error' : ''}
              />
            </div>
            {errors.password && <span className="error-message">{errors.password}</span>}
          </label>

          <label className="auth-field">
            <span>Role</span>
            <div className={`auth-input-wrap ${errors.role ? 'error' : ''}`}>
              <FaBuilding className="auth-input-icon" />
              <select
                name="role"
                value={form.role}
                onChange={handleChange}
                className={errors.role ? 'error' : ''}
              >
                <option value="">Select your role</option>
                <option value="TRAINER">Trainer - Deliver training sessions and workshops</option>
                <option value="VENDOR">Vendor - Post and manage training opportunities</option>
              </select>
            </div>
            {errors.role && <span className="error-message">{errors.role}</span>}
          </label>

          <button type="submit" className="auth-button auth-button-enterprise" disabled={submitting}>
            {submitting ? 'Creating account...' : 'Create account'}
            {!submitting && <FaArrowRight />}
          </button>
        </form>

        <p className="auth-footer">
          Already registered? <Link to="/login">Login here</Link>
        </p>
      </div>
    </div>
  )
}

export default Register
