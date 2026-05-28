import { useState } from 'react';
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import api from '../../lib/api';
import { Bed, Users, Calendar, ArrowRight, LayoutGrid, X } from 'lucide-react';
import { Link } from 'react-router-dom';
import { Modal } from '../../components/ui/Modal';

interface IPDAdmissions {
  IhdCode: number;
  IhdVchNo: number;
  IhdDate: string;
  IhdPttCode: number;
  IhdStatus: string;
}

export function IPDDashboard() {
  const queryClient = useQueryClient();
  const [showLayoutModal, setShowLayoutModal] = useState(false);
  const [layoutForm, setLayoutForm] = useState({ floor_name: '', ward_name: '', num_beds: 5 });

  const { data: admissions, isLoading } = useQuery({
    queryKey: ['ipd-admissions'],
    queryFn: async () => (await api.get<IPDAdmissions[]>('/ipd/admissions')).data,
    refetchInterval: 30000
  });

  const layoutMutation = useMutation({
    mutationFn: async (data: typeof layoutForm) => {
      await api.post('/masters/room-layout', data);
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['floors'] });
      queryClient.invalidateQueries({ queryKey: ['wards'] });
      queryClient.invalidateQueries({ queryKey: ['beds'] });
      setShowLayoutModal(false);
      setLayoutForm({ floor_name: '', ward_name: '', num_beds: 5 });
      alert("Room layout created successfully!");
    },
    onError: () => alert("Failed to create layout")
  });

  const admittedCount = admissions?.filter(a => a.IhdStatus === 'Admitted').length || 0;
  const dischargedCount = admissions?.filter(a => a.IhdStatus === 'Discharged').length || 0;

  return (
    <div className="space-y-6">
      <div className="flex justify-between items-end">
        <div>
          <h1 className="text-2xl font-bold text-medical-text">IPD Dashboard</h1>
          <p className="text-gray-500 text-sm mt-1">Inpatient Department Overview</p>
        </div>
        <div className="flex gap-3">
          <button onClick={() => setShowLayoutModal(true)} className="btn-secondary flex items-center gap-2">
            <LayoutGrid size={18} /> Add Room Layout
          </button>
          <Link to="/ipd/admission" className="btn-primary flex items-center gap-2">
            <Bed size={18} /> New Admission
          </Link>
          <Link to="/ipd/billing" className="btn-success flex items-center gap-2">
            <ArrowRight size={18} /> IPD Billing
          </Link>
        </div>
      </div>

      <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
        <div className="card flex items-center gap-4">
          <div className="p-3 bg-blue-50 text-medical-mutedblue rounded-lg"><Bed size={24} /></div>
          <div>
            <h3 className="text-sm font-medium text-gray-500">Currently Admitted</h3>
            <p className="text-2xl font-bold text-gray-800">{admittedCount}</p>
          </div>
        </div>
        <div className="card flex items-center gap-4">
          <div className="p-3 bg-green-50 text-green-600 rounded-lg"><Users size={24} /></div>
          <div>
            <h3 className="text-sm font-medium text-gray-500">Discharged</h3>
            <p className="text-2xl font-bold text-gray-800">{dischargedCount}</p>
          </div>
        </div>
      </div>

      <div className="card">
        <div className="flex items-center gap-2 mb-4">
          <Calendar size={18} className="text-gray-500" />
          <h2 className="text-lg font-semibold text-gray-800">Recent Admissions</h2>
        </div>
        <div className="overflow-x-auto">
          <table className="w-full text-left border-collapse">
            <thead>
              <tr className="border-b border-gray-200 bg-gray-50">
                <th className="py-3 px-4 font-medium text-sm text-gray-600">Vch No</th>
                <th className="py-3 px-4 font-medium text-sm text-gray-600">Date</th>
                <th className="py-3 px-4 font-medium text-sm text-gray-600">Patient ID</th>
                <th className="py-3 px-4 font-medium text-sm text-gray-600 text-right">Status</th>
              </tr>
            </thead>
            <tbody>
              {isLoading ? (
                <tr><td colSpan={4} className="py-8 text-center text-gray-500">Loading...</td></tr>
              ) : admissions?.length === 0 ? (
                <tr><td colSpan={4} className="py-8 text-center text-gray-500">No admissions found.</td></tr>
              ) : (
                admissions?.map((adm) => (
                  <tr key={adm.IhdCode} className="border-b border-gray-50 hover:bg-gray-50">
                    <td className="py-3 px-4 text-sm text-gray-800">IPD-{adm.IhdVchNo}</td>
                    <td className="py-3 px-4 text-sm text-gray-600">{adm.IhdDate}</td>
                    <td className="py-3 px-4 text-sm font-medium text-medical-mutedblue">PTT-{adm.IhdPttCode}</td>
                    <td className="py-3 px-4 text-sm font-semibold text-right">
                      <span className={`px-2 py-1 rounded-full text-xs ${adm.IhdStatus === 'Admitted' ? 'bg-blue-100 text-blue-800' : 'bg-green-100 text-green-800'}`}>
                        {adm.IhdStatus}
                      </span>
                    </td>
                  </tr>
                ))
              )}
            </tbody>
          </table>
        </div>
      </div>

      {/* Room Layout Modal */}
      <Modal 
        isOpen={showLayoutModal} 
        onClose={() => setShowLayoutModal(false)} 
        title="Add Room Layout"
      >
        <div className="space-y-4">
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">Floor Name <span className="text-red-500">*</span></label>
            <input 
              type="text" 
              className="input-field" 
              placeholder="e.g. 1st Floor" 
              value={layoutForm.floor_name}
              onChange={e => setLayoutForm({...layoutForm, floor_name: e.target.value})}
            />
          </div>
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">Ward/Room Name <span className="text-red-500">*</span></label>
            <input 
              type="text" 
              className="input-field" 
              placeholder="e.g. ICU, Room 101" 
              value={layoutForm.ward_name}
              onChange={e => setLayoutForm({...layoutForm, ward_name: e.target.value})}
            />
          </div>
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">Number of Beds <span className="text-red-500">*</span></label>
            <input 
              type="number" 
              min="1"
              className="input-field" 
              value={layoutForm.num_beds}
              onChange={e => setLayoutForm({...layoutForm, num_beds: parseInt(e.target.value) || 1})}
            />
          </div>
        </div>

        <div className="mt-6 pt-4 border-t border-gray-100 flex justify-end gap-3">
          <button onClick={() => setShowLayoutModal(false)} className="btn-secondary">
            Cancel
          </button>
          <button 
            onClick={() => layoutMutation.mutate(layoutForm)} 
            disabled={layoutMutation.isPending || !layoutForm.floor_name || !layoutForm.ward_name}
            className="btn-primary"
          >
            {layoutMutation.isPending ? 'Creating...' : 'Create Layout'}
          </button>
        </div>
      </Modal>
    </div>
  );
}
