import React, { useState, useEffect } from 'react';
import { useLocation } from 'react-router-dom';
import { useQuery } from '@tanstack/react-query';
import api from '../../lib/api';
import { Printer, Search, FileText } from 'lucide-react';
import { format } from 'date-fns';
import { PrintLayout, PrintHeader, PrintPatientDemographics, PrintTable, PrintFooter } from '../../components/shared/PrintTemplates';

export function OpdReceipt() {
  const location = useLocation();
  const state = location.state as { autoSelectVchNo?: number, type?: 'bill' | 'reg' } | null;

  const [searchTerm, setSearchTerm] = useState('');
  const [selectedRecord, setSelectedRecord] = useState<any>(null);
  const [recordType, setRecordType] = useState<'bill' | 'reg'>(state?.type || 'bill');

  const { data: bills, isLoading: billsLoading } = useQuery({
    queryKey: ['opdBills'],
    queryFn: async () => (await api.get<any[]>('/opd/bills')).data
  });

  const { data: regs, isLoading: regsLoading } = useQuery({
    queryKey: ['opdRegs'],
    queryFn: async () => (await api.get<any[]>('/opd/registrations')).data
  });

  const { data: patients } = useQuery({
    queryKey: ['patients'],
    queryFn: async () => (await api.get<any[]>('/masters/patients')).data
  });

  const { data: company } = useQuery({
    queryKey: ['company'],
    queryFn: async () => (await api.get<any>('/system/company')).data
  });

  const getPatientName = (pttCode: number) => {
    return patients?.find(p => p.PttCode === pttCode)?.PttName || `Unknown (${pttCode})`;
  };

  const handlePrint = () => {
    window.print();
  };

  useEffect(() => {
    if (state?.autoSelectVchNo) {
      if (state.type === 'bill' && bills) {
        const found = bills.find(b => b.OhdVchNo === state.autoSelectVchNo);
        if (found) setSelectedRecord(found);
      } else if (state.type === 'reg' && regs) {
        const found = regs.find(r => r.OpgVchNo === state.autoSelectVchNo);
        if (found) setSelectedRecord(found);
      }
    }
  }, [state, bills, regs]);

  const filteredBills = bills?.filter(b => 
    b.OhdVchNo.toString().includes(searchTerm) || 
    getPatientName(b.OhdPttCode).toLowerCase().includes(searchTerm.toLowerCase())
  ) || [];

  const filteredRegs = regs?.filter(r => 
    r.OpgVchNo.toString().includes(searchTerm) || 
    getPatientName(r.OpgPttCode).toLowerCase().includes(searchTerm.toLowerCase())
  ) || [];

  return (
    <div className="flex h-full -m-6 print:m-0 print:block">
      {/* Sidebar - Hidden on Print */}
      <div className="w-80 bg-white border-r border-medical-border flex flex-col print:hidden">
        <div className="p-4 border-b border-medical-border bg-gray-50">
          <h2 className="text-lg font-bold text-gray-800">OPD Receipts</h2>
          <div className="mt-4 space-y-3">
            <div className="flex bg-gray-200 p-1 rounded-md">
              <button 
                onClick={() => { setRecordType('bill'); setSelectedRecord(null); }}
                className={`flex-1 py-1 text-sm font-medium rounded ${recordType === 'bill' ? 'bg-white shadow-sm text-medical-primary' : 'text-gray-600 hover:text-gray-800'}`}
              >
                Bills
              </button>
              <button 
                onClick={() => { setRecordType('reg'); setSelectedRecord(null); }}
                className={`flex-1 py-1 text-sm font-medium rounded ${recordType === 'reg' ? 'bg-white shadow-sm text-medical-primary' : 'text-gray-600 hover:text-gray-800'}`}
              >
                Registrations
              </button>
            </div>
            <div className="relative">
              <Search className="absolute left-3 top-2.5 text-gray-400" size={16} />
              <input 
                type="text" 
                placeholder="Search Patient or VchNo..." 
                value={searchTerm}
                onChange={e => setSearchTerm(e.target.value)}
                className="w-full pl-9 pr-3 py-2 border border-medical-border rounded-md text-sm focus:outline-none focus:border-medical-primary focus:ring-1 focus:ring-medical-primary"
              />
            </div>
          </div>
        </div>

        <div className="flex-1 overflow-y-auto">
          {recordType === 'bill' ? (
            billsLoading ? <p className="text-center text-sm text-gray-500 mt-4">Loading bills...</p> :
            <ul className="divide-y divide-gray-100">
              {filteredBills.map(bill => (
                <li 
                  key={bill.OhdCode} 
                  onClick={() => setSelectedRecord(bill)}
                  className={`p-3 cursor-pointer hover:bg-gray-50 transition-colors ${selectedRecord?.OhdCode === bill.OhdCode ? 'bg-blue-50 border-l-4 border-medical-primary' : 'border-l-4 border-transparent'}`}
                >
                  <div className="flex justify-between items-start">
                    <div>
                      <p className="text-sm font-medium text-gray-900">{getPatientName(bill.OhdPttCode)}</p>
                      <p className="text-xs text-gray-500">Vch: {bill.OhdVchNo} • {format(new Date(bill.OhdDate), 'dd/MM/yyyy')}</p>
                    </div>
                    <span className="text-sm font-bold text-gray-700">₹{bill.OhdTotalAmt}</span>
                  </div>
                </li>
              ))}
            </ul>
          ) : (
            regsLoading ? <p className="text-center text-sm text-gray-500 mt-4">Loading regs...</p> :
            <ul className="divide-y divide-gray-100">
              {filteredRegs.map(reg => (
                <li 
                  key={reg.OpgCode} 
                  onClick={() => setSelectedRecord(reg)}
                  className={`p-3 cursor-pointer hover:bg-gray-50 transition-colors ${selectedRecord?.OpgCode === reg.OpgCode ? 'bg-blue-50 border-l-4 border-medical-primary' : 'border-l-4 border-transparent'}`}
                >
                  <div className="flex justify-between items-start">
                    <div>
                      <p className="text-sm font-medium text-gray-900">{getPatientName(reg.OpgPttCode)}</p>
                      <p className="text-xs text-gray-500">Reg: {reg.OpgVchNo} • {format(new Date(reg.OpgDate), 'dd/MM/yyyy')}</p>
                    </div>
                    <span className="text-sm font-bold text-gray-700">₹{reg.OpgRegAmt}</span>
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
                <Printer size={18} /> Print Receipt
              </button>
            </div>

            {/* Printable Area using Standard Templates */}
            <PrintLayout>
              <PrintHeader 
                hospitalName={company?.CmpName || 'STAR HOSPITAL'} 
                address={`${company?.CmpAddress || ''}, ${company?.CmpCity || ''}`}
                contact={`Ph: ${company?.CmpOPhone || ''}`}
                title={recordType === 'bill' ? 'OPD BILL RECEIPT' : 'OPD REGISTRATION RECEIPT'}
              />
              
              <PrintPatientDemographics 
                patient={{
                  name: getPatientName(selectedRecord.OhdPttCode || selectedRecord.OpgPttCode),
                  regNo: selectedRecord.OhdPttCode || selectedRecord.OpgPttCode,
                  date: format(new Date(selectedRecord.OhdDate || selectedRecord.OpgDate), 'dd/MM/yyyy'),
                  doctor: 'Consulting Doctor' // Needs proper mapping
                }}
              />

              <PrintTable 
                columns={[
                  { header: 'Description', accessor: 'desc' },
                  { header: 'Amount (₹)', accessor: 'amt', align: 'right' }
                ]}
                data={[
                  { 
                    desc: recordType === 'bill' ? 'Outpatient Consultation & Services' : 'OPD Registration Fee',
                    amt: (recordType === 'bill' ? selectedRecord.OhdTotalAmt : selectedRecord.OpgRegAmt)?.toFixed(2)
                  }
                ]}
              />

              <PrintFooter 
                totals={[
                  ...(recordType === 'bill' ? [
                    { label: 'Discount', value: `- ₹${selectedRecord.OhdDiscAmt?.toFixed(2) || '0.00'}` },
                    { label: 'Deposited', value: `- ₹${selectedRecord.OhdDepAmt?.toFixed(2) || '0.00'}` }
                  ] : []),
                  { 
                    label: 'Net Amount', 
                    value: (recordType === 'bill' ? selectedRecord.OhdNetAmt : selectedRecord.OpgRegAmt)?.toFixed(2) || '0.00' 
                  }
                ]}
                generatedBy="System Admin"
              />
            </PrintLayout>
          </>
        ) : (
          <div className="h-full flex flex-col items-center justify-center text-gray-400 print:hidden">
            <FileText size={48} className="mb-4 text-gray-300" />
            <p className="text-lg">Select a record to view its receipt</p>
          </div>
        )}
      </div>
    </div>
  );
}


