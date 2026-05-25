import { useState } from 'react';
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import { SummaryDetailLayout } from '../../components/layout/SummaryDetailLayout';
import api from '../../lib/api';
import { Plus, Edit2, Trash2, Save, X } from 'lucide-react';

interface ServiceGroup {
  SgpCode: number;
  SgpName: string;
  SgpIndex: number;
  SgpExpanded: boolean;
  SgpEditable: boolean;
  SgpInfAllowed: boolean;
  SgpDefAllowed: boolean;
  SgpDiscAllowed: boolean;
  SgpDiscPer: number;
  SgpExtRateSys: boolean;
  SgpDctwseRateSys: boolean;
  SgpPcgwseRateSys: boolean;
  SgpRBywseRateSys: boolean;
  SgpRTowseRateSys: boolean;
  SgpTimewseRateSys: boolean;
  SgpExtDiscSys: boolean;
  SgpDctwseDiscSys: boolean;
  SgpPcgwseDiscSys: boolean;
  SgpExtBargSys: boolean;
  SgpExtShareSys: boolean;
  SgpDctwseShareSys: boolean;
  SgpShowInList: boolean;
}

const defaultFormData: Omit<ServiceGroup, 'SgpCode'> = {
  SgpName: '', SgpIndex: 0, SgpExpanded: false, SgpEditable: false, SgpInfAllowed: false,
  SgpDefAllowed: false, SgpDiscAllowed: false, SgpDiscPer: 0, SgpExtRateSys: false,
  SgpDctwseRateSys: false, SgpPcgwseRateSys: false, SgpRBywseRateSys: false,
  SgpRTowseRateSys: false, SgpTimewseRateSys: false, SgpExtDiscSys: false,
  SgpDctwseDiscSys: false, SgpPcgwseDiscSys: false, SgpExtBargSys: false,
  SgpExtShareSys: false, SgpDctwseShareSys: false, SgpShowInList: true
};

