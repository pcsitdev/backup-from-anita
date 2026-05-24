import { BrowserRouter, Navigate, Route, Routes } from 'react-router-dom'
import App from '../App'
import ProtectedRoute from '../components/ProtectedRoute'
import PublicRoute from '../components/PublicRoute'
import AdminDashboard from '../admin/Dashboard'
import AdminApplications from '../admin/Applications'
import AdminAuditLogs from '../admin/AuditLogs'
import AdminInvitations from '../admin/Invitations'
import AdminTrainings from '../admin/Trainings'
import AdminUsers from '../admin/Users'
import Login from '../pages/auth/Login'
import Register from '../pages/auth/Register'
import DiscoverTrainers from '../public/DiscoverTrainers'
import DiscoverTrainings from '../public/DiscoverTrainings'
import TrainerApplications from '../trainer/Applications'
import TrainerDashboard from '../trainer/Dashboard'
import TrainerInvitations from '../trainer/Invitations'
import MyApplications from '../trainer/MyApplications'
import MyProfile from '../trainer/MyProfile'
import Trainings from '../trainer/Trainings'
import VendorDashboard from '../vendor/Dashboard'
import VendorInvitations from '../vendor/Invitations'
import MyTrainings from '../vendor/MyTrainings'
import PostTraining from '../vendor/PostTraining'
import TrainerProfileView from '../vendor/TrainerProfileView'
import BrowseTrainers from '../vendor/BrowseTrainers'

const AppRoutes = () => {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<App />} />
        <Route
          path="/login"
          element={
            <PublicRoute>
              <Login />
            </PublicRoute>
          }
        />
        <Route
          path="/register"
          element={
            <PublicRoute>
              <Register />
            </PublicRoute>
          }
        />
        <Route path="/discover/trainings" element={<DiscoverTrainings />} />
        <Route path="/discover/trainers" element={<DiscoverTrainers />} />

        <Route
          path="/trainer/dashboard"
          element={
            <ProtectedRoute allowedRoles={['TRAINER']}>
              <TrainerDashboard />
            </ProtectedRoute>
          }
        />
        <Route
          path="/trainer/trainings"
          element={
            <ProtectedRoute allowedRoles={['TRAINER']}>
              <Trainings />
            </ProtectedRoute>
          }
        />
        <Route
          path="/trainer/invitations"
          element={
            <ProtectedRoute allowedRoles={['TRAINER']}>
              <TrainerInvitations />
            </ProtectedRoute>
          }
        />
        <Route
          path="/trainer/applications"
          element={
            <ProtectedRoute allowedRoles={['TRAINER']}>
              <MyApplications />
            </ProtectedRoute>
          }
        />
        <Route
          path="/trainer/profile"
          element={
            <ProtectedRoute allowedRoles={['TRAINER']}>
              <MyProfile />
            </ProtectedRoute>
          }
        />

        <Route
          path="/vendor/dashboard"
          element={
            <ProtectedRoute allowedRoles={['VENDOR']}>
              <VendorDashboard />
            </ProtectedRoute>
          }
        />
        <Route
          path="/vendor/post-training"
          element={
            <ProtectedRoute allowedRoles={['VENDOR']}>
              <PostTraining />
            </ProtectedRoute>
          }
        />
        <Route
          path="/vendor/invitations"
          element={
            <ProtectedRoute allowedRoles={['VENDOR']}>
              <VendorInvitations />
            </ProtectedRoute>
          }
        />
        <Route
          path="/vendor/my-trainings"
          element={
            <ProtectedRoute allowedRoles={['VENDOR']}>
              <MyTrainings />
            </ProtectedRoute>
          }
        />
        <Route
          path="/vendor/browse-trainers"
          element={
            <ProtectedRoute allowedRoles={['VENDOR']}>
              <BrowseTrainers />
            </ProtectedRoute>
          }
        />
        <Route
          path="/vendor/trainer/:trainerId"
          element={
            <ProtectedRoute allowedRoles={['VENDOR']}>
              <TrainerProfileView />
            </ProtectedRoute>
          }
        />
        <Route
          path="/vendor/applications/:trainingId"
          element={
            <ProtectedRoute allowedRoles={['VENDOR']}>
              <TrainerApplications />
            </ProtectedRoute>
          }
        />

        <Route
          path="/admin/dashboard"
          element={
            <ProtectedRoute allowedRoles={['ADMIN']}>
              <AdminDashboard />
            </ProtectedRoute>
          }
        />
        <Route
          path="/admin/users"
          element={
            <ProtectedRoute allowedRoles={['ADMIN']}>
              <AdminUsers />
            </ProtectedRoute>
          }
        />
        <Route
          path="/admin/trainings"
          element={
            <ProtectedRoute allowedRoles={['ADMIN']}>
              <AdminTrainings />
            </ProtectedRoute>
          }
        />
        <Route
          path="/admin/applications"
          element={
            <ProtectedRoute allowedRoles={['ADMIN']}>
              <AdminApplications />
            </ProtectedRoute>
          }
        />
        <Route
          path="/admin/invitations"
          element={
            <ProtectedRoute allowedRoles={['ADMIN']}>
              <AdminInvitations />
            </ProtectedRoute>
          }
        />
        <Route
          path="/admin/audit-logs"
          element={
            <ProtectedRoute allowedRoles={['ADMIN']}>
              <AdminAuditLogs />
            </ProtectedRoute>
          }
        />

        <Route path="*" element={<Navigate to="/" replace />} />
      </Routes>
    </BrowserRouter>
  )
}

export default AppRoutes
