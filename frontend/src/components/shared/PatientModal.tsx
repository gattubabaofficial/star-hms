import React, { useState, useEffect, useRef } from 'react';
import { useQuery } from '@tanstack/react-query';
import api from '../../lib/api';
import { Modal } from '../ui/Modal';
import { useFormKeyboard } from '../../lib/useFormKeyboard';
import { useFormValidation } from '../../lib/useFormValidation';

interface PatientModalProps {
  isOpen: boolean;
  onClose: () => void;
  onSave: (patientCode: number) => void;
  initialName?: string;
  defaultType?: 'Indoor' | 'Outdoor';
}

export const PatientModal: React.FC<PatientModalProps> = ({ isOpen, onClose, onSave, initialName = '', defaultType = 'Outdoor' }) => {
  const formRef = useRef<HTMLFormElement>(null);
  useFormKeyboard(formRef, { autoFocus: true });
  useFormValidation(formRef);

  const [loading, setLoading] = useState(false);
  const [formData, setFormData] = useState({
    PttName: initialName,
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

  useEffect(() => {
    if (isOpen) {
      setFormData(prev => ({
        ...prev,
        PttName: initialName,
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
      }));
    }
  }, [isOpen, initialName]);

  const { data: areas } = useQuery({ queryKey: ['areas'], queryFn: async () => (await api.get<any[]>('/masters/areas')).data });
  const { data: stations } = useQuery({ queryKey: ['stations'], queryFn: async () => (await api.get<any[]>('/masters/stations')).data });
  const { data: categories } = useQuery({ queryKey: ['pat-categories'], queryFn: async () => (await api.get<any[]>('/masters/pat-categories')).data });

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setLoading(true);
    try {
      const payload = {
        ...formData,
        PttDob: formData.PttDob ? formData.PttDob : null
      };
      const res = await api.post('/masters/patients', payload);
      onSave(res.data.PttCode);
      onClose();
    } catch (err) {
      alert('Failed to create patient');
    } finally {
      setLoading(false);
    }
  };

  return (
    <Modal isOpen={isOpen} onClose={onClose} title="Register New Patient">
      <form ref={formRef} onSubmit={handleSubmit} className="space-y-4 max-h-[80vh] overflow-y-auto px-1">
        <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">Name <span className="text-red-500">*</span></label>
            <input 
              type="text" 
              className="input-field" 
              value={formData.PttName}
              onChange={e => setFormData({...formData, PttName: e.target.value})}
              required
            />
          </div>
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">Sex <span className="text-red-500">*</span></label>
            <select 
              className="input-field" 
              value={formData.PttSex}
              onChange={e => setFormData({...formData, PttSex: e.target.value})}
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
              value={formData.PttDob}
              onChange={e => setFormData({...formData, PttDob: e.target.value})}
            />
          </div>
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">Mobile</label>
            <input 
              type="text" 
              className="input-field" 
              value={formData.PttTelNo}
              onChange={e => setFormData({...formData, PttTelNo: e.target.value})}
            />
          </div>
          <div className="md:col-span-2">
            <label className="block text-sm font-medium text-gray-700 mb-1">Address</label>
            <textarea 
              className="input-field" 
              value={formData.PttAddr}
              onChange={e => setFormData({...formData, PttAddr: e.target.value})}
              rows={2}
            />
          </div>
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">Category</label>
            <select 
              className="input-field" 
              value={formData.PttPcgCode || ''}
              onChange={e => setFormData({...formData, PttPcgCode: e.target.value ? Number(e.target.value) : null})}
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
              value={formData.PttAraCode || ''}
              onChange={e => setFormData({...formData, PttAraCode: e.target.value ? Number(e.target.value) : null})}
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
              value={formData.PttStnCode || ''}
              onChange={e => setFormData({...formData, PttStnCode: e.target.value ? Number(e.target.value) : null})}
            >
              <option value="">Select Station</option>
              {stations?.map(s => (
                <option key={s.StnCode} value={s.StnCode}>{s.StnName}</option>
              ))}
            </select>
          </div>
        </div>

        <div className="bg-gray-50 p-4 rounded-md border border-gray-150 space-y-3 mt-4">
          <h4 className="text-xs font-semibold text-gray-500 uppercase tracking-wider">Patient Rules & Discounts</h4>
          <div className="grid grid-cols-3 gap-2">
            <label className="flex items-center gap-1.5 text-xs text-gray-700 select-none">
              <input type="checkbox" checked={formData.PttInfAllowed} onChange={e => setFormData({...formData, PttInfAllowed: e.target.checked})} className="rounded border-medical-border text-medical-primary h-3.5 w-3.5" />
              Influenza Allowed
            </label>
            <label className="flex items-center gap-1.5 text-xs text-gray-700 select-none">
              <input type="checkbox" checked={formData.PttDefAllowed} onChange={e => setFormData({...formData, PttDefAllowed: e.target.checked})} className="rounded border-medical-border text-medical-primary h-3.5 w-3.5" />
              Default Allowed
            </label>
            <label className="flex items-center gap-1.5 text-xs text-gray-700 select-none">
              <input type="checkbox" checked={formData.PttDiscAllowed} onChange={e => setFormData({...formData, PttDiscAllowed: e.target.checked})} className="rounded border-medical-border text-medical-primary h-3.5 w-3.5" />
              Discount Allowed
            </label>
          </div>

          <div className="pt-1">
            <label className="block text-xs font-medium text-gray-700 mb-1">Discount %</label>
            <input 
              type="number" 
              step="0.01"
              disabled={!formData.PttDiscAllowed}
              value={formData.PttDiscPer}
              onChange={e => setFormData({...formData, PttDiscPer: parseFloat(e.target.value) || 0.0})}
              className="w-full px-2.5 py-1.5 text-sm border border-medical-border rounded-md focus:outline-none focus:ring-1 focus:ring-medical-primary bg-white disabled:bg-gray-100 disabled:text-gray-400"
            />
          </div>
        </div>

        <div className="flex justify-end gap-3 pt-4 border-t border-medical-border">
          <button type="button" onClick={onClose} className="btn-secondary px-4">Cancel</button>
          <button type="submit" disabled={loading} className="btn-primary px-4">
            {loading ? 'Saving...' : 'Save Patient'}
          </button>
        </div>
      </form>
    </Modal>
  );
};


