import { useState, useRef } from 'react';
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import { SummaryDetailLayout } from '../../components/layout/SummaryDetailLayout';
import api from '../../lib/api';
import { Plus, Edit2, Trash2, Save, X } from 'lucide-react';
import { useFormValidation } from '../../lib/useFormValidation';
import { useFormKeyboard } from '../../lib/useFormKeyboard';
import { SearchableSelectWithCreate } from '../../components/ui/SearchableSelectWithCreate';

interface Doct {
  DctCode: number;
  DctTitle: string | null;
  DctName: string;
  DctSpeci: string | null;
  DctDcgCode: number | null;
  DctDrlCode: number | null;
  DctAddr: string | null;
  DctTelNo: string | null;
  DctEmail: string | null;
  DctShare: number;
}

const defaultFormData = {
  DctTitle: 'Dr.',
  DctName: '',
  DctSpeci: '',
  DctDcgCode: null as number | null,
  DctDrlCode: null as number | null,
  DctAddr: '',
  DctTelNo: '',
  DctEmail: '',
  DctShare: 0.0,
};

export function DoctMaster() {
  const formRef = useRef<HTMLFormElement>(null);
  useFormKeyboard(formRef);
  useFormValidation(formRef);

  const queryClient = useQueryClient();
  const [selectedItem, setSelectedItem] = useState<Doct | null>(null);
  const [isEditing, setIsEditing] = useState(false);
  const [formData, setFormData] = useState(defaultFormData);

  // Queries
  const { data: items, isLoading } = useQuery({ queryKey: ['doctors'], queryFn: async () => (await api.get<Doct[]>('/masters/doctors')).data });
  const { data: categories } = useQuery({ queryKey: ['doct-categories'], queryFn: async () => (await api.get<{DcgCode: number, DcgName: string}[]>('/masters/doct-categories')).data });
  const { data: roles } = useQuery({ queryKey: ['doct-roles'], queryFn: async () => (await api.get<{DrlCode: number, DrlName: string}[]>('/masters/doct-roles')).data });

  // Mutations
  const createMutation = useMutation({
    mutationFn: async (newItem: typeof defaultFormData) => (await api.post('/masters/doctors', newItem)).data,
    onSuccess: () => { queryClient.invalidateQueries({ queryKey: ['doctors'] }); resetForm(); }
  });

  const updateMutation = useMutation({
    mutationFn: async (item: Doct) => {
      const { DctCode, ...data } = item;
      return (await api.put(`/masters/doctors/${DctCode}`, data)).data;
    },
    onSuccess: () => { queryClient.invalidateQueries({ queryKey: ['doctors'] }); resetForm(); }
  });

  const deleteMutation = useMutation({
    mutationFn: async (code: number) => await api.delete(`/masters/doctors/${code}`),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['doctors'] });
      if (selectedItem?.DctCode) resetForm();
    }
  });

  // Handlers
  const handleSelect = (item: Doct) => {
    setSelectedItem(item);
    setFormData({
      DctTitle: item.DctTitle || '',
      DctName: item.DctName,
      DctSpeci: item.DctSpeci || '',
      DctDcgCode: item.DctDcgCode,
      DctDrlCode: item.DctDrlCode,
      DctAddr: item.DctAddr || '',
      DctTelNo: item.DctTelNo || '',
      DctEmail: item.DctEmail || '',
      DctShare: item.DctShare,
    });
    setIsEditing(false);
  };

  const handleAdd = () => { setSelectedItem(null); setFormData(defaultFormData); setIsEditing(true); };
  const handleEdit = () => { if (selectedItem) setIsEditing(true); };
  const handleDelete = (code: number) => { if (confirm('Are you sure you want to delete this doctor?')) deleteMutation.mutate(code); };
  const resetForm = () => { setIsEditing(false); setSelectedItem(null); setFormData(defaultFormData); };

  const handleSave = (e: React.FormEvent) => {
    e.preventDefault();
    if (selectedItem) updateMutation.mutate({ DctCode: selectedItem.DctCode, ...formData });
    else createMutation.mutate(formData);
  };

  const isDetailActive = isEditing || selectedItem !== null;

  // Options for Dropdowns
  const catgOptions = categories?.map(c => ({ value: c.DcgCode, label: c.DcgName })) || [];
  const roleOptions = roles?.map(r => ({ value: r.DrlCode, label: r.DrlName })) || [];

  const handleCreateCategory = async (name: string) => {
    const res = await api.post('/masters/doct-categories', { DcgName: name });
    queryClient.invalidateQueries({ queryKey: ['doct-categories'] });
    setFormData({ ...formData, DctDcgCode: res.data.DcgCode });
  };

  const handleCreateRole = async (name: string) => {
    const res = await api.post('/masters/doct-roles', { DrlName: name });
    queryClient.invalidateQueries({ queryKey: ['doct-roles'] });
    setFormData({ ...formData, DctDrlCode: res.data.DrlCode });
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
          <div className="p-4 text-center text-gray-500 text-sm">No doctors found.</div>
        ) : (
          <ul className="divide-y divide-gray-100">
            {items?.map((item) => (
              <li 
                key={item.DctCode}
                className={`p-3 cursor-pointer hover:bg-gray-50 flex justify-between items-center group ${selectedItem?.DctCode === item.DctCode ? 'bg-blue-50 border-l-4 border-medical-mutedblue' : 'border-l-4 border-transparent'}`}
                onClick={() => handleSelect(item)}
              >
                <div className="flex flex-col">
                  <span className="text-sm font-medium text-gray-800">{item.DctTitle} {item.DctName}</span>
                  <span className="text-xs text-gray-500">{item.DctSpeci}</span>
                </div>
                <div className="hidden group-hover:flex gap-2">
                  <button onClick={(e) => { e.stopPropagation(); handleSelect(item); handleEdit(); }} className="text-gray-400 hover:text-medical-mutedblue"><Edit2 size={14} /></button>
                  <button onClick={(e) => { e.stopPropagation(); handleDelete(item.DctCode); }} className="text-gray-400 hover:text-red-500"><Trash2 size={14} /></button>
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
        <form ref={formRef} onSubmit={handleSave} className="space-y-4 max-w-2xl">
          <div className="grid grid-cols-4 gap-4">
            <div className="col-span-1">
              <label className="block text-sm font-medium text-gray-700 mb-1">Title</label>
              <input type="text" disabled={!isEditing} value={formData.DctTitle || ''} onChange={(e) => setFormData({ ...formData, DctTitle: e.target.value })} className="input-field" placeholder="Dr." />
            </div>
            <div className="col-span-3">
              <label className="block text-sm font-medium text-gray-700 mb-1">Doctor Name <span className="text-red-500">*</span></label>
              <input type="text" required disabled={!isEditing} value={formData.DctName} onChange={(e) => setFormData({ ...formData, DctName: e.target.value })} className="input-field" placeholder="e.g. John Doe" />
            </div>
          </div>

          <div className="grid grid-cols-2 gap-4">
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Category</label>
              <SearchableSelectWithCreate
                options={catgOptions}
                value={formData.DctDcgCode}
                onChange={(val) => setFormData({ ...formData, DctDcgCode: val as number })}
                onCreateNew={handleCreateCategory}
                placeholder="Select Category"
                disabled={!isEditing}
              />
            </div>
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Role</label>
              <SearchableSelectWithCreate
                options={roleOptions}
                value={formData.DctDrlCode}
                onChange={(val) => setFormData({ ...formData, DctDrlCode: val as number })}
                onCreateNew={handleCreateRole}
                placeholder="Select Role"
                disabled={!isEditing}
              />
            </div>
          </div>

          <div className="grid grid-cols-2 gap-4">
             <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Specialization</label>
              <input type="text" disabled={!isEditing} value={formData.DctSpeci || ''} onChange={(e) => setFormData({ ...formData, DctSpeci: e.target.value })} className="input-field" placeholder="e.g. Cardiologist" />
            </div>
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Doctor Share (%)</label>
              <input type="number" step="0.01" disabled={!isEditing} value={formData.DctShare} onChange={(e) => setFormData({ ...formData, DctShare: parseFloat(e.target.value) || 0 })} className="input-field" />
            </div>
          </div>

          <div>
             <label className="block text-sm font-medium text-gray-700 mb-1">Address</label>
             <input type="text" disabled={!isEditing} value={formData.DctAddr || ''} onChange={(e) => setFormData({ ...formData, DctAddr: e.target.value })} className="input-field" />
          </div>

          <div className="grid grid-cols-2 gap-4">
             <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Contact No.</label>
              <input type="text" disabled={!isEditing} value={formData.DctTelNo || ''} onChange={(e) => setFormData({ ...formData, DctTelNo: e.target.value })} className="input-field" />
            </div>
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Email</label>
              <input type="email" disabled={!isEditing} value={formData.DctEmail || ''} onChange={(e) => setFormData({ ...formData, DctEmail: e.target.value })} className="input-field" />
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
    </div>
  );

  return <SummaryDetailLayout title="Doctor Master" listComponent={ListComponent} detailComponent={DetailComponent} isDetailActive={isDetailActive} />;
}