export function ServGrpMaster() {
  const queryClient = useQueryClient();
  const [selectedItem, setSelectedItem] = useState<ServiceGroup | null>(null);
  const [isEditing, setIsEditing] = useState(false);
  const [formData, setFormData] = useState(defaultFormData);

  const { data: items, isLoading } = useQuery({ queryKey: ['service-groups'], queryFn: async () => (await api.get<ServiceGroup[]>('/masters/service-groups')).data });

  const createMutation = useMutation({
    mutationFn: async (newItem: typeof defaultFormData) => (await api.post('/masters/service-groups', newItem)).data,
    onSuccess: () => { queryClient.invalidateQueries({ queryKey: ['service-groups'] }); resetForm(); }
  });

  const updateMutation = useMutation({
    mutationFn: async (item: ServiceGroup) => {
      const { SgpCode, ...data } = item;
      return (await api.put(`/masters/service-groups/${SgpCode}`, data)).data;
    },
    onSuccess: () => { queryClient.invalidateQueries({ queryKey: ['service-groups'] }); resetForm(); }
  });

  const deleteMutation = useMutation({
    mutationFn: async (code: number) => await api.delete(`/masters/service-groups/${code}`),
    onSuccess: () => { queryClient.invalidateQueries({ queryKey: ['service-groups'] }); if (selectedItem?.SgpCode) resetForm(); }
  });

  const handleSelect = (item: ServiceGroup) => { setSelectedItem(item); setFormData(item); setIsEditing(false); };
  const handleAdd = () => { setSelectedItem(null); setFormData(defaultFormData); setIsEditing(true); };
  const handleEdit = () => { if (selectedItem) setIsEditing(true); };
  const handleDelete = (code: number) => { if (confirm('Delete this service group?')) deleteMutation.mutate(code); };
  const resetForm = () => { setIsEditing(false); setSelectedItem(null); setFormData(defaultFormData); };

  const handleSave = (e: React.FormEvent) => {
    e.preventDefault();
    if (selectedItem) updateMutation.mutate({ SgpCode: selectedItem.SgpCode, ...formData });
    else createMutation.mutate(formData);
  };

  const isDetailActive = isEditing || selectedItem !== null;

  const renderCheckbox = (key: keyof typeof formData, label: string) => (
    <label className="flex items-center gap-2 text-sm text-gray-700">
      <input type="checkbox" disabled={!isEditing} checked={formData[key] as boolean} onChange={(e) => setFormData({ ...formData, [key]: e.target.checked })} className="rounded border-gray-300 text-medical-mutedblue focus:ring-medical-mutedblue" />
      {label}
    </label>
  );

  const ListComponent = (
    <div className="flex flex-col h-full">
      <div className="p-2 border-b border-gray-100 flex justify-end">
        <button onClick={handleAdd} className="btn-primary text-xs px-3 py-1 flex items-center gap-1"><Plus size={14} /> Add New</button>
      </div>
      <div className="flex-1 overflow-y-auto">
        {isLoading ? <div className="p-4 text-center text-gray-500 text-sm">Loading...</div> : items?.length === 0 ? <div className="p-4 text-center text-gray-500 text-sm">No items found.</div> : (
          <ul className="divide-y divide-gray-100">
            {items?.map((item) => (
              <li key={item.SgpCode} className={`p-3 cursor-pointer hover:bg-gray-50 flex justify-between items-center group ${selectedItem?.SgpCode === item.SgpCode ? 'bg-blue-50 border-l-4 border-medical-mutedblue' : 'border-l-4 border-transparent'}`} onClick={() => handleSelect(item)}>
                <span className="text-sm font-medium text-gray-800">{item.SgpName}</span>
                <div className="hidden group-hover:flex gap-2">
                  <button onClick={(e) => { e.stopPropagation(); handleSelect(item); handleEdit(); }} className="text-gray-400 hover:text-medical-mutedblue"><Edit2 size={14} /></button>
                  <button onClick={(e) => { e.stopPropagation(); handleDelete(item.SgpCode); }} className="text-gray-400 hover:text-red-500"><Trash2 size={14} /></button>
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
        <form onSubmit={handleSave} className="space-y-6 max-w-4xl">
          <div className="grid grid-cols-2 gap-4">
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Group Name <span className="text-red-500">*</span></label>
              <input type="text" required disabled={!isEditing} value={formData.SgpName} onChange={(e) => setFormData({ ...formData, SgpName: e.target.value })} className="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-medical-mutedblue focus:border-medical-mutedblue sm:text-sm disabled:bg-gray-50" placeholder="e.g. Laboratory" />
            </div>
            <div>
               <label className="block text-sm font-medium text-gray-700 mb-1">Discount %</label>
               <input type="number" step="0.01" disabled={!isEditing || !formData.SgpDiscAllowed} value={formData.SgpDiscPer} onChange={(e) => setFormData({ ...formData, SgpDiscPer: parseFloat(e.target.value) || 0 })} className="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-medical-mutedblue focus:border-medical-mutedblue sm:text-sm disabled:bg-gray-50" />
            </div>
          </div>

          <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
            <div className="bg-gray-50 p-4 rounded-md border border-gray-100 space-y-2">
              <h4 className="text-xs font-semibold text-gray-500 uppercase tracking-wider mb-2">General</h4>
              {renderCheckbox('SgpShowInList', 'Show in List')}
              {renderCheckbox('SgpExpanded', 'Expanded Default')}
              {renderCheckbox('SgpEditable', 'Rate Editable')}
              {renderCheckbox('SgpInfAllowed', 'Inflation Allowed')}
              {renderCheckbox('SgpDefAllowed', 'Deflation Allowed')}
              {renderCheckbox('SgpDiscAllowed', 'Discount Allowed')}
            </div>

            <div className="bg-gray-50 p-4 rounded-md border border-gray-100 space-y-2">
              <h4 className="text-xs font-semibold text-gray-500 uppercase tracking-wider mb-2">Rate Systems</h4>
              {renderCheckbox('SgpExtRateSys', 'External Rate')}
              {renderCheckbox('SgpDctwseRateSys', 'Doctor-wise Rate')}
              {renderCheckbox('SgpPcgwseRateSys', 'Patient Category Rate')}
              {renderCheckbox('SgpRBywseRateSys', 'Refer-By Rate')}
              {renderCheckbox('SgpRTowseRateSys', 'Refer-To Rate')}
              {renderCheckbox('SgpTimewseRateSys', 'Time-wise Rate')}
            </div>

            <div className="bg-gray-50 p-4 rounded-md border border-gray-100 space-y-2">
              <h4 className="text-xs font-semibold text-gray-500 uppercase tracking-wider mb-2">Share & Disc Systems</h4>
              {renderCheckbox('SgpExtDiscSys', 'External Discount')}
              {renderCheckbox('SgpDctwseDiscSys', 'Doctor-wise Discount')}
              {renderCheckbox('SgpPcgwseDiscSys', 'Pat-Catg Discount')}
              {renderCheckbox('SgpExtBargSys', 'External Bargain')}
              {renderCheckbox('SgpExtShareSys', 'External Share')}
              {renderCheckbox('SgpDctwseShareSys', 'Doctor-wise Share')}
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

  return <SummaryDetailLayout title="Service Group Master" listComponent={ListComponent} detailComponent={DetailComponent} isDetailActive={isDetailActive} />;
}
