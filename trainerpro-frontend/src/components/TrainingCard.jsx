import { FaClock, FaMapMarkerAlt, FaRupeeSign, FaCheck } from 'react-icons/fa'

const TrainingCard = ({ training, onApply }) => {
  const isApplied = training.isApplied || training.applied || training.applicationStatus === 'applied'

  return (
    <article className="training-card">
      <div className="training-card-header">
        <div>
          <p className="training-card-label">
            {isApplied ? '✓ Already Applied' : 'Open opportunity'}
          </p>
          <h3 className="training-card-title">{training.title}</h3>
        </div>
        <span className={`training-status-badge ${isApplied ? 'applied' : ''}`}>
          {isApplied ? 'Applied' : training.status || 'Open'}
        </span>
      </div>

      <p className="training-description">{training.description}</p>

      <div className="training-metadata">
        <div className="metadata-item">
          <FaMapMarkerAlt /> 
          <span className="metadata-label">Location:</span>
          <span className="metadata-value">{training.location}</span>
        </div>
        <div className="metadata-item">
          <FaRupeeSign /> 
          <span className="metadata-label">Budget:</span>
          <span className="metadata-value">₹{training.budget?.toLocaleString?.() || training.budget}</span>
        </div>
        <div className="metadata-item">
          <FaClock /> 
          <span className="metadata-label">Duration:</span>
          <span className="metadata-value">{training.duration}</span>
        </div>
      </div>

      {training.skills && training.skills.length > 0 && (
        <div className="skills-container">
          {training.skills.map((skill, index) => (
            <span key={index} className="skill-tag">
              {skill}
            </span>
          ))}
        </div>
      )}

      <button 
        onClick={() => onApply(training.id)} 
        className={`apply-btn ${isApplied ? 'applied' : ''}`}
        disabled={isApplied}
        title={isApplied ? 'You have already applied to this training' : 'Apply to this training'}
      >
        {isApplied ? (
          <>
            <FaCheck /> Applied
          </>
        ) : (
          'Apply Now'
        )}
      </button>
    </article>
  )
}

export default TrainingCard
