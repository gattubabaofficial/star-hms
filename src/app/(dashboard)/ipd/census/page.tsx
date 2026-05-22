"use client";
import React, { useState, useEffect } from 'react';
import apiClient from '@/lib/apiClient';
import GridModule from '@/components/shared/GridModule';
import { ColDef } from 'ag-grid-community';
import { format, differenceInDays } from 'date-fns';
import { LayoutGrid, ListFilter, Users, Bed, Building2, CheckCircle2 } from 'lucide-react';

export default function StayCensus() {
  const [beds, setBeds] = useState<any[]>([]);
  const [admissions, setAdmissions] = useState<any[]>([]);
  const [viewMode, setViewMode] = useState<'matrix' | 'list'>('matrix');
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    fetchData();
  }, []);

  const fetchData = async () => {
    setLoading(true);
    try {
      const [bedsRes, admissionsRes] = await Promise.all([
        apiClient.get('/ipd/beds'),
        apiClient.get('/ipd/admission')
      ]);
      setBeds(bedsRes.data);
      setAdmissions(admissionsRes.data);
    } catch (err) {
      console.error('Error fetching census data:', err);
    } finally {
      setLoading(false);
    }
  };

  // Calculations
  const totalBedsCount = beds.length;
  const occupiedBedsCount = beds.filter(b => 
    b.IndrHdr?.some((adm: any) => adm.IhdStatus === 'Admitted')
  ).length;
  const vacantBedsCount = totalBedsCount - occupiedBedsCount;
  const occupancyRate = totalBedsCount > 0 ? Math.round((occupiedBedsCount / totalBedsCount) * 100) : 0;

  // Group beds by Floor then Ward for the matrix view
  const floorsMap: Record<string, Record<string, any[]>> = {};
  beds.forEach(bed => {
    const floorName = bed.Floor?.FlrName || 'Unassigned Floor';
    const wardName = bed.Ward?.WrdName || 'General Ward';
    
    if (!floorsMap[floorName]) {
      floorsMap[floorName] = {};
    }
    if (!floorsMap[floorName][wardName]) {
      floorsMap[floorName][wardName] = [];
    }
    floorsMap[floorName][wardName].push(bed);
  });

  const columns: ColDef[] = [
    { field: 'IhdVchNo', headerName: 'Adm ID', width: 90 },
    { field: 'Patient.PttName', headerName: 'Patient Name', flex: 1, cellStyle: {  } },
    { field: 'Doctor.DctName', headerName: 'Consulting Doctor', flex: 1 },
    { field: 'Floor.FlrName', headerName: 'Floor', width: 120 },
    { field: 'Ward.WrdName', headerName: 'Ward', width: 120 },
    { field: 'Bed.BdmName', headerName: 'Bed #', width: 100 },
    { 
      field: 'IhdDate', 
      headerName: 'Admitted Date', 
      width: 130, 
      valueFormatter: p => format(new Date(p.value), 'dd/MM/yyyy') 
    },
    { 
      headerName: 'Days Stayed', 
      width: 120,
      valueGetter: p => {
        const date = p.data.IhdDate;
        if (!date) return 0;
        const diff = differenceInDays(new Date(), new Date(date));
        return diff === 0 ? 1 : diff;
      }
    }
  ];

  return (
    <div style={{ padding: '30px', display: 'flex', flexDirection: 'column', gap: '30px', height: '100%', overflowY: 'auto' }}>
      <header style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
        <div>
          <h1 style={{ fontSize: '28px', marginBottom: '5px', display: 'flex', alignItems: 'center', gap: '15px' }}>
            <Building2 color="var(--accent-color)" size={32} /> Inpatient Stay Census
          </h1>
          <p style={{ color: 'var(--text-secondary)' }}>Real-time ward occupancy monitoring and bed allocation statistics.</p>
        </div>
        <div style={{ display: 'flex', gap: '10px' }}>
          <button 
            onClick={() => setViewMode('matrix')} 
            className="btn"
            style={{ 
              display: 'flex', alignItems: 'center', gap: '8px',
              backgroundColor: viewMode === 'matrix' ? 'var(--accent-color)' : 'var(--bg-secondary)',
              color: viewMode === 'matrix' ? '#fff' : 'var(--text-primary)'
            }}
          >
            <LayoutGrid size={18} /> Spatial Matrix
          </button>
          <button 
            onClick={() => setViewMode('list')} 
            className="btn"
            style={{ 
              display: 'flex', alignItems: 'center', gap: '8px',
              backgroundColor: viewMode === 'list' ? 'var(--accent-color)' : 'var(--bg-secondary)',
              color: viewMode === 'list' ? '#fff' : 'var(--text-primary)'
            }}
          >
            <ListFilter size={18} /> Directory List
          </button>
        </div>
      </header>

      {/* KPI Section */}
      <div style={{ display: 'grid', gridTemplateColumns: 'repeat(4, 1fr)', gap: '20px' }}>
        <div className="dashboard-card" style={{ display: 'flex', alignItems: 'center', gap: '15px' }}>
          <div style={{ padding: '12px', backgroundColor: '#eef2ff', color: '#4f46e5', borderRadius: '8px' }}>
            <Bed size={24} />
          </div>
          <div>
            <div style={{ fontSize: '12px', color: 'var(--text-secondary)' }}>Total Capacity</div>
            <div style={{ fontSize: '24px', fontWeight: 'bold' }}>{totalBedsCount} Beds</div>
          </div>
        </div>
        <div className="dashboard-card" style={{ display: 'flex', alignItems: 'center', gap: '15px' }}>
          <div style={{ padding: '12px', backgroundColor: '#fee2e2', color: '#ef4444', borderRadius: '8px' }}>
            <Users size={24} />
          </div>
          <div>
            <div style={{ fontSize: '12px', color: 'var(--text-secondary)' }}>Occupied Census</div>
            <div style={{ fontSize: '24px', fontWeight: 'bold' }}>{occupiedBedsCount} Patients</div>
          </div>
        </div>
        <div className="dashboard-card" style={{ display: 'flex', alignItems: 'center', gap: '15px' }}>
          <div style={{ padding: '12px', backgroundColor: '#dcfce7', color: '#22c55e', borderRadius: '8px' }}>
            <CheckCircle2 size={24} />
          </div>
          <div>
            <div style={{ fontSize: '12px', color: 'var(--text-secondary)' }}>Vacant Beds</div>
            <div style={{ fontSize: '24px', fontWeight: 'bold' }}>{vacantBedsCount} Available</div>
          </div>
        </div>
        <div className="dashboard-card" style={{ display: 'flex', alignItems: 'center', gap: '15px' }}>
          <div style={{ padding: '12px', backgroundColor: '#ffedd5', color: '#f97316', borderRadius: '8px' }}>
            <Building2 size={24} />
          </div>
          <div>
            <div style={{ fontSize: '12px', color: 'var(--text-secondary)' }}>Occupancy Rate</div>
            <div style={{ fontSize: '24px', fontWeight: 'bold' }}>{occupancyRate}%</div>
          </div>
        </div>
      </div>

      {/* Main Census Content */}
      <div style={{ flex: 1, minHeight: '400px' }}>
        {loading ? (
          <div style={{ height: '100%', display: 'flex', justifyContent: 'center', alignItems: 'center', color: 'var(--text-secondary)' }}>
            Loading live stay census data...
          </div>
        ) : viewMode === 'list' ? (
          <div style={{ height: '500px', display: 'flex', flexDirection: 'column', gap: '10px' }}>
            <h3 style={{ margin: 0, paddingBottom: '10px', borderBottom: '1px solid var(--border-color)' }}>Admitted Patients Directory</h3>
            <GridModule rowData={admissions} columnDefs={columns} height="100%" />
          </div>
        ) : (
          <div style={{ display: 'flex', flexDirection: 'column', gap: '30px' }}>
            {Object.entries(floorsMap).map(([floorName, wards]) => (
              <div key={floorName} style={{ display: 'flex', flexDirection: 'column', gap: '15px' }}>
                <h3 style={{ borderBottom: '1px solid var(--border-color)', paddingBottom: '8px', display: 'flex', alignItems: 'center', gap: '10px' }}>
                  <Building2 size={20} color="var(--accent-color)" /> {floorName}
                </h3>
                <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fill, minmax(350px, 1fr))', gap: '20px' }}>
                  {Object.entries(wards).map(([wardName, wardBeds]) => (
                    <div key={wardName} className="dashboard-card" style={{ padding: '15px' }}>
                      <h4 style={{ margin: '0 0 12px 0', fontSize: '14px', borderBottom: '1px solid var(--border-color)', paddingBottom: '6px' }}>
                        {wardName}
                      </h4>
                      <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fill, minmax(90px, 1fr))', gap: '10px' }}>
                        {wardBeds.map(bed => {
                          const activeAdm = bed.IndrHdr?.find((adm: any) => adm.IhdStatus === 'Admitted');
                          const isOccupied = !!activeAdm;
                          return (
                            <div 
                              key={bed.BdmCode}
                              style={{ 
                                padding: '10px', 
                                border: `1px solid ${isOccupied ? '#ef4444' : '#22c55e'}`,
                                backgroundColor: isOccupied ? '#fef2f2' : '#f0fdf4',
                                borderRadius: '6px',
                                display: 'flex', 
                                flexDirection: 'column', 
                                gap: '5px',
                                position: 'relative'
                              }}
                            >
                              <div style={{ fontSize: '12px', fontWeight: 'bold', color: isOccupied ? '#dc2626' : '#16a34a' }}>
                                Bed {bed.BdmName}
                              </div>
                              {isOccupied ? (
                                <div style={{ display: 'flex', flexDirection: 'column' }}>
                                  <div style={{ fontSize: '11px', color: '#1f2937', overflow: 'hidden', textOverflow: 'ellipsis', whiteSpace: 'nowrap', fontWeight: 500 }} title={activeAdm.Patient?.PttName}>
                                    {activeAdm.Patient?.PttName}
                                  </div>
                                  <div style={{ fontSize: '10px', color: '#6b7280' }}>
                                    Dr. {activeAdm.Doctor?.DctName?.split(' ')[0]}
                                  </div>
                                </div>
                              ) : (
                                <div style={{ fontSize: '11px', color: '#16a34a', fontStyle: 'italic' }}>Available</div>
                              )}
                            </div>
                          );
                        })}
                      </div>
                    </div>
                  ))}
                </div>
              </div>
            ))}
          </div>
        )}
      </div>
    </div>
  );
}
