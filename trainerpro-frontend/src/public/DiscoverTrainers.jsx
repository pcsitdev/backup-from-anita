import { useEffect, useMemo, useRef, useState } from 'react'
import { Link, useSearchParams } from 'react-router-dom'
import { FaBriefcase, FaMapMarkerAlt, FaSearch, FaShieldAlt, FaSignInAlt, FaStar, FaTag } from 'react-icons/fa'
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

const DiscoverTrainers = () => {
  const [searchParams] = useSearchParams()
  const [trainers, setTrainers] = useState([])
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

    const fetchTrainers = async () => {
      setLoading(true)
      setError('')

      try {
        const response = await PublicAPI.get('/trainers')
        if (!mounted) return

        setTrainers(Array.isArray(response.data) ? response.data : [])
      } catch (fetchError) {
        if (!mounted) return

        console.error('Error loading public trainers:', fetchError)
        setError('We could not load trainers right now. Please sign in to reach the full directory.')
      } finally {
        if (mounted) setLoading(false)
      }
    }

    fetchTrainers()

    return () => {
      mounted = false
    }
  }, [])

  const filteredTrainers = useMemo(() => {
    return trainers.filter((trainer) => {
      const name = String(trainer.name || '').toLowerCase()
      const bio = String(trainer.bio || '').toLowerCase()
      const location = String(trainer.location || '').toLowerCase()
      const skills = normalizeList(trainer.skills).map((skill) => skill.toLowerCase())
      const domains = normalizeList(trainer.trainingDomains).map((domain) => domain.toLowerCase())
      const modes = normalizeList(trainer.trainingModes || trainer.trainingMode || trainer.mode || trainer.modes).map((mode) => mode.toLowerCase())

      const matchesSearch =
        !searchTerm ||
        name.includes(searchTerm.toLowerCase()) ||
        bio.includes(searchTerm.toLowerCase()) ||
        skills.some((skill) => skill.includes(searchTerm.toLowerCase())) ||
        domains.some((domain) => domain.includes(searchTerm.toLowerCase()))

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
  }, [trainers, searchTerm, selectedLocations, selectedSkills, selectedModes])

  const toggleValue = (value, setSelectedValues) => {
    setSelectedValues((currentValues) =>
      currentValues.includes(value)
        ? currentValues.filter((item) => item !== value)
        : [...currentValues, value]
    )
  }

  const stats = [
    { value: String(trainers.length), label: 'Public profiles' },
    { value: String(filteredTrainers.length), label: 'Matching filters' },
    { value: 'Read only', label: 'Before sign-in' },
    { value: 'Secure', label: 'Invite actions' },
  ]

  return (
    <PublicShell>
      <section className="public-discovery-hero">
          <div>
            <p className="public-eyebrow">Vendor hub discovery</p>
            <h1>Search trainers before you log in.</h1>
            <p className="public-hero-copy">
              Vendors can preview trainer profiles, shortlist by expertise and location, and then sign in when they are ready to invite or message.
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
            <Link className="public-cta" to="/login?redirect=/vendor/browse-trainers">
              <FaSignInAlt />
              Sign in to invite
            </Link>
            <Link className="public-cta secondary" to="/register">
              Create an account
            </Link>
            <Link className="public-cta ghost" to="/discover/trainings">
              Browse trainings
            </Link>
          </div>
        </section>

        <section className="public-discovery-panel public-search-panel" aria-label="Trainer filters">
          <div className="public-filter-grid">
            <label className="public-filter-shell public-search-field">
              <span>
                <FaSearch /> Search
              </span>
              <input
                className="public-search-input"
                type="search"
                placeholder="Search names, bios, skills, or domains"
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
        {loading ? <div className="public-state-banner">Loading public trainer profiles...</div> : null}

        <section className="public-discovery-summary">
          <div>
            <strong>
              Showing {filteredTrainers.length} of {trainers.length} profiles
            </strong>
            <p>Public preview is read only. Invites and profile detail actions stay behind sign-in.</p>
          </div>
          <div className="public-discovery-note">
            <strong>Enterprise rule</strong>
            <p>
              Search can be public, but outreach, invitations, and private profile details require authentication.
            </p>
          </div>
        </section>

        {!loading ? (
          <section className="public-list-shell">
            {filteredTrainers.length > 0 ? (
              <>
                <div className="public-list-head">
                  <div className="public-list-col primary">Trainer</div>
                  <div className="public-list-col meta">Commercial details</div>
                  <div className="public-list-col action">Access</div>
                </div>

                <div className="public-list-body">
                  {filteredTrainers.map((trainer) => (
                    <article key={trainer.id} className={`public-list-row ${searchTerm ? 'is-highlighted' : ''}`}>
                      <div className="public-list-col primary">
                        <div className="public-row-topline">
                          <div>
                            <p className="public-row-tag">Public preview</p>
                            <h3>{highlightText(trainer.name, searchTerm)}</h3>
                          </div>
                          <FaShieldAlt aria-hidden="true" className="public-row-lock" />
                        </div>

                        <p className="public-row-copy">
                          {highlightText(trainer.bio || 'Profile details will be visible after sign-in.', searchTerm)}
                        </p>

                        <div className="public-chip-row">
                          {normalizeList(trainer.skills).slice(0, 4).map((skill) => (
                            <span key={skill} className="public-chip">
                              {skill}
                            </span>
                          ))}
                          {normalizeList(trainer.trainingDomains).slice(0, 2).map((domain) => (
                            <span key={domain} className="public-chip">
                              {domain}
                            </span>
                          ))}
                          {normalizeList(trainer.skills).length === 0 && normalizeList(trainer.trainingDomains).length === 0 ? (
                            <span className="public-chip">No skill tags</span>
                          ) : null}
                        </div>
                      </div>

                      <div className="public-list-col meta">
                        <div className="public-meta-item">
                          <FaMapMarkerAlt />
                          <span>{trainer.location || 'Location not specified'}</span>
                        </div>
                        <div className="public-meta-item">
                          <FaBriefcase />
                          <span>{trainer.experience ? `${trainer.experience} years experience` : 'Experience not specified'}</span>
                        </div>
                        <div className="public-meta-item">
                          <FaStar />
                          <span>{trainer.rating ? `${trainer.rating} / 5 rating` : 'No rating yet'}</span>
                        </div>
                      </div>

                      <div className="public-list-col action">
                        <Link className="public-cta row-cta" to="/login?redirect=/vendor/browse-trainers">
                          Sign in to invite
                        </Link>
                      </div>
                    </article>
                  ))}
                </div>
              </>
            ) : (
              <div className="public-discovery-empty">
                <div>
                  <h3>No trainers matched your filters</h3>
                  <p>Try a broader search or sign in to access the full vendor workspace.</p>
                </div>
              </div>
            )}
          </section>
        ) : null}
    </PublicShell>
  )
}

export default DiscoverTrainers
