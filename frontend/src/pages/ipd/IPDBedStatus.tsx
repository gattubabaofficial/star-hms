import { useState } from 'react';
import { useQuery } from '@tanstack/react-query';
import api from '../../lib/api';
import { BedDouble, User, Activity, ChevronDown, ChevronRight } from 'lucide-react';

interface Bed {
  BdmCode: number;
  BdmName: string;
  BdmCharges: number;
  is_occupied: boolean;
  patient_id: number | null;
  patient_name: string | null;
  admission_id: number | null;
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

export function IPDBedStatus() {
  const [expandedWards, setExpandedWards] = useState<Record<string, boolean>>({});

  const { data: floors, isLoading, error } = useQuery<Floor[]>({
    queryKey: ['ipd-bed-status'],
    queryFn: async () => {
      const response = await api.get('/ipd/bed-status');
      return response.data;
    }
  });

  if (isLoading) return <div className="p-8 text-center text-gray-500">Loading Bed Status...</div>;
  if (error) return <div className="p-8 text-center text-red-500">Failed to load bed status.</div>;
  if (!floors || floors.length === 0) return <div className="p-8 text-center text-gray-500">No floors or beds configured.</div>;

  const totalBeds = floors.reduce((sum, f) => sum + f.wards.reduce((ws, w) => ws + w.beds.length, 0), 0);
  const occupiedBeds = floors.reduce((sum, f) => sum + f.wards.reduce((ws, w) => ws + w.beds.filter(b => b.is_occupied).length, 0), 0);
  const vacantBeds = totalBeds - occupiedBeds;

  return (
    <div className="space-y-6 max-w-7xl mx-auto">
      <div className="flex justify-between items-end">
        <div>
          <h1 className="text-2xl font-bold text-medical-text">IPD Bed Status</h1>
          <p className="text-gray-500 text-sm mt-1">Live visual layout of hospital beds</p>
        </div>

        <div className="flex gap-4">
          <div className="flex items-center gap-2 bg-white px-3 py-1.5 rounded-md border border-gray-200 shadow-sm">
            <div className="w-3 h-3 rounded-full bg-green-500"></div>
            <span className="text-sm font-medium text-gray-700">Vacant ({vacantBeds})</span>
          </div>
          <div className="flex items-center gap-2 bg-white px-3 py-1.5 rounded-md border border-gray-200 shadow-sm">
            <div className="w-3 h-3 rounded-full bg-red-500"></div>
            <span className="text-sm font-medium text-gray-700">Occupied ({occupiedBeds})</span>
          </div>
          <div className="flex items-center gap-2 bg-white px-3 py-1.5 rounded-md border border-gray-200 shadow-sm">
            <span className="text-sm font-medium text-gray-700">Total ({totalBeds})</span>
          </div>
        </div>
      </div>

      <div className="space-y-8">
        {floors.map(floor => (
          <div key={floor.FlrCode} className="space-y-4">
            <h2 className="text-xl font-semibold text-gray-800 border-b-2 border-gray-200 pb-2 flex items-center gap-2">
              <Activity className="text-medical-mutedblue" size={20} />
              {floor.FlrName}
            </h2>
            
            <div className="space-y-4">
              {floor.wards.map(ward => {
                const wardKey = `${floor.FlrCode}-${ward.WrdCode}`;
                const isExpanded = expandedWards[wardKey] !== false; // Default to expanded
                
                const wardOccupied = ward.beds.filter(b => b.is_occupied).length;
                const wardTotal = ward.beds.length;
                
                return (
                  <div key={ward.WrdCode} className="card bg-gray-50/50 !p-0 overflow-hidden">
                    <div 
                      className="flex items-center justify-between p-4 bg-gray-100 hover:bg-gray-200 transition-colors cursor-pointer"
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
                    
                    {isExpanded && (
                      <div className="p-4 border-t border-gray-200">
                        <div className="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 lg:grid-cols-6 gap-4">
                          {ward.beds.map(bed => (
                            <div 
                              key={bed.BdmCode}
                              className={`relative p-4 rounded-xl border-2 transition-all duration-200 shadow-sm hover:shadow-md
                                ${bed.is_occupied 
                                  ? 'bg-red-50 border-red-200 hover:border-red-300' 
                                  : 'bg-green-50 border-green-200 hover:border-green-300'
                                }`}
                            >
                              <div className="flex justify-between items-start mb-2">
                                <span className={`font-bold text-lg ${bed.is_occupied ? 'text-red-700' : 'text-green-700'}`}>
                                  {bed.BdmName}
                                </span>
                                <BedDouble size={20} className={bed.is_occupied ? 'text-red-400' : 'text-green-400'} />
                              </div>
                              
                              <div className="mt-4 pt-3 border-t border-white/50">
                                {bed.is_occupied ? (
                                  <div className="space-y-1 relative group">
                                    <div className="flex items-center gap-1.5 text-xs font-medium text-red-800">
                                      <User size={12} />
                                      PTT-{bed.patient_id}
                                    </div>
                                    <div className="text-xs text-red-600/80">
                                      Adm: IPD-{bed.admission_id}
                                    </div>
                                    {/* Hover Tooltip */}
                                    <div className="absolute bottom-full left-1/2 -translate-x-1/2 mb-2 w-max px-2 py-1 bg-gray-900 text-white text-xs rounded opacity-0 group-hover:opacity-100 transition-opacity pointer-events-none z-10">
                                      Patient: {bed.patient_name || 'Unknown'}
                                      <div className="absolute top-full left-1/2 -translate-x-1/2 border-4 border-transparent border-t-gray-900"></div>
                                    </div>
                                  </div>
                                ) : (
                                  <div className="text-xs font-medium text-green-700 text-center py-1">
                                    Available
                                  </div>
                                )}
                              </div>
                              
                              <div className="absolute top-0 right-0 -mt-2 -mr-2">
                                {bed.is_occupied && (
                                  <span className="flex h-3 w-3">
                                    <span className="animate-ping absolute inline-flex h-full w-full rounded-full bg-red-400 opacity-75"></span>
                                    <span className="relative inline-flex rounded-full h-3 w-3 bg-red-500"></span>
                                  </span>
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
        ))}
      </div>
    </div>
  );
}
