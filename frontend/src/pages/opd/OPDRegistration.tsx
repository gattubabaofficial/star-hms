import { useState, useEffect } from 'react';
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import { useNavigate } from 'react-router-dom';
import api from '../../lib/api';
import { Save, ArrowLeft } from 'lucide-react';
import { SearchableSelectWithCreate } from '../../components/ui/SearchableSelectWithCreate';

export function OPDRegistration() {
  const queryClient = useQueryClient();
  const navigate = useNavigate();
  const [formData, setFormData] = useState({
    OpgDate: new Date().toISOString().split('T')[0],
    OpgPttCode: null as number | null,
    OpgCDctCode: null as number | null,
    OpgPDigCode: null as number | null,
    OpgRate: 500,
    OpgDiscPer: 0,
    OpgDiscAmt: 0,
    OpgAmtAftDisc: 500,
    OpgRemark: ''
  });

  const { data: patients } = useQuery({ queryKey: ['patients'], queryFn: async () => (await api.get<any[]>('/masters/patients')).data });
  const { data: doctors } = useQuery({ queryKey: ['doctors'], queryFn: async () => (await api.get<any[]>('/masters/doctors')).data });
  const { data: diagnostics } = useQuery({ queryKey: ['diagnostics'], queryFn: async () => (await api.get<any[]>('/masters/diagnostics')).data });

  const patientOpts = patients?.map(p => ({ value: p.PttCode, label: `${p.PttName}${p.PttMobile ? ` (${p.PttMobile})` : ''}` })) || [];
  const doctorOpts = doctors?.map(d => ({ value: d.DctCode, label: d.DctName })) || [];
  const diagOpts = diagnostics?.map(d => ({ value: d.DigCode, label: d.DigName })) || [];

  const createPatient = async (name: string) => {
    let finalName = name;
    if (!finalName || !finalName.trim()) {
      const input = window.prompt("Enter Patient Name:");
      if (!input || !input.trim()) return;
      finalName = input.trim();
    }
    
    try {
      const res = await api.post('/masters/patients', { PttName: finalName, PttSex: 'M' });
      queryClient.invalidateQueries({ queryKey: ['patients'] });
      setFormData({ ...formData, OpgPttCode: res.data.PttCode });
    } catch (err) {
      alert("Failed to create patient. Please try again.");
    }
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
      setFormData({ ...formData, OpgCDctCode: res.data.DctCode });
    } catch (err) { alert("Failed to create doctor"); }
  };

  const createDiagnosis = async (name: string) => {
    let finalName = name;
    if (!finalName || !finalName.trim()) {
      const input = window.prompt("Enter Diagnosis Name:");
      if (!input || !input.trim()) return;
      finalName = input.trim();
    }
    try {
      const res = await api.post('/masters/diagnostics', { DigName: finalName });
      queryClient.invalidateQueries({ queryKey: ['diagnostics'] });
      setFormData({ ...formData, OpgPDigCode: res.data.DigCode });
    } catch (err) { alert("Failed to create diagnosis"); }
  };

  useEffect(() => {
    const discAmt = (formData.OpgRate * formData.OpgDiscPer) / 100;
    setFormData(prev => ({ ...prev, OpgDiscAmt: discAmt, OpgAmtAftDisc: prev.OpgRate - discAmt }));
  }, [formData.OpgRate, formData.OpgDiscPer]);

  const mutation = useMutation({
    mutationFn: async (data: typeof formData) => (await api.post('/opd/registrations', data)).data,
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['opd-registrations'] });
      alert('Registration successful!');
      navigate('/opd');
    }
  });

  const handleSave = (e: React.FormEvent) => {
    e.preventDefault();
    if (!formData.OpgPttCode) return alert('Select Patient');
    mutation.mutate(formData);
  };

  return (
    <div className="max-w-4xl mx-auto space-y-6">
      <div className="flex items-center gap-4">
        <button onClick={() => navigate('/opd')} className="p-2 hover:bg-gray-100 rounded-full"><ArrowLeft size={20} /></button>
        <div>
          <h1 className="text-2xl font-bold text-medical-text">OPD Registration</h1>
          <p className="text-sm text-gray-500">Create a new outpatient consultation entry</p>
        </div>
      </div>

      <div className="card">
        <form onSubmit={handleSave} className="space-y-8">
          <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Date</label>
              <input type="date" value={formData.OpgDate} onChange={e => setFormData({...formData, OpgDate: e.target.value})} className="w-full px-3 py-2 border border-gray-300 rounded-md focus:ring-medical-mutedblue focus:border-medical-mutedblue" required />
            </div>
            
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Patient <span className="text-red-500">*</span></label>
              <SearchableSelectWithCreate
                options={patientOpts}
                value={formData.OpgPttCode}
                onChange={(v) => setFormData({...formData, OpgPttCode: v as number})}
                onCreateNew={createPatient}
                placeholder="Select or Create Patient"
                createLabel="Patient"
              />
            </div>

            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Consulting Doctor</label>
              <SearchableSelectWithCreate
                options={doctorOpts}
                value={formData.OpgCDctCode}
                onChange={(v) => setFormData({...formData, OpgCDctCode: v as number})}
                onCreateNew={createDoctor}
                placeholder="Select Doctor"
                createLabel="Doctor"
              />
            </div>

            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Provisional Diagnosis</label>
              <SearchableSelectWithCreate
                options={diagOpts}
                value={formData.OpgPDigCode}
                onChange={(v) => setFormData({...formData, OpgPDigCode: v as number})}
                onCreateNew={createDiagnosis}
                placeholder="Select Diagnosis"
                createLabel="Diagnosis"
              />
            </div>
          </div>

          <div className="bg-gray-50 p-6 rounded-lg border border-gray-200">
            <h3 className="text-lg font-medium text-gray-800 mb-4">Charges & Payment</h3>
            <div className="grid grid-cols-1 md:grid-cols-4 gap-4">
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Consultation Fee (₹)</label>
                <input type="number" value={formData.OpgRate} onChange={e => setFormData({...formData, OpgRate: Number(e.target.value)})} className="w-full px-3 py-2 border border-gray-300 rounded-md" />
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Discount %</label>
                <input type="number" value={formData.OpgDiscPer} onChange={e => setFormData({...formData, OpgDiscPer: Number(e.target.value)})} className="w-full px-3 py-2 border border-gray-300 rounded-md" />
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Discount Amt (₹)</label>
                <input type="number" readOnly value={formData.OpgDiscAmt.toFixed(2)} className="w-full px-3 py-2 border border-gray-300 rounded-md bg-gray-100" />
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Net Amount (₹)</label>
                <input type="number" readOnly value={formData.OpgAmtAftDisc.toFixed(2)} className="w-full px-3 py-2 border border-gray-300 rounded-md bg-green-50 text-green-800 font-bold" />
              </div>
            </div>
          </div>

          <div className="flex justify-end gap-4 border-t border-gray-100 pt-6">
            <button type="button" onClick={() => navigate('/opd')} className="px-6 py-2 border border-gray-300 rounded-md text-gray-700 hover:bg-gray-50">Cancel</button>
            <button type="submit" disabled={mutation.isPending} className="btn-primary flex items-center gap-2 px-8">
              <Save size={18} /> Save Registration
            </button>
          </div>
        </form>
      </div>
    </div>
  );
}
