import { useState } from 'react';
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import api from '../../lib/api';
import { Plus, Pencil, Trash2, Save, X, Search } from 'lucide-react';

function useCRUD(path: string) {
  const qc = useQueryClient();
  const { data = [], isLoading } = useQuery({
    queryKey: [path],
    queryFn: async () => (await api.get<any[]>(`/masters/${path}`)).data
  });
  const createMut = useMutation({
    mutationFn: (body: any) => api.post(`/masters/${path}`, body).then(r => r.data),
    onSuccess: () => qc.invalidateQueries({ queryKey: [path] })
  });
  const updateMut = useMutation({
    mutationFn: ({ id, body }: { id: number; body: any }) =>
      api.put(`/masters/${path}/${id}`, body).then(r => r.data),
    onSuccess: () => qc.invalidateQueries({ queryKey: [path] })
  });
  const deleteMut = useMutation({
    mutationFn: (id: number) => api.delete(`/masters/${path}/${id}`).then(r => r.data),
    onSuccess: () => qc.invalidateQueries({ queryKey: [path] })
  });
  return { data, isLoading, createMut, updateMut, deleteMut };
}

export function PartyMasterPage() {
  const { data, isLoading, createMut, updateMut, deleteMut } = useCRUD('parties');
  const { data: groups } = useQuery({
    queryKey: ['party-groups'],
    queryFn: async () => (await api.get<any[]>('/masters/party-groups')).data
  });
  
  const [search, setSearch] = useState('');
  const [modalOpen, setModalOpen] = useState(false);
  const [editing, setEditing] = useState<any>(null);
  
  const [form, setForm] = useState({
    PrtName: '', PrtPgmCode: 0, PrtTitle: '', PrtAddr: '', PrtTelNo: '', PrtEmail: '', PrtShowInList: true
  });

  const handleOpen = (party: any = null) => {
    setEditing(party);
    if (party) {
      setForm({ ...party });
    } else {
      setForm({ PrtName: '', PrtPgmCode: groups?.[0]?.PgmCode || 0, PrtTitle: '', PrtAddr: '', PrtTelNo: '', PrtEmail: '', PrtShowInList: true });
    }
    setModalOpen(true);
  };

  const handleSave = () => {
    if (!form.PrtName || !form.PrtPgmCode) return;
    if (editing) {
      updateMut.mutate({ id: editing.PrtCode, body: form }, { onSuccess: () => setModalOpen(false) });
    } else {
      createMut.mutate(form, { onSuccess: () => setModalOpen(false) });
    }
  };

  const filtered = data.filter((d: any) => d.PrtName.toLowerCase().includes(search.toLowerCase()));

  return (
    <div>
      <div className="flex items-center justify-between mb-6">
        <div>
          <h2 className="text-xl font-bold text-gray-900">Party Master</h2>
          <p className="text-sm text-gray-500 mt-0.5">Manage external parties, suppliers, and insurance companies</p>
        </div>
        <button onClick={() => handleOpen()} className="btn-primary flex items-center gap-2">
          <Plus size={16} /> Add Party
        </button>
      </div>

      <div className="bg-white rounded-xl shadow-sm border border-medical-border overflow-hidden">
        <div className="p-4 border-b border-medical-border flex items-center gap-2">
          <Search size={16} className="text-gray-400" />
          <input
            type="text"
            placeholder="Search parties..."
            value={search}
            onChange={e => setSearch(e.target.value)}
            className="w-full sm:max-w-xs border-none focus:ring-0 text-sm p-0"
          />
        </div>
        
        {isLoading ? (
          <div className="p-8 text-center text-gray-500">Loading...</div>
        ) : (
          <div className="overflow-x-auto">
            <table className="w-full text-sm text-left">
              <thead className="bg-gray-50/50 text-gray-500">
                <tr>
                  <th className="px-4 py-3 font-medium">Name</th>
                  <th className="px-4 py-3 font-medium">Group</th>
                  <th className="px-4 py-3 font-medium">Contact</th>
                  <th className="px-4 py-3 font-medium text-center w-24">Actions</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-gray-100">
                {filtered.map((item: any) => (
                  <tr key={item.PrtCode} className="hover:bg-gray-50/50 transition-colors">
                    <td className="px-4 py-3 font-medium text-gray-900">
                      {item.PrtTitle ? `${item.PrtTitle}. ` : ''}{item.PrtName}
                    </td>
                    <td className="px-4 py-3 text-gray-600">
                      {groups?.find((g: any) => g.PgmCode === item.PrtPgmCode)?.PgmName || item.PrtPgmCode}
                    </td>
                    <td className="px-4 py-3 text-gray-600">
                      {item.PrtTelNo}
                    </td>
                    <td className="px-4 py-3 text-center">
                      <div className="flex items-center justify-center gap-2">
                        <button onClick={() => handleOpen(item)} className="p-1.5 text-blue-600 hover:bg-blue-50 rounded-lg transition-colors"><Pencil size={14} /></button>
                        <button onClick={() => { if(confirm('Delete this party?')) deleteMut.mutate(item.PrtCode); }} className="p-1.5 text-red-600 hover:bg-red-50 rounded-lg transition-colors"><Trash2 size={14} /></button>
                      </div>
                    </td>
                  </tr>
                ))}
                {filtered.length === 0 && (
                  <tr>
                    <td colSpan={4} className="px-4 py-8 text-center text-gray-500">No parties found</td>
                  </tr>
                )}
              </tbody>
            </table>
          </div>
        )}
      </div>

      {/* Modal */}
      {modalOpen && (
        <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/40 backdrop-blur-sm p-4">
          <div className="bg-white rounded-2xl shadow-xl w-full max-w-lg flex flex-col">
            <div className="flex items-center justify-between px-6 py-4 border-b border-medical-border">
              <h3 className="text-lg font-bold text-gray-900">{editing ? 'Edit Party' : 'Add Party'}</h3>
              <button onClick={() => setModalOpen(false)} className="text-gray-400 hover:bg-gray-100 p-2 rounded-xl transition-colors"><X size={20} /></button>
            </div>
            <div className="p-6 overflow-y-auto space-y-4">
              <div className="grid grid-cols-4 gap-4">
                <div>
                  <label className="block text-xs font-medium text-gray-700 mb-1">Title</label>
                  <input type="text" value={form.PrtTitle} onChange={e => setForm({...form, PrtTitle: e.target.value})} className="input-field" placeholder="M/S" />
                </div>
                <div className="col-span-3">
                  <label className="block text-xs font-medium text-gray-700 mb-1">Party Name *</label>
                  <input type="text" value={form.PrtName} onChange={e => setForm({...form, PrtName: e.target.value})} className="input-field" autoFocus />
                </div>
              </div>
              <div>
                <label className="block text-xs font-medium text-gray-700 mb-1">Party Group *</label>
                <select value={form.PrtPgmCode} onChange={e => setForm({...form, PrtPgmCode: Number(e.target.value)})} className="input-field">
                  <option value={0}>Select Group</option>
                  {groups?.map((g: any) => <option key={g.PgmCode} value={g.PgmCode}>{g.PgmName}</option>)}
                </select>
              </div>
              <div>
                <label className="block text-xs font-medium text-gray-700 mb-1">Address</label>
                <textarea value={form.PrtAddr} onChange={e => setForm({...form, PrtAddr: e.target.value})} className="input-field" rows={2}></textarea>
              </div>
              <div className="grid grid-cols-2 gap-4">
                <div>
                  <label className="block text-xs font-medium text-gray-700 mb-1">Phone</label>
                  <input type="text" value={form.PrtTelNo} onChange={e => setForm({...form, PrtTelNo: e.target.value})} className="input-field" />
                </div>
                <div>
                  <label className="block text-xs font-medium text-gray-700 mb-1">Email</label>
                  <input type="text" value={form.PrtEmail} onChange={e => setForm({...form, PrtEmail: e.target.value})} className="input-field" />
                </div>
              </div>
              <div className="flex items-center gap-2">
                <input type="checkbox" id="pshow" checked={form.PrtShowInList} onChange={e => setForm({...form, PrtShowInList: e.target.checked})} className="rounded text-blue-600 focus:ring-blue-500" />
                <label htmlFor="pshow" className="text-sm text-gray-700">Show in lists</label>
              </div>
            </div>
            <div className="flex gap-3 justify-end px-6 py-4 border-t border-medical-border bg-gray-50 rounded-b-2xl">
              <button onClick={() => setModalOpen(false)} className="btn-secondary px-5">Cancel</button>
              <button onClick={handleSave} disabled={createMut.isPending || updateMut.isPending} className="btn-primary px-6 flex items-center gap-2">
                <Save size={15} /> {editing ? 'Update' : 'Save'}
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}

export function SubItemMasterPage() {
  const { data, isLoading, createMut, updateMut, deleteMut } = useCRUD('subitems');
  const { data: groups } = useQuery({
    queryKey: ['subitem-groups'],
    queryFn: async () => (await api.get<any[]>('/masters/subitem-groups')).data
  });
  
  const [search, setSearch] = useState('');
  const [modalOpen, setModalOpen] = useState(false);
  const [editing, setEditing] = useState<any>(null);
  
  const [form, setForm] = useState({
    SimName: '', SimSigCode: 0, SimPurchRate: 0, SimMRPRate: 0, SimSaleRate: 0
  });

  const handleOpen = (item: any = null) => {
    setEditing(item);
    if (item) {
      setForm({ ...item });
    } else {
      setForm({ SimName: '', SimSigCode: groups?.[0]?.SigCode || 0, SimPurchRate: 0, SimMRPRate: 0, SimSaleRate: 0 });
    }
    setModalOpen(true);
  };

  const handleSave = () => {
    if (!form.SimName || !form.SimSigCode) return;
    if (editing) {
      updateMut.mutate({ id: editing.SimCode, body: form }, { onSuccess: () => setModalOpen(false) });
    } else {
      createMut.mutate(form, { onSuccess: () => setModalOpen(false) });
    }
  };

  const filtered = data.filter((d: any) => d.SimName.toLowerCase().includes(search.toLowerCase()));

  return (
    <div>
      <div className="flex items-center justify-between mb-6">
        <div>
          <h2 className="text-xl font-bold text-gray-900">Sub-Item Master</h2>
          <p className="text-sm text-gray-500 mt-0.5">Manage consumable items, materials, and inventory items</p>
        </div>
        <button onClick={() => handleOpen()} className="btn-primary flex items-center gap-2">
          <Plus size={16} /> Add Item
        </button>
      </div>

      <div className="bg-white rounded-xl shadow-sm border border-medical-border overflow-hidden">
        <div className="p-4 border-b border-medical-border flex items-center gap-2">
          <Search size={16} className="text-gray-400" />
          <input
            type="text"
            placeholder="Search items..."
            value={search}
            onChange={e => setSearch(e.target.value)}
            className="w-full sm:max-w-xs border-none focus:ring-0 text-sm p-0"
          />
        </div>
        
        {isLoading ? (
          <div className="p-8 text-center text-gray-500">Loading...</div>
        ) : (
          <div className="overflow-x-auto">
            <table className="w-full text-sm text-left">
              <thead className="bg-gray-50/50 text-gray-500">
                <tr>
                  <th className="px-4 py-3 font-medium">Item Name</th>
                  <th className="px-4 py-3 font-medium">Group</th>
                  <th className="px-4 py-3 font-medium text-right">Purchase Rate</th>
                  <th className="px-4 py-3 font-medium text-right">Sale Rate</th>
                  <th className="px-4 py-3 font-medium text-center w-24">Actions</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-gray-100">
                {filtered.map((item: any) => (
                  <tr key={item.SimCode} className="hover:bg-gray-50/50 transition-colors">
                    <td className="px-4 py-3 font-medium text-gray-900">{item.SimName}</td>
                    <td className="px-4 py-3 text-gray-600">
                      {groups?.find((g: any) => g.SigCode === item.SimSigCode)?.SigName || item.SimSigCode}
                    </td>
                    <td className="px-4 py-3 text-right text-gray-600">,1{item.SimPurchRate}</td>
                    <td className="px-4 py-3 text-right text-gray-600">,1{item.SimSaleRate}</td>
                    <td className="px-4 py-3 text-center">
                      <div className="flex items-center justify-center gap-2">
                        <button onClick={() => handleOpen(item)} className="p-1.5 text-blue-600 hover:bg-blue-50 rounded-lg transition-colors"><Pencil size={14} /></button>
                        <button onClick={() => { if(confirm('Delete this item?')) deleteMut.mutate(item.SimCode); }} className="p-1.5 text-red-600 hover:bg-red-50 rounded-lg transition-colors"><Trash2 size={14} /></button>
                      </div>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        )}
      </div>

      {/* Modal */}
      {modalOpen && (
        <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/40 backdrop-blur-sm p-4">
          <div className="bg-white rounded-2xl shadow-xl w-full max-w-lg flex flex-col">
            <div className="flex items-center justify-between px-6 py-4 border-b border-medical-border">
              <h3 className="text-lg font-bold text-gray-900">{editing ? 'Edit Item' : 'Add Item'}</h3>
              <button onClick={() => setModalOpen(false)} className="text-gray-400 hover:bg-gray-100 p-2 rounded-xl transition-colors"><X size={20} /></button>
            </div>
            <div className="p-6 space-y-4">
              <div>
                <label className="block text-xs font-medium text-gray-700 mb-1">Item Name *</label>
                <input type="text" value={form.SimName} onChange={e => setForm({...form, SimName: e.target.value})} className="input-field" autoFocus />
              </div>
              <div>
                <label className="block text-xs font-medium text-gray-700 mb-1">Item Group *</label>
                <select value={form.SimSigCode} onChange={e => setForm({...form, SimSigCode: Number(e.target.value)})} className="input-field">
                  <option value={0}>Select Group</option>
                  {groups?.map((g: any) => <option key={g.SigCode} value={g.SigCode}>{g.SigName}</option>)}
                </select>
              </div>
              <div className="grid grid-cols-3 gap-4">
                <div>
                  <label className="block text-xs font-medium text-gray-700 mb-1">Purchase Rate</label>
                  <input type="number" step="0.01" value={form.SimPurchRate} onChange={e => setForm({...form, SimPurchRate: parseFloat(e.target.value) || 0})} className="input-field" />
                </div>
                <div>
                  <label className="block text-xs font-medium text-gray-700 mb-1">MRP</label>
                  <input type="number" step="0.01" value={form.SimMRPRate} onChange={e => setForm({...form, SimMRPRate: parseFloat(e.target.value) || 0})} className="input-field" />
                </div>
                <div>
                  <label className="block text-xs font-medium text-gray-700 mb-1">Sale Rate</label>
                  <input type="number" step="0.01" value={form.SimSaleRate} onChange={e => setForm({...form, SimSaleRate: parseFloat(e.target.value) || 0})} className="input-field" />
                </div>
              </div>
            </div>
            <div className="flex gap-3 justify-end px-6 py-4 border-t border-medical-border bg-gray-50 rounded-b-2xl">
              <button onClick={() => setModalOpen(false)} className="btn-secondary px-5">Cancel</button>
              <button onClick={handleSave} disabled={createMut.isPending || updateMut.isPending} className="btn-primary px-6 flex items-center gap-2">
                <Save size={15} /> {editing ? 'Update' : 'Save'}
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}

