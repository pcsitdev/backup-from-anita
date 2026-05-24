import { useEffect, useState } from 'react'
import AdminPage from './admin/AdminPage'
import LoginPage from './auth/LoginPage'
import RegisterPage from './auth/RegisterPage'
import Footer from './components/Footer'
import Navbar from './components/Navbar'
import DashboardPage from './dashboard/DashboardPage'
import LandingPage from './landing/LandingPage'
import StudentPage from './student/StudentPage'
import TutorPage from './tutor/TutorPage'
import './App.css'

const routes = ['landing', 'register', 'login', 'dashboard', 'student', 'tutor', 'admin']

function getRouteFromHash() {
  const hash = window.location.hash.replace('#/', '').replace('#', '')
  return routes.includes(hash) ? hash : 'landing'
}

function App() {
  const [page, setPage] = useState(getRouteFromHash)
  const [sessionUser, setSessionUser] = useState(null)

  useEffect(() => {
    const onHashChange = () => {
      setPage(getRouteFromHash())
    }

    window.addEventListener('hashchange', onHashChange)
    return () => window.removeEventListener('hashchange', onHashChange)
  }, [])

  const navigateTo = (target) => {
    window.location.hash = target === 'landing' ? '/' : `/${target}`
  }

  const handleAuthSuccess = (user) => {
    setSessionUser(user)
    navigateTo('dashboard')
  }

  return (
    <main className="app-shell">
      <Navbar page={page} onNavigate={navigateTo} sessionUser={sessionUser} />

      {page === 'landing' && <LandingPage onNavigate={navigateTo} />}
      {page === 'register' && <RegisterPage onNavigate={navigateTo} onAuthSuccess={handleAuthSuccess} />}
      {page === 'login' && <LoginPage onNavigate={navigateTo} onAuthSuccess={handleAuthSuccess} />}
      {page === 'dashboard' && (
        <DashboardPage onNavigate={navigateTo} sessionUser={sessionUser} />
      )}
      {page === 'student' && <StudentPage onNavigate={navigateTo} sessionUser={sessionUser} />}
      {page === 'tutor' && <TutorPage onNavigate={navigateTo} sessionUser={sessionUser} />}
      {page === 'admin' && <AdminPage onNavigate={navigateTo} sessionUser={sessionUser} />}

      <Footer />
    </main>
  )
}

export default App
