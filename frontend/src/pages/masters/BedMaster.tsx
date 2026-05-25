import { useState } from 'react';
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import { SummaryDetailLayout } from '../../components/layout/SummaryDetailLayout';
import api from '../../lib/api';
import { Plus, Edit2, Trash2, Save, X } from 'lucide-react';
import { SearchableSelectWithCreate } from '../../components/ui/SearchableSelectWithCreate';

interface Bed {
  BdmCode: number;
  BdmName: string;
  BdmWrdCode: number | null;
  BdmFlrCode: number | null;
  BdmCharges: number;
  BdmDiscPer: number;
  BdmDiscAllowed: boolean;
  BdmSrvCode: number | null;
  BdmFreeAllot: boolean;
  BdmChkTime: number | null;
  BdmChkOutTimeBasis: string | null;
  BdmIndex: number;
  BdmShowInList: boolean;
  BdmRemark: string | null;
}

const defaultFormData = {
  BdmName: '',
  BdmWrdCode: null as number | null,
  BdmFlrCode: null as number | null,
  BdmCharges: 0.0,
  BdmDiscPer: 0.0,
  BdmDiscAllowed: false,
  BdmSrvCode: null as number | null,
  BdmFreeAllot: false,
  BdmChkTime: null as number | null,
  BdmChkOutTimeBasis: '',
  BdmIndex: 0,
  BdmShowInList: true,
  BdmRemark: '',
};

