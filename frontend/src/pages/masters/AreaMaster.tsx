import { useState } from 'react';
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import { SummaryDetailLayout } from '../../components/layout/SummaryDetailLayout';
import api from '../../lib/api';
import { Plus, Edit2, Trash2, Save, X } from 'lucide-react';

interface Area {
  AraCode: number;
  AraName: string;
  AraRecState: number;
}

export function AreaMaster() {
  const queryClient = useQueryClient();
  const [selectedArea, setSelectedArea] = useState<Area | null>(null);
  const [isEditing, setIsEditing] = useState(false);
  const [formData, setFormData] = useState({ AraName: '' });

  // Fetch
  const { data: areas, isLoading } = useQuery({
    queryKey: ['areas'],
    queryFn: async () => {
      const res = await api.get<Area[]>('/masters/areas');
      return res.data;
    }
  });

  // Create
  const createMutation = useMutation({
    mutationFn: async (newArea: { AraName: string }) => {
      const res = await api.post('/masters/areas', newArea);
      return res.data;
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['areas'] });
      resetForm();
    }
  });

  // Update
  const updateMutation = useMutation({
    mutationFn: async (area: { AraCode: number; AraName: string }) => {
      const res = await api.put(`/masters/areas/${area.AraCode}`, { AraName: area.AraName });
      return res.data;
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['areas'] });
      resetForm();
    }
  });

  // Delete
  const deleteMutation = useMutation({
    mutationFn: async (araCode: number) => {
      await api.delete(`/masters/areas/${araCode}`);
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['areas'] });
      if (selectedArea?.AraCode) resetForm();
    }
  });

  const handleSelect = (area: Area) => {
    setSelectedArea(area);
    setFormData({ AraName: area.AraName });
    setIsEditing(false);
  };

  const handleAdd = () => {
    setSelectedArea(null);
    setFormData({ AraName: '' });
    setIsEditing(true);
  };

  const handleEdit = () => {
    if (selectedArea) setIsEditing(true);
  };

  const handleDelete = (araCode: number) => {
    if (confirm('Are you sure you want to delete this area?')) {
      deleteMutation.mutate(araCode);
    }
  };

  const resetForm = () => {
    setIsEditing(false);
    setSelectedArea(null);
    setFormData({ AraName: '' });
  };

  const handleSave = (e: React.FormEvent) => {
    e.preventDefault();
    if (selectedArea) {
      updateMutation.mutate({ AraCode: selectedArea.AraCode, AraName: formData.AraName });
    } else {
      createMutation.mutate({ AraName: formData.AraName });
    }
  };

  const isDetailActive = isEditing || selectedArea !== null;

  const ListComponent = (
    <div className="flex flex-col h-full">
      <div className="p-2 border-b border-gray-100 flex justify-end">
        <button onClick={handleAdd} className="btn-primary text-xs px-3 py-1 flex items-center gap-1">
          <Plus size={14} /> Add New
        </button>
      </div>
      <div className="flex-1 overflow-y-auto">
        {isLoading ? (
          <div className="p-4 text-center text-gray-500 text-sm">Loading areas...</div>
        ) : areas?.length === 0 ? (
          <div className="p-4 text-center text-gray-500 text-sm">No areas found.</div>
        ) : (
          <ul className="divide-y divide-gray-100">
            {areas?.map((area) => (
              <li 
                key={area.AraCode}
                className={`p-3 cursor-pointer hover:bg-gray-50 flex justify-between items-center group ${selectedArea?.AraCode === area.AraCode ? 'bg-blue-50 border-l-4 border-medical-mutedblue' : 'border-l-4 border-transparent'}`}
                onClick={() => handleSelect(area)}
              >
                <span className="text-sm text-gray-800">{area.AraName}</span>
                <div className="hidden group-hover:flex gap-2">
                  <button onClick={(e) => { e.stopPropagation(); handleSelect(area); handleEdit(); }} className="text-gray-400 hover:text-medical-mutedblue">
                    <Edit2 size={14} />
                  </button>
                  <button onClick={(e) => { e.stopPropagation(); handleDelete(area.AraCode); }} className="text-gray-400 hover:text-red-500">
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
      {(!isEditing && !selectedArea) ? (
        <div className="h-full flex items-center justify-center text-gray-400 text-sm">
          Select an area from the list or click Add New
        </div>
      ) : (
        <form onSubmit={handleSave} className="space-y-6 max-w-lg">
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">
              Area Name <span className="text-red-500">*</span>
            </label>
            <input
              type="text"
              required
              disabled={!isEditing}
              value={formData.AraName}
              onChange={(e) => setFormData({ ...formData, AraName: e.target.value })}
              className="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-medical-mutedblue focus:border-medical-mutedblue sm:text-sm disabled:bg-gray-50 disabled:text-gray-500"
              placeholder="e.g. North Metropolis"
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
      title="Area Master"
      listComponent={ListComponent}
      detailComponent={DetailComponent}
      isDetailActive={isDetailActive}
    />
  );
}
