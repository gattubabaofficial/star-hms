import { useState } from 'react';
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import { useNavigate } from 'react-router-dom';
import api from '../../lib/api';
import { Save, ArrowLeft } from 'lucide-react';
import { SearchableSelectWithCreate } from '../../components/ui/SearchableSelectWithCreate';

export function IPDAdmission() {
  const queryClient = useQueryClient();
  const navigate = useNavigate();
  const [formData, setFormData] = useState({
    IhdDate: new Date().toISOString().split('T')[0],
    IhdPttCode: null as number | null,
    IhdCDctCode: null as number | null,
    IhdRByCode: null as number | null,
    IhdWrdCode: null as number | null,
    IhdFlrCode: null as number | null,
    IhdBedCode: null as number | null,
    IhdAdvAmt: 0,
    IhdRemark: ''
  });

  const { data: patients } = useQuery({ queryKey: ['patients'], queryFn: async () => (await api.get<any[]>('/masters/patients')).data });
  const { data: doctors } = useQuery({ queryKey: ['doctors'], queryFn: async () => (await api.get<any[]>('/masters/doctors')).data });
  const { data: refBys } = useQuery({ queryKey: ['ref-bys'], queryFn: async () => (await api.get<any[]>('/masters/ref-bys')).data });
  const { data: wards } = useQuery({ queryKey: ['wards'], queryFn: async () => (await api.get<any[]>('/masters/wards')).data });
  const { data: floors } = useQuery({ queryKey: ['floors'], queryFn: async () => (await api.get<any[]>('/masters/floors')).data });
  const { data: beds } = useQuery({ queryKey: ['beds'], queryFn: async () => (await api.get<any[]>('/masters/beds')).data });

  const patientOpts = patients?.map(p => ({ value: p.PttCode, label: `${p.PttName}${p.PttMobile ? ` (${p.PttMobile})` : ''}` })) || [];
  const doctorOpts = doctors?.map(d => ({ value: d.DctCode, label: d.DctName })) || [];
  const refByOpts = refBys?.map(r => ({ value: r.RByCode, label: r.RByName })) || [];
  const wardOpts = wards?.map(w => ({ value: w.WrdCode, label: w.WrdName })) || [];
  const floorOpts = floors?.map(f => ({ value: f.FlrCode, label: f.FlrName })) || [];
  const bedOpts = beds?.map(b => ({ value: b.BdmCode, label: b.BdmName })) || [];

  const createPatient = async (name: string) => {
    let finalName = name;
    if (!finalName || !finalName.trim()) {
      const input = window.prompt("Enter Patient Name:");
      if (!input || !input.trim()) return;
      finalName = input.trim();
    }
    try {
      const res = await api.post('/masters/patients', { PttName: finalName, PttType: 'Indoor', PttGender: 'M' });
      queryClient.invalidateQueries({ queryKey: ['patients'] });
      setFormData({ ...formData, IhdPttCode: res.data.PttCode });
    } catch(e) { alert("Failed to create patient"); }
  };

  const createDoctor = async (name: string) => {
    let finalName = name;
    if (!finalName || !finalName.trim()) {
      const input = window.prompt("Enter Doctor Name:");
      if (!input || !input.trim()) return;
      finalName = input.trim();
    }
    try {
      const res = await api.post('/masters/doctors', { DctName: finalName });
      queryClient.invalidateQueries({ queryKey: ['doctors'] });
      setFormData({ ...formData, IhdCDctCode: res.data.DctCode });
    } catch (e) { alert("Failed to create doctor"); }
  };

  const createRefBy = async (name: string) => {
    let finalName = name;
    if (!finalName || !finalName.trim()) {
      const input = window.prompt("Enter Referred By Name:");
      if (!input || !input.trim()) return;
      finalName = input.trim();
    }
    try {
      const res = await api.post('/masters/ref-bys', { RByName: finalName });
      queryClient.invalidateQueries({ queryKey: ['ref-bys'] });
      setFormData({ ...formData, IhdRByCode: res.data.RByCode });
    } catch (e) { alert("Failed to create referred by"); }
  };

  const createFloor = async (name: string) => {
    let finalName = name;
    if (!finalName || !finalName.trim()) {
      const input = window.prompt("Enter Floor Name (e.g. Ground Floor):");
      if (!input || !input.trim()) return;
      finalName = input.trim();
    }
    try {
      const res = await api.post('/masters/floors', { FlrName: finalName });
      queryClient.invalidateQueries({ queryKey: ['floors'] });
      setFormData({ ...formData, IhdFlrCode: res.data.FlrCode });
    } catch (e) { alert("Failed to create floor"); }
  };

  const createWard = async (name: string) => {
    let finalName = name;
    if (!finalName || !finalName.trim()) {
      const input = window.prompt("Enter Ward/Room Name (e.g. ICU, General Ward):");
      if (!input || !input.trim()) return;
      finalName = input.trim();
    }
    try {
      const res = await api.post('/masters/wards', { WrdName: finalName });
      queryClient.invalidateQueries({ queryKey: ['wards'] });
      setFormData({ ...formData, IhdWrdCode: res.data.WrdCode });
    } catch (e) { alert("Failed to create ward"); }
  };

  const createBed = async (name: string) => {
    let finalName = name;
    if (!finalName || !finalName.trim()) {
      const input = window.prompt("Enter Bed Name/Number (e.g. Bed-01):");
      if (!input || !input.trim()) return;
      finalName = input.trim();
    }
    try {
      const res = await api.post('/masters/beds', { 
        BdmName: finalName,
        BdmFlrCode: formData.IhdFlrCode,
        BdmWrdCode: formData.IhdWrdCode
      });
      queryClient.invalidateQueries({ queryKey: ['beds'] });
      setFormData({ ...formData, IhdBedCode: res.data.BdmCode });
    } catch (e) { alert("Failed to create bed"); }
  };

  const mutation = useMutation({
    mutationFn: async (data: typeof formData) => (await api.post('/ipd/admissions', data)).data,
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['ipd-admissions'] });
      alert('Patient admitted successfully!');
      navigate('/ipd');
    }
  });

  const handleSave = (e: React.FormEvent) => {
    e.preventDefault();
    if (!formData.IhdPttCode) return alert('Select Patient');
    if (!formData.IhdBedCode) return alert('Select Bed to allocate');
    mutation.mutate(formData);
  };

  return (
    <div className="max-w-4xl mx-auto space-y-6">
      <div className="flex items-center gap-4">
        <button onClick={() => navigate('/ipd')} className="p-2 hover:bg-gray-100 rounded-full"><ArrowLeft size={20} /></button>
        <div>
          <h1 className="text-2xl font-bold text-medical-text">IPD Admission</h1>
          <p className="text-sm text-gray-500">Admit a patient and allocate a bed</p>
        </div>
      </div>

      <div className="card">
        <form onSubmit={handleSave} className="space-y-8">
          <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Admission Date</label>
              <input type="date" value={formData.IhdDate} onChange={e => setFormData({...formData, IhdDate: e.target.value})} className="w-full px-3 py-2 border border-gray-300 rounded-md focus:ring-medical-mutedblue focus:border-medical-mutedblue" required />
            </div>
            
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Patient <span className="text-red-500">*</span></label>
              <SearchableSelectWithCreate options={patientOpts} value={formData.IhdPttCode} onChange={(v) => setFormData({...formData, IhdPttCode: v as number})} onCreateNew={createPatient} placeholder="Select or Create Patient" />
            </div>

            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Consulting Doctor</label>
              <SearchableSelectWithCreate options={doctorOpts} value={formData.IhdCDctCode} onChange={(v) => setFormData({...formData, IhdCDctCode: v as number})} onCreateNew={createDoctor} placeholder="Select Doctor" createLabel="Doctor" />
            </div>

            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Referred By</label>
              <SearchableSelectWithCreate options={refByOpts} value={formData.IhdRByCode} onChange={(v) => setFormData({...formData, IhdRByCode: v as number})} onCreateNew={createRefBy} placeholder="Select Refer-By" createLabel="Referred By" />
            </div>
          </div>

          <div className="bg-blue-50 p-6 rounded-lg border border-blue-100">
            <h3 className="text-lg font-medium text-medical-text mb-4">Bed Allocation</h3>
            <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Floor</label>
                <SearchableSelectWithCreate options={floorOpts} value={formData.IhdFlrCode} onChange={(v) => setFormData({...formData, IhdFlrCode: v as number})} onCreateNew={createFloor} placeholder="Select Floor" createLabel="Floor" />
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Ward</label>
                <SearchableSelectWithCreate options={wardOpts} value={formData.IhdWrdCode} onChange={(v) => setFormData({...formData, IhdWrdCode: v as number})} onCreateNew={createWard} placeholder="Select Ward" createLabel="Ward" />
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Bed <span className="text-red-500">*</span></label>
                <SearchableSelectWithCreate options={bedOpts} value={formData.IhdBedCode} onChange={(v) => setFormData({...formData, IhdBedCode: v as number})} onCreateNew={createBed} placeholder="Select Bed" createLabel="Bed" />
              </div>
            </div>
          </div>

          <div className="bg-gray-50 p-6 rounded-lg border border-gray-200">
            <h3 className="text-lg font-medium text-gray-800 mb-4">Advance Deposit</h3>
            <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Deposit Amount (₹)</label>
                <input type="number" value={formData.IhdAdvAmt} onChange={e => setFormData({...formData, IhdAdvAmt: Number(e.target.value)})} className="w-full px-3 py-2 border border-gray-300 rounded-md" />
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Remarks</label>
                <input type="text" value={formData.IhdRemark} onChange={e => setFormData({...formData, IhdRemark: e.target.value})} className="w-full px-3 py-2 border border-gray-300 rounded-md" />
              </div>
            </div>
          </div>

          <div className="flex justify-end gap-4 border-t border-gray-100 pt-6">
            <button type="button" onClick={() => navigate('/ipd')} className="px-6 py-2 border border-gray-300 rounded-md text-gray-700 hover:bg-gray-50">Cancel</button>
            <button type="submit" disabled={mutation.isPending} className="btn-primary flex items-center gap-2 px-8">
              <Save size={18} /> Admit Patient
            </button>
          </div>
        </form>
      </div>
    </div>
  );
}
