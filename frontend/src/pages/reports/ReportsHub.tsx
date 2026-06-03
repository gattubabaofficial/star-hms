import { useState } from 'react';
import { useQuery } from '@tanstack/react-query';
import api from '../../lib/api';
import { Calendar, Download, TrendingUp, Users, Pill, Stethoscope, UserCheck } from 'lucide-react';

export function ReportsHub() {
  const [dateRange, setDateRange] = useState({
    startDate: new Date(new Date().setDate(new Date().getDate() - 30)).toISOString().split('T')[0],
    endDate: new Date().toISOString().split('T')[0],
  });
  
  const [activeTab, setActiveTab] = useState<'opd' | 'ipd' | 'pharmacy' | 'doctors' | 'referrals'>('opd');

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

  const { data: doctorData, isLoading: doctorLoading } = useQuery({
    queryKey: ['report-doctors', dateRange],
    queryFn: async () => (await api.get<any[]>('/reports/doctor-analysis', { params: { start_date: dateRange.startDate, end_date: dateRange.endDate } })).data,
    enabled: activeTab === 'doctors'
  });

  const { data: referralData, isLoading: referralLoading } = useQuery({
    queryKey: ['report-referrals', dateRange],
    queryFn: async () => (await api.get<any[]>('/reports/referral-analysis', { params: { start_date: dateRange.startDate, end_date: dateRange.endDate } })).data,
    enabled: activeTab === 'referrals'
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
        
        <div className="flex items-center gap-4 bg-white p-2 rounded-lg shadow-sm border border-medical-border print:hidden">
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

      <div className="flex gap-1 border-b border-medical-border print:hidden overflow-x-auto">
        <button onClick={() => setActiveTab('opd')} className={`px-4 py-2.5 flex items-center gap-2 font-medium text-sm transition-colors whitespace-nowrap ${activeTab === 'opd' ? 'border-b-2 border-blue-500 text-blue-600' : 'text-gray-500 hover:text-gray-700'}`}>
          <TrendingUp size={15} /> OPD Revenue
        </button>
        <button onClick={() => setActiveTab('ipd')} className={`px-4 py-2.5 flex items-center gap-2 font-medium text-sm transition-colors whitespace-nowrap ${activeTab === 'ipd' ? 'border-b-2 border-blue-500 text-blue-600' : 'text-gray-500 hover:text-gray-700'}`}>
          <Users size={15} /> IPD Admissions
        </button>
        <button onClick={() => setActiveTab('pharmacy')} className={`px-4 py-2.5 flex items-center gap-2 font-medium text-sm transition-colors whitespace-nowrap ${activeTab === 'pharmacy' ? 'border-b-2 border-blue-500 text-blue-600' : 'text-gray-500 hover:text-gray-700'}`}>
          <Pill size={15} /> Pharmacy
        </button>
        <button onClick={() => setActiveTab('doctors')} className={`px-4 py-2.5 flex items-center gap-2 font-medium text-sm transition-colors whitespace-nowrap ${activeTab === 'doctors' ? 'border-b-2 border-emerald-500 text-emerald-600' : 'text-gray-500 hover:text-gray-700'}`}>
          <Stethoscope size={15} /> Doctor Analysis
        </button>
        <button onClick={() => setActiveTab('referrals')} className={`px-4 py-2.5 flex items-center gap-2 font-medium text-sm transition-colors whitespace-nowrap ${activeTab === 'referrals' ? 'border-b-2 border-violet-500 text-violet-600' : 'text-gray-500 hover:text-gray-700'}`}>
          <UserCheck size={15} /> Referral Analysis
        </button>
      </div>

      <div className="card print:shadow-none print:border-none print:p-0">
        <div className="flex justify-between items-center mb-6 print:hidden">
          <h2 className="text-lg font-semibold text-gray-800">
            {activeTab === 'opd' && 'OPD Daily Revenue Report'}
            {activeTab === 'ipd' && 'IPD Admissions Report'}
            {activeTab === 'pharmacy' && 'Pharmacy Daily Summary'}
            {activeTab === 'doctors' && 'Doctor-wise Patient Analysis'}
            {activeTab === 'referrals' && 'Referral Doctor Analysis'}
          </h2>
          <button onClick={printReport} className="text-sm flex items-center gap-2 text-gray-600 hover:text-medical-text border border-medical-border px-3 py-1.5 rounded bg-white">
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
                <tr className="bg-gray-50 border-b border-medical-border">
                  <th className="py-2 px-4 text-sm font-medium text-gray-600">Date</th>
                  <th className="py-2 px-4 text-sm font-medium text-gray-600 text-center">Total Patients</th>
                  <th className="py-2 px-4 text-sm font-medium text-gray-600 text-right">Total Revenue (₹)</th>
                </tr>
              )}
              {activeTab === 'ipd' && (
                <tr className="bg-gray-50 border-b border-medical-border">
                  <th className="py-2 px-4 text-sm font-medium text-gray-600">Vch No</th>
                  <th className="py-2 px-4 text-sm font-medium text-gray-600">Date</th>
                  <th className="py-2 px-4 text-sm font-medium text-gray-600">Patient ID</th>
                  <th className="py-2 px-4 text-sm font-medium text-gray-600">Status</th>
                  <th className="py-2 px-4 text-sm font-medium text-gray-600">Advance Paid (₹)</th>
                </tr>
              )}
              {activeTab === 'pharmacy' && (
                <tr className="bg-gray-50 border-b border-medical-border">
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
                  <tr key={i} className="border-b border-medical-border hover:bg-gray-50">
                    <td className="py-2 px-4 text-sm">{row.Date}</td>
                    <td className="py-2 px-4 text-sm text-center font-medium text-gray-700">{row.TotalPatients}</td>
                    <td className="py-2 px-4 text-sm text-right font-semibold text-gray-800">{row.TotalRevenue.toFixed(2)}</td>
                  </tr>
                ))
              )}
              {/* OPD Footer Total */}
              {activeTab === 'opd' && opdData && opdData.length > 0 && (
                <tr className="bg-gray-50 font-bold border-t-2 border-medical-border">
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
                  <tr key={i} className="border-b border-medical-border hover:bg-gray-50">
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
                  <tr key={i} className="border-b border-medical-border hover:bg-gray-50">
                    <td className="py-2 px-4 text-sm">{row.Date}</td>
                    <td className="py-2 px-4 text-sm text-right text-orange-600 font-medium">{row.TotalPurchases.toFixed(2)}</td>
                    <td className="py-2 px-4 text-sm text-right text-green-600 font-medium">{row.TotalSales.toFixed(2)}</td>
                  </tr>
                ))
              )}
              {/* Pharmacy Footer Total */}
              {activeTab === 'pharmacy' && pharmacyData && pharmacyData.length > 0 && (
                <tr className="bg-gray-50 font-bold border-t-2 border-medical-border">
                  <td className="py-3 px-4 text-sm">TOTAL</td>
                  <td className="py-3 px-4 text-sm text-right text-orange-600">₹{pharmacyData.reduce((s, r) => s + r.TotalPurchases, 0).toFixed(2)}</td>
                  <td className="py-3 px-4 text-sm text-right text-green-600">₹{pharmacyData.reduce((s, r) => s + r.TotalSales, 0).toFixed(2)}</td>
                </tr>
              )}

              {/* Doctor Analysis */}
              {activeTab === 'doctors' && (
                doctorLoading ? <tr><td colSpan={6} className="py-8 text-center text-gray-400">Loading...</td></tr> :
                doctorData?.length === 0 ? <tr><td colSpan={6} className="py-8 text-center text-gray-400">No doctor data for this period.</td></tr> :
                <>
                  <tr className="bg-gray-50/70 border-b border-medical-border">
                    <th className="py-2 px-4 text-xs font-medium text-gray-500">Doctor Name</th>
                    <th className="py-2 px-4 text-xs font-medium text-gray-500">Specialty</th>
                    <th className="py-2 px-4 text-xs font-medium text-gray-500 text-center">OPD Patients</th>
                    <th className="py-2 px-4 text-xs font-medium text-gray-500 text-center">IPD Admissions</th>
                    <th className="py-2 px-4 text-xs font-medium text-gray-500 text-center">Total</th>
                    <th className="py-2 px-4 text-xs font-medium text-gray-500 text-right">OPD Revenue (₹)</th>
                  </tr>
                  {doctorData?.map((row: any, i: number) => (
                    <tr key={i} className="border-b border-gray-50 hover:bg-gray-50">
                      <td className="py-2.5 px-4 text-sm font-medium text-gray-800">{row.DoctorName}</td>
                      <td className="py-2.5 px-4 text-sm text-gray-500">{row.Specialty || '—'}</td>
                      <td className="py-2.5 px-4 text-sm text-center">
                        <span className="bg-blue-100 text-blue-700 px-2 py-0.5 rounded-full text-xs font-medium">{row.OpdPatients}</span>
                      </td>
                      <td className="py-2.5 px-4 text-sm text-center">
                        <span className="bg-emerald-100 text-emerald-700 px-2 py-0.5 rounded-full text-xs font-medium">{row.IpdAdmissions}</span>
                      </td>
                      <td className="py-2.5 px-4 text-sm text-center font-bold text-gray-800">{row.TotalPatients}</td>
                      <td className="py-2.5 px-4 text-sm text-right font-semibold text-gray-700">₹{row.OpdRevenue.toFixed(2)}</td>
                    </tr>
                  ))}
                  {doctorData && doctorData.length > 0 && (
                    <tr className="bg-gray-50 font-bold border-t-2 border-medical-border">
                      <td className="py-3 px-4 text-sm" colSpan={2}>TOTAL</td>
                      <td className="py-3 px-4 text-sm text-center text-blue-600">{doctorData.reduce((s: number, r: any) => s + r.OpdPatients, 0)}</td>
                      <td className="py-3 px-4 text-sm text-center text-emerald-600">{doctorData.reduce((s: number, r: any) => s + r.IpdAdmissions, 0)}</td>
                      <td className="py-3 px-4 text-sm text-center">{doctorData.reduce((s: number, r: any) => s + r.TotalPatients, 0)}</td>
                      <td className="py-3 px-4 text-sm text-right text-blue-600">₹{doctorData.reduce((s: number, r: any) => s + r.OpdRevenue, 0).toFixed(2)}</td>
                    </tr>
                  )}
                </>
              )}

              {/* Referral Analysis */}
              {activeTab === 'referrals' && (
                referralLoading ? <tr><td colSpan={5} className="py-8 text-center text-gray-400">Loading...</td></tr> :
                referralData?.length === 0 ? <tr><td colSpan={5} className="py-8 text-center text-gray-400">No referral data for this period.</td></tr> :
                <>
                  <tr className="bg-gray-50/70 border-b border-medical-border">
                    <th className="py-2 px-4 text-xs font-medium text-gray-500">Referred-By Doctor</th>
                    <th className="py-2 px-4 text-xs font-medium text-gray-500">Specialty</th>
                    <th className="py-2 px-4 text-xs font-medium text-gray-500 text-center">OPD Refs</th>
                    <th className="py-2 px-4 text-xs font-medium text-gray-500 text-center">IPD Refs</th>
                    <th className="py-2 px-4 text-xs font-medium text-gray-500 text-center">Total Refs</th>
                  </tr>
                  {referralData?.map((row: any, i: number) => (
                    <tr key={i} className="border-b border-gray-50 hover:bg-gray-50">
                      <td className="py-2.5 px-4 text-sm font-medium text-gray-800">{row.ReferredByName}</td>
                      <td className="py-2.5 px-4 text-sm text-gray-500">{row.Specialty || '—'}</td>
                      <td className="py-2.5 px-4 text-sm text-center">
                        <span className="bg-blue-100 text-blue-700 px-2 py-0.5 rounded-full text-xs font-medium">{row.OpdReferrals}</span>
                      </td>
                      <td className="py-2.5 px-4 text-sm text-center">
                        <span className="bg-violet-100 text-violet-700 px-2 py-0.5 rounded-full text-xs font-medium">{row.IpdReferrals}</span>
                      </td>
                      <td className="py-2.5 px-4 text-sm text-center font-bold text-gray-800">{row.TotalReferrals}</td>
                    </tr>
                  ))}
                  {referralData && referralData.length > 0 && (
                    <tr className="bg-gray-50 font-bold border-t-2 border-medical-border">
                      <td className="py-3 px-4 text-sm" colSpan={2}>TOTAL</td>
                      <td className="py-3 px-4 text-sm text-center text-blue-600">{referralData.reduce((s: number, r: any) => s + r.OpdReferrals, 0)}</td>
                      <td className="py-3 px-4 text-sm text-center text-violet-600">{referralData.reduce((s: number, r: any) => s + r.IpdReferrals, 0)}</td>
                      <td className="py-3 px-4 text-sm text-center">{referralData.reduce((s: number, r: any) => s + r.TotalReferrals, 0)}</td>
                    </tr>
                  )}
                </>
              )}
            </tbody>
          </table>
        </div>
      </div>
    </div>
  );
}

