import React, { useState } from 'react';
import { useQuery } from '@tanstack/react-query';
import api from '../../lib/api';
import { Search, Download, Package } from 'lucide-react';
import { format } from 'date-fns';
import { PrintLayout, PrintHeader, PrintTable, PrintFooter } from '../../components/shared/PrintTemplates';

export function StockRegister() {
  const [searchTerm, setSearchTerm] = useState('');

  const { data: stockItems, isLoading } = useQuery({
    queryKey: ['pharmacy-stock'],
    queryFn: async () => {
      const res = await api.get<any[]>('/pharmacy/stock');
      return res.data;
    }
  });

  const printReport = () => {
    window.print();
  };

  const filteredItems = stockItems?.filter(item => 
    item.ItemName.toLowerCase().includes(searchTerm.toLowerCase()) ||
    item.GroupName.toLowerCase().includes(searchTerm.toLowerCase())
  );

  const totalItems = stockItems?.length || 0;
  const outOfStock = stockItems?.filter(item => item.CurrentStock <= 0).length || 0;

  const { data: company } = useQuery({
    queryKey: ['company'],
    queryFn: async () => (await api.get<any>('/system/company')).data
  });

  return (
    <div className="max-w-6xl mx-auto space-y-6">
      <div className="flex flex-col md:flex-row md:justify-between md:items-end gap-4 print:hidden">
        <div>
          <h1 className="text-2xl font-bold text-medical-text">Stock Register</h1>
          <p className="text-gray-500 text-sm mt-1">Real-time inventory levels for pharmacy items</p>
        </div>
        
        <div className="flex gap-3">
          <div className="relative">
            <Search className="absolute left-3 top-1/2 -translate-y-1/2 text-gray-400" size={18} />
            <input
              type="text"
              placeholder="Search items..."
              value={searchTerm}
              onChange={(e) => setSearchTerm(e.target.value)}
              className="pl-10 pr-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-medical-primary w-64"
            />
          </div>
          <button onClick={printReport} className="btn-primary flex items-center gap-2">
            <Download size={18} /> Print Stock
          </button>
        </div>
      </div>

      <div className="card print:shadow-none print:border-none print:p-0 print:bg-transparent">
        <div className="hidden print:block">
          <PrintLayout>
            <PrintHeader 
              hospitalName={company?.CmpName || 'STAR HOSPITAL'} 
              address={`${company?.CmpAddress || ''}, ${company?.CmpCity || ''}`}
              contact={`Ph: ${company?.CmpOPhone || ''}`}
              title="PHARMACY STOCK REGISTER"
            />
          </PrintLayout>
        </div>

        {isLoading ? (
          <div className="py-12 flex justify-center"><div className="w-8 h-8 border-4 border-medical-primary border-t-transparent rounded-full animate-spin"></div></div>
        ) : (
          <div>
            <div className="grid grid-cols-2 gap-4 mb-6 print:hidden">
              <div className="bg-blue-50 p-4 rounded-lg border border-blue-100 flex items-center gap-4">
                <div className="w-12 h-12 bg-blue-100 rounded-full flex items-center justify-center text-blue-600">
                  <Package size={24} />
                </div>
                <div>
                  <p className="text-sm text-blue-600 font-medium">Total Registered Items</p>
                  <p className="text-2xl font-bold text-blue-900">{totalItems}</p>
                </div>
              </div>
              <div className="bg-red-50 p-4 rounded-lg border border-red-100 flex items-center gap-4">
                <div className="w-12 h-12 bg-red-100 rounded-full flex items-center justify-center text-red-600">
                  <Package size={24} />
                </div>
                <div>
                  <p className="text-sm text-red-600 font-medium">Out of Stock</p>
                  <p className="text-2xl font-bold text-red-900">{outOfStock}</p>
                </div>
              </div>
            </div>

            <div className="print:hidden">
              <table className="data-table">
                <thead>
                  <tr>
                    <th>Item Code</th>
                    <th>Item Name</th>
                    <th>Batch No</th>
                    <th>Expiry</th>
                    <th>MRP (₹)</th>
                    <th className="text-right">Total Inward</th>
                    <th className="text-right">Total Outward</th>
                    <th className="text-right">Current Stock</th>
                  </tr>
                </thead>
                <tbody>
                  {filteredItems?.length === 0 ? (
                    <tr>
                      <td colSpan={6} className="text-center py-8 text-gray-500">No items found matching your search.</td>
                    </tr>
                  ) : (
                    filteredItems?.map((item, index) => (
                      <tr key={index}>
                        <td className="font-mono text-gray-500 text-sm">{item.SimCode}</td>
                        <td className="font-medium text-gray-800">
                          {item.ItemName}
                          <div className="text-xs text-gray-500">{item.GroupName}</div>
                        </td>
                        <td className="font-mono text-sm">{item.BatchNo || '-'}</td>
                        <td className="text-sm">{item.ExpiryDate || '-'}</td>
                        <td className="text-sm">{item.MRP?.toFixed(2) || '-'}</td>
                        <td className="text-right text-gray-600">{item.InwardQty}</td>
                        <td className="text-right text-gray-600">{item.OutwardQty}</td>
                        <td className={`text-right font-bold ${item.CurrentStock <= 0 ? 'text-red-600' : 'text-green-600'}`}>
                          {item.CurrentStock}
                        </td>
                      </tr>
                    ))
                  )}
                </tbody>
              </table>
            </div>

            <div className="hidden print:block">
              <PrintTable 
                columns={[
                  { header: 'Code', accessor: 'code' },
                  { header: 'Item Name', accessor: 'name' },
                  { header: 'Batch', accessor: 'batch' },
                  { header: 'Expiry', accessor: 'expiry' },
                  { header: 'Inward', accessor: 'in', align: 'right' },
                  { header: 'Outward', accessor: 'out', align: 'right' },
                  { header: 'Stock', accessor: 'stock', align: 'right' }
                ]}
                data={(filteredItems || []).map(item => ({
                  code: item.SimCode,
                  name: item.ItemName,
                  batch: item.BatchNo || '-',
                  expiry: item.ExpiryDate || '-',
                  in: item.InwardQty,
                  out: item.OutwardQty,
                  stock: item.CurrentStock
                }))}
              />
              <PrintFooter 
                totals={[
                  { label: 'Total Registered Items', value: totalItems.toString() },
                  { label: 'Out of Stock Items', value: outOfStock.toString() }
                ]}
                generatedBy="System Admin"
              />
            </div>
          </div>
        )}
      </div>
    </div>
  );
}

