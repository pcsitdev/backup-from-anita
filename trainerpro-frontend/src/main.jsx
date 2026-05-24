import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import { Provider } from "react-redux"
import './index.css'
import AppRoutes from './routes/AppRoutes'
import { store } from './redux/store'
import ErrorBoundary from './components/ErrorBoundary'
import { ToastProvider } from './components/Toast'

createRoot(document.getElementById('root')).render(
  <StrictMode>
    <ErrorBoundary>
      <Provider store={store}>
        <ToastProvider>
          <AppRoutes />
        </ToastProvider>
      </Provider>
    </ErrorBoundary>
  </StrictMode>,
)
