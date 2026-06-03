import { useState } from 'react';
import { useQuery } from '@tanstack/react-query';
import api from '../../lib/api';
import { Calendar, Download, FileText } from 'lucide-react';
import { format } from 'date-fns';

export function CollectionReport() {
  const [dateRange, setDateRange] = useState({
    startDate: new Date(new Date().setDate(new Date().getDate() - 30)).toISOString().split('T')[0],
    endDate: new Date().toISOString().split('T')[0],
  });

  const { data: collections, isLoading } = useQuery({
    queryKey: ['report-collection', dateRange],
    queryFn: async () => {
      const res = await api.get<any[]>('/reports/collection', { 
        params: { start_date: dateRange.startDate, end_date: dateRange.endDate } 
      });
      return res.data;
    }
  });

  const printReport = () => {
    window.print();
  };

  const totalAmount = collections?.reduce((sum, item) => sum + item.TotalAmount, 0) || 0;
  const totalTransactions = collections?.reduce((sum, item) => sum + item.TransactionCount, 0) || 0;

  return (
    <div className="max-w-6xl mx-auto space-y-6">
      <div className="flex flex-col md:flex-row md:justify-between md:items-end gap-4 print:hidden">
        <div>
          <h1 className="text-2xl font-bold text-medical-text">Collection Report</h1>
          <p className="text-gray-500 text-sm mt-1">Summary of revenue across all departments</p>
        </div>
        
        <div className="flex gap-3">
          <div className="flex items-center gap-4 bg-white p-2 rounded-lg shadow-sm border border-medical-border">
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
          <h3 className="text-xl font-semibold mt-1">Collection Report</h3>
          <p className="text-sm text-gray-600 mt-2">
            Period: {format(new Date(dateRange.startDate), 'dd MMM yyyy')} to {format(new Date(dateRange.endDate), 'dd MMM yyyy')}
          </p>
        </div>

        {isLoading ? (
          <div className="py-12 flex justify-center"><div className="w-8 h-8 border-4 border-medical-primary border-t-transparent rounded-full animate-spin"></div></div>
        ) : (
          <div>
            <div className="grid grid-cols-2 gap-4 mb-6">
              <div className="bg-blue-50 p-4 rounded-lg border border-blue-100">
                <p className="text-sm text-blue-600 font-medium">Total Revenue</p>
                <p className="text-2xl font-bold text-blue-900">₹{totalAmount.toFixed(2)}</p>
              </div>
              <div className="bg-green-50 p-4 rounded-lg border border-green-100">
                <p className="text-sm text-green-600 font-medium">Total Transactions</p>
                <p className="text-2xl font-bold text-green-900">{totalTransactions}</p>
              </div>
            </div>

            <table className="data-table">
              <thead>
                <tr>
                  <th>Date</th>
                  <th>Module</th>
                  <th className="text-right">Transactions</th>
                  <th className="text-right">Total Amount (₹)</th>
                </tr>
              </thead>
              <tbody>
                {collections?.length === 0 ? (
                  <tr>
                    <td colSpan={4} className="text-center py-8 text-gray-500">No collections found for this period.</td>
                  </tr>
                ) : (
                  collections?.map((item, index) => (
                    <tr key={index}>
                      <td>{format(new Date(item.Date), 'dd MMM yyyy')}</td>
                      <td>
                        <span className={`px-2 py-1 rounded-full text-xs font-medium ${
                          item.Module.includes('OPD') ? 'bg-blue-100 text-blue-700' :
                          item.Module.includes('IPD') ? 'bg-indigo-100 text-indigo-700' :
                          'bg-purple-100 text-purple-700'
                        }`}>
                          {item.Module}
                        </span>
                      </td>
                      <td className="text-right">{item.TransactionCount}</td>
                      <td className="text-right font-medium">₹{item.TotalAmount.toFixed(2)}</td>
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


