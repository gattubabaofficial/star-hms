import { useState, useRef } from 'react';
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import { SummaryDetailLayout } from '../../components/layout/SummaryDetailLayout';
import api from '../../lib/api';
import { Plus, Edit2, Trash2, Save, X } from 'lucide-react';
import { useFormValidation } from '../../lib/useFormValidation';
import { useFormKeyboard } from '../../lib/useFormKeyboard';

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

export default function PatCatgMaster() {
  const formRef = useRef<HTMLFormElement>(null);
  useFormKeyboard(formRef);
  useFormValidation(formRef);

  const queryClient = useQueryClient();
  const [selectedItem, setSelectedItem] = useState<PatCatg | null>(null);
  const [isEditing, setIsEditing] = useState(false);
  const [formData, setFormData] = useState(defaultFormData);

  // Queries
  const { data: items, isLoading } = useQuery({
    queryKey: ['pat-categories'],
    queryFn: async () => (await api.get<PatCatg[]>('/masters/pat-categories')).data
  });

  // Mutations
  const createMutation = useMutation({
    mutationFn: async (newItem: typeof defaultFormData) => 
      (await api.post('/masters/pat-categories', newItem)).data,
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['pat-categories'] });
      resetForm();
    }
  });

  const updateMutation = useMutation({
    mutationFn: async (item: PatCatg) => {
      const { PcgCode, ...data } = item;
      return (await api.put(`/masters/pat-categories/${PcgCode}`, data)).data;
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['pat-categories'] });
      resetForm();
    }
  });

  const deleteMutation = useMutation({
    mutationFn: async (code: number) => 
      await api.delete(`/masters/pat-categories/${code}`),
    onSuccess: (_, code) => {
      queryClient.invalidateQueries({ queryKey: ['pat-categories'] });
      if (selectedItem?.PcgCode === code) resetForm();
    }
  });

  // Handlers
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

  const renderCheckbox = (key: keyof typeof defaultFormData, label: string) => (
    <label className="flex items-center gap-2 text-sm text-gray-700 select-none">
      <input
        type="checkbox"
        disabled={!isEditing}
        checked={formData[key] as boolean}
        onChange={(e) => setFormData({ ...formData, [key]: e.target.checked })}
        className="rounded border-gray-300 text-medical-mutedblue focus:ring-medical-mutedblue h-4 w-4"
      />
      {label}
    </label>
  );

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
          <div className="p-4 text-center text-gray-500 text-sm">No categories found.</div>
        ) : (
          <ul className="divide-y divide-gray-100">
            {items?.map((item) => (
              <li
                key={item.PcgCode}
                className={`p-3 cursor-pointer hover:bg-gray-50 flex justify-between items-center group ${
                  selectedItem?.PcgCode === item.PcgCode ? 'bg-blue-50 border-l-4 border-medical-mutedblue' : 'border-l-4 border-transparent'
                }`}
                onClick={() => handleSelect(item)}
              >
                <div className="flex flex-col">
                  <span className="text-sm font-medium text-gray-800">{item.PcgName}</span>
                  <span className="text-xs text-gray-500">
                    {item.PcgDiscAllowed ? `Discount: ${item.PcgDiscPer}%` : 'No Discount'}
                  </span>
                </div>
                <div className="hidden group-hover:flex gap-2">
                  <button
                    onClick={(e) => {
                      e.stopPropagation();
                      handleSelect(item);
                      handleEdit();
                    }}
                    className="text-gray-400 hover:text-medical-mutedblue"
                  >
                    <Edit2 size={14} />
                  </button>
                  <button
                    onClick={(e) => {
                      e.stopPropagation();
                      handleDelete(item.PcgCode);
                    }}
                    className="text-gray-400 hover:text-red-500"
                  >
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
      {!isEditing && !selectedItem ? (
        <div className="h-full flex items-center justify-center text-gray-400 text-sm mt-20">
          Select an item from the list or click Add New
        </div>
      ) : (
        <form ref={formRef} onSubmit={handleSave} className="space-y-6 max-w-2xl">
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
              className="input-field"
              placeholder="e.g. Senior Citizen, Staff"
            />
          </div>

          <div className="bg-gray-50 p-4 rounded-md border border-gray-100 space-y-3">
            <h4 className="text-xs font-semibold text-gray-500 uppercase tracking-wider mb-2">Category Rules & Flags</h4>
            <div className="grid grid-cols-2 gap-4">
              {renderCheckbox('PcgShowInList', 'Show in List')}
              {renderCheckbox('PcgDiscAllowed', 'Discount Allowed')}
              {renderCheckbox('PcgInfAllowed', 'Influenza Allowed')}
              {renderCheckbox('PcgDefAllowed', 'Default Allowed')}
            </div>
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
              onChange={(e) =>
                setFormData({ ...formData, PcgDiscPer: parseFloat(e.target.value) || 0.0 })
              }
              className="input-field"
              placeholder="e.g. 10.00"
            />
          </div>

          <div className="flex gap-3 pt-4 border-t border-gray-100">
            {isEditing ? (
              <>
                <button
                  type="submit"
                  disabled={createMutation.isPending || updateMutation.isPending}
                  className="btn-success flex items-center gap-2"
                >
                  <Save size={16} /> Save
                </button>
                <button
                  type="button"
                  onClick={resetForm}
                  className="px-4 py-2 border border-gray-300 rounded text-sm text-gray-700 hover:bg-gray-50 flex items-center gap-2"
                >
                  <X size={16} /> Cancel
                </button>
              </>
            ) : (
              <button
                type="button"
                onClick={handleEdit}
                className="btn-primary flex items-center gap-2"
              >
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
