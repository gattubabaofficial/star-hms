import { useState, useRef, useEffect } from 'react';
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import { useNavigate } from 'react-router-dom';
import api from '../../lib/api';
import { Save, ArrowLeft, Plus, Trash2 } from 'lucide-react';
import { useFormValidation } from '../../lib/useFormValidation';
import { useFormKeyboard } from '../../lib/useFormKeyboard';
import { SearchableSelectWithCreate } from '../../components/ui/SearchableSelectWithCreate';

interface SaleItem {
  OsdSimCode: number | null;
  OsdQty: number;
  OsdRate: number;
  OsdDiscPer: number;
  OsdDiscAmt: number;
  OsdTaxPer: number;
  OsdTaxAmt: number;
  OsdAmt: number;
}

export function StockOutward() {
  const formRef = useRef<HTMLFormElement>(null);
  useFormKeyboard(formRef);
  useFormValidation(formRef);

  const queryClient = useQueryClient();
  const navigate = useNavigate();
  
  const [header, setHeader] = useState({
    OskDate: new Date().toISOString().split('T')[0],
    OskPtyCode: null as number | null,
    OskNetAmt: 0,
    OskOtherChg: 0,
    OskTax: 0,
    OskRemark: ''
  });

  const [items, setItems] = useState<SaleItem[]>([
    { OsdSimCode: null, OsdQty: 1, OsdRate: 0, OsdDiscPer: 0, OsdDiscAmt: 0, OsdTaxPer: 0, OsdTaxAmt: 0, OsdAmt: 0 }
  ]);

  const { data: parties } = useQuery({ queryKey: ['parties'], queryFn: async () => (await api.get<any[]>('/pharmacy/parties')).data });
  const { data: medicines } = useQuery({ queryKey: ['medicines'], queryFn: async () => (await api.get<any[]>('/pharmacy/items')).data });

  const partyOpts = parties?.map(p => ({ value: p.PtyCode, label: p.PtyName })) || [];
  const medicineOpts = medicines?.map(m => ({ value: m.SimCode, label: m.SimName })) || [];

  const createParty = async (name: string) => {
    const res = await api.post('/pharmacy/parties', { PtyName: name });
    queryClient.invalidateQueries({ queryKey: ['parties'] });
    setHeader({ ...header, OskPtyCode: res.data.PtyCode });
  };

  useEffect(() => {
    let subtotal = 0;
    let totalTax = 0;

    items.forEach(item => {
      subtotal += item.OsdAmt;
      totalTax += item.OsdTaxAmt;
    });

    const net = subtotal + header.OskOtherChg;
    setHeader(prev => ({
      ...prev,
      OskTax: totalTax,
      OskNetAmt: net
    }));
  }, [items, header.OskOtherChg]);

  const handleItemChange = (index: number, field: keyof SaleItem, value: any) => {
    const newItems = [...items];
    const itm = newItems[index];
    (itm as any)[field] = value;
    
    const gross = itm.OsdQty * itm.OsdRate;
    itm.OsdDiscAmt = (gross * itm.OsdDiscPer) / 100;
    const afterDisc = gross - itm.OsdDiscAmt;
    itm.OsdTaxAmt = (afterDisc * itm.OsdTaxPer) / 100;
    itm.OsdAmt = afterDisc + itm.OsdTaxAmt;

    setItems(newItems);
  };

  const addItem = () => {
    setItems([...items, { OsdSimCode: null, OsdQty: 1, OsdRate: 0, OsdDiscPer: 0, OsdDiscAmt: 0, OsdTaxPer: 0, OsdTaxAmt: 0, OsdAmt: 0 }]);
  };

  const removeItem = (index: number) => {
    if (items.length === 1) return;
    setItems(items.filter((_, i) => i !== index));
  };

  const mutation = useMutation({
    mutationFn: async (data: any) => (await api.post('/pharmacy/sales', data)).data,
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['pharmacy-sales'] });
      alert('Sale recorded successfully!');
      navigate('/pharmacy');
    }
  });

  const handleSave = (e: React.FormEvent) => {
    e.preventDefault();
    if (!header.OskPtyCode) return alert('Select Customer');
    const validItems = items.filter(i => i.OsdSimCode);
    if (validItems.length === 0) return alert('Add at least one item');
    
    mutation.mutate({ ...header, details: validItems });
  };

  return (
    <div className="max-w-6xl mx-auto space-y-6">
      <div className="flex items-center gap-4">
        <button onClick={() => navigate('/pharmacy')} className="p-2 hover:bg-gray-100 rounded-full"><ArrowLeft size={20} /></button>
        <div>
          <h1 className="text-2xl font-bold text-medical-text">Stock Outward (Sales)</h1>
          <p className="text-sm text-gray-500">Dispense medicines to patients/customers</p>
        </div>
      </div>

      <form ref={formRef} onSubmit={handleSave} className="space-y-6">
        <div className="card grid grid-cols-1 md:grid-cols-2 gap-6">
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">Sale Date</label>
            <input type="date" value={header.OskDate} onChange={e => setHeader({...header, OskDate: e.target.value})} className="w-full px-3 py-2 border border-gray-300 rounded-md focus:ring-green-500" required />
          </div>
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">Customer / Patient <span className="text-red-500">*</span></label>
            <SearchableSelectWithCreate options={partyOpts} value={header.OskPtyCode} onChange={(v) => setHeader({...header, OskPtyCode: v as number})} onCreateNew={createParty} placeholder="Select or Create Customer" />
          </div>
        </div>

        <div className="card">
          <div className="flex justify-between items-center mb-4">
            <h3 className="text-lg font-semibold text-gray-800">Medicines Dispensed</h3>
            <button type="button" onClick={addItem} className="text-sm text-green-600 hover:text-green-700 font-medium flex items-center gap-1"><Plus size={16}/> Add Medicine</button>
          </div>

          <div className="overflow-x-auto">
            <table className="w-full text-left border-collapse min-w-max">
              <thead>
                <tr className="bg-gray-50 border-b border-gray-200">
                  <th className="py-2 px-2 text-sm font-medium text-gray-600 w-1/4">Medicine / Item</th>
                  <th className="py-2 px-2 text-sm font-medium text-gray-600">Qty</th>
                  <th className="py-2 px-2 text-sm font-medium text-gray-600">Rate (₹)</th>
                  <th className="py-2 px-2 text-sm font-medium text-gray-600">Disc %</th>
                  <th className="py-2 px-2 text-sm font-medium text-gray-600">Tax %</th>
                  <th className="py-2 px-2 text-sm font-medium text-gray-600 text-right">Net Amount</th>
                  <th className="py-2 px-2 w-10"></th>
                </tr>
              </thead>
              <tbody>
                {items.map((item, idx) => (
                  <tr key={idx} className="border-b border-gray-100 hover:bg-gray-50">
                    <td className="py-2 px-2">
                      <SearchableSelectWithCreate options={medicineOpts} value={item.OsdSimCode} onChange={(v) => handleItemChange(idx, 'OsdSimCode', v)} placeholder="Search medicine..." />
                    </td>
                    <td className="py-2 px-2"><input type="number" value={item.OsdQty} onChange={e => handleItemChange(idx, 'OsdQty', Number(e.target.value))} className="w-full p-1 border border-gray-300 rounded focus:ring-green-500" /></td>
                    <td className="py-2 px-2"><input type="number" value={item.OsdRate} onChange={e => handleItemChange(idx, 'OsdRate', Number(e.target.value))} className="w-full p-1 border border-gray-300 rounded focus:ring-green-500" /></td>
                    <td className="py-2 px-2"><input type="number" value={item.OsdDiscPer} onChange={e => handleItemChange(idx, 'OsdDiscPer', Number(e.target.value))} className="w-full p-1 border border-gray-300 rounded focus:ring-green-500" /></td>
                    <td className="py-2 px-2"><input type="number" value={item.OsdTaxPer} onChange={e => handleItemChange(idx, 'OsdTaxPer', Number(e.target.value))} className="w-full p-1 border border-gray-300 rounded focus:ring-green-500" /></td>
                    <td className="py-2 px-2 text-right font-medium text-gray-800">{item.OsdAmt.toFixed(2)}</td>
                    <td className="py-2 px-2 text-center"><button type="button" onClick={() => removeItem(idx)} className="text-gray-400 hover:text-red-500"><Trash2 size={16} /></button></td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>

          <div className="flex justify-end mt-6 border-t border-gray-200 pt-6">
            <div className="w-72 space-y-3">
              <div className="flex justify-between items-center text-sm text-gray-600">
                <span>Other Charges (₹):</span>
                <input type="number" value={header.OskOtherChg} onChange={e => setHeader({...header, OskOtherChg: Number(e.target.value)})} className="w-24 p-1 border border-gray-300 rounded text-right focus:ring-green-500" />
              </div>
              <div className="flex justify-between text-sm text-gray-600">
                <span>Total Tax Included:</span>
                <span>₹{header.OskTax.toFixed(2)}</span>
              </div>
              <div className="flex justify-between text-lg font-bold text-gray-800 border-t border-gray-200 pt-2">
                <span>Final Bill Amount:</span>
                <span className="text-green-600">₹{header.OskNetAmt.toFixed(2)}</span>
              </div>
            </div>
          </div>
        </div>

        <div className="flex justify-end gap-4">
          <button type="submit" disabled={mutation.isPending} className="btn-success flex items-center gap-2 px-8">
            <Save size={18} /> Process Sale
          </button>
        </div>
      </form>
    </div>
  );
}
