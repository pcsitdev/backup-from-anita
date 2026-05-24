import axios from "axios";

const API = axios.create({
  baseURL: "http://localhost:8082/api",
   // baseURL: "https://45.195.159.91:8082/api",
  timeout: 30000, // Increased to 30 seconds for file uploads
});

// Request interceptor
API.interceptors.request.use((req) => {
  const token = localStorage.getItem("token");
  if (token) {
    req.headers.Authorization = `Bearer ${token}`;
  }
  // Don't set Content-Type for FormData - let browser set it with boundary
  if (!(req.data instanceof FormData)) {
    req.headers["Content-Type"] = "application/json";
  }
  return req;
});

// Response interceptor
API.interceptors.response.use(
  (response) => response,
  (error) => {
    if (error.response && error.response.status === 401) {
      alert("Session expired. Please login again.");
      localStorage.removeItem("token");
      window.location.href = "/login";
    }
    return Promise.reject(error);
  }
);

export default API;