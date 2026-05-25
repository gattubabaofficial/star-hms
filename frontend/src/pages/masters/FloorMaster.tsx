import { useState } from 'react';
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import { SummaryDetailLayout } from '../../components/layout/SummaryDetailLayout';
import api from '../../lib/api';
import { Plus, Edit2, Trash2, Save, X } from 'lucide-react';

interface Floor {
  FlrCode: number;
  FlrName: string;
  FlrShowInList: boolean;
}

export function FloorMaster() {
  const queryClient = useQueryClient();
  const [selectedItem, setSelectedItem] = useState<Floor | null>(null);
  const [isEditing, setIsEditing] = useState(false);
  const [formData, setFormData] = useState({ FlrName: '', FlrShowInList: true });

  const { data: items, isLoading } = useQuery({
    queryKey: ['floors'],
    queryFn: async () => (await api.get<Floor[]>('/masters/floors')).data
  });

  const createMutation = useMutation({
    mutationFn: async (newItem: { FlrName: string, FlrShowInList: boolean }) => (await api.post('/masters/floors', newItem)).data,
    onSuccess: () => { queryClient.invalidateQueries({ queryKey: ['floors'] }); resetForm(); }
  });

  const updateMutation = useMutation({
    mutationFn: async (item: Floor) => (await api.put(`/masters/floors/${item.FlrCode}`, { FlrName: item.FlrName, FlrShowInList: item.FlrShowInList })).data,
    onSuccess: () => { queryClient.invalidateQueries({ queryKey: ['floors'] }); resetForm(); }
  });

  const deleteMutation = useMutation({
    mutationFn: async (code: number) => await api.delete(`/masters/floors/${code}`),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['floors'] });
      if (selectedItem?.FlrCode) resetForm();
    }
  });

  const handleSelect = (item: Floor) => { setSelectedItem(item); setFormData({ FlrName: item.FlrName, FlrShowInList: item.FlrShowInList }); setIsEditing(false); };
  const handleAdd = () => { setSelectedItem(null); setFormData({ FlrName: '', FlrShowInList: true }); setIsEditing(true); };
  const handleEdit = () => { if (selectedItem) setIsEditing(true); };
  const handleDelete = (code: number) => { if (confirm('Are you sure you want to delete this floor?')) deleteMutation.mutate(code); };
  const resetForm = () => { setIsEditing(false); setSelectedItem(null); setFormData({ FlrName: '', FlrShowInList: true }); };

  const handleSave = (e: React.FormEvent) => {
    e.preventDefault();
    if (selectedItem) updateMutation.mutate({ FlrCode: selectedItem.FlrCode, ...formData });
    else createMutation.mutate(formData);
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
              <li key={item.FlrCode} className={`p-3 cursor-pointer hover:bg-gray-50 flex justify-between items-center group ${selectedItem?.FlrCode === item.FlrCode ? 'bg-blue-50 border-l-4 border-medical-mutedblue' : 'border-l-4 border-transparent'}`} onClick={() => handleSelect(item)}>
                <span className="text-sm text-gray-800">{item.FlrName}</span>
                <div className="hidden group-hover:flex gap-2">
                  <button onClick={(e) => { e.stopPropagation(); handleSelect(item); handleEdit(); }} className="text-gray-400 hover:text-medical-mutedblue"><Edit2 size={14} /></button>
                  <button onClick={(e) => { e.stopPropagation(); handleDelete(item.FlrCode); }} className="text-gray-400 hover:text-red-500"><Trash2 size={14} /></button>
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
        <form onSubmit={handleSave} className="space-y-6 max-w-lg">
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">Floor Name <span className="text-red-500">*</span></label>
            <input type="text" required disabled={!isEditing} value={formData.FlrName} onChange={(e) => setFormData({ ...formData, FlrName: e.target.value })} className="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-medical-mutedblue focus:border-medical-mutedblue sm:text-sm disabled:bg-gray-50" placeholder="e.g. First Floor" />
          </div>
          <div>
             <label className="flex items-center gap-2 text-sm text-gray-700">
              <input type="checkbox" disabled={!isEditing} checked={formData.FlrShowInList} onChange={(e) => setFormData({ ...formData, FlrShowInList: e.target.checked })} className="rounded border-gray-300 text-medical-mutedblue focus:ring-medical-mutedblue" />
              Show In List
            </label>
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

  return <SummaryDetailLayout title="Floor Master" listComponent={ListComponent} detailComponent={DetailComponent} isDetailActive={isDetailActive} />;
}
