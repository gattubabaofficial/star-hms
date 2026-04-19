"use client";
import React, { useState, useEffect } from 'react';
import apiClient from '@/lib/apiClient';
import SummaryDetailLayout from '@/components/shared/SummaryDetailLayout';
import FormModeSelector, { FormMode } from '@/components/shared/FormModeSelector';
import GridModule from '@/components/shared/GridModule';
import LookupField from '@/components/shared/LookupField';
import { ColDef } from 'ag-grid-community';
import { format } from 'date-fns';
import { Bed, UserPlus, LogOut } from 'lucide-react';

export default function Admission() {
  const [data, setData] = useState<any[]>([]);
  const [beds, setBeds] = useState<any[]>([]);
  const [mode, setMode] = useState<FormMode>('View');
  const [activeTab, setActiveTab] = useState<'summary' | 'detail'>('summary');
  const [currentRecord, setCurrentRecord] = useState<any>({});

  useEffect(() => {
    fetchData();
    fetchBeds();
  }, []);

  const fetchData = async () => {
    const res = await apiClient.get('/ipd/admission');
    setData(res.data);
  };

  const fetchBeds = async () => {
    const res = await apiClient.get('/ipd/beds');
    setBeds(res.data);
  };

  const handleRowDoubleClicked = (row: any) => {
    setCurrentRecord({
      ...row,
      IhdDate: format(new Date(row.IhdDate), 'yyyy-MM-dd')
    });
    setMode('View');
    setActiveTab('detail');
  };

  const handleModeChange = (newMode: FormMode) => {
    setMode(newMode);
    if (newMode === 'New') {
      setCurrentRecord({
        IhdDate: format(new Date(), 'yyyy-MM-dd'),
        IhdPttCode: null,
        IhdCDctCode: null,
        IhdBedCode: null,
        IhdStatus: 'Admitted',
        IhdRemark: ''
      });
      setActiveTab('detail');
    }
  };

  const handleDischarge = async () => {
    if (!currentRecord.IhdCode) return;
    if (window.confirm('Discharge this patient?')) {
      await apiClient.put(`/ipd/admission/${currentRecord.IhdCode}/discharge`, {
        IhdDischDate: format(new Date(), "yyyy-MM-dd'T'HH:mm:ss")
      });
      fetchData();
      fetchBeds();
      setMode('View');
      setActiveTab('summary');
    }
  };

  const handleSave = async (e: React.FormEvent) => {
    e.preventDefault();
    try {
      await apiClient.post('/ipd/admission', currentRecord);
      fetchData();
      fetchBeds();
      setMode('View');
      setActiveTab('summary');
    } catch (err: any) {
      alert(err.response?.data?.error || 'Admission failed');
    }
  };

  const cols: ColDef[] = [
    { field: 'IhdVchNo', headerName: 'Adm #', width: 90 },
    { field: 'IhdDate', headerName: 'Date', width: 120, valueFormatter: p => format(new Date(p.value), 'dd/MM/yyyy') },
    { field: 'Patient.PttName', headerName: 'Patient Name', flex: 1 },
    { field: 'Doctor.DctName', headerName: 'Consultant', width: 150 },
    { field: 'Ward.WrdName', headerName: 'Ward', width: 120 },
    { field: 'Bed.BdmName', headerName: 'Bed', width: 100 },
    { 
      field: 'IhdStatus', 
      headerName: 'Status', 
      width: 120,
      cellStyle: p => ({ color: p.value === 'Admitted' ? '#3bc9db' : '#adb5bd', fontWeight: 'bold' })
    }
  ];

  const inputStyle = { padding: '8px', background: 'rgba(255,255,255,0.05)', border: '1px solid #555', color: '#fff', borderRadius: 4, width: '100%' };

  const availableBeds = beds.filter(b => 
    !b.IndrHdr.some((adm: any) => adm.IhdStatus === 'Admitted') || b.BdmCode === currentRecord.IhdBedCode
  );

  const detail = (
    <div style={{ padding: '10px 0' }}>
       <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: 25 }}>
        <h2>Inpatient Admission Lifecycle</h2>
        <div style={{ display: 'flex', gap: 10 }}>
          {currentRecord.IhdStatus === 'Admitted' && mode === 'View' && (
            <button onClick={handleDischarge} style={{ display: 'flex', alignItems: 'center', gap: 8, padding: '8px 16px', background: '#e03131', color: '#fff', borderRadius: 6, border: 'none', cursor: 'pointer', fontWeight: 'bold' }}>
              <LogOut size={18} /> Discharge Patient
            </button>
          )}
          <FormModeSelector mode={mode} onModeChange={handleModeChange} />
        </div>
      </div>

      <form onSubmit={handleSave} style={{ display: 'flex', flexDirection: 'column', gap: 20 }}>
        <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: 25 }}>
          {/* Patient Details */}
          <div style={{ display: 'flex', flexDirection: 'column', gap: 20, padding: 20, background: 'rgba(255,255,255,0.02)', borderRadius: 12, border: '1px solid #333' }}>
            <h3 style={{ margin: 0, fontSize: 16, color: '#3bc9db', display: 'flex', alignItems: 'center', gap: 10 }}>
              <UserPlus size={18} /> Administrative Enrollment
            </h3>
            <div>
              <label>Select Admitting Patient *</label>
              <LookupField endpoint="/opd/patient-master" valueKey="PttCode" labelKey="PttName" value={currentRecord.IhdPttCode} onChange={v => setCurrentRecord({...currentRecord, IhdPttCode: v})} disabled={mode === 'View' || !!currentRecord.IhdCode} />
            </div>
            <div>
              <label>Consultant In-Charge *</label>
              <LookupField endpoint="/masters/doctor-master" valueKey="DctCode" labelKey="DctName" value={currentRecord.IhdCDctCode} onChange={v => setCurrentRecord({...currentRecord, IhdCDctCode: v})} disabled={mode === 'View'} />
            </div>
             <div>
              <label>Admission Date</label>
              <input type="date" value={currentRecord.IhdDate || ''} onChange={e => setCurrentRecord({...currentRecord, IhdDate: e.target.value})} style={inputStyle} disabled={mode === 'View'} />
            </div>
          </div>

          {/* Bed Allocation */}
          <div style={{ display: 'flex', flexDirection: 'column', gap: 20, padding: 20, background: 'rgba(255,255,255,0.02)', borderRadius: 12, border: '1px solid #333' }}>
             <h3 style={{ margin: 0, fontSize: 16, color: '#3bc9db', display: 'flex', alignItems: 'center', gap: 10 }}>
              <Bed size={18} /> Spatial bed Allocation
            </h3>
            <div>
              <label>Assigned Bed *</label>
              <select 
                value={currentRecord.IhdBedCode || ''} 
                onChange={e => {
                  const b = beds.find(x => x.BdmCode === parseInt(e.target.value));
                  setCurrentRecord({...currentRecord, IhdBedCode: b.BdmCode, IhdWrdCode: b.BdmWrdCode, IhdFlrCode: b.BdmFlrCode});
                }} 
                style={inputStyle} 
                disabled={mode === 'View'}
              >
                <option value="">-- Choose Available Bed --</option>
                {availableBeds.map(b => (
                  <option key={b.BdmCode} value={b.BdmCode}>
                    [{b.Floor?.FlrName}] {b.Ward?.WrdName} - {b.BdmName}
                  </option>
                ))}
              </select>
            </div>
             <div>
              <label>Primary Diagnosis / Admission Reason</label>
              <textarea 
                value={currentRecord.IhdRemark || ''} 
                onChange={e => setCurrentRecord({...currentRecord, IhdRemark: e.target.value})} 
                style={{ ...inputStyle, height: 100, resize: 'none' }} 
                disabled={mode === 'View'}
              />
            </div>
          </div>
        </div>

        {mode === 'New' && (
          <div style={{ display: 'flex', justifyContent: 'flex-end' }}>
            <button type="submit" style={{ padding: '12px 32px', background: '#3bc9db', color: '#0b1420', fontWeight: 'bold', borderRadius: 8, border: 'none', cursor: 'pointer' }}>
              Confirm Admission
            </button>
          </div>
        )}
      </form>
    </div>
  );

  return (
    <SummaryDetailLayout 
      activeTab={activeTab} 
      onTabChange={setActiveTab}
      summaryNode={
        <div style={{ height: '100%', display: 'flex', flexDirection: 'column', gap: 10 }}>
           <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
            <h2>Inpatient Census</h2>
            <button onClick={() => handleModeChange('New')} style={{ padding: '8px 16px', background: '#3bc9db', color: '#0b1420', fontWeight: 'bold', borderRadius: 6, border: 'none', cursor: 'pointer' }}>
              Admit New Patient
            </button>
          </div>
          <GridModule rowData={data} columnDefs={cols} onRowDoubleClicked={handleRowDoubleClicked} height="100%" />
        </div>
      }
      detailNode={detail}
    />
  );
}
