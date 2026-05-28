import { useState, useRef } from 'react';
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import { SummaryDetailLayout } from '../../components/layout/SummaryDetailLayout';
import api from '../../lib/api';
import { Plus, Edit2, Trash2, Save, X } from 'lucide-react';
import { useFormValidation } from '../../lib/useFormValidation';
import { useFormKeyboard } from '../../lib/useFormKeyboard';
import { SearchableSelectWithCreate } from '../../components/ui/SearchableSelectWithCreate';
import { ServiceRateGrid } from './ServiceRateGrid';

interface Service {
  SrvCode: number;
  SrvName: string;
  SrvSgpCode: number | null;
  SrvAhCode: number | null;
  SrvCharges: number;
  SrvDiscPer: number;
  SrvIndex: number;
  SrvRateEditable: boolean;
  SrvAmtEditable: boolean;
  SrvUnitEditable: boolean;
  SrvMultiDct: boolean;
  SrvShowInList: boolean;
  SrvAutoInsIndr: boolean;
  SrvAutoInsOnceIndr: boolean;
  SrvAutoCalcIndr: boolean;
  SrvInfAllowed: boolean;
  SrvDefAllowed: boolean;
  SrvDiscAllowed: boolean;
  SrvExtRateSys: boolean;
  SrvExtDiscSys: boolean;
  SrvExtShareSys: boolean;
  SrvExtBargSys: boolean;
}

const defaultFormData: Omit<Service, 'SrvCode'> = {
  SrvName: '', SrvSgpCode: null, SrvAhCode: null, SrvCharges: 0, SrvDiscPer: 0, SrvIndex: 0,
  SrvRateEditable: false, SrvAmtEditable: false, SrvUnitEditable: false, SrvMultiDct: false,
  SrvShowInList: true, SrvAutoInsIndr: false, SrvAutoInsOnceIndr: false, SrvAutoCalcIndr: false,
  SrvInfAllowed: false, SrvDefAllowed: false, SrvDiscAllowed: false, SrvExtRateSys: false,
  SrvExtDiscSys: false, SrvExtShareSys: false, SrvExtBargSys: false
};

