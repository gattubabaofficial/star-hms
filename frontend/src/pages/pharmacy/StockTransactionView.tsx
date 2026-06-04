import React, { useState } from 'react';
import { useQuery } from '@tanstack/react-query';
import api from '../../lib/api';
import { History, Download, ArrowLeft } from 'lucide-react';
import { format } from 'date-fns';
import { useNavigate } from 'react-router-dom';
import { SearchableSelectWithCreate } from '../../components/ui/SearchableSelectWithCreate';

interface Transaction {
  Date: string;
  Type: 'Purchase' | 'Sale';
  VchNo: number;
  BatchNo: string;
  QtyIn: number;
  QtyOut: number;
  Rate: number;
  Balance: number;
}

export function StockTransactionView() {
  const navigate = useNavigate();
  const [selectedSimCode, setSelectedSimCode] = useState<number | null>(null);

  const { data: medicines } = useQuery({
    queryKey: ['medicines'],
    queryFn: async () => (await api.get<any[]>('/pharmacy/items')).data
  });

  const { data: transactions, isLoading } = useQuery({
    queryKey: ['transactions', selectedSimCode],
    queryFn: async () => {
      if (!selectedSimCode) return [];
      const res = await api.get<Transaction[]>(`/pharmacy/transactions/${selectedSimCode}`);
      return res.data;
    },
    enabled: !!selectedSimCode
  });

  const medicineOpts = medicines?.map(m => ({ value: m.SimCode, label: m.SimName })) || [];

  const printReport = () => {
    window.print();
  };

  return (
    <div className="max-w-6xl mx-auto space-y-6">
      <div className="flex items-center justify-between print:hidden">
        <div className="flex items-center gap-4">
          <button onClick={() => navigate('/pharmacy/stock')} className="p-2 hover:bg-gray-100 rounded-full"><ArrowLeft size={20} /></button>
          <div>
            <h1 className="text-2xl font-bold text-medical-text flex items-center gap-2"><History className="text-blue-600"/> Item Ledger</h1>
            <p className="text-sm text-gray-500">View chronological stock transactions</p>
          </div>
        </div>
        <button onClick={printReport} disabled={!transactions || transactions.length === 0} className="btn-primary flex items-center gap-2">
          <Download size={18} /> Print Ledger
        </button>
      </div>

      <div className="card print:shadow-none print:border-none print:p-0">
        <div className="mb-6 w-96 print:hidden">
          <label className="block text-sm font-medium text-gray-700 mb-2">Select Medicine to view Ledger</label>
          <SearchableSelectWithCreate 
            options={medicineOpts} 
            value={selectedSimCode} 
            onChange={(v) => setSelectedSimCode(v as number)} 
            placeholder="Search medicine..." 
          />
        </div>

        {selectedSimCode && (
          <div className="hidden print:block mb-6">
            <h2 className="text-xl font-bold text-center">ITEM STOCK LEDGER</h2>
            <h3 className="text-lg text-center mt-2">{medicineOpts.find(m => m.value === selectedSimCode)?.label}</h3>
            <hr className="my-4 border-gray-300"/>
          </div>
        )}

        {isLoading ? (
          <div className="py-12 flex justify-center"><div className="w-8 h-8 border-4 border-medical-primary border-t-transparent rounded-full animate-spin"></div></div>
        ) : selectedSimCode && transactions ? (
          <div className="overflow-x-auto">
            <table className="w-full text-left border-collapse data-table">
              <thead>
                <tr className="bg-gray-50">
                  <th className="py-3 px-4 font-semibold text-sm text-gray-600 border-b">Date</th>
                  <th className="py-3 px-4 font-semibold text-sm text-gray-600 border-b">Type</th>
                  <th className="py-3 px-4 font-semibold text-sm text-gray-600 border-b">Vch No</th>
                  <th className="py-3 px-4 font-semibold text-sm text-gray-600 border-b">Batch No</th>
                  <th className="py-3 px-4 font-semibold text-sm text-gray-600 border-b text-right">Inward Qty</th>
                  <th className="py-3 px-4 font-semibold text-sm text-gray-600 border-b text-right">Outward Qty</th>
                  <th className="py-3 px-4 font-semibold text-sm text-gray-600 border-b text-right">Balance</th>
                </tr>
              </thead>
              <tbody>
                {transactions.length === 0 ? (
                  <tr>
                    <td colSpan={7} className="text-center py-8 text-gray-500">No transactions found for this item.</td>
                  </tr>
                ) : (
                  transactions.map((t, idx) => (
                    <tr key={idx} className="border-b hover:bg-gray-50 transition-colors">
                      <td className="py-3 px-4 font-medium text-gray-700">{format(new Date(t.Date), 'dd MMM yyyy')}</td>
                      <td>
                        <span className={`px-2 py-1 rounded text-xs font-medium ${t.Type === 'Purchase' ? 'bg-blue-50 text-blue-700' : 'bg-green-50 text-green-700'}`}>
                          {t.Type}
                        </span>
                      </td>
                      <td className="py-3 px-4 text-gray-600">#{t.VchNo}</td>
                      <td className="py-3 px-4 text-gray-600">{t.BatchNo || '-'}</td>
                      <td className="py-3 px-4 text-right text-blue-600 font-medium">{t.QtyIn > 0 ? `+${t.QtyIn}` : '-'}</td>
                      <td className="py-3 px-4 text-right text-red-600 font-medium">{t.QtyOut > 0 ? `-${t.QtyOut}` : '-'}</td>
                      <td className="py-3 px-4 text-right font-bold text-gray-800">{t.Balance}</td>
                    </tr>
                  ))
                )}
              </tbody>
            </table>
          </div>
        ) : (
          <div className="py-12 text-center text-gray-400 print:hidden">
            <History size={48} className="mx-auto mb-4 opacity-20" />
            <p>Select a medicine from the dropdown to view its transaction ledger.</p>
          </div>
        )}
      </div>
    </div>
  );
}
