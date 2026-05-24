export const tutors = [
  {
    id: 'tutor-1',
    name: 'Riya Sharma',
    subject: 'Mathematics and Olympiad',
    experience: '8 years experience',
    mode: 'Online and in-home',
    rate: 'Rs 650/hr',
    privilegeCode: '11',
    verified: true,
  },
  {
    id: 'tutor-2',
    name: 'Arjun Mehta',
    subject: 'Physics for Class 11-12',
    experience: '6 years experience',
    mode: 'Online only',
    rate: 'Rs 700/hr',
    privilegeCode: '10',
    verified: true,
  },
  {
    id: 'tutor-3',
    name: 'Sara Khan',
    subject: 'English speaking and IELTS',
    experience: '5 years experience',
    mode: 'Weekend batches',
    rate: 'Rs 550/hr',
    privilegeCode: '11',
    verified: true,
  },
]

export const studentRequests = [
  {
    id: 'req-1',
    learner: 'Parent in Kolkata',
    title: 'Need a female home tutor for Class 8 maths and science',
    budget: 'Rs 4,000/month',
    mode: 'Home tuition',
    status: '5 tutor matches',
  },
  {
    id: 'req-2',
    learner: 'Working professional',
    title: 'Looking for evening spoken English classes',
    budget: 'Rs 500/session',
    mode: 'Online',
    status: '3 tutor matches',
  },
]

export const privilegeCodes = [
  { code: '00', title: 'Pending', detail: 'Tutor profile is under review or blocked from active leads.' },
  { code: '01', title: 'Listed only', detail: 'Visible in search, but premium leads stay locked until payment.' },
  { code: '10', title: 'Paid access', detail: 'Tutor can unlock leads while admin fee tracking remains active.' },
  { code: '11', title: 'Premium verified', detail: 'Highest priority listing, fast support, and direct student contact.' },
]

export const dashboardSummary = {
  student: {
    activeRequirements: 4,
    tutorResponses: 19,
    demoClasses: 3,
  },
  tutor: {
    profileScore: '92%',
    callbacks: 14,
    leadCredits: 26,
    privilegeCode: '11',
  },
  admin: {
    pendingTutorApprovals: 28,
    newStudentRequirements: 146,
    collectedAdminFees: 'Rs 84,500',
    disputesResolved: 17,
  },
}

export const users = [
  {
    id: 'student-1',
    fullName: 'Ananya Sen',
    email: 'student@example.com',
    password: 'student123',
    role: 'student',
  },
  {
    id: 'tutor-1',
    fullName: 'Riya Sharma',
    email: 'tutor@example.com',
    password: 'tutor123',
    role: 'tutor',
  },
  {
    id: 'admin-1',
    fullName: 'Platform Admin',
    email: 'admin@example.com',
    password: 'admin123',
    role: 'admin',
  },
]
