import { useSelector } from 'react-redux'
import { NavLink } from 'react-router-dom'
import {
  FaChalkboardTeacher,
  FaEnvelopeOpenText,
  FaList,
  FaPlusCircle,
  FaShieldAlt,
  FaHistory,
  FaTachometerAlt,
  FaTasks,
  FaClipboardCheck,
  FaUser,
  FaUsers,
} from 'react-icons/fa'

const Sidebar = () => {
  const { user } = useSelector((state) => state.auth)
  const role = user?.role

  const trainerMenu = [
    { path: '/trainer/dashboard', name: 'Dashboard', icon: <FaTachometerAlt />, tone: 'tone-blue' },
    { path: '/trainer/trainings', name: 'Trainings', icon: <FaChalkboardTeacher />, tone: 'tone-teal' },
    { path: '/trainer/invitations', name: 'Invitations', icon: <FaEnvelopeOpenText />, tone: 'tone-gold' },
    { path: '/trainer/applications', name: 'My Applications', icon: <FaList />, tone: 'tone-rose' },
    { path: '/trainer/profile', name: 'My Profile', icon: <FaUser />, tone: 'tone-indigo' },
  ]

  const vendorMenu = [
    { path: '/vendor/dashboard', name: 'Dashboard', icon: <FaTachometerAlt />, tone: 'tone-blue' },
    { path: '/vendor/post-training', name: 'Post Training', icon: <FaPlusCircle />, tone: 'tone-rose' },
    { path: '/vendor/browse-trainers', name: 'Find your trainer', icon: <FaUsers />, tone: 'tone-teal' },
    { path: '/vendor/invitations', name: 'Invitations', icon: <FaEnvelopeOpenText />, tone: 'tone-gold' },
    { path: '/vendor/my-trainings', name: 'My Trainings', icon: <FaList />, tone: 'tone-indigo' },
  ]

  const adminMenu = [
    { path: '/admin/dashboard', name: 'Dashboard', icon: <FaShieldAlt />, tone: 'tone-indigo' },
    { path: '/admin/users', name: 'Manage Users', icon: <FaList />, tone: 'tone-gold' },
    { path: '/admin/trainings', name: 'Trainings', icon: <FaTasks />, tone: 'tone-teal' },
    { path: '/admin/applications', name: 'Applications', icon: <FaClipboardCheck />, tone: 'tone-blue' },
    { path: '/admin/invitations', name: 'Invitations', icon: <FaEnvelopeOpenText />, tone: 'tone-rose' },
    { path: '/admin/audit-logs', name: 'Audit Logs', icon: <FaHistory />, tone: 'tone-indigo' },
  ]

  let menuItems = []
  if (role === 'TRAINER') menuItems = trainerMenu
  else if (role === 'VENDOR') menuItems = vendorMenu
  else if (role === 'ADMIN') menuItems = adminMenu

  return (
    <aside className="dashboard-sidebar">
      <div className="dashboard-brand">
        <div className="dashboard-brand-mark">
          <img
            src="/trainerspro360-logo.svg"
            alt="Trainers Pro 360 logo"
            className="dashboard-brand-logo"
          />
        </div>
        <div className="dashboard-brand-copy">
          <strong>Trainers Pro 360</strong>
          <p>Trainer and Vendor Collaboration Platform</p>
        </div>
      </div>

      <div className="dashboard-sidebar-label">Main navigation</div>

      <nav className="dashboard-nav">
        {menuItems.map((item) => (
          <NavLink
            key={`${item.path}-${item.name}`}
            to={item.path}
            className={({ isActive }) =>
              `dashboard-nav-item ${isActive ? 'active' : ''}`
            }
          >
            <span className={`dashboard-nav-icon ${item.tone || ''}`}>{item.icon}</span>
            <span>{item.name}</span>
          </NavLink>
        ))}
      </nav>

      <div className="dashboard-sidebar-footer">
        <span className="dashboard-status-dot" />
        Secure role workspace
      </div>
    </aside>
  )
}

export default Sidebar
