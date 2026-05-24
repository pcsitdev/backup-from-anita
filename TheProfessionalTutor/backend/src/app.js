import { privilegeCodes, studentRequests, tutors } from './data/store.js'
import { loginUser, registerUser } from './services/authService.js'
import { getDashboardPayload, getLandingPayload } from './services/dashboardService.js'
import { readJsonBody, sendJson } from './utils/http.js'

function notFound(response) {
  sendJson(response, 404, { message: 'Route not found' })
}

function badRequest(response, message) {
  sendJson(response, 400, { message })
}

export async function handleRequest(request, response) {
  const url = new URL(request.url, 'http://localhost')
  const { pathname } = url

  if (request.method === 'OPTIONS') {
    sendJson(response, 200, { ok: true })
    return
  }

  if (request.method === 'GET' && pathname === '/api/health') {
    sendJson(response, 200, { status: 'ok' })
    return
  }

  if (request.method === 'GET' && pathname === '/api/landing') {
    sendJson(response, 200, getLandingPayload())
    return
  }

  if (request.method === 'GET' && pathname === '/api/tutors') {
    sendJson(response, 200, tutors)
    return
  }

  if (request.method === 'GET' && pathname === '/api/requests') {
    sendJson(response, 200, studentRequests)
    return
  }

  if (request.method === 'GET' && pathname === '/api/privileges') {
    sendJson(response, 200, privilegeCodes)
    return
  }

  if (request.method === 'GET' && pathname.startsWith('/api/dashboard/')) {
    const role = pathname.split('/').at(-1)
    const payload = getDashboardPayload(role)

    if (!payload.summary) {
      badRequest(response, 'Unknown dashboard role.')
      return
    }

    sendJson(response, 200, payload)
    return
  }

  if (request.method === 'POST' && pathname === '/api/auth/login') {
    const body = await readJsonBody(request)

    if (!body.email || !body.password || !body.role) {
      badRequest(response, 'Email, password, and role are required.')
      return
    }

    const user = loginUser(body.email, body.password, body.role)

    if (!user) {
      sendJson(response, 401, { message: 'Invalid credentials.' })
      return
    }

    sendJson(response, 200, { message: 'Login successful.', user })
    return
  }

  if (request.method === 'POST' && pathname === '/api/auth/register') {
    const body = await readJsonBody(request)

    if (!body.fullName || !body.email || !body.password || !body.role) {
      badRequest(response, 'Full name, email, password, and role are required.')
      return
    }

    const result = registerUser(body)

    if (result.error) {
      badRequest(response, result.error)
      return
    }

    sendJson(response, 201, { message: 'Registration successful.', user: result })
    return
  }

  notFound(response)
}
