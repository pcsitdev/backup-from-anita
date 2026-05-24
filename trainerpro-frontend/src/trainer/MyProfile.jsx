import { useState, useEffect, useRef } from 'react'
import { FaBriefcase, FaFileAlt, FaFolderOpen, FaIdBadge, FaImage, FaUser } from 'react-icons/fa'
import { useDispatch, useSelector } from 'react-redux'
import Layout from '../components/Layout'
import API from '../services/api'
import { setUser } from '../redux/authSlice'
import { useToast } from '../components/Toast'
import { locationOnlyGroups, modeGroups, skillGroups } from '../constants/marketplaceOptions'

const MultiSelectField = ({
  label,
  groups,
  selectedValues,
  placeholder,
  onToggleValue,
  onClear,
  open,
  onToggleOpen,
}) => {
  const fieldRef = useRef(null)
  const [panelSearch, setPanelSearch] = useState('')

  useEffect(() => {
    const handleOutsideClick = (event) => {
      if (fieldRef.current && !fieldRef.current.contains(event.target)) {
        onToggleOpen(false)
      }
    }

    document.addEventListener('mousedown', handleOutsideClick)
    return () => document.removeEventListener('mousedown', handleOutsideClick)
  }, [onToggleOpen])

  useEffect(() => {
    if (!open) {
      setPanelSearch('')
    }
  }, [open])

  const searchTerm = panelSearch.trim().toLowerCase()
  const visibleGroups = groups
    .map((group) => {
      const options = group.options.filter((option) => {
        if (!searchTerm) return true
        return (
          option.toLowerCase().includes(searchTerm) ||
          group.label.toLowerCase().includes(searchTerm)
        )
      })

      return { ...group, options }
    })
    .filter((group) => group.options.length > 0)

  return (
    <div ref={fieldRef} className="profile-multi-select-field">
      <span className="profile-multi-select-label">{label}</span>
      <button
        type="button"
        className={`profile-multi-select-trigger ${open ? 'open' : ''}`}
        onClick={() => onToggleOpen(!open)}
      >
        <div className="profile-multi-select-values">
          {selectedValues.length > 0 ? (
            selectedValues.map((value) => (
              <span key={value} className="profile-multi-select-chip" title={value}>
                {value}
                <span
                  className="profile-multi-select-chip-remove"
                  onClick={(event) => {
                    event.stopPropagation()
                    onToggleValue(value)
                  }}
                  aria-label={`Remove ${value}`}
                >
                  ×
                </span>
              </span>
            ))
          ) : (
            <span className="profile-multi-select-placeholder">{placeholder}</span>
          )}
        </div>
        <span className="profile-multi-select-caret">▾</span>
      </button>

      {open ? (
        <div className="profile-multi-select-panel" onMouseDown={(event) => event.stopPropagation()}>
          <div className="profile-multi-select-panel-header">
            <span>{label}</span>
            {selectedValues.length > 0 ? (
              <button type="button" className="profile-multi-select-clear" onClick={onClear}>
                Clear
              </button>
            ) : null}
          </div>

          <div className="profile-multi-select-panel-search">
            <input
              type="search"
              value={panelSearch}
              onChange={(event) => setPanelSearch(event.target.value)}
              placeholder={`Search ${label.toLowerCase()}...`}
              className="profile-multi-select-panel-input"
              onMouseDown={(event) => event.stopPropagation()}
            />
          </div>

          <div className="profile-multi-select-groups">
            {visibleGroups.length > 0 ? (
              visibleGroups.map((group) => (
                <div key={group.label} className="profile-multi-select-group">
                  <div className="profile-multi-select-group-label">{group.label}</div>
                  <div className="profile-multi-select-options">
                    {group.options.map((option) => {
                      const isSelected = selectedValues.includes(option)

                      return (
                        <button
                          key={option}
                          type="button"
                          className={`profile-multi-select-option ${isSelected ? 'selected' : ''}`}
                          onClick={() => onToggleValue(option)}
                        >
                          <span>{option}</span>
                          <span className="profile-multi-select-option-mark">{isSelected ? '✓' : ''}</span>
                        </button>
                      )
                    })}
                  </div>
                </div>
              ))
            ) : (
              <div className="profile-multi-select-empty">No matches found for this search.</div>
            )}
          </div>
        </div>
      ) : null}
    </div>
  )
}

