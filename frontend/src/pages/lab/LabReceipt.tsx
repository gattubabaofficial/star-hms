import React, { useState } from 'react';
import { useQuery } from '@tanstack/react-query';
import api from '../../lib/api';
import { Printer, Search, FileText } from 'lucide-react';
import { format } from 'date-fns';

export function LabReceipt() {
  const [searchTerm, setSearchTerm] = useState('');
  const [selectedRecord, setSelectedRecord] = useState<any>(null);

  const { data: regs, isLoading: regsLoading } = useQuery({
    queryKey: ['labRegs'],
    queryFn: async () => (await api.get<any[]>('/lab/registrations')).data
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

  const filteredRegs = regs?.filter(r => 
    r.LhdVchNo.toString().includes(searchTerm) || 
    getPatientName(r.LhdPttCode).toLowerCase().includes(searchTerm.toLowerCase())
  ) || [];

  return (
    <div className="flex h-full -m-6 print:m-0 print:block">
      {/* Sidebar - Hidden on Print */}
      <div className="w-80 bg-white border-r border-medical-border flex flex-col print:hidden">
        <div className="p-4 border-b border-medical-border bg-gray-50">
          <h2 className="text-lg font-bold text-gray-800">Lab Receipts</h2>
          <div className="mt-4">
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
          {regsLoading ? <p className="text-center text-sm text-gray-500 mt-4">Loading regs...</p> :
          <ul className="divide-y divide-gray-100">
            {filteredRegs.map(reg => (
              <li 
                key={reg.LhdCode} 
                onClick={() => setSelectedRecord(reg)}
                className={`p-3 cursor-pointer hover:bg-gray-50 transition-colors ${selectedRecord?.LhdCode === reg.LhdCode ? 'bg-blue-50 border-l-4 border-medical-primary' : 'border-l-4 border-transparent'}`}
              >
                <div className="flex justify-between items-start">
                  <div>
                    <p className="text-sm font-medium text-gray-900">{getPatientName(reg.LhdPttCode)}</p>
                    <p className="text-xs text-gray-500">Reg: {reg.LhdVchNo} • {format(new Date(reg.LhdDate), 'dd/MM/yyyy')}</p>
                  </div>
                  <span className="text-sm font-bold text-gray-700">₹{reg.LhdTotalAmt}</span>
                </div>
              </li>
            ))}
          </ul>}
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

            <div className="flex-1 p-8 overflow-y-auto print:p-0 print:overflow-visible">
              <div className="max-w-2xl mx-auto bg-white border border-medical-border p-8 shadow-sm print:border-none print:shadow-none print:max-w-none print:w-full">
                
                <div className="text-center border-b-2 border-gray-800 pb-4 mb-6">
                  <h1 className="text-2xl font-bold uppercase text-gray-900 tracking-wide">{company?.CmpName || 'HOSPITAL NAME'}</h1>
                  <p className="text-sm text-gray-600">{company?.CmpAddress}, {company?.CmpCity}</p>
                  <p className="text-sm text-gray-600">Phone: {company?.CmpOPhone} {company?.CmpEmail ? `| Email: ${company?.CmpEmail}` : ''}</p>
                  <div className="mt-3 font-bold text-lg uppercase bg-gray-100 py-1 inline-block px-6 rounded">
                    LABORATORY INVESTIGATION RECEIPT
                  </div>
                </div>

                <div className="flex justify-between text-sm mb-6 border-b border-medical-border pb-4">
                  <div className="space-y-1">
                    <p><span className="font-semibold text-gray-700">Patient Name:</span> <span className="font-bold text-gray-900">{getPatientName(selectedRecord.LhdPttCode)}</span></p>
                    <p><span className="font-semibold text-gray-700">Patient ID:</span> {selectedRecord.LhdPttCode}</p>
                  </div>
                  <div className="space-y-1 text-right">
                    <p><span className="font-semibold text-gray-700">Receipt No:</span> {selectedRecord.LhdVchNo}</p>
                    <p><span className="font-semibold text-gray-700">Date:</span> {format(new Date(selectedRecord.LhdDate), 'dd MMM yyyy')}</p>
                  </div>
                </div>

                <div className="mb-12">
                  <table className="w-full text-sm text-left">
                    <thead className="border-b border-medical-border">
                      <tr>
                        <th className="py-2 font-semibold text-gray-800">Description</th>
                        <th className="py-2 font-semibold text-gray-800 text-right">Amount (₹)</th>
                      </tr>
                    </thead>
                    <tbody className="divide-y divide-gray-100">
                      <tr>
                        <td className="py-3 text-gray-700">Laboratory Investigations & Pathological Services</td>
                        <td className="py-3 text-right font-medium">{selectedRecord.LhdTotalAmt.toFixed(2)}</td>
                      </tr>
                    </tbody>
                  </table>
                </div>

                <div className="flex justify-end border-t-2 border-gray-800 pt-4 mb-16">
                  <div className="w-64 space-y-2 text-sm">
                    <div className="flex justify-between text-gray-600">
                      <span>Discount:</span>
                      <span>- ₹{selectedRecord.LhdDiscAmt.toFixed(2)}</span>
                    </div>
                    <div className="flex justify-between font-bold text-lg pt-2 border-t border-medical-border">
                      <span>Total Net Amount:</span>
                      <span>₹{selectedRecord.LhdNetAmt.toFixed(2)}</span>
                    </div>
                  </div>
                </div>

                <div className="flex justify-between text-sm mt-20 pt-8 border-t border-medical-border">
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


