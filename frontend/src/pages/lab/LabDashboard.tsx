import { useQuery } from '@tanstack/react-query';
import api from '../../lib/api';
import { FileText, Microscope, Banknote, ArrowRight } from 'lucide-react';
import { Link } from 'react-router-dom';

export function LabDashboard() {
  const { data: bills, isLoading } = useQuery({
    queryKey: ['lab-bills'],
    queryFn: async () => (await api.get<any[]>('/lab/registrations')).data,
    refetchInterval: 30000
  });

  const todayCount = bills?.length || 0;
  const todayRevenue = bills?.reduce((sum, b) => sum + b.LhdTotalAmt, 0) || 0;

  return (
    <div className="space-y-6">
      <div className="flex justify-between items-end">
        <div>
          <h1 className="text-2xl font-bold text-medical-text">Laboratory Dashboard</h1>
          <p className="text-gray-500 text-sm mt-1">Diagnostic billing and registration overview</p>
        </div>
        <div>
          <Link to="/lab/billing" className="btn-primary flex items-center gap-2">
            <Microscope size={18} /> New Lab Bill
          </Link>
        </div>
      </div>

      <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
        <div className="card flex items-center gap-4">
          <div className="p-3 bg-blue-50 text-medical-mutedblue rounded-lg"><FileText size={24} /></div>
          <div>
            <h3 className="text-sm font-medium text-gray-500">Today's Lab Registrations</h3>
            <p className="text-2xl font-bold text-gray-800">{todayCount}</p>
          </div>
        </div>
        <div className="card flex items-center gap-4">
          <div className="p-3 bg-green-50 text-green-600 rounded-lg"><Banknote size={24} /></div>
          <div>
            <h3 className="text-sm font-medium text-gray-500">Billed Revenue</h3>
            <p className="text-2xl font-bold text-gray-800">₹{todayRevenue.toFixed(2)}</p>
          </div>
        </div>
      </div>

      <div className="card">
        <h2 className="text-lg font-semibold text-gray-800 mb-4">Recent Lab Bills</h2>
        <div className="overflow-x-auto">
          <table className="w-full text-left border-collapse">
            <thead>
              <tr className="border-b border-gray-200 bg-gray-50">
                <th className="py-2 px-3 font-medium text-sm text-gray-600">Vch No</th>
                <th className="py-2 px-3 font-medium text-sm text-gray-600">Date</th>
                <th className="py-2 px-3 font-medium text-sm text-gray-600">Patient ID</th>
                <th className="py-2 px-3 font-medium text-sm text-gray-600">Doctor ID</th>
                <th className="py-2 px-3 font-medium text-sm text-gray-600">Status</th>
                <th className="py-2 px-3 font-medium text-sm text-gray-600 text-right">Net Amount</th>
              </tr>
            </thead>
            <tbody>
              {isLoading ? <tr><td colSpan={6} className="py-4 text-center">Loading...</td></tr> : 
                bills?.slice(0, 10).map(b => (
                <tr key={b.LhdCode} className="border-b border-gray-50 hover:bg-gray-50">
                  <td className="py-2 px-3 text-sm font-medium">LAB-{b.LhdVchNo}</td>
                  <td className="py-2 px-3 text-sm text-gray-600">{b.LhdDate}</td>
                  <td className="py-2 px-3 text-sm text-gray-800">PTT-{b.LhdPttCode}</td>
                  <td className="py-2 px-3 text-sm text-gray-600">{b.LhdCDctCode ? `DCT-${b.LhdCDctCode}` : 'N/A'}</td>
                  <td className="py-2 px-3 text-sm">
                    {b.LhdRfugAmt > 0 ? (
                      <span className="px-2 py-1 text-xs font-semibold rounded-full bg-red-100 text-red-700">Refunded</span>
                    ) : (
                      <span className="px-2 py-1 text-xs font-semibold rounded-full bg-green-100 text-green-700">Active</span>
                    )}
                  </td>
                  <td className="py-2 px-3 text-sm font-medium text-right text-blue-600">₹{b.LhdTotalAmt.toFixed(2)}</td>
                </tr>
              ))}
              {bills?.length === 0 && <tr><td colSpan={6} className="py-4 text-center text-gray-500">No lab registrations found.</td></tr>}
            </tbody>
          </table>
        </div>
      </div>
    </div>
  );
}
