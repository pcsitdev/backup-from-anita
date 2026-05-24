import { useEffect, useMemo, useRef, useState } from 'react'
import { Link } from 'react-router-dom'
import { FaSearch, FaMapMarkerAlt, FaBriefcase, FaStar, FaPaperPlane, FaEye } from 'react-icons/fa'
import Layout from '../components/Layout'
import API from '../services/api'
import LoadingSpinner from '../components/LoadingSpinner'
import { useToast } from '../components/Toast'
import { locationOnlyGroups, modeGroups, skillGroups } from '../constants/marketplaceOptions'
import './BrowseTrainers.css'

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
    <div ref={fieldRef} className="vendor-multi-select-field">
      <span className="vendor-filter-label">{label}</span>
      <button
        type="button"
        className={`vendor-multi-select-trigger ${open ? 'open' : ''}`}
        onClick={() => onToggleOpen(!open)}
      >
        <div className="vendor-multi-select-values">
          {selectedValues.length > 0 ? (
            selectedValues.map((value) => (
              <span key={value} className="vendor-multi-select-chip" title={value}>
                {value}
                <span
                  className="vendor-multi-select-chip-remove"
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
            <span className="vendor-multi-select-placeholder">{placeholder}</span>
          )}
        </div>
        <span className="vendor-multi-select-caret">▾</span>
      </button>

      {open ? (
        <div
          className="vendor-multi-select-panel"
          onMouseDown={(event) => event.stopPropagation()}
        >
          <div className="vendor-multi-select-panel-header">
            <span>{label}</span>
            {selectedValues.length > 0 ? (
              <button type="button" className="vendor-multi-select-clear" onClick={onClear}>
                Clear
              </button>
            ) : null}
          </div>

          <div className="vendor-multi-select-panel-search">
            <input
              type="search"
              value={panelSearch}
              onChange={(event) => setPanelSearch(event.target.value)}
              placeholder={`Search ${label.toLowerCase()}...`}
              className="vendor-multi-select-panel-input"
              onMouseDown={(event) => event.stopPropagation()}
            />
          </div>

          <div className="vendor-multi-select-groups">
            {visibleGroups.length > 0 ? (
              visibleGroups.map((group) => (
                <div key={group.label} className="vendor-multi-select-group">
                  <div className="vendor-multi-select-group-label">{group.label}</div>
                  <div className="vendor-multi-select-options">
                    {group.options.map((option) => {
                      const isSelected = selectedValues.includes(option)

                      return (
                        <button
                          key={option}
                          type="button"
                          className={`vendor-multi-select-option ${isSelected ? 'selected' : ''}`}
                          onClick={() => onToggleValue(option)}
                        >
                          <span>{option}</span>
                          <span className="vendor-multi-select-option-mark">{isSelected ? '✓' : ''}</span>
                        </button>
                      )
                    })}
                  </div>
                </div>
              ))
            ) : (
              <div className="vendor-multi-select-empty">No matches found for this search.</div>
            )}
          </div>
        </div>
      ) : null}
    </div>
  )
}

