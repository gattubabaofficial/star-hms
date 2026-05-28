import { useState, useRef } from 'react';
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import { useNavigate } from 'react-router-dom';
import api from '../../lib/api';
import { Save, ArrowLeft } from 'lucide-react';
import { useFormValidation } from '../../lib/useFormValidation';
import { useFormKeyboard } from '../../lib/useFormKeyboard';
import { SearchableSelectWithCreate } from '../../components/ui/SearchableSelectWithCreate';
import { PatientModal } from '../../components/shared/PatientModal';

export function IPDAdmission() {
  const formRef = useRef<HTMLFormElement>(null);
  useFormKeyboard(formRef);
  useFormValidation(formRef);

  const [showPatientModal, setShowPatientModal] = useState(false);
  const [patientSearchTerm, setPatientSearchTerm] = useState('');

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

  const patientOpts = patients?.map(p => ({ value: p.PttCode, label: `${p.PttName}${p.PttTelNo ? ` (${p.PttTelNo})` : ''}` })) || [];
  const doctorOpts = doctors?.map(d => ({ value: d.DctCode, label: d.DctName })) || [];
  const refByOpts = refBys?.map(r => ({ value: r.RByCode, label: r.RByName })) || [];
  const wardOpts = wards?.map(w => ({ value: w.WrdCode, label: w.WrdName })) || [];
  const floorOpts = floors?.map(f => ({ value: f.FlrCode, label: f.FlrName })) || [];
  const bedOpts = beds?.map(b => ({ value: b.BdmCode, label: b.BdmName })) || [];

  const createPatient = async (name: string) => {
    setPatientSearchTerm(name);
    setShowPatientModal(true);
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
        <form ref={formRef} onSubmit={handleSave} className="space-y-8">
          <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Admission Date</label>
              <input type="date" value={formData.IhdDate} onChange={e => setFormData({...formData, IhdDate: e.target.value})} className="input-field" required />
            </div>
            
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Patient <span className="text-red-500">*</span></label>
              <SearchableSelectWithCreate options={patientOpts} value={formData.IhdPttCode} onChange={(v) => setFormData({...formData, IhdPttCode: v as number})} onCreateNew={createPatient} placeholder="Select or Create Patient" />
            </div>

            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Consulting Doctor</label>
              <SearchableSelectWithCreate options={doctorOpts} value={formData.IhdCDctCode} onChange={(v) => setFormData({...formData, IhdCDctCode: v as number})} placeholder="Select Doctor" />
            </div>

            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Referred By</label>
              <SearchableSelectWithCreate options={refByOpts} value={formData.IhdRByCode} onChange={(v) => setFormData({...formData, IhdRByCode: v as number})} placeholder="Select Refer-By" />
            </div>
          </div>

          <div className="bg-blue-50 p-6 rounded-lg border border-blue-100">
            <h3 className="text-lg font-medium text-medical-text mb-4">Bed Allocation</h3>
            <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Floor</label>
                <SearchableSelectWithCreate options={floorOpts} value={formData.IhdFlrCode} onChange={(v) => setFormData({...formData, IhdFlrCode: v as number})} placeholder="Select Floor" />
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Ward</label>
                <SearchableSelectWithCreate options={wardOpts} value={formData.IhdWrdCode} onChange={(v) => setFormData({...formData, IhdWrdCode: v as number})} placeholder="Select Ward" />
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Bed <span className="text-red-500">*</span></label>
                <SearchableSelectWithCreate options={bedOpts} value={formData.IhdBedCode} onChange={(v) => setFormData({...formData, IhdBedCode: v as number})} placeholder="Select Bed" />
              </div>
            </div>
          </div>

          <div className="bg-gray-50 p-6 rounded-lg border border-gray-200">
            <h3 className="text-lg font-medium text-gray-800 mb-4">Advance Deposit</h3>
            <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Deposit Amount (₹)</label>
                <input type="number" value={formData.IhdAdvAmt} onChange={e => setFormData({...formData, IhdAdvAmt: Number(e.target.value)})} className="input-field" />
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Remarks</label>
                <input type="text" value={formData.IhdRemark} onChange={e => setFormData({...formData, IhdRemark: e.target.value})} className="input-field" />
              </div>
            </div>
          </div>

          <div className="flex justify-end gap-4 border-t border-gray-100 pt-6">
            <button type="button" onClick={() => navigate('/ipd')} className="btn-secondary px-6">Cancel</button>
            <button type="submit" disabled={mutation.isPending} className="btn-primary flex items-center gap-2 px-8">
              <Save size={18} /> Admit Patient
            </button>
          </div>
        </form>
      </div>
      <PatientModal
        isOpen={showPatientModal}
        onClose={() => setShowPatientModal(false)}
        initialName={patientSearchTerm}
        defaultType="Indoor"
        onSave={(id) => {
          queryClient.invalidateQueries({ queryKey: ['patients'] });
          setFormData(prev => ({ ...prev, IhdPttCode: id }));
        }}
      />
    </div>
  );
}
