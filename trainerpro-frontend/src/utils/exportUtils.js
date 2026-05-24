// Professional data export utilities
export const exportToCSV = (data, filename, headers = null) => {
  if (!data || data.length === 0) {
    throw new Error('No data to export')
  }

  // If headers not provided, use object keys from first item
  const csvHeaders = headers || Object.keys(data[0])

  // Create CSV content
  const csvContent = [
    csvHeaders.join(','),
    ...data.map(row =>
      csvHeaders.map(header => {
        const value = row[header] || ''
        // Escape quotes and wrap in quotes if contains comma, quote, or newline
        if (typeof value === 'string' && (value.includes(',') || value.includes('"') || value.includes('\n'))) {
          return `"${value.replace(/"/g, '""')}"`
        }
        return value
      }).join(',')
    )
  ].join('\n')

  // Create and download file
  const blob = new Blob([csvContent], { type: 'text/csv;charset=utf-8;' })
  const link = document.createElement('a')

  if (link.download !== undefined) {
    const url = URL.createObjectURL(blob)
    link.setAttribute('href', url)
    link.setAttribute('download', `${filename}.csv`)
    link.style.visibility = 'hidden'
    document.body.appendChild(link)
    link.click()
    document.body.removeChild(link)
    URL.revokeObjectURL(url)
  }
}

export const exportToJSON = (data, filename) => {
  if (!data) {
    throw new Error('No data to export')
  }

  const jsonContent = JSON.stringify(data, null, 2)
  const blob = new Blob([jsonContent], { type: 'application/json;charset=utf-8;' })
  const link = document.createElement('a')

  if (link.download !== undefined) {
    const url = URL.createObjectURL(blob)
    link.setAttribute('href', url)
    link.setAttribute('download', `${filename}.json`)
    link.style.visibility = 'hidden'
    document.body.appendChild(link)
    link.click()
    document.body.removeChild(link)
    URL.revokeObjectURL(url)
  }
}

export const formatDateForExport = (date) => {
  if (!date) return ''
  const d = new Date(date)
  return d.toLocaleDateString('en-US', {
    year: 'numeric',
    month: 'short',
    day: 'numeric',
    hour: '2-digit',
    minute: '2-digit'
  })
}

export const formatCurrency = (amount, currency = 'USD') => {
  if (amount === null || amount === undefined) return ''
  return new Intl.NumberFormat('en-US', {
    style: 'currency',
    currency: currency
  }).format(amount)
}

// Professional report generation
export const generateVendorReport = (vendorData) => {
  const report = {
    generatedAt: new Date().toISOString(),
    summary: {
      totalRequirements: vendorData.requirements?.length || 0,
      activeRequirements: vendorData.requirements?.filter(r => r.status === 'active').length || 0,
      totalApplications: vendorData.applications?.length || 0,
      successRate: calculateSuccessRate(vendorData),
      totalSpent: vendorData.requirements?.reduce((sum, r) => sum + (r.budget || 0), 0) || 0
    },
    requirements: vendorData.requirements || [],
    applications: vendorData.applications || [],
    cohorts: vendorData.cohorts || []
  }

  return report
}

const calculateSuccessRate = (data) => {
  const totalRequirements = data.requirements?.length || 0
  const completedRequirements = data.requirements?.filter(r => r.status === 'completed').length || 0

  if (totalRequirements === 0) return 0
  return Math.round((completedRequirements / totalRequirements) * 100)
}

// Export formats for different report types
export const REPORT_FORMATS = {
  CSV: 'csv',
  JSON: 'json',
  PDF: 'pdf' // Future implementation
}

export const exportReport = (data, format, filename) => {
  switch (format) {
    case REPORT_FORMATS.CSV:
      return exportToCSV(data, filename)
    case REPORT_FORMATS.JSON:
      return exportToJSON(data, filename)
    default:
      throw new Error(`Unsupported export format: ${format}`)
  }
}