export function BedMaster() {
  const queryClient = useQueryClient();
  const [selectedItem, setSelectedItem] = useState<Bed | null>(null);
  const [isEditing, setIsEditing] = useState(false);
  const [formData, setFormData] = useState(defaultFormData);

  // Queries
  const { data: items, isLoading } = useQuery({ queryKey: ['beds'], queryFn: async () => (await api.get<Bed[]>('/masters/beds')).data });
  const { data: wards } = useQuery({ queryKey: ['wards'], queryFn: async () => (await api.get<{WrdCode: number, WrdName: string}[]>('/masters/wards')).data });
  const { data: floors } = useQuery({ queryKey: ['floors'], queryFn: async () => (await api.get<{FlrCode: number, FlrName: string}[]>('/masters/floors')).data });

  // Mutations
  const createMutation = useMutation({
    mutationFn: async (newItem: typeof defaultFormData) => (await api.post('/masters/beds', newItem)).data,
    onSuccess: () => { queryClient.invalidateQueries({ queryKey: ['beds'] }); resetForm(); }
  });

  const updateMutation = useMutation({
    mutationFn: async (item: Bed) => {
      const { BdmCode, ...data } = item;
      return (await api.put(`/masters/beds/${BdmCode}`, data)).data;
    },
    onSuccess: () => { queryClient.invalidateQueries({ queryKey: ['beds'] }); resetForm(); }
  });

  const deleteMutation = useMutation({
    mutationFn: async (code: number) => await api.delete(`/masters/beds/${code}`),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['beds'] });
      if (selectedItem?.BdmCode) resetForm();
    }
  });

  // Handlers
  const handleSelect = (item: Bed) => {
    setSelectedItem(item);
    setFormData({
      BdmName: item.BdmName,
      BdmWrdCode: item.BdmWrdCode,
      BdmFlrCode: item.BdmFlrCode,
      BdmCharges: item.BdmCharges,
      BdmDiscPer: item.BdmDiscPer,
      BdmDiscAllowed: item.BdmDiscAllowed,
      BdmSrvCode: item.BdmSrvCode,
      BdmFreeAllot: item.BdmFreeAllot,
      BdmChkTime: item.BdmChkTime,
      BdmChkOutTimeBasis: item.BdmChkOutTimeBasis || '',
      BdmIndex: item.BdmIndex,
      BdmShowInList: item.BdmShowInList,
      BdmRemark: item.BdmRemark || '',
    });
    setIsEditing(false);
  };

  const handleAdd = () => { setSelectedItem(null); setFormData(defaultFormData); setIsEditing(true); };
  const handleEdit = () => { if (selectedItem) setIsEditing(true); };
  const handleDelete = (code: number) => { if (confirm('Are you sure you want to delete this bed?')) deleteMutation.mutate(code); };
  const resetForm = () => { setIsEditing(false); setSelectedItem(null); setFormData(defaultFormData); };

  const handleSave = (e: React.FormEvent) => {
    e.preventDefault();
    if (selectedItem) updateMutation.mutate({ BdmCode: selectedItem.BdmCode, ...formData });
    else createMutation.mutate(formData);
  };

  const isDetailActive = isEditing || selectedItem !== null;

  // Options for Dropdowns
  const wardOptions = wards?.map(w => ({ value: w.WrdCode, label: w.WrdName })) || [];
  const floorOptions = floors?.map(f => ({ value: f.FlrCode, label: f.FlrName })) || [];

  const handleCreateWard = async (name: string) => {
    const res = await api.post('/masters/wards', { WrdName: name });
    queryClient.invalidateQueries({ queryKey: ['wards'] });
    setFormData({ ...formData, BdmWrdCode: res.data.WrdCode });
  };

  const handleCreateFloor = async (name: string) => {
    const res = await api.post('/masters/floors', { FlrName: name, FlrShowInList: true });
    queryClient.invalidateQueries({ queryKey: ['floors'] });
    setFormData({ ...formData, BdmFlrCode: res.data.FlrCode });
  };

  const ListComponent = (
    <div className="flex flex-col h-full">
      <div className="p-2 border-b border-gray-100 flex justify-end">
        <button onClick={handleAdd} className="btn-primary text-xs px-3 py-1 flex items-center gap-1">
          <Plus size={14} /> Add New
        </button>
      </div>
      <div className="flex-1 overflow-y-auto">
        {isLoading ? (
          <div className="p-4 text-center text-gray-500 text-sm">Loading...</div>
        ) : items?.length === 0 ? (
          <div className="p-4 text-center text-gray-500 text-sm">No beds found.</div>
        ) : (
          <ul className="divide-y divide-gray-100">
            {items?.map((item) => (
              <li 
                key={item.BdmCode}
                className={`p-3 cursor-pointer hover:bg-gray-50 flex justify-between items-center group ${selectedItem?.BdmCode === item.BdmCode ? 'bg-blue-50 border-l-4 border-medical-mutedblue' : 'border-l-4 border-transparent'}`}
                onClick={() => handleSelect(item)}
              >
                <div className="flex flex-col">
                  <span className="text-sm font-medium text-gray-800">{item.BdmName}</span>
                  <span className="text-xs text-gray-500">Charge: ₹{item.BdmCharges}</span>
                </div>
                <div className="hidden group-hover:flex gap-2">
                  <button onClick={(e) => { e.stopPropagation(); handleSelect(item); handleEdit(); }} className="text-gray-400 hover:text-medical-mutedblue"><Edit2 size={14} /></button>
                  <button onClick={(e) => { e.stopPropagation(); handleDelete(item.BdmCode); }} className="text-gray-400 hover:text-red-500"><Trash2 size={14} /></button>
                </div>
              </li>
            ))}
          </ul>
        )}
      </div>
    </div>
  );

  const DetailComponent = (
    <div>
      {(!isEditing && !selectedItem) ? (
        <div className="h-full flex items-center justify-center text-gray-400 text-sm">
          Select an item from the list or click Add New
        </div>
      ) : (
        <form onSubmit={handleSave} className="space-y-4 max-w-2xl">
          <div className="grid grid-cols-2 gap-4">
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Bed Name <span className="text-red-500">*</span></label>
              <input type="text" required disabled={!isEditing} value={formData.BdmName} onChange={(e) => setFormData({ ...formData, BdmName: e.target.value })} className="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-medical-mutedblue focus:border-medical-mutedblue sm:text-sm disabled:bg-gray-50" placeholder="e.g. Bed 101" />
            </div>
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Charges</label>
              <input type="number" step="0.01" disabled={!isEditing} value={formData.BdmCharges} onChange={(e) => setFormData({ ...formData, BdmCharges: parseFloat(e.target.value) || 0 })} className="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-medical-mutedblue focus:border-medical-mutedblue sm:text-sm disabled:bg-gray-50" />
            </div>
          </div>

          <div className="grid grid-cols-2 gap-4">
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Ward</label>
              <SearchableSelectWithCreate
                options={wardOptions}
                value={formData.BdmWrdCode}
                onChange={(val) => setFormData({ ...formData, BdmWrdCode: val as number })}
                onCreateNew={handleCreateWard}
                placeholder="Select Ward"
                disabled={!isEditing}
              />
            </div>
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Floor</label>
              <SearchableSelectWithCreate
                options={floorOptions}
                value={formData.BdmFlrCode}
                onChange={(val) => setFormData({ ...formData, BdmFlrCode: val as number })}
                onCreateNew={handleCreateFloor}
                placeholder="Select Floor"
                disabled={!isEditing}
              />
            </div>
          </div>

          <div className="grid grid-cols-3 gap-4">
            <label className="flex items-center gap-2 text-sm text-gray-700">
              <input type="checkbox" disabled={!isEditing} checked={formData.BdmDiscAllowed} onChange={(e) => setFormData({ ...formData, BdmDiscAllowed: e.target.checked })} className="rounded border-gray-300 text-medical-mutedblue focus:ring-medical-mutedblue" />
              Discount Allowed
            </label>
            <label className="flex items-center gap-2 text-sm text-gray-700">
              <input type="checkbox" disabled={!isEditing} checked={formData.BdmFreeAllot} onChange={(e) => setFormData({ ...formData, BdmFreeAllot: e.target.checked })} className="rounded border-gray-300 text-medical-mutedblue focus:ring-medical-mutedblue" />
              Free Allotment
            </label>
             <label className="flex items-center gap-2 text-sm text-gray-700">
              <input type="checkbox" disabled={!isEditing} checked={formData.BdmShowInList} onChange={(e) => setFormData({ ...formData, BdmShowInList: e.target.checked })} className="rounded border-gray-300 text-medical-mutedblue focus:ring-medical-mutedblue" />
              Show In List
            </label>
          </div>
          
          <div className="grid grid-cols-2 gap-4">
             <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Discount %</label>
              <input type="number" step="0.01" disabled={!isEditing || !formData.BdmDiscAllowed} value={formData.BdmDiscPer} onChange={(e) => setFormData({ ...formData, BdmDiscPer: parseFloat(e.target.value) || 0 })} className="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-medical-mutedblue focus:border-medical-mutedblue sm:text-sm disabled:bg-gray-50" />
            </div>
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Check-out Time Basis</label>
              <select disabled={!isEditing} value={formData.BdmChkOutTimeBasis || ''} onChange={(e) => setFormData({ ...formData, BdmChkOutTimeBasis: e.target.value })} className="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-medical-mutedblue focus:border-medical-mutedblue sm:text-sm disabled:bg-gray-50">
                <option value="">None</option>
                <option value="24 Hours">24 Hours</option>
                <option value="Midnight">Midnight</option>
                <option value="Specific Time">Specific Time</option>
              </select>
            </div>
          </div>

          <div>
             <label className="block text-sm font-medium text-gray-700 mb-1">Remark</label>
             <input type="text" disabled={!isEditing} value={formData.BdmRemark || ''} onChange={(e) => setFormData({ ...formData, BdmRemark: e.target.value })} className="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-medical-mutedblue focus:border-medical-mutedblue sm:text-sm disabled:bg-gray-50" />
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
    </div>
  );

  return <SummaryDetailLayout title="Bed Master" listComponent={ListComponent} detailComponent={DetailComponent} isDetailActive={isDetailActive} />;
}
