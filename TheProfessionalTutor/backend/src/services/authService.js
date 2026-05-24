import { users } from '../data/store.js'

export function loginUser(email, password, role) {
  const user = users.find(
    (candidate) =>
      candidate.email.toLowerCase() === String(email).toLowerCase() &&
      candidate.password === password &&
      candidate.role === role,
  )

  if (!user) {
    return null
  }

  return {
    id: user.id,
    fullName: user.fullName,
    email: user.email,
    role: user.role,
  }
}

export function registerUser({ fullName, email, phone, password, role }) {
  const existingUser = users.find((candidate) => candidate.email.toLowerCase() === String(email).toLowerCase())

  if (existingUser) {
    return { error: 'An account with this email already exists.' }
  }

  const newUser = {
    id: `${role}-${users.length + 1}`,
    fullName,
    email,
    phone,
    password,
    role,
  }

  users.push(newUser)

  return {
    id: newUser.id,
    fullName: newUser.fullName,
    email: newUser.email,
    role: newUser.role,
  }
}
