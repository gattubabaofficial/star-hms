import React, { lazy, Suspense } from 'react';
import { BrowserRouter, Routes, Route, Navigate } from 'react-router-dom';
import { QueryClient, QueryClientProvider } from '@tanstack/react-query';
import { ProtectedRoute } from './components/layout/ProtectedRoute';

// Lazy load pages
const Login = lazy(() => import('./pages/Login').then(m => ({ default: m.Login })));
const Signup = lazy(() => import('./pages/Signup').then(m => ({ default: m.Signup })));
const Landing = lazy(() => import('./pages/Landing').then(m => ({ default: m.Landing })));
const HospitalMasters = lazy(() => import('./pages/masters/HospitalMasters').then(m => ({ default: m.HospitalMasters })));
const OPDDashboard = lazy(() => import('./pages/opd/OPDDashboard').then(m => ({ default: m.OPDDashboard })));
const OPDRegistration = lazy(() => import('./pages/opd/OPDRegistration').then(m => ({ default: m.OPDRegistration })));
const OPDBilling = lazy(() => import('./pages/opd/OPDBilling').then(m => ({ default: m.OPDBilling })));
const IPDDashboard = lazy(() => import('./pages/ipd/IPDDashboard').then(m => ({ default: m.IPDDashboard })));
const IPDAdmission = lazy(() => import('./pages/ipd/IPDAdmission').then(m => ({ default: m.IPDAdmission })));
const IPDBilling = lazy(() => import('./pages/ipd/IPDBilling').then(m => ({ default: m.IPDBilling })));
const PharmacyDashboard = lazy(() => import('./pages/pharmacy/PharmacyDashboard').then(m => ({ default: m.PharmacyDashboard })));
const PharmacyMasters = lazy(() => import('./pages/pharmacy/PharmacyMasters').then(m => ({ default: m.PharmacyMasters })));
const StockInward = lazy(() => import('./pages/pharmacy/StockInward').then(m => ({ default: m.StockInward })));
const StockOutward = lazy(() => import('./pages/pharmacy/StockOutward').then(m => ({ default: m.StockOutward })));
const StockRegister = lazy(() => import('./pages/pharmacy/StockRegister').then(m => ({ default: m.StockRegister })));
const StockTransactionView = lazy(() => import('./pages/pharmacy/StockTransactionView').then(m => ({ default: m.StockTransactionView })));
const ReportsHub = lazy(() => import('./pages/reports/ReportsHub').then(m => ({ default: m.ReportsHub })));
const CollectionReport = lazy(() => import('./pages/reports/CollectionReport').then(m => ({ default: m.CollectionReport })));
const ServiceReport = lazy(() => import('./pages/reports/ServiceReport').then(m => ({ default: m.ServiceReport })));
const BedStatusReport = lazy(() => import('./pages/reports/BedStatusReport').then(m => ({ default: m.BedStatusReport })));
const SystemDashboard = lazy(() => import('./pages/system/SystemDashboard').then(m => ({ default: m.SystemDashboard })));
const BackupUtil = lazy(() => import('./pages/system/BackupUtil').then(m => ({ default: m.BackupUtil })));
const LabDashboard = lazy(() => import('./pages/lab/LabDashboard').then(m => ({ default: m.LabDashboard })));
const LabBilling = lazy(() => import('./pages/lab/LabBilling').then(m => ({ default: m.LabBilling })));
const OPDPayment = lazy(() => import('./pages/opd/OPDPayment').then(m => ({ default: m.OPDPayment })));
const OPDRefund = lazy(() => import('./pages/opd/OPDRefund').then(m => ({ default: m.OPDRefund })));
const IPDPayment = lazy(() => import('./pages/ipd/IPDPayment').then(m => ({ default: m.IPDPayment })));
const IPDRefund = lazy(() => import('./pages/ipd/IPDRefund').then(m => ({ default: m.IPDRefund })));
const LabPayment = lazy(() => import('./pages/lab/LabPayment').then(m => ({ default: m.LabPayment })));
const LabRefund = lazy(() => import('./pages/lab/LabRefund').then(m => ({ default: m.LabRefund })));
const IPDBedStatus = lazy(() => import('./pages/ipd/IPDBedStatus').then(m => ({ default: m.IPDBedStatus })));
const OpdReceipt = lazy(() => import('./pages/opd/OpdReceipt').then(m => ({ default: m.OpdReceipt })));
const IpdReceipt = lazy(() => import('./pages/ipd/IpdReceipt').then(m => ({ default: m.IpdReceipt })));
const LabReceipt = lazy(() => import('./pages/lab/LabReceipt').then(m => ({ default: m.LabReceipt })));
const PharmacyReceipt = lazy(() => import('./pages/pharmacy/PharmacyReceipt').then(m => ({ default: m.PharmacyReceipt })));
const SyncDashboard = lazy(() => import('./pages/system/SyncDashboard').then(m => ({ default: m.SyncDashboard })));
const Settings = lazy(() => import('./pages/system/Settings').then(m => ({ default: m.Settings })));
const Dashboard = lazy(() => import('./pages/Dashboard').then(m => ({ default: m.Dashboard })));

const queryClient = new QueryClient();


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

function PageLoader() {
  return (
    <div className="flex items-center justify-center h-screen bg-gray-50/50">
      <div className="w-8 h-8 border-4 border-medical-primary border-t-transparent rounded-full animate-spin"></div>
    </div>
  );
}

function App() {
  return (
    <QueryClientProvider client={queryClient}>
      <BrowserRouter>
        <Suspense fallback={<PageLoader />}>
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
              <Route path="/masters/*" element={<HospitalMasters />} />
              
              {/* Pharmacy */}
              <Route path="pharmacy" element={<PharmacyDashboard />} />
              <Route path="pharmacy/masters" element={<PharmacyMasters />} />
              <Route path="pharmacy/purchase" element={<StockInward />} />
              <Route path="pharmacy/sales" element={<StockOutward />} />
              <Route path="pharmacy/stock" element={<StockRegister />} />
              <Route path="pharmacy/ledger" element={<StockTransactionView />} />
              <Route path="pharmacy/receipt" element={<PharmacyReceipt />} />
              
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
              <Route path="system/settings" element={<Settings />} />
              <Route path="system/backup" element={<BackupUtil />} />
              <Route path="/system/sync-dashboard" element={<SyncDashboard />} />
            </Route>

            <Route path="*" element={<Navigate to="/" replace />} />
          </Routes>
        </Suspense>
      </BrowserRouter>
    </QueryClientProvider>
  );
}

export default App;

