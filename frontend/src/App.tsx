import { BrowserRouter, Routes, Route, Navigate } from 'react-router-dom';
import { QueryClient, QueryClientProvider } from '@tanstack/react-query';
import { ProtectedRoute } from './components/layout/ProtectedRoute';
import { Login } from './pages/Login';
import { Signup } from './pages/Signup';
import { Landing } from './pages/Landing';
import { HospitalMasters } from './pages/masters/HospitalMasters';
import { OPDDashboard } from './pages/opd/OPDDashboard';
import { OPDRegistration } from './pages/opd/OPDRegistration';
import { OPDBilling } from './pages/opd/OPDBilling';
import { IPDDashboard } from './pages/ipd/IPDDashboard';
import { IPDAdmission } from './pages/ipd/IPDAdmission';
import { IPDBilling } from './pages/ipd/IPDBilling';
import { PharmacyDashboard } from './pages/pharmacy/PharmacyDashboard';
import { PharmacyMasters } from './pages/pharmacy/PharmacyMasters';
import { StockInward } from './pages/pharmacy/StockInward';
import { StockOutward } from './pages/pharmacy/StockOutward';
import { StockRegister } from './pages/pharmacy/StockRegister';
import { ReportsHub } from './pages/reports/ReportsHub';
import { CollectionReport } from './pages/reports/CollectionReport';
import { ServiceReport } from './pages/reports/ServiceReport';
import { BedStatusReport } from './pages/reports/BedStatusReport';
import { SystemDashboard } from './pages/system/SystemDashboard';
import { BackupUtil } from './pages/system/BackupUtil';
import { LabDashboard } from './pages/lab/LabDashboard';
import { LabBilling } from './pages/lab/LabBilling';
import { OPDPayment } from './pages/opd/OPDPayment';
import { OPDRefund } from './pages/opd/OPDRefund';
import { IPDPayment } from './pages/ipd/IPDPayment';
import { IPDRefund } from './pages/ipd/IPDRefund';
import { LabPayment } from './pages/lab/LabPayment';
import { LabRefund } from './pages/lab/LabRefund';
import { IPDBedStatus } from './pages/ipd/IPDBedStatus';
import { OpdReceipt } from './pages/opd/OpdReceipt';
import { IpdReceipt } from './pages/ipd/IpdReceipt';
import { LabReceipt } from './pages/lab/LabReceipt';
import { SyncDashboard } from './pages/system/SyncDashboard';

const queryClient = new QueryClient();

function Dashboard() {
  return (
    <div className="space-y-6">
      <h1 className="text-2xl font-semibold text-medical-text">Dashboard</h1>
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
        {/* Placeholder cards */}
        {['OPD Patients Today', 'IPD Admissions', 'Lab Reports Pending', 'Pharmacy Sales'].map((title, i) => (
          <div key={i} className="card">
            <h3 className="text-sm font-medium text-gray-500 mb-2">{title}</h3>
            <p className="text-3xl font-bold text-medical-mutedblue">--</p>
          </div>
        ))}
      </div>
    </div>
  );
}

function PlaceholderPage({ title }: { title: string }) {
  return (
    <div className="flex items-center justify-center h-full">
      <div className="text-center">
        <h2 className="text-xl font-semibold text-gray-400 mb-2">{title}</h2>
        <p className="text-sm text-gray-500">Module under construction.</p>
      </div>
    </div>
  );
}

function App() {
  return (
    <QueryClientProvider client={queryClient}>
      <BrowserRouter>
        <Routes>
          {/* Public Routes */}
          <Route path="/" element={<Landing />} />
          <Route path="/login" element={<Login />} />
          <Route path="/signup" element={<Signup />} />
          
          {/* Protected Routes Wrapper */}
          <Route element={<ProtectedRoute />}>
            <Route path="/dashboard" element={<Dashboard />} />
            
            {/* OPD Routes */}
            <Route path="/opd" element={<OPDDashboard />} />
            <Route path="/opd/registration" element={<OPDRegistration />} />
            <Route path="/opd/billing" element={<OPDBilling />} />
            <Route path="/opd/payment" element={<OPDPayment />} />
            <Route path="/opd/refund" element={<OPDRefund />} />
            <Route path="/opd/receipt" element={<OpdReceipt />} />
            
            {/* IPD Routes */}
            <Route path="/ipd" element={<IPDDashboard />} />
            <Route path="/ipd/bed-status" element={<IPDBedStatus />} />
            <Route path="/ipd/admission" element={<IPDAdmission />} />
            <Route path="/ipd/billing" element={<IPDBilling />} />
            <Route path="/ipd/payment" element={<IPDPayment />} />
            <Route path="/ipd/refund" element={<IPDRefund />} />
            <Route path="/ipd/receipt" element={<IpdReceipt />} />
            
            {/* Masters */}
            <Route path="/masters" element={<HospitalMasters />} />
            
            {/* Pharmacy */}
            <Route path="pharmacy" element={<PharmacyDashboard />} />
            <Route path="pharmacy/masters" element={<PharmacyMasters />} />
            <Route path="pharmacy/purchase" element={<StockInward />} />
            <Route path="pharmacy/sales" element={<StockOutward />} />
            <Route path="pharmacy/stock" element={<StockRegister />} />
            
            {/* Reports */}
            <Route path="/reports" element={<ReportsHub />} />
            <Route path="/reports/collection" element={<CollectionReport />} />
            <Route path="/reports/services" element={<ServiceReport />} />
            <Route path="/reports/bed-status" element={<BedStatusReport />} />
            
            {/* Laboratory */}
            <Route path="/lab" element={<LabDashboard />} />
            <Route path="/lab/billing" element={<LabBilling />} />
            <Route path="/lab/payment" element={<LabPayment />} />
            <Route path="/lab/refund" element={<LabRefund />} />
            <Route path="/lab/receipt" element={<LabReceipt />} />
            
            {/* System */}
            <Route path="system" element={<SystemDashboard />} />
            <Route path="system/backup" element={<BackupUtil />} />
            <Route path="/system/sync-dashboard" element={<SyncDashboard />} />
          </Route>

          <Route path="*" element={<Navigate to="/" replace />} />
        </Routes>
      </BrowserRouter>
    </QueryClientProvider>
  );
}

export default App;
