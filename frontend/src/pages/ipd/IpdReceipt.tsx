import React, { useState, useEffect } from 'react';
import { useLocation } from 'react-router-dom';
import { useQuery } from '@tanstack/react-query';
import api from '../../lib/api';
import { Printer, Search, FileText } from 'lucide-react';
import { format } from 'date-fns';
import { PrintLayout, PrintHeader, PrintPatientDemographics, PrintTable, PrintFooter } from '../../components/shared/PrintTemplates';

export function IpdReceipt() {
  const location = useLocation();
  const state = location.state as { autoSelectVchNo?: number, type?: 'bill' | 'adm' } | null;

  const [searchTerm, setSearchTerm] = useState('');
  const [selectedRecord, setSelectedRecord] = useState<any>(null);
  const [recordType, setRecordType] = useState<'bill' | 'adm'>(state?.type || 'bill');

  const { data: bills, isLoading: billsLoading } = useQuery({
    queryKey: ['ipdBills'],
    queryFn: async () => (await api.get<any[]>('/ipd/bills')).data
  });

  const { data: adms, isLoading: admsLoading } = useQuery({
    queryKey: ['ipdAdms'],
    queryFn: async () => (await api.get<any[]>('/ipd/admissions')).data
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
        const found = bills.find(b => b.IbhVchNo === state.autoSelectVchNo);
        if (found) setSelectedRecord(found);
      } else if (state.type === 'adm' && adms) {
        const found = adms.find(r => r.IhdVchNo === state.autoSelectVchNo);
        if (found) setSelectedRecord(found);
      }
    }
  }, [state, bills, adms]);

  const filteredBills = bills?.filter(b => 
    b.IbhVchNo.toString().includes(searchTerm) || 
    getPatientName(b.IbhPttCode).toLowerCase().includes(searchTerm.toLowerCase())
  ) || [];

  const filteredAdms = adms?.filter(r => 
    r.IhdVchNo.toString().includes(searchTerm) || 
    getPatientName(r.IhdPttCode).toLowerCase().includes(searchTerm.toLowerCase())
  ) || [];

  return (
    <div className="flex h-full -m-6 print:m-0 print:block">
      {/* Sidebar - Hidden on Print */}
      <div className="w-80 bg-white border-r border-medical-border flex flex-col print:hidden">
        <div className="p-4 border-b border-medical-border bg-gray-50">
          <h2 className="text-lg font-bold text-gray-800">IPD Receipts</h2>
          <div className="mt-4 space-y-3">
            <div className="flex bg-gray-200 p-1 rounded-md">
              <button 
                onClick={() => { setRecordType('bill'); setSelectedRecord(null); }}
                className={`flex-1 py-1 text-sm font-medium rounded ${recordType === 'bill' ? 'bg-white shadow-sm text-medical-primary' : 'text-gray-600 hover:text-gray-800'}`}
              >
                Final Bills
              </button>
              <button 
                onClick={() => { setRecordType('adm'); setSelectedRecord(null); }}
                className={`flex-1 py-1 text-sm font-medium rounded ${recordType === 'adm' ? 'bg-white shadow-sm text-medical-primary' : 'text-gray-600 hover:text-gray-800'}`}
              >
                Admissions
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
                  key={bill.IbhCode} 
                  onClick={() => setSelectedRecord(bill)}
                  className={`p-3 cursor-pointer hover:bg-gray-50 transition-colors ${selectedRecord?.IbhCode === bill.IbhCode ? 'bg-blue-50 border-l-4 border-medical-primary' : 'border-l-4 border-transparent'}`}
                >
                  <div className="flex justify-between items-start">
                    <div>
                      <p className="text-sm font-medium text-gray-900">{getPatientName(bill.IbhPttCode)}</p>
                      <p className="text-xs text-gray-500">Bill: {bill.IbhVchNo} • {format(new Date(bill.IbhDate), 'dd/MM/yyyy')}</p>
                    </div>
                    <span className="text-sm font-bold text-gray-700">₹{bill.IbhTotalAmt}</span>
                  </div>
                </li>
              ))}
            </ul>
          ) : (
            admsLoading ? <p className="text-center text-sm text-gray-500 mt-4">Loading adms...</p> :
            <ul className="divide-y divide-gray-100">
              {filteredAdms.map(adm => (
                <li 
                  key={adm.IhdCode} 
                  onClick={() => setSelectedRecord(adm)}
                  className={`p-3 cursor-pointer hover:bg-gray-50 transition-colors ${selectedRecord?.IhdCode === adm.IhdCode ? 'bg-blue-50 border-l-4 border-medical-primary' : 'border-l-4 border-transparent'}`}
                >
                  <div className="flex justify-between items-start">
                    <div>
                      <p className="text-sm font-medium text-gray-900">{getPatientName(adm.IhdPttCode)}</p>
                      <p className="text-xs text-gray-500">Adm: {adm.IhdVchNo} • {format(new Date(adm.IhdDate), 'dd/MM/yyyy')}</p>
                    </div>
                    <span className="text-sm font-bold text-gray-700">₹{adm.IhdAdvAmt}</span>
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
                title={recordType === 'bill' ? 'IPD FINAL BILL RECEIPT' : 'IPD ADMISSION / ADVANCE RECEIPT'}
              />
              
              <PrintPatientDemographics 
                patient={{
                  name: getPatientName(selectedRecord.IbhPttCode || selectedRecord.IhdPttCode),
                  regNo: selectedRecord.IbhPttCode || selectedRecord.IhdPttCode,
                  date: format(new Date(selectedRecord.IbhDate || selectedRecord.IhdDate), 'dd/MM/yyyy'),
                  doctor: 'Consulting Doctor'
                }}
              />

              <PrintTable 
                columns={[
                  { header: 'Description', accessor: 'desc' },
                  { header: 'Amount (₹)', accessor: 'amt', align: 'right' }
                ]}
                data={[
                  { 
                    desc: recordType === 'bill' ? 'Inpatient Hospitalization Services' : 'Advance Deposit for Admission',
                    amt: (recordType === 'bill' ? selectedRecord.IbhTotalAmt : selectedRecord.IhdAdvAmt)?.toFixed(2)
                  }
                ]}
              />

              <PrintFooter 
                totals={[
                  ...(recordType === 'bill' ? [
                    { label: 'Advance Adjusted', value: `- ₹${selectedRecord.IbhAdvAdj?.toFixed(2) || '0.00'}` },
                    { label: 'Deposited', value: `- ₹${selectedRecord.IbhDepAmt?.toFixed(2) || '0.00'}` }
                  ] : []),
                  { 
                    label: 'Net Amount', 
                    value: (recordType === 'bill' ? selectedRecord.IbhNetAmt : selectedRecord.IhdAdvAmt)?.toFixed(2) || '0.00' 
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


