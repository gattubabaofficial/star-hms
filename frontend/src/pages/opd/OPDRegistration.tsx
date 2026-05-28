import { useState, useEffect, useRef } from 'react';
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import { useNavigate } from 'react-router-dom';
import api from '../../lib/api';
import { Save, ArrowLeft } from 'lucide-react';
import { SearchableSelectWithCreate } from '../../components/ui/SearchableSelectWithCreate';
import { useFormKeyboard } from '../../lib/useFormKeyboard';
import { useFormValidation } from '../../lib/useFormValidation';
import { PatientModal } from '../../components/shared/PatientModal';

export function OPDRegistration() {
  const queryClient = useQueryClient();
  const navigate = useNavigate();
  const formRef = useRef<HTMLFormElement>(null);
  useFormKeyboard(formRef);
  useFormValidation(formRef);
  
  const [showPatientModal, setShowPatientModal] = useState(false);
  const [patientSearchTerm, setPatientSearchTerm] = useState('');

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

  const patientOpts = patients?.map(p => ({ value: p.PttCode, label: `${p.PttName}${p.PttTelNo ? ` (${p.PttTelNo})` : ''}` })) || [];
  const doctorOpts = doctors?.map(d => ({ value: d.DctCode, label: d.DctName })) || [];
  const diagOpts = diagnostics?.map(d => ({ value: d.DigCode, label: d.DigName })) || [];

  const createPatient = async (name: string) => {
    setPatientSearchTerm(name);
    setShowPatientModal(true);
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
        <form ref={formRef} onSubmit={handleSave} className="space-y-8">
          <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Date</label>
              <input type="date" value={formData.OpgDate} onChange={e => setFormData({...formData, OpgDate: e.target.value})} className="input-field" required />
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
                placeholder="Select Doctor"
              />
            </div>

            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Provisional Diagnosis</label>
              <SearchableSelectWithCreate
                options={diagOpts}
                value={formData.OpgPDigCode}
                onChange={(v) => setFormData({...formData, OpgPDigCode: v as number})}
                placeholder="Select Diagnosis"
              />
            </div>
          </div>

          <div className="bg-gray-50 p-6 rounded-lg border border-gray-200">
            <h3 className="text-lg font-medium text-gray-800 mb-4">Charges & Payment</h3>
            <div className="grid grid-cols-1 md:grid-cols-4 gap-4">
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Consultation Fee (₹)</label>
                <input type="number" value={formData.OpgRate} onChange={e => setFormData({...formData, OpgRate: Number(e.target.value)})} className="input-field" />
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Discount %</label>
                <input type="number" value={formData.OpgDiscPer} onChange={e => setFormData({...formData, OpgDiscPer: Number(e.target.value)})} className="input-field" />
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
            <button type="button" onClick={() => navigate('/opd')} className="btn-secondary px-6">Cancel</button>
            <button type="submit" disabled={mutation.isPending} className="btn-primary flex items-center gap-2 px-8">
              <Save size={18} /> Save Registration
            </button>
          </div>
        </form>
      </div>
      <PatientModal
        isOpen={showPatientModal}
        onClose={() => setShowPatientModal(false)}
        initialName={patientSearchTerm}
        defaultType="Outdoor"
        onSave={(id) => {
          queryClient.invalidateQueries({ queryKey: ['patients'] });
          setFormData(prev => ({ ...prev, OpgPttCode: id }));
        }}
      />
    </div>
  );
}
