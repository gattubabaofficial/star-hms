import { BrowserRouter as Router, Routes, Route, Navigate } from 'react-router-dom';
import Login from './pages/Login';
import AppShell from './components/layout/AppShell';
import { useAuthStore } from './store/authStore';
import Dashboard from './pages/Dashboard';

// Master Pages
import PatientCategory from './pages/masters/PatientCategory';
import DoctorCategory from './pages/masters/DoctorCategory';
import DoctorMaster from './pages/masters/DoctorMaster';
import ReferralMaster from './pages/masters/ReferralMaster';
import UserRights from './pages/masters/UserRights';

// OPD Pages
import PatientMaster from './pages/opd/PatientMaster';
import Registration from './pages/opd/Registration';
import Billing from './pages/opd/Billing';

// Services Pages
import ServiceGroup from './pages/services/ServiceGroup';
import ServiceMaster from './pages/services/ServiceMaster';

// Lab Pages
import LabBilling from './pages/lab/LabBilling';

// IPD Pages
import InpatientMasters from './pages/ipd/InpatientMasters';
import Admission from './pages/ipd/Admission';
import IpdBilling from './pages/ipd/IpdBilling';
import Reports from './pages/Reports';

// Phase 12: Finance & Pharmacy
import FinanceModule from './pages/finance/FinanceModule';
import PharmacySale from './pages/pharmacy/PharmacySale';
import PharmacyPurchase from './pages/pharmacy/PharmacyPurchase';

// Protected Route Wrapper
const ProtectedRoute = ({ children }: { children: JSX.Element }) => {
  const token = useAuthStore((state) => state.token);
  if (!token) return <Navigate to="/login" replace />;
  return children;
};

function App() {
  const token = useAuthStore((state) => state.token);

  return (
    <Router>
      <Routes>
        <Route path="/login" element={!token ? <Login /> : <Navigate to="/" />} />
        
        <Route path="/" element={<ProtectedRoute><AppShell /></ProtectedRoute>}>
          {/* Default dashboard route */}
          <Route index element={<Dashboard />} />

          {/* Master Routes */}
          <Route path="masters/patient-category" element={<PatientCategory />} />
          <Route path="masters/doctor-category" element={<DoctorCategory />} />
          <Route path="masters/doctor-master" element={<DoctorMaster />} />
          <Route path="masters/referral-master" element={<ReferralMaster />} />
          <Route path="masters/rights" element={<UserRights />} />

          {/* OPD Routes */}
          <Route path="opd/patient-master" element={<PatientMaster />} />
          <Route path="opd/registration" element={<Registration />} />
          <Route path="opd/billing" element={<Billing />} />

          {/* Services Routes */}
          <Route path="services/groups" element={<ServiceGroup />} />
          <Route path="services/master" element={<ServiceMaster />} />

          {/* Lab Routes */}
          <Route path="lab/billing" element={<LabBilling />} />

          {/* IPD Routes */}
          <Route path="ipd/masters" element={<InpatientMasters />} />
          <Route path="ipd/admission" element={<Admission />} />
          <Route path="ipd/billing" element={<IpdBilling />} />

          {/* Reporting Routes */}
          <Route path="reports" element={<Reports />} />

          {/* Finance & Pharmacy Routes (Phase 12) */}
          <Route path="opd/finance" element={<FinanceModule />} />
          <Route path="ipd/finance" element={<FinanceModule />} />
          <Route path="lab/finance" element={<FinanceModule />} />
          <Route path="pharmacy/sales" element={<PharmacySale />} />
          <Route path="pharmacy/purchases" element={<PharmacyPurchase />} />

          {/* Module routing fallbacks */}
          <Route path="*" element={
            <div style={{ padding: 20 }}>
              <h2 style={{ color: '#ff8787' }}>404 - Module Route Not Found</h2>
              <p style={{ color: '#adb5bd' }}>This section is either invalid or under construction.</p>
            </div>
          } />
        </Route>
      </Routes>
    </Router>
  );
}

export default App;
