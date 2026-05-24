import { useState } from 'react'
import { Link, useLocation, useNavigate, useSearchParams } from 'react-router-dom'
import { useDispatch } from 'react-redux'
import { FaEnvelope, FaLock, FaShieldAlt, FaChartLine, FaArrowRight } from 'react-icons/fa'
import API from '../../services/api'
import { loginSuccess } from '../../redux/authSlice'

const Login = () => {
  const [form, setForm] = useState({ email: '', password: '' })
  const [submitting, setSubmitting] = useState(false)
  const [statusMessage, setStatusMessage] = useState({ type: '', text: '' })
  const [searchParams] = useSearchParams()
  const dispatch = useDispatch()
  const navigate = useNavigate()
  const location = useLocation()

  const redirectTarget = searchParams.get('redirect')
  const successMessage = location.state?.successMessage || ''

  const resolveRedirect = (role) => {
    if (!redirectTarget || !redirectTarget.startsWith('/')) {
      return null
    }

    if (redirectTarget.startsWith('/discover/')) {
      return redirectTarget
    }

    if (role === 'TRAINER' && redirectTarget.startsWith('/trainer/')) {
      return redirectTarget
    }

    if (role === 'VENDOR' && redirectTarget.startsWith('/vendor/')) {
      return redirectTarget
    }

    if (role === 'ADMIN' && redirectTarget.startsWith('/admin/')) {
      return redirectTarget
    }

    return null
  }

  const handleChange = (event) => {
    const { name, value } = event.target
    setForm((current) => ({ ...current, [name]: value }))
    if (statusMessage.text) {
      setStatusMessage({ type: '', text: '' })
    }
  }

  const handleLogin = async (event) => {
    event.preventDefault()
    setSubmitting(true)
    setStatusMessage({ type: '', text: '' })

    try {
      const response = await API.post('/auth/login', form)
      dispatch(loginSuccess(response.data))

      const role = response.data?.user?.role
      const safeRedirect = resolveRedirect(role)

      if (safeRedirect) navigate(safeRedirect, { replace: true })
      else if (role === 'TRAINER') navigate('/trainer/dashboard')
      else if (role === 'ADMIN') navigate('/admin/dashboard')
      else navigate('/vendor/dashboard')
    } catch (error) {
      const apiMessage =
        error?.response?.data?.message ||
        error?.response?.data?.error ||
        'Login failed. Please check your email and password.'
      setStatusMessage({ type: 'error', text: apiMessage })
    } finally {
      setSubmitting(false)
    }
  }

  return (
    <div className="auth-shell auth-shell-login">
      <aside className="auth-panel">
        <div className="auth-panel-brand">
          <img src="/trainerspro360-logo.svg" alt="Trainers Pro 360 logo" className="auth-logo" />
          <div>
            <p className="auth-panel-eyebrow">Enterprise access</p>
            <strong>Trainers Pro 360</strong>
          </div>
        </div>

        <h2>Secure sign-in for your business workspace.</h2>
        <p className="auth-panel-copy">
          Access trainer, vendor, and admin workflows from one commercial platform built for
          delivery teams.
        </p>

        <div className="auth-panel-points">
          <div className="auth-panel-point">
            <span className="auth-panel-icon blue">
              <FaShieldAlt />
            </span>
            <div>
              <strong>Protected access</strong>
              <p>Role-aware authentication with enterprise-grade flow.</p>
            </div>
          </div>
          <div className="auth-panel-point">
            <span className="auth-panel-icon teal">
              <FaChartLine />
            </span>
            <div>
              <strong>Fast routing</strong>
              <p>Jump directly to your workspace after sign-in.</p>
            </div>
          </div>
        </div>

        <div className="auth-panel-badge-row">
          <span>Trainer</span>
          <span>Vendor</span>
          <span>Admin</span>
        </div>
      </aside>

      <div className="auth-card auth-card--enterprise">
        <div className="auth-card-header">
          <p className="auth-eyebrow">Secure access</p>
          <h1>Login to your workspace</h1>
          <p className="auth-copy">
            Access trainer, vendor, and admin workflows from a single training platform.
          </p>
        </div>

        {successMessage ? (
          <div className="success-message auth-form-message">{successMessage}</div>
        ) : null}

        {statusMessage.text ? (
          <div className={statusMessage.type === 'error' ? 'error-message auth-form-message' : 'success-message auth-form-message'}>
            {statusMessage.text}
          </div>
        ) : null}

        <form className="auth-form" onSubmit={handleLogin}>
          <label className="auth-field">
            <span>Email address</span>
            <div className="auth-input-wrap">
              <FaEnvelope className="auth-input-icon" />
              <input
                type="email"
                name="email"
                placeholder="name@company.com"
                value={form.email}
                onChange={handleChange}
                required
              />
            </div>
          </label>

          <label className="auth-field">
            <span>Password</span>
            <div className="auth-input-wrap">
              <FaLock className="auth-input-icon" />
              <input
                type="password"
                name="password"
                placeholder="Enter your password"
                value={form.password}
                onChange={handleChange}
                required
              />
            </div>
          </label>

          <button type="submit" className="auth-button auth-button-enterprise" disabled={submitting}>
            {submitting ? 'Signing in...' : 'Login to dashboard'}
            {!submitting && <FaArrowRight />}
          </button>
        </form>

        <p className="auth-footer">
          Need an account? <Link to="/register">Create one</Link>
        </p>
      </div>
    </div>
  )
}

export default Login
