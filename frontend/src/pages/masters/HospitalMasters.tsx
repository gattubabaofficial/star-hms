import { useState, useEffect } from 'react';
import { NavLink, Routes, Route, Navigate, useNavigate, useLocation } from 'react-router-dom';
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import api from '../../lib/api';
import {
  MapPin, User, Stethoscope, Tag, Building2, Bed, FlaskConical,
  Plus, Pencil, Trash2, X, Search, UserCheck, ChevronRight, Save, Settings
} from 'lucide-react';

// ─────────────────────────────────────────────────────────
// Shared helpers
// ─────────────────────────────────────────────────────────

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

function SectionHeader({ title, subtitle }: { title: string; subtitle?: string }) {
  return (
    <div className="mb-6">
      <h2 className="text-xl font-bold text-gray-900">{title}</h2>
      {subtitle && <p className="text-sm text-gray-500 mt-0.5">{subtitle}</p>}
    </div>
  );
}

// ─────────────────────────────────────────────────────────
// Generic single-field (name-only) masters
// ─────────────────────────────────────────────────────────

function SimpleListPage({
  title, subtitle, path, pk, nameField, showInListKey
}: {
  title: string; subtitle: string; path: string; pk: string; nameField: string; showInListKey?: string;
}) {
  const { data, isLoading, createMut, updateMut, deleteMut } = useCRUD(path);
  const [search, setSearch] = useState('');
  const [modalOpen, setModalOpen] = useState(false);
  const [editing, setEditing] = useState<any>(null);
  const [formName, setFormName] = useState('');
  const [formShow, setFormShow] = useState(true);

  const filtered = (data as any[]).filter((r: any) =>
    (r[nameField] || '').toLowerCase().includes(search.toLowerCase())
  );

  const openAdd = () => { setEditing(null); setFormName(''); setFormShow(true); setModalOpen(true); };
  const openEdit = (r: any) => { setEditing(r); setFormName(r[nameField]); setFormShow(showInListKey ? r[showInListKey] : true); setModalOpen(true); };
  const handleSave = () => {
    if (!formName.trim()) return;
    const body: any = { [nameField]: formName };
    if (showInListKey) body[showInListKey] = formShow;
    if (editing) updateMut.mutate({ id: editing[pk], body }, { onSuccess: () => setModalOpen(false) });
    else createMut.mutate(body, { onSuccess: () => setModalOpen(false) });
  };

  return (
    <div>
      <SectionHeader title={title} subtitle={subtitle} />

      <div className="card">
        <div className="flex items-center justify-between mb-4">
          <div className="relative flex-1 max-w-sm">
            <Search size={15} className="absolute left-3 top-1/2 -translate-y-1/2 text-gray-400" />
            <input className="input-field !pl-9" placeholder={`Search ${title}...`} value={search} onChange={e => setSearch(e.target.value)} />
          </div>
          <button onClick={openAdd} className="btn-primary flex items-center gap-2 ml-4">
            <Plus size={16} /> Add New
          </button>
        </div>

        {isLoading ? (
          <p className="text-center py-8 text-gray-400">Loading...</p>
        ) : filtered.length === 0 ? (
          <p className="text-center py-12 text-gray-400">No records found. Click "Add New" to get started.</p>
        ) : (
          <table className="w-full text-left">
            <thead className="border-b border-medical-border">
              <tr>
                <th className="pb-3 text-xs font-semibold text-gray-500 uppercase tracking-wider px-2">#</th>
                <th className="pb-3 text-xs font-semibold text-gray-500 uppercase tracking-wider px-2">Name</th>
                {showInListKey && <th className="pb-3 text-xs font-semibold text-gray-500 uppercase tracking-wider px-2">Show In List</th>}
                <th className="pb-3 px-2 w-24"></th>
              </tr>
            </thead>
            <tbody className="divide-y divide-gray-50">
              {filtered.map((r: any, i: number) => (
                <tr key={r[pk]} className="hover:bg-slate-50 group transition-colors">
                  <td className="py-3 px-2 text-sm text-gray-400">{i + 1}</td>
                  <td className="py-3 px-2 text-sm font-medium text-gray-800">{r[nameField]}</td>
                  {showInListKey && (
                    <td className="py-3 px-2 text-sm">
                      {r[showInListKey] ? <span className="bg-green-100 text-green-700 px-2 py-0.5 rounded-full text-xs font-medium">Yes</span> : <span className="bg-gray-100 text-gray-600 px-2 py-0.5 rounded-full text-xs font-medium">No</span>}
                    </td>
                  )}
                  <td className="py-3 px-2">
                    <div className="flex gap-1 opacity-0 group-hover:opacity-100 transition-opacity justify-end">
                      <button onClick={() => openEdit(r)} className="p-1.5 hover:bg-blue-50 rounded-md text-blue-600 transition-colors" title="Edit"><Pencil size={14} /></button>
                      <button onClick={() => { if (confirm('Delete this record?')) deleteMut.mutate(r[pk]); }} className="p-1.5 hover:bg-red-50 rounded-md text-red-500 transition-colors" title="Delete"><Trash2 size={14} /></button>
                    </div>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        )}
      </div>

      {modalOpen && (
        <div className="fixed inset-0 bg-black/40 backdrop-blur-sm flex items-center justify-center z-50">
          <div className="bg-white rounded-2xl shadow-2xl w-96 p-6">
            <div className="flex justify-between items-center mb-5">
              <h3 className="font-bold text-gray-800 text-lg">{editing ? `Edit ${title}` : `Add ${title}`}</h3>
              <button onClick={() => setModalOpen(false)} className="p-1.5 hover:bg-gray-100 rounded-lg"><X size={16} /></button>
            </div>
            <label className="block text-sm font-medium text-gray-700 mb-1.5">Name <span className="text-red-500">*</span></label>
            <input
              className={`input-field ${showInListKey ? 'mb-4' : 'mb-5'}`}
              value={formName}
              onChange={e => setFormName(e.target.value)}
              onKeyDown={e => e.key === 'Enter' && handleSave()}
              placeholder={`Enter ${title} name`}
              autoFocus
            />
            {showInListKey && (
              <label className="flex items-center gap-2 text-sm text-gray-700 cursor-pointer mb-6 p-2 rounded-lg border border-medical-border hover:bg-gray-50">
                <input type="checkbox" checked={formShow} onChange={e => setFormShow(e.target.checked)} className="rounded border-medical-border text-blue-600" />
                Show in Dropdown Lists
              </label>
            )}
            <div className="flex gap-3 justify-end">
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

// ─────────────────────────────────────────────────────────
// Patient Master — full form per legacy PatMast
// ─────────────────────────────────────────────────────────

function PatientMasterPage() {
  const qc = useQueryClient();
  const { data: patients = [], isLoading } = useQuery({ queryKey: ['patients'], queryFn: async () => (await api.get<any[]>('/masters/patients')).data });
  const { data: areas = [] } = useQuery({ queryKey: ['areas'], queryFn: async () => (await api.get<any[]>('/masters/areas')).data });
  const { data: stations = [] } = useQuery({ queryKey: ['stations'], queryFn: async () => (await api.get<any[]>('/masters/stations')).data });
  const { data: patCats = [] } = useQuery({ queryKey: ['pat-categories'], queryFn: async () => (await api.get<any[]>('/masters/pat-categories')).data });

  const createMut = useMutation({ mutationFn: (b: any) => api.post('/masters/patients', b).then(r => r.data), onSuccess: () => qc.invalidateQueries({ queryKey: ['patients'] }) });
  const updateMut = useMutation({ mutationFn: ({ id, body }: any) => api.put(`/masters/patients/${id}`, body).then(r => r.data), onSuccess: () => qc.invalidateQueries({ queryKey: ['patients'] }) });
  const deleteMut = useMutation({ mutationFn: (id: number) => api.delete(`/masters/patients/${id}`).then(r => r.data), onSuccess: () => qc.invalidateQueries({ queryKey: ['patients'] }) });

  const defaultForm = {
    PttName: '', PttRegDate: new Date().toISOString().split('T')[0],
    PttPcgCode: null as number | null, PttSex: '',
    PttDob: '', PttAgeAsOnDt: '',
    PttRefRela: '', PttRefName: '',
    PttAddr: '', PttAraCode: null as number | null, PttStnCode: null as number | null,
    PttTelNo: '', PttSMSNo: '', PttEmail: '',
    PttInfAllowed: false, PttDefAllowed: false, PttDiscAllowed: false,
    PttDiscPer: 0, PttShowInList: true, PttRemark: ''
  };

  const [search, setSearch] = useState('');
  const [modalOpen, setModalOpen] = useState(false);
  const [editing, setEditing] = useState<any>(null);
  const [form, setForm] = useState<any>(defaultForm);

  const areaMap: Record<number, string> = {};
  (areas as any[]).forEach((a: any) => { areaMap[a.AraCode] = a.AraName; });
  const catMap: Record<number, string> = {};
  (patCats as any[]).forEach((c: any) => { catMap[c.PcgCode] = c.PcgName; });

  const filtered = (patients as any[]).filter((p: any) =>
    (p.PttName || '').toLowerCase().includes(search.toLowerCase()) ||
    (p.PttTelNo || '').includes(search) ||
    (p.PttSMSNo || '').includes(search)
  );

  const openAdd = () => { setEditing(null); setForm({ ...defaultForm }); setModalOpen(true); };
  const openEdit = (r: any) => { setEditing(r); setForm({ ...r }); setModalOpen(true); };
  const handleSave = () => {
    if (!form.PttName?.trim()) return;
    if (editing) updateMut.mutate({ id: editing.PttCode, body: form }, { onSuccess: () => setModalOpen(false) });
    else createMut.mutate(form, { onSuccess: () => setModalOpen(false) });
  };

  return (
    <div>
      <SectionHeader title="Patient Master" subtitle="Registered patients with full demographic details" />

      <div className="card">
        <div className="flex items-center justify-between mb-4">
          <div className="relative flex-1 max-w-md">
            <Search size={15} className="absolute left-3 top-1/2 -translate-y-1/2 text-gray-400" />
            <input className="input-field !pl-9" placeholder="Search by name, phone..." value={search} onChange={e => setSearch(e.target.value)} />
          </div>
          <button onClick={openAdd} className="btn-primary flex items-center gap-2 ml-4">
            <Plus size={16} /> Add Patient
          </button>
        </div>

        {isLoading ? <p className="text-center py-8 text-gray-400">Loading...</p> :
          filtered.length === 0 ? <p className="text-center py-12 text-gray-400">No patients found.</p> : (
            <div className="overflow-x-auto">
              <table className="w-full text-left text-sm">
                <thead className="border-b border-medical-border">
                  <tr>
                    <th className="pb-3 px-2 text-xs font-semibold text-gray-500 uppercase tracking-wider">Name</th>
                    <th className="pb-3 px-2 text-xs font-semibold text-gray-500 uppercase tracking-wider">Category</th>
                    <th className="pb-3 px-2 text-xs font-semibold text-gray-500 uppercase tracking-wider">Sex</th>
                    <th className="pb-3 px-2 text-xs font-semibold text-gray-500 uppercase tracking-wider">Phone</th>
                    <th className="pb-3 px-2 text-xs font-semibold text-gray-500 uppercase tracking-wider">Area</th>
                    <th className="pb-3 px-2 text-xs font-semibold text-gray-500 uppercase tracking-wider">Guardian</th>
                    <th className="pb-3 px-2 w-20"></th>
                  </tr>
                </thead>
                <tbody className="divide-y divide-gray-50">
                  {filtered.map((p: any) => (
                    <tr key={p.PttCode} className="hover:bg-slate-50 group transition-colors">
                      <td className="py-3 px-2 font-medium text-gray-800">{p.PttName}</td>
                      <td className="py-3 px-2 text-gray-500">{catMap[p.PttPcgCode] || '—'}</td>
                      <td className="py-3 px-2 text-gray-500">{p.PttSex || '—'}</td>
                      <td className="py-3 px-2 text-gray-600">{p.PttTelNo || p.PttSMSNo || '—'}</td>
                      <td className="py-3 px-2 text-gray-500">{areaMap[p.PttAraCode] || '—'}</td>
                      <td className="py-3 px-2 text-gray-500">{p.PttRefName ? `${p.PttRefRela} ${p.PttRefName}` : '—'}</td>
                      <td className="py-3 px-2">
                        <div className="flex gap-1 opacity-0 group-hover:opacity-100 justify-end">
                          <button onClick={() => openEdit(p)} className="p-1.5 hover:bg-blue-50 rounded-md text-blue-600"><Pencil size={14} /></button>
                          <button onClick={() => { if (confirm('Delete patient?')) deleteMut.mutate(p.PttCode); }} className="p-1.5 hover:bg-red-50 rounded-md text-red-500"><Trash2 size={14} /></button>
                        </div>
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          )}
      </div>

      {modalOpen && (
        <div className="fixed inset-0 bg-black/40 backdrop-blur-sm flex items-center justify-center z-50 p-4">
          <div className="bg-white rounded-2xl shadow-2xl w-full max-w-2xl max-h-[90vh] flex flex-col">
            <div className="flex justify-between items-center px-6 py-5 border-b border-medical-border shrink-0">
              <div>
                <h3 className="font-bold text-gray-900 text-lg">{editing ? 'Edit Patient' : 'New Patient Registration'}</h3>
                <p className="text-xs text-gray-500 mt-0.5">Fill all applicable fields</p>
              </div>
              <button onClick={() => setModalOpen(false)} className="p-1.5 hover:bg-gray-100 rounded-lg"><X size={16} /></button>
            </div>
            <div className="overflow-y-auto p-6 space-y-5">
              {/* Section: Personal Info */}
              <div>
                <h4 className="text-xs font-semibold text-gray-400 uppercase tracking-wider mb-3">Personal Information</h4>
                <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
                  <div className="sm:col-span-2">
                    <label className="block text-sm font-medium text-gray-700 mb-1">Full Name <span className="text-red-500">*</span></label>
                    <input className="input-field" value={form.PttName} onChange={e => setForm({ ...form, PttName: e.target.value })} placeholder="Patient full name" autoFocus />
                  </div>
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1">Sex</label>
                    <select className="input-field" value={form.PttSex} onChange={e => setForm({ ...form, PttSex: e.target.value })}>
                      <option value="">— Select —</option>
                      <option value="Male">Male</option>
                      <option value="Female">Female</option>
                      <option value="Other">Other</option>
                    </select>
                  </div>
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1">Date of Birth</label>
                    <input type="date" className="input-field" value={form.PttDob || ''} onChange={e => setForm({ ...form, PttDob: e.target.value })} />
                  </div>
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1">Age As On Date</label>
                    <input type="date" className="input-field" value={form.PttAgeAsOnDt || ''} onChange={e => setForm({ ...form, PttAgeAsOnDt: e.target.value })} />
                  </div>
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1">Registration Date</label>
                    <input type="date" className="input-field" value={form.PttRegDate} onChange={e => setForm({ ...form, PttRegDate: e.target.value })} />
                  </div>
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1">Patient Category</label>
                    <select className="input-field" value={form.PttPcgCode || ''} onChange={e => setForm({ ...form, PttPcgCode: Number(e.target.value) || null })}>
                      <option value="">— Select —</option>
                      {(patCats as any[]).map((c: any) => <option key={c.PcgCode} value={c.PcgCode}>{c.PcgName}</option>)}
                    </select>
                  </div>
                </div>
              </div>

              {/* Section: Guardian Info */}
              <div>
                <h4 className="text-xs font-semibold text-gray-400 uppercase tracking-wider mb-3">Guardian / Relative</h4>
                <div className="grid grid-cols-1 sm:grid-cols-3 gap-4">
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1">Relation</label>
                    <select className="input-field" value={form.PttRefRela} onChange={e => setForm({ ...form, PttRefRela: e.target.value })}>
                      <option value="">—</option>
                      <option value="S/O">S/O (Son of)</option>
                      <option value="D/O">D/O (Daughter of)</option>
                      <option value="W/O">W/O (Wife of)</option>
                      <option value="H/O">H/O (Husband of)</option>
                      <option value="C/O">C/O (Care of)</option>
                    </select>
                  </div>
                  <div className="sm:col-span-2">
                    <label className="block text-sm font-medium text-gray-700 mb-1">Guardian Name</label>
                    <input className="input-field" value={form.PttRefName} onChange={e => setForm({ ...form, PttRefName: e.target.value })} placeholder="Father / Husband / Guardian name" />
                  </div>
                </div>
              </div>

              {/* Section: Contact */}
              <div>
                <h4 className="text-xs font-semibold text-gray-400 uppercase tracking-wider mb-3">Contact & Address</h4>
                <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1">Phone / Landline</label>
                    <input className="input-field" value={form.PttTelNo} onChange={e => setForm({ ...form, PttTelNo: e.target.value })} placeholder="Landline number" />
                  </div>
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1">Mobile (SMS)</label>
                    <input className="input-field" value={form.PttSMSNo} onChange={e => setForm({ ...form, PttSMSNo: e.target.value })} placeholder="Mobile number for SMS" />
                  </div>
                  <div className="sm:col-span-2">
                    <label className="block text-sm font-medium text-gray-700 mb-1">Email</label>
                    <input type="email" className="input-field" value={form.PttEmail} onChange={e => setForm({ ...form, PttEmail: e.target.value })} placeholder="email@example.com" />
                  </div>
                  <div className="sm:col-span-2">
                    <label className="block text-sm font-medium text-gray-700 mb-1">Address</label>
                    <textarea className="input-field resize-none" rows={2} value={form.PttAddr} onChange={e => setForm({ ...form, PttAddr: e.target.value })} placeholder="Full residential address" />
                  </div>
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1">Area</label>
                    <select className="input-field" value={form.PttAraCode || ''} onChange={e => setForm({ ...form, PttAraCode: Number(e.target.value) || null })}>
                      <option value="">— Select Area —</option>
                      {(areas as any[]).map((a: any) => <option key={a.AraCode} value={a.AraCode}>{a.AraName}</option>)}
                    </select>
                  </div>
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1">Station / Locality</label>
                    <select className="input-field" value={form.PttStnCode || ''} onChange={e => setForm({ ...form, PttStnCode: Number(e.target.value) || null })}>
                      <option value="">— Select Station —</option>
                      {(stations as any[]).map((s: any) => <option key={s.StnCode} value={s.StnCode}>{s.StnName}</option>)}
                    </select>
                  </div>
                </div>
              </div>

              {/* Section: Billing Permissions */}
              <div>
                <h4 className="text-xs font-semibold text-gray-400 uppercase tracking-wider mb-3">Billing Permissions</h4>
                <div className="grid grid-cols-2 sm:grid-cols-3 gap-3">
                  <label className="flex items-center gap-2 text-sm text-gray-700 cursor-pointer p-2.5 rounded-lg border border-medical-border hover:bg-gray-50">
                    <input type="checkbox" checked={form.PttDiscAllowed} onChange={e => setForm({ ...form, PttDiscAllowed: e.target.checked })} className="rounded border-medical-border text-blue-600" />
                    Discount Allowed
                  </label>
                  <label className="flex items-center gap-2 text-sm text-gray-700 cursor-pointer p-2.5 rounded-lg border border-medical-border hover:bg-gray-50">
                    <input type="checkbox" checked={form.PttInfAllowed} onChange={e => setForm({ ...form, PttInfAllowed: e.target.checked })} className="rounded border-medical-border text-blue-600" />
                    Inform Allowed
                  </label>
                  <label className="flex items-center gap-2 text-sm text-gray-700 cursor-pointer p-2.5 rounded-lg border border-medical-border hover:bg-gray-50">
                    <input type="checkbox" checked={form.PttDefAllowed} onChange={e => setForm({ ...form, PttDefAllowed: e.target.checked })} className="rounded border-medical-border text-blue-600" />
                    Deferred Allowed
                  </label>
                </div>
                {form.PttDiscAllowed && (
                  <div className="mt-3">
                    <label className="block text-sm font-medium text-gray-700 mb-1">Default Discount %</label>
                    <input type="number" min={0} max={100} step={0.5} className="input-field w-36" value={form.PttDiscPer} onChange={e => setForm({ ...form, PttDiscPer: Number(e.target.value) })} />
                  </div>
                )}
              </div>

              {/* Remark */}
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Remark</label>
                <input className="input-field" value={form.PttRemark} onChange={e => setForm({ ...form, PttRemark: e.target.value })} placeholder="Optional notes" />
              </div>
            </div>
            <div className="flex gap-3 justify-end px-6 py-4 border-t border-medical-border bg-gray-50 rounded-b-2xl shrink-0">
              <button onClick={() => setModalOpen(false)} className="btn-secondary px-5">Cancel</button>
              <button onClick={handleSave} disabled={createMut.isPending || updateMut.isPending} className="btn-primary px-6 flex items-center gap-2">
                <Save size={15} /> {editing ? 'Update' : 'Register Patient'}
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}

// ─────────────────────────────────────────────────────────
// Doctor Master — full form per legacy DoctMast
// ─────────────────────────────────────────────────────────

function DoctorMasterPage({ path, pk, title, subtitle, catPath, catPk, catNameField, hasRole = false }: {
  path: string; pk: string; title: string; subtitle: string;
  catPath: string; catPk: string; catNameField: string; hasRole?: boolean;
}) {
  const qc = useQueryClient();
  const { data: records = [], isLoading } = useQuery({ queryKey: [path], queryFn: async () => (await api.get<any[]>(`/masters/${path}`)).data });
  const { data: categories = [] } = useQuery({ queryKey: [catPath], queryFn: async () => (await api.get<any[]>(`/masters/${catPath}`)).data });
  const { data: roles = [] } = useQuery({ queryKey: ['doct-roles'], queryFn: async () => (await api.get<any[]>('/masters/doct-roles')).data, enabled: hasRole });

  const createMut = useMutation({ mutationFn: (b: any) => api.post(`/masters/${path}`, b).then(r => r.data), onSuccess: () => qc.invalidateQueries({ queryKey: [path] }) });
  const updateMut = useMutation({ mutationFn: ({ id, body }: any) => api.put(`/masters/${path}/${id}`, body).then(r => r.data), onSuccess: () => qc.invalidateQueries({ queryKey: [path] }) });
  const deleteMut = useMutation({ mutationFn: (id: number) => api.delete(`/masters/${path}/${id}`).then(r => r.data), onSuccess: () => qc.invalidateQueries({ queryKey: [path] }) });

  const isDoctor = path === 'doctors';
  const nameKey = isDoctor ? 'DctName' : path === 'ref-bys' ? 'RByName' : 'RToName';
  const speciKey = isDoctor ? 'DctSpeci' : path === 'ref-bys' ? 'RBySpeci' : 'RToSpeci';
  const catKey = isDoctor ? 'DctDcgCode' : path === 'ref-bys' ? 'RByRfgCode' : 'RToRfgCode';
  const telKey = isDoctor ? 'DctTelNo' : path === 'ref-bys' ? 'RByTelNo' : 'RToTelNo';
  const emailKey = isDoctor ? 'DctEmail' : path === 'ref-bys' ? 'RByEmail' : 'RToEmail';
  const addrKey = isDoctor ? 'DctAddr' : path === 'ref-bys' ? 'RByAddr' : 'RToAddr';
  const shareKey = isDoctor ? 'DctShare' : path === 'ref-bys' ? 'RByShare' : 'RToShare';

  const catMap: Record<number, string> = {};
  (categories as any[]).forEach((c: any) => { catMap[c[catPk]] = c[catNameField]; });

  const buildDefault = () => ({
    ...(isDoctor ? { DctTitle: 'Dr.', DctName: '', DctSpeci: '', DctDcgCode: null, DctDrlCode: null, DctAddr: '', DctTelNo: '', DctEmail: '', DctShare: 0, DctOpdChg: 0 } : {}),
    ...(path === 'ref-bys' ? { RByName: '', RBySpeci: '', RByRfgCode: null, RByAddr: '', RByTelNo: '', RByEmail: '', RByShare: 0 } : {}),
    ...(path === 'ref-tos' ? { RToName: '', RToSpeci: '', RToRfgCode: null, RToAddr: '', RToTelNo: '', RToEmail: '', RToShare: 0 } : {})
  });

  const [search, setSearch] = useState('');
  const [modalOpen, setModalOpen] = useState(false);
  const [editing, setEditing] = useState<any>(null);
  const [form, setForm] = useState<any>(buildDefault());

  const filtered = (records as any[]).filter((r: any) =>
    (r[nameKey] || '').toLowerCase().includes(search.toLowerCase()) ||
    (r[speciKey] || '').toLowerCase().includes(search.toLowerCase())
  );

  const openAdd = () => { setEditing(null); setForm(buildDefault()); setModalOpen(true); };
  const openEdit = (r: any) => { setEditing(r); setForm({ ...r }); setModalOpen(true); };
  const handleSave = () => {
    if (!form[nameKey]?.trim()) return;
    if (editing) updateMut.mutate({ id: editing[pk], body: form }, { onSuccess: () => setModalOpen(false) });
    else createMut.mutate(form, { onSuccess: () => setModalOpen(false) });
  };

  return (
    <div>
      <SectionHeader title={title} subtitle={subtitle} />
      <div className="card">
        <div className="flex items-center justify-between mb-4">
          <div className="relative flex-1 max-w-md">
            <Search size={15} className="absolute left-3 top-1/2 -translate-y-1/2 text-gray-400" />
            <input className="input-field !pl-9" placeholder={`Search ${title}...`} value={search} onChange={e => setSearch(e.target.value)} />
          </div>
          <button onClick={openAdd} className="btn-primary flex items-center gap-2 ml-4"><Plus size={16} /> Add New</button>
        </div>
        {isLoading ? <p className="text-center py-8 text-gray-400">Loading...</p> :
          filtered.length === 0 ? <p className="text-center py-12 text-gray-400">No records found.</p> : (
            <table className="w-full text-left text-sm">
              <thead className="border-b border-medical-border">
                <tr>
                  <th className="pb-3 px-2 text-xs font-semibold text-gray-500 uppercase tracking-wider">Name</th>
                  <th className="pb-3 px-2 text-xs font-semibold text-gray-500 uppercase tracking-wider">Specialty</th>
                  <th className="pb-3 px-2 text-xs font-semibold text-gray-500 uppercase tracking-wider">Category</th>
                  <th className="pb-3 px-2 text-xs font-semibold text-gray-500 uppercase tracking-wider">Phone</th>
                  <th className="pb-3 px-2 text-xs font-semibold text-gray-500 uppercase tracking-wider text-right">Share %</th>
                  <th className="pb-3 px-2 w-20"></th>
                </tr>
              </thead>
              <tbody className="divide-y divide-gray-50">
                {filtered.map((r: any) => (
                  <tr key={r[pk]} className="hover:bg-slate-50 group transition-colors">
                    <td className="py-3 px-2 font-medium text-gray-800">{isDoctor ? `${r.DctTitle || ''} ${r[nameKey]}`.trim() : r[nameKey]}</td>
                    <td className="py-3 px-2 text-gray-500">{r[speciKey] || '—'}</td>
                    <td className="py-3 px-2 text-gray-500">{catMap[r[catKey]] || '—'}</td>
                    <td className="py-3 px-2 text-gray-600">{r[telKey] || '—'}</td>
                    <td className="py-3 px-2 text-right">
                      {r[shareKey] > 0 ? <span className="bg-amber-100 text-amber-700 px-2 py-0.5 rounded-full text-xs font-medium">{r[shareKey]}%</span> : <span className="text-gray-300">—</span>}
                    </td>
                    <td className="py-3 px-2">
                      <div className="flex gap-1 opacity-0 group-hover:opacity-100 justify-end">
                        <button onClick={() => openEdit(r)} className="p-1.5 hover:bg-blue-50 rounded-md text-blue-600"><Pencil size={14} /></button>
                        <button onClick={() => { if (confirm('Delete?')) deleteMut.mutate(r[pk]); }} className="p-1.5 hover:bg-red-50 rounded-md text-red-500"><Trash2 size={14} /></button>
                      </div>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          )}
      </div>

      {modalOpen && (
        <div className="fixed inset-0 bg-black/40 backdrop-blur-sm flex items-center justify-center z-50 p-4">
          <div className="bg-white rounded-2xl shadow-2xl w-full max-w-xl max-h-[90vh] flex flex-col">
            <div className="flex justify-between items-center px-6 py-5 border-b border-medical-border shrink-0">
              <h3 className="font-bold text-gray-900 text-lg">{editing ? `Edit ${title}` : `Add ${title}`}</h3>
              <button onClick={() => setModalOpen(false)} className="p-1.5 hover:bg-gray-100 rounded-lg"><X size={16} /></button>
            </div>
            <div className="overflow-y-auto p-6 space-y-4">
              {isDoctor ? (
                <div className="grid grid-cols-4 gap-3">
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1">Title</label>
                    <select className="input-field" value={form.DctTitle || 'Dr.'} onChange={e => setForm({ ...form, DctTitle: e.target.value })}>
                      <option>Dr.</option><option>Prof.</option><option>Mr.</option><option>Mrs.</option><option>Ms.</option>
                    </select>
                  </div>
                  <div className="col-span-3">
                    <label className="block text-sm font-medium text-gray-700 mb-1">Full Name <span className="text-red-500">*</span></label>
                    <input className="input-field" value={form.DctName || ''} onChange={e => setForm({ ...form, DctName: e.target.value })} placeholder="Doctor's full name" autoFocus />
                  </div>
                </div>
              ) : (
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">Full Name <span className="text-red-500">*</span></label>
                  <input className="input-field" value={form[nameKey] || ''} onChange={e => setForm({ ...form, [nameKey]: e.target.value })} placeholder="Full name" autoFocus />
                </div>
              )}
              <div className="grid grid-cols-2 gap-3">
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">Specialty</label>
                  <input className="input-field" value={form[speciKey] || ''} onChange={e => setForm({ ...form, [speciKey]: e.target.value })} placeholder="e.g. Cardiologist" />
                </div>
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">Category</label>
                  <select className="input-field" value={form[catKey] || ''} onChange={e => setForm({ ...form, [catKey]: Number(e.target.value) || null })}>
                    <option value="">— Select —</option>
                    {(categories as any[]).map((c: any) => <option key={c[catPk]} value={c[catPk]}>{c[catNameField]}</option>)}
                  </select>
                </div>
              </div>
              {isDoctor && (
                <div className="grid grid-cols-2 gap-3">
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1">Role</label>
                    <select className="input-field" value={form.DctDrlCode || ''} onChange={e => setForm({ ...form, DctDrlCode: Number(e.target.value) || null })}>
                      <option value="">— Select Role —</option>
                      {(roles as any[]).map((r: any) => <option key={r.DrlCode} value={r.DrlCode}>{r.DrlName}</option>)}
                    </select>
                  </div>
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1">OPD Consultation Charge (₹)</label>
                    <input type="number" min={0} className="input-field" value={form.DctOpdChg || 0} onChange={e => setForm({ ...form, DctOpdChg: Number(e.target.value) })} />
                  </div>
                </div>
              )}
              <div className="grid grid-cols-2 gap-3">
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">Phone / Mobile</label>
                  <input className="input-field" value={form[telKey] || ''} onChange={e => setForm({ ...form, [telKey]: e.target.value })} placeholder="Contact number" />
                </div>
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">Email</label>
                  <input type="email" className="input-field" value={form[emailKey] || ''} onChange={e => setForm({ ...form, [emailKey]: e.target.value })} placeholder="email@example.com" />
                </div>
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Address / Clinic</label>
                <textarea className="input-field resize-none" rows={2} value={form[addrKey] || ''} onChange={e => setForm({ ...form, [addrKey]: e.target.value })} placeholder="Clinic or hospital address" />
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Revenue Share %</label>
                <div className="flex items-center gap-3">
                  <input type="number" min={0} max={100} step={0.5} className="input-field w-32" value={form[shareKey] || 0} onChange={e => setForm({ ...form, [shareKey]: Number(e.target.value) })} />
                  <span className="text-sm text-gray-500">% of total bill amount</span>
                </div>
              </div>
            </div>
            <div className="flex gap-3 justify-end px-6 py-4 border-t border-medical-border bg-gray-50 rounded-b-2xl shrink-0">
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

// ─────────────────────────────────────────────────────────
// Bed Master — Floor, Ward, Charges, Service
// ─────────────────────────────────────────────────────────

function BedMasterPage() {
  const qc = useQueryClient();
  const { data: beds = [], isLoading } = useQuery({ queryKey: ['beds'], queryFn: async () => (await api.get<any[]>('/masters/beds')).data });
  const { data: wards = [] } = useQuery({ queryKey: ['wards'], queryFn: async () => (await api.get<any[]>('/masters/wards')).data });
  const { data: floors = [] } = useQuery({ queryKey: ['floors'], queryFn: async () => (await api.get<any[]>('/masters/floors')).data });
  const { data: services = [] } = useQuery({ queryKey: ['services'], queryFn: async () => (await api.get<any[]>('/masters/services')).data });

  const createMut = useMutation({ mutationFn: (b: any) => api.post('/masters/beds', b).then(r => r.data), onSuccess: () => qc.invalidateQueries({ queryKey: ['beds'] }) });
  const updateMut = useMutation({ mutationFn: ({ id, body }: any) => api.put(`/masters/beds/${id}`, body).then(r => r.data), onSuccess: () => qc.invalidateQueries({ queryKey: ['beds'] }) });
  const deleteMut = useMutation({ mutationFn: (id: number) => api.delete(`/masters/beds/${id}`).then(r => r.data), onSuccess: () => qc.invalidateQueries({ queryKey: ['beds'] }) });

  const defaultForm = { BdmName: '', BdmFlrCode: null, BdmWrdCode: null, BdmSrvCode: null, BdmIndex: 0, BdmCharges: 0, BdmDiscAllowed: false, BdmDiscPer: 0, BdmChkOutTimeBasis: '', BdmChkTime: 0, BdmFreeAllot: false, BdmShowInList: true, BdmRemark: '' };

  const wdMap: Record<number, string> = {};
  const flMap: Record<number, string> = {};
  (wards as any[]).forEach((w: any) => { wdMap[w.WrdCode] = w.WrdName; });
  (floors as any[]).forEach((f: any) => { flMap[f.FlrCode] = f.FlrName; });

  const [search, setSearch] = useState('');
  const [modalOpen, setModalOpen] = useState(false);
  const [editing, setEditing] = useState<any>(null);
  const [form, setForm] = useState<any>(defaultForm);

  const filtered = (beds as any[]).filter((b: any) =>
    (b.BdmName || '').toLowerCase().includes(search.toLowerCase()) ||
    (wdMap[b.BdmWrdCode] || '').toLowerCase().includes(search.toLowerCase())
  );

  const openAdd = () => { setEditing(null); setForm({ ...defaultForm }); setModalOpen(true); };
  const openEdit = (r: any) => { setEditing(r); setForm({ ...r }); setModalOpen(true); };
  const handleSave = () => {
    if (!form.BdmName?.trim()) return;
    if (editing) updateMut.mutate({ id: editing.BdmCode, body: form }, { onSuccess: () => setModalOpen(false) });
    else createMut.mutate(form, { onSuccess: () => setModalOpen(false) });
  };

  return (
    <div>
      <SectionHeader title="Bed Master" subtitle="Beds with ward, floor assignment and per-day room charges" />
      <div className="card">
        <div className="flex items-center justify-between mb-4">
          <div className="relative flex-1 max-w-md">
            <Search size={15} className="absolute left-3 top-1/2 -translate-y-1/2 text-gray-400" />
            <input className="input-field !pl-9" placeholder="Search beds or wards..." value={search} onChange={e => setSearch(e.target.value)} />
          </div>
          <button onClick={openAdd} className="btn-primary flex items-center gap-2 ml-4"><Plus size={16} /> Add Bed</button>
        </div>
        {isLoading ? <p className="text-center py-8 text-gray-400">Loading...</p> :
          filtered.length === 0 ? <p className="text-center py-12 text-gray-400">No beds found.</p> : (
            <table className="w-full text-left text-sm">
              <thead className="border-b border-medical-border">
                <tr>
                  <th className="pb-3 px-2 text-xs font-semibold text-gray-500 uppercase tracking-wider">Bed Name</th>
                  <th className="pb-3 px-2 text-xs font-semibold text-gray-500 uppercase tracking-wider">Floor</th>
                  <th className="pb-3 px-2 text-xs font-semibold text-gray-500 uppercase tracking-wider">Ward</th>
                  <th className="pb-3 px-2 text-xs font-semibold text-gray-500 uppercase tracking-wider text-right">Rate/Day (₹)</th>
                  <th className="pb-3 px-2 text-xs font-semibold text-gray-500 uppercase tracking-wider">Flags</th>
                  <th className="pb-3 px-2 w-20"></th>
                </tr>
              </thead>
              <tbody className="divide-y divide-gray-50">
                {filtered.map((b: any) => (
                  <tr key={b.BdmCode} className="hover:bg-slate-50 group transition-colors">
                    <td className="py-3 px-2 font-medium text-gray-800">{b.BdmName}</td>
                    <td className="py-3 px-2 text-gray-500">{flMap[b.BdmFlrCode] || '—'}</td>
                    <td className="py-3 px-2 text-gray-500">{wdMap[b.BdmWrdCode] || '—'}</td>
                    <td className="py-3 px-2 text-right font-semibold text-blue-700">{b.BdmCharges > 0 ? `₹${b.BdmCharges}` : <span className="text-gray-300">—</span>}</td>
                    <td className="py-3 px-2">
                      <div className="flex gap-1">
                        {b.BdmFreeAllot && <span className="text-[10px] bg-green-100 text-green-700 px-1.5 py-0.5 rounded">Free</span>}
                        {b.BdmDiscAllowed && <span className="text-[10px] bg-blue-100 text-blue-700 px-1.5 py-0.5 rounded">Disc</span>}
                      </div>
                    </td>
                    <td className="py-3 px-2">
                      <div className="flex gap-1 opacity-0 group-hover:opacity-100 justify-end">
                        <button onClick={() => openEdit(b)} className="p-1.5 hover:bg-blue-50 rounded-md text-blue-600"><Pencil size={14} /></button>
                        <button onClick={() => { if (confirm('Delete bed?')) deleteMut.mutate(b.BdmCode); }} className="p-1.5 hover:bg-red-50 rounded-md text-red-500"><Trash2 size={14} /></button>
                      </div>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          )}
      </div>

      {modalOpen && (
        <div className="fixed inset-0 bg-black/40 backdrop-blur-sm flex items-center justify-center z-50 p-4">
          <div className="bg-white rounded-2xl shadow-2xl w-full max-w-lg max-h-[90vh] flex flex-col">
            <div className="flex justify-between items-center px-6 py-5 border-b border-medical-border shrink-0">
              <h3 className="font-bold text-gray-900 text-lg">{editing ? 'Edit Bed' : 'Add New Bed'}</h3>
              <button onClick={() => setModalOpen(false)} className="p-1.5 hover:bg-gray-100 rounded-lg"><X size={16} /></button>
            </div>
            <div className="overflow-y-auto p-6 space-y-4">
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Bed Name / Number <span className="text-red-500">*</span></label>
                <input className="input-field" value={form.BdmName} onChange={e => setForm({ ...form, BdmName: e.target.value })} placeholder="e.g. Bed-101, Room A1" autoFocus />
              </div>
              <div className="grid grid-cols-2 gap-3">
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">Floor</label>
                  <select className="input-field" value={form.BdmFlrCode || ''} onChange={e => setForm({ ...form, BdmFlrCode: Number(e.target.value) || null })}>
                    <option value="">— Select Floor —</option>
                    {(floors as any[]).map((f: any) => <option key={f.FlrCode} value={f.FlrCode}>{f.FlrName}</option>)}
                  </select>
                </div>
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">Ward</label>
                  <select className="input-field" value={form.BdmWrdCode || ''} onChange={e => setForm({ ...form, BdmWrdCode: Number(e.target.value) || null })}>
                    <option value="">— Select Ward —</option>
                    {(wards as any[]).map((w: any) => <option key={w.WrdCode} value={w.WrdCode}>{w.WrdName}</option>)}
                  </select>
                </div>
              </div>
              <div className="grid grid-cols-2 gap-3">
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">Daily Charge (₹)</label>
                  <input type="number" min={0} className="input-field" value={form.BdmCharges} onChange={e => setForm({ ...form, BdmCharges: Number(e.target.value) })} />
                </div>
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">Discount %</label>
                  <input type="number" min={0} max={100} className="input-field" value={form.BdmDiscPer} onChange={e => setForm({ ...form, BdmDiscPer: Number(e.target.value) })} />
                </div>
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Linked Service</label>
                <select className="input-field" value={form.BdmSrvCode || ''} onChange={e => setForm({ ...form, BdmSrvCode: Number(e.target.value) || null })}>
                  <option value="">— None —</option>
                  {(services as any[]).map((s: any) => <option key={s.SrvCode} value={s.SrvCode}>{s.SrvName}</option>)}
                </select>
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Checkout Time Basis</label>
                <select className="input-field" value={form.BdmChkOutTimeBasis || ''} onChange={e => setForm({ ...form, BdmChkOutTimeBasis: e.target.value })}>
                  <option value="">— Select —</option>
                  <option value="Fixed">Fixed Time</option>
                  <option value="24Hr">24 Hour Basis</option>
                  <option value="Day">Per Calendar Day</option>
                </select>
              </div>
              <div className="grid grid-cols-2 gap-3">
                <label className="flex items-center gap-2 text-sm text-gray-700 cursor-pointer p-2.5 rounded-lg border border-medical-border hover:bg-gray-50">
                  <input type="checkbox" checked={form.BdmDiscAllowed} onChange={e => setForm({ ...form, BdmDiscAllowed: e.target.checked })} className="rounded border-medical-border text-blue-600" />
                  Discount Allowed
                </label>
                <label className="flex items-center gap-2 text-sm text-gray-700 cursor-pointer p-2.5 rounded-lg border border-medical-border hover:bg-gray-50">
                  <input type="checkbox" checked={form.BdmFreeAllot} onChange={e => setForm({ ...form, BdmFreeAllot: e.target.checked })} className="rounded border-medical-border text-blue-600" />
                  Free Allotment
                </label>
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Remark</label>
                <input className="input-field" value={form.BdmRemark || ''} onChange={e => setForm({ ...form, BdmRemark: e.target.value })} placeholder="Optional notes" />
              </div>
            </div>
            <div className="flex gap-3 justify-end px-6 py-4 border-t border-medical-border bg-gray-50 rounded-b-2xl shrink-0">
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

// ─────────────────────────────────────────────────────────
// Service Group Master
// ─────────────────────────────────────────────────────────

function ServiceGroupMasterPage() {
  const qc = useQueryClient();
  const { data: records = [], isLoading } = useQuery({ queryKey: ['service-groups'], queryFn: async () => (await api.get<any[]>('/masters/service-groups')).data });

  const createMut = useMutation({ mutationFn: (b: any) => api.post('/masters/service-groups', b).then(r => r.data), onSuccess: () => qc.invalidateQueries({ queryKey: ['service-groups'] }) });
  const updateMut = useMutation({ mutationFn: ({ id, body }: any) => api.put(`/masters/service-groups/${id}`, body).then(r => r.data), onSuccess: () => qc.invalidateQueries({ queryKey: ['service-groups'] }) });
  const deleteMut = useMutation({ mutationFn: (id: number) => api.delete(`/masters/service-groups/${id}`).then(r => r.data), onSuccess: () => qc.invalidateQueries({ queryKey: ['service-groups'] }) });

  const defaultForm = {
    SgpName: '', SgpIndex: 0, SgpExpanded: false, SgpEditable: false, SgpInfAllowed: false,
    SgpDefAllowed: false, SgpDiscAllowed: false, SgpDiscPer: 0, SgpExtRateSys: false,
    SgpDctwseRateSys: false, SgpPcgwseRateSys: false, SgpRBywseRateSys: false,
    SgpRTowseRateSys: false, SgpTimewseRateSys: false, SgpExtDiscSys: false,
    SgpDctwseDiscSys: false, SgpPcgwseDiscSys: false, SgpExtBargSys: false,
    SgpExtShareSys: false, SgpDctwseShareSys: false, SgpShowInList: true
  };

  const [search, setSearch] = useState('');
  const [modalOpen, setModalOpen] = useState(false);
  const [editing, setEditing] = useState<any>(null);
  const [form, setForm] = useState<any>(defaultForm);

  const filtered = (records as any[]).filter((r: any) => (r.SgpName || '').toLowerCase().includes(search.toLowerCase()));

  const openAdd = () => { setEditing(null); setForm({ ...defaultForm }); setModalOpen(true); };
  const openEdit = (r: any) => { setEditing(r); setForm({ ...r }); setModalOpen(true); };
  const handleSave = () => {
    if (!form.SgpName?.trim()) return;
    if (editing) updateMut.mutate({ id: editing.SgpCode, body: form }, { onSuccess: () => setModalOpen(false) });
    else createMut.mutate(form, { onSuccess: () => setModalOpen(false) });
  };

  const checkboxes = [
    { k: 'SgpEditable', l: 'Amount Editable' },
    { k: 'SgpInfAllowed', l: 'Inform Allowed' },
    { k: 'SgpDefAllowed', l: 'Deferred Allowed' },
    { k: 'SgpDiscAllowed', l: 'Discount Allowed' },
    { k: 'SgpShowInList', l: 'Show In List' },
    { k: 'SgpExpanded', l: 'Expanded' },
    { k: 'SgpExtRateSys', l: 'Ext Rate Sys' },
    { k: 'SgpDctwseRateSys', l: 'Doctor-wise Rate' },
    { k: 'SgpPcgwseRateSys', l: 'Patient Cat-wise Rate' },
    { k: 'SgpRBywseRateSys', l: 'RefBy-wise Rate' },
    { k: 'SgpRTowseRateSys', l: 'RefTo-wise Rate' },
    { k: 'SgpTimewseRateSys', l: 'Time-wise Rate' },
    { k: 'SgpExtDiscSys', l: 'Ext Disc Sys' },
    { k: 'SgpDctwseDiscSys', l: 'Doctor-wise Disc' },
    { k: 'SgpPcgwseDiscSys', l: 'Patient Cat-wise Disc' },
    { k: 'SgpExtBargSys', l: 'Ext Barg Sys' },
    { k: 'SgpExtShareSys', l: 'Ext Share Sys' },
    { k: 'SgpDctwseShareSys', l: 'Doctor-wise Share' }
  ];

  return (
    <div>
      <SectionHeader title="Service Groups" subtitle="Hospital service grouping with detailed billing rules" />
      <div className="card">
        <div className="flex items-center justify-between mb-4">
          <div className="relative flex-1 max-w-sm">
            <Search size={15} className="absolute left-3 top-1/2 -translate-y-1/2 text-gray-400" />
            <input className="input-field !pl-9" placeholder="Search service groups..." value={search} onChange={e => setSearch(e.target.value)} />
          </div>
          <button onClick={openAdd} className="btn-primary flex items-center gap-2 ml-4"><Plus size={16} /> Add Group</button>
        </div>
        {isLoading ? <p className="text-center py-8 text-gray-400">Loading...</p> :
          filtered.length === 0 ? <p className="text-center py-12 text-gray-400">No groups found.</p> : (
            <table className="w-full text-left text-sm">
              <thead className="border-b border-medical-border">
                <tr>
                  <th className="pb-3 px-2 text-xs font-semibold text-gray-500 uppercase tracking-wider">Group Name</th>
                  <th className="pb-3 px-2 text-xs font-semibold text-gray-500 uppercase tracking-wider text-right">Index</th>
                  <th className="pb-3 px-2 text-xs font-semibold text-gray-500 uppercase tracking-wider">Settings</th>
                  <th className="pb-3 px-2 w-20"></th>
                </tr>
              </thead>
              <tbody className="divide-y divide-gray-50">
                {filtered.map((r: any) => (
                  <tr key={r.SgpCode} className="hover:bg-slate-50 group transition-colors">
                    <td className="py-3 px-2 font-medium text-gray-800">{r.SgpName}</td>
                    <td className="py-3 px-2 text-right">{r.SgpIndex}</td>
                    <td className="py-3 px-2">
                      <div className="flex gap-1 flex-wrap">
                        {r.SgpEditable && <span className="text-[10px] bg-purple-50 text-purple-600 px-1.5 py-0.5 rounded">Editable</span>}
                        {r.SgpDiscAllowed && <span className="text-[10px] bg-green-50 text-green-600 px-1.5 py-0.5 rounded">Disc</span>}
                        {r.SgpDctwseRateSys && <span className="text-[10px] bg-blue-50 text-blue-600 px-1.5 py-0.5 rounded">Dr-Rate</span>}
                      </div>
                    </td>
                    <td className="py-3 px-2">
                      <div className="flex gap-1 opacity-0 group-hover:opacity-100 justify-end">
                        <button onClick={() => openEdit(r)} className="p-1.5 hover:bg-blue-50 rounded-md text-blue-600"><Pencil size={14} /></button>
                        <button onClick={() => { if (confirm('Delete?')) deleteMut.mutate(r.SgpCode); }} className="p-1.5 hover:bg-red-50 rounded-md text-red-500"><Trash2 size={14} /></button>
                      </div>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          )}
      </div>

      {modalOpen && (
        <div className="fixed inset-0 bg-black/40 backdrop-blur-sm flex items-center justify-center z-50 p-4">
          <div className="bg-white rounded-2xl shadow-2xl w-full max-w-2xl max-h-[90vh] flex flex-col">
            <div className="flex justify-between items-center px-6 py-5 border-b border-medical-border shrink-0">
              <h3 className="font-bold text-gray-900 text-lg">{editing ? 'Edit Group' : 'Add Service Group'}</h3>
              <button onClick={() => setModalOpen(false)} className="p-1.5 hover:bg-gray-100 rounded-lg"><X size={16} /></button>
            </div>
            <div className="overflow-y-auto p-6 space-y-4">
              <div className="grid grid-cols-2 gap-4">
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">Group Name <span className="text-red-500">*</span></label>
                  <input className="input-field" value={form.SgpName} onChange={e => setForm({ ...form, SgpName: e.target.value })} autoFocus />
                </div>
                <div className="flex gap-4">
                  <div className="flex-1">
                    <label className="block text-sm font-medium text-gray-700 mb-1">Index Order</label>
                    <input type="number" min={0} className="input-field" value={form.SgpIndex} onChange={e => setForm({ ...form, SgpIndex: Number(e.target.value) })} />
                  </div>
                  <div className="flex-1">
                    <label className="block text-sm font-medium text-gray-700 mb-1">Disc %</label>
                    <input type="number" min={0} max={100} className="input-field" value={form.SgpDiscPer} onChange={e => setForm({ ...form, SgpDiscPer: Number(e.target.value) })} disabled={!form.SgpDiscAllowed} />
                  </div>
                </div>
              </div>
              <div className="mt-4">
                <label className="block text-sm font-medium text-gray-700 mb-2">Billing & System Rules</label>
                <div className="grid grid-cols-3 gap-2">
                  {checkboxes.map(({ k, l }) => (
                    <label key={k} className="flex items-center gap-2 text-xs text-gray-700 cursor-pointer p-2 rounded-lg border border-medical-border hover:bg-gray-50">
                      <input type="checkbox" checked={!!form[k]} onChange={e => setForm({ ...form, [k]: e.target.checked })} className="rounded border-medical-border text-blue-600" />
                      {l}
                    </label>
                  ))}
                </div>
              </div>
            </div>
            <div className="flex gap-3 justify-end px-6 py-4 border-t border-medical-border bg-gray-50 rounded-b-2xl shrink-0">
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

// ─────────────────────────────────────────────────────────
// Service Master
// ─────────────────────────────────────────────────────────

function ServiceMasterPage() {
  const qc = useQueryClient();
  const { data: services = [], isLoading } = useQuery({ queryKey: ['services'], queryFn: async () => (await api.get<any[]>('/masters/services')).data });
  const { data: groups = [] } = useQuery({ queryKey: ['service-groups'], queryFn: async () => (await api.get<any[]>('/masters/service-groups')).data });

  const createMut = useMutation({ mutationFn: (b: any) => api.post('/masters/services', b).then(r => r.data), onSuccess: () => qc.invalidateQueries({ queryKey: ['services'] }) });
  const updateMut = useMutation({ mutationFn: ({ id, body }: any) => api.put(`/masters/services/${id}`, body).then(r => r.data), onSuccess: () => qc.invalidateQueries({ queryKey: ['services'] }) });
  const deleteMut = useMutation({ mutationFn: (id: number) => api.delete(`/masters/services/${id}`).then(r => r.data), onSuccess: () => qc.invalidateQueries({ queryKey: ['services'] }) });

  const defaultForm = { SrvName: '', SrvSgpCode: null, SrvCharges: 0, SrvDiscPer: 0, SrvIndex: 0, SrvRateEditable: true, SrvAmtEditable: false, SrvUnitEditable: true, SrvAutoInsIndr: false, SrvAutoInsOnceIndr: false, SrvDiscAllowed: true, SrvShowInList: true, SrvInfAllowed: false, SrvDefAllowed: false };

  const grpMap: Record<number, string> = {};
  (groups as any[]).forEach((g: any) => { grpMap[g.SgpCode] = g.SgpName; });

  const [search, setSearch] = useState('');
  const [modalOpen, setModalOpen] = useState(false);
  const [editing, setEditing] = useState<any>(null);
  const [matrixService, setMatrixService] = useState<any>(null);
  const [form, setForm] = useState<any>(defaultForm);

  const filtered = (services as any[]).filter((s: any) =>
    (s.SrvName || '').toLowerCase().includes(search.toLowerCase()) ||
    (grpMap[s.SrvSgpCode] || '').toLowerCase().includes(search.toLowerCase())
  );

  const openAdd = () => { setEditing(null); setForm({ ...defaultForm }); setModalOpen(true); };
  const openEdit = (r: any) => { setEditing(r); setForm({ ...r }); setModalOpen(true); };
  const handleSave = () => {
    if (!form.SrvName?.trim()) return;
    if (editing) updateMut.mutate({ id: editing.SrvCode, body: form }, { onSuccess: () => setModalOpen(false) });
    else createMut.mutate(form, { onSuccess: () => setModalOpen(false) });
  };

  return (
    <div>
      <SectionHeader title="Services & Charges" subtitle="Hospital services with OPD/IPD rates and billing options" />
      <div className="card">
        <div className="flex items-center justify-between mb-4">
          <div className="relative flex-1 max-w-md">
            <Search size={15} className="absolute left-3 top-1/2 -translate-y-1/2 text-gray-400" />
            <input className="input-field !pl-9" placeholder="Search services..." value={search} onChange={e => setSearch(e.target.value)} />
          </div>
          <button onClick={openAdd} className="btn-primary flex items-center gap-2 ml-4"><Plus size={16} /> Add Service</button>
        </div>
        {isLoading ? <p className="text-center py-8 text-gray-400">Loading...</p> :
          filtered.length === 0 ? <p className="text-center py-12 text-gray-400">No services found.</p> : (
            <table className="w-full text-left text-sm">
              <thead className="border-b border-medical-border">
                <tr>
                  <th className="pb-3 px-2 text-xs font-semibold text-gray-500 uppercase tracking-wider">Service Name</th>
                  <th className="pb-3 px-2 text-xs font-semibold text-gray-500 uppercase tracking-wider">Group</th>
                  <th className="pb-3 px-2 text-xs font-semibold text-gray-500 uppercase tracking-wider text-right">Charge (₹)</th>
                  <th className="pb-3 px-2 text-xs font-semibold text-gray-500 uppercase tracking-wider">Flags</th>
                  <th className="pb-3 px-2 w-20"></th>
                </tr>
              </thead>
              <tbody className="divide-y divide-gray-50">
                {filtered.map((s: any) => (
                  <tr key={s.SrvCode} className="hover:bg-slate-50 group transition-colors">
                    <td className="py-3 px-2 font-medium text-gray-800">{s.SrvName}</td>
                    <td className="py-3 px-2 text-gray-500">{grpMap[s.SrvSgpCode] || '—'}</td>
                    <td className="py-3 px-2 text-right font-semibold text-blue-700">₹{(s.SrvCharges || 0).toFixed(0)}</td>
                    <td className="py-3 px-2">
                      <div className="flex gap-1 flex-wrap">
                        {s.SrvAutoInsIndr && <span className="text-[10px] bg-blue-50 text-blue-600 px-1.5 py-0.5 rounded">Auto-IPD</span>}
                        {s.SrvDiscAllowed && <span className="text-[10px] bg-green-50 text-green-600 px-1.5 py-0.5 rounded">Disc</span>}
                        {s.SrvDctwseRateSys && <span className="text-[10px] bg-purple-50 text-purple-600 px-1.5 py-0.5 rounded">Dr-Rate</span>}
                        {s.SrvPcgwseRateSys && <span className="text-[10px] bg-orange-50 text-orange-600 px-1.5 py-0.5 rounded">Pat-Rate</span>}
                      </div>
                    </td>
                    <td className="py-3 px-2">
                      <div className="flex gap-1 opacity-0 group-hover:opacity-100 justify-end">
                        {(s.SrvDctwseRateSys || s.SrvPcgwseRateSys || s.SrvExtShareSys) && (
                          <button onClick={() => setMatrixService(s)} className="p-1.5 hover:bg-green-50 rounded-md text-green-600 mr-1" title="Manage Rates Matrix">
                            <Settings size={14} />
                          </button>
                        )}
                        <button onClick={() => openEdit(s)} className="p-1.5 hover:bg-blue-50 rounded-md text-blue-600"><Pencil size={14} /></button>
                        <button onClick={() => { if (confirm('Delete?')) deleteMut.mutate(s.SrvCode); }} className="p-1.5 hover:bg-red-50 rounded-md text-red-500"><Trash2 size={14} /></button>
                      </div>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          )}
      </div>

      {modalOpen && (
        <div className="fixed inset-0 bg-black/40 backdrop-blur-sm flex items-center justify-center z-50 p-4">
          <div className="bg-white rounded-2xl shadow-2xl w-full max-w-lg max-h-[90vh] flex flex-col">
            <div className="flex justify-between items-center px-6 py-5 border-b border-medical-border shrink-0">
              <h3 className="font-bold text-gray-900 text-lg">{editing ? 'Edit Service' : 'Add New Service'}</h3>
              <button onClick={() => setModalOpen(false)} className="p-1.5 hover:bg-gray-100 rounded-lg"><X size={16} /></button>
            </div>
            <div className="overflow-y-auto p-6 space-y-4">
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Service Name <span className="text-red-500">*</span></label>
                <input className="input-field" value={form.SrvName} onChange={e => setForm({ ...form, SrvName: e.target.value })} placeholder="e.g. Room Rent, Consultation, X-Ray" autoFocus />
              </div>
              <div className="grid grid-cols-2 gap-3">
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">Service Group</label>
                  <select className="input-field" value={form.SrvSgpCode || ''} onChange={e => setForm({ ...form, SrvSgpCode: Number(e.target.value) || null })}>
                    <option value="">— Select Group —</option>
                    {(groups as any[]).map((g: any) => <option key={g.SgpCode} value={g.SgpCode}>{g.SgpName}</option>)}
                  </select>
                </div>
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">Charge (₹)</label>
                  <input type="number" min={0} className="input-field" value={form.SrvCharges} onChange={e => setForm({ ...form, SrvCharges: Number(e.target.value) })} />
                </div>
              </div>
              <div className="grid grid-cols-2 gap-3">
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">Discount %</label>
                  <input type="number" min={0} max={100} className="input-field" value={form.SrvDiscPer} onChange={e => setForm({ ...form, SrvDiscPer: Number(e.target.value) })} />
                </div>
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">Sort Index</label>
                  <input type="number" min={0} className="input-field" value={form.SrvIndex} onChange={e => setForm({ ...form, SrvIndex: Number(e.target.value) })} />
                </div>
              </div>
              <div className="grid grid-cols-2 gap-3">
                {[
                  ['SrvAutoInsIndr', 'Auto-insert in IPD Bill'],
                  ['SrvDiscAllowed', 'Discount Allowed'],
                  ['SrvRateEditable', 'Rate Editable'],
                  ['SrvUnitEditable', 'Unit Editable'],
                  ['SrvInfAllowed', 'Inform Allowed'],
                  ['SrvDefAllowed', 'Deferred Allowed'],
                  ['SrvShowInList', 'Show in List'],
                  ['SrvAutoInsOnceIndr', 'Auto-insert Once (IPD)'],
                ].map(([key, label]) => (
                  <label key={key} className="flex items-center gap-2 text-sm text-gray-700 cursor-pointer p-2 rounded-lg border border-medical-border hover:bg-gray-50">
                    <input type="checkbox" checked={!!form[key]} onChange={e => setForm({ ...form, [key]: e.target.checked })} className="rounded border-medical-border text-blue-600" />
                    {label}
                  </label>
                ))}
              </div>
              <div className="mt-4">
                <label className="block text-sm font-bold text-gray-800 mb-2 border-b pb-1">Complex Charge Rules (Rate Matrix)</label>
                <div className="grid grid-cols-2 gap-3">
                  {[
                    ['SrvDctwseRateSys', 'Doctor-wise Rate System'],
                    ['SrvPcgwseRateSys', 'Patient Category-wise System'],
                    ['SrvExtShareSys', 'Referrer-wise Share System'],
                  ].map(([key, label]) => (
                    <label key={key} className="flex items-center gap-2 text-sm text-gray-700 cursor-pointer p-2 rounded-lg border border-medical-border bg-purple-50 hover:bg-purple-100">
                      <input type="checkbox" checked={!!form[key]} onChange={e => setForm({ ...form, [key]: e.target.checked })} className="rounded border-medical-border text-purple-600" />
                      {label}
                    </label>
                  ))}
                </div>
              </div>
            </div>
            <div className="flex gap-3 justify-end px-6 py-4 border-t border-medical-border bg-gray-50 rounded-b-2xl shrink-0">
              <button onClick={() => setModalOpen(false)} className="btn-secondary px-5">Cancel</button>
              <button onClick={handleSave} disabled={createMut.isPending || updateMut.isPending} className="btn-primary px-6 flex items-center gap-2">
                <Save size={15} /> {editing ? 'Update' : 'Save'}
              </button>
            </div>
          </div>
        </div>
      )}

      {matrixService && <ServiceRateMatrixModal service={matrixService} onClose={() => setMatrixService(null)} />}
    </div>
  );
}

// ─────────────────────────────────────────────────────────
// Rate Matrix Modal
// ─────────────────────────────────────────────────────────
function ServiceRateMatrixModal({ service, onClose }: { service: any, onClose: () => void }) {
  const qc = useQueryClient();
  const [activeTab, setActiveTab] = useState<'doct' | 'pat' | 'ref'>(
    service.SrvDctwseRateSys ? 'doct' : service.SrvPcgwseRateSys ? 'pat' : 'ref'
  );

  const { data: doctCategories = [] } = useQuery({ queryKey: ['doct-categories'], queryFn: async () => (await api.get<any[]>('/masters/doct-categories')).data });
  const { data: patCategories = [] } = useQuery({ queryKey: ['pat-categories'], queryFn: async () => (await api.get<any[]>('/masters/pat-categories')).data });
  const { data: refCategories = [] } = useQuery({ queryKey: ['ref-categories'], queryFn: async () => (await api.get<any[]>('/masters/ref-categories')).data });
  const { data: rates = [], isLoading } = useQuery({ queryKey: ['service-rates', service.SrvCode], queryFn: async () => (await api.get<any[]>(`/masters/service-rates/${service.SrvCode}`)).data });

  const [matrixState, setMatrixState] = useState<Record<string, any>>({});
  const [saving, setSaving] = useState(false);

  useEffect(() => {
    if (rates.length > 0) {
      const ms: any = {};
      (rates as any[]).forEach(r => {
        ms[`${r.SrmRateType}_${r.SrmRefCode}`] = r;
      });
      setMatrixState(ms);
    }
  }, [rates]);

  const handleValChange = (type: string, refCode: number, field: string, value: string) => {
    const key = `${type}_${refCode}`;
    const v = Number(value) || 0;
    setMatrixState(prev => ({
      ...prev,
      [key]: {
        ...(prev[key] || { SrmSrvCode: service.SrvCode, SrmRateType: type, SrmRefCode: refCode, SrmRate: 0, SrmShare: 0, SrmDiscPer: 0 }),
        [field]: v
      }
    }));
  };

  const handleSave = async () => {
    setSaving(true);
    try {
      const promises = Object.values(matrixState).map(async (rateObj) => {
        if (rateObj.SrmCode) {
          return api.put(`/masters/service-rates/${rateObj.SrmCode}`, rateObj);
        } else {
          return api.post(`/masters/service-rates`, rateObj);
        }
      });
      await Promise.all(promises);
      qc.invalidateQueries({ queryKey: ['service-rates', service.SrvCode] });
      onClose();
    } catch (e) {
      alert("Failed to save rates.");
    }
    setSaving(false);
  };

  const renderGrid = (categories: any[], type: string, pkField: string, nameField: string) => (
    <table className="w-full text-left text-sm border">
      <thead className="bg-gray-50 border-b">
        <tr>
          <th className="p-2 font-medium text-gray-600">{nameField.includes('Dcg') ? 'Doctor Category' : nameField.includes('Pcg') ? 'Patient Category' : 'Referrer Category'}</th>
          <th className="p-2 font-medium text-gray-600 w-28">Rate (₹)</th>
          <th className="p-2 font-medium text-gray-600 w-28">Share %</th>
          <th className="p-2 font-medium text-gray-600 w-28">Discount %</th>
        </tr>
      </thead>
      <tbody className="divide-y">
        {categories.map((c: any) => {
          const key = `${type}_${c[pkField]}`;
          const r = matrixState[key] || { SrmRate: 0, SrmShare: 0, SrmDiscPer: 0 };
          return (
            <tr key={key} className="hover:bg-gray-50">
              <td className="p-2 font-medium text-gray-800">{c[nameField]}</td>
              <td className="p-1"><input type="number" min={0} className="w-full border rounded px-2 py-1" value={r.SrmRate} onChange={e => handleValChange(type, c[pkField], 'SrmRate', e.target.value)} /></td>
              <td className="p-1"><input type="number" min={0} max={100} className="w-full border rounded px-2 py-1" value={r.SrmShare} onChange={e => handleValChange(type, c[pkField], 'SrmShare', e.target.value)} /></td>
              <td className="p-1"><input type="number" min={0} max={100} className="w-full border rounded px-2 py-1" value={r.SrmDiscPer} onChange={e => handleValChange(type, c[pkField], 'SrmDiscPer', e.target.value)} /></td>
            </tr>
          );
        })}
      </tbody>
    </table>
  );

  return (
    <div className="fixed inset-0 bg-black/40 backdrop-blur-sm flex items-center justify-center z-[60] p-4">
      <div className="bg-white rounded-2xl shadow-2xl w-full max-w-3xl max-h-[90vh] flex flex-col">
        <div className="flex justify-between items-center px-6 py-5 border-b border-medical-border shrink-0">
          <div>
            <h3 className="font-bold text-gray-900 text-lg">Charge Matrix: {service.SrvName}</h3>
            <p className="text-xs text-gray-500">Define granular rates, discounts, and revenue sharing percentages.</p>
          </div>
          <button onClick={onClose} className="p-1.5 hover:bg-gray-100 rounded-lg"><X size={16} /></button>
        </div>
        <div className="flex px-6 pt-4 gap-2 border-b">
          {service.SrvDctwseRateSys && <button onClick={() => setActiveTab('doct')} className={`pb-2 px-3 text-sm font-medium border-b-2 ${activeTab === 'doct' ? 'border-blue-600 text-blue-600' : 'border-transparent text-gray-500'}`}>Doctor-wise Matrix</button>}
          {service.SrvPcgwseRateSys && <button onClick={() => setActiveTab('pat')} className={`pb-2 px-3 text-sm font-medium border-b-2 ${activeTab === 'pat' ? 'border-blue-600 text-blue-600' : 'border-transparent text-gray-500'}`}>Patient Category-wise</button>}
          {service.SrvExtShareSys && <button onClick={() => setActiveTab('ref')} className={`pb-2 px-3 text-sm font-medium border-b-2 ${activeTab === 'ref' ? 'border-blue-600 text-blue-600' : 'border-transparent text-gray-500'}`}>Referrer-wise Matrix</button>}
        </div>
        <div className="overflow-y-auto p-6">
          {isLoading ? <p>Loading existing matrix...</p> : (
            <>
              {activeTab === 'doct' && renderGrid(doctCategories, 'DoctCatg', 'DcgCode', 'DcgName')}
              {activeTab === 'pat' && renderGrid(patCategories, 'PatCatg', 'PcgCode', 'PcgName')}
              {activeTab === 'ref' && renderGrid(refCategories, 'RefCatg', 'RfgCode', 'RfgName')}
            </>
          )}
        </div>
        <div className="flex gap-3 justify-end px-6 py-4 border-t border-medical-border bg-gray-50 rounded-b-2xl shrink-0">
          <button onClick={onClose} className="btn-secondary px-5">Cancel</button>
          <button onClick={handleSave} disabled={saving} className="btn-primary px-6 flex items-center gap-2">
            <Save size={15} /> {saving ? 'Saving...' : 'Save Matrix'}
          </button>
        </div>
      </div>
    </div>
  );
}

// ─────────────────────────────────────────────────────────
// PatientCategory — with disc% and permission flags
// ─────────────────────────────────────────────────────────

function PatCategoryPage() {
  const qc = useQueryClient();
  const { data: records = [], isLoading } = useQuery({ queryKey: ['pat-categories'], queryFn: async () => (await api.get<any[]>('/masters/pat-categories')).data });
  const createMut = useMutation({ mutationFn: (b: any) => api.post('/masters/pat-categories', b).then(r => r.data), onSuccess: () => qc.invalidateQueries({ queryKey: ['pat-categories'] }) });
  const updateMut = useMutation({ mutationFn: ({ id, body }: any) => api.put(`/masters/pat-categories/${id}`, body).then(r => r.data), onSuccess: () => qc.invalidateQueries({ queryKey: ['pat-categories'] }) });
  const deleteMut = useMutation({ mutationFn: (id: number) => api.delete(`/masters/pat-categories/${id}`).then(r => r.data), onSuccess: () => qc.invalidateQueries({ queryKey: ['pat-categories'] }) });

  const defaultForm = { PcgName: '', PcgInfAllowed: false, PcgDefAllowed: false, PcgDiscAllowed: false, PcgDiscPer: 0, PcgShowInList: true };
  const [search, setSearch] = useState('');
  const [modalOpen, setModalOpen] = useState(false);
  const [editing, setEditing] = useState<any>(null);
  const [form, setForm] = useState<any>(defaultForm);

  const filtered = (records as any[]).filter((r: any) => (r.PcgName || '').toLowerCase().includes(search.toLowerCase()));
  const openAdd = () => { setEditing(null); setForm({ ...defaultForm }); setModalOpen(true); };
  const openEdit = (r: any) => { setEditing(r); setForm({ ...r }); setModalOpen(true); };
  const handleSave = () => {
    if (!form.PcgName?.trim()) return;
    if (editing) updateMut.mutate({ id: editing.PcgCode, body: form }, { onSuccess: () => setModalOpen(false) });
    else createMut.mutate(form, { onSuccess: () => setModalOpen(false) });
  };

  return (
    <div>
      <SectionHeader title="Patient Category" subtitle="Billing permission groups for patient classification" />
      <div className="card">
        <div className="flex items-center justify-between mb-4">
          <div className="relative flex-1 max-w-sm">
            <Search size={15} className="absolute left-3 top-1/2 -translate-y-1/2 text-gray-400" />
            <input className="input-field !pl-9" placeholder="Search categories..." value={search} onChange={e => setSearch(e.target.value)} />
          </div>
          <button onClick={openAdd} className="btn-primary flex items-center gap-2 ml-4"><Plus size={16} /> Add New</button>
        </div>
        {isLoading ? <p className="text-center py-8 text-gray-400">Loading...</p> :
          filtered.length === 0 ? <p className="text-center py-12 text-gray-400">No categories found.</p> : (
            <table className="w-full text-left text-sm">
              <thead className="border-b border-medical-border">
                <tr>
                  <th className="pb-3 px-2 text-xs font-semibold text-gray-500 uppercase tracking-wider">Name</th>
                  <th className="pb-3 px-2 text-xs font-semibold text-gray-500 uppercase tracking-wider text-right">Disc %</th>
                  <th className="pb-3 px-2 text-xs font-semibold text-gray-500 uppercase tracking-wider">Permissions</th>
                  <th className="pb-3 px-2 w-20"></th>
                </tr>
              </thead>
              <tbody className="divide-y divide-gray-50">
                {filtered.map((r: any) => (
                  <tr key={r.PcgCode} className="hover:bg-slate-50 group transition-colors">
                    <td className="py-3 px-2 font-medium text-gray-800">{r.PcgName}</td>
                    <td className="py-3 px-2 text-right">{r.PcgDiscAllowed ? <span className="bg-green-100 text-green-700 px-2 py-0.5 rounded-full text-xs">{r.PcgDiscPer}%</span> : <span className="text-gray-300">—</span>}</td>
                    <td className="py-3 px-2">
                      <div className="flex gap-1">
                        {r.PcgInfAllowed && <span className="text-[10px] bg-blue-50 text-blue-600 px-1.5 py-0.5 rounded">Inf</span>}
                        {r.PcgDefAllowed && <span className="text-[10px] bg-orange-50 text-orange-600 px-1.5 py-0.5 rounded">Def</span>}
                        {r.PcgDiscAllowed && <span className="text-[10px] bg-green-50 text-green-600 px-1.5 py-0.5 rounded">Disc</span>}
                      </div>
                    </td>
                    <td className="py-3 px-2">
                      <div className="flex gap-1 opacity-0 group-hover:opacity-100 justify-end">
                        <button onClick={() => openEdit(r)} className="p-1.5 hover:bg-blue-50 rounded-md text-blue-600"><Pencil size={14} /></button>
                        <button onClick={() => { if (confirm('Delete?')) deleteMut.mutate(r.PcgCode); }} className="p-1.5 hover:bg-red-50 rounded-md text-red-500"><Trash2 size={14} /></button>
                      </div>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          )}
      </div>

      {modalOpen && (
        <div className="fixed inset-0 bg-black/40 backdrop-blur-sm flex items-center justify-center z-50">
          <div className="bg-white rounded-2xl shadow-2xl w-[440px] p-6">
            <div className="flex justify-between items-center mb-5">
              <h3 className="font-bold text-gray-900 text-lg">{editing ? 'Edit Category' : 'Add Patient Category'}</h3>
              <button onClick={() => setModalOpen(false)} className="p-1.5 hover:bg-gray-100 rounded-lg"><X size={16} /></button>
            </div>
            <div className="space-y-4">
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Category Name <span className="text-red-500">*</span></label>
                <input className="input-field" value={form.PcgName} onChange={e => setForm({ ...form, PcgName: e.target.value })} placeholder="e.g. General, Insurance, VIP" autoFocus />
              </div>
              <div className="grid grid-cols-3 gap-2">
                {[['PcgDiscAllowed', 'Discount'], ['PcgInfAllowed', 'Inform'], ['PcgDefAllowed', 'Deferred']].map(([k, l]) => (
                  <label key={k} className="flex items-center gap-2 text-sm text-gray-700 cursor-pointer p-2 rounded-lg border border-medical-border hover:bg-gray-50">
                    <input type="checkbox" checked={!!form[k]} onChange={e => setForm({ ...form, [k]: e.target.checked })} className="rounded border-medical-border text-blue-600" />
                    {l}
                  </label>
                ))}
              </div>
              {form.PcgDiscAllowed && (
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">Default Discount %</label>
                  <input type="number" min={0} max={100} step={0.5} className="input-field w-32" value={form.PcgDiscPer} onChange={e => setForm({ ...form, PcgDiscPer: Number(e.target.value) })} />
                </div>
              )}
            </div>
            <div className="flex gap-3 justify-end mt-6">
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

// ─────────────────────────────────────────────────────────
// Area Master — Name + Station Link
// ─────────────────────────────────────────────────────────

function AreaMasterPage() {
  const qc = useQueryClient();
  const { data: areas = [], isLoading } = useQuery({ queryKey: ['areas'], queryFn: async () => (await api.get<any[]>('/masters/areas')).data });
  const { data: stations = [] } = useQuery({ queryKey: ['stations'], queryFn: async () => (await api.get<any[]>('/masters/stations')).data });

  const createMut = useMutation({ mutationFn: (b: any) => api.post('/masters/areas', b).then(r => r.data), onSuccess: () => qc.invalidateQueries({ queryKey: ['areas'] }) });
  const updateMut = useMutation({ mutationFn: ({ id, body }: any) => api.put(`/masters/areas/${id}`, body).then(r => r.data), onSuccess: () => qc.invalidateQueries({ queryKey: ['areas'] }) });
  const deleteMut = useMutation({ mutationFn: (id: number) => api.delete(`/masters/areas/${id}`).then(r => r.data), onSuccess: () => qc.invalidateQueries({ queryKey: ['areas'] }) });

  const defaultForm = { AraName: '', AraStnCode: null };
  const [search, setSearch] = useState('');
  const [modalOpen, setModalOpen] = useState(false);
  const [editing, setEditing] = useState<any>(null);
  const [form, setForm] = useState<any>(defaultForm);

  const stnMap: Record<number, string> = {};
  (stations as any[]).forEach((s: any) => { stnMap[s.StnCode] = s.StnName; });

  const filtered = (areas as any[]).filter((a: any) => (a.AraName || '').toLowerCase().includes(search.toLowerCase()));

  const openAdd = () => { setEditing(null); setForm({ ...defaultForm }); setModalOpen(true); };
  const openEdit = (r: any) => { setEditing(r); setForm({ ...r }); setModalOpen(true); };
  const handleSave = () => {
    if (!form.AraName?.trim()) return;
    if (editing) updateMut.mutate({ id: editing.AraCode, body: form }, { onSuccess: () => setModalOpen(false) });
    else createMut.mutate(form, { onSuccess: () => setModalOpen(false) });
  };

  return (
    <div>
      <SectionHeader title="Area Master" subtitle="Patient residential areas with station linkage" />
      <div className="card">
        <div className="flex items-center justify-between mb-4">
          <div className="relative flex-1 max-w-sm">
            <Search size={15} className="absolute left-3 top-1/2 -translate-y-1/2 text-gray-400" />
            <input className="input-field !pl-9" placeholder="Search areas..." value={search} onChange={e => setSearch(e.target.value)} />
          </div>
          <button onClick={openAdd} className="btn-primary flex items-center gap-2 ml-4"><Plus size={16} /> Add Area</button>
        </div>
        {isLoading ? <p className="text-center py-8 text-gray-400">Loading...</p> :
          filtered.length === 0 ? <p className="text-center py-12 text-gray-400">No areas found.</p> : (
            <table className="w-full text-left text-sm">
              <thead className="border-b border-medical-border">
                <tr>
                  <th className="pb-3 px-2 text-xs font-semibold text-gray-500 uppercase tracking-wider">Area Name</th>
                  <th className="pb-3 px-2 text-xs font-semibold text-gray-500 uppercase tracking-wider">Station / City</th>
                  <th className="pb-3 px-2 w-20"></th>
                </tr>
              </thead>
              <tbody className="divide-y divide-gray-50">
                {filtered.map((a: any) => (
                  <tr key={a.AraCode} className="hover:bg-slate-50 group transition-colors">
                    <td className="py-3 px-2 font-medium text-gray-800">{a.AraName}</td>
                    <td className="py-3 px-2 text-gray-500">{stnMap[a.AraStnCode] || '—'}</td>
                    <td className="py-3 px-2">
                      <div className="flex gap-1 opacity-0 group-hover:opacity-100 justify-end">
                        <button onClick={() => openEdit(a)} className="p-1.5 hover:bg-blue-50 rounded-md text-blue-600"><Pencil size={14} /></button>
                        <button onClick={() => { if (confirm('Delete?')) deleteMut.mutate(a.AraCode); }} className="p-1.5 hover:bg-red-50 rounded-md text-red-500"><Trash2 size={14} /></button>
                      </div>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          )}
      </div>

      {modalOpen && (
        <div className="fixed inset-0 bg-black/40 backdrop-blur-sm flex items-center justify-center z-50">
          <div className="bg-white rounded-2xl shadow-2xl w-[400px] p-6">
            <div className="flex justify-between items-center mb-5">
              <h3 className="font-bold text-gray-900 text-lg">{editing ? 'Edit Area' : 'Add Area'}</h3>
              <button onClick={() => setModalOpen(false)} className="p-1.5 hover:bg-gray-100 rounded-lg"><X size={16} /></button>
            </div>
            <div className="space-y-4">
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Area Name <span className="text-red-500">*</span></label>
                <input className="input-field" value={form.AraName} onChange={e => setForm({ ...form, AraName: e.target.value })} placeholder="e.g. Civil Lines" autoFocus />
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Station / City</label>
                <select className="input-field" value={form.AraStnCode || ''} onChange={e => setForm({ ...form, AraStnCode: Number(e.target.value) || null })}>
                  <option value="">— Select Station —</option>
                  {(stations as any[]).map((s: any) => <option key={s.StnCode} value={s.StnCode}>{s.StnName}</option>)}
                </select>
              </div>
            </div>
            <div className="flex gap-3 justify-end mt-6">
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

// ─────────────────────────────────────────────────────────
// Diagnostics Master (Master-Detail)
// ─────────────────────────────────────────────────────────

function DiagnosticsMasterPage() {
  const qc = useQueryClient();
  const { data: records = [], isLoading } = useQuery({ queryKey: ['diagnostics'], queryFn: async () => (await api.get<any[]>('/masters/diagnostics')).data });
  const { data: services = [] } = useQuery({ queryKey: ['services'], queryFn: async () => (await api.get<any[]>('/masters/services')).data });

  const createMut = useMutation({ mutationFn: (b: any) => api.post('/masters/diagnostics', b).then(r => r.data), onSuccess: () => qc.invalidateQueries({ queryKey: ['diagnostics'] }) });
  const updateMut = useMutation({ mutationFn: ({ id, body }: any) => api.put(`/masters/diagnostics/${id}`, body).then(r => r.data), onSuccess: () => qc.invalidateQueries({ queryKey: ['diagnostics'] }) });
  const deleteMut = useMutation({ mutationFn: (id: number) => api.delete(`/masters/diagnostics/${id}`).then(r => r.data), onSuccess: () => qc.invalidateQueries({ queryKey: ['diagnostics'] }) });

  const srvMap: Record<number, any> = {};
  (services as any[]).forEach((s: any) => { srvMap[s.SrvCode] = s; });

  const [search, setSearch] = useState('');
  const [modalOpen, setModalOpen] = useState(false);
  const [editing, setEditing] = useState<any>(null);
  const [formName, setFormName] = useState('');
  const [diagServices, setDiagServices] = useState<any[]>([]);
  const [newSrv, setNewSrv] = useState({ DsmSrvCode: '', DsmUnit: 1, DsmRate: 0 });

  const filtered = (records as any[]).filter((r: any) => (r.DigName || '').toLowerCase().includes(search.toLowerCase()));

  const openAdd = () => { setEditing(null); setFormName(''); setDiagServices([]); setModalOpen(true); };
  
  const openEdit = async (r: any) => {
    setEditing(r);
    setFormName(r.DigName);
    try {
      const res = await api.get(`/masters/diag-services/${r.DigCode}`);
      setDiagServices(res.data);
    } catch (e) {
      setDiagServices([]);
    }
    setModalOpen(true);
  };

  const addSrvToDiag = () => {
    if (!newSrv.DsmSrvCode) return;
    const srvCode = Number(newSrv.DsmSrvCode);
    const existing = diagServices.find(s => s.DsmSrvCode === srvCode);
    if (existing) return;
    setDiagServices([...diagServices, { DsmSrvCode: srvCode, DsmUnit: newSrv.DsmUnit, DsmRate: newSrv.DsmRate, isNew: true }]);
    setNewSrv({ DsmSrvCode: '', DsmUnit: 1, DsmRate: 0 });
  };

  const removeSrv = async (idx: number, srv: any) => {
    if (srv.DsmCode) {
      if (!confirm('Remove this service from diagnosis?')) return;
      await api.delete(`/masters/diag-services/${srv.DsmCode}`);
    }
    setDiagServices(diagServices.filter((_, i) => i !== idx));
  };

  const handleSave = async () => {
    if (!formName.trim()) return;
    let digCode = editing?.DigCode;
    
    if (editing) {
      await updateMut.mutateAsync({ id: digCode, body: { DigName: formName } });
    } else {
      const res = await createMut.mutateAsync({ DigName: formName });
      digCode = res.DigCode;
    }
    
    // Save new services
    for (const srv of diagServices) {
      if (srv.isNew || !srv.DsmCode) {
        await api.post('/masters/diag-services', { DsmDigCode: digCode, DsmSrvCode: srv.DsmSrvCode, DsmUnit: srv.DsmUnit, DsmRate: srv.DsmRate });
      }
    }
    setModalOpen(false);
    qc.invalidateQueries({ queryKey: ['diagnostics'] });
  };

  return (
    <div>
      <SectionHeader title="Diagnosis Master" subtitle="Diagnoses linked with specific tests and services" />
      <div className="card">
        <div className="flex items-center justify-between mb-4">
          <div className="relative flex-1 max-w-sm">
            <Search size={15} className="absolute left-3 top-1/2 -translate-y-1/2 text-gray-400" />
            <input className="input-field !pl-9" placeholder="Search diagnoses..." value={search} onChange={e => setSearch(e.target.value)} />
          </div>
          <button onClick={openAdd} className="btn-primary flex items-center gap-2 ml-4"><Plus size={16} /> Add Diagnosis</button>
        </div>
        {isLoading ? <p className="text-center py-8 text-gray-400">Loading...</p> :
          filtered.length === 0 ? <p className="text-center py-12 text-gray-400">No records found.</p> : (
            <table className="w-full text-left text-sm">
              <thead className="border-b border-medical-border">
                <tr>
                  <th className="pb-3 px-2 text-xs font-semibold text-gray-500 uppercase tracking-wider">#</th>
                  <th className="pb-3 px-2 text-xs font-semibold text-gray-500 uppercase tracking-wider">Diagnosis Name</th>
                  <th className="pb-3 px-2 w-20"></th>
                </tr>
              </thead>
              <tbody className="divide-y divide-gray-50">
                {filtered.map((r: any, i) => (
                  <tr key={r.DigCode} className="hover:bg-slate-50 group transition-colors">
                    <td className="py-3 px-2 text-gray-500">{i + 1}</td>
                    <td className="py-3 px-2 font-medium text-gray-800">{r.DigName}</td>
                    <td className="py-3 px-2">
                      <div className="flex gap-1 opacity-0 group-hover:opacity-100 justify-end">
                        <button onClick={() => openEdit(r)} className="p-1.5 hover:bg-blue-50 rounded-md text-blue-600"><Pencil size={14} /></button>
                        <button onClick={() => { if (confirm('Delete?')) deleteMut.mutate(r.DigCode); }} className="p-1.5 hover:bg-red-50 rounded-md text-red-500"><Trash2 size={14} /></button>
                      </div>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          )}
      </div>

      {modalOpen && (
        <div className="fixed inset-0 bg-black/40 backdrop-blur-sm flex items-center justify-center z-50 p-4">
          <div className="bg-white rounded-2xl shadow-2xl w-full max-w-2xl max-h-[90vh] flex flex-col">
            <div className="flex justify-between items-center px-6 py-5 border-b border-medical-border shrink-0">
              <h3 className="font-bold text-gray-900 text-lg">{editing ? 'Edit Diagnosis' : 'Add Diagnosis'}</h3>
              <button onClick={() => setModalOpen(false)} className="p-1.5 hover:bg-gray-100 rounded-lg"><X size={16} /></button>
            </div>
            <div className="overflow-y-auto p-6 space-y-6">
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Diagnosis Name <span className="text-red-500">*</span></label>
                <input className="input-field" value={formName} onChange={e => setFormName(e.target.value)} autoFocus />
              </div>
              
              <div>
                <h4 className="text-sm font-bold text-gray-800 mb-3 border-b pb-2">Linked Services / Tests</h4>
                <div className="flex gap-2 items-end mb-4">
                  <div className="flex-1">
                    <label className="block text-xs font-medium text-gray-600 mb-1">Service</label>
                    <select className="input-field" value={newSrv.DsmSrvCode} onChange={e => {
                      const sc = Number(e.target.value);
                      const s = srvMap[sc];
                      setNewSrv({ ...newSrv, DsmSrvCode: e.target.value, DsmRate: s ? s.SrvCharges : 0 });
                    }}>
                      <option value="">— Select Service —</option>
                      {(services as any[]).map(s => <option key={s.SrvCode} value={s.SrvCode}>{s.SrvName}</option>)}
                    </select>
                  </div>
                  <div className="w-20">
                    <label className="block text-xs font-medium text-gray-600 mb-1">Unit</label>
                    <input type="number" min={1} className="input-field" value={newSrv.DsmUnit} onChange={e => setNewSrv({ ...newSrv, DsmUnit: Number(e.target.value) })} />
                  </div>
                  <div className="w-28">
                    <label className="block text-xs font-medium text-gray-600 mb-1">Rate (₹)</label>
                    <input type="number" min={0} className="input-field" value={newSrv.DsmRate} onChange={e => setNewSrv({ ...newSrv, DsmRate: Number(e.target.value) })} />
                  </div>
                  <button onClick={addSrvToDiag} disabled={!newSrv.DsmSrvCode} className="btn-primary px-3 py-2 mb-[1px]"><Plus size={16} /></button>
                </div>
                
                {diagServices.length > 0 ? (
                  <table className="w-full text-left text-sm border">
                    <thead className="bg-gray-50 border-b">
                      <tr>
                        <th className="p-2 font-medium text-gray-600">Service</th>
                        <th className="p-2 font-medium text-gray-600 w-20 text-center">Unit</th>
                        <th className="p-2 font-medium text-gray-600 w-28 text-right">Rate (₹)</th>
                        <th className="p-2 w-12"></th>
                      </tr>
                    </thead>
                    <tbody className="divide-y">
                      {diagServices.map((s, i) => (
                        <tr key={i} className="hover:bg-gray-50">
                          <td className="p-2">{srvMap[s.DsmSrvCode]?.SrvName || 'Unknown'} {s.isNew && <span className="text-[10px] text-green-600 bg-green-50 px-1 rounded ml-2">New</span>}</td>
                          <td className="p-2 text-center">{s.DsmUnit}</td>
                          <td className="p-2 text-right">₹{s.DsmRate}</td>
                          <td className="p-2 text-center">
                            <button onClick={() => removeSrv(i, s)} className="text-red-500 hover:bg-red-50 p-1 rounded"><X size={14}/></button>
                          </td>
                        </tr>
                      ))}
                    </tbody>
                  </table>
                ) : <p className="text-xs text-gray-400 italic">No services linked to this diagnosis.</p>}
              </div>
            </div>
            <div className="flex gap-3 justify-end px-6 py-4 border-t border-medical-border bg-gray-50 rounded-b-2xl shrink-0">
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

// ─────────────────────────────────────────────────────────
// Main HospitalMasters with sidebar navigation
// ─────────────────────────────────────────────────────────

import { PartyMasterPage, SubItemMasterPage } from './Phase2Masters';

const navGroups = [
  {
    label: 'Patients',
    items: [
      { path: '/masters/patients', label: 'Patient Master', icon: <User size={16} /> },
      { path: '/masters/patient-categories', label: 'Patient Category', icon: <UserCheck size={16} /> },
    ]
  },
  {
    label: 'Doctors & Referrals',
    items: [
      { path: '/masters/doctors', label: 'Doctor Master', icon: <Stethoscope size={16} /> },
      { path: '/masters/doctor-categories', label: 'Doctor Category', icon: <Tag size={16} /> },
      { path: '/masters/doctor-roles', label: 'Doctor Role', icon: <Tag size={16} /> },
      { path: '/masters/ref-bys', label: 'Referred-By', icon: <User size={16} /> },
      { path: '/masters/ref-tos', label: 'Referred-To', icon: <User size={16} /> },
      { path: '/masters/ref-categories', label: 'Referral Category', icon: <Tag size={16} /> },
    ]
  },
  {
    label: 'Facility',
    items: [
      { path: '/masters/floors', label: 'Floor Master', icon: <Building2 size={16} /> },
      { path: '/masters/wards', label: 'Ward Master', icon: <Building2 size={16} /> },
      { path: '/masters/beds', label: 'Bed Master', icon: <Bed size={16} /> },
    ]
  },
  {
    label: 'Services',
    items: [
      { path: '/masters/service-groups', label: 'Service Groups', icon: <Tag size={16} /> },
      { path: '/masters/services', label: 'Services & Charges', icon: <Tag size={16} /> },
    ]
  },
  {
    label: 'B2B & Inventory',
    items: [
      { path: '/masters/parties', label: 'Party Master', icon: <Building2 size={16} /> },
      { path: '/masters/party-groups', label: 'Party Groups', icon: <Tag size={16} /> },
      { path: '/masters/subitems', label: 'Sub-Items', icon: <FlaskConical size={16} /> },
      { path: '/masters/subitem-groups', label: 'Sub-Item Groups', icon: <Tag size={16} /> },
    ]
  },
  {
    label: 'Others',
    items: [
      { path: '/masters/areas', label: 'Area Master', icon: <MapPin size={16} /> },
      { path: '/masters/stations', label: 'Station Master', icon: <MapPin size={16} /> },
      { path: '/masters/diagnostics', label: 'Diagnosis Master', icon: <FlaskConical size={16} /> },
    ]
  }
];

export function HospitalMasters() {
  const location = useLocation();

  return (
    <div className="flex gap-0 h-full -mx-6 -my-6">
      {/* Left Sidebar Nav */}
      <aside className="w-56 border-r border-medical-border bg-gray-50/50 flex-shrink-0 overflow-y-auto py-4 px-2">
        <div className="px-3 mb-4">
          <h1 className="text-sm font-bold text-gray-900">Hospital Masters</h1>
          <p className="text-xs text-gray-400 mt-0.5">System Configuration</p>
        </div>
        {navGroups.map((group) => (
          <div key={group.label} className="mb-4">
            <p className="px-3 mb-1 text-[10px] font-bold text-gray-400 uppercase tracking-wider">{group.label}</p>
            <ul className="space-y-0.5">
              {group.items.map((item) => {
                const isActive = location.pathname === item.path;
                return (
                  <li key={item.path}>
                    <NavLink
                      to={item.path}
                      className={`flex items-center gap-2.5 px-3 py-2 rounded-lg text-sm transition-colors ${isActive ? 'bg-blue-600 text-white font-medium shadow-sm' : 'text-gray-600 hover:bg-white hover:text-gray-900'}`}
                    >
                      <span className={isActive ? 'text-white' : 'text-gray-400'}>{item.icon}</span>
                      <span>{item.label}</span>
                      {isActive && <ChevronRight size={12} className="ml-auto" />}
                    </NavLink>
                  </li>
                );
              })}
            </ul>
          </div>
        ))}
      </aside>

      {/* Main Content */}
      <main className="flex-1 overflow-y-auto p-6">
        <Routes>
          <Route index element={<Navigate to="/masters/patients" replace />} />
          <Route path="patients" element={<PatientMasterPage />} />
          <Route path="patient-categories" element={<PatCategoryPage />} />
          <Route path="doctors" element={<DoctorMasterPage path="doctors" pk="DctCode" title="Doctor Master" subtitle="Internal hospital doctors with specializations and revenue share" catPath="doct-categories" catPk="DcgCode" catNameField="DcgName" hasRole={true} />} />
          <Route path="doctor-categories" element={<SimpleListPage title="Doctor Category" subtitle="Classification categories for doctors" path="doct-categories" pk="DcgCode" nameField="DcgName" />} />
          <Route path="doctor-roles" element={<SimpleListPage title="Doctor Role" subtitle="Functional roles assigned to doctors" path="doct-roles" pk="DrlCode" nameField="DrlName" />} />
          <Route path="ref-bys" element={<DoctorMasterPage path="ref-bys" pk="RByCode" title="Referred-By Doctors" subtitle="External doctors who refer patients to this hospital" catPath="ref-categories" catPk="RfgCode" catNameField="RfgName" />} />
          <Route path="ref-tos" element={<DoctorMasterPage path="ref-tos" pk="RToCode" title="Referred-To Doctors" subtitle="External doctors to whom patients are referred out" catPath="ref-categories" catPk="RfgCode" catNameField="RfgName" />} />
          <Route path="ref-categories" element={<SimpleListPage title="Referral Category" subtitle="Categories for classifying referral doctors" path="ref-categories" pk="RfgCode" nameField="RfgName" />} />
          <Route path="floors" element={<SimpleListPage title="Floor Master" subtitle="Hospital floors / levels" path="floors" pk="FlrCode" nameField="FlrName" showInListKey="FlrShowInList" />} />
          <Route path="wards" element={<SimpleListPage title="Ward Master" subtitle="Ward sections within floors" path="wards" pk="WrdCode" nameField="WrdName" showInListKey="WrdShowInList" />} />
          <Route path="beds" element={<BedMasterPage />} />
          <Route path="service-groups" element={<ServiceGroupMasterPage />} />
          <Route path="services" element={<ServiceMasterPage />} />
          <Route path="areas" element={<AreaMasterPage />} />
          <Route path="stations" element={<SimpleListPage title="Station Master" subtitle="Locality stations within areas" path="stations" pk="StnCode" nameField="StnName" showInListKey="StnShowInList" />} />
          <Route path="diagnostics" element={<DiagnosticsMasterPage />} />
          <Route path="party-groups" element={<SimpleListPage title="Party Group" subtitle="Categories of external parties" path="party-groups" pk="PgmCode" nameField="PgmName" />} />
          <Route path="parties" element={<PartyMasterPage />} />
          <Route path="subitem-groups" element={<SimpleListPage title="Sub-Item Group" subtitle="Categories of inventory/consumable items" path="subitem-groups" pk="SigCode" nameField="SigName" />} />
          <Route path="subitems" element={<SubItemMasterPage />} />
          <Route path="*" element={<Navigate to="/masters/patients" replace />} />
        </Routes>
      </main>
    </div>
  );
}


