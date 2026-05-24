import { useSelector } from 'react-redux'
import { Navigate } from 'react-router-dom'

const getRoleHome = (role) => {
  if (role === 'TRAINER') return '/trainer/dashboard'
  if (role === 'VENDOR') return '/vendor/dashboard'
  if (role === 'ADMIN') return '/admin/dashboard'
  return '/'
}

const ProtectedRoute = ({ allowedRoles, children }) => {
  const { user, token } = useSelector((state) => state.auth)

  if (!token || !user) {
    return <Navigate to="/login" replace />
  }

  if (allowedRoles && !allowedRoles.includes(user.role)) {
    return <Navigate to={getRoleHome(user.role)} replace />
  }

  return children
}

export default ProtectedRoute