export function ServMaster() {
  const formRef = useRef<HTMLFormElement>(null);
  useFormKeyboard(formRef);
  useFormValidation(formRef);

  const queryClient = useQueryClient();
  const [selectedItem, setSelectedItem] = useState<Service | null>(null);
  const [isEditing, setIsEditing] = useState(false);
  const [formData, setFormData] = useState(defaultFormData);

  const { data: items, isLoading } = useQuery({ queryKey: ['services'], queryFn: async () => (await api.get<Service[]>('/masters/services')).data });
  const { data: groups } = useQuery({ queryKey: ['service-groups'], queryFn: async () => (await api.get<{SgpCode: number, SgpName: string}[]>('/masters/service-groups')).data });

  const createMutation = useMutation({
    mutationFn: async (newItem: typeof defaultFormData) => (await api.post('/masters/services', newItem)).data,
    onSuccess: () => { queryClient.invalidateQueries({ queryKey: ['services'] }); resetForm(); }
  });

  const updateMutation = useMutation({
    mutationFn: async (item: Service) => {
      const { SrvCode, ...data } = item;
      return (await api.put(`/masters/services/${SrvCode}`, data)).data;
    },
    onSuccess: () => { queryClient.invalidateQueries({ queryKey: ['services'] }); resetForm(); }
  });

  const deleteMutation = useMutation({
    mutationFn: async (code: number) => await api.delete(`/masters/services/${code}`),
    onSuccess: () => { queryClient.invalidateQueries({ queryKey: ['services'] }); if (selectedItem?.SrvCode) resetForm(); }
  });

  const handleSelect = (item: Service) => { setSelectedItem(item); setFormData(item); setIsEditing(false); };
  const handleAdd = () => { setSelectedItem(null); setFormData(defaultFormData); setIsEditing(true); };
  const handleEdit = () => { if (selectedItem) setIsEditing(true); };
  const handleDelete = (code: number) => { if (confirm('Delete this service?')) deleteMutation.mutate(code); };
  const resetForm = () => { setIsEditing(false); setSelectedItem(null); setFormData(defaultFormData); };

  const handleSave = (e: React.FormEvent) => {
    e.preventDefault();
    if (selectedItem) updateMutation.mutate({ SrvCode: selectedItem.SrvCode, ...formData });
    else createMutation.mutate(formData);
  };

  const isDetailActive = isEditing || selectedItem !== null;

  const renderCheckbox = (key: keyof typeof formData, label: string) => (
    <label className="flex items-center gap-2 text-sm text-gray-700">
      <input type="checkbox" disabled={!isEditing} checked={formData[key] as boolean} onChange={(e) => setFormData({ ...formData, [key]: e.target.checked })} className="rounded border-gray-300 text-medical-mutedblue focus:ring-medical-mutedblue" />
      {label}
    </label>
  );

  const groupOptions = groups?.map(g => ({ value: g.SgpCode, label: g.SgpName })) || [];

  const handleCreateGroup = async (name: string) => {
    const res = await api.post('/masters/service-groups', { SgpName: name });
    queryClient.invalidateQueries({ queryKey: ['service-groups'] });
    setFormData({ ...formData, SrvSgpCode: res.data.SgpCode });
  };

  const ListComponent = (
    <div className="flex flex-col h-full">
      <div className="p-2 border-b border-gray-100 flex justify-end">
        <button onClick={handleAdd} className="btn-primary text-xs px-3 py-1 flex items-center gap-1"><Plus size={14} /> Add New</button>
      </div>
      <div className="flex-1 overflow-y-auto">
        {isLoading ? <div className="p-4 text-center text-gray-500 text-sm">Loading...</div> : items?.length === 0 ? <div className="p-4 text-center text-gray-500 text-sm">No items found.</div> : (
          <ul className="divide-y divide-gray-100">
            {items?.map((item) => (
              <li key={item.SrvCode} className={`p-3 cursor-pointer hover:bg-gray-50 flex justify-between items-center group ${selectedItem?.SrvCode === item.SrvCode ? 'bg-blue-50 border-l-4 border-medical-mutedblue' : 'border-l-4 border-transparent'}`} onClick={() => handleSelect(item)}>
                <div className="flex flex-col">
                  <span className="text-sm font-medium text-gray-800">{item.SrvName}</span>
                  <span className="text-xs text-gray-500">₹{item.SrvCharges}</span>
                </div>
                <div className="hidden group-hover:flex gap-2">
                  <button onClick={(e) => { e.stopPropagation(); handleSelect(item); handleEdit(); }} className="text-gray-400 hover:text-medical-mutedblue"><Edit2 size={14} /></button>
                  <button onClick={(e) => { e.stopPropagation(); handleDelete(item.SrvCode); }} className="text-gray-400 hover:text-red-500"><Trash2 size={14} /></button>
                </div>
              </li>
            ))}
          </ul>
        )}
      </div>
    </div>
  );

  const DetailComponent = (
    <div className="pb-8">
      {(!isEditing && !selectedItem) ? (
        <div className="h-full flex items-center justify-center text-gray-400 text-sm mt-20">Select an item from the list or click Add New</div>
      ) : (
        <form ref={formRef} onSubmit={handleSave} className="space-y-6 max-w-4xl">
          <div className="grid grid-cols-2 gap-4">
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Service Name <span className="text-red-500">*</span></label>
              <input type="text" required disabled={!isEditing} value={formData.SrvName} onChange={(e) => setFormData({ ...formData, SrvName: e.target.value })} className="input-field" placeholder="e.g. Complete Blood Count (CBC)" />
            </div>
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Service Group</label>
              <SearchableSelectWithCreate
                options={groupOptions}
                value={formData.SrvSgpCode}
                onChange={(val) => setFormData({ ...formData, SrvSgpCode: val as number })}
                onCreateNew={handleCreateGroup}
                placeholder="Select Group"
                disabled={!isEditing}
              />
            </div>
          </div>
          
          <div className="grid grid-cols-2 gap-4">
            <div>
               <label className="block text-sm font-medium text-gray-700 mb-1">Base Charges (₹)</label>
               <input type="number" step="0.01" disabled={!isEditing} value={formData.SrvCharges} onChange={(e) => setFormData({ ...formData, SrvCharges: parseFloat(e.target.value) || 0 })} className="input-field" />
            </div>
            <div>
               <label className="block text-sm font-medium text-gray-700 mb-1">Max Discount %</label>
               <input type="number" step="0.01" disabled={!isEditing || !formData.SrvDiscAllowed} value={formData.SrvDiscPer} onChange={(e) => setFormData({ ...formData, SrvDiscPer: parseFloat(e.target.value) || 0 })} className="input-field" />
            </div>
          </div>

          <div className="grid grid-cols-2 gap-4">
            <div>
               <label className="block text-sm font-medium text-gray-700 mb-1">Account Head Code (AhCode)</label>
               <input type="number" disabled={!isEditing} value={formData.SrvAhCode ?? ''} onChange={(e) => setFormData({ ...formData, SrvAhCode: e.target.value ? parseInt(e.target.value) : null })} className="input-field" placeholder="e.g. 501" />
            </div>
            <div>
               <label className="block text-sm font-medium text-gray-700 mb-1">Sorting Index</label>
               <input type="number" disabled={!isEditing} value={formData.SrvIndex} onChange={(e) => setFormData({ ...formData, SrvIndex: parseInt(e.target.value) || 0 })} className="input-field" />
            </div>
          </div>

          <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
            <div className="bg-gray-50 p-4 rounded-md border border-gray-100 space-y-2">
              <h4 className="text-xs font-semibold text-gray-500 uppercase tracking-wider mb-2">General Options</h4>
              {renderCheckbox('SrvShowInList', 'Show in List')}
              {renderCheckbox('SrvRateEditable', 'Rate Editable')}
              {renderCheckbox('SrvAmtEditable', 'Amount Editable')}
              {renderCheckbox('SrvUnitEditable', 'Unit Editable')}
              {renderCheckbox('SrvMultiDct', 'Multiple Doctors')}
            </div>

            <div className="bg-gray-50 p-4 rounded-md border border-gray-100 space-y-2">
              <h4 className="text-xs font-semibold text-gray-500 uppercase tracking-wider mb-2">Automations</h4>
              {renderCheckbox('SrvAutoInsIndr', 'Auto Insert (Indoor)')}
              {renderCheckbox('SrvAutoInsOnceIndr', 'Auto Insert Once')}
              {renderCheckbox('SrvAutoCalcIndr', 'Auto Calculate')}
              {renderCheckbox('SrvInfAllowed', 'Inflation Allowed')}
              {renderCheckbox('SrvDefAllowed', 'Deflation Allowed')}
              {renderCheckbox('SrvDiscAllowed', 'Discount Allowed')}
            </div>

            <div className="bg-gray-50 p-4 rounded-md border border-gray-100 space-y-2">
              <h4 className="text-xs font-semibold text-gray-500 uppercase tracking-wider mb-2">External Systems</h4>
              {renderCheckbox('SrvExtRateSys', 'External Rate')}
              {renderCheckbox('SrvExtDiscSys', 'External Discount')}
              {renderCheckbox('SrvExtShareSys', 'External Share')}
              {renderCheckbox('SrvExtBargSys', 'External Bargain')}
            </div>
          </div>

          <div className="flex gap-3 pt-4 border-t border-gray-100">
            {isEditing ? (
              <>
                <button type="submit" disabled={createMutation.isPending || updateMutation.isPending} className="btn-success flex items-center gap-2"><Save size={16} /> Save</button>
                <button type="button" onClick={resetForm} className="px-4 py-2 border border-gray-300 rounded text-sm text-gray-700 hover:bg-gray-50 flex items-center gap-2"><X size={16} /> Cancel</button>
              </>
            ) : (
              <button type="button" onClick={handleEdit} className="btn-primary flex items-center gap-2"><Edit2 size={16} /> Edit</button>
            )}
          </div>
        </form>
      )}

      {/* Render the hierarchical pricing rules grid only if an existing service is selected (not in Add mode) */}
      {selectedItem && !isEditing && (
        <ServiceRateGrid serviceId={selectedItem.SrvCode} />
      )}
    </div>
  );

  return <SummaryDetailLayout title="Service Master" listComponent={ListComponent} detailComponent={DetailComponent} isDetailActive={isDetailActive} />;
}
