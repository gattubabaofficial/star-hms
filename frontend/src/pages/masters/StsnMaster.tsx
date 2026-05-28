import { useState, useRef } from 'react';
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import { SummaryDetailLayout } from '../../components/layout/SummaryDetailLayout';
import api from '../../lib/api';
import { Plus, Edit2, Trash2, Save, X } from 'lucide-react';
import { useFormValidation } from '../../lib/useFormValidation';
import { useFormKeyboard } from '../../lib/useFormKeyboard';

interface Station {
  StnCode: number;
  StnName: string;
}

export function StsnMaster() {
  const formRef = useRef<HTMLFormElement>(null);
  useFormKeyboard(formRef);
  useFormValidation(formRef);

  const queryClient = useQueryClient();
  const [selectedItem, setSelectedItem] = useState<Station | null>(null);
  const [isEditing, setIsEditing] = useState(false);
  const [formData, setFormData] = useState({ StnName: '' });

  const { data: items, isLoading } = useQuery({
    queryKey: ['stations'],
    queryFn: async () => (await api.get<Station[]>('/masters/stations')).data
  });

  const createMutation = useMutation({
    mutationFn: async (newItem: { StnName: string }) => (await api.post('/masters/stations', newItem)).data,
    onSuccess: () => { queryClient.invalidateQueries({ queryKey: ['stations'] }); resetForm(); }
  });

  const updateMutation = useMutation({
    mutationFn: async (item: Station) => (await api.put(`/masters/stations/${item.StnCode}`, { StnName: item.StnName })).data,
    onSuccess: () => { queryClient.invalidateQueries({ queryKey: ['stations'] }); resetForm(); }
  });

  const deleteMutation = useMutation({
    mutationFn: async (code: number) => await api.delete(`/masters/stations/${code}`),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['stations'] });
      if (selectedItem?.StnCode) resetForm();
    }
  });

  const handleSelect = (item: Station) => { setSelectedItem(item); setFormData({ StnName: item.StnName }); setIsEditing(false); };
  const handleAdd = () => { setSelectedItem(null); setFormData({ StnName: '' }); setIsEditing(true); };
  const handleEdit = () => { if (selectedItem) setIsEditing(true); };
  const handleDelete = (code: number) => { if (confirm('Are you sure you want to delete this station?')) deleteMutation.mutate(code); };
  const resetForm = () => { setIsEditing(false); setSelectedItem(null); setFormData({ StnName: '' }); };

  const handleSave = (e: React.FormEvent) => {
    e.preventDefault();
    if (selectedItem) updateMutation.mutate({ StnCode: selectedItem.StnCode, StnName: formData.StnName });
    else createMutation.mutate({ StnName: formData.StnName });
  };

  const isDetailActive = isEditing || selectedItem !== null;

  const ListComponent = (
    <div className="flex flex-col h-full">
      <div className="p-2 border-b border-gray-100 flex justify-end">
        <button onClick={handleAdd} className="btn-primary text-xs px-3 py-1 flex items-center gap-1"><Plus size={14} /> Add New</button>
      </div>
      <div className="flex-1 overflow-y-auto">
        {isLoading ? <div className="p-4 text-center text-gray-500 text-sm">Loading...</div> : items?.length === 0 ? <div className="p-4 text-center text-gray-500 text-sm">No items found.</div> : (
          <ul className="divide-y divide-gray-100">
            {items?.map((item) => (
              <li key={item.StnCode} className={`p-3 cursor-pointer hover:bg-gray-50 flex justify-between items-center group ${selectedItem?.StnCode === item.StnCode ? 'bg-blue-50 border-l-4 border-medical-mutedblue' : 'border-l-4 border-transparent'}`} onClick={() => handleSelect(item)}>
                <span className="text-sm text-gray-800">{item.StnName}</span>
                <div className="hidden group-hover:flex gap-2">
                  <button onClick={(e) => { e.stopPropagation(); handleSelect(item); handleEdit(); }} className="text-gray-400 hover:text-medical-mutedblue"><Edit2 size={14} /></button>
                  <button onClick={(e) => { e.stopPropagation(); handleDelete(item.StnCode); }} className="text-gray-400 hover:text-red-500"><Trash2 size={14} /></button>
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
        <div className="h-full flex items-center justify-center text-gray-400 text-sm">Select an item from the list or click Add New</div>
      ) : (
        <form ref={formRef} onSubmit={handleSave} className="space-y-6 max-w-lg">
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">Station Name <span className="text-red-500">*</span></label>
            <input type="text" required disabled={!isEditing} value={formData.StnName} onChange={(e) => setFormData({ ...formData, StnName: e.target.value })} className="input-field" placeholder="e.g. ICU Station 1" />
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

  return <SummaryDetailLayout title="Station Master" listComponent={ListComponent} detailComponent={DetailComponent} isDetailActive={isDetailActive} />;
}
