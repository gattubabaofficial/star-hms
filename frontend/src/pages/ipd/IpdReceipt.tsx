import React, { useState } from 'react';
import { useQuery } from '@tanstack/react-query';
import api from '../../lib/api';
import { Printer, Search, FileText } from 'lucide-react';
import { format } from 'date-fns';

export function IpdReceipt() {
  const [searchTerm, setSearchTerm] = useState('');
  const [selectedRecord, setSelectedRecord] = useState<any>(null);
  const [recordType, setRecordType] = useState<'bill' | 'adm'>('bill');

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
      <div className="w-80 bg-white border-r border-gray-200 flex flex-col print:hidden">
        <div className="p-4 border-b border-gray-200 bg-gray-50">
          <h2 className="text-lg font-bold text-gray-800">IPD Receipts</h2>
          <div className="mt-4 space-y-3">
            <div className="flex bg-gray-200 p-1 rounded-md">
              <button 
                onClick={() => { setRecordType('bill'); setSelectedRecord(null); }}
                className={`flex-1 py-1 text-sm font-medium rounded ${recordType === 'bill' ? 'bg-white shadow-sm text-medical-mutedblue' : 'text-gray-600 hover:text-gray-800'}`}
              >
                Final Bills
              </button>
              <button 
                onClick={() => { setRecordType('adm'); setSelectedRecord(null); }}
                className={`flex-1 py-1 text-sm font-medium rounded ${recordType === 'adm' ? 'bg-white shadow-sm text-medical-mutedblue' : 'text-gray-600 hover:text-gray-800'}`}
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
                className="w-full pl-9 pr-3 py-2 border border-gray-300 rounded-md text-sm focus:outline-none focus:border-medical-mutedblue focus:ring-1 focus:ring-medical-mutedblue"
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
                  className={`p-3 cursor-pointer hover:bg-gray-50 transition-colors ${selectedRecord?.IbhCode === bill.IbhCode ? 'bg-blue-50 border-l-4 border-medical-mutedblue' : 'border-l-4 border-transparent'}`}
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
                  className={`p-3 cursor-pointer hover:bg-gray-50 transition-colors ${selectedRecord?.IhdCode === adm.IhdCode ? 'bg-blue-50 border-l-4 border-medical-mutedblue' : 'border-l-4 border-transparent'}`}
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
            <div className="bg-white p-4 border-b border-gray-200 flex justify-end gap-3 print:hidden">
              <button onClick={handlePrint} className="btn-primary flex items-center gap-2">
                <Printer size={18} /> Print Receipt
              </button>
            </div>

            <div className="flex-1 p-8 overflow-y-auto print:p-0 print:overflow-visible">
              <div className="max-w-2xl mx-auto bg-white border border-gray-200 p-8 shadow-sm print:border-none print:shadow-none print:max-w-none print:w-full">
                
                <div className="text-center border-b-2 border-gray-800 pb-4 mb-6">
                  <h1 className="text-2xl font-bold uppercase text-gray-900 tracking-wide">{company?.CmpName || 'HOSPITAL NAME'}</h1>
                  <p className="text-sm text-gray-600">{company?.CmpAddress}, {company?.CmpCity}</p>
                  <p className="text-sm text-gray-600">Phone: {company?.CmpOPhone} {company?.CmpEmail ? `| Email: ${company?.CmpEmail}` : ''}</p>
                  <div className="mt-3 font-bold text-lg uppercase bg-gray-100 py-1 inline-block px-6 rounded">
                    {recordType === 'bill' ? 'IPD FINAL BILL RECEIPT' : 'IPD ADMISSION / ADVANCE RECEIPT'}
                  </div>
                </div>

                <div className="flex justify-between text-sm mb-6 border-b border-gray-200 pb-4">
                  <div className="space-y-1">
                    <p><span className="font-semibold text-gray-700">Patient Name:</span> <span className="font-bold text-gray-900">{getPatientName(selectedRecord.IbhPttCode || selectedRecord.IhdPttCode)}</span></p>
                    <p><span className="font-semibold text-gray-700">Patient ID:</span> {selectedRecord.IbhPttCode || selectedRecord.IhdPttCode}</p>
                  </div>
                  <div className="space-y-1 text-right">
                    <p><span className="font-semibold text-gray-700">Receipt No:</span> {selectedRecord.IbhVchNo || selectedRecord.IhdVchNo}</p>
                    <p><span className="font-semibold text-gray-700">Date:</span> {format(new Date(selectedRecord.IbhDate || selectedRecord.IhdDate), 'dd MMM yyyy')}</p>
                  </div>
                </div>

                <div className="mb-12">
                  <table className="w-full text-sm text-left">
                    <thead className="border-b border-gray-300">
                      <tr>
                        <th className="py-2 font-semibold text-gray-800">Description</th>
                        <th className="py-2 font-semibold text-gray-800 text-right">Amount (₹)</th>
                      </tr>
                    </thead>
                    <tbody className="divide-y divide-gray-100">
                      {recordType === 'bill' ? (
                        <tr>
                          <td className="py-3 text-gray-700">Inpatient Hospitalization Services</td>
                          <td className="py-3 text-right font-medium">{selectedRecord.IbhTotalAmt.toFixed(2)}</td>
                        </tr>
                      ) : (
                        <tr>
                          <td className="py-3 text-gray-700">Advance Deposit for Admission</td>
                          <td className="py-3 text-right font-medium">{selectedRecord.IhdAdvAmt.toFixed(2)}</td>
                        </tr>
                      )}
                    </tbody>
                  </table>
                </div>

                <div className="flex justify-end border-t-2 border-gray-800 pt-4 mb-16">
                  <div className="w-64 space-y-2 text-sm">
                    {recordType === 'bill' && (
                      <>
                        <div className="flex justify-between text-gray-600">
                          <span>Advance Adjusted:</span>
                          <span>- ₹{selectedRecord.IbhAdvAdj.toFixed(2)}</span>
                        </div>
                        <div className="flex justify-between text-gray-600">
                          <span>Deposited:</span>
                          <span>- ₹{selectedRecord.IbhDepAmt.toFixed(2)}</span>
                        </div>
                      </>
                    )}
                    <div className="flex justify-between font-bold text-lg pt-2 border-t border-gray-200">
                      <span>Total Net Amount:</span>
                      <span>₹{(recordType === 'bill' ? selectedRecord.IbhNetAmt : selectedRecord.IhdAdvAmt).toFixed(2)}</span>
                    </div>
                  </div>
                </div>

                <div className="flex justify-between text-sm mt-20 pt-8 border-t border-gray-200">
                  <div className="text-center">
                    <p className="border-t border-gray-400 w-32 pt-1 font-medium text-gray-600">Patient's Signature</p>
                  </div>
                  <div className="text-center">
                    <p className="border-t border-gray-400 w-32 pt-1 font-medium text-gray-600">Authorized Signatory</p>
                  </div>
                </div>

                <div className="text-center text-xs text-gray-400 mt-8">
                  <p>Thank you for choosing {company?.CmpName}. Get well soon!</p>
                  <p>Printed on {format(new Date(), 'dd/MM/yyyy HH:mm')}</p>
                </div>

              </div>
            </div>
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
