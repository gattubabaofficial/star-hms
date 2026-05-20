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
    { field: 'Patient.PttName', headerName: 'Patient Name', flex: 1, cellStyle: { fontWeight: 'bold' } },
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
            <Building2 color="#3bc9db" size={32} /> Inpatient Stay Census
          </h1>
          <p style={{ color: '#adb5bd' }}>Real-time ward occupancy monitoring and bed allocation statistics.</p>
        </div>
        <div style={{ display: 'flex', gap: '10px' }}>
          <button 
            onClick={() => setViewMode('matrix')} 
            style={{ 
              display: 'flex', alignItems: 'center', gap: '8px', padding: '10px 16px', borderRadius: '8px', border: 'none', cursor: 'pointer', fontWeight: 'bold',
              background: viewMode === 'matrix' ? '#3bc9db' : 'rgba(255,255,255,0.05)',
              color: viewMode === 'matrix' ? '#0b1420' : '#adb5bd'
            }}
          >
            <LayoutGrid size={18} /> Spatial Matrix
          </button>
          <button 
            onClick={() => setViewMode('list')} 
            style={{ 
              display: 'flex', alignItems: 'center', gap: '8px', padding: '10px 16px', borderRadius: '8px', border: 'none', cursor: 'pointer', fontWeight: 'bold',
              background: viewMode === 'list' ? '#3bc9db' : 'rgba(255,255,255,0.05)',
              color: viewMode === 'list' ? '#0b1420' : '#adb5bd'
            }}
          >
            <ListFilter size={18} /> Directory List
          </button>
        </div>
      </header>

      {/* KPI Section */}
      <div style={{ display: 'grid', gridTemplateColumns: 'repeat(4, 1fr)', gap: '20px' }}>
        <div style={{ padding: '20px', background: 'rgba(255,255,255,0.02)', borderRadius: '16px', border: '1px solid #333', display: 'flex', alignItems: 'center', gap: '15px' }}>
          <div style={{ padding: '12px', background: 'rgba(59,201,219,0.1)', borderRadius: '12px' }}>
            <Bed size={24} color="#3bc9db" />
          </div>
          <div>
            <div style={{ fontSize: '12px', color: '#adb5bd' }}>Total Capacity</div>
            <div style={{ fontSize: '24px', fontWeight: 'bold', color: '#fff' }}>{totalBedsCount} Beds</div>
          </div>
        </div>
        <div style={{ padding: '20px', background: 'rgba(255,255,255,0.02)', borderRadius: '16px', border: '1px solid #333', display: 'flex', alignItems: 'center', gap: '15px' }}>
          <div style={{ padding: '12px', background: 'rgba(250,176,5,0.1)', borderRadius: '12px' }}>
            <Users size={24} color="#fab005" />
          </div>
          <div>
            <div style={{ fontSize: '12px', color: '#adb5bd' }}>Occupied Census</div>
            <div style={{ fontSize: '24px', fontWeight: 'bold', color: '#fab005' }}>{occupiedBedsCount} Patients</div>
          </div>
        </div>
        <div style={{ padding: '20px', background: 'rgba(255,255,255,0.02)', borderRadius: '16px', border: '1px solid #333', display: 'flex', alignItems: 'center', gap: '15px' }}>
          <div style={{ padding: '12px', background: 'rgba(64,192,87,0.1)', borderRadius: '12px' }}>
            <CheckCircle2 size={24} color="#40c057" />
          </div>
          <div>
            <div style={{ fontSize: '12px', color: '#adb5bd' }}>Vacant Beds</div>
            <div style={{ fontSize: '24px', fontWeight: 'bold', color: '#40c057' }}>{vacantBedsCount} Available</div>
          </div>
        </div>
        <div style={{ padding: '20px', background: 'rgba(255,255,255,0.02)', borderRadius: '16px', border: '1px solid #333', display: 'flex', alignItems: 'center', gap: '15px' }}>
          <div style={{ padding: '12px', background: 'rgba(240,101,149,0.1)', borderRadius: '12px' }}>
            <Building2 size={24} color="#f06595" />
          </div>
          <div>
            <div style={{ fontSize: '12px', color: '#adb5bd' }}>Occupancy Rate</div>
            <div style={{ fontSize: '24px', fontWeight: 'bold', color: '#f06595' }}>{occupancyRate}%</div>
          </div>
        </div>
      </div>

      {/* Main Census Content */}
      <div style={{ flex: 1, minHeight: '400px' }}>
        {loading ? (
          <div style={{ height: '100%', display: 'flex', justifyContent: 'center', alignItems: 'center', color: '#868e96' }}>
            Loading live stay census data...
          </div>
        ) : viewMode === 'list' ? (
          <div style={{ height: '500px', display: 'flex', flexDirection: 'column', gap: '10px' }}>
            <h3 style={{ color: '#3bc9db', margin: 0 }}>Admitted Patients Directory</h3>
            <GridModule rowData={admissions} columnDefs={columns} height="100%" />
          </div>
        ) : (
          <div style={{ display: 'flex', flexDirection: 'column', gap: '30px' }}>
            {Object.entries(floorsMap).map(([floorName, wards]) => (
              <div key={floorName} style={{ display: 'flex', flexDirection: 'column', gap: '15px' }}>
                <h3 style={{ borderBottom: '1px solid #333', paddingBottom: '8px', color: '#3bc9db', display: 'flex', alignItems: 'center', gap: '10px' }}>
                  <Building2 size={20} /> {floorName}
                </h3>
                <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fill, minmax(350px, 1fr))', gap: '20px' }}>
                  {Object.entries(wards).map(([wardName, wardBeds]) => (
                    <div key={wardName} style={{ background: 'rgba(255,255,255,0.01)', border: '1px solid #222', borderRadius: '12px', padding: '15px' }}>
                      <h4 style={{ margin: '0 0 12px 0', color: '#adb5bd', fontSize: '14px', borderBottom: '1px solid #222', paddingBottom: '6px' }}>
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
                                borderRadius: '8px', 
                                border: `1px solid ${isOccupied ? '#fab00533' : '#40c05733'}`,
                                background: isOccupied ? 'rgba(250,176,5,0.03)' : 'rgba(64,192,87,0.03)',
                                display: 'flex', 
                                flexDirection: 'column', 
                                gap: '5px',
                                position: 'relative'
                              }}
                            >
                              <div style={{ fontSize: '12px', fontWeight: 'bold', color: isOccupied ? '#fab005' : '#40c057' }}>
                                Bed {bed.BdmName}
                              </div>
                              {isOccupied ? (
                                <div style={{ display: 'flex', flexDirection: 'column' }}>
                                  <div style={{ fontSize: '10px', color: '#fff', overflow: 'hidden', textOverflow: 'ellipsis', whiteSpace: 'nowrap', fontWeight: 500 }} title={activeAdm.Patient?.PttName}>
                                    {activeAdm.Patient?.PttName}
                                  </div>
                                  <div style={{ fontSize: '8px', color: '#adb5bd' }}>
                                    Dr. {activeAdm.Doctor?.DctName?.split(' ')[0]}
                                  </div>
                                </div>
                              ) : (
                                <div style={{ fontSize: '10px', color: '#868e96', fontStyle: 'italic' }}>Vacant</div>
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