const normalizeList = (value) => {
  if (!value) return []
  if (Array.isArray(value)) return value.filter(Boolean)
  return String(value)
    .split(',')
    .map((item) => item.trim())
    .filter(Boolean)
}

const certificationOptions = [
  'AWS Certified Solutions Architect',
  'AWS Certified Developer',
  'Microsoft Azure Fundamentals',
  'Google Cloud Professional',
  'Certified Scrum Master (CSM)',
  'Project Management Professional (PMP)',
  'Certified Information Systems Security Professional (CISSP)',
  'CompTIA Security+',
  'Cisco Certified Network Associate (CCNA)',
  'Oracle Certified Java Programmer',
  'Microsoft Certified Azure Developer',
  'Certified Kubernetes Administrator (CKA)',
  'Docker Certified Associate',
  'MongoDB Certified Developer',
  'PostgreSQL Certification',
  'ITIL Certification',
  'Six Sigma Certification',
  'PRINCE2 Certification',
]

const MyProfile = () => {
  const { user } = useSelector((state) => state.auth)
  const dispatch = useDispatch()
  const { showError, showSuccess } = useToast()
  const currentUser = user

  // Initialize form data only when user is available
  const [formData, setFormData] = useState({
    name: '',
    mobile: '',
    education: '',
    experience: '',
    skills: '',
    certifications: '',
    trainingDomains: '',
    trainingModes: '',
    languages: '',
    location: '',
    bio: '',
  })

  const [profileImage, setProfileImage] = useState(null)
  const [resume, setResume] = useState(null)
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState('')
  const [success, setSuccess] = useState('')
  const [activeTab, setActiveTab] = useState('personal')
  const [validationErrors, setValidationErrors] = useState({})
  const [selectedLanguages, setSelectedLanguages] = useState([])
  const [selectedLocations, setSelectedLocations] = useState([])
  const [selectedSkills, setSelectedSkills] = useState([])
  const [selectedCertifications, setSelectedCertifications] = useState([])
  const [selectedModes, setSelectedModes] = useState([])
  const [customCertification, setCustomCertification] = useState('')
  const [openFilter, setOpenFilter] = useState('')

  const MAX_PROFILE_IMAGE_SIZE = 2 * 1024 * 1024 // 2MB
  const MAX_RESUME_SIZE = 5 * 1024 * 1024 // 5MB
  const languageOptions = ['English', 'Hindi', 'Tamil', 'Telugu', 'Kannada', 'Malayalam', 'Marathi', 'Gujarati']
  const sectionLabels = {
    personal: 'Save Personal Info',
    professional: 'Save Professional Info',
    training: 'Save Training Info',
    documents: 'Save Documents',
  }

  const completionFields = [
    'name',
    'mobile',
    'location',
    'education',
    'experience',
    'bio',
    'skills',
    'certifications',
    'trainingDomains',
    'trainingModes',
    'languages',
  ]

  const completionValue = Math.round(
    ((completionFields.filter((key) => {
      const value = formData[key]
      return value && value.toString().trim().length > 0
    }).length +
      ((profileImage || currentUser?.profileImage) ? 1 : 0) +
      ((resume || currentUser?.resume || currentUser?.resumeUrl || currentUser?.cv) ? 1 : 0)) /
      (completionFields.length + 2)) *
      100
  )

  const completionStatus = `${completionValue}% complete`

  const getAssetUrl = (assetPath) => {
    if (!assetPath) return ''
    if (/^(https?:|blob:|data:)/i.test(assetPath)) return assetPath

    const apiBase = API.defaults.baseURL.replace(/\/$/, '')
    const apiOrigin = apiBase.replace(/\/api$/, '')
    const normalizedPath = assetPath.startsWith('/') ? assetPath : `/${assetPath}`

    return `${apiOrigin}${normalizedPath}`
  }

  const getDocumentLabel = (documentPath, fallbackLabel) => {
    if (!documentPath) return fallbackLabel

    const cleanName = documentPath.split('/').pop()?.split('?')[0]
    return cleanName || fallbackLabel
  }

  // Update form data when user data is loaded
  useEffect(() => {
    if (currentUser) {
      setFormData({
        name: currentUser.name || '',
        mobile: currentUser.mobile || '',
        education: currentUser.education || '',
        experience: currentUser.experience || '',
        skills: currentUser.skills || '',
        certifications: currentUser.certifications || '',
        trainingDomains: currentUser.trainingDomains || '',
        trainingModes: currentUser.trainingModes || '',
        languages: currentUser.languages || '',
        location: currentUser.location || '',
        bio: currentUser.bio || '',
      })

      setSelectedLocations(normalizeList(currentUser.location))
      setSelectedSkills(normalizeList(currentUser.skills))
      setSelectedCertifications(normalizeList(currentUser.certifications))
      setSelectedModes(normalizeList(currentUser.trainingModes))
      setCustomCertification('')
    }
  }, [currentUser])

  // Update selected languages when form data changes
  useEffect(() => {
    if (formData.languages) {
      const languages = formData.languages.split(',').map(lang => lang.trim()).filter(lang => lang)
      setSelectedLanguages(languages)
    } else {
      setSelectedLanguages([])
    }
  }, [formData.languages])

  const toggleValue = (value, setSelectedValues) => {
    setSelectedValues((currentValues) =>
      currentValues.includes(value)
        ? currentValues.filter((item) => item !== value)
        : [...currentValues, value]
    )
  }

  const handleMultiSelectChange = (fieldName, values, setSelectedValues) => {
    setSelectedValues(values)
    setFormData((prev) => ({
      ...prev,
      [fieldName]: values.join(', '),
    }))
    if (validationErrors[fieldName]) {
      setValidationErrors((prev) => ({ ...prev, [fieldName]: '' }))
    }
  }

  const handleCertificationAdd = () => {
    const value = customCertification.trim()
    if (!value) return

    const nextValues = selectedCertifications.includes(value)
      ? selectedCertifications
      : [...selectedCertifications, value]

    setSelectedCertifications(nextValues)
    setFormData((prev) => ({
      ...prev,
      certifications: nextValues.join(', '),
    }))
    setCustomCertification('')

    if (validationErrors.certifications) {
      setValidationErrors((prev) => ({ ...prev, certifications: '' }))
    }
  }

  const handleMobileChange = (e) => {
    const value = e.target.value.replace(/\D/g, '') // Remove non-digits
    if (value.length <= 10) {
      setFormData(prev => ({
        ...prev,
        mobile: value
      }))
      if (validationErrors.mobile) {
        setValidationErrors(prev => ({ ...prev, mobile: '' }))
      }
    }
  }

  const handleInputChange = (e) => {
    const { name, value } = e.target
    setFormData(prev => ({
      ...prev,
      [name]: value
    }))

    // Clear validation error when user starts typing
    if (validationErrors[name]) {
      setValidationErrors(prev => ({ ...prev, [name]: '' }))
    }
  }

  const validateForm = (section) => {
    const errors = {}

    if (section === 'personal') {
      if (!formData.name.trim()) {
        errors.name = 'Full name is required'
      } else if (formData.name.trim().length < 2) {
        errors.name = 'Name must be at least 2 characters long'
      }

      if (formData.mobile && !/^\d{10}$/.test(formData.mobile.replace(/\D/g, ''))) {
        errors.mobile = 'Please enter a valid 10-digit mobile number'
      }

      if (formData.bio && formData.bio.length > 1000) {
        errors.bio = 'Bio must be less than 1000 characters'
      }
    }

    if (section === 'professional') {
      if (formData.skills && formData.skills.split(',').length > 20) {
        errors.skills = 'Please limit to 20 skills maximum'
      }

      if (formData.certifications && formData.certifications.split(',').length > 15) {
        errors.certifications = 'Please limit to 15 certifications maximum'
      }
    }

    if (section === 'training') {
      if (formData.trainingDomains && formData.trainingDomains.split(',').length > 10) {
        errors.trainingDomains = 'Please limit to 10 training domains maximum'
      }
    }

    if (section === 'documents') {
      if (profileImage && profileImage.size > MAX_PROFILE_IMAGE_SIZE) {
        errors.profileImage = 'Profile image must be 2MB or smaller'
      }
      if (resume && resume.size > MAX_RESUME_SIZE) {
        errors.resume = 'Resume must be 5MB or smaller'
      }
    }

    setValidationErrors(errors)
    return Object.keys(errors).length === 0
  }

  const handleSubmit = async (e, section = activeTab) => {
    if (e) e.preventDefault()

    if (!validateForm(section)) {
      const message = 'Please fix the validation errors before submitting this section'
      setError(message)
      showError(message)
      return
    }

    setLoading(true)
    setError('')
    setSuccess('')

    try {
      const formDataToSend = new FormData()

      const sectionFields = {
        personal: ['name', 'mobile', 'location', 'education', 'experience', 'bio'],
        professional: ['skills', 'certifications'],
        training: ['trainingDomains', 'trainingModes', 'languages'],
        documents: [],
      }

      sectionFields[section].forEach((key) => {
        if (formData[key]) {
          formDataToSend.append(key, formData[key])
        }
      })

      if (section === 'documents') {
        if (profileImage) {
          formDataToSend.append('profileImage', profileImage)
        }
        if (resume) {
          formDataToSend.append('resume', resume)
        }
      }

      const response = await API.put('/auth/profile', formDataToSend)

      dispatch(setUser(response.data))
      const message = `${sectionLabels[section]} submitted successfully!`
      setSuccess(message)
      showSuccess(message)

      if (section === 'documents') {
        setProfileImage(null)
        setResume(null)
      }
    } catch (err) {
      const errorMsg = err.response?.data?.message || err.message || 'Failed to update profile. Please try again.'
      setError(errorMsg)
      showError(errorMsg)
    } finally {
      setLoading(false)
    }
  }

  const handleFileChange = (e) => {
    const { name, files } = e.target
    const file = files[0]

    if (name === 'profileImage') {
      if (file && file.size > MAX_PROFILE_IMAGE_SIZE) {
        setValidationErrors((prev) => ({ ...prev, profileImage: 'Profile image must be 2MB or smaller' }))
        setProfileImage(null)
        return
      }
      setProfileImage(file)
      setValidationErrors((prev) => ({ ...prev, profileImage: '' }))
    } else if (name === 'resume') {
      if (file && file.size > MAX_RESUME_SIZE) {
        setValidationErrors((prev) => ({ ...prev, resume: 'Resume must be 5MB or smaller' }))
        setResume(null)
        return
      }
      setResume(file)
      setValidationErrors((prev) => ({ ...prev, resume: '' }))
    }
  }

  const tabs = [
    { id: 'personal', label: 'Personal Info', icon: <FaUser /> },
    { id: 'professional', label: 'Professional', icon: <FaBriefcase /> },
    { id: 'training', label: 'Training', icon: <FaIdBadge /> },
    { id: 'documents', label: 'Documents', icon: <FaFileAlt /> },
  ]

  if (!currentUser) {
    return (
      <Layout>
        <div className="dashboard-hero">
          <div>
            <p className="dashboard-eyebrow">Trainer Profile</p>
            <h2 className="dashboard-page-title">Profile not available</h2>
            <p className="dashboard-copy">
              Your session is missing trainer information. Please login again and reopen your profile.
            </p>
          </div>
        </div>
      </Layout>
    )
  }

  return (
    <Layout>
      <section className="dashboard-hero">
        <div>
          <p className="dashboard-eyebrow">Trainer Profile</p>
          <h2 className="dashboard-page-title">Complete Your Professional Profile</h2>
          <p className="dashboard-copy">
            Build a comprehensive profile to showcase your expertise and attract training opportunities.
          </p>

          <div className="completion-block">
            <div className="completion-header">
              <span>Profile completion</span>
              <strong>{completionStatus}</strong>
            </div>
            <div className="completion-track" role="progressbar" aria-valuenow={completionValue} aria-valuemin="0" aria-valuemax="100">
              <div className="completion-fill" style={{ width: `${completionValue}%` }} />
            </div>
          </div>
        </div>
      </section>

      <section className="dashboard-panels">
        <article className="profile-section">
          {/* Profile Header */}
          <div className="profile-header-card">
            <div className="profile-avatar-large">
              {currentUser?.profileImage ? (
                <img src={getAssetUrl(currentUser.profileImage)} alt="Profile" />
              ) : (
                <div className="avatar-placeholder-large">
                  {currentUser?.name?.charAt(0)?.toUpperCase() || 'U'}
                </div>
              )}
            </div>
            <div className="profile-header-info">
              <h2>{currentUser?.name || 'Trainer'}</h2>
              <p className="profile-role">{currentUser?.role}</p>
              <p className="profile-email">{currentUser?.email}</p>
              <div className="profile-stats">
                <div className="stat-item">
                  <span className="stat-number">{currentUser?.experience || '0'}</span>
                  <span className="stat-label">Years Exp</span>
                </div>
                <div className="stat-item">
                  <span className="stat-number">{currentUser?.trainingDomains?.split(',').length || 0}</span>
                  <span className="stat-label">Domains</span>
                </div>
                <div className="stat-item">
                  <span className="stat-number">{currentUser?.certifications?.split(',').length || 0}</span>
                  <span className="stat-label">Certifications</span>
                </div>
              </div>
            </div>
          </div>

          {/* Tab Navigation */}
          <div className="profile-tabs">
            {tabs.map(tab => (
              <button
                key={tab.id}
                className={`tab-button ${activeTab === tab.id ? 'active' : ''}`}
                onClick={() => setActiveTab(tab.id)}
              >
                <span className="tab-icon">{tab.icon}</span>
                <span className="tab-label">{tab.label}</span>
              </button>
            ))}
          </div>

          {/* Status Messages */}
          {error && <div className="alert alert-error">{error}</div>}
          {success && <div className="alert alert-success">{success}</div>}

          <form onSubmit={(e) => handleSubmit(e, activeTab)} className="profile-form">
            {/* Personal Information Tab */}
            {activeTab === 'personal' && (
              <div className="tab-content">
                <div className="form-section">
                  <h4>Basic Information</h4>
                  <div className="form-grid">
                    <div className="form-group">
                      <label htmlFor="name">Full Name *</label>
                      <input
                        type="text"
                        id="name"
                        name="name"
                        value={formData.name}
                        onChange={handleInputChange}
                        required
                        className={`form-input ${validationErrors.name ? 'error' : ''}`}
                      />
                      {validationErrors.name && <span className="error-message">{validationErrors.name}</span>}
                    </div>
                    <div className="form-group">
                      <label htmlFor="mobile">Mobile Number</label>
                      <input
                        type="tel"
                        id="mobile"
                        name="mobile"
                        value={formData.mobile}
                        onChange={handleMobileChange}
                        placeholder="Enter 10-digit mobile number"
                        maxLength="10"
                        className={`form-input ${validationErrors.mobile ? 'error' : ''}`}
                      />
                      {validationErrors.mobile && <span className="error-message">{validationErrors.mobile}</span>}
                    </div>
                    <div className="form-group">
                      <MultiSelectField
                        label="Location"
                        groups={locationOnlyGroups}
                        selectedValues={selectedLocations}
                        placeholder="Select one or more locations"
                        onToggleValue={(value) =>
                          handleMultiSelectChange(
                            'location',
                            selectedLocations.includes(value)
                              ? selectedLocations.filter((item) => item !== value)
                              : [...selectedLocations, value],
                            setSelectedLocations
                          )
                        }
                        onClear={() => handleMultiSelectChange('location', [], setSelectedLocations)}
                        open={openFilter === 'location'}
                        onToggleOpen={(nextOpen) => setOpenFilter(nextOpen ? 'location' : '')}
                      />
                    </div>
                    <div className="form-group">
                      <label htmlFor="education">Education Level</label>
                      <select
                        id="education"
                        name="education"
                        value={formData.education}
                        onChange={handleInputChange}
                        className={`form-input ${validationErrors.education ? 'error' : ''}`}
                      >
                        <option value="">Select education level</option>
                        <option value="High School">High School</option>
                        <option value="Associate Degree">Associate Degree</option>
                        <option value="Bachelor's Degree">Bachelor's Degree</option>
                        <option value="Master's Degree">Master's Degree</option>
                        <option value="PhD">PhD</option>
                        <option value="Professional Certification">Professional Certification</option>
                        <option value="Other">Other</option>
                      </select>
                      {validationErrors.education && <span className="error-message">{validationErrors.education}</span>}
                    </div>
                  </div>
                </div>

                <div className="form-section">
                  <h4>Education & Background</h4>
                  <div className="form-grid">
                    <div className="form-group">
                      <label htmlFor="experience">Years of Experience</label>
                      <select
                        id="experience"
                        name="experience"
                        value={formData.experience}
                        onChange={handleInputChange}
                        className="form-input"
                      >
                        <option value="">Select experience</option>
                        <option value="0-1">0-1 years</option>
                        <option value="1-3">1-3 years</option>
                        <option value="3-5">3-5 years</option>
                        <option value="5-10">5-10 years</option>
                        <option value="10+">10+ years</option>
                      </select>
                    </div>
                  </div>
                  <div className="form-group">
                    <label htmlFor="bio">Professional Bio</label>
                    <textarea
                      id="bio"
                      name="bio"
                      value={formData.bio}
                      onChange={handleInputChange}
                      rows="4"
                      placeholder="Tell us about your professional journey, teaching philosophy, and what makes you a great trainer..."
                      className={`form-textarea ${validationErrors.bio ? 'error' : ''}`}
                    />
                    <small>{formData.bio?.length || 0}/1000 characters</small>
                    {validationErrors.bio && <span className="error-message">{validationErrors.bio}</span>}
                  </div>
                </div>
              </div>
            )}

            {/* Professional Information Tab */}
            {activeTab === 'professional' && (
              <div className="tab-content">
                <div className="form-section">
                  <h4>Skills & Expertise</h4>
                  <div className="form-group">
                    <MultiSelectField
                      label="Skills"
                      groups={skillGroups}
                      selectedValues={selectedSkills}
                      placeholder="Select one or more skills"
                      onToggleValue={(value) =>
                        handleMultiSelectChange(
                          'skills',
                          selectedSkills.includes(value)
                            ? selectedSkills.filter((item) => item !== value)
                            : [...selectedSkills, value],
                          setSelectedSkills
                        )
                      }
                      onClear={() => handleMultiSelectChange('skills', [], setSelectedSkills)}
                      open={openFilter === 'skills'}
                      onToggleOpen={(nextOpen) => setOpenFilter(nextOpen ? 'skills' : '')}
                    />
                    {validationErrors.skills && <span className="error-message">{validationErrors.skills}</span>}
                  </div>
                </div>

                <div className="form-section">
                  <h4>Certifications</h4>
                  <div className="form-group">
                    <MultiSelectField
                      label="Certifications"
                      groups={[{ label: 'Professional Certifications', options: certificationOptions }]}
                      selectedValues={selectedCertifications}
                      placeholder="Select one or more certifications"
                      onToggleValue={(value) =>
                        handleMultiSelectChange(
                          'certifications',
                          selectedCertifications.includes(value)
                            ? selectedCertifications.filter((item) => item !== value)
                            : [...selectedCertifications, value],
                          setSelectedCertifications
                        )
                      }
                      onClear={() => handleMultiSelectChange('certifications', [], setSelectedCertifications)}
                      open={openFilter === 'certifications'}
                      onToggleOpen={(nextOpen) => setOpenFilter(nextOpen ? 'certifications' : '')}
                    />
                    <div className="certification-custom-row">
                      <input
                        type="text"
                        value={customCertification}
                        onChange={(event) => setCustomCertification(event.target.value)}
                        placeholder="Type and add a custom certification"
                        className="form-input"
                      />
                      <button
                        type="button"
                        className="certification-add-btn"
                        onClick={handleCertificationAdd}
                        disabled={!customCertification.trim()}
                      >
                        Add
                      </button>
                    </div>
                    {validationErrors.certifications && <span className="error-message">{validationErrors.certifications}</span>}
                  </div>
                </div>
              </div>
            )}

            {/* Training Information Tab */}
            {activeTab === 'training' && (
              <div className="tab-content">
                <div className="form-section">
                  <h4>Training Specializations</h4>
                  <div className="form-group">
                    <MultiSelectField
                      label="Training Specializations"
                      groups={skillGroups}
                      selectedValues={normalizeList(formData.trainingDomains)}
                      placeholder="Select one or more specializations"
                      onToggleValue={(value) => {
                        const currentValues = normalizeList(formData.trainingDomains)
                        const nextValues = currentValues.includes(value)
                          ? currentValues.filter((item) => item !== value)
                          : [...currentValues, value]
                        setFormData((prev) => ({
                          ...prev,
                          trainingDomains: nextValues.join(', '),
                        }))
                        if (validationErrors.trainingDomains) {
                          setValidationErrors((prev) => ({ ...prev, trainingDomains: '' }))
                        }
                      }}
                      onClear={() => {
                        setFormData((prev) => ({ ...prev, trainingDomains: '' }))
                        if (validationErrors.trainingDomains) {
                          setValidationErrors((prev) => ({ ...prev, trainingDomains: '' }))
                        }
                      }}
                      open={openFilter === 'trainingDomains'}
                      onToggleOpen={(nextOpen) => setOpenFilter(nextOpen ? 'trainingDomains' : '')}
                    />
                    {validationErrors.trainingDomains && <span className="error-message">{validationErrors.trainingDomains}</span>}
                  </div>
                </div>

                <div className="form-section">
                  <h4>Training Preferences</h4>
                  <div className="form-group">
                    <MultiSelectField
                      label="Mode"
                      groups={modeGroups}
                      selectedValues={selectedModes}
                      placeholder="Select one or more modes"
                      onToggleValue={(value) =>
                        handleMultiSelectChange(
                          'trainingModes',
                          selectedModes.includes(value)
                            ? selectedModes.filter((item) => item !== value)
                            : [...selectedModes, value],
                          setSelectedModes
                        )
                      }
                      onClear={() => handleMultiSelectChange('trainingModes', [], setSelectedModes)}
                      open={openFilter === 'mode'}
                      onToggleOpen={(nextOpen) => setOpenFilter(nextOpen ? 'mode' : '')}
                    />
                  </div>
                  <div className="form-group">
                    <MultiSelectField
                      label="Languages"
                      groups={[{ label: 'Languages', options: languageOptions }]}
                      selectedValues={selectedLanguages}
                      placeholder="Select one or more languages"
                      onToggleValue={(value) =>
                        handleMultiSelectChange(
                          'languages',
                          selectedLanguages.includes(value)
                            ? selectedLanguages.filter((item) => item !== value)
                            : [...selectedLanguages, value],
                          setSelectedLanguages
                        )
                      }
                      onClear={() => handleMultiSelectChange('languages', [], setSelectedLanguages)}
                      open={openFilter === 'languages'}
                      onToggleOpen={(nextOpen) => setOpenFilter(nextOpen ? 'languages' : '')}
                    />
                    {validationErrors.languages && <span className="error-message">{validationErrors.languages}</span>}
                  </div>
                </div>
              </div>
            )}

            {/* Documents Tab */}
            {activeTab === 'documents' && (
              <div className="tab-content">
                <div className="form-section">
                  <h4>Profile Documents</h4>
                  <div className="document-upload-grid">
                    <div className="upload-card">
                      <div className="upload-icon"><FaImage /></div>
                      <div className="upload-content">
                        <h5>Profile Picture</h5>
                        <p>Upload a professional headshot</p>
                        <input
                          type="file"
                          id="profileImage"
                          name="profileImage"
                          accept="image/*"
                          onChange={handleFileChange}
                          className="file-input"
                        />
                        <label htmlFor="profileImage" className="upload-button">
                          Choose File
                        </label>
                        <small>Max size: 2MB</small>
                        {validationErrors.profileImage && <span className="error-message">{validationErrors.profileImage}</span>}
                        {profileImage ? <p className="file-name">{profileImage.name}</p> : null}
                        {!profileImage && currentUser?.profileImage ? (
                          <a
                            href={getAssetUrl(currentUser.profileImage)}
                            target="_blank"
                            rel="noreferrer"
                            className="upload-button"
                          >
                            View Current Image
                          </a>
                        ) : null}
                      </div>
                    </div>

                    <div className="upload-card">
                      <div className="upload-icon"><FaFolderOpen /></div>
                      <div className="upload-content">
                        <h5>Resume/CV</h5>
                        <p>Upload your professional resume</p>
                        <input
                          type="file"
                          id="resume"
                          name="resume"
                          accept=".pdf,.doc,.docx"
                          onChange={handleFileChange}
                          className="file-input"
                        />
                        <label htmlFor="resume" className="upload-button">
                          Choose File
                        </label>
                        <small>Max size: 5MB</small>
                        {validationErrors.resume && <span className="error-message">{validationErrors.resume}</span>}
                        {resume ? <p className="file-name">{resume.name}</p> : null}
                        {!resume && (currentUser?.resume || currentUser?.resumeUrl || currentUser?.cv) ? (
                          <a
                            href={getAssetUrl(currentUser.resume || currentUser.resumeUrl || currentUser.cv)}
                            target="_blank"
                            rel="noreferrer"
                            className="upload-button"
                          >
                            {getDocumentLabel(currentUser.resume || currentUser.resumeUrl || currentUser.cv, 'View Current Resume')}
                          </a>
                        ) : null}
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            )}

            <div className="form-actions">
              <button type="submit" className="btn-primary" disabled={loading}>
                {loading ? 'Saving...' : sectionLabels[activeTab]}
              </button>
            </div>
          </form>
        </article>
      </section>
    </Layout>
  )
}

export default MyProfile
