import React, { useState, useRef, useEffect } from 'react';
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import { useNavigate } from 'react-router-dom';
import api from '../../lib/api';
import { Save, ArrowLeft, Plus, Trash2, User, Stethoscope, Receipt } from 'lucide-react';
import { useFormValidation } from '../../lib/useFormValidation';
import { useFormKeyboard } from '../../lib/useFormKeyboard';
import { SearchableSelectWithCreate } from '../../components/ui/SearchableSelectWithCreate';

interface SaleItem {
  OsdSimCode: number | null;
  OsdBatchNo: string;
  OsdQty: number;
  OsdRate: number;
  OsdDiscPer: number;
  OsdDiscAmt: number;
  OsdTaxPer: number;
  OsdTaxAmt: number;
  OsdAmt: number;
  AvailableBatches: any[];
}

export function StockOutward() {
  const formRef = useRef<HTMLFormElement>(null);
  useFormKeyboard(formRef);
  useFormValidation(formRef);

  const queryClient = useQueryClient();
  const navigate = useNavigate();
  
  const [customerType, setCustomerType] = useState<'Patient' | 'WalkIn'>('Patient');

  const [header, setHeader] = useState({
    OskDate: new Date().toISOString().split('T')[0],
    OskPatCode: null as number | null,
    OskDocCode: null as number | null,
    OskCustomerName: '',
    OskCustomerPhone: '',
    OskPaymentMode: 'Cash',
    OskPaidAmt: 0,
    OskNetAmt: 0,
    OskOtherChg: 0,
    OskTax: 0,
    OskRemark: ''
  });

  const [items, setItems] = useState<SaleItem[]>([
    { OsdSimCode: null, OsdBatchNo: '', OsdQty: 1, OsdRate: 0, OsdDiscPer: 0, OsdDiscAmt: 0, OsdTaxPer: 0, OsdTaxAmt: 0, OsdAmt: 0, AvailableBatches: [] }
  ]);

  const { data: patients } = useQuery({ queryKey: ['patients'], queryFn: async () => (await api.get<any[]>('/masters/patients')).data });
  const { data: doctors } = useQuery({ queryKey: ['doctors'], queryFn: async () => (await api.get<any[]>('/masters/doctors')).data });
  const { data: medicines } = useQuery({ queryKey: ['medicines'], queryFn: async () => (await api.get<any[]>('/pharmacy/items')).data });

  const patientOpts = patients?.map(p => ({ value: p.PatCode, label: `${p.PatName} (${p.PatMobile || 'No Ph'})` })) || [];
  const docOpts = doctors?.map(d => ({ value: d.DocCode, label: d.DocName })) || [];
  const medicineOpts = medicines?.map(m => ({ value: m.SimCode, label: m.SimName })) || [];

  const createPatient = async (name: string) => {
    const res = await api.post('/masters/patients', { PatName: name });
    queryClient.invalidateQueries({ queryKey: ['patients'] });
    setHeader({ ...header, OskPatCode: res.data.PatCode });
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
      OskNetAmt: net,
      OskPaidAmt: net // default paid is full amount
    }));
  }, [items, header.OskOtherChg]);

  const loadBatchesForItem = async (index: number, simCode: number) => {
    try {
      const res = await api.get<any[]>(`/pharmacy/batches/${simCode}`);
      const batches = res.data;
      const newItems = [...items];
      newItems[index].AvailableBatches = batches;
      
      // Auto-select first batch if available
      if (batches.length > 0) {
        newItems[index].OsdBatchNo = batches[0].BatchNo;
        newItems[index].OsdRate = batches[0].MRP; // Use MRP as default selling rate
      } else {
        newItems[index].OsdBatchNo = '';
      }
      setItems(newItems);
      // Trigger math recalculation
      handleItemChange(index, 'OsdQty', newItems[index].OsdQty);
    } catch (e) {
      console.error(e);
    }
  };

  const handleItemChange = (index: number, field: keyof SaleItem, value: any) => {
    const newItems = [...items];
    const itm = newItems[index];
    (itm as any)[field] = value;

    if (field === 'OsdSimCode' && value) {
      loadBatchesForItem(index, value as number);
    }
    
    if (field === 'OsdBatchNo') {
      const selectedBatch = itm.AvailableBatches.find(b => b.BatchNo === value);
      if (selectedBatch) {
        itm.OsdRate = selectedBatch.MRP;
      }
    }
    
    const gross = itm.OsdQty * itm.OsdRate;
    itm.OsdDiscAmt = (gross * itm.OsdDiscPer) / 100;
    const afterDisc = gross - itm.OsdDiscAmt;
    itm.OsdTaxAmt = (afterDisc * itm.OsdTaxPer) / 100;
    itm.OsdAmt = afterDisc + itm.OsdTaxAmt;

    setItems(newItems);
  };

  const addItem = () => {
    setItems([...items, { OsdSimCode: null, OsdBatchNo: '', OsdQty: 1, OsdRate: 0, OsdDiscPer: 0, OsdDiscAmt: 0, OsdTaxPer: 0, OsdTaxAmt: 0, OsdAmt: 0, AvailableBatches: [] }]);
  };

  const removeItem = (index: number) => {
    if (items.length === 1) return;
    setItems(items.filter((_, i) => i !== index));
  };

  const mutation = useMutation({
    mutationFn: async (data: any) => (await api.post('/pharmacy/sales', data)).data,
    onSuccess: (data) => {
      queryClient.invalidateQueries({ queryKey: ['pharmacy-sales'] });
      navigate('/pharmacy/receipt', { state: { autoSelectVchNo: data.OskVchNo, type: 'sale' } });
    },
    onError: (error: any) => {
      alert(error?.response?.data?.detail || 'Error processing POS sale');
    }
  });

  const handleSave = (e: React.FormEvent) => {
    e.preventDefault();
    if (customerType === 'Patient' && !header.OskPatCode) return alert('Select Patient');
    if (customerType === 'WalkIn' && !header.OskCustomerName) return alert('Enter Walk-in Customer Name');
    
    const validItems = items.filter(i => i.OsdSimCode && i.OsdBatchNo);
    if (validItems.length === 0) return alert('Add at least one item with a valid batch');
    
    // Clean up before sending to backend
    const payloadItems = validItems.map(i => {
      const { AvailableBatches, ...rest } = i;
      return rest;
    });

    mutation.mutate({ ...header, details: payloadItems });
  };

  return (
    <div className="max-w-7xl mx-auto space-y-6">
      <div className="flex items-center gap-4">
        <button onClick={() => navigate('/pharmacy')} className="p-2 hover:bg-gray-100 rounded-full"><ArrowLeft size={20} /></button>
        <div>
          <h1 className="text-2xl font-bold text-medical-text flex items-center gap-2"><Receipt className="text-green-600"/> Pharmacy POS Billing</h1>
          <p className="text-sm text-gray-500">Retail medicine sales and dispensing</p>
        </div>
      </div>

      <form ref={formRef} onSubmit={handleSave} className="space-y-6">
        <div className="card grid grid-cols-1 md:grid-cols-4 gap-6">
          <div className="col-span-1 border-r pr-4">
            <label className="block text-sm font-medium text-gray-700 mb-2">Customer Type</label>
            <div className="flex gap-4 mb-4">
              <label className="flex items-center gap-1 cursor-pointer">
                <input type="radio" checked={customerType === 'Patient'} onChange={() => setCustomerType('Patient')} className="text-green-600 focus:ring-green-500" />
                Hospital Patient
              </label>
              <label className="flex items-center gap-1 cursor-pointer">
                <input type="radio" checked={customerType === 'WalkIn'} onChange={() => setCustomerType('WalkIn')} className="text-green-600 focus:ring-green-500" />
                Walk-In
              </label>
            </div>
            <label className="block text-sm font-medium text-gray-700 mb-1">Sale Date</label>
            <input type="date" value={header.OskDate} onChange={e => setHeader({...header, OskDate: e.target.value})} className="w-full px-3 py-2 border border-medical-border rounded-md focus:ring-green-500" required />
          </div>

          <div className="col-span-2 space-y-4">
            {customerType === 'Patient' ? (
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1 flex items-center gap-1"><User size={14}/> Select Patient <span className="text-red-500">*</span></label>
                <SearchableSelectWithCreate options={patientOpts} value={header.OskPatCode} onChange={(v) => setHeader({...header, OskPatCode: v as number})} onCreateNew={createPatient} placeholder="Search by name/mobile..." />
              </div>
            ) : (
              <div className="flex gap-4">
                <div className="flex-1">
                  <label className="block text-sm font-medium text-gray-700 mb-1 flex items-center gap-1"><User size={14}/> Customer Name <span className="text-red-500">*</span></label>
                  <input type="text" value={header.OskCustomerName} onChange={e => setHeader({...header, OskCustomerName: e.target.value})} className="input-field" placeholder="John Doe" required={customerType === 'WalkIn'} />
                </div>
                <div className="flex-1">
                  <label className="block text-sm font-medium text-gray-700 mb-1">Phone</label>
                  <input type="text" value={header.OskCustomerPhone} onChange={e => setHeader({...header, OskCustomerPhone: e.target.value})} className="input-field" placeholder="Mobile No" />
                </div>
              </div>
            )}
            
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1 flex items-center gap-1"><Stethoscope size={14}/> Prescribing Doctor</label>
              <SearchableSelectWithCreate options={docOpts} value={header.OskDocCode} onChange={(v) => setHeader({...header, OskDocCode: v as number})} onCreateNew={undefined} placeholder="Select Doctor (Optional)" />
            </div>
          </div>
        </div>

        <div className="card">
          <div className="flex justify-between items-center mb-4">
            <h3 className="text-lg font-semibold text-gray-800">Medicines Dispensed</h3>
            <button type="button" onClick={addItem} className="text-sm text-green-600 hover:text-green-700 font-medium flex items-center gap-1"><Plus size={16}/> Add Medicine</button>
          </div>

          <div className="overflow-x-auto min-h-[250px]">
            <table className="w-full text-left border-collapse min-w-max">
              <thead>
                <tr className="bg-gray-50 border-b border-medical-border">
                  <th className="py-2 px-2 text-sm font-medium text-gray-600 w-1/4">Medicine / Item</th>
                  <th className="py-2 px-2 text-sm font-medium text-gray-600 w-48">Batch No (Stock)</th>
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
                  <tr key={idx} className="border-b border-medical-border hover:bg-gray-50">
                    <td className="py-2 px-2 align-top pt-3">
                      <SearchableSelectWithCreate options={medicineOpts} value={item.OsdSimCode} onChange={(v) => handleItemChange(idx, 'OsdSimCode', v)} placeholder="Search medicine..." />
                    </td>
                    <td className="py-2 px-2 align-top pt-3">
                      <select 
                        value={item.OsdBatchNo} 
                        onChange={(e) => handleItemChange(idx, 'OsdBatchNo', e.target.value)}
                        className="w-full p-2 border border-medical-border rounded focus:ring-green-500 text-sm bg-white"
                        required
                        disabled={!item.OsdSimCode || item.AvailableBatches.length === 0}
                      >
                        <option value="">-- Select Batch --</option>
                        {item.AvailableBatches.map(b => (
                          <option key={b.BatchNo} value={b.BatchNo}>
                            {b.BatchNo} (Qty: {b.CurrentStock}, MRP: {b.MRP})
                          </option>
                        ))}
                      </select>
                      {item.OsdSimCode && item.AvailableBatches.length === 0 && (
                        <p className="text-xs text-red-500 mt-1">Out of Stock!</p>
                      )}
                    </td>
                    <td className="py-2 px-2 align-top pt-3"><input type="number" value={item.OsdQty} onChange={e => handleItemChange(idx, 'OsdQty', Number(e.target.value))} className="w-16 p-2 border border-medical-border rounded focus:ring-green-500 text-sm" /></td>
                    <td className="py-2 px-2 align-top pt-3"><input type="number" value={item.OsdRate} onChange={e => handleItemChange(idx, 'OsdRate', Number(e.target.value))} className="w-20 p-2 border border-medical-border rounded focus:ring-green-500 text-sm bg-gray-50" readOnly title="Rate comes from Batch MRP" /></td>
                    <td className="py-2 px-2 align-top pt-3"><input type="number" value={item.OsdDiscPer} onChange={e => handleItemChange(idx, 'OsdDiscPer', Number(e.target.value))} className="w-16 p-2 border border-medical-border rounded focus:ring-green-500 text-sm" /></td>
                    <td className="py-2 px-2 align-top pt-3"><input type="number" value={item.OsdTaxPer} onChange={e => handleItemChange(idx, 'OsdTaxPer', Number(e.target.value))} className="w-16 p-2 border border-medical-border rounded focus:ring-green-500 text-sm" /></td>
                    <td className="py-2 px-2 align-top pt-4 text-right font-medium text-gray-800">{item.OsdAmt.toFixed(2)}</td>
                    <td className="py-2 px-2 align-top pt-4 text-center"><button type="button" onClick={() => removeItem(idx)} className="text-gray-400 hover:text-red-500"><Trash2 size={16} /></button></td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
          
          <div className="grid grid-cols-2 mt-6 border-t border-medical-border pt-6 gap-6">
            <div className="bg-gray-50 p-4 rounded-lg border border-gray-200">
              <h4 className="font-semibold text-gray-700 mb-3 border-b pb-2">Payment Details</h4>
              <div className="grid grid-cols-2 gap-4">
                <div>
                  <label className="block text-xs font-medium text-gray-500 mb-1">Mode of Payment</label>
                  <select 
                    value={header.OskPaymentMode} 
                    onChange={e => setHeader({...header, OskPaymentMode: e.target.value})}
                    className="w-full p-2 border border-medical-border rounded focus:ring-green-500 text-sm"
                  >
                    <option value="Cash">Cash</option>
                    <option value="Card">Card</option>
                    <option value="UPI">UPI</option>
                    <option value="Credit">Credit Bill</option>
                  </select>
                </div>
                <div>
                  <label className="block text-xs font-medium text-gray-500 mb-1">Amount Paid (₹)</label>
                  <input 
                    type="number" 
                    value={header.OskPaidAmt} 
                    onChange={e => setHeader({...header, OskPaidAmt: Number(e.target.value)})}
                    className="w-full p-2 border border-medical-border rounded focus:ring-green-500 text-sm font-medium"
                    disabled={header.OskPaymentMode === 'Credit'}
                  />
                </div>
              </div>
            </div>

            <div className="flex flex-col justify-end">
              <div className="w-72 self-end space-y-3">
                <div className="flex justify-between items-center text-sm text-gray-600">
                  <span>Other Charges (₹):</span>
                  <input type="number" value={header.OskOtherChg} onChange={e => setHeader({...header, OskOtherChg: Number(e.target.value)})} className="w-24 p-1 border border-medical-border rounded text-right focus:ring-green-500" />
                </div>
                <div className="flex justify-between text-sm text-gray-600">
                  <span>Total Tax Included:</span>
                  <span>₹{header.OskTax.toFixed(2)}</span>
                </div>
                <div className="flex justify-between text-xl font-bold text-gray-800 border-t border-medical-border pt-2">
                  <span>Final Bill:</span>
                  <span className="text-green-600">₹{header.OskNetAmt.toFixed(2)}</span>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div className="flex justify-end gap-4">
          <button type="submit" disabled={mutation.isPending} className="btn-success flex items-center gap-2 px-8 py-3 text-lg">
            <Save size={20} /> Checkout & Print
          </button>
        </div>
      </form>
    </div>
  );
}
