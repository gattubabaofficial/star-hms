import { useState, useRef, useEffect } from 'react';
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import { useNavigate } from 'react-router-dom';
import api from '../../lib/api';
import { Save, ArrowLeft, Plus, Trash2 } from 'lucide-react';
import { useFormValidation } from '../../lib/useFormValidation';
import { useFormKeyboard } from '../../lib/useFormKeyboard';
import { SearchableSelectWithCreate } from '../../components/ui/SearchableSelectWithCreate';

interface BillItem {
  ObdSrvCode: number | null;
  ObdUnit: number;
  ObdRate: number;
  ObdAmtBefDisc: number;
  ObdDiscPer: number;
  ObdDiscAmt: number;
  ObdAmtAftDisc: number;
}

export function OPDBilling() {
  const formRef = useRef<HTMLFormElement>(null);
  useFormKeyboard(formRef);
  useFormValidation(formRef);

  const queryClient = useQueryClient();
  const navigate = useNavigate();
  
  const [header, setHeader] = useState({
    OhdDate: new Date().toISOString().split('T')[0],
    OhdPttCode: null as number | null,
    OhdCDctCode: null as number | null,
    OhdTotalAmt: 0,
    OhdDiscPer: 0,
    OhdDiscAmt: 0,
    OhdDepAmt: 0,
    OhdBalAmt: 0,
    OhdRemark: ''
  });

  const [items, setItems] = useState<BillItem[]>([
    { ObdSrvCode: null, ObdUnit: 1, ObdRate: 0, ObdAmtBefDisc: 0, ObdDiscPer: 0, ObdDiscAmt: 0, ObdAmtAftDisc: 0 }
  ]);

  const { data: patients } = useQuery({ queryKey: ['patients'], queryFn: async () => (await api.get<any[]>('/masters/patients')).data });
  const { data: doctors } = useQuery({ queryKey: ['doctors'], queryFn: async () => (await api.get<any[]>('/masters/doctors')).data });
  const { data: services } = useQuery({ queryKey: ['services'], queryFn: async () => (await api.get<any[]>('/masters/services')).data });

  const patientOpts = patients?.map(p => ({ value: p.PttCode, label: `${p.PttName} (${p.PttTelNo || 'N/A'})` })) || [];
  const doctorOpts = doctors?.map(d => ({ value: d.DctCode, label: d.DctName })) || [];
  const serviceOpts = services?.map(s => ({ value: s.SrvCode, label: s.SrvName, rate: s.SrvCharges })) || [];

  const mutation = useMutation({
    mutationFn: async (data: any) => (await api.post('/opd/bills', data)).data,
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['opd-bills'] });
      alert('Bill generated successfully!');
      navigate('/opd');
    }
  });

  // Calculate totals whenever items change
  useEffect(() => {
    const totalAmt = items.reduce((sum, item) => sum + item.ObdAmtAftDisc, 0);
    const discAmt = (totalAmt * header.OhdDiscPer) / 100;
    const finalAmt = totalAmt - discAmt;
    
    setHeader(prev => ({
      ...prev,
      OhdTotalAmt: totalAmt,
      OhdDiscAmt: discAmt,
      OhdBalAmt: finalAmt - prev.OhdDepAmt
    }));
  }, [items, header.OhdDiscPer, header.OhdDepAmt]);

  const handleItemChange = (index: number, field: keyof BillItem, value: any) => {
    const newItems = [...items];
    const itm = newItems[index];
    (itm as any)[field] = value;
    
    if (field === 'ObdSrvCode') {
      const srv = serviceOpts.find(s => s.value === value);
      if (srv) itm.ObdRate = srv.rate || 0;
    }

    itm.ObdAmtBefDisc = itm.ObdUnit * itm.ObdRate;
    itm.ObdDiscAmt = (itm.ObdAmtBefDisc * itm.ObdDiscPer) / 100;
    itm.ObdAmtAftDisc = itm.ObdAmtBefDisc - itm.ObdDiscAmt;

    setItems(newItems);
  };

  const addItem = () => {
    setItems([...items, { ObdSrvCode: null, ObdUnit: 1, ObdRate: 0, ObdAmtBefDisc: 0, ObdDiscPer: 0, ObdDiscAmt: 0, ObdAmtAftDisc: 0 }]);
  };

  const removeItem = (index: number) => {
    if (items.length === 1) return;
    setItems(items.filter((_, i) => i !== index));
  };

  const handleSave = (e: React.FormEvent) => {
    e.preventDefault();
    if (!header.OhdPttCode) return alert('Select Patient');
    const validItems = items.filter(i => i.ObdSrvCode);
    if (validItems.length === 0) return alert('Add at least one service');
    
    mutation.mutate({ ...header, details: validItems });
  };

  return (
    <div className="max-w-6xl mx-auto space-y-6">
      <div className="flex items-center gap-4">
        <button onClick={() => navigate('/opd')} className="p-2 hover:bg-gray-100 rounded-full"><ArrowLeft size={20} /></button>
        <div>
          <h1 className="text-2xl font-bold text-medical-text">OPD Billing</h1>
          <p className="text-sm text-gray-500">Bill services, investigations, and procedures</p>
        </div>
      </div>

      <form ref={formRef} onSubmit={handleSave} className="space-y-6">
        <div className="card grid grid-cols-1 md:grid-cols-3 gap-6">
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">Date</label>
            <input type="date" value={header.OhdDate} onChange={e => setHeader({...header, OhdDate: e.target.value})} className="input-field" required />
          </div>
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">Patient <span className="text-red-500">*</span></label>
            <SearchableSelectWithCreate options={patientOpts} value={header.OhdPttCode} onChange={(v) => setHeader({...header, OhdPttCode: v as number})} placeholder="Select Patient" />
          </div>
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">Referred By / Doctor</label>
            <SearchableSelectWithCreate options={doctorOpts} value={header.OhdCDctCode} onChange={(v) => setHeader({...header, OhdCDctCode: v as number})} placeholder="Select Doctor" />
          </div>
        </div>

        <div className="card">
          <div className="flex justify-between items-center mb-4">
            <h3 className="text-lg font-semibold text-gray-800">Services</h3>
            <button type="button" onClick={addItem} className="text-sm text-medical-mutedblue hover:text-medical-text font-medium flex items-center gap-1"><Plus size={16}/> Add Service</button>
          </div>

          <div className="overflow-x-auto">
            <table className="w-full text-left border-collapse">
              <thead>
                <tr className="bg-gray-50 border-b border-gray-200">
                  <th className="py-2 px-3 text-sm font-medium text-gray-600 w-1/3">Service Name</th>
                  <th className="py-2 px-3 text-sm font-medium text-gray-600">Unit</th>
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
                      <SearchableSelectWithCreate options={serviceOpts} value={item.ObdSrvCode} onChange={(v) => handleItemChange(idx, 'ObdSrvCode', v)} placeholder="Type service..." />
                    </td>
                    <td className="py-2 px-3"><input type="number" value={item.ObdUnit} onChange={e => handleItemChange(idx, 'ObdUnit', Number(e.target.value))} className="w-full p-1 border border-gray-300 rounded" /></td>
                    <td className="py-2 px-3"><input type="number" value={item.ObdRate} onChange={e => handleItemChange(idx, 'ObdRate', Number(e.target.value))} className="w-full p-1 border border-gray-300 rounded" /></td>
                    <td className="py-2 px-3"><input type="number" value={item.ObdDiscPer} onChange={e => handleItemChange(idx, 'ObdDiscPer', Number(e.target.value))} className="w-full p-1 border border-gray-300 rounded" /></td>
                    <td className="py-2 px-3 text-right font-medium text-gray-800">{item.ObdAmtAftDisc.toFixed(2)}</td>
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
                <span className="font-medium">₹{header.OhdTotalAmt.toFixed(2)}</span>
              </div>
              <div className="flex justify-between items-center text-sm text-gray-600">
                <span>Overall Discount %:</span>
                <input type="number" value={header.OhdDiscPer} onChange={e => setHeader({...header, OhdDiscPer: Number(e.target.value)})} className="w-20 p-1 border border-gray-300 rounded text-right" />
              </div>
              <div className="flex justify-between text-sm text-gray-600">
                <span>Deposit / Received:</span>
                <input type="number" value={header.OhdDepAmt} onChange={e => setHeader({...header, OhdDepAmt: Number(e.target.value)})} className="w-24 p-1 border border-gray-300 rounded text-right bg-green-50" />
              </div>
              <div className="flex justify-between text-lg font-bold text-gray-800 border-t border-gray-200 pt-2">
                <span>Balance Due:</span>
                <span className={header.OhdBalAmt > 0 ? 'text-red-600' : 'text-green-600'}>₹{header.OhdBalAmt.toFixed(2)}</span>
              </div>
            </div>
          </div>
        </div>

        <div className="flex justify-end gap-4">
          <button type="button" onClick={() => navigate('/opd')} className="btn-secondary px-6">Cancel</button>
          <button type="submit" disabled={mutation.isPending} className="btn-success flex items-center gap-2 px-8">
            <Save size={18} /> Generate Bill
          </button>
        </div>
      </form>
    </div>
  );
}
