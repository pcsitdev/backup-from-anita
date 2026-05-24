import axios from 'axios'

const PublicAPI = axios.create({
  baseURL: 'http://localhost:8082/api',
  timeout: 30000,
})

export default PublicAPI
