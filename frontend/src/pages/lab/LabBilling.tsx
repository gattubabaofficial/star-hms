import { useState, useEffect } from 'react';
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import { useNavigate } from 'react-router-dom';
import api from '../../lib/api';
import { Save, ArrowLeft, Plus, Trash2 } from 'lucide-react';
import { SearchableSelectWithCreate } from '../../components/ui/SearchableSelectWithCreate';

interface TestItem {
  LrdSrvCode: number | null;
  LrdUnit: number;
  LrdRate: number;
  LrdAmtBefDisc: number;
  LrdDiscPer: number;
  LrdDiscAmt: number;
  LrdAmtAftDisc: number;
}

export function LabBilling() {
  const queryClient = useQueryClient();
  const navigate = useNavigate();
  
  const [header, setHeader] = useState({
    LhdDate: new Date().toISOString().split('T')[0],
    LhdPttCode: null as number | null,
    LhdCDctCode: null as number | null,
    LhdDiscPer: 0,
    LhdTotalAmt: 0,
    LhdAdvAmt: 0,
    LhdRemark: ''
  });

  const [items, setItems] = useState<TestItem[]>([
    { LrdSrvCode: null, LrdUnit: 1, LrdRate: 0, LrdAmtBefDisc: 0, LrdDiscPer: 0, LrdDiscAmt: 0, LrdAmtAftDisc: 0 }
  ]);

  const { data: patients } = useQuery({ queryKey: ['patients'], queryFn: async () => (await api.get<any[]>('/masters/patients')).data });
  const { data: doctors } = useQuery({ queryKey: ['doctors'], queryFn: async () => (await api.get<any[]>('/masters/doctors')).data });
  const { data: services } = useQuery({ queryKey: ['services'], queryFn: async () => (await api.get<any[]>('/masters/services')).data });

  const patientOpts = patients?.map(p => ({ value: p.PttCode, label: `${p.PttName} (${p.PttSex})` })) || [];
  const doctorOpts = doctors?.map(d => ({ value: d.DctCode, label: d.DctName })) || [];
  const serviceOpts = services?.map(s => ({ value: s.SrvCode, label: s.SrvName })) || [];

  const createPatient = async (name: string) => {
    const res = await api.post('/masters/patients', { PttName: name, PttSex: 'O' });
    queryClient.invalidateQueries({ queryKey: ['patients'] });
    setHeader({ ...header, LhdPttCode: res.data.PttCode });
  };

  useEffect(() => {
    let subtotal = 0;
    items.forEach(item => {
      subtotal += item.LrdAmtAftDisc;
    });

    const headerDiscAmt = (subtotal * header.LhdDiscPer) / 100;
    const net = subtotal - headerDiscAmt;

    setHeader(prev => ({ ...prev, LhdTotalAmt: net }));
  }, [items, header.LhdDiscPer]);

  const handleItemChange = (index: number, field: keyof TestItem, value: any) => {
    const newItems = [...items];
    const itm = newItems[index];
    (itm as any)[field] = value;
    
    itm.LrdAmtBefDisc = itm.LrdUnit * itm.LrdRate;
    itm.LrdDiscAmt = (itm.LrdAmtBefDisc * itm.LrdDiscPer) / 100;
    itm.LrdAmtAftDisc = itm.LrdAmtBefDisc - itm.LrdDiscAmt;

    setItems(newItems);
  };

  const handleServiceSelect = (index: number, srvCode: number) => {
    const service = services?.find(s => s.SrvCode === srvCode);
    if (service) {
      handleItemChange(index, 'LrdSrvCode', srvCode);
      handleItemChange(index, 'LrdRate', service.SrvRate || 0); // Assuming SrvRate exists or defaults to 0
    } else {
      handleItemChange(index, 'LrdSrvCode', srvCode);
    }
  };

  const addItem = () => setItems([...items, { LrdSrvCode: null, LrdUnit: 1, LrdRate: 0, LrdAmtBefDisc: 0, LrdDiscPer: 0, LrdDiscAmt: 0, LrdAmtAftDisc: 0 }]);
  const removeItem = (index: number) => {
    if (items.length === 1) return;
    setItems(items.filter((_, i) => i !== index));
  };

  const mutation = useMutation({
    mutationFn: async (data: any) => (await api.post('/lab/registrations', data)).data,
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['lab-bills'] });
      alert('Lab Registration & Bill generated successfully!');
      navigate('/lab');
    }
  });

  const handleSave = (e: React.FormEvent) => {
    e.preventDefault();
    if (!header.LhdPttCode) return alert('Select a Patient');
    const validItems = items.filter(i => i.LrdSrvCode);
    if (validItems.length === 0) return alert('Add at least one test/service');
    
    mutation.mutate({ ...header, details: validItems });
  };

  return (
    <div className="max-w-5xl mx-auto space-y-6">
      <div className="flex items-center gap-4">
        <button onClick={() => navigate('/lab')} className="p-2 hover:bg-gray-100 rounded-full"><ArrowLeft size={20} /></button>
        <div>
          <h1 className="text-2xl font-bold text-medical-text">Lab Registration & Billing</h1>
          <p className="text-sm text-gray-500">Register patient tests and generate invoice</p>
        </div>
      </div>

      <form onSubmit={handleSave} className="space-y-6">
        <div className="card grid grid-cols-1 md:grid-cols-3 gap-6">
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">Date</label>
            <input type="date" value={header.LhdDate} onChange={e => setHeader({...header, LhdDate: e.target.value})} className="w-full px-3 py-2 border border-gray-300 rounded-md" required />
          </div>
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">Patient <span className="text-red-500">*</span></label>
            <SearchableSelectWithCreate options={patientOpts} value={header.LhdPttCode} onChange={(v) => setHeader({...header, LhdPttCode: v as number})} onCreateNew={createPatient} placeholder="Select/Create Patient" />
          </div>
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">Consulting Doctor</label>
            <SearchableSelectWithCreate options={doctorOpts} value={header.LhdCDctCode} onChange={(v) => setHeader({...header, LhdCDctCode: v as number})} placeholder="Select Doctor (Optional)" />
          </div>
        </div>

        <div className="card">
          <div className="flex justify-between items-center mb-4">
            <h3 className="text-lg font-semibold text-gray-800">Tests / Services</h3>
            <button type="button" onClick={addItem} className="text-sm text-blue-600 hover:text-blue-700 font-medium flex items-center gap-1"><Plus size={16}/> Add Test</button>
          </div>

          <div className="overflow-x-auto">
            <table className="w-full text-left border-collapse min-w-max">
              <thead>
                <tr className="bg-gray-50 border-b border-gray-200">
                  <th className="py-2 px-2 text-sm font-medium text-gray-600 w-1/3">Test Name (Service)</th>
                  <th className="py-2 px-2 text-sm font-medium text-gray-600">Unit</th>
                  <th className="py-2 px-2 text-sm font-medium text-gray-600">Rate (₹)</th>
                  <th className="py-2 px-2 text-sm font-medium text-gray-600">Disc %</th>
                  <th className="py-2 px-2 text-sm font-medium text-gray-600 text-right">Amount</th>
                  <th className="py-2 px-2 w-10"></th>
                </tr>
              </thead>
              <tbody>
                {items.map((item, idx) => (
                  <tr key={idx} className="border-b border-gray-100">
                    <td className="py-2 px-2">
                      <SearchableSelectWithCreate options={serviceOpts} value={item.LrdSrvCode} onChange={(v) => handleServiceSelect(idx, v as number)} placeholder="Search test..." />
                    </td>
                    <td className="py-2 px-2"><input type="number" value={item.LrdUnit} onChange={e => handleItemChange(idx, 'LrdUnit', Number(e.target.value))} className="w-full p-1 border border-gray-300 rounded" /></td>
                    <td className="py-2 px-2"><input type="number" value={item.LrdRate} onChange={e => handleItemChange(idx, 'LrdRate', Number(e.target.value))} className="w-full p-1 border border-gray-300 rounded" /></td>
                    <td className="py-2 px-2"><input type="number" value={item.LrdDiscPer} onChange={e => handleItemChange(idx, 'LrdDiscPer', Number(e.target.value))} className="w-full p-1 border border-gray-300 rounded" /></td>
                    <td className="py-2 px-2 text-right font-medium text-gray-800">{item.LrdAmtAftDisc.toFixed(2)}</td>
                    <td className="py-2 px-2 text-center"><button type="button" onClick={() => removeItem(idx)} className="text-gray-400 hover:text-red-500"><Trash2 size={16} /></button></td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>

          <div className="flex justify-end mt-6 border-t border-gray-200 pt-6">
            <div className="w-72 space-y-3">
              <div className="flex justify-between items-center text-sm text-gray-600">
                <span>Overall Discount (%):</span>
                <input type="number" value={header.LhdDiscPer} onChange={e => setHeader({...header, LhdDiscPer: Number(e.target.value)})} className="w-24 p-1 border border-gray-300 rounded text-right" />
              </div>
              <div className="flex justify-between items-center text-sm text-gray-600">
                <span>Advance Paid (₹):</span>
                <input type="number" value={header.LhdAdvAmt} onChange={e => setHeader({...header, LhdAdvAmt: Number(e.target.value)})} className="w-24 p-1 border border-gray-300 rounded text-right text-green-600" />
              </div>
              <div className="flex justify-between text-lg font-bold text-gray-800 border-t border-gray-200 pt-2">
                <span>Final Amount Due:</span>
                <span className="text-blue-600">₹{Math.max(0, header.LhdTotalAmt - header.LhdAdvAmt).toFixed(2)}</span>
              </div>
            </div>
          </div>
        </div>

        <div className="flex justify-end gap-4">
          <button type="submit" disabled={mutation.isPending} className="btn-primary flex items-center gap-2 px-8">
            <Save size={18} /> Generate Bill
          </button>
        </div>
      </form>
    </div>
  );
}
