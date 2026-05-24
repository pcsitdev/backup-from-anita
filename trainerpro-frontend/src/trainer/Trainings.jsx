import { useEffect, useRef, useState } from 'react'
import { FaCompass, FaSearch } from 'react-icons/fa'
import Layout from '../components/Layout'
import API from '../services/api'
import { locationOnlyGroups, modeGroups, skillGroups } from '../constants/marketplaceOptions'
import './Trainings.css'

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
    <div ref={fieldRef} className="multi-select-field">
      <span className="multi-select-label">{label}</span>
      <button
        type="button"
        className={`multi-select-trigger ${open ? 'open' : ''}`}
        onClick={() => onToggleOpen(!open)}
      >
        <div className="multi-select-values">
          {selectedValues.length > 0 ? (
            selectedValues.map((value) => (
              <span key={value} className="multi-select-chip" title={value}>
                {value}
                <span
                  className="multi-select-chip-remove"
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
            <span className="multi-select-placeholder">{placeholder}</span>
          )}
        </div>
        <span className="multi-select-caret">▾</span>
      </button>

      {open ? (
        <div
          className="multi-select-panel"
          onMouseDown={(event) => event.stopPropagation()}
        >
          <div className="multi-select-panel-header">
            <span>{label}</span>
            {selectedValues.length > 0 ? (
              <button type="button" className="multi-select-clear" onClick={onClear}>
                Clear
              </button>
            ) : null}
          </div>

          <div className="multi-select-panel-search">
            <input
              type="search"
              value={panelSearch}
              onChange={(event) => setPanelSearch(event.target.value)}
              placeholder={`Search ${label.toLowerCase()}...`}
              className="multi-select-panel-input"
              onMouseDown={(event) => event.stopPropagation()}
            />
          </div>

          <div className="multi-select-groups">
            {visibleGroups.length > 0 ? (
              visibleGroups.map((group) => (
                <div key={group.label} className="multi-select-group">
                  <div className="multi-select-group-label">{group.label}</div>
                  <div className="multi-select-options">
                    {group.options.map((option) => {
                      const isSelected = selectedValues.includes(option)

                      return (
                        <button
                          key={option}
                          type="button"
                          className={`multi-select-option ${isSelected ? 'selected' : ''}`}
                          onClick={() => onToggleValue(option)}
                        >
                          <span>{option}</span>
                          <span className="multi-select-option-mark">{isSelected ? '✓' : ''}</span>
                        </button>
                      )
                    })}
                  </div>
                </div>
              ))
            ) : (
              <div className="multi-select-empty">No matches found for this search.</div>
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

const Trainings = () => {
  const [trainings, setTrainings] = useState([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState('')
  const [success, setSuccess] = useState('')
  const [searchTerm, setSearchTerm] = useState('')
  const [selectedLocations, setSelectedLocations] = useState([])
  const [selectedSkills, setSelectedSkills] = useState([])
  const [selectedModes, setSelectedModes] = useState([])
  const [openFilter, setOpenFilter] = useState('')
  const [appliedTrainings, setAppliedTrainings] = useState(new Set())

  const fetchTrainings = async () => {
    setLoading(true)
    setError('')

    try {
      const response = await API.get('/trainings')
      setTrainings(response.data)

      try {
        const applicationsResponse = await API.get('/applications/my-applications')
        const appliedIds = new Set(applicationsResponse.data.map((app) => app.trainingId))
        setAppliedTrainings(appliedIds)
      } catch (appError) {
        console.log('Could not fetch applications:', appError)
      }
    } catch (fetchError) {
      console.error('Error fetching trainings', fetchError)
      setError('Unable to load training opportunities right now.')
    } finally {
      setLoading(false)
    }
  }

  useEffect(() => {
    fetchTrainings()
  }, [])

  const filteredTrainings = trainings.filter((training) => {
    const matchesSearch =
      !searchTerm ||
      training.title.toLowerCase().includes(searchTerm.toLowerCase()) ||
      training.description.toLowerCase().includes(searchTerm.toLowerCase())

    const locationText = String(training.location || '').toLowerCase()
    const matchesLocation =
      selectedLocations.length === 0 ||
      selectedLocations.some((location) => locationText.includes(location.toLowerCase()))

    const trainingModes = normalizeList(
      training.deliveryMode || training.deliveryModes || training.mode || training.modes
    ).map((mode) => mode.toLowerCase())
    const matchesMode =
      selectedModes.length === 0 ||
      trainingModes.some((mode) =>
        selectedModes.some((selectedMode) => mode === selectedMode.toLowerCase())
      )

    const matchesSkill =
      selectedSkills.length === 0 ||
      training.skills?.some((skill) =>
        selectedSkills.some((selectedSkill) => skill.toLowerCase() === selectedSkill.toLowerCase())
      )

    return matchesSearch && matchesLocation && matchesMode && matchesSkill
  })

  const clearFilters = () => {
    setSearchTerm('')
    setSelectedLocations([])
    setSelectedSkills([])
    setSelectedModes([])
    setOpenFilter('')
  }

  const toggleValue = (value, setSelectedValues) => {
    setSelectedValues((currentValues) =>
      currentValues.includes(value)
        ? currentValues.filter((item) => item !== value)
        : [...currentValues, value]
    )
  }

  const toggleLocation = (value) => {
    toggleValue(value, setSelectedLocations)
  }

  const toggleSkill = (value) => {
    toggleValue(value, setSelectedSkills)
  }

  const toggleMode = (value) => {
    toggleValue(value, setSelectedModes)
  }

  const stats = [
    {
      value: String(trainings.length),
      label: 'Open opportunities',
      accent: '#fff1d6',
      border: '#ffb703',
      text: '#7a4b00',
    },
    {
      value: String(filteredTrainings.length),
      label: 'Matched results',
      accent: '#def8f4',
      border: '#0e8d9a',
      text: '#0b5f68',
    },
    {
      value: String(appliedTrainings.size),
      label: 'Submitted applications',
      accent: '#e4efff',
      border: '#1a63d1',
      text: '#123b68',
    },
  ]

  const handleApply = async (id) => {
    setSuccess('')
    setError('')

    try {
      await API.post(`/applications/apply/${id}`)
      setSuccess('Application submitted successfully.')
    } catch (applyError) {
      setError('Already applied or an error occurred while submitting.')
    }
  }

  return (
    <Layout>
      <section className="trainings-hero">
        <div className="trainings-hero-copy trainings-hero-main">
          <p className="trainings-eyebrow">Marketplace discovery</p>
          <h2 className="trainings-page-title">Discover active training opportunities.</h2>
          <p className="trainings-copy">
            Browse open requirements from vendors, compare fit at a glance, and apply to the programs
            that match your expertise, delivery mode, and availability.
          </p>
          <div className="hero-badges">
            <span>Commercial ready</span>
            <span>High-signal search</span>
            <span>Vendor verified</span>
            <span>Fast apply flow</span>
          </div>
          <div className="trainings-hero-banner" aria-label="Training directory stats">
            {stats.map((item) => (
              <article
                key={item.label}
                className="hero-stat hero-stat-inline"
                style={{
                  background: item.accent,
                  borderColor: item.border,
                }}
              >
                <strong style={{ color: item.text }}>{item.value}</strong>
                <span style={{ color: item.text }}>{item.label}</span>
              </article>
            ))}
          </div>
        </div>
      </section>

      <section className="filter-section">
        <div className="filter-controls">
          <div className="filters-hero-bar">
            <div className="search-box">
              <FaSearch className="search-icon" />
              <input
                type="text"
                placeholder="Search trainings by title or description..."
                value={searchTerm}
                onChange={(e) => setSearchTerm(e.target.value)}
                className="search-input"
              />
            </div>

            <div className="filters-summary filters-summary-compact market-summary">
              <strong>{filteredTrainings.length}</strong>
              <span>matching opportunities</span>
            </div>
          </div>

          <div className="filter-row">
            <MultiSelectField
              label="Location"
              groups={locationOnlyGroups}
              selectedValues={selectedLocations}
              placeholder="Select one or more locations"
              onToggleValue={toggleLocation}
              onClear={() => setSelectedLocations([])}
              open={openFilter === 'location'}
              onToggleOpen={(nextOpen) => setOpenFilter(nextOpen ? 'location' : '')}
            />

            <MultiSelectField
              label="Skills"
              groups={skillGroups}
              selectedValues={selectedSkills}
              placeholder="Select one or more skills"
              onToggleValue={toggleSkill}
              onClear={() => setSelectedSkills([])}
              open={openFilter === 'skills'}
              onToggleOpen={(nextOpen) => setOpenFilter(nextOpen ? 'skills' : '')}
            />

            <MultiSelectField
              label="Mode"
              groups={modeGroups}
              selectedValues={selectedModes}
              placeholder="Select one or more modes"
              onToggleValue={toggleMode}
              onClear={() => setSelectedModes([])}
              open={openFilter === 'mode'}
              onToggleOpen={(nextOpen) => setOpenFilter(nextOpen ? 'mode' : '')}
            />

            <button onClick={clearFilters} className="clear-filters-btn">
              Clear Filters
            </button>
          </div>
        </div>

        <div className="filter-results">
          <p>
            Showing {filteredTrainings.length} of {trainings.length} trainings
          </p>
        </div>
      </section>

      {loading ? <div className="state-banner info">Loading training opportunities...</div> : null}
      {success ? <div className="state-banner success">{success}</div> : null}
      {error ? <div className="state-banner error">{error}</div> : null}

      {!loading ? (
        <section className="directory-shell">
          {filteredTrainings.length > 0 ? (
            <>
              <div className="directory-head">
                <div className="directory-col primary">Training</div>
                <div className="directory-col meta">Commercial details</div>
                <div className="directory-col action">Action</div>
              </div>

              <div className="directory-body">
                {filteredTrainings.map((training) => {
                  const isApplied = appliedTrainings.has(training.id)
                  const skillList = Array.isArray(training.skills) ? training.skills : []

                  return (
                    <article key={training.id} className={`directory-row ${isApplied ? 'is-applied' : ''}`}>
                      <div className="directory-col primary">
                        <div className="directory-row-topline">
                          <div>
                            <p className="directory-tag">{isApplied ? 'Already applied' : 'Open opportunity'}</p>
                            <h3>{training.title}</h3>
                          </div>
                          <span className={`status-pill ${isApplied ? 'applied' : ''}`}>
                            {isApplied ? 'Applied' : 'Open'}
                          </span>
                        </div>
                        <p className="directory-copy">{training.description}</p>
                        {skillList.length > 0 ? (
                          <div className="directory-chip-row">
                            {skillList.slice(0, 5).map((skill) => (
                              <span key={skill} className="directory-chip">
                                {skill}
                              </span>
                            ))}
                          </div>
                        ) : null}
                      </div>

                      <div className="directory-col meta">
                        <div className="directory-meta-item">
                          <span className="meta-label">Location</span>
                          <span className="meta-value">{training.location || 'Not specified'}</span>
                        </div>
                        {training.budget ? (
                          <div className="directory-meta-item">
                            <span className="meta-label">Budget</span>
                            <span className="meta-value">
                              INR {training.budget.toLocaleString?.() || training.budget}
                            </span>
                          </div>
                        ) : null}
                        <div className="directory-meta-item">
                          <span className="meta-label">Duration</span>
                          <span className="meta-value">{training.duration || 'Not specified'}</span>
                        </div>
                      </div>

                      <div className="directory-col action">
                        <button
                          onClick={() => handleApply(training.id)}
                          className={`directory-action ${isApplied ? 'applied' : ''}`}
                          disabled={isApplied}
                          title={isApplied ? 'You have already applied to this training' : 'Apply to this training'}
                        >
                          {isApplied ? 'Applied' : 'Apply now'}
                        </button>
                      </div>
                    </article>
                  )
                })}
              </div>
            </>
          ) : (
            <div
              className="empty-state"
              style={{
                background:
                  'linear-gradient(135deg, rgba(11, 31, 57, 0.98), rgba(14, 141, 154, 0.84))',
                borderTop: '4px solid #1a63d1',
                boxShadow: '0 18px 36px rgba(25, 56, 98, 0.18)',
                color: '#ffffff',
              }}
            >
              <div
                className="empty-state-icon"
                style={{
                  background: 'rgba(255,255,255,0.16)',
                  color: '#ffffff',
                  width: '72px',
                  height: '72px',
                  borderRadius: '22px',
                  boxShadow: '0 16px 30px rgba(0, 0, 0, 0.16)',
                }}
              >
                <FaCompass />
              </div>
              <div className="empty-state-kicker" style={{ background: 'rgba(255,255,255,0.16)', color: '#ffffff' }}>
                Search results
              </div>
              <h3 className="empty-state-title" style={{ color: '#ffffff' }}>
                No trainings match your filters
              </h3>
              <p className="empty-state-description" style={{ color: 'rgba(255,255,255,0.85)' }}>
                Try adjusting your search criteria to see more opportunities.
              </p>
              <button type="button" className="empty-state-reset" onClick={clearFilters}>
                Clear filters
              </button>
            </div>
          )}
        </section>
      ) : null}
    </Layout>
  )
}

export default Trainings
