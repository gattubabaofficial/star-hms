import { useState, useEffect } from 'react';
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import { useNavigate } from 'react-router-dom';
import api from '../../lib/api';
import { Save, ArrowLeft, Plus, Trash2 } from 'lucide-react';
import { SearchableSelectWithCreate } from '../../components/ui/SearchableSelectWithCreate';

interface BillItem {
  IbdSrvCode: number | null;
  IbdUnit: number;
  IbdRate: number;
  IbdAmtBefDisc: number;
  IbdDiscPer: number;
  IbdDiscAmt: number;
  IbdAmtAftDisc: number;
}

export function IPDBilling() {
  const queryClient = useQueryClient();
  const navigate = useNavigate();
  
  const [header, setHeader] = useState({
    IbhDate: new Date().toISOString().split('T')[0],
    IbhPttCode: null as number | null,
    IbhIhdCode: null as number | null,
    IbhTotalAmt: 0,
    IbhDiscPer: 0,
    IbhDepAmt: 0,
    IbhBalAmt: 0,
    IbhRemark: ''
  });

  const [items, setItems] = useState<BillItem[]>([
    { IbdSrvCode: null, IbdUnit: 1, IbdRate: 0, IbdAmtBefDisc: 0, IbdDiscPer: 0, IbdDiscAmt: 0, IbdAmtAftDisc: 0 }
  ]);

  const { data: admissions } = useQuery({ queryKey: ['ipd-admissions'], queryFn: async () => (await api.get<any[]>('/ipd/admissions')).data });
  const { data: services } = useQuery({ queryKey: ['services'], queryFn: async () => (await api.get<any[]>('/masters/services')).data });

  // Map active admissions for the dropdown
  const adminOpts = admissions?.filter(a => a.IhdStatus === 'Admitted').map(a => ({ value: a.IhdCode, label: `IPD-${a.IhdVchNo} (Patient ID: ${a.IhdPttCode})`, pttCode: a.IhdPttCode })) || [];
  const serviceOpts = services?.map(s => ({ value: s.SrvCode, label: s.SrvName, rate: s.SrvCharges })) || [];

  const mutation = useMutation({
    mutationFn: async (data: any) => (await api.post('/ipd/bills', data)).data,
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['ipd-bills'] });
      queryClient.invalidateQueries({ queryKey: ['ipd-admissions'] });
      alert('Final IPD Bill generated successfully! Patient marked as Discharged.');
      navigate('/ipd');
    }
  });

  const handleAdminChange = (val: number) => {
    const admin = adminOpts.find(a => a.value === val);
    setHeader({ ...header, IbhIhdCode: val, IbhPttCode: admin?.pttCode || null });
  };

  useEffect(() => {
    const totalAmt = items.reduce((sum, item) => sum + item.IbdAmtAftDisc, 0);
    const discAmt = (totalAmt * header.IbhDiscPer) / 100;
    const finalAmt = totalAmt - discAmt;
    
    setHeader(prev => ({
      ...prev,
      IbhTotalAmt: totalAmt,
      IbhBalAmt: finalAmt - prev.IbhDepAmt
    }));
  }, [items, header.IbhDiscPer, header.IbhDepAmt]);

  const handleItemChange = (index: number, field: keyof BillItem, value: any) => {
    const newItems = [...items];
    const itm = newItems[index];
    (itm as any)[field] = value;
    
    if (field === 'IbdSrvCode') {
      const srv = serviceOpts.find(s => s.value === value);
      if (srv) itm.IbdRate = srv.rate || 0;
    }

    itm.IbdAmtBefDisc = itm.IbdUnit * itm.IbdRate;
    itm.IbdDiscAmt = (itm.IbdAmtBefDisc * itm.IbdDiscPer) / 100;
    itm.IbdAmtAftDisc = itm.IbdAmtBefDisc - itm.IbdDiscAmt;

    setItems(newItems);
  };

  const addItem = () => {
    setItems([...items, { IbdSrvCode: null, IbdUnit: 1, IbdRate: 0, IbdAmtBefDisc: 0, IbdDiscPer: 0, IbdDiscAmt: 0, IbdAmtAftDisc: 0 }]);
  };

  const removeItem = (index: number) => {
    if (items.length === 1) return;
    setItems(items.filter((_, i) => i !== index));
  };

  const handleSave = (e: React.FormEvent) => {
    e.preventDefault();
    if (!header.IbhIhdCode) return alert('Select Admission Record');
    const validItems = items.filter(i => i.IbdSrvCode);
    if (validItems.length === 0) return alert('Add at least one service/rent');
    
    mutation.mutate({ ...header, details: validItems });
  };

  return (
    <div className="max-w-6xl mx-auto space-y-6">
      <div className="flex items-center gap-4">
        <button onClick={() => navigate('/ipd')} className="p-2 hover:bg-gray-100 rounded-full"><ArrowLeft size={20} /></button>
        <div>
          <h1 className="text-2xl font-bold text-medical-text">IPD Final Billing</h1>
          <p className="text-sm text-gray-500">Generate final bill and discharge patient</p>
        </div>
      </div>

      <form onSubmit={handleSave} className="space-y-6">
        <div className="card grid grid-cols-1 md:grid-cols-2 gap-6">
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">Discharge Date</label>
            <input type="date" value={header.IbhDate} onChange={e => setHeader({...header, IbhDate: e.target.value})} className="w-full px-3 py-2 border border-gray-300 rounded-md focus:ring-medical-mutedblue focus:border-medical-mutedblue" required />
          </div>
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">Select Admission <span className="text-red-500">*</span></label>
            <SearchableSelectWithCreate options={adminOpts} value={header.IbhIhdCode} onChange={(v) => handleAdminChange(v as number)} placeholder="Search IPD Admissions" />
          </div>
        </div>

        <div className="card">
          <div className="flex justify-between items-center mb-4">
            <h3 className="text-lg font-semibold text-gray-800">Services & Room Rent</h3>
            <button type="button" onClick={addItem} className="text-sm text-medical-mutedblue hover:text-medical-text font-medium flex items-center gap-1"><Plus size={16}/> Add Service</button>
          </div>

          <div className="overflow-x-auto">
            <table className="w-full text-left border-collapse">
              <thead>
                <tr className="bg-gray-50 border-b border-gray-200">
                  <th className="py-2 px-3 text-sm font-medium text-gray-600 w-1/3">Service Name</th>
                  <th className="py-2 px-3 text-sm font-medium text-gray-600">Unit (Days/Qty)</th>
                  <th className="py-2 px-3 text-sm font-medium text-gray-600">Rate (₹)</th>
                  <th className="py-2 px-3 text-sm font-medium text-gray-600">Disc %</th>
                  <th className="py-2 px-3 text-sm font-medium text-gray-600 text-right">Net Amount (₹)</th>
                  <th className="py-2 px-3 w-10"></th>
                </tr>
              </thead>
              <tbody>
                {items.map((item, idx) => (
                  <tr key={idx} className="border-b border-gray-100 hover:bg-gray-50">
                    <td className="py-2 px-3">
                      <SearchableSelectWithCreate options={serviceOpts} value={item.IbdSrvCode} onChange={(v) => handleItemChange(idx, 'IbdSrvCode', v)} placeholder="Type service..." />
                    </td>
                    <td className="py-2 px-3"><input type="number" value={item.IbdUnit} onChange={e => handleItemChange(idx, 'IbdUnit', Number(e.target.value))} className="w-full p-1 border border-gray-300 rounded" /></td>
                    <td className="py-2 px-3"><input type="number" value={item.IbdRate} onChange={e => handleItemChange(idx, 'IbdRate', Number(e.target.value))} className="w-full p-1 border border-gray-300 rounded" /></td>
                    <td className="py-2 px-3"><input type="number" value={item.IbdDiscPer} onChange={e => handleItemChange(idx, 'IbdDiscPer', Number(e.target.value))} className="w-full p-1 border border-gray-300 rounded" /></td>
                    <td className="py-2 px-3 text-right font-medium text-gray-800">{item.IbdAmtAftDisc.toFixed(2)}</td>
                    <td className="py-2 px-3 text-center">
                      <button type="button" onClick={() => removeItem(idx)} className="text-gray-400 hover:text-red-500"><Trash2 size={16} /></button>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
          
          <div className="flex justify-end mt-6 border-t border-gray-200 pt-6">
            <div className="w-72 space-y-3">
              <div className="flex justify-between text-sm text-gray-600">
                <span>Subtotal:</span>
                <span className="font-medium">₹{header.IbhTotalAmt.toFixed(2)}</span>
              </div>
              <div className="flex justify-between items-center text-sm text-gray-600">
                <span>Overall Discount %:</span>
                <input type="number" value={header.IbhDiscPer} onChange={e => setHeader({...header, IbhDiscPer: Number(e.target.value)})} className="w-20 p-1 border border-gray-300 rounded text-right" />
              </div>
              <div className="flex justify-between text-sm text-gray-600">
                <span>Advance Paid:</span>
                <input type="number" value={header.IbhDepAmt} onChange={e => setHeader({...header, IbhDepAmt: Number(e.target.value)})} className="w-24 p-1 border border-gray-300 rounded text-right bg-green-50" />
              </div>
              <div className="flex justify-between text-lg font-bold text-gray-800 border-t border-gray-200 pt-2">
                <span>Balance Due:</span>
                <span className={header.IbhBalAmt > 0 ? 'text-red-600' : 'text-green-600'}>₹{header.IbhBalAmt.toFixed(2)}</span>
              </div>
            </div>
          </div>
        </div>

        <div className="flex justify-end gap-4">
          <button type="button" onClick={() => navigate('/ipd')} className="px-6 py-2 border border-gray-300 rounded-md text-gray-700 hover:bg-gray-50">Cancel</button>
          <button type="submit" disabled={mutation.isPending} className="btn-success flex items-center gap-2 px-8">
            <Save size={18} /> Finalize & Discharge
          </button>
        </div>
      </form>
    </div>
  );
}
