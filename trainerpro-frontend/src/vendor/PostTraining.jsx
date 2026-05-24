import { useEffect, useRef, useState } from 'react'
import Layout from '../components/Layout'
import API from '../services/api'
import {
  locationOnlyGroups,
  modeGroups,
  skillGroups,
  trainingCategoryOptions,
} from '../constants/marketplaceOptions'
import './PostTraining.css'

const normalizeList = (value) => {
  if (!value) return []
  if (Array.isArray(value)) return value.filter(Boolean)
  return String(value)
    .split(',')
    .map((item) => item.trim())
    .filter(Boolean)
}

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
    if (!open) setPanelSearch('')
  }, [open])

  const searchTerm = panelSearch.trim().toLowerCase()
  const visibleGroups = groups
    .map((group) => {
      const options = group.options.filter((option) => {
        if (!searchTerm) return true
        return option.toLowerCase().includes(searchTerm) || group.label.toLowerCase().includes(searchTerm)
      })
      return { ...group, options }
    })
    .filter((group) => group.options.length > 0)

  return (
    <div ref={fieldRef} className="post-multi-select-field">
      <span className="post-multi-select-label">{label}</span>
      <button
        type="button"
        className={`post-multi-select-trigger ${open ? 'open' : ''}`}
        onClick={() => onToggleOpen(!open)}
      >
        <div className="post-multi-select-values">
          {selectedValues.length > 0 ? (
            selectedValues.map((value) => (
              <span key={value} className="post-multi-select-chip" title={value}>
                {value}
                <span
                  className="post-multi-select-chip-remove"
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
            <span className="post-multi-select-placeholder">{placeholder}</span>
          )}
        </div>
        <span className="post-multi-select-caret">▾</span>
      </button>

      {open ? (
        <div className="post-multi-select-panel" onMouseDown={(event) => event.stopPropagation()}>
          <div className="post-multi-select-panel-header">
            <span>{label}</span>
            {selectedValues.length > 0 ? (
              <button type="button" className="post-multi-select-clear" onClick={onClear}>
                Clear
              </button>
            ) : null}
          </div>

          <div className="post-multi-select-panel-search">
            <input
              type="search"
              value={panelSearch}
              onChange={(event) => setPanelSearch(event.target.value)}
              placeholder={`Search ${label.toLowerCase()}...`}
              className="post-multi-select-panel-input"
              onMouseDown={(event) => event.stopPropagation()}
            />
          </div>

          <div className="post-multi-select-groups">
            {visibleGroups.length > 0 ? (
              visibleGroups.map((group) => (
                <div key={group.label} className="post-multi-select-group">
                  <div className="post-multi-select-group-label">{group.label}</div>
                  <div className="post-multi-select-options">
                    {group.options.map((option) => {
                      const isSelected = selectedValues.includes(option)
                      return (
                        <button
                          key={option}
                          type="button"
                          className={`post-multi-select-option ${isSelected ? 'selected' : ''}`}
                          onClick={() => onToggleValue(option)}
                        >
                          <span>{option}</span>
                          <span className="post-multi-select-option-mark">{isSelected ? '✓' : ''}</span>
                        </button>
                      )
                    })}
                  </div>
                </div>
              ))
            ) : (
              <div className="post-multi-select-empty">No matches found for this search.</div>
            )}
          </div>
        </div>
      ) : null}
    </div>
  )
}

const initialForm = {
  title: '',
  description: '',
  category: '',
  categoryOther: '',
  audienceSize: '',
  budget: '',
  duration: '',
}

const PostTraining = () => {
  const [form, setForm] = useState(initialForm)
  const [selectedLocations, setSelectedLocations] = useState([])
  const [selectedModes, setSelectedModes] = useState([])
  const [selectedSkills, setSelectedSkills] = useState([])
  const [openFilter, setOpenFilter] = useState('')
  const [submitting, setSubmitting] = useState(false)
  const [error, setError] = useState('')
  const [success, setSuccess] = useState('')

  const handleChange = (event) => {
    const { name, value } = event.target
    setForm((current) => ({
      ...current,
      [name]: value,
      ...(name === 'category' && value !== 'Other' ? { categoryOther: '' } : {}),
    }))
  }

  const toggleValue = (value, setSelectedValues) => {
    setSelectedValues((currentValues) =>
      currentValues.includes(value)
        ? currentValues.filter((item) => item !== value)
        : [...currentValues, value]
    )
  }

  const clearAll = () => {
    setSelectedLocations([])
    setSelectedModes([])
    setSelectedSkills([])
    setOpenFilter('')
  }

  const handleSubmit = async (event) => {
    event.preventDefault()
    setSubmitting(true)
    setError('')
    setSuccess('')

    try {
      const resolvedCategory =
        form.category === 'Other' ? form.categoryOther.trim() : form.category

      if (!resolvedCategory) {
        setError('Please select a training category or enter a custom one.')
        setSubmitting(false)
        return
      }

      const payload = {
        title: form.title,
        description: form.description,
        category: resolvedCategory,
        audienceSize: form.audienceSize,
        duration: form.duration,
        budget: form.budget ? parseFloat(form.budget) : null,
        location: selectedLocations.join(', '),
        deliveryMode: selectedModes.join(', '),
        skills: selectedSkills,
      }

      await API.post('/trainings', payload)
      setSuccess('Training requirement published successfully.')
      setForm(initialForm)
      clearAll()
    } catch (submitError) {
      console.error('Training submit error:', submitError)
      const responseMessage = submitError.response?.data?.message || submitError.response?.data || submitError.message
      setError(`Error posting training requirement: ${responseMessage}`)
    } finally {
      setSubmitting(false)
    }
  }

  return (
    <Layout>
      <section className="post-training-hero">
        <div>
          <p className="post-training-eyebrow">Vendor workflow</p>
          <h2 className="post-training-title">Create a new training requirement.</h2>
          <p className="post-training-copy">
            Publish a structured commercial brief with searchable location, skills, and delivery mode filters so trainers can respond quickly.
          </p>
        </div>

        <aside className="post-training-note">
          <strong>Commercial note</strong>
          <p>Budget is optional. You can leave it undisclosed and share pricing later.</p>
        </aside>
      </section>

      {success ? <div className="state-banner success">{success}</div> : null}
      {error ? <div className="state-banner error">{error}</div> : null}

      <section className="post-training-shell">
        <form className="post-training-grid" onSubmit={handleSubmit}>
          <label className="product-field wide">
            <span>Training title</span>
            <input
              type="text"
              name="title"
              placeholder="Enterprise React Enablement Program"
              value={form.title}
              onChange={handleChange}
              required
            />
          </label>

          <label className="product-field wide">
            <span>Description</span>
            <textarea
              name="description"
              placeholder="Describe audience profile, business objective, deliverables, and preferred delivery approach."
              value={form.description}
              onChange={handleChange}
              rows="5"
              required
            />
          </label>

          <label className="product-field">
            <span>Training category</span>
            <select name="category" value={form.category} onChange={handleChange} required>
              <option value="">Select category</option>
              {trainingCategoryOptions.map((option) => (
                <option key={option} value={option}>
                  {option}
                </option>
              ))}
            </select>
            {form.category === 'Other' ? (
              <input
                type="text"
                name="categoryOther"
                value={form.categoryOther}
                onChange={handleChange}
                placeholder="Enter custom training category"
                required
              />
            ) : null}
          </label>

          <label className="product-field">
            <span>Audience size</span>
            <select name="audienceSize" value={form.audienceSize} onChange={handleChange} required>
              <option value="">Select audience size</option>
              <option value="5-15 participants">5-15 participants</option>
              <option value="16-40 participants">16-40 participants</option>
              <option value="41-100 participants">41-100 participants</option>
              <option value="100+ participants">100+ participants</option>
            </select>
          </label>

          <label className="product-field">
            <span>Duration</span>
            <select name="duration" value={form.duration} onChange={handleChange} required>
              <option value="">Select duration</option>
              <option value="1-2 days">1-2 days</option>
              <option value="3-5 days">3-5 days</option>
              <option value="1-2 weeks">1-2 weeks</option>
              <option value="2-4 weeks">2-4 weeks</option>
              <option value="Ongoing engagement">Ongoing engagement</option>
            </select>
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
            label="Delivery mode"
            groups={modeGroups}
            selectedValues={selectedModes}
            placeholder="Select one or more modes"
            onToggleValue={(value) => toggleValue(value, setSelectedModes)}
            onClear={() => setSelectedModes([])}
            open={openFilter === 'mode'}
            onToggleOpen={(nextOpen) => setOpenFilter(nextOpen ? 'mode' : '')}
          />

          <MultiSelectField
            label="Required skills"
            groups={skillGroups}
            selectedValues={selectedSkills}
            placeholder="Select one or more skills"
            onToggleValue={(value) => toggleValue(value, setSelectedSkills)}
            onClear={() => setSelectedSkills([])}
            open={openFilter === 'skills'}
            onToggleOpen={(nextOpen) => setOpenFilter(nextOpen ? 'skills' : '')}
          />

          <label className="product-field">
            <span>Budget range</span>
            <select name="budget" value={form.budget} onChange={handleChange}>
              <option value="">Optional: leave undisclosed</option>
              <option value="50000">₹50,000 - ₹100,000</option>
              <option value="150000">₹100,000 - ₹200,000</option>
              <option value="300000">₹200,000 - ₹400,000</option>
              <option value="400000">₹400,000+</option>
            </select>
            <small>Budget is optional and can be shared later in the invitation flow.</small>
          </label>

          <button type="submit" className="post-submit-btn" disabled={submitting}>
            {submitting ? 'Publishing...' : 'Publish training requirement'}
          </button>
        </form>
      </section>
    </Layout>
  )
}

export default PostTraining
