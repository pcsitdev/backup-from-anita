const STORAGE_KEY = 'trainerpro_recent_invitations'

const safeParse = (value) => {
  try {
    return JSON.parse(value)
  } catch {
    return []
  }
}

export const getCachedInvitations = () => {
  if (typeof window === 'undefined') return []
  return safeParse(window.localStorage.getItem(STORAGE_KEY)).filter(Boolean)
}

export const cacheInvitation = (invitation) => {
  if (typeof window === 'undefined' || !invitation) return

  const current = getCachedInvitations()
  const next = [
    {
      ...invitation,
      cachedAt: new Date().toISOString(),
    },
    ...current,
  ].slice(0, 50)

  window.localStorage.setItem(STORAGE_KEY, JSON.stringify(next))
}
