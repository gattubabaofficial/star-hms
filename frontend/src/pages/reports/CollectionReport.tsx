import React, { useState, useMemo } from 'react';
import { useQuery } from '@tanstack/react-query';
import api from '../../lib/api';
import { Calendar, Filter } from 'lucide-react';
import { format, parseISO } from 'date-fns';
import { ReportViewer } from '../../components/ReportViewer';

type GroupByOption = 'Detailed' | 'Date-wise' | 'Month-wise' | 'Patient-wise' | 'Doctor-wise' | 'Module-wise';

interface CollectionTransaction {
  Date: string;
  ReceiptNo: string;
  PatientName: string;
  DoctorName: string | null;
  Module: string;
  Amount: number;
}

export function CollectionReport() {
  const [dateRange, setDateRange] = useState({
    startDate: new Date(new Date().setDate(new Date().getDate() - 30)).toISOString().split('T')[0],
    endDate: new Date().toISOString().split('T')[0],
  });
  
  const [groupBy, setGroupBy] = useState<GroupByOption>('Detailed');

  const { data: transactions = [], isLoading } = useQuery({
    queryKey: ['report-collection', dateRange],
    queryFn: async () => {
      const res = await api.get<CollectionTransaction[]>('/reports/collection', { 
        params: { start_date: dateRange.startDate, end_date: dateRange.endDate } 
      });
      return res.data;
    }
  });

  const totalAmount = transactions.reduce((sum, item) => sum + item.Amount, 0);
  const totalTransactions = transactions.length;

  // Process data based on grouping
  const groupedData = useMemo(() => {
    if (groupBy === 'Detailed') return transactions;

    const groups: Record<string, { label: string; count: number; total: number }> = {};

    transactions.forEach(t => {
      let key = '';
      let label = '';

      switch (groupBy) {
        case 'Date-wise':
          key = t.Date;
          label = format(parseISO(t.Date), 'dd MMM yyyy');
          break;
        case 'Month-wise':
          key = t.Date.substring(0, 7); // yyyy-mm
          label = format(parseISO(t.Date), 'MMMM yyyy');
          break;
        case 'Patient-wise':
          key = t.PatientName;
          label = t.PatientName;
          break;
        case 'Doctor-wise':
          key = t.DoctorName || 'No Doctor';
          label = t.DoctorName || 'No Doctor';
          break;
        case 'Module-wise':
          key = t.Module;
          label = t.Module;
          break;
      }

      if (!groups[key]) {
        groups[key] = { label, count: 0, total: 0 };
      }
      groups[key].count += 1;
      groups[key].total += t.Amount;
    });

    return Object.values(groups).sort((a, b) => b.total - a.total);
  }, [transactions, groupBy]);

  return (
    <div className="h-full bg-gray-50 flex flex-col">
      <div className="print:hidden p-4 bg-white border-b border-gray-200 flex flex-wrap gap-4 items-center justify-between shadow-sm">
        <div className="flex gap-4 items-center">
          <div className="flex items-center gap-2 bg-gray-50 px-3 py-2 rounded border border-gray-200">
            <Calendar size={18} className="text-gray-500" />
            <input 
              type="date" 
              value={dateRange.startDate} 
              onChange={e => setDateRange({...dateRange, startDate: e.target.value})}
              className="text-sm bg-transparent border-none focus:ring-0" 
            />
            <span className="text-gray-400">to</span>
            <input 
              type="date" 
              value={dateRange.endDate} 
              onChange={e => setDateRange({...dateRange, endDate: e.target.value})}
              className="text-sm bg-transparent border-none focus:ring-0" 
            />
          </div>

          <div className="flex items-center gap-2 bg-gray-50 px-3 py-2 rounded border border-gray-200">
            <Filter size={18} className="text-gray-500" />
            <select 
              value={groupBy}
              onChange={e => setGroupBy(e.target.value as GroupByOption)}
              className="text-sm bg-transparent border-none focus:ring-0 font-medium"
            >
              <option value="Detailed">Detailed View</option>
              <option value="Date-wise">Date-wise</option>
              <option value="Month-wise">Month-wise</option>
              <option value="Module-wise">Module-wise</option>
              <option value="Patient-wise">Patient-wise</option>
              <option value="Doctor-wise">Doctor-wise</option>
            </select>
          </div>
        </div>
        
        <div className="flex items-center gap-4 text-sm font-medium">
          <div className="bg-blue-50 text-blue-800 px-4 py-2 rounded-lg border border-blue-100">
            Total Revenue: ₹{totalAmount.toFixed(2)}
          </div>
          <div className="bg-green-50 text-green-800 px-4 py-2 rounded-lg border border-green-100">
            Total Txns: {totalTransactions}
          </div>
        </div>
      </div>

      <div className="flex-1 overflow-hidden">
        <ReportViewer 
          title="Collection Summary Report" 
          subtitle={`Grouped by: ${groupBy}`}
          dateRange={{ start: dateRange.startDate, end: dateRange.endDate }}
        >
          {isLoading ? (
            <div className="py-20 flex justify-center"><div className="w-8 h-8 border-4 border-medical-primary border-t-transparent rounded-full animate-spin"></div></div>
          ) : (
            <div className="w-full">
              {transactions.length === 0 ? (
                <div className="text-center py-12 text-gray-500">No collection records found for the selected period.</div>
              ) : (
                <table className="w-full text-left text-sm border-collapse">
                  <thead>
                    <tr className="border-b-2 border-gray-800 text-gray-800 font-bold">
                      {groupBy === 'Detailed' ? (
                        <>
                          <th className="py-3 px-2">Date</th>
                          <th className="py-3 px-2">Receipt No</th>
                          <th className="py-3 px-2">Patient</th>
                          <th className="py-3 px-2">Doctor</th>
                          <th className="py-3 px-2">Module</th>
                          <th className="py-3 px-2 text-right">Amount (₹)</th>
                        </>
                      ) : (
                        <>
                          <th className="py-3 px-2 w-1/2">{groupBy.split('-')[0]}</th>
                          <th className="py-3 px-2 text-right">Transactions</th>
                          <th className="py-3 px-2 text-right">Total Amount (₹)</th>
                        </>
                      )}
                    </tr>
                  </thead>
                  <tbody className="divide-y divide-gray-200">
                    {groupBy === 'Detailed' ? (
                      (groupedData as CollectionTransaction[]).map((t, idx) => (
                        <tr key={idx} className="hover:bg-gray-50 print:hover:bg-transparent">
                          <td className="py-2 px-2 text-gray-700 whitespace-nowrap">{format(parseISO(t.Date), 'dd MMM yy')}</td>
                          <td className="py-2 px-2 font-mono text-xs text-gray-500">{t.ReceiptNo}</td>
                          <td className="py-2 px-2 font-medium text-gray-900">{t.PatientName}</td>
                          <td className="py-2 px-2 text-gray-600">{t.DoctorName || '-'}</td>
                          <td className="py-2 px-2">
                            <span className="text-xs px-2 py-1 bg-gray-100 rounded-full font-medium text-gray-700 print:bg-transparent print:p-0">
                              {t.Module}
                            </span>
                          </td>
                          <td className="py-2 px-2 text-right font-semibold text-gray-900">{t.Amount.toFixed(2)}</td>
                        </tr>
                      ))
                    ) : (
                      (groupedData as {label: string, count: number, total: number}[]).map((g, idx) => (
                        <tr key={idx} className="hover:bg-gray-50 print:hover:bg-transparent">
                          <td className="py-3 px-2 font-medium text-gray-900">{g.label}</td>
                          <td className="py-3 px-2 text-right text-gray-600">{g.count}</td>
                          <td className="py-3 px-2 text-right font-bold text-gray-900">{g.total.toFixed(2)}</td>
                        </tr>
                      ))
                    )}
                  </tbody>
                  <tfoot className="border-t-2 border-gray-800 bg-gray-50 print:bg-transparent font-bold">
                    <tr>
                      {groupBy === 'Detailed' ? (
                        <>
                          <td colSpan={5} className="py-3 px-2 text-right">Grand Total:</td>
                          <td className="py-3 px-2 text-right text-lg">₹{totalAmount.toFixed(2)}</td>
                        </>
                      ) : (
                        <>
                          <td className="py-3 px-2 text-right">Grand Total:</td>
                          <td className="py-3 px-2 text-right">{totalTransactions}</td>
                          <td className="py-3 px-2 text-right text-lg">₹{totalAmount.toFixed(2)}</td>
                        </>
                      )}
                    </tr>
                  </tfoot>
                </table>
              )}
            </div>
          )}
        </ReportViewer>
      </div>
    </div>
  );
}
