import { useEffect, useMemo, useRef, useState } from 'react'
import { Link, useSearchParams } from 'react-router-dom'
import { FaClock, FaMapMarkerAlt, FaSearch, FaShieldAlt, FaSignInAlt, FaRupeeSign, FaTag } from 'react-icons/fa'
import PublicAPI from '../services/publicApi'
import PublicShell from './PublicShell'
import { locationOnlyGroups, modeGroups, skillGroups } from '../constants/marketplaceOptions'
import './Discovery.css'

const normalizeList = (value) => {
  if (!value) return []
  if (Array.isArray(value)) return value.filter(Boolean)
  return String(value)
    .split(',')
    .map((item) => item.trim())
    .filter(Boolean)
}

const highlightText = (text, query) => {
  const value = String(text || '')
  const term = String(query || '').trim()

  if (!term) return value

  const lowerValue = value.toLowerCase()
  const lowerTerm = term.toLowerCase()
  const parts = []
  let cursor = 0
  let index = lowerValue.indexOf(lowerTerm)

  while (index !== -1) {
    if (index > cursor) {
      parts.push(value.slice(cursor, index))
    }

    parts.push(
      <mark key={`${index}-${cursor}`} className="search-highlight">
        {value.slice(index, index + term.length)}
      </mark>
    )

    cursor = index + term.length
    index = lowerValue.indexOf(lowerTerm, cursor)
  }

  if (cursor < value.length) {
    parts.push(value.slice(cursor))
  }

  return parts.length > 0 ? parts : value
}

const getParamValue = (params, key) => params.get(key) || ''

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
    <div ref={fieldRef} className="public-multi-select-field">
      <span className="public-filter-label">{label}</span>
      <button
        type="button"
        className={`public-multi-select-trigger ${open ? 'open' : ''}`}
        onClick={() => onToggleOpen(!open)}
      >
        <div className="public-multi-select-values">
          {selectedValues.length > 0 ? (
            selectedValues.map((value) => (
              <span key={value} className="public-multi-select-chip" title={value}>
                {value}
                <span
                  className="public-multi-select-chip-remove"
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
            <span className="public-multi-select-placeholder">{placeholder}</span>
          )}
        </div>
        <span className="public-multi-select-caret">▾</span>
      </button>

      {open ? (
        <div
          className="public-multi-select-panel"
          onMouseDown={(event) => event.stopPropagation()}
        >
          <div className="public-multi-select-panel-header">
            <span>{label}</span>
            {selectedValues.length > 0 ? (
              <button type="button" className="public-multi-select-clear" onClick={onClear}>
                Clear
              </button>
            ) : null}
          </div>

          <div className="public-multi-select-panel-search">
            <input
              type="search"
              value={panelSearch}
              onChange={(event) => setPanelSearch(event.target.value)}
              placeholder={`Search ${label.toLowerCase()}...`}
              className="public-multi-select-panel-input"
              onMouseDown={(event) => event.stopPropagation()}
            />
          </div>

          <div className="public-multi-select-groups">
            {visibleGroups.length > 0 ? (
              visibleGroups.map((group) => (
                <div key={group.label} className="public-multi-select-group">
                  <div className="public-multi-select-group-label">{group.label}</div>
                  <div className="public-multi-select-options">
                    {group.options.map((option) => {
                      const isSelected = selectedValues.includes(option)

                      return (
                        <button
                          key={option}
                          type="button"
                          className={`public-multi-select-option ${isSelected ? 'selected' : ''}`}
                          onClick={() => onToggleValue(option)}
                        >
                          <span>{option}</span>
                          <span className="public-multi-select-option-mark">{isSelected ? '✓' : ''}</span>
                        </button>
                      )
                    })}
                  </div>
                </div>
              ))
            ) : (
              <div className="public-multi-select-empty">No matches found for this search.</div>
            )}
          </div>
        </div>
      ) : null}
    </div>
  )
}

