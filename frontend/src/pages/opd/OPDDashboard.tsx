import { useQuery } from '@tanstack/react-query';
import api from '../../lib/api';
import { Users, Receipt, TrendingUp, Calendar } from 'lucide-react';
import { Link } from 'react-router-dom';

interface OPDReg {
  OpgCode: number;
  OpgVchNo: number;
  OpgDate: string;
  OpgPttCode: number;
  OpgAmtAftDisc: number;
}

export function OPDDashboard() {
  const { data: registrations, isLoading } = useQuery({
    queryKey: ['opd-registrations'],
    queryFn: async () => (await api.get<OPDReg[]>('/opd/registrations')).data
  });

  const todayCount = registrations?.length || 0;
  const todayRevenue = registrations?.reduce((sum, r) => sum + r.OpgAmtAftDisc, 0) || 0;

  return (
    <div className="space-y-6">
      <div className="flex justify-between items-end">
        <div>
          <h1 className="text-2xl font-bold text-medical-text">OPD Dashboard</h1>
          <p className="text-gray-500 text-sm mt-1">Overview of Outpatient Department</p>
        </div>
        <div className="flex gap-3">
          <Link to="/opd/registration" className="btn-primary flex items-center gap-2">
            <Users size={18} /> New Registration
          </Link>
          <Link to="/opd/billing" className="btn-success flex items-center gap-2">
            <Receipt size={18} /> New Bill
          </Link>
        </div>
      </div>

      <div className="grid grid-cols-1 md:grid-cols-4 gap-4">
        <div className="card flex items-center gap-4">
          <div className="p-3 bg-blue-50 text-medical-mutedblue rounded-lg"><Users size={24} /></div>
          <div>
            <h3 className="text-sm font-medium text-gray-500">Today's Patients</h3>
            <p className="text-2xl font-bold text-gray-800">{todayCount}</p>
          </div>
        </div>
        <div className="card flex items-center gap-4">
          <div className="p-3 bg-green-50 text-green-600 rounded-lg"><TrendingUp size={24} /></div>
          <div>
            <h3 className="text-sm font-medium text-gray-500">Today's Revenue</h3>
            <p className="text-2xl font-bold text-gray-800">₹{todayRevenue.toFixed(2)}</p>
          </div>
        </div>
      </div>

      <div className="card">
        <div className="flex items-center gap-2 mb-4">
          <Calendar size={18} className="text-gray-500" />
          <h2 className="text-lg font-semibold text-gray-800">Recent Registrations</h2>
        </div>
        <div className="overflow-x-auto">
          <table className="w-full text-left border-collapse">
            <thead>
              <tr className="border-b border-gray-200 bg-gray-50">
                <th className="py-3 px-4 font-medium text-sm text-gray-600">Vch No</th>
                <th className="py-3 px-4 font-medium text-sm text-gray-600">Date</th>
                <th className="py-3 px-4 font-medium text-sm text-gray-600">Patient ID</th>
                <th className="py-3 px-4 font-medium text-sm text-gray-600 text-right">Amount (₹)</th>
              </tr>
            </thead>
            <tbody>
              {isLoading ? (
                <tr><td colSpan={4} className="py-8 text-center text-gray-500">Loading...</td></tr>
              ) : registrations?.length === 0 ? (
                <tr><td colSpan={4} className="py-8 text-center text-gray-500">No registrations found today.</td></tr>
              ) : (
                registrations?.map((reg) => (
                  <tr key={reg.OpgCode} className="border-b border-gray-50 hover:bg-gray-50">
                    <td className="py-3 px-4 text-sm text-gray-800">OPD-{reg.OpgVchNo}</td>
                    <td className="py-3 px-4 text-sm text-gray-600">{reg.OpgDate}</td>
                    <td className="py-3 px-4 text-sm font-medium text-medical-mutedblue">PTT-{reg.OpgPttCode}</td>
                    <td className="py-3 px-4 text-sm font-semibold text-gray-800 text-right">{reg.OpgAmtAftDisc.toFixed(2)}</td>
                  </tr>
                ))
              )}
            </tbody>
          </table>
        </div>
      </div>
    </div>
  );
}
