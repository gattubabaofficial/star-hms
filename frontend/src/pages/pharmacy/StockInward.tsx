import { useState, useEffect } from 'react';
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import { useNavigate } from 'react-router-dom';
import api from '../../lib/api';
import { Save, ArrowLeft, Plus, Trash2 } from 'lucide-react';
import { SearchableSelectWithCreate } from '../../components/ui/SearchableSelectWithCreate';

interface PurchaseItem {
  IsdSimCode: number | null;
  IsdQty: number;
  IsdRate: number;
  IsdDiscPer: number;
  IsdDiscAmt: number;
  IsdTaxPer: number;
  IsdTaxAmt: number;
  IsdAmt: number;
}

export function StockInward() {
  const queryClient = useQueryClient();
  const navigate = useNavigate();
  
  const [header, setHeader] = useState({
    IskDate: new Date().toISOString().split('T')[0],
    IskPtyCode: null as number | null,
    IskRefNo: '',
    IskNetAmt: 0,
    IskOtherChg: 0,
    IskRoundOff: 0,
    IskTax: 0,
    IskRemark: ''
  });

  const [items, setItems] = useState<PurchaseItem[]>([
    { IsdSimCode: null, IsdQty: 1, IsdRate: 0, IsdDiscPer: 0, IsdDiscAmt: 0, IsdTaxPer: 0, IsdTaxAmt: 0, IsdAmt: 0 }
  ]);

  const { data: parties } = useQuery({ queryKey: ['parties'], queryFn: async () => (await api.get<any[]>('/pharmacy/parties')).data });
  const { data: medicines } = useQuery({ queryKey: ['medicines'], queryFn: async () => (await api.get<any[]>('/pharmacy/items')).data });

  const partyOpts = parties?.map(p => ({ value: p.PtyCode, label: p.PtyName })) || [];
  const medicineOpts = medicines?.map(m => ({ value: m.SimCode, label: m.SimName })) || [];

  const createParty = async (name: string) => {
    const res = await api.post('/pharmacy/parties', { PtyName: name });
    queryClient.invalidateQueries({ queryKey: ['parties'] });
    setHeader({ ...header, IskPtyCode: res.data.PtyCode });
  };

  useEffect(() => {
    let subtotal = 0;
    let totalTax = 0;

    items.forEach(item => {
      subtotal += item.IsdAmt;
      totalTax += item.IsdTaxAmt;
    });

    const net = subtotal + header.IskOtherChg;
    setHeader(prev => ({
      ...prev,
      IskTax: totalTax,
      IskNetAmt: net
    }));
  }, [items, header.IskOtherChg]);

  const handleItemChange = (index: number, field: keyof PurchaseItem, value: any) => {
    const newItems = [...items];
    const itm = newItems[index];
    (itm as any)[field] = value;
    
    const gross = itm.IsdQty * itm.IsdRate;
    itm.IsdDiscAmt = (gross * itm.IsdDiscPer) / 100;
    const afterDisc = gross - itm.IsdDiscAmt;
    itm.IsdTaxAmt = (afterDisc * itm.IsdTaxPer) / 100;
    itm.IsdAmt = afterDisc + itm.IsdTaxAmt;

    setItems(newItems);
  };

  const addItem = () => {
    setItems([...items, { IsdSimCode: null, IsdQty: 1, IsdRate: 0, IsdDiscPer: 0, IsdDiscAmt: 0, IsdTaxPer: 0, IsdTaxAmt: 0, IsdAmt: 0 }]);
  };

  const removeItem = (index: number) => {
    if (items.length === 1) return;
    setItems(items.filter((_, i) => i !== index));
  };

  const mutation = useMutation({
    mutationFn: async (data: any) => (await api.post('/pharmacy/purchases', data)).data,
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['pharmacy-purchases'] });
      alert('Purchase recorded successfully!');
      navigate('/pharmacy');
    }
  });

  const handleSave = (e: React.FormEvent) => {
    e.preventDefault();
    if (!header.IskPtyCode) return alert('Select Vendor/Party');
    const validItems = items.filter(i => i.IsdSimCode);
    if (validItems.length === 0) return alert('Add at least one item');
    
    mutation.mutate({ ...header, details: validItems });
  };

  return (
    <div className="max-w-6xl mx-auto space-y-6">
      <div className="flex items-center gap-4">
        <button onClick={() => navigate('/pharmacy')} className="p-2 hover:bg-gray-100 rounded-full"><ArrowLeft size={20} /></button>
        <div>
          <h1 className="text-2xl font-bold text-medical-text">Stock Inward (Purchase)</h1>
          <p className="text-sm text-gray-500">Record incoming stock from vendors</p>
        </div>
      </div>

      <form onSubmit={handleSave} className="space-y-6">
        <div className="card grid grid-cols-1 md:grid-cols-3 gap-6">
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">Date</label>
            <input type="date" value={header.IskDate} onChange={e => setHeader({...header, IskDate: e.target.value})} className="w-full px-3 py-2 border border-gray-300 rounded-md focus:ring-medical-mutedblue" required />
          </div>
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">Vendor / Party <span className="text-red-500">*</span></label>
            <SearchableSelectWithCreate options={partyOpts} value={header.IskPtyCode} onChange={(v) => setHeader({...header, IskPtyCode: v as number})} onCreateNew={createParty} placeholder="Select Vendor" />
          </div>
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">Supplier Ref No (Bill No)</label>
            <input type="text" value={header.IskRefNo} onChange={e => setHeader({...header, IskRefNo: e.target.value})} className="w-full px-3 py-2 border border-gray-300 rounded-md" />
          </div>
        </div>

        <div className="card">
          <div className="flex justify-between items-center mb-4">
            <h3 className="text-lg font-semibold text-gray-800">Items Received</h3>
            <button type="button" onClick={addItem} className="text-sm text-blue-600 hover:text-blue-700 font-medium flex items-center gap-1"><Plus size={16}/> Add Item</button>
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
                      <SearchableSelectWithCreate options={medicineOpts} value={item.IsdSimCode} onChange={(v) => handleItemChange(idx, 'IsdSimCode', v)} placeholder="Item..." />
                    </td>
                    <td className="py-2 px-2"><input type="number" value={item.IsdQty} onChange={e => handleItemChange(idx, 'IsdQty', Number(e.target.value))} className="w-full p-1 border border-gray-300 rounded" /></td>
                    <td className="py-2 px-2"><input type="number" value={item.IsdRate} onChange={e => handleItemChange(idx, 'IsdRate', Number(e.target.value))} className="w-full p-1 border border-gray-300 rounded" /></td>
                    <td className="py-2 px-2"><input type="number" value={item.IsdDiscPer} onChange={e => handleItemChange(idx, 'IsdDiscPer', Number(e.target.value))} className="w-full p-1 border border-gray-300 rounded" /></td>
                    <td className="py-2 px-2"><input type="number" value={item.IsdTaxPer} onChange={e => handleItemChange(idx, 'IsdTaxPer', Number(e.target.value))} className="w-full p-1 border border-gray-300 rounded" /></td>
                    <td className="py-2 px-2 text-right font-medium text-gray-800">{item.IsdAmt.toFixed(2)}</td>
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
                <input type="number" value={header.IskOtherChg} onChange={e => setHeader({...header, IskOtherChg: Number(e.target.value)})} className="w-24 p-1 border border-gray-300 rounded text-right" />
              </div>
              <div className="flex justify-between text-sm text-gray-600">
                <span>Total Tax Included:</span>
                <span>₹{header.IskTax.toFixed(2)}</span>
              </div>
              <div className="flex justify-between text-lg font-bold text-gray-800 border-t border-gray-200 pt-2">
                <span>Net Purchase Total:</span>
                <span className="text-blue-600">₹{header.IskNetAmt.toFixed(2)}</span>
              </div>
            </div>
          </div>
        </div>

        <div className="flex justify-end gap-4">
          <button type="submit" disabled={mutation.isPending} className="btn-primary flex items-center gap-2 px-8">
            <Save size={18} /> Save Purchase
          </button>
        </div>
      </form>
    </div>
  );
}
