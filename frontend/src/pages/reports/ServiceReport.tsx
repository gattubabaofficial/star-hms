import { useState } from 'react';
import { useQuery } from '@tanstack/react-query';
import api from '../../lib/api';
import { Calendar, Download, Activity } from 'lucide-react';
import { format } from 'date-fns';

export function ServiceReport() {
  const [dateRange, setDateRange] = useState({
    startDate: new Date(new Date().setDate(new Date().getDate() - 30)).toISOString().split('T')[0],
    endDate: new Date().toISOString().split('T')[0],
  });

  const { data: services, isLoading } = useQuery({
    queryKey: ['report-services', dateRange],
    queryFn: async () => {
      const res = await api.get<any[]>('/reports/services', { 
        params: { start_date: dateRange.startDate, end_date: dateRange.endDate } 
      });
      return res.data;
    }
  });

  const printReport = () => {
    window.print();
  };

  const totalRevenue = services?.reduce((sum, item) => sum + item.TotalRevenue, 0) || 0;
  const totalQuantity = services?.reduce((sum, item) => sum + item.Quantity, 0) || 0;

  return (
    <div className="max-w-6xl mx-auto space-y-6">
      <div className="flex flex-col md:flex-row md:justify-between md:items-end gap-4 print:hidden">
        <div>
          <h1 className="text-2xl font-bold text-medical-text">Service Revenue Report</h1>
          <p className="text-gray-500 text-sm mt-1">Breakdown of rendered services and revenue</p>
        </div>
        
        <div className="flex gap-3">
          <div className="flex items-center gap-4 bg-white p-2 rounded-lg shadow-sm border border-gray-100">
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
          <button onClick={printReport} className="btn-primary flex items-center gap-2">
            <Download size={18} /> Print
          </button>
        </div>
      </div>

      <div className="card print:shadow-none print:border-none print:p-0">
        <div className="hidden print:block mb-6 text-center border-b pb-4">
          <h2 className="text-2xl font-bold text-gray-800">STAR HMS</h2>
          <h3 className="text-xl font-semibold mt-1">Service Revenue Report</h3>
          <p className="text-sm text-gray-600 mt-2">
            Period: {format(new Date(dateRange.startDate), 'dd MMM yyyy')} to {format(new Date(dateRange.endDate), 'dd MMM yyyy')}
          </p>
        </div>

        {isLoading ? (
          <div className="py-12 flex justify-center"><div className="w-8 h-8 border-4 border-medical-mutedblue border-t-transparent rounded-full animate-spin"></div></div>
        ) : (
          <div>
            <div className="grid grid-cols-2 gap-4 mb-6">
              <div className="bg-purple-50 p-4 rounded-lg border border-purple-100">
                <p className="text-sm text-purple-600 font-medium">Total Service Revenue</p>
                <p className="text-2xl font-bold text-purple-900">₹{totalRevenue.toFixed(2)}</p>
              </div>
              <div className="bg-orange-50 p-4 rounded-lg border border-orange-100">
                <p className="text-sm text-orange-600 font-medium">Total Services Rendered</p>
                <p className="text-2xl font-bold text-orange-900">{totalQuantity}</p>
              </div>
            </div>

            <table className="data-table">
              <thead>
                <tr>
                  <th>Service Name</th>
                  <th>Module Type</th>
                  <th className="text-right">Quantity</th>
                  <th className="text-right">Total Revenue (₹)</th>
                </tr>
              </thead>
              <tbody>
                {services?.length === 0 ? (
                  <tr>
                    <td colSpan={4} className="text-center py-8 text-gray-500">No services found for this period.</td>
                  </tr>
                ) : (
                  services?.map((item, index) => (
                    <tr key={index}>
                      <td className="font-medium text-gray-800">{item.ServiceName}</td>
                      <td>
                        <span className="px-2 py-1 rounded-full text-xs font-medium bg-gray-100 text-gray-600">
                          {item.Module}
                        </span>
                      </td>
                      <td className="text-right">{item.Quantity}</td>
                      <td className="text-right font-medium">₹{item.TotalRevenue.toFixed(2)}</td>
                    </tr>
                  ))
                )}
              </tbody>
            </table>
          </div>
        )}
      </div>
    </div>
  );
}
