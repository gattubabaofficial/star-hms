import { useState } from 'react';
import { useQuery } from '@tanstack/react-query';
import api from '../../lib/api';
import { Calendar, Download, FileText, TrendingUp, Users, Pill } from 'lucide-react';

export function ReportsHub() {
  const [dateRange, setDateRange] = useState({
    startDate: new Date(new Date().setDate(new Date().getDate() - 30)).toISOString().split('T')[0],
    endDate: new Date().toISOString().split('T')[0],
  });
  
  const [activeTab, setActiveTab] = useState<'opd' | 'ipd' | 'pharmacy'>('opd');

  const { data: opdData, isLoading: opdLoading } = useQuery({
    queryKey: ['report-opd', dateRange],
    queryFn: async () => (await api.get<any[]>('/reports/opd', { params: { start_date: dateRange.startDate, end_date: dateRange.endDate } })).data,
    enabled: activeTab === 'opd'
  });

  const { data: ipdData, isLoading: ipdLoading } = useQuery({
    queryKey: ['report-ipd', dateRange],
    queryFn: async () => (await api.get<any[]>('/reports/ipd', { params: { start_date: dateRange.startDate, end_date: dateRange.endDate } })).data,
    enabled: activeTab === 'ipd'
  });

  const { data: pharmacyData, isLoading: pharmacyLoading } = useQuery({
    queryKey: ['report-pharmacy', dateRange],
    queryFn: async () => (await api.get<any[]>('/reports/pharmacy', { params: { start_date: dateRange.startDate, end_date: dateRange.endDate } })).data,
    enabled: activeTab === 'pharmacy'
  });

  const printReport = () => {
    window.print();
  };

  return (
    <div className="max-w-6xl mx-auto space-y-6">
      <div className="flex flex-col md:flex-row md:justify-between md:items-end gap-4">
        <div>
          <h1 className="text-2xl font-bold text-medical-text">Reports Hub</h1>
          <p className="text-gray-500 text-sm mt-1">Unified reporting for all departments</p>
        </div>
        
        <div className="flex items-center gap-4 bg-white p-2 rounded-lg shadow-sm border border-gray-100 print:hidden">
          <div className="flex items-center gap-2">
            <Calendar size={18} className="text-gray-400" />
            <input 
              type="date" 
              value={dateRange.startDate} 
              onChange={e => setDateRange({...dateRange, startDate: e.target.value})}
              className="text-sm border-none bg-transparent focus:ring-0 text-gray-700" 
            />
          </div>
          <span className="text-gray-300">to</span>
          <div className="flex items-center gap-2">
            <input 
              type="date" 
              value={dateRange.endDate} 
              onChange={e => setDateRange({...dateRange, endDate: e.target.value})}
              className="text-sm border-none bg-transparent focus:ring-0 text-gray-700" 
            />
          </div>
        </div>
      </div>

      <div className="flex gap-2 border-b border-gray-200 print:hidden">
        <button onClick={() => setActiveTab('opd')} className={`px-4 py-2 flex items-center gap-2 font-medium text-sm transition-colors ${activeTab === 'opd' ? 'border-b-2 border-medical-mutedblue text-medical-mutedblue' : 'text-gray-500 hover:text-gray-700'}`}>
          <TrendingUp size={16} /> OPD Revenue
        </button>
        <button onClick={() => setActiveTab('ipd')} className={`px-4 py-2 flex items-center gap-2 font-medium text-sm transition-colors ${activeTab === 'ipd' ? 'border-b-2 border-medical-mutedblue text-medical-mutedblue' : 'text-gray-500 hover:text-gray-700'}`}>
          <Users size={16} /> IPD Admissions
        </button>
        <button onClick={() => setActiveTab('pharmacy')} className={`px-4 py-2 flex items-center gap-2 font-medium text-sm transition-colors ${activeTab === 'pharmacy' ? 'border-b-2 border-medical-mutedblue text-medical-mutedblue' : 'text-gray-500 hover:text-gray-700'}`}>
          <Pill size={16} /> Pharmacy Summary
        </button>
      </div>

      <div className="card print:shadow-none print:border-none print:p-0">
        <div className="flex justify-between items-center mb-6 print:hidden">
          <h2 className="text-lg font-semibold text-gray-800">
            {activeTab === 'opd' && 'OPD Daily Revenue Report'}
            {activeTab === 'ipd' && 'IPD Admissions Report'}
            {activeTab === 'pharmacy' && 'Pharmacy Daily Summary'}
          </h2>
          <button onClick={printReport} className="text-sm flex items-center gap-2 text-gray-600 hover:text-medical-text border border-gray-200 px-3 py-1.5 rounded bg-white">
            <Download size={16} /> Print / Export
          </button>
        </div>

        <div className="hidden print:block mb-6">
          <h2 className="text-xl font-bold text-center">STAR HMS - REPORT</h2>
          <p className="text-center text-sm text-gray-600">
            {activeTab === 'opd' && 'OPD Daily Revenue Report'}
            {activeTab === 'ipd' && 'IPD Admissions Report'}
            {activeTab === 'pharmacy' && 'Pharmacy Daily Summary'}
          </p>
          <p className="text-center text-xs text-gray-500">Period: {dateRange.startDate} to {dateRange.endDate}</p>
        </div>

        <div className="overflow-x-auto">
          <table className="w-full text-left border-collapse">
            <thead>
              {activeTab === 'opd' && (
                <tr className="bg-gray-50 border-b border-gray-200">
                  <th className="py-2 px-4 text-sm font-medium text-gray-600">Date</th>
                  <th className="py-2 px-4 text-sm font-medium text-gray-600 text-center">Total Patients</th>
                  <th className="py-2 px-4 text-sm font-medium text-gray-600 text-right">Total Revenue (₹)</th>
                </tr>
              )}
              {activeTab === 'ipd' && (
                <tr className="bg-gray-50 border-b border-gray-200">
                  <th className="py-2 px-4 text-sm font-medium text-gray-600">Vch No</th>
                  <th className="py-2 px-4 text-sm font-medium text-gray-600">Date</th>
                  <th className="py-2 px-4 text-sm font-medium text-gray-600">Patient ID</th>
                  <th className="py-2 px-4 text-sm font-medium text-gray-600">Status</th>
                  <th className="py-2 px-4 text-sm font-medium text-gray-600">Advance Paid (₹)</th>
                </tr>
              )}
              {activeTab === 'pharmacy' && (
                <tr className="bg-gray-50 border-b border-gray-200">
                  <th className="py-2 px-4 text-sm font-medium text-gray-600">Date</th>
                  <th className="py-2 px-4 text-sm font-medium text-gray-600 text-right">Total Purchases (₹)</th>
                  <th className="py-2 px-4 text-sm font-medium text-gray-600 text-right">Total Sales (₹)</th>
                </tr>
              )}
            </thead>
            <tbody>
              {/* OPD Data */}
              {activeTab === 'opd' && (
                opdLoading ? <tr><td colSpan={3} className="py-8 text-center text-gray-500">Loading...</td></tr> :
                opdData?.length === 0 ? <tr><td colSpan={3} className="py-8 text-center text-gray-500">No records found for this period.</td></tr> :
                opdData?.map((row, i) => (
                  <tr key={i} className="border-b border-gray-100 hover:bg-gray-50">
                    <td className="py-2 px-4 text-sm">{row.Date}</td>
                    <td className="py-2 px-4 text-sm text-center font-medium text-gray-700">{row.TotalPatients}</td>
                    <td className="py-2 px-4 text-sm text-right font-semibold text-gray-800">{row.TotalRevenue.toFixed(2)}</td>
                  </tr>
                ))
              )}
              {/* OPD Footer Total */}
              {activeTab === 'opd' && opdData && opdData.length > 0 && (
                <tr className="bg-gray-50 font-bold border-t-2 border-gray-200">
                  <td className="py-3 px-4 text-sm">TOTAL</td>
                  <td className="py-3 px-4 text-sm text-center">{opdData.reduce((s, r) => s + r.TotalPatients, 0)}</td>
                  <td className="py-3 px-4 text-sm text-right text-blue-600">₹{opdData.reduce((s, r) => s + r.TotalRevenue, 0).toFixed(2)}</td>
                </tr>
              )}

              {/* IPD Data */}
              {activeTab === 'ipd' && (
                ipdLoading ? <tr><td colSpan={5} className="py-8 text-center text-gray-500">Loading...</td></tr> :
                ipdData?.length === 0 ? <tr><td colSpan={5} className="py-8 text-center text-gray-500">No records found for this period.</td></tr> :
                ipdData?.map((row, i) => (
                  <tr key={i} className="border-b border-gray-100 hover:bg-gray-50">
                    <td className="py-2 px-4 text-sm font-medium">IPD-{row.IhdVchNo}</td>
                    <td className="py-2 px-4 text-sm">{row.IhdDate}</td>
                    <td className="py-2 px-4 text-sm text-gray-600">PTT-{row.IhdPttCode}</td>
                    <td className="py-2 px-4 text-sm">
                      <span className={`px-2 py-1 rounded-full text-xs ${row.IhdStatus === 'Admitted' ? 'bg-blue-100 text-blue-800' : 'bg-green-100 text-green-800'}`}>
                        {row.IhdStatus}
                      </span>
                    </td>
                    <td className="py-2 px-4 text-sm font-medium">{row.IhdAdvAmt.toFixed(2)}</td>
                  </tr>
                ))
              )}

              {/* Pharmacy Data */}
              {activeTab === 'pharmacy' && (
                pharmacyLoading ? <tr><td colSpan={3} className="py-8 text-center text-gray-500">Loading...</td></tr> :
                pharmacyData?.length === 0 ? <tr><td colSpan={3} className="py-8 text-center text-gray-500">No records found for this period.</td></tr> :
                pharmacyData?.map((row, i) => (
                  <tr key={i} className="border-b border-gray-100 hover:bg-gray-50">
                    <td className="py-2 px-4 text-sm">{row.Date}</td>
                    <td className="py-2 px-4 text-sm text-right text-orange-600 font-medium">{row.TotalPurchases.toFixed(2)}</td>
                    <td className="py-2 px-4 text-sm text-right text-green-600 font-medium">{row.TotalSales.toFixed(2)}</td>
                  </tr>
                ))
              )}
              {/* Pharmacy Footer Total */}
              {activeTab === 'pharmacy' && pharmacyData && pharmacyData.length > 0 && (
                <tr className="bg-gray-50 font-bold border-t-2 border-gray-200">
                  <td className="py-3 px-4 text-sm">TOTAL</td>
                  <td className="py-3 px-4 text-sm text-right text-orange-600">₹{pharmacyData.reduce((s, r) => s + r.TotalPurchases, 0).toFixed(2)}</td>
                  <td className="py-3 px-4 text-sm text-right text-green-600">₹{pharmacyData.reduce((s, r) => s + r.TotalSales, 0).toFixed(2)}</td>
                </tr>
              )}
            </tbody>
          </table>
        </div>
      </div>
    </div>
  );
}