const BrowseTrainers = () => {
  const [trainers, setTrainers] = useState([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState('')
  const [searchTerm, setSearchTerm] = useState('')
  const [selectedLocations, setSelectedLocations] = useState([])
  const [selectedSkills, setSelectedSkills] = useState([])
  const [selectedModes, setSelectedModes] = useState([])
  const [openFilter, setOpenFilter] = useState('')
  const [showInviteModal, setShowInviteModal] = useState(false)
  const [selectedTrainer, setSelectedTrainer] = useState(null)
  const [selectedTraining, setSelectedTraining] = useState('')
  const [trainings, setTrainings] = useState([])
  const [invitations, setInvitations] = useState([])
  const [inviting, setInviting] = useState(false)
  const [currentPage, setCurrentPage] = useState(1)
  const [pageSize, setPageSize] = useState(12)
  const { showSuccess, showError } = useToast()

  const fetchTrainers = async () => {
    setLoading(true)
    setError('')

    try {
      const response = await API.get('/trainers')
      setTrainers(response.data)
    } catch (fetchError) {
      console.error(fetchError)
      setError('Unable to load trainers.')
    } finally {
      setLoading(false)
    }
  }

  const fetchVendorTrainings = async () => {
    try {
      const response = await API.get('/trainings/vendor')
      setTrainings(response.data)
    } catch (fetchError) {
      console.error('Error fetching trainings:', fetchError)
    }
  }

  const fetchVendorInvitations = async () => {
    try {
      const response = await API.get('/invitations/vendor')
      setInvitations(Array.isArray(response.data) ? response.data : [])
    } catch (fetchError) {
      console.error('Error fetching invitations:', fetchError)
    }
  }

  useEffect(() => {
    fetchTrainers()
    fetchVendorTrainings()
    fetchVendorInvitations()
  }, [])

  const getAssetUrl = (assetPath) => {
    if (!assetPath) return ''
    if (/^(https?:|blob:|data:)/i.test(assetPath)) return assetPath

    const apiBase = API.defaults.baseURL.replace(/\/$/, '')
    const apiOrigin = apiBase.replace(/\/api$/, '')
    const normalizedPath = assetPath.startsWith('/') ? assetPath : `/${assetPath}`

    return `${apiOrigin}${normalizedPath}`
  }

  const formatSkills = (skills) => {
    if (!skills) return []
    return typeof skills === 'string' ? skills.split(',').map((s) => s.trim()).filter(Boolean) : skills
  }

  const formatTrainingDomains = (domains) => {
    if (!domains) return []
    return typeof domains === 'string' ? domains.split(',').map((domain) => domain.trim()).filter(Boolean) : domains
  }

  const formatModes = (modes) => {
    if (!modes) return []
    return typeof modes === 'string' ? modes.split(',').map((mode) => mode.trim()).filter(Boolean) : modes
  }

  const filteredTrainers = trainers.filter((trainer) => {
    const trainerSkills = formatSkills(trainer.skills)
    const trainerDomains = formatTrainingDomains(trainer.trainingDomains)
    const trainerModes = formatModes(trainer.trainingModes || trainer.trainingMode || trainer.mode || trainer.modes)

    const matchesSearch =
      !searchTerm ||
      trainer.name.toLowerCase().includes(searchTerm.toLowerCase()) ||
      trainerSkills.some((skill) => skill.toLowerCase().includes(searchTerm.toLowerCase())) ||
      trainerDomains.some((domain) => domain.toLowerCase().includes(searchTerm.toLowerCase()))

    const trainerLocation = String(trainer.location || '').toLowerCase()
    const matchesLocation =
      selectedLocations.length === 0 ||
      selectedLocations.some((location) => trainerLocation.includes(location.toLowerCase()))

    const matchesSkill =
      selectedSkills.length === 0 ||
      trainerSkills.some((skill) =>
        selectedSkills.some((selectedSkill) => skill.toLowerCase() === selectedSkill.toLowerCase())
      )

    const matchesMode =
      selectedModes.length === 0 ||
      trainerModes.some((mode) =>
        selectedModes.some((selectedMode) => mode.toLowerCase() === selectedMode.toLowerCase())
      )

    return matchesSearch && matchesLocation && matchesSkill && matchesMode
  })

  const totalPages = Math.max(1, Math.ceil(filteredTrainers.length / pageSize))

  const paginatedTrainers = useMemo(() => {
    const start = (currentPage - 1) * pageSize
    const end = start + pageSize
    return filteredTrainers.slice(start, end)
  }, [filteredTrainers, currentPage, pageSize])

  useEffect(() => {
    setCurrentPage(1)
  }, [searchTerm, selectedLocations, selectedSkills, selectedModes, pageSize])

  const toggleValue = (value, setSelectedValues) => {
    setSelectedValues((currentValues) =>
      currentValues.includes(value)
        ? currentValues.filter((item) => item !== value)
        : [...currentValues, value]
    )
  }

  useEffect(() => {
    if (currentPage > totalPages) {
      setCurrentPage(totalPages)
    }
  }, [currentPage, totalPages])

  const paginationRange = useMemo(() => {
    const maxVisible = 5
    const startPage = Math.max(1, currentPage - Math.floor(maxVisible / 2))
    const endPage = Math.min(totalPages, startPage + maxVisible - 1)
    const adjustedStart = Math.max(1, endPage - maxVisible + 1)
    const pages = []

    for (let page = adjustedStart; page <= endPage; page += 1) {
      pages.push(page)
    }
    return pages
  }, [currentPage, totalPages])

  const isAlreadyInvited = (trainerId, trainingId) =>
    invitations.some(
      (invitation) =>
        Number(invitation.trainerId) === Number(trainerId) &&
        Number(invitation.trainingId) === Number(trainingId)
    )

  const handleInvite = async () => {
    if (!selectedTraining) {
      showError('Please select a training to invite the trainer to.')
      return
    }

    if (isAlreadyInvited(selectedTrainer?.id, selectedTraining)) {
      showError('This trainer has already been invited to the selected training.')
      return
    }

    setInviting(true)
    try {
      const response = await API.post('/invitations', {
        trainerId: selectedTrainer.id,
        trainingId: Number(selectedTraining),
        message: `We would like to invite you to apply for our ${trainings.find((t) => t.id === Number(selectedTraining))?.title} training program.`,
      })
      setInvitations((current) => [response.data, ...current])
      showSuccess('Invitation sent successfully!')
      setShowInviteModal(false)
      setSelectedTrainer(null)
      setSelectedTraining('')
    } catch (inviteError) {
      console.error(inviteError)
      const status = inviteError.response?.status
      const message = inviteError.response?.data?.message

      if (status === 409) {
        showError(message || 'This trainer has already been invited to this training.')
      } else {
        showError(message || 'Failed to send invitation. Please try again.')
      }
    } finally {
      setInviting(false)
    }
  }

  const openInviteModal = (trainer) => {
    setSelectedTrainer(trainer)
    setSelectedTraining('')
    setShowInviteModal(true)
  }

  const stats = [
    { value: String(trainers.length), label: 'Trainer profiles' },
    { value: String(filteredTrainers.length), label: 'Matching filters' },
    { value: String(trainings.length), label: 'Active vendor trainings' },
    { value: String(invitations.length), label: 'Sent invitations' },
  ]

  if (loading) {
    return (
      <Layout>
        <div className="trainers-loading">
          <LoadingSpinner size="large" message="Loading trainers..." />
        </div>
      </Layout>
    )
  }

  return (
    <Layout>
      <section className="trainers-hero">
        <div className="trainers-hero-copy">
          <p className="trainers-eyebrow">Vendor talent directory</p>
          <h2 className="trainers-page-title">Find your trainer.</h2>
          <p className="trainers-copy">
            Search an enterprise-ready trainer marketplace with location, skill, and delivery mode filters.
            Review profiles, compare fit, and invite the right expert faster.
          </p>
          <div className="hero-badges">
            <span>Enterprise search</span>
            <span>Commercial workflow</span>
            <span>Secure invite flow</span>
          </div>
        </div>

        <div className="trainers-hero-panel" aria-label="Trainer directory stats">
          {stats.map((item) => (
            <article key={item.label} className="hero-stat">
              <strong>{item.value}</strong>
              <span>{item.label}</span>
            </article>
          ))}
        </div>
      </section>

      <section className="trainers-filters">
        <div className="filters-container">
          <div className="filters-hero-bar">
            <div className="search-box">
              <FaSearch className="search-icon" />
              <input
                type="text"
                placeholder="Search by name, skills, domains, or bio..."
                value={searchTerm}
                onChange={(e) => setSearchTerm(e.target.value)}
                className="search-input"
              />
            </div>

            <div className="filters-summary">
              <strong>{filteredTrainers.length}</strong>
              <span>matching profiles</span>
            </div>
          </div>

          <div className="filter-row">
            <MultiSelectField
              label="Location"
              groups={locationOnlyGroups}
              selectedValues={selectedLocations}
              placeholder="Select one or more locations"
              onToggleValue={(value) => toggleValue(value, setSelectedLocations)}
              onClear={() => setSelectedLocations([])}
              open={openFilter === 'location'}
              onToggleOpen={(nextOpen) => setOpenFilter(nextOpen ? 'location' : '')}
            />

            <MultiSelectField
              label="Skills"
              groups={skillGroups}
              selectedValues={selectedSkills}
              placeholder="Select one or more skills"
              onToggleValue={(value) => toggleValue(value, setSelectedSkills)}
              onClear={() => setSelectedSkills([])}
              open={openFilter === 'skills'}
              onToggleOpen={(nextOpen) => setOpenFilter(nextOpen ? 'skills' : '')}
            />

            <MultiSelectField
              label="Mode"
              groups={modeGroups}
              selectedValues={selectedModes}
              placeholder="Select one or more modes"
              onToggleValue={(value) => toggleValue(value, setSelectedModes)}
              onClear={() => setSelectedModes([])}
              open={openFilter === 'mode'}
              onToggleOpen={(nextOpen) => setOpenFilter(nextOpen ? 'mode' : '')}
            />
          </div>

          <div className="filter-results">
            <p>
              Showing {filteredTrainers.length > 0 ? (currentPage - 1) * pageSize + 1 : 0}-
              {Math.min(currentPage * pageSize, filteredTrainers.length)} of {filteredTrainers.length} filtered trainers
            </p>
            <label className="page-size-control">
              Per page
              <select value={pageSize} onChange={(event) => setPageSize(Number(event.target.value))}>
                <option value={8}>8</option>
                <option value={12}>12</option>
                <option value={24}>24</option>
              </select>
            </label>
          </div>
        </div>
      </section>

      <section className="directory-shell">
        {paginatedTrainers.length > 0 ? (
          <>
            <div className="directory-head">
              <div className="directory-col primary">Trainer</div>
              <div className="directory-col meta">Commercial details</div>
              <div className="directory-col action">Action</div>
            </div>

            <div className="directory-body">
              {paginatedTrainers.map((trainer) => {
                const trainerSkills = formatSkills(trainer.skills)
                const trainerDomains = formatTrainingDomains(trainer.trainingDomains)

                return (
                  <article key={trainer.id} className="directory-row">
                    <div className="directory-col primary">
                      <div className="directory-row-topline">
                        <div className="trainer-row-profile">
                          <div className="trainer-avatar">
                            {trainer.profileImage ? (
                              <img src={getAssetUrl(trainer.profileImage)} alt={trainer.name} />
                            ) : (
                              <div className="avatar-placeholder">
                                <FaBriefcase />
                              </div>
                            )}
                          </div>
                          <div>
                            <p className="directory-tag">Public talent profile</p>
                            <h3>{trainer.name}</h3>
                          </div>
                        </div>
                        <span className="status-pill">Available</span>
                      </div>

                      <p className="directory-copy">{trainer.bio || 'No bio available'}</p>

                      <div className="directory-chip-row">
                        {trainerSkills.slice(0, 4).map((skill) => (
                          <span key={skill} className="directory-chip">
                            {skill}
                          </span>
                        ))}
                        {trainerDomains.slice(0, 2).map((domain) => (
                          <span key={domain} className="directory-chip">
                            {domain}
                          </span>
                        ))}
                      </div>
                    </div>

                    <div className="directory-col meta">
                      <div className="directory-meta-item">
                        <FaMapMarkerAlt />
                        <span className="meta-value">{trainer.location || 'Location not specified'}</span>
                      </div>
                      <div className="directory-meta-item">
                        <FaBriefcase />
                        <span className="meta-value">{trainer.experience || '0'} years experience</span>
                      </div>
                      <div className="directory-meta-item">
                        <FaStar />
                        <span className="meta-value">{trainer.rating || '0.0'} / 5 rating</span>
                      </div>
                    </div>

                    <div className="directory-col action">
                      <Link to={`/vendor/trainer/${trainer.id}`} className="directory-action secondary">
                        <FaEye />
                        View profile
                      </Link>
                      <button onClick={() => openInviteModal(trainer)} className="directory-action">
                        <FaPaperPlane />
                        Invite
                      </button>
                    </div>
                  </article>
                )
              })}
            </div>
          </>
        ) : (
          <div className="empty-state">
            <div className="empty-state-icon">🔍</div>
            <h3 className="empty-state-title">No trainers match your filters</h3>
            <p className="empty-state-description">Try adjusting your search criteria to see more trainers.</p>
          </div>
        )}
      </section>

      {filteredTrainers.length > pageSize ? (
        <section className="trainers-pagination">
          <button
            type="button"
            className="pagination-btn"
            onClick={() => setCurrentPage((page) => Math.max(1, page - 1))}
            disabled={currentPage === 1}
          >
            Previous
          </button>

          <div className="pagination-pages">
            {paginationRange.map((page) => (
              <button
                key={page}
                type="button"
                className={`pagination-page ${page === currentPage ? 'active' : ''}`}
                onClick={() => setCurrentPage(page)}
              >
                {page}
              </button>
            ))}
          </div>

          <button
            type="button"
            className="pagination-btn"
            onClick={() => setCurrentPage((page) => Math.min(totalPages, page + 1))}
            disabled={currentPage === totalPages}
          >
            Next
          </button>
        </section>
      ) : null}

      {showInviteModal && selectedTrainer && (
        <div className="modal-overlay">
          <div className="invite-modal">
            <h3>Invite {selectedTrainer.name} to Training</h3>
            <p>Select a training program to invite this trainer to:</p>

            <select
              value={selectedTraining}
              onChange={(e) => setSelectedTraining(e.target.value)}
              className="training-select"
            >
              <option value="">Select a training...</option>
              {trainings.map((training) => (
                <option
                  key={training.id}
                  value={training.id}
                  disabled={isAlreadyInvited(selectedTrainer.id, training.id)}
                >
                  {training.title} - {training.location}
                </option>
              ))}
            </select>

            {selectedTraining && isAlreadyInvited(selectedTrainer.id, selectedTraining) ? (
              <p className="error-message">This trainer has already been invited to the selected training.</p>
            ) : null}

            <div className="modal-actions">
              <button
                onClick={() => {
                  setShowInviteModal(false)
                  setSelectedTrainer(null)
                  setSelectedTraining('')
                }}
                className="cancel-btn"
                disabled={inviting}
              >
                Cancel
              </button>
              <button
                onClick={handleInvite}
                className="invite-confirm-btn"
                disabled={inviting || !selectedTraining}
              >
                {inviting ? 'Sending...' : 'Send Invitation'}
              </button>
            </div>
          </div>
        </div>
      )}
    </Layout>
  )
}

export default BrowseTrainers
