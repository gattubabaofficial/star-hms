import React, { useRef, useState } from 'react';
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import api from '../../lib/api';
import { Plus, Edit2, Trash2, Save, X } from 'lucide-react';
import { useFormValidation } from '../../lib/useFormValidation';
import { useFormKeyboard } from '../../lib/useFormKeyboard';
import { format } from 'date-fns';

interface ServiceRateGridProps {
  serviceId: number;
}

interface ServiceRate {
  SrmCode: number;
  SrmSrvCode: number;
  SrmRateType: string;
  SrmRefCode: number | null;
  SrmEffDate: string | null;
  SrmStartTime: number | null;
  SrmEndTime: number | null;
  SrmRate: number;
  SrmShare: number;
  SrmDiscPer: number;
  SrmBargPer: number;
}

const defaultRate: Omit<ServiceRate, 'SrmCode' | 'SrmSrvCode'> = {
  SrmRateType: 'Default',
  SrmRefCode: null,
  SrmEffDate: null,
  SrmStartTime: null,
  SrmEndTime: null,
  SrmRate: 0,
  SrmShare: 0,
  SrmDiscPer: 0,
  SrmBargPer: 0
};

export const ServiceRateGrid: React.FC<ServiceRateGridProps> = ({ serviceId }) => {
  const formRef = useRef<HTMLFormElement>(null);
  useFormKeyboard(formRef);
  useFormValidation(formRef);
  const queryClient = useQueryClient();
  const [isEditing, setIsEditing] = useState(false);
  const [formData, setFormData] = useState(defaultRate);
  const [selectedId, setSelectedId] = useState<number | null>(null);

  const { data: rates, isLoading } = useQuery({
    queryKey: ['serviceRates', serviceId],
    queryFn: async () => (await api.get<ServiceRate[]>(`/masters/service-rates/${serviceId}`)).data
  });

  // Reference lookups
  const { data: doctors } = useQuery({ queryKey: ['doctors'], queryFn: async () => (await api.get<any[]>('/masters/doctors')).data });
  const { data: patCatgs } = useQuery({ queryKey: ['pat-categories'], queryFn: async () => (await api.get<any[]>('/masters/pat-categories')).data });
  const { data: refBys } = useQuery({ queryKey: ['ref-bys'], queryFn: async () => (await api.get<any[]>('/masters/ref-bys')).data });
  const { data: refTos } = useQuery({ queryKey: ['ref-tos'], queryFn: async () => (await api.get<any[]>('/masters/ref-tos')).data });

  const createMut = useMutation({
    mutationFn: async (data: any) => (await api.post('/masters/service-rates', data)).data,
    onSuccess: () => { queryClient.invalidateQueries({ queryKey: ['serviceRates', serviceId] }); resetForm(); }
  });

  const updateMut = useMutation({
    mutationFn: async ({ id, data }: { id: number, data: any }) => (await api.put(`/masters/service-rates/${id}`, data)).data,
    onSuccess: () => { queryClient.invalidateQueries({ queryKey: ['serviceRates', serviceId] }); resetForm(); }
  });

  const deleteMut = useMutation({
    mutationFn: async (id: number) => (await api.delete(`/masters/service-rates/${id}`)).data,
    onSuccess: () => queryClient.invalidateQueries({ queryKey: ['serviceRates', serviceId] })
  });

  const handleAdd = () => { setFormData(defaultRate); setSelectedId(null); setIsEditing(true); };
  const handleEdit = (rate: ServiceRate) => { setFormData(rate); setSelectedId(rate.SrmCode); setIsEditing(true); };
  const handleDelete = (id: number) => { if (confirm('Delete this rule?')) deleteMut.mutate(id); };
  const resetForm = () => { setIsEditing(false); setSelectedId(null); setFormData(defaultRate); };

  const handleSave = (e: React.FormEvent) => {
    e.preventDefault();
    const payload = { ...formData, SrmSrvCode: serviceId };
    if (selectedId) {
      updateMut.mutate({ id: selectedId, data: payload });
    } else {
      createMut.mutate(payload);
    }
  };

  const getReferenceOptions = () => {
    switch (formData.SrmRateType) {
      case 'Doctor': return doctors?.map(d => ({ value: d.DctCode, label: d.DctName })) || [];
      case 'PatCatg': return patCatgs?.map(p => ({ value: p.PcgCode, label: p.PcgName })) || [];
      case 'RefBy': return refBys?.map(r => ({ value: r.RByCode, label: r.RByName })) || [];
      case 'RefTo': return refTos?.map(r => ({ value: r.RToCode, label: r.RToName })) || [];
      default: return [];
    }
  };

  const getReferenceName = (type: string, refCode: number | null) => {
    if (!refCode) return '-';
    switch (type) {
      case 'Doctor': return doctors?.find(d => d.DctCode === refCode)?.DctName || refCode;
      case 'PatCatg': return patCatgs?.find(p => p.PcgCode === refCode)?.PcgName || refCode;
      case 'RefBy': return refBys?.find(r => r.RByCode === refCode)?.RByName || refCode;
      case 'RefTo': return refTos?.find(r => r.RToCode === refCode)?.RToName || refCode;
      default: return '-';
    }
  };

  const formatTime = (t: number | null) => {
    if (t === null) return '-';
    const s = t.toString().padStart(4, '0');
    return `${s.slice(0,2)}:${s.slice(2,4)}`;
  };

  return (
    <div className="mt-8 border-t border-gray-200 pt-6">
      <div className="flex justify-between items-center mb-4">
        <h3 className="text-lg font-semibold text-gray-800">Hierarchical Pricing Rules</h3>
        {!isEditing && (
          <button onClick={handleAdd} className="btn-primary text-xs flex items-center gap-1 px-3 py-1.5">
            <Plus size={14} /> Add Rule
          </button>
        )}
      </div>

      {isEditing ? (
        <form ref={formRef} onSubmit={handleSave} className="bg-gray-50 p-4 rounded-md border border-gray-200 space-y-4 mb-6">
          <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
            <div>
              <label className="block text-xs font-medium text-gray-700 mb-1">Rate Type</label>
              <select 
                value={formData.SrmRateType} 
                onChange={e => setFormData({ ...formData, SrmRateType: e.target.value, SrmRefCode: null })}
                className="w-full px-2 py-1.5 border border-gray-300 rounded text-sm"
              >
                <option value="Default">Default</option>
                <option value="Doctor">Doctor-wise</option>
                <option value="PatCatg">Patient Category</option>
                <option value="RefBy">Referred By</option>
                <option value="RefTo">Referred To</option>
                <option value="Time">Time-wise</option>
              </select>
            </div>

            {['Doctor', 'PatCatg', 'RefBy', 'RefTo'].includes(formData.SrmRateType) && (
              <div>
                <label className="block text-xs font-medium text-gray-700 mb-1">Select Reference</label>
                <select 
                  value={formData.SrmRefCode || ''} 
                  onChange={e => setFormData({ ...formData, SrmRefCode: parseInt(e.target.value) || null })}
                  className="w-full px-2 py-1.5 border border-gray-300 rounded text-sm"
                  required
                >
                  <option value="">-- Select --</option>
                  {getReferenceOptions().map(opt => (
                    <option key={opt.value} value={opt.value}>{opt.label}</option>
                  ))}
                </select>
              </div>
            )}

            {formData.SrmRateType === 'Time' && (
              <>
                <div>
                  <label className="block text-xs font-medium text-gray-700 mb-1">Start Time (HHMM)</label>
                  <input 
                    type="number" 
                    placeholder="0800"
                    value={formData.SrmStartTime || ''} 
                    onChange={e => setFormData({ ...formData, SrmStartTime: parseInt(e.target.value) || null })}
                    className="w-full px-2 py-1.5 border border-gray-300 rounded text-sm"
                    required
                  />
                </div>
                <div>
                  <label className="block text-xs font-medium text-gray-700 mb-1">End Time (HHMM)</label>
                  <input 
                    type="number" 
                    placeholder="2000"
                    value={formData.SrmEndTime || ''} 
                    onChange={e => setFormData({ ...formData, SrmEndTime: parseInt(e.target.value) || null })}
                    className="w-full px-2 py-1.5 border border-gray-300 rounded text-sm"
                    required
                  />
                </div>
              </>
            )}

            <div>
              <label className="block text-xs font-medium text-gray-700 mb-1">Rate (₹)</label>
              <input 
                type="number" 
                step="0.01"
                value={formData.SrmRate} 
                onChange={e => setFormData({ ...formData, SrmRate: parseFloat(e.target.value) || 0 })}
                className="w-full px-2 py-1.5 border border-gray-300 rounded text-sm"
                required
              />
            </div>
            
            <div>
              <label className="block text-xs font-medium text-gray-700 mb-1">Discount (%)</label>
              <input 
                type="number" 
                step="0.01"
                value={formData.SrmDiscPer} 
                onChange={e => setFormData({ ...formData, SrmDiscPer: parseFloat(e.target.value) || 0 })}
                className="w-full px-2 py-1.5 border border-gray-300 rounded text-sm"
              />
            </div>
          </div>

          <div className="flex gap-2 justify-end pt-2">
            <button type="button" onClick={resetForm} className="px-3 py-1.5 border border-gray-300 rounded text-xs text-gray-700 hover:bg-gray-100 flex items-center gap-1">
              <X size={14} /> Cancel
            </button>
            <button type="submit" disabled={createMut.isPending || updateMut.isPending} className="btn-success px-3 py-1.5 text-xs flex items-center gap-1">
              <Save size={14} /> Save Rule
            </button>
          </div>
        </form>
      ) : null}

      <div className="overflow-x-auto border border-gray-200 rounded-md">
        <table className="w-full text-left text-sm whitespace-nowrap">
          <thead className="bg-gray-50 border-b border-gray-200">
            <tr>
              <th className="px-4 py-2 font-medium text-gray-600">Type</th>
              <th className="px-4 py-2 font-medium text-gray-600">Reference / Time</th>
              <th className="px-4 py-2 font-medium text-gray-600 text-right">Rate (₹)</th>
              <th className="px-4 py-2 font-medium text-gray-600 text-right">Disc (%)</th>
              <th className="px-4 py-2 font-medium text-gray-600 w-16 text-center">Action</th>
            </tr>
          </thead>
          <tbody className="divide-y divide-gray-100">
            {isLoading ? (
              <tr><td colSpan={5} className="px-4 py-4 text-center text-gray-500">Loading rules...</td></tr>
            ) : rates?.length === 0 ? (
              <tr><td colSpan={5} className="px-4 py-4 text-center text-gray-500">No specific pricing rules configured. Using base charges.</td></tr>
            ) : (
              rates?.map(rate => (
                <tr key={rate.SrmCode} className="hover:bg-gray-50">
                  <td className="px-4 py-2 font-medium text-gray-800">{rate.SrmRateType}</td>
                  <td className="px-4 py-2 text-gray-600">
                    {rate.SrmRateType === 'Time' 
                      ? `${formatTime(rate.SrmStartTime)} - ${formatTime(rate.SrmEndTime)}` 
                      : getReferenceName(rate.SrmRateType, rate.SrmRefCode)}
                  </td>
                  <td className="px-4 py-2 text-right font-medium text-medical-mutedblue">{rate.SrmRate.toFixed(2)}</td>
                  <td className="px-4 py-2 text-right text-gray-600">{rate.SrmDiscPer}%</td>
                  <td className="px-4 py-2 text-center">
                    <div className="flex justify-center gap-2">
                      <button onClick={() => handleEdit(rate)} className="text-gray-400 hover:text-medical-mutedblue" title="Edit"><Edit2 size={14} /></button>
                      <button onClick={() => handleDelete(rate.SrmCode)} className="text-gray-400 hover:text-red-500" title="Delete"><Trash2 size={14} /></button>
                    </div>
                  </td>
                </tr>
              ))
            )}
          </tbody>
        </table>
      </div>
    </div>
  );
};
