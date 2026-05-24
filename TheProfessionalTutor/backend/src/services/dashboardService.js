import { dashboardSummary, privilegeCodes, studentRequests, tutors } from '../data/store.js'

export function getLandingPayload() {
  return {
    heroTitle: 'Launch a tutor marketplace with onboarding, payments, and role-based dashboards.',
    featuredTutors: tutors,
    privilegeCodes,
  }
}

export function getDashboardPayload(role) {
  return {
    role,
    summary: dashboardSummary[role] ?? null,
    tutors,
    studentRequests,
    privilegeCodes,
  }
}
