import { useState } from 'react';
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import { SummaryDetailLayout } from '../../components/layout/SummaryDetailLayout';
import api from '../../lib/api';
import { Plus, Edit2, Trash2, Save, X } from 'lucide-react';
import { SearchableSelectWithCreate } from '../../components/ui/SearchableSelectWithCreate';

interface RefBy {
  RByCode: number;
  RByName: string;
  RBySpeci: string | null;
  RByRfgCode: number | null;
  RByAddr: string | null;
  RByTelNo: string | null;
  RByEmail: string | null;
  RByShare: number;
}

const defaultFormData = {
  RByName: '',
  RBySpeci: '',
  RByRfgCode: null as number | null,
  RByAddr: '',
  RByTelNo: '',
  RByEmail: '',
  RByShare: 0.0,
};

export function RefByMaster() {
  const queryClient = useQueryClient();
  const [selectedItem, setSelectedItem] = useState<RefBy | null>(null);
  const [isEditing, setIsEditing] = useState(false);
  const [formData, setFormData] = useState(defaultFormData);

  // Queries
  const { data: items, isLoading } = useQuery({ queryKey: ['ref-bys'], queryFn: async () => (await api.get<RefBy[]>('/masters/ref-bys')).data });
  const { data: categories } = useQuery({ queryKey: ['ref-categories'], queryFn: async () => (await api.get<{RfgCode: number, RfgName: string}[]>('/masters/ref-categories')).data });

  // Mutations
  const createMutation = useMutation({
    mutationFn: async (newItem: typeof defaultFormData) => (await api.post('/masters/ref-bys', newItem)).data,
    onSuccess: () => { queryClient.invalidateQueries({ queryKey: ['ref-bys'] }); resetForm(); }
  });

  const updateMutation = useMutation({
    mutationFn: async (item: RefBy) => {
      const { RByCode, ...data } = item;
      return (await api.put(`/masters/ref-bys/${RByCode}`, data)).data;
    },
    onSuccess: () => { queryClient.invalidateQueries({ queryKey: ['ref-bys'] }); resetForm(); }
  });

  const deleteMutation = useMutation({
    mutationFn: async (code: number) => await api.delete(`/masters/ref-bys/${code}`),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['ref-bys'] });
      if (selectedItem?.RByCode) resetForm();
    }
  });

  // Handlers
  const handleSelect = (item: RefBy) => {
    setSelectedItem(item);
    setFormData({
      RByName: item.RByName,
      RBySpeci: item.RBySpeci || '',
      RByRfgCode: item.RByRfgCode,
      RByAddr: item.RByAddr || '',
      RByTelNo: item.RByTelNo || '',
      RByEmail: item.RByEmail || '',
      RByShare: item.RByShare,
    });
    setIsEditing(false);
  };

  const handleAdd = () => { setSelectedItem(null); setFormData(defaultFormData); setIsEditing(true); };
  const handleEdit = () => { if (selectedItem) setIsEditing(true); };
  const handleDelete = (code: number) => { if (confirm('Are you sure you want to delete this refer-by entity?')) deleteMutation.mutate(code); };
  const resetForm = () => { setIsEditing(false); setSelectedItem(null); setFormData(defaultFormData); };

  const handleSave = (e: React.FormEvent) => {
    e.preventDefault();
    if (selectedItem) updateMutation.mutate({ RByCode: selectedItem.RByCode, ...formData });
    else createMutation.mutate(formData);
  };

  const isDetailActive = isEditing || selectedItem !== null;

  // Options for Dropdowns
  const catgOptions = categories?.map(c => ({ value: c.RfgCode, label: c.RfgName })) || [];

  const handleCreateCategory = async (name: string) => {
    const res = await api.post('/masters/ref-categories', { RfgName: name });
    queryClient.invalidateQueries({ queryKey: ['ref-categories'] });
    setFormData({ ...formData, RByRfgCode: res.data.RfgCode });
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
          <div className="p-4 text-center text-gray-500 text-sm">No refer-by entities found.</div>
        ) : (
          <ul className="divide-y divide-gray-100">
            {items?.map((item) => (
              <li 
                key={item.RByCode}
                className={`p-3 cursor-pointer hover:bg-gray-50 flex justify-between items-center group ${selectedItem?.RByCode === item.RByCode ? 'bg-blue-50 border-l-4 border-medical-mutedblue' : 'border-l-4 border-transparent'}`}
                onClick={() => handleSelect(item)}
              >
                <div className="flex flex-col">
                  <span className="text-sm font-medium text-gray-800">{item.RByName}</span>
                  <span className="text-xs text-gray-500">{item.RBySpeci}</span>
                </div>
                <div className="hidden group-hover:flex gap-2">
                  <button onClick={(e) => { e.stopPropagation(); handleSelect(item); handleEdit(); }} className="text-gray-400 hover:text-medical-mutedblue"><Edit2 size={14} /></button>
                  <button onClick={(e) => { e.stopPropagation(); handleDelete(item.RByCode); }} className="text-gray-400 hover:text-red-500"><Trash2 size={14} /></button>
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
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">Refer By Name <span className="text-red-500">*</span></label>
            <input type="text" required disabled={!isEditing} value={formData.RByName} onChange={(e) => setFormData({ ...formData, RByName: e.target.value })} className="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-medical-mutedblue focus:border-medical-mutedblue sm:text-sm disabled:bg-gray-50" placeholder="e.g. Dr. Jane Smith or XYZ Clinic" />
          </div>

          <div className="grid grid-cols-2 gap-4">
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Category</label>
              <SearchableSelectWithCreate
                options={catgOptions}
                value={formData.RByRfgCode}
                onChange={(val) => setFormData({ ...formData, RByRfgCode: val as number })}
                onCreateNew={handleCreateCategory}
                placeholder="Select Category"
                disabled={!isEditing}
              />
            </div>
             <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Specialization</label>
              <input type="text" disabled={!isEditing} value={formData.RBySpeci || ''} onChange={(e) => setFormData({ ...formData, RBySpeci: e.target.value })} className="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-medical-mutedblue focus:border-medical-mutedblue sm:text-sm disabled:bg-gray-50" placeholder="e.g. Orthopedics" />
            </div>
          </div>

          <div>
             <label className="block text-sm font-medium text-gray-700 mb-1">Address</label>
             <input type="text" disabled={!isEditing} value={formData.RByAddr || ''} onChange={(e) => setFormData({ ...formData, RByAddr: e.target.value })} className="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-medical-mutedblue focus:border-medical-mutedblue sm:text-sm disabled:bg-gray-50" />
          </div>

          <div className="grid grid-cols-2 gap-4">
             <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Contact No.</label>
              <input type="text" disabled={!isEditing} value={formData.RByTelNo || ''} onChange={(e) => setFormData({ ...formData, RByTelNo: e.target.value })} className="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-medical-mutedblue focus:border-medical-mutedblue sm:text-sm disabled:bg-gray-50" />
            </div>
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Email</label>
              <input type="email" disabled={!isEditing} value={formData.RByEmail || ''} onChange={(e) => setFormData({ ...formData, RByEmail: e.target.value })} className="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-medical-mutedblue focus:border-medical-mutedblue sm:text-sm disabled:bg-gray-50" />
            </div>
          </div>
          
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">Share (%)</label>
            <input type="number" step="0.01" disabled={!isEditing} value={formData.RByShare} onChange={(e) => setFormData({ ...formData, RByShare: parseFloat(e.target.value) || 0 })} className="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-medical-mutedblue focus:border-medical-mutedblue sm:text-sm disabled:bg-gray-50" />
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

  return <SummaryDetailLayout title="Refer-By Master" listComponent={ListComponent} detailComponent={DetailComponent} isDetailActive={isDetailActive} />;
}
