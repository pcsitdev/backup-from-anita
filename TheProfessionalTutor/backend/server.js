import { createServer } from 'node:http'
import { handleRequest } from './src/app.js'

const port = process.env.PORT || 4000

const server = createServer((request, response) => {
  handleRequest(request, response)
})

server.listen(port, () => {
  console.log(`ProfessionalTutor backend running on http://localhost:${port}`)
})
