import { useState, useMemo } from 'react';
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import api from '../../lib/api';
import { BedDouble, User, Activity, ChevronDown, ChevronRight, Printer, RefreshCw, History, FilterX } from 'lucide-react';

interface Bed {
  BdmCode: number;
  BdmName: string;
  BdmCharges: number;
  is_occupied: boolean;
  patient_id: number | null;
  patient_name: string | null;
  admission_id: number | null;
  patient_age: string | null;
  patient_sex: string | null;
  care_of: string | null;
  attending_doctor: string | null;
  expected_discharge_date: string | null;
}

interface Ward {
  WrdCode: number;
  WrdName: string;
  beds: Bed[];
}

interface Floor {
  FlrCode: number;
  FlrName: string;
  wards: Ward[];
}

interface BedHistory {
  IbsCode: number;
  admission_id: number | null;
  patient_name: string;
  start_date: string;
  end_date: string | null;
  status: string;
}

export function IPDBedStatus() {
  const queryClient = useQueryClient();
  const [expandedWards, setExpandedWards] = useState<Record<string, boolean>>({});
  
  // Filters
  const [filterFloor, setFilterFloor] = useState<number | 'ALL'>('ALL');
  const [filterWard, setFilterWard] = useState<number | 'ALL'>('ALL');
  const [filterStatus, setFilterStatus] = useState<'ALL' | 'OCCUPIED' | 'VACANT'>('ALL');

  // Modals
  const [shiftModal, setShiftModal] = useState<{ isOpen: boolean; bed: Bed | null }>({ isOpen: false, bed: null });
  const [historyModal, setHistoryModal] = useState<{ isOpen: boolean; bed: Bed | null }>({ isOpen: false, bed: null });
  
  // Shift State
  const [selectedNewBedCode, setSelectedNewBedCode] = useState<number | ''>('');
  const [transferDate, setTransferDate] = useState<string>(new Date().toISOString().split('T')[0]);

  const { data: floors, isLoading, error } = useQuery<Floor[]>({
    queryKey: ['ipd-bed-status'],
    queryFn: async () => {
      const response = await api.get('/ipd/bed-status');
      return response.data;
    }
  });

  const { data: bedHistory, isLoading: isLoadingHistory } = useQuery<BedHistory[]>({
    queryKey: ['ipd-bed-history', historyModal.bed?.BdmCode],
    queryFn: async () => {
      if (!historyModal.bed) return [];
      const response = await api.get(`/ipd/beds/${historyModal.bed.BdmCode}/history`);
      return response.data;
    },
    enabled: historyModal.isOpen && !!historyModal.bed
  });

  const shiftMutation = useMutation({
    mutationFn: async (data: { admission_id: number; new_bed_code: number; transfer_date: string }) => {
      await api.post(`/ipd/admissions/${data.admission_id}/transfer`, {
        new_bed_code: data.new_bed_code,
        transfer_date: data.transfer_date
      });
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['ipd-bed-status'] });
      setShiftModal({ isOpen: false, bed: null });
      setSelectedNewBedCode('');
    }
  });

  const handlePrint = () => {
    window.print();
  };

  const clearFilters = () => {
    setFilterFloor('ALL');
    setFilterWard('ALL');
    setFilterStatus('ALL');
  };

  // Extract all vacant beds across the hospital for the shift dropdown
  const allVacantBeds = useMemo(() => {
    if (!floors) return [];
    const vacant: { code: number; name: string; location: string }[] = [];
    floors.forEach(f => {
      f.wards.forEach(w => {
        w.beds.forEach(b => {
          if (!b.is_occupied) {
            vacant.push({ code: b.BdmCode, name: b.BdmName, location: `${f.FlrName} - ${w.WrdName}` });
          }
        });
      });
    });
    return vacant;
  }, [floors]);

  if (isLoading) return <div className="p-8 text-center text-gray-500">Loading Bed Status...</div>;
  if (error) return <div className="p-8 text-center text-red-500">Failed to load bed status.</div>;
  if (!floors || floors.length === 0) return <div className="p-8 text-center text-gray-500">No floors or beds configured.</div>;

  // Filter Logic
  const filteredFloors = floors.map(floor => {
    if (filterFloor !== 'ALL' && floor.FlrCode !== filterFloor) return null;
    
    const filteredWards = floor.wards.map(ward => {
      if (filterWard !== 'ALL' && ward.WrdCode !== filterWard) return null;
      
      const filteredBeds = ward.beds.filter(bed => {
        if (filterStatus === 'OCCUPIED' && !bed.is_occupied) return false;
        if (filterStatus === 'VACANT' && bed.is_occupied) return false;
        return true;
      });
      
      if (filteredBeds.length === 0) return null;
      return { ...ward, beds: filteredBeds };
    }).filter(Boolean) as Ward[];
    
    if (filteredWards.length === 0) return null;
    return { ...floor, wards: filteredWards };
  }).filter(Boolean) as Floor[];

  const totalBeds = floors.reduce((sum, f) => sum + f.wards.reduce((ws, w) => ws + w.beds.length, 0), 0);
  const occupiedBeds = floors.reduce((sum, f) => sum + f.wards.reduce((ws, w) => ws + w.beds.filter(b => b.is_occupied).length, 0), 0);
  const vacantBeds = totalBeds - occupiedBeds;

  return (
    <div className="space-y-6 max-w-7xl mx-auto print:max-w-none print:m-0 print:p-0">
      <style>{`
        @media print {
          body * { visibility: hidden; }
          .print-area, .print-area * { visibility: visible; }
          .print-area { position: absolute; left: 0; top: 0; width: 100%; }
          .no-print { display: none !important; }
        }
      `}</style>

      {/* Header & Controls - No Print */}
      <div className="flex flex-col md:flex-row justify-between items-start md:items-end gap-4 no-print bg-white p-4 rounded-lg border border-gray-200 shadow-sm">
        <div>
          <h1 className="text-2xl font-bold text-medical-text">IPD Bed Status</h1>
          <p className="text-gray-500 text-sm mt-1">Live visual layout and bed management</p>
        </div>

        <div className="flex flex-wrap items-center gap-3">
          <select 
            className="input-field py-1.5 text-sm"
            value={filterFloor}
            onChange={(e) => setFilterFloor(e.target.value === 'ALL' ? 'ALL' : Number(e.target.value))}
          >
            <option value="ALL">All Floors</option>
            {floors.map(f => <option key={f.FlrCode} value={f.FlrCode}>{f.FlrName}</option>)}
          </select>

          <select 
            className="input-field py-1.5 text-sm"
            value={filterWard}
            onChange={(e) => setFilterWard(e.target.value === 'ALL' ? 'ALL' : Number(e.target.value))}
          >
            <option value="ALL">All Wards</option>
            {Array.from(new Set(floors.flatMap(f => f.wards.map(w => JSON.stringify({id: w.WrdCode, name: w.WrdName})))))
              .map(wStr => {
                const w = JSON.parse(wStr);
                return <option key={w.id} value={w.id}>{w.name}</option>;
              })
            }
          </select>

          <select 
            className="input-field py-1.5 text-sm"
            value={filterStatus}
            onChange={(e) => setFilterStatus(e.target.value as any)}
          >
            <option value="ALL">All Status</option>
            <option value="OCCUPIED">Occupied Only</option>
            <option value="VACANT">Vacant Only</option>
          </select>

          <button onClick={clearFilters} className="p-2 text-gray-500 hover:text-medical-primary hover:bg-medical-50 rounded-md transition-colors" title="Clear Filters">
            <FilterX size={20} />
          </button>

          <div className="h-8 w-px bg-gray-300 mx-2"></div>

          <button onClick={handlePrint} className="btn-primary flex items-center gap-2 py-1.5">
            <Printer size={16} />
            Print Status
          </button>
        </div>
      </div>

      {/* Status Summary */}
      <div className="flex gap-4 print-area">
        <div className="flex items-center gap-2 bg-white px-3 py-1.5 rounded-md border border-medical-border shadow-sm">
          <div className="w-3 h-3 rounded-full bg-green-500"></div>
          <span className="text-sm font-medium text-gray-700">Vacant ({vacantBeds})</span>
        </div>
        <div className="flex items-center gap-2 bg-white px-3 py-1.5 rounded-md border border-medical-border shadow-sm">
          <div className="w-3 h-3 rounded-full bg-red-500"></div>
          <span className="text-sm font-medium text-gray-700">Occupied ({occupiedBeds})</span>
        </div>
        <div className="flex items-center gap-2 bg-white px-3 py-1.5 rounded-md border border-medical-border shadow-sm">
          <span className="text-sm font-medium text-gray-700">Total ({totalBeds})</span>
        </div>
      </div>

      {/* Main Bed Layout */}
      <div className="space-y-8 print-area">
        {filteredFloors.length === 0 ? (
          <div className="p-8 text-center text-gray-500 border-2 border-dashed border-gray-300 rounded-lg">
            No beds match the current filters.
          </div>
        ) : (
          filteredFloors.map(floor => (
            <div key={floor.FlrCode} className="space-y-4">
              <h2 className="text-xl font-semibold text-gray-800 border-b-2 border-medical-border pb-2 flex items-center gap-2">
                <Activity className="text-medical-primary" size={20} />
                {floor.FlrName}
              </h2>
              
              <div className="space-y-4">
                {floor.wards.map(ward => {
                  const wardKey = `${floor.FlrCode}-${ward.WrdCode}`;
                  const isExpanded = expandedWards[wardKey] !== false; // Default to expanded
                  
                  const wardOccupied = ward.beds.filter(b => b.is_occupied).length;
                  const wardTotal = ward.beds.length;
                  
                  return (
                    <div key={ward.WrdCode} className="card bg-gray-50/50 !p-0 overflow-hidden print:border-none print:shadow-none print:bg-white">
                      <div 
                        className="flex items-center justify-between p-4 bg-gray-100 hover:bg-gray-200 transition-colors cursor-pointer no-print"
                        onClick={() => setExpandedWards(prev => ({...prev, [wardKey]: !isExpanded}))}
                      >
                        <div className="flex items-center gap-2">
                          {isExpanded ? <ChevronDown size={20} className="text-gray-500" /> : <ChevronRight size={20} className="text-gray-500" />}
                          <h3 className="text-lg font-medium text-gray-700">{ward.WrdName}</h3>
                        </div>
                        <div className="text-sm font-medium text-gray-500">
                          {wardOccupied} / {wardTotal} Occupied
                        </div>
                      </div>
                      
                      {/* Print-only ward header */}
                      <div className="hidden print:block p-2 border-b-2 border-gray-800 font-bold text-lg mb-2">
                        {ward.WrdName} ({wardOccupied}/{wardTotal} Occupied)
                      </div>
                      
                      {(isExpanded || window.matchMedia('print').matches) && (
                        <div className="p-4 border-t border-medical-border print:border-none print:p-0">
                          <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 xl:grid-cols-5 gap-4 print:grid-cols-4">
                            {ward.beds.map(bed => (
                              <div 
                                key={bed.BdmCode}
                                className={`relative p-4 rounded-xl border-2 transition-all duration-200 shadow-sm
                                  ${bed.is_occupied 
                                    ? 'bg-red-50 border-red-200 print:bg-white print:border-red-500' 
                                    : 'bg-green-50 border-green-200 print:bg-white print:border-green-500'
                                  }`}
                              >
                                <div className="flex justify-between items-start mb-2">
                                  <span className={`font-bold text-lg ${bed.is_occupied ? 'text-red-700' : 'text-green-700'}`}>
                                    {bed.BdmName}
                                  </span>
                                  <div className="flex items-center gap-2 no-print">
                                    <button 
                                      onClick={() => setHistoryModal({ isOpen: true, bed })}
                                      className="p-1 text-gray-400 hover:text-medical-primary rounded hover:bg-white transition-colors"
                                      title="Bed History"
                                    >
                                      <History size={16} />
                                    </button>
                                    {bed.is_occupied && (
                                      <button 
                                        onClick={() => setShiftModal({ isOpen: true, bed })}
                                        className="p-1 text-red-400 hover:text-red-700 rounded hover:bg-white transition-colors"
                                        title="Shift Patient"
                                      >
                                        <RefreshCw size={16} />
                                      </button>
                                    )}
                                  </div>
                                </div>
                                
                                <div className="mt-2 pt-2 border-t border-white/50 print:border-gray-200">
                                  {bed.is_occupied ? (
                                    <div className="space-y-1 relative group">
                                      <div className="font-semibold text-sm text-red-900 truncate">
                                        {bed.patient_name || 'Unknown'}
                                      </div>
                                      <div className="flex items-center justify-between text-xs text-red-700/80">
                                        <span>PTT-{bed.patient_id}</span>
                                        <span>IPD-{bed.admission_id}</span>
                                      </div>
                                      <div className="text-[10px] text-red-600 truncate mt-1">
                                        Dr. {bed.attending_doctor || 'N/A'}
                                      </div>
                                      
                                      {/* Extended Hover Tooltip (Deep Demographics) */}
                                      <div className="no-print absolute bottom-full left-1/2 -translate-x-1/2 mb-2 w-64 p-3 bg-gray-900 text-white text-xs rounded-lg opacity-0 group-hover:opacity-100 transition-opacity pointer-events-none z-20 shadow-xl">
                                        <div className="font-bold text-sm mb-1 pb-1 border-b border-gray-700">{bed.patient_name}</div>
                                        <div className="grid grid-cols-2 gap-y-1 gap-x-2">
                                          <span className="text-gray-400">Sex/Age:</span>
                                          <span>{bed.patient_sex || '-'} / {bed.patient_age || '-'}</span>
                                          <span className="text-gray-400">Care Of:</span>
                                          <span className="truncate">{bed.care_of || '-'}</span>
                                          <span className="text-gray-400">Doctor:</span>
                                          <span className="truncate">{bed.attending_doctor || '-'}</span>
                                          <span className="text-gray-400">Exp. Disch:</span>
                                          <span>{bed.expected_discharge_date || '-'}</span>
                                        </div>
                                        <div className="absolute top-full left-1/2 -translate-x-1/2 border-8 border-transparent border-t-gray-900"></div>
                                      </div>
                                    </div>
                                  ) : (
                                    <div className="text-xs font-medium text-green-700 text-center py-4">
                                      Available
                                    </div>
                                  )}
                                </div>
                              </div>
                            ))}
                          </div>
                        </div>
                      )}
                    </div>
                  );
                })}
              </div>
            </div>
          ))
        )}
      </div>

      {/* Shift Bed Modal */}
      {shiftModal.isOpen && shiftModal.bed && (
        <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-50 p-4">
          <div className="bg-white rounded-xl shadow-xl w-full max-w-md overflow-hidden flex flex-col max-h-[90vh]">
            <div className="px-6 py-4 border-b border-gray-100 flex justify-between items-center bg-gray-50">
              <h2 className="text-xl font-bold text-gray-800 flex items-center gap-2">
                <RefreshCw className="text-medical-primary" />
                Shift Bed
              </h2>
              <button onClick={() => setShiftModal({ isOpen: false, bed: null })} className="text-gray-400 hover:text-gray-600">✕</button>
            </div>
            
            <div className="p-6 overflow-y-auto space-y-4">
              <div className="p-3 bg-red-50 text-red-800 rounded-lg border border-red-100 text-sm">
                <div className="font-semibold mb-1">Current Bed: {shiftModal.bed.BdmName}</div>
                <div>Patient: {shiftModal.bed.patient_name} (IPD-{shiftModal.bed.admission_id})</div>
              </div>

              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Select New Bed *</label>
                <select 
                  className="input-field" 
                  value={selectedNewBedCode}
                  onChange={e => setSelectedNewBedCode(e.target.value ? Number(e.target.value) : '')}
                >
                  <option value="">-- Select Vacant Bed --</option>
                  {allVacantBeds.map(b => (
                    <option key={b.code} value={b.code}>{b.location} &gt; {b.name}</option>
                  ))}
                </select>
              </div>

              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Transfer Date *</label>
                <input 
                  type="date" 
                  className="input-field"
                  value={transferDate}
                  onChange={e => setTransferDate(e.target.value)}
                />
              </div>
            </div>

            <div className="px-6 py-4 border-t border-gray-100 flex justify-end gap-3 bg-gray-50">
              <button onClick={() => setShiftModal({ isOpen: false, bed: null })} className="btn-secondary">Cancel</button>
              <button 
                onClick={() => shiftMutation.mutate({ 
                  admission_id: shiftModal.bed!.admission_id!, 
                  new_bed_code: Number(selectedNewBedCode),
                  transfer_date: transferDate
                })}
                disabled={!selectedNewBedCode || !transferDate || shiftMutation.isPending}
                className="btn-primary"
              >
                {shiftMutation.isPending ? 'Processing...' : 'Confirm Shift'}
              </button>
            </div>
          </div>
        </div>
      )}

      {/* Bed History Modal */}
      {historyModal.isOpen && historyModal.bed && (
        <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-50 p-4">
          <div className="bg-white rounded-xl shadow-xl w-full max-w-2xl overflow-hidden flex flex-col max-h-[90vh]">
            <div className="px-6 py-4 border-b border-gray-100 flex justify-between items-center bg-gray-50">
              <h2 className="text-xl font-bold text-gray-800 flex items-center gap-2">
                <History className="text-medical-primary" />
                Transaction History: {historyModal.bed.BdmName}
              </h2>
              <button onClick={() => setHistoryModal({ isOpen: false, bed: null })} className="text-gray-400 hover:text-gray-600">✕</button>
            </div>
            
            <div className="p-6 overflow-y-auto">
              {isLoadingHistory ? (
                <div className="text-center py-4 text-gray-500">Loading history...</div>
              ) : !bedHistory || bedHistory.length === 0 ? (
                <div className="text-center py-4 text-gray-500">No past transactions found for this bed.</div>
              ) : (
                <div className="overflow-x-auto">
                  <table className="w-full text-left text-sm">
                    <thead>
                      <tr className="bg-gray-100 text-gray-600 border-b border-gray-200">
                        <th className="p-3 font-semibold">Adm. ID</th>
                        <th className="p-3 font-semibold">Patient Name</th>
                        <th className="p-3 font-semibold">Start Date</th>
                        <th className="p-3 font-semibold">End Date</th>
                        <th className="p-3 font-semibold">Status</th>
                      </tr>
                    </thead>
                    <tbody className="divide-y divide-gray-100">
                      {bedHistory.map((hist, idx) => (
                        <tr key={idx} className="hover:bg-gray-50">
                          <td className="p-3">IPD-{hist.admission_id}</td>
                          <td className="p-3 font-medium text-gray-800">{hist.patient_name}</td>
                          <td className="p-3">{hist.start_date}</td>
                          <td className="p-3">{hist.end_date || '-'}</td>
                          <td className="p-3">
                            <span className={`px-2 py-1 rounded-full text-xs font-medium ${
                              hist.status === 'Occupied' ? 'bg-green-100 text-green-800' : 'bg-gray-100 text-gray-800'
                            }`}>
                              {hist.status}
                            </span>
                          </td>
                        </tr>
                      ))}
                    </tbody>
                  </table>
                </div>
              )}
            </div>
          </div>
        </div>
      )}

    </div>
  );
}
