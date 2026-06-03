import { useState, useRef, useEffect } from 'react';
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import { useNavigate } from 'react-router-dom';
import api from '../../lib/api';
import { Save, ArrowLeft, Plus, Trash2 } from 'lucide-react';
import { useFormValidation } from '../../lib/useFormValidation';
import { useFormKeyboard } from '../../lib/useFormKeyboard';
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
  const formRef = useRef<HTMLFormElement>(null);
  useFormKeyboard(formRef);
  useFormValidation(formRef);

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

  const [roomItems, setRoomItems] = useState<BillItem[]>([
    { IbdSrvCode: null, IbdUnit: 1, IbdRate: 0, IbdAmtBefDisc: 0, IbdDiscPer: 0, IbdDiscAmt: 0, IbdAmtAftDisc: 0 }
  ]);
  const [medItems, setMedItems] = useState<BillItem[]>([]);
  const [procItems, setProcItems] = useState<BillItem[]>([]);
  const [gasItems, setGasItems] = useState<BillItem[]>([]);

  const { data: admissions } = useQuery({ queryKey: ['ipd-admissions'], queryFn: async () => (await api.get<any[]>('/ipd/admissions')).data });
  const { data: services } = useQuery({ queryKey: ['services'], queryFn: async () => (await api.get<any[]>('/masters/services')).data });

  const adminOpts = admissions?.filter(a => a.IhdStatus === 'Admitted').map(a => ({ 
    value: a.IhdCode, 
    label: `IPD-${a.IhdVchNo} (Patient ID: ${a.IhdPttCode})`, 
    pttCode: a.IhdPttCode,
    admDate: a.IhdDate
  })) || [];
  const serviceOpts = services?.map(s => ({ value: s.SrvCode, label: s.SrvName, rate: s.SrvCharges })) || [];

  const mutation = useMutation({
    mutationFn: async (data: any) => (await api.post('/ipd/bills', data)).data,
    onSuccess: (data) => {
      queryClient.invalidateQueries({ queryKey: ['ipd-bills'] });
      queryClient.invalidateQueries({ queryKey: ['ipd-admissions'] });
      navigate('/ipd/receipt', { state: { autoSelectVchNo: data.IbhVchNo, type: 'bill' } });
    }
  });

  const calculateDays = (admDateStr: string, disDateStr: string) => {
    if (!admDateStr || !disDateStr) return 1;
    const diffTime = Math.abs(new Date(disDateStr).getTime() - new Date(admDateStr).getTime());
    const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));
    return diffDays === 0 ? 1 : diffDays; // Minimum 1 day
  };

  const handleAdminChange = (val: number) => {
    const admin = adminOpts.find(a => a.value === val);
    setHeader({ ...header, IbhIhdCode: val, IbhPttCode: admin?.pttCode || null });
    
    // Auto calculate bed occupancy days
    if (admin && admin.admDate) {
      const days = calculateDays(admin.admDate, header.IbhDate);
      if (roomItems.length > 0) {
        const newRoomItems = [...roomItems];
        newRoomItems[0].IbdUnit = days;
        newRoomItems[0].IbdAmtBefDisc = days * newRoomItems[0].IbdRate;
        newRoomItems[0].IbdDiscAmt = (newRoomItems[0].IbdAmtBefDisc * newRoomItems[0].IbdDiscPer) / 100;
        newRoomItems[0].IbdAmtAftDisc = newRoomItems[0].IbdAmtBefDisc - newRoomItems[0].IbdDiscAmt;
        setRoomItems(newRoomItems);
      }
    }
  };

  const handleDateChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    const newDate = e.target.value;
    setHeader({...header, IbhDate: newDate});
    
    if (header.IbhIhdCode) {
      const admin = adminOpts.find(a => a.value === header.IbhIhdCode);
      if (admin && admin.admDate) {
        const days = calculateDays(admin.admDate, newDate);
        if (roomItems.length > 0) {
          const newRoomItems = [...roomItems];
          newRoomItems[0].IbdUnit = days;
          newRoomItems[0].IbdAmtBefDisc = days * newRoomItems[0].IbdRate;
          newRoomItems[0].IbdDiscAmt = (newRoomItems[0].IbdAmtBefDisc * newRoomItems[0].IbdDiscPer) / 100;
          newRoomItems[0].IbdAmtAftDisc = newRoomItems[0].IbdAmtBefDisc - newRoomItems[0].IbdDiscAmt;
          setRoomItems(newRoomItems);
        }
      }
    }
  };

  useEffect(() => {
    const allItems = [...roomItems, ...medItems, ...procItems, ...gasItems];
    const totalAmt = allItems.reduce((sum, item) => sum + item.IbdAmtAftDisc, 0);
    const discAmt = (totalAmt * header.IbhDiscPer) / 100;
    const finalAmt = totalAmt - discAmt;
    
    setHeader(prev => ({
      ...prev,
      IbhTotalAmt: totalAmt,
      IbhBalAmt: finalAmt - prev.IbhDepAmt
    }));
  }, [roomItems, medItems, procItems, gasItems, header.IbhDiscPer, header.IbhDepAmt]);

  const handleItemChange = (
    listState: BillItem[], 
    setListState: React.Dispatch<React.SetStateAction<BillItem[]>>, 
    index: number, 
    field: keyof BillItem, 
    value: any
  ) => {
    const newItems = [...listState];
    const itm = newItems[index];
    (itm as any)[field] = value;
    
    if (field === 'IbdSrvCode') {
      const srv = serviceOpts.find(s => s.value === value);
      if (srv) itm.IbdRate = srv.rate || 0;
    }

    itm.IbdAmtBefDisc = itm.IbdUnit * itm.IbdRate;
    itm.IbdDiscAmt = (itm.IbdAmtBefDisc * itm.IbdDiscPer) / 100;
    itm.IbdAmtAftDisc = itm.IbdAmtBefDisc - itm.IbdDiscAmt;

    setListState(newItems);
  };

  const addItem = (setListState: React.Dispatch<React.SetStateAction<BillItem[]>>) => {
    setListState(prev => [...prev, { IbdSrvCode: null, IbdUnit: 1, IbdRate: 0, IbdAmtBefDisc: 0, IbdDiscPer: 0, IbdDiscAmt: 0, IbdAmtAftDisc: 0 }]);
  };

  const removeItem = (listState: BillItem[], setListState: React.Dispatch<React.SetStateAction<BillItem[]>>, index: number) => {
    setListState(listState.filter((_, i) => i !== index));
  };

  const handleSave = (e: React.FormEvent) => {
    e.preventDefault();
    if (!header.IbhIhdCode) return alert('Select Admission Record');
    const validItems = [...roomItems, ...medItems, ...procItems, ...gasItems].filter(i => i.IbdSrvCode);
    if (validItems.length === 0) return alert('Add at least one service/resource');
    
    mutation.mutate({ ...header, details: validItems });
  };

  const renderTable = (title: string, listState: BillItem[], setListState: React.Dispatch<React.SetStateAction<BillItem[]>>, placeholder: string) => (
    <div className="mb-8">
      <div className="flex justify-between items-center mb-3">
        <h3 className="text-md font-semibold text-gray-800">{title}</h3>
        <button type="button" onClick={() => addItem(setListState)} className="text-sm text-medical-primary hover:text-medical-text font-medium flex items-center gap-1"><Plus size={16}/> Add Row</button>
      </div>
      <div className="overflow-x-auto">
        <table className="w-full text-left border-collapse border border-medical-border">
          <thead className="bg-gray-50 border-b border-medical-border">
            <tr>
              <th className="py-2 px-3 text-xs font-medium text-gray-600 w-1/3">Item / Service Name</th>
              <th className="py-2 px-3 text-xs font-medium text-gray-600">Unit (Days/Qty)</th>
              <th className="py-2 px-3 text-xs font-medium text-gray-600">Rate (₹)</th>
              <th className="py-2 px-3 text-xs font-medium text-gray-600">Disc %</th>
              <th className="py-2 px-3 text-xs font-medium text-gray-600 text-right">Net Amount (₹)</th>
              <th className="py-2 px-3 w-10"></th>
            </tr>
          </thead>
          <tbody>
            {listState.map((item, idx) => (
              <tr key={idx} className="border-b border-medical-border hover:bg-gray-50">
                <td className="py-1 px-3">
                  <SearchableSelectWithCreate options={serviceOpts} value={item.IbdSrvCode} onChange={(v) => handleItemChange(listState, setListState, idx, 'IbdSrvCode', v)} placeholder={placeholder} />
                </td>
                <td className="py-1 px-3"><input type="number" value={item.IbdUnit} onChange={e => handleItemChange(listState, setListState, idx, 'IbdUnit', Number(e.target.value))} className="w-full p-1 border border-medical-border rounded text-sm" /></td>
                <td className="py-1 px-3"><input type="number" value={item.IbdRate} onChange={e => handleItemChange(listState, setListState, idx, 'IbdRate', Number(e.target.value))} className="w-full p-1 border border-medical-border rounded text-sm" /></td>
                <td className="py-1 px-3"><input type="number" value={item.IbdDiscPer} onChange={e => handleItemChange(listState, setListState, idx, 'IbdDiscPer', Number(e.target.value))} className="w-full p-1 border border-medical-border rounded text-sm" /></td>
                <td className="py-1 px-3 text-right font-medium text-gray-800 text-sm">{item.IbdAmtAftDisc.toFixed(2)}</td>
                <td className="py-1 px-3 text-center">
                  <button type="button" onClick={() => removeItem(listState, setListState, idx)} className="text-gray-400 hover:text-red-500"><Trash2 size={16} /></button>
                </td>
              </tr>
            ))}
            {listState.length === 0 && (
              <tr><td colSpan={6} className="py-3 text-center text-sm text-gray-400">No items added. Click 'Add Row'.</td></tr>
            )}
          </tbody>
        </table>
      </div>
    </div>
  );

  return (
    <div className="max-w-6xl mx-auto space-y-6">
      <div className="flex items-center gap-4">
        <button onClick={() => navigate('/ipd')} className="p-2 hover:bg-gray-100 rounded-full"><ArrowLeft size={20} /></button>
        <div>
          <h1 className="text-2xl font-bold text-medical-text">IPD Final Billing & Resource Tracking</h1>
          <p className="text-sm text-gray-500">Track medicines, procedures, and generate final bill</p>
        </div>
      </div>

      <form ref={formRef} onSubmit={handleSave} className="space-y-6">
        <div className="card grid grid-cols-1 md:grid-cols-2 gap-6">
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">Discharge Date</label>
            <input type="date" value={header.IbhDate} onChange={handleDateChange} className="input-field" required />
          </div>
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">Select Admission <span className="text-red-500">*</span></label>
            <SearchableSelectWithCreate options={adminOpts} value={header.IbhIhdCode} onChange={(v) => handleAdminChange(v as number)} placeholder="Search IPD Admissions" />
          </div>
        </div>

        <div className="card">
          <h2 className="text-lg font-bold text-gray-800 mb-6 border-b pb-2">Resource & Services Tracking</h2>
          
          {renderTable('Room Rent & General Services', roomItems, setRoomItems, 'Search room rent or service...')}
          {renderTable('Daily Medicines & Consumables', medItems, setMedItems, 'Search medicines...')}
          {renderTable('OT, Surgery & Procedures', procItems, setProcItems, 'Search procedures...')}
          {renderTable('Medical Gas & Oxygen', gasItems, setGasItems, 'Search medical gas...')}
          
          <div className="flex justify-end mt-6 border-t border-medical-border pt-6">
            <div className="w-72 space-y-3">
              <div className="flex justify-between text-sm text-gray-600">
                <span>Subtotal:</span>
                <span className="font-medium">₹{header.IbhTotalAmt.toFixed(2)}</span>
              </div>
              <div className="flex justify-between items-center text-sm text-gray-600">
                <span>Overall Discount %:</span>
                <input type="number" value={header.IbhDiscPer} onChange={e => setHeader({...header, IbhDiscPer: Number(e.target.value)})} className="w-20 p-1 border border-medical-border rounded text-right" />
              </div>
              <div className="flex justify-between text-sm text-gray-600">
                <span>Advance Paid:</span>
                <input type="number" value={header.IbhDepAmt} onChange={e => setHeader({...header, IbhDepAmt: Number(e.target.value)})} className="w-24 p-1 border border-medical-border rounded text-right bg-green-50" />
              </div>
              <div className="flex justify-between text-lg font-bold text-gray-800 border-t border-medical-border pt-2">
                <span>Balance Due:</span>
                <span className={header.IbhBalAmt > 0 ? 'text-red-600' : 'text-green-600'}>₹{header.IbhBalAmt.toFixed(2)}</span>
              </div>
            </div>
          </div>
        </div>

        <div className="flex justify-end gap-4">
          <button type="button" onClick={() => navigate('/ipd')} className="btn-secondary px-6">Cancel</button>
          <button type="submit" disabled={mutation.isPending} className="btn-success flex items-center gap-2 px-8">
            <Save size={18} /> Finalize & Discharge
          </button>
        </div>
      </form>
    </div>
  );
}


