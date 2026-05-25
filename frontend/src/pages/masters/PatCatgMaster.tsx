import { useState } from 'react';
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import { SummaryDetailLayout } from '../../components/layout/SummaryDetailLayout';
import api from '../../lib/api';
import { Plus, Edit2, Trash2, Save, X } from 'lucide-react';

interface PatCatg {
  PcgCode: number;
  PcgName: string;
  PcgInfAllowed: boolean;
  PcgDefAllowed: boolean;
  PcgDiscAllowed: boolean;
  PcgDiscPer: number;
  PcgShowInList: boolean;
}

const defaultFormData = {
  PcgName: '',
  PcgInfAllowed: false,
  PcgDefAllowed: false,
  PcgDiscAllowed: false,
  PcgDiscPer: 0.0,
  PcgShowInList: true,
};

export function PatCatgMaster() {
  const queryClient = useQueryClient();
  const [selectedItem, setSelectedItem] = useState<PatCatg | null>(null);
  const [isEditing, setIsEditing] = useState(false);
  const [formData, setFormData] = useState(defaultFormData);

  const { data: items, isLoading } = useQuery({
    queryKey: ['pat-categories'],
    queryFn: async () => {
      const res = await api.get<PatCatg[]>('/masters/pat-categories');
      return res.data;
    }
  });

  const createMutation = useMutation({
    mutationFn: async (newItem: typeof defaultFormData) => {
      const res = await api.post('/masters/pat-categories', newItem);
      return res.data;
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['pat-categories'] });
      resetForm();
    }
  });

  const updateMutation = useMutation({
    mutationFn: async (item: PatCatg) => {
      const { PcgCode, ...data } = item;
      const res = await api.put(`/masters/pat-categories/${PcgCode}`, data);
      return res.data;
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['pat-categories'] });
      resetForm();
    }
  });

  const deleteMutation = useMutation({
    mutationFn: async (code: number) => {
      await api.delete(`/masters/pat-categories/${code}`);
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['pat-categories'] });
      if (selectedItem?.PcgCode) resetForm();
    }
  });

  const handleSelect = (item: PatCatg) => {
    setSelectedItem(item);
    setFormData({
      PcgName: item.PcgName,
      PcgInfAllowed: item.PcgInfAllowed,
      PcgDefAllowed: item.PcgDefAllowed,
      PcgDiscAllowed: item.PcgDiscAllowed,
      PcgDiscPer: item.PcgDiscPer,
      PcgShowInList: item.PcgShowInList,
    });
    setIsEditing(false);
  };

  const handleAdd = () => {
    setSelectedItem(null);
    setFormData(defaultFormData);
    setIsEditing(true);
  };

  const handleEdit = () => {
    if (selectedItem) setIsEditing(true);
  };

  const handleDelete = (code: number) => {
    if (confirm('Are you sure you want to delete this category?')) {
      deleteMutation.mutate(code);
    }
  };

  const resetForm = () => {
    setIsEditing(false);
    setSelectedItem(null);
    setFormData(defaultFormData);
  };

  const handleSave = (e: React.FormEvent) => {
    e.preventDefault();
    if (selectedItem) {
      updateMutation.mutate({ PcgCode: selectedItem.PcgCode, ...formData });
    } else {
      createMutation.mutate(formData);
    }
  };

  const isDetailActive = isEditing || selectedItem !== null;

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
          <div className="p-4 text-center text-gray-500 text-sm">No items found.</div>
        ) : (
          <ul className="divide-y divide-gray-100">
            {items?.map((item) => (
              <li 
                key={item.PcgCode}
                className={`p-3 cursor-pointer hover:bg-gray-50 flex justify-between items-center group ${selectedItem?.PcgCode === item.PcgCode ? 'bg-blue-50 border-l-4 border-medical-mutedblue' : 'border-l-4 border-transparent'}`}
                onClick={() => handleSelect(item)}
              >
                <div className="flex flex-col">
                  <span className="text-sm font-medium text-gray-800">{item.PcgName}</span>
                  <span className="text-xs text-gray-500">Disc: {item.PcgDiscPer}%</span>
                </div>
                <div className="hidden group-hover:flex gap-2">
                  <button onClick={(e) => { e.stopPropagation(); handleSelect(item); handleEdit(); }} className="text-gray-400 hover:text-medical-mutedblue">
                    <Edit2 size={14} />
                  </button>
                  <button onClick={(e) => { e.stopPropagation(); handleDelete(item.PcgCode); }} className="text-gray-400 hover:text-red-500">
                    <Trash2 size={14} />
                  </button>
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
        <form onSubmit={handleSave} className="space-y-6 max-w-lg">
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">
              Category Name <span className="text-red-500">*</span>
            </label>
            <input
              type="text"
              required
              disabled={!isEditing}
              value={formData.PcgName}
              onChange={(e) => setFormData({ ...formData, PcgName: e.target.value })}
              className="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-medical-mutedblue focus:border-medical-mutedblue sm:text-sm disabled:bg-gray-50 disabled:text-gray-500"
              placeholder="e.g. General"
            />
          </div>

          <div className="grid grid-cols-2 gap-4">
            <label className="flex items-center gap-2 text-sm text-gray-700">
              <input
                type="checkbox"
                disabled={!isEditing}
                checked={formData.PcgInfAllowed}
                onChange={(e) => setFormData({ ...formData, PcgInfAllowed: e.target.checked })}
                className="rounded border-gray-300 text-medical-mutedblue focus:ring-medical-mutedblue"
              />
              Inf Allowed
            </label>
            <label className="flex items-center gap-2 text-sm text-gray-700">
              <input
                type="checkbox"
                disabled={!isEditing}
                checked={formData.PcgDefAllowed}
                onChange={(e) => setFormData({ ...formData, PcgDefAllowed: e.target.checked })}
                className="rounded border-gray-300 text-medical-mutedblue focus:ring-medical-mutedblue"
              />
              Def Allowed
            </label>
            <label className="flex items-center gap-2 text-sm text-gray-700">
              <input
                type="checkbox"
                disabled={!isEditing}
                checked={formData.PcgDiscAllowed}
                onChange={(e) => setFormData({ ...formData, PcgDiscAllowed: e.target.checked })}
                className="rounded border-gray-300 text-medical-mutedblue focus:ring-medical-mutedblue"
              />
              Discount Allowed
            </label>
            <label className="flex items-center gap-2 text-sm text-gray-700">
              <input
                type="checkbox"
                disabled={!isEditing}
                checked={formData.PcgShowInList}
                onChange={(e) => setFormData({ ...formData, PcgShowInList: e.target.checked })}
                className="rounded border-gray-300 text-medical-mutedblue focus:ring-medical-mutedblue"
              />
              Show In List
            </label>
          </div>

          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">
              Discount Percentage (%)
            </label>
            <input
              type="number"
              step="0.01"
              disabled={!isEditing || !formData.PcgDiscAllowed}
              value={formData.PcgDiscPer}
              onChange={(e) => setFormData({ ...formData, PcgDiscPer: parseFloat(e.target.value) || 0 })}
              className="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-medical-mutedblue focus:border-medical-mutedblue sm:text-sm disabled:bg-gray-50 disabled:text-gray-500"
            />
          </div>

          <div className="flex gap-3 pt-4 border-t border-gray-100">
            {isEditing ? (
              <>
                <button type="submit" disabled={createMutation.isPending || updateMutation.isPending} className="btn-success flex items-center gap-2">
                  <Save size={16} /> Save
                </button>
                <button type="button" onClick={resetForm} className="px-4 py-2 border border-gray-300 rounded text-sm text-gray-700 hover:bg-gray-50 flex items-center gap-2">
                  <X size={16} /> Cancel
                </button>
              </>
            ) : (
              <button type="button" onClick={handleEdit} className="btn-primary flex items-center gap-2">
                <Edit2 size={16} /> Edit
              </button>
            )}
          </div>
        </form>
      )}
    </div>
  );

  return (
    <SummaryDetailLayout
      title="Patient Category Master"
      listComponent={ListComponent}
      detailComponent={DetailComponent}
      isDetailActive={isDetailActive}
    />
  );
}