const DiscoverTrainings = () => {
  const [searchParams] = useSearchParams()
  const [trainings, setTrainings] = useState([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState('')
  const [searchTerm, setSearchTerm] = useState(getParamValue(searchParams, 'q'))
  const [selectedLocations, setSelectedLocations] = useState(
    getParamValue(searchParams, 'location') ? [getParamValue(searchParams, 'location')] : []
  )
  const [selectedSkills, setSelectedSkills] = useState(
    getParamValue(searchParams, 'skill') ? [getParamValue(searchParams, 'skill')] : []
  )
  const [selectedModes, setSelectedModes] = useState(
    getParamValue(searchParams, 'mode') ? [getParamValue(searchParams, 'mode')] : []
  )
  const [openFilter, setOpenFilter] = useState('')

  useEffect(() => {
    let mounted = true

    const fetchTrainings = async () => {
      setLoading(true)
      setError('')

      try {
        const response = await PublicAPI.get('/trainings')
        if (!mounted) return

        setTrainings(Array.isArray(response.data) ? response.data : [])
      } catch (fetchError) {
        if (!mounted) return

        console.error('Error loading public trainings:', fetchError)
        setError('We could not load trainings right now. Please sign in to reach the full directory.')
      } finally {
        if (mounted) setLoading(false)
      }
    }

    fetchTrainings()

    return () => {
      mounted = false
    }
  }, [])

  const filteredTrainings = useMemo(() => {
    return trainings.filter((training) => {
      const title = String(training.title || '').toLowerCase()
      const description = String(training.description || '').toLowerCase()
      const location = String(training.location || '').toLowerCase()
      const skills = normalizeList(training.skills).map((skill) => skill.toLowerCase())
      const modes = normalizeList(
        training.deliveryMode || training.deliveryModes || training.mode || training.modes
      ).map((mode) => mode.toLowerCase())

      const matchesSearch =
        !searchTerm ||
        title.includes(searchTerm.toLowerCase()) ||
        description.includes(searchTerm.toLowerCase()) ||
        skills.some((skill) => skill.includes(searchTerm.toLowerCase()))

      const matchesLocation =
        selectedLocations.length === 0 ||
        selectedLocations.some((selectedLocation) => location.includes(selectedLocation.toLowerCase()))
      const matchesSkill =
        selectedSkills.length === 0 ||
        skills.some((skill) =>
          selectedSkills.some((selectedSkill) => skill === selectedSkill.toLowerCase())
        )
      const matchesMode =
        selectedModes.length === 0 ||
        modes.some((mode) => selectedModes.some((selectedMode) => mode === selectedMode.toLowerCase()))

      return matchesSearch && matchesLocation && matchesSkill && matchesMode
    })
  }, [trainings, searchTerm, selectedLocations, selectedSkills, selectedModes])

  const toggleValue = (value, setSelectedValues) => {
    setSelectedValues((currentValues) =>
      currentValues.includes(value)
        ? currentValues.filter((item) => item !== value)
        : [...currentValues, value]
    )
  }

  const stats = [
    { value: String(trainings.length), label: 'Public listings' },
    { value: String(filteredTrainings.length), label: 'Matching filters' },
    { value: 'Read only', label: 'Before sign-in' },
    { value: 'Secure', label: 'Write actions' },
  ]

  return (
    <PublicShell>
        <section className="public-discovery-hero">
          <div>
            <p className="public-eyebrow">Trainer hub discovery</p>
            <h1>Search training opportunities before you sign in.</h1>
            <p className="public-hero-copy">
              Trainers can review open opportunities, filter by location and skills, and then log in only when they are ready to apply.
            </p>
          </div>

          <div className="public-kpi-grid" aria-label="Public discovery stats">
            {stats.map((item) => (
              <article key={item.label} className="public-kpi">
                <strong>{item.value}</strong>
                <span>{item.label}</span>
              </article>
            ))}
          </div>

          <div className="public-cta-row">
            <Link className="public-cta" to="/login?redirect=/trainer/trainings">
              <FaSignInAlt />
              Sign in to apply
            </Link>
            <Link className="public-cta secondary" to="/register">
              Create an account
            </Link>
            <Link className="public-cta ghost" to="/discover/trainers">
              Browse trainers
            </Link>
          </div>
        </section>

        <section className="public-discovery-panel public-search-panel" aria-label="Training filters">
          <div className="public-filter-grid">
            <label className="public-filter-shell public-search-field">
              <span>
                <FaSearch /> Search
              </span>
              <input
                className="public-search-input"
                type="search"
                placeholder="Search titles, descriptions, or skills"
                value={searchTerm}
                onChange={(event) => setSearchTerm(event.target.value)}
              />
            </label>

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
        </section>

        {error ? <div className="public-state-banner error">{error}</div> : null}
        {loading ? <div className="public-state-banner">Loading public training listings...</div> : null}

        <section className="public-discovery-summary">
          <div>
            <strong>
              Showing {filteredTrainings.length} of {trainings.length} listings
            </strong>
            <p>Public preview is read only. Apply actions stay behind sign-in.</p>
          </div>
          <div className="public-discovery-note">
            <strong>Enterprise rule</strong>
            <p>
              Search is open, but submission, messaging, and workflow actions require authentication.
            </p>
          </div>
        </section>

        {!loading ? (
          <section className="public-list-shell">
            {filteredTrainings.length > 0 ? (
              <>
                <div className="public-list-head">
                  <div className="public-list-col primary">Training</div>
                  <div className="public-list-col meta">Commercial details</div>
                  <div className="public-list-col action">Access</div>
                </div>

                <div className="public-list-body">
                  {filteredTrainings.map((training) => (
                    <article key={training.id} className={`public-list-row ${searchTerm ? 'is-highlighted' : ''}`}>
                      <div className="public-list-col primary">
                        <div className="public-row-topline">
                          <div>
                            <p className="public-row-tag">Public preview</p>
                            <h3>{highlightText(training.title, searchTerm)}</h3>
                          </div>
                          <FaShieldAlt aria-hidden="true" className="public-row-lock" />
                        </div>
                        <p className="public-row-copy">
                          {highlightText(training.description || 'Training details will be available after sign-in.', searchTerm)}
                        </p>
                        <div className="public-chip-row">
                          {normalizeList(training.skills).slice(0, 4).map((skill) => (
                            <span key={skill} className="public-chip">
                              {skill}
                            </span>
                          ))}
                          {normalizeList(training.skills).length === 0 ? (
                            <span className="public-chip">No skill tags</span>
                          ) : null}
                        </div>
                      </div>

                      <div className="public-list-col meta">
                        <div className="public-meta-item">
                          <FaMapMarkerAlt />
                          <span>{training.location || 'Location not specified'}</span>
                        </div>
                        <div className="public-meta-item">
                          <FaRupeeSign />
                          <span>{training.budget ? `INR ${training.budget}` : 'Budget not disclosed'}</span>
                        </div>
                        <div className="public-meta-item">
                          <FaClock />
                          <span>{training.duration || 'Duration not specified'}</span>
                        </div>
                      </div>

                      <div className="public-list-col action">
                        <Link className="public-cta row-cta" to="/login?redirect=/trainer/trainings">
                          Sign in to apply
                        </Link>
                      </div>
                    </article>
                  ))}
                </div>
              </>
            ) : (
              <div className="public-discovery-empty">
                <div>
                  <h3>No trainings matched your filters</h3>
                  <p>Try a broader search or sign in to see your full trainer workspace.</p>
                </div>
              </div>
            )}
          </section>
        ) : null}
    </PublicShell>
  )
}

export default DiscoverTrainings
