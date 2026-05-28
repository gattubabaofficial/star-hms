import { useQuery } from '@tanstack/react-query';
import api from '../lib/api';
import { UserPlus, Stethoscope, Microscope, Pill, Activity, TrendingUp } from 'lucide-react';
import { AreaChart, Area, XAxis, YAxis, CartesianGrid, Tooltip, ResponsiveContainer } from 'recharts';

export function Dashboard() {
  const { data: stats, isLoading } = useQuery({
    queryKey: ['dashboard-stats'],
    queryFn: async () => (await api.get('/system/dashboard-stats')).data,
    refetchInterval: 30000 // Auto-refresh every 30s
  });

  const { data: trendData } = useQuery({
    queryKey: ['dashboard-trends'],
    queryFn: async () => {
      const end = new Date().toISOString().split('T')[0];
      const start = new Date(Date.now() - 6 * 24 * 60 * 60 * 1000).toISOString().split('T')[0]; // Last 7 days
      const res = await api.get('/reports/opd', { params: { start_date: start, end_date: end } });
      return res.data?.reverse() || [];
    }
  });

  return (
    <div className="space-y-6">
      <div>
        <h1 className="text-2xl font-bold text-medical-text">Hospital Overview</h1>
        <p className="text-gray-500 text-sm mt-1">Live updates from all departments</p>
      </div>
      
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
        <div className="card flex items-center gap-4">
          <div className="p-4 bg-blue-50 text-blue-600 rounded-xl"><UserPlus size={28} /></div>
          <div>
            <h3 className="text-sm font-medium text-gray-500 mb-1">OPD Patients</h3>
            <p className="text-3xl font-bold text-gray-800">{isLoading ? '--' : stats?.opdPatients}</p>
          </div>
        </div>
        
        <div className="card flex items-center gap-4">
          <div className="p-4 bg-green-50 text-green-600 rounded-xl"><Stethoscope size={28} /></div>
          <div>
            <h3 className="text-sm font-medium text-gray-500 mb-1">IPD Admissions</h3>
            <p className="text-3xl font-bold text-gray-800">{isLoading ? '--' : stats?.ipdAdmissions}</p>
          </div>
        </div>
        
        <div className="card flex items-center gap-4">
          <div className="p-4 bg-purple-50 text-purple-600 rounded-xl"><Microscope size={28} /></div>
          <div>
            <h3 className="text-sm font-medium text-gray-500 mb-1">Lab Tests</h3>
            <p className="text-3xl font-bold text-gray-800">{isLoading ? '--' : stats?.labReports}</p>
          </div>
        </div>
        
        <div className="card flex items-center gap-4">
          <div className="p-4 bg-orange-50 text-orange-600 rounded-xl"><Pill size={28} /></div>
          <div>
            <h3 className="text-sm font-medium text-gray-500 mb-1">Pharmacy Sales</h3>
            <p className="text-3xl font-bold text-gray-800">₹{isLoading ? '--' : (stats?.pharmacySales || 0).toFixed(2)}</p>
          </div>
        </div>
      </div>

      <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
        <div className="card lg:col-span-2 min-h-[400px]">
          <div className="flex items-center gap-2 mb-6">
            <Activity size={20} className="text-medical-mutedblue" />
            <h2 className="text-lg font-semibold text-gray-800">OPD Patient Traffic (Last 7 Days)</h2>
          </div>
          <div className="h-72 w-full">
            <ResponsiveContainer width="100%" height="100%">
              <AreaChart data={trendData} margin={{ top: 10, right: 30, left: 0, bottom: 0 }}>
                <defs>
                  <linearGradient id="colorPatients" x1="0" y1="0" x2="0" y2="1">
                    <stop offset="5%" stopColor="#4361ee" stopOpacity={0.3}/>
                    <stop offset="95%" stopColor="#4361ee" stopOpacity={0}/>
                  </linearGradient>
                </defs>
                <XAxis dataKey="Date" axisLine={false} tickLine={false} tick={{fill: '#6b7280', fontSize: 12}} dy={10} />
                <YAxis axisLine={false} tickLine={false} tick={{fill: '#6b7280', fontSize: 12}} />
                <CartesianGrid strokeDasharray="3 3" vertical={false} stroke="#e5e7eb" />
                <Tooltip 
                  contentStyle={{ borderRadius: '8px', border: 'none', boxShadow: '0 4px 6px -1px rgb(0 0 0 / 0.1)' }}
                  labelStyle={{ fontWeight: 'bold', color: '#374151' }}
                />
                <Area type="monotone" dataKey="TotalPatients" stroke="#4361ee" strokeWidth={3} fillOpacity={1} fill="url(#colorPatients)" />
              </AreaChart>
            </ResponsiveContainer>
          </div>
        </div>

        <div className="card min-h-[400px]">
          <div className="flex items-center gap-2 mb-6">
            <TrendingUp size={20} className="text-medical-mutedblue" />
            <h2 className="text-lg font-semibold text-gray-800">Revenue Trend</h2>
          </div>
          <div className="h-72 w-full">
            <ResponsiveContainer width="100%" height="100%">
              <AreaChart data={trendData} margin={{ top: 10, right: 10, left: -20, bottom: 0 }}>
                <defs>
                  <linearGradient id="colorRev" x1="0" y1="0" x2="0" y2="1">
                    <stop offset="5%" stopColor="#10b981" stopOpacity={0.3}/>
                    <stop offset="95%" stopColor="#10b981" stopOpacity={0}/>
                  </linearGradient>
                </defs>
                <XAxis dataKey="Date" axisLine={false} tickLine={false} tick={{fill: '#6b7280', fontSize: 12}} dy={10} />
                <YAxis axisLine={false} tickLine={false} tick={{fill: '#6b7280', fontSize: 12}} tickFormatter={(val) => `₹${val/1000}k`} />
                <CartesianGrid strokeDasharray="3 3" vertical={false} stroke="#e5e7eb" />
                <Tooltip 
                  formatter={(value: any) => [`₹${Number(value).toFixed(2)}`, 'Revenue']}
                  contentStyle={{ borderRadius: '8px', border: 'none', boxShadow: '0 4px 6px -1px rgb(0 0 0 / 0.1)' }}
                />
                <Area type="monotone" dataKey="TotalRevenue" stroke="#10b981" strokeWidth={3} fillOpacity={1} fill="url(#colorRev)" />
              </AreaChart>
            </ResponsiveContainer>
          </div>
        </div>
      </div>
    </div>
  );
}
