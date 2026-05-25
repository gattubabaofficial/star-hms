import { useState } from 'react';
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import { SummaryDetailLayout } from '../../components/layout/SummaryDetailLayout';
import api from '../../lib/api';
import { Plus, Edit2, Trash2, Save, X } from 'lucide-react';
import { SearchableSelectWithCreate } from '../../components/ui/SearchableSelectWithCreate';

interface Patient {
  PttCode: number;
  PttName: string;
  PttSex: string | null;
  PttDob: string | null;
  PttPcgCode: number | null;
  PttAraCode: number | null;
  PttAddr: string | null;
  PttTelNo: string | null;
  PttSMSNo: string | null;
  PttEmail: string | null;
  PttRefName: string | null;
  PttRefRela: string | null;
}

const defaultFormData = {
  PttName: '',
  PttSex: 'Male',
  PttDob: '',
  PttPcgCode: null as number | null,
  PttAraCode: null as number | null,
  PttAddr: '',
  PttTelNo: '',
  PttSMSNo: '',
  PttEmail: '',
  PttRefName: '',
  PttRefRela: '',
};

export function PatMaster() {
  const queryClient = useQueryClient();
  const [selectedItem, setSelectedItem] = useState<Patient | null>(null);
  const [isEditing, setIsEditing] = useState(false);
  const [formData, setFormData] = useState(defaultFormData);

  // Queries
  const { data: items, isLoading } = useQuery({ queryKey: ['patients'], queryFn: async () => (await api.get<Patient[]>('/masters/patients')).data });
  const { data: categories } = useQuery({ queryKey: ['pat-categories'], queryFn: async () => (await api.get<{PcgCode: number, PcgName: string}[]>('/masters/pat-categories')).data });
  const { data: areas } = useQuery({ queryKey: ['areas'], queryFn: async () => (await api.get<{AraCode: number, AraName: string}[]>('/masters/areas')).data });

  // Mutations
  const createMutation = useMutation({
    mutationFn: async (newItem: typeof defaultFormData) => (await api.post('/masters/patients', newItem)).data,
    onSuccess: () => { queryClient.invalidateQueries({ queryKey: ['patients'] }); resetForm(); }
  });

  const updateMutation = useMutation({
    mutationFn: async (item: Patient) => {
      const { PttCode, ...data } = item;
      return (await api.put(`/masters/patients/${PttCode}`, data)).data;
    },
    onSuccess: () => { queryClient.invalidateQueries({ queryKey: ['patients'] }); resetForm(); }
  });

  const deleteMutation = useMutation({
    mutationFn: async (code: number) => await api.delete(`/masters/patients/${code}`),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['patients'] });
      if (selectedItem?.PttCode) resetForm();
    }
  });

  // Handlers
  const handleSelect = (item: Patient) => {
    setSelectedItem(item);
    setFormData({
      PttName: item.PttName,
      PttSex: item.PttSex || 'Male',
      PttDob: item.PttDob ? String(item.PttDob) : '',
      PttPcgCode: item.PttPcgCode,
      PttAraCode: item.PttAraCode,
      PttAddr: item.PttAddr || '',
      PttTelNo: item.PttTelNo || '',
      PttSMSNo: item.PttSMSNo || '',
      PttEmail: item.PttEmail || '',
      PttRefName: item.PttRefName || '',
      PttRefRela: item.PttRefRela || '',
    });
    setIsEditing(false);
  };

  const handleAdd = () => { setSelectedItem(null); setFormData(defaultFormData); setIsEditing(true); };
  const handleEdit = () => { if (selectedItem) setIsEditing(true); };
  const handleDelete = (code: number) => { if (confirm('Are you sure you want to delete this patient?')) deleteMutation.mutate(code); };
  const resetForm = () => { setIsEditing(false); setSelectedItem(null); setFormData(defaultFormData); };

  const handleSave = (e: React.FormEvent) => {
    e.preventDefault();
    const payload = {
      ...formData,
      PttDob: formData.PttDob ? formData.PttDob : null
    };

    if (selectedItem) updateMutation.mutate({ PttCode: selectedItem.PttCode, ...payload });
    else createMutation.mutate(payload);
  };

  const isDetailActive = isEditing || selectedItem !== null;

  // Options for Dropdowns
  const catgOptions = categories?.map(c => ({ value: c.PcgCode, label: c.PcgName })) || [];
  const areaOptions = areas?.map(a => ({ value: a.AraCode, label: a.AraName })) || [];

  const handleCreateCategory = async (name: string) => {
    const res = await api.post('/masters/pat-categories', { PcgName: name });
    queryClient.invalidateQueries({ queryKey: ['pat-categories'] });
    setFormData({ ...formData, PttPcgCode: res.data.PcgCode });
  };

  const handleCreateArea = async (name: string) => {
    const res = await api.post('/masters/areas', { AraName: name });
    queryClient.invalidateQueries({ queryKey: ['areas'] });
    setFormData({ ...formData, PttAraCode: res.data.AraCode });
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
          <div className="p-4 text-center text-gray-500 text-sm">No patients found.</div>
        ) : (
          <ul className="divide-y divide-gray-100">
            {items?.map((item) => (
              <li 
                key={item.PttCode}
                className={`p-3 cursor-pointer hover:bg-gray-50 flex justify-between items-center group ${selectedItem?.PttCode === item.PttCode ? 'bg-blue-50 border-l-4 border-medical-mutedblue' : 'border-l-4 border-transparent'}`}
                onClick={() => handleSelect(item)}
              >
                <div className="flex flex-col">
                  <span className="text-sm font-medium text-gray-800">{item.PttName}</span>
                  <span className="text-xs text-gray-500">{item.PttTelNo}</span>
                </div>
                <div className="hidden group-hover:flex gap-2">
                  <button onClick={(e) => { e.stopPropagation(); handleSelect(item); handleEdit(); }} className="text-gray-400 hover:text-medical-mutedblue"><Edit2 size={14} /></button>
                  <button onClick={(e) => { e.stopPropagation(); handleDelete(item.PttCode); }} className="text-gray-400 hover:text-red-500"><Trash2 size={14} /></button>
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
            <label className="block text-sm font-medium text-gray-700 mb-1">Patient Name <span className="text-red-500">*</span></label>
            <input type="text" required disabled={!isEditing} value={formData.PttName} onChange={(e) => setFormData({ ...formData, PttName: e.target.value })} className="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-medical-mutedblue focus:border-medical-mutedblue sm:text-sm disabled:bg-gray-50" placeholder="e.g. John Doe" />
          </div>

          <div className="grid grid-cols-2 gap-4">
             <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Gender</label>
              <select disabled={!isEditing} value={formData.PttSex || 'Male'} onChange={(e) => setFormData({ ...formData, PttSex: e.target.value })} className="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-medical-mutedblue focus:border-medical-mutedblue sm:text-sm disabled:bg-gray-50">
                <option value="Male">Male</option>
                <option value="Female">Female</option>
                <option value="Other">Other</option>
              </select>
            </div>
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Date of Birth</label>
              <input type="date" disabled={!isEditing} value={formData.PttDob} onChange={(e) => setFormData({ ...formData, PttDob: e.target.value })} className="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-medical-mutedblue focus:border-medical-mutedblue sm:text-sm disabled:bg-gray-50" />
            </div>
          </div>

          <div className="grid grid-cols-2 gap-4">
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Category</label>
              <SearchableSelectWithCreate
                options={catgOptions}
                value={formData.PttPcgCode}
                onChange={(val) => setFormData({ ...formData, PttPcgCode: val as number })}
                onCreateNew={handleCreateCategory}
                placeholder="Select Category"
                disabled={!isEditing}
              />
            </div>
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Area</label>
              <SearchableSelectWithCreate
                options={areaOptions}
                value={formData.PttAraCode}
                onChange={(val) => setFormData({ ...formData, PttAraCode: val as number })}
                onCreateNew={handleCreateArea}
                placeholder="Select Area"
                disabled={!isEditing}
              />
            </div>
          </div>

          <div>
             <label className="block text-sm font-medium text-gray-700 mb-1">Address</label>
             <input type="text" disabled={!isEditing} value={formData.PttAddr || ''} onChange={(e) => setFormData({ ...formData, PttAddr: e.target.value })} className="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-medical-mutedblue focus:border-medical-mutedblue sm:text-sm disabled:bg-gray-50" />
          </div>

          <div className="grid grid-cols-3 gap-4">
             <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Contact No.</label>
              <input type="text" disabled={!isEditing} value={formData.PttTelNo || ''} onChange={(e) => setFormData({ ...formData, PttTelNo: e.target.value })} className="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-medical-mutedblue focus:border-medical-mutedblue sm:text-sm disabled:bg-gray-50" />
            </div>
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">SMS No.</label>
              <input type="text" disabled={!isEditing} value={formData.PttSMSNo || ''} onChange={(e) => setFormData({ ...formData, PttSMSNo: e.target.value })} className="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-medical-mutedblue focus:border-medical-mutedblue sm:text-sm disabled:bg-gray-50" />
            </div>
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Email</label>
              <input type="email" disabled={!isEditing} value={formData.PttEmail || ''} onChange={(e) => setFormData({ ...formData, PttEmail: e.target.value })} className="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-medical-mutedblue focus:border-medical-mutedblue sm:text-sm disabled:bg-gray-50" />
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

  return <SummaryDetailLayout title="Patient Master" listComponent={ListComponent} detailComponent={DetailComponent} isDetailActive={isDetailActive} />;
}
