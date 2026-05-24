import { useState, useEffect, useRef } from "react";
import { useDispatch, useSelector } from "react-redux";
import { useNavigate, useLocation } from "react-router-dom";
import { FaBell, FaUser, FaSearch, FaCog, FaSignOutAlt } from "react-icons/fa";
import { logout } from "../redux/authSlice";
import './Navbar.css'

const Navbar = () => {
  const dispatch = useDispatch();
  const navigate = useNavigate();
  const location = useLocation();
  const { user } = useSelector((state) => state.auth);

  const [notificationsOpen, setNotificationsOpen] = useState(false);
  const [profileOpen, setProfileOpen] = useState(false);

  const notifRef = useRef();
  const profileRef = useRef();

  // ✅ CLOSE DROPDOWN ON OUTSIDE CLICK
  useEffect(() => {
    const handleClickOutside = (e) => {
      if (
        notifRef.current &&
        !notifRef.current.contains(e.target)
      ) {
        setNotificationsOpen(false);
      }
      if (
        profileRef.current &&
        !profileRef.current.contains(e.target)
      ) {
        setProfileOpen(false);
      }
    };

    document.addEventListener("mousedown", handleClickOutside);
    return () => document.removeEventListener("mousedown", handleClickOutside);
  }, []);

  const notifications = [
    {
      id: 1,
      title: "Application Submitted",
      message: "Your React Training application has been submitted successfully",
      time: "2 min ago",
    },
    {
      id: 2,
      title: "New Training Available",
      message: "Java Spring Boot training posted by TechCorp Solutions",
      time: "1 hr ago",
    },
    {
      id: 3,
      title: "Profile Viewed",
      message: "A vendor viewed your training profile",
      time: "4 hrs ago",
    },
  ];

  const handleLogout = () => {
    dispatch(logout());
    navigate("/");
  };

  const getPageTitle = () => {
    const path = location.pathname;
    if (path.includes("/admin/dashboard")) return "Admin Dashboard";
    if (path.includes("/admin/users")) return "User Management";
    if (path.includes("/admin/trainings")) return "Training Oversight";
    if (path.includes("/admin/applications")) return "Application Oversight";
    if (path.includes("/admin/invitations")) return "Invitation Oversight";
    if (path.includes("/admin/audit-logs")) return "Audit Logs";
    if (path.includes("/vendor/dashboard")) return "Dashboard";
    if (path.includes("/vendor/post-training")) return "Post Training";
    if (path.includes("/vendor/browse-trainers")) return "Browse Trainers";
    if (path.includes("/vendor/invitations")) return "Invitations";
    if (path.includes("/vendor/my-trainings")) return "My Trainings";
    if (path.includes("/vendor/trainer/")) return "Trainer Profile";
    if (path.includes("/vendor/applications/")) return "Applications";
    if (path.includes("/trainer/dashboard")) return "Dashboard";
    if (path.includes("/trainer/trainings")) return "Trainings";
    if (path.includes("/trainer/invitations")) return "Invitations";
    if (path.includes("/trainer/applications")) return "My Applications";
    if (path.includes("/trainer/profile")) return "My Profile";
    return "Dashboard";
  };

  const getSearchPlaceholder = () => {
    const role = user?.role;
    if (role === "ADMIN") return "Search users, roles, trainings...";
    if (role === "VENDOR") return "Search trainings, trainers...";
    if (role === "TRAINER") return "Search trainings, invitations...";
    return "Search...";
  };

  return (
    <header className="navbar-container">
      <div className="navbar-wrapper">

        {/* LEFT - Page Title */}
        <div className="navbar-left">
          <h1 className="navbar-title">{getPageTitle()}</h1>
          <p className="navbar-subtitle">Welcome back, {user?.name || "User"}</p>
        </div>

        {/* CENTER - Search */}
        <div className="navbar-search">
          <FaSearch className="navbar-search-icon" />
          <input
            type="text"
            placeholder={getSearchPlaceholder()}
          />
        </div>

        {/* RIGHT - Actions */}
        <div className="navbar-right">

          {/* NOTIFICATIONS */}
          <div ref={notifRef} className="dropdown-wrapper">
            <button
              onClick={() => setNotificationsOpen(!notificationsOpen)}
              className="navbar-btn"
              title="Notifications"
            >
              <FaBell />
              {notifications.length > 0 && (
                <span className="navbar-btn-badge">{notifications.length}</span>
              )}
            </button>

            {notificationsOpen && (
              <div className="dropdown-menu">
                <div className="dropdown-header">Notifications</div>
                <div className="dropdown-content">
                  {notifications.map((n) => (
                    <div key={n.id} className="notification-item">
                      <p className="notification-title">{n.title}</p>
                      <p className="notification-message">{n.message}</p>
                      <p className="notification-time">{n.time}</p>
                    </div>
                  ))}
                </div>
              </div>
            )}
          </div>

          {/* PROFILE */}
          <div ref={profileRef} className="dropdown-wrapper">
            <button
              onClick={() => setProfileOpen(!profileOpen)}
              className="navbar-profile-btn"
            >
              <FaUser />
              <span>{user?.role || "User"}</span>
            </button>

            {profileOpen && (
              <div className="dropdown-menu">
                <div className="dropdown-header">Account</div>
                <div className="dropdown-content">
                  <button className="menu-item">
                    <FaUser /> View Profile
                  </button>
                  <button className="menu-item">
                    <FaCog /> Settings
                  </button>
                  <hr className="menu-divider" />
                  <button
                    onClick={handleLogout}
                    className="menu-item logout"
                  >
                    <FaSignOutAlt /> Logout
                  </button>
                </div>
              </div>
            )}
          </div>

        </div>
      </div>
    </header>
  );
};

export default Navbar;
