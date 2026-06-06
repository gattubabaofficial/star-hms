import { useState, useEffect, useRef } from 'react';
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import { useNavigate } from 'react-router-dom';
import api from '../../lib/api';
import { Save, ArrowLeft } from 'lucide-react';
import { SearchableSelectWithCreate } from '../../components/ui/SearchableSelectWithCreate';
import { useFormKeyboard } from '../../lib/useFormKeyboard';
import { useFormValidation } from '../../lib/useFormValidation';

export function OPDRegistration() {
  const queryClient = useQueryClient();
  const navigate = useNavigate();
  const formRef = useRef<HTMLFormElement>(null);
  useFormKeyboard(formRef);
  useFormValidation(formRef);

  const [formData, setFormData] = useState({
    OpgDate: new Date().toISOString().split('T')[0],
    OpgPttCode: null as number | null,
    OpgCDctCode: null as number | null,
    OpgPDigCode: null as number | null,
    OpgRate: 0,
    OpgDiscPer: 0,
    OpgDiscAmt: 0,
    OpgAmtAftDisc: 0,
    OpgRemark: ''
  });

  // Patient form fields
  const [isExistingPatient, setIsExistingPatient] = useState(false);
  const [patientForm, setPatientForm] = useState({
    PttName: '',
    PttSex: 'Male',
    PttDob: '',
    PttTelNo: '',
    PttAddr: '',
    PttAraCode: null as number | null,
    PttStnCode: null as number | null,
    PttPcgCode: null as number | null,
    PttInfAllowed: false,
    PttDefAllowed: false,
    PttDiscAllowed: false,
    PttDiscPer: 0.0,
  });

  const { data: patients } = useQuery({ queryKey: ['patients'], queryFn: async () => (await api.get<any[]>('/masters/patients')).data });
  const { data: doctors } = useQuery({ queryKey: ['doctors'], queryFn: async () => (await api.get<any[]>('/masters/doctors')).data });
  const { data: diagnostics } = useQuery({ queryKey: ['diagnostics'], queryFn: async () => (await api.get<any[]>('/masters/diagnostics')).data });
  const { data: areas } = useQuery({ queryKey: ['areas'], queryFn: async () => (await api.get<any[]>('/masters/areas')).data });
  const { data: stations } = useQuery({ queryKey: ['stations'], queryFn: async () => (await api.get<any[]>('/masters/stations')).data });
  const { data: categories } = useQuery({ queryKey: ['pat-categories'], queryFn: async () => (await api.get<any[]>('/masters/pat-categories')).data });

  const patientOpts = patients?.map(p => ({ value: p.PttCode, label: `${p.PttName}${p.PttTelNo ? ` (${p.PttTelNo})` : ''}` })) || [];
  const doctorOpts = doctors?.map(d => ({ value: d.DctCode, label: d.DctName })) || [];
  const diagOpts = diagnostics?.map(d => ({ value: d.DigCode, label: d.DigName })) || [];

  // When existing patient selected, fill form from their data
  useEffect(() => {
    if (formData.OpgPttCode && patients) {
      const patient = patients.find(p => p.PttCode === formData.OpgPttCode);
      if (patient) {
        setIsExistingPatient(true);
        setPatientForm({
          PttName: patient.PttName || '',
          PttSex: patient.PttSex || 'Male',
          PttDob: patient.PttDob ? patient.PttDob.split('T')[0] : '',
          PttTelNo: patient.PttTelNo || '',
          PttAddr: patient.PttAddr || '',
          PttAraCode: patient.PttAraCode || null,
          PttStnCode: patient.PttStnCode || null,
          PttPcgCode: patient.PttPcgCode || null,
          PttInfAllowed: patient.PttInfAllowed || false,
          PttDefAllowed: patient.PttDefAllowed || false,
          PttDiscAllowed: patient.PttDiscAllowed || false,
          PttDiscPer: patient.PttDiscPer || 0.0,
        });
      }
    }
  }, [formData.OpgPttCode, patients]);

  const handleCreateNewPatient = (searchTerm: string) => {
    setIsExistingPatient(false);
    setFormData(prev => ({ ...prev, OpgPttCode: null }));
    setPatientForm({
      PttName: searchTerm,
      PttSex: 'Male',
      PttDob: '',
      PttTelNo: '',
      PttAddr: '',
      PttAraCode: null,
      PttStnCode: null,
      PttPcgCode: null,
      PttInfAllowed: false,
      PttDefAllowed: false,
      PttDiscAllowed: false,
      PttDiscPer: 0.0,
    });
  };

  const [fileCharge, setFileCharge] = useState(0);

  useEffect(() => {
    const totalRate = formData.OpgRate + fileCharge;
    const discAmt = (totalRate * formData.OpgDiscPer) / 100;
    setFormData(prev => ({ ...prev, OpgDiscAmt: discAmt, OpgAmtAftDisc: totalRate - discAmt }));
  }, [formData.OpgRate, fileCharge, formData.OpgDiscPer]);

  const mutation = useMutation({
    mutationFn: async (data: typeof formData) => {
      // If new patient, create first
      let patientCode = data.OpgPttCode;
      if (!isExistingPatient || !patientCode) {
        const patientPayload = { ...patientForm, PttDob: patientForm.PttDob || null };
        const patientRes = await api.post('/masters/patients', patientPayload);
        patientCode = patientRes.data.PttCode;
      } else {
        // Update existing patient editable fields
        const patientPayload = { ...patientForm, PttDob: patientForm.PttDob || null };
        await api.put(`/masters/patients/${patientCode}`, patientPayload);
      }

      const payload = { ...data, OpgPttCode: patientCode, OpgRate: data.OpgRate + fileCharge };
      return (await api.post('/opd/registrations', payload)).data;
    },
    onSuccess: (data) => {
      queryClient.invalidateQueries({ queryKey: ['opd-registrations'] });
      queryClient.invalidateQueries({ queryKey: ['patients'] });
      navigate('/opd/receipt', { state: { autoSelectVchNo: data.OpgVchNo, type: 'reg' } });
    }
  });

  const handleSave = (e: React.FormEvent) => {
    e.preventDefault();
    if (!formData.OpgPttCode && !patientForm.PttName.trim()) return alert('Patient name is required');
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
          {/* Date */}
          <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Date</label>
              <input type="date" value={formData.OpgDate} onChange={e => setFormData({...formData, OpgDate: e.target.value})} className="input-field" required />
            </div>
          </div>

          {/* Patient Details Section - always visible */}
          <div className="bg-blue-50 p-6 rounded-lg border border-blue-200">
            <h3 className="text-lg font-medium text-medical-text mb-4">Patient Details</h3>
            
            {/* Patient Search Dropdown */}
            <div className="mb-4">
              <label className="block text-sm font-medium text-gray-700 mb-1">Search Existing Patient</label>
              <SearchableSelectWithCreate
                options={patientOpts}
                value={formData.OpgPttCode}
                onChange={(v) => setFormData({...formData, OpgPttCode: v as number})}
                onCreateNew={handleCreateNewPatient}
                placeholder="Search patient by name or mobile..."
                createLabel="Patient"
              />
              {isExistingPatient && formData.OpgPttCode && (
                <p className="text-xs text-green-600 mt-1">✓ Existing patient selected — Name & Mobile are locked</p>
              )}
            </div>

            {/* Patient Form Fields - always shown */}
            <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Name <span className="text-red-500">*</span></label>
                <input
                  type="text"
                  className={`input-field ${isExistingPatient ? 'bg-gray-100 cursor-not-allowed' : ''}`}
                  value={patientForm.PttName}
                  onChange={e => setPatientForm({...patientForm, PttName: e.target.value})}
                  readOnly={isExistingPatient}
                  required
                />
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Sex <span className="text-red-500">*</span></label>
                <select
                  className="input-field"
                  value={patientForm.PttSex}
                  onChange={e => setPatientForm({...patientForm, PttSex: e.target.value})}
                  required
                >
                  <option value="Male">Male</option>
                  <option value="Female">Female</option>
                  <option value="Other">Other</option>
                </select>
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">DOB</label>
                <input
                  type="date"
                  className="input-field"
                  value={patientForm.PttDob}
                  onChange={e => setPatientForm({...patientForm, PttDob: e.target.value})}
                />
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Mobile</label>
                <input
                  type="text"
                  className={`input-field ${isExistingPatient ? 'bg-gray-100 cursor-not-allowed' : ''}`}
                  value={patientForm.PttTelNo}
                  onChange={e => setPatientForm({...patientForm, PttTelNo: e.target.value})}
                  readOnly={isExistingPatient}
                />
              </div>
              <div className="md:col-span-2">
                <label className="block text-sm font-medium text-gray-700 mb-1">Address</label>
                <textarea
                  className="input-field"
                  value={patientForm.PttAddr}
                  onChange={e => setPatientForm({...patientForm, PttAddr: e.target.value})}
                  rows={2}
                />
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Category</label>
                <select
                  className="input-field"
                  value={patientForm.PttPcgCode || ''}
                  onChange={e => setPatientForm({...patientForm, PttPcgCode: e.target.value ? Number(e.target.value) : null})}
                >
                  <option value="">Select Category</option>
                  {categories?.map(c => (
                    <option key={c.PcgCode} value={c.PcgCode}>{c.PcgName}</option>
                  ))}
                </select>
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Area</label>
                <select
                  className="input-field"
                  value={patientForm.PttAraCode || ''}
                  onChange={e => setPatientForm({...patientForm, PttAraCode: e.target.value ? Number(e.target.value) : null})}
                >
                  <option value="">Select Area</option>
                  {areas?.map(a => (
                    <option key={a.AraCode} value={a.AraCode}>{a.AraName}</option>
                  ))}
                </select>
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Station</label>
                <select
                  className="input-field"
                  value={patientForm.PttStnCode || ''}
                  onChange={e => setPatientForm({...patientForm, PttStnCode: e.target.value ? Number(e.target.value) : null})}
                >
                  <option value="">Select Station</option>
                  {stations?.map(s => (
                    <option key={s.StnCode} value={s.StnCode}>{s.StnName}</option>
                  ))}
                </select>
              </div>
            </div>

            {/* Patient Rules & Discounts */}
            <div className="bg-white p-4 rounded-md border border-gray-150 space-y-3 mt-4">
              <h4 className="text-xs font-semibold text-gray-500 uppercase tracking-wider">Patient Rules & Discounts</h4>
              <div className="grid grid-cols-3 gap-2">
                <label className="flex items-center gap-1.5 text-xs text-gray-700 select-none">
                  <input type="checkbox" checked={patientForm.PttInfAllowed} onChange={e => setPatientForm({...patientForm, PttInfAllowed: e.target.checked})} className="rounded border-medical-border text-medical-primary h-3.5 w-3.5" />
                  Influenza Allowed
                </label>
                <label className="flex items-center gap-1.5 text-xs text-gray-700 select-none">
                  <input type="checkbox" checked={patientForm.PttDefAllowed} onChange={e => setPatientForm({...patientForm, PttDefAllowed: e.target.checked})} className="rounded border-medical-border text-medical-primary h-3.5 w-3.5" />
                  Default Allowed
                </label>
                <label className="flex items-center gap-1.5 text-xs text-gray-700 select-none">
                  <input type="checkbox" checked={patientForm.PttDiscAllowed} onChange={e => setPatientForm({...patientForm, PttDiscAllowed: e.target.checked})} className="rounded border-medical-border text-medical-primary h-3.5 w-3.5" />
                  Discount Allowed
                </label>
              </div>
              <div className="pt-1">
                <label className="block text-xs font-medium text-gray-700 mb-1">Discount %</label>
                <input
                  type="number"
                  step="0.01"
                  disabled={!patientForm.PttDiscAllowed}
                  value={patientForm.PttDiscPer}
                  onChange={e => setPatientForm({...patientForm, PttDiscPer: parseFloat(e.target.value) || 0.0})}
                  className="w-full px-2.5 py-1.5 text-sm border border-medical-border rounded-md focus:outline-none focus:ring-1 focus:ring-medical-primary bg-white disabled:bg-gray-100 disabled:text-gray-400"
                />
              </div>
            </div>
          </div>

          {/* Doctor & Diagnosis */}
          <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Consulting Doctor</label>
              <SearchableSelectWithCreate
                options={doctorOpts}
                value={formData.OpgCDctCode}
                onChange={(v) => {
                  const dctCode = v as number;
                  const doctor = doctors?.find(d => d.DctCode === dctCode);
                  setFormData(prev => ({ 
                    ...prev, 
                    OpgCDctCode: dctCode,
                    OpgRate: doctor?.DctOpdChg || 0
                  }));
                }}
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

          {/* Charges */}
          <div className="bg-gray-50 p-6 rounded-lg border border-medical-border">
            <h3 className="text-lg font-medium text-gray-800 mb-4">Charges & Payment</h3>
            <div className="grid grid-cols-1 md:grid-cols-5 gap-4">
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Consultation (₹)</label>
                <input type="number" value={formData.OpgRate} onChange={e => setFormData({...formData, OpgRate: Number(e.target.value)})} className="input-field" />
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">File Charge (₹)</label>
                <input type="number" value={fileCharge} onChange={e => setFileCharge(Number(e.target.value))} className="input-field" />
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Discount %</label>
                <input type="number" value={formData.OpgDiscPer} onChange={e => setFormData({...formData, OpgDiscPer: Number(e.target.value)})} className="input-field" />
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Discount Amt</label>
                <input type="number" readOnly value={formData.OpgDiscAmt.toFixed(2)} className="w-full px-3 py-2 border border-medical-border rounded-md bg-gray-100" />
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Net Amount</label>
                <input type="number" readOnly value={formData.OpgAmtAftDisc.toFixed(2)} className="w-full px-3 py-2 border border-medical-border rounded-md bg-green-50 text-green-800 font-bold" />
              </div>
            </div>
          </div>

          <div className="flex justify-end gap-4 border-t border-medical-border pt-6">
            <button type="button" onClick={() => navigate('/opd')} className="btn-secondary px-6">Cancel</button>
            <button type="submit" disabled={mutation.isPending} className="btn-primary flex items-center gap-2 px-8">
              <Save size={18} /> Save Registration
            </button>
          </div>
        </form>
      </div>
    </div>
  );
}
