import React, { useState, useEffect } from 'react';
import { useLocation } from 'react-router-dom';
import { useQuery } from '@tanstack/react-query';
import api from '../../lib/api';
import { Printer, Search, FileText } from 'lucide-react';
import { format } from 'date-fns';
import { PrintLayout, PrintHeader, PrintPatientDemographics, PrintTable, PrintFooter } from '../../components/shared/PrintTemplates';

export function PharmacyReceipt() {
  const location = useLocation();
  const state = location.state as { autoSelectVchNo?: number, type?: 'purchase' | 'sale' } | null;

  const [searchTerm, setSearchTerm] = useState('');
  const [selectedRecord, setSelectedRecord] = useState<any>(null);
  const [recordType, setRecordType] = useState<'purchase' | 'sale'>(state?.type || 'purchase');

  const { data: purchases, isLoading: purchasesLoading } = useQuery({
    queryKey: ['pharmacy-purchases'],
    queryFn: async () => (await api.get<any[]>('/pharmacy/purchases')).data
  });

  const { data: sales, isLoading: salesLoading } = useQuery({
    queryKey: ['pharmacy-sales'],
    queryFn: async () => (await api.get<any[]>('/pharmacy/sales')).data
  });

  const { data: parties } = useQuery({
    queryKey: ['parties'],
    queryFn: async () => (await api.get<any[]>('/pharmacy/parties')).data
  });

  const { data: company } = useQuery({
    queryKey: ['company'],
    queryFn: async () => (await api.get<any>('/system/company')).data
  });

  const getPartyName = (ptyCode: number | null) => {
    if (!ptyCode) return 'Walk-in / Cash';
    return parties?.find(p => p.PtyCode === ptyCode)?.PtyName || `Unknown (${ptyCode})`;
  };

  const handlePrint = () => {
    window.print();
  };

  useEffect(() => {
    if (state?.autoSelectVchNo) {
      if (state.type === 'purchase' && purchases) {
        const found = purchases.find(p => p.IskVchNo === state.autoSelectVchNo);
        if (found) setSelectedRecord(found);
      } else if (state.type === 'sale' && sales) {
        const found = sales.find(s => s.OskVchNo === state.autoSelectVchNo);
        if (found) setSelectedRecord(found);
      }
    }
  }, [state, purchases, sales]);

  const filteredPurchases = purchases?.filter(p => 
    p.IskVchNo.toString().includes(searchTerm) || 
    getPartyName(p.IskPtyCode).toLowerCase().includes(searchTerm.toLowerCase())
  ) || [];

  const filteredSales = sales?.filter(s => 
    s.OskVchNo.toString().includes(searchTerm) || 
    getPartyName(s.OskPtyCode).toLowerCase().includes(searchTerm.toLowerCase())
  ) || [];

  return (
    <div className="flex h-full -m-6 print:m-0 print:block">
      {/* Sidebar - Hidden on Print */}
      <div className="w-80 bg-white border-r border-medical-border flex flex-col print:hidden">
        <div className="p-4 border-b border-medical-border bg-gray-50">
          <h2 className="text-lg font-bold text-gray-800">Pharmacy Vouchers</h2>
          <div className="mt-4 space-y-3">
            <div className="flex bg-gray-200 p-1 rounded-md">
              <button 
                onClick={() => { setRecordType('purchase'); setSelectedRecord(null); }}
                className={`flex-1 py-1 text-sm font-medium rounded ${recordType === 'purchase' ? 'bg-white shadow-sm text-medical-primary' : 'text-gray-600 hover:text-gray-800'}`}
              >
                Purchases
              </button>
              <button 
                onClick={() => { setRecordType('sale'); setSelectedRecord(null); }}
                className={`flex-1 py-1 text-sm font-medium rounded ${recordType === 'sale' ? 'bg-white shadow-sm text-medical-primary' : 'text-gray-600 hover:text-gray-800'}`}
              >
                Sales
              </button>
            </div>
            <div className="relative">
              <Search className="absolute left-3 top-2.5 text-gray-400" size={16} />
              <input 
                type="text" 
                placeholder="Search Party or VchNo..." 
                value={searchTerm}
                onChange={e => setSearchTerm(e.target.value)}
                className="w-full pl-9 pr-3 py-2 border border-medical-border rounded-md text-sm focus:outline-none focus:border-medical-primary focus:ring-1 focus:ring-medical-primary"
              />
            </div>
          </div>
        </div>

        <div className="flex-1 overflow-y-auto">
          {recordType === 'purchase' ? (
            purchasesLoading ? <p className="text-center text-sm text-gray-500 mt-4">Loading purchases...</p> :
            <ul className="divide-y divide-gray-100">
              {filteredPurchases.map(pur => (
                <li 
                  key={pur.IskCode} 
                  onClick={() => setSelectedRecord(pur)}
                  className={`p-3 cursor-pointer hover:bg-gray-50 transition-colors ${selectedRecord?.IskCode === pur.IskCode ? 'bg-blue-50 border-l-4 border-medical-primary' : 'border-l-4 border-transparent'}`}
                >
                  <div className="flex justify-between items-start">
                    <div>
                      <p className="text-sm font-medium text-gray-900">{getPartyName(pur.IskPtyCode)}</p>
                      <p className="text-xs text-gray-500">PO: {pur.IskVchNo} • {format(new Date(pur.IskDate), 'dd/MM/yyyy')}</p>
                    </div>
                    <span className="text-sm font-bold text-gray-700">₹{pur.IskNetAmt}</span>
                  </div>
                </li>
              ))}
            </ul>
          ) : (
            salesLoading ? <p className="text-center text-sm text-gray-500 mt-4">Loading sales...</p> :
            <ul className="divide-y divide-gray-100">
              {filteredSales.map(sale => (
                <li 
                  key={sale.OskCode} 
                  onClick={() => setSelectedRecord(sale)}
                  className={`p-3 cursor-pointer hover:bg-gray-50 transition-colors ${selectedRecord?.OskCode === sale.OskCode ? 'bg-blue-50 border-l-4 border-medical-primary' : 'border-l-4 border-transparent'}`}
                >
                  <div className="flex justify-between items-start">
                    <div>
                      <p className="text-sm font-medium text-gray-900">{getPartyName(sale.OskPtyCode)}</p>
                      <p className="text-xs text-gray-500">Bill: {sale.OskVchNo} • {format(new Date(sale.OskDate), 'dd/MM/yyyy')}</p>
                    </div>
                    <span className="text-sm font-bold text-gray-700">₹{sale.OskNetAmt}</span>
                  </div>
                </li>
              ))}
            </ul>
          )}
        </div>
      </div>

      {/* Main Content Area */}
      <div className="flex-1 bg-gray-50 flex flex-col print:bg-white print:w-full">
        {selectedRecord ? (
          <>
            {/* Header Toolbar - Hidden on Print */}
            <div className="bg-white p-4 border-b border-medical-border flex justify-end gap-3 print:hidden">
              <button onClick={handlePrint} className="btn-primary flex items-center gap-2">
                <Printer size={18} /> Print Voucher
              </button>
            </div>

            {/* Printable Area using Standard Templates */}
            <PrintLayout>
              <PrintHeader 
                hospitalName={company?.CmpName || 'STAR HOSPITAL'} 
                address={`${company?.CmpAddress || ''}, ${company?.CmpCity || ''}`}
                contact={`Ph: ${company?.CmpOPhone || ''}`}
                title={recordType === 'purchase' ? 'PHARMACY PURCHASE INWARD' : 'PHARMACY SALES BILL'}
              />
              
              <PrintPatientDemographics 
                patient={{
                  name: getPartyName(selectedRecord.IskPtyCode || selectedRecord.OskPtyCode),
                  regNo: selectedRecord.IskVchNo || selectedRecord.OskVchNo,
                  date: format(new Date(selectedRecord.IskDate || selectedRecord.OskDate), 'dd/MM/yyyy'),
                  doctor: selectedRecord.IskRefNo || selectedRecord.OskRefNo || 'N/A' // Use RefNo as extra info
                }}
              />

              <PrintTable 
                columns={[
                  { header: 'Particulars', accessor: 'desc' },
                  { header: 'Amount (₹)', accessor: 'amt', align: 'right' }
                ]}
                data={[
                  { 
                    desc: recordType === 'purchase' ? 'Medicines & Supplies (Bulk Purchase)' : 'Medicines & Consumables (Retail Sales)',
                    amt: (selectedRecord.IskNetAmt || selectedRecord.OskNetAmt)?.toFixed(2)
                  }
                ]}
              />

              <PrintFooter 
                totals={[
                  { label: 'Tax', value: `₹${(selectedRecord.IskTax || selectedRecord.OskTax)?.toFixed(2) || '0.00'}` },
                  { label: 'Other Charges', value: `₹${(selectedRecord.IskOtherChg || selectedRecord.OskOtherChg)?.toFixed(2) || '0.00'}` },
                  { 
                    label: 'Net Amount', 
                    value: (selectedRecord.IskNetAmt || selectedRecord.OskNetAmt)?.toFixed(2) || '0.00' 
                  }
                ]}
                generatedBy="System Admin"
              />
            </PrintLayout>
          </>
        ) : (
          <div className="h-full flex flex-col items-center justify-center text-gray-400 print:hidden">
            <FileText size={48} className="mb-4 text-gray-300" />
            <p className="text-lg">Select a voucher to view</p>
          </div>
        )}
      </div>
    </div>
  );
}


