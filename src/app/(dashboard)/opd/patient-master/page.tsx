"use client";
import React, { useState, useEffect } from 'react';
import apiClient from '@/lib/apiClient';
import SummaryDetailLayout from '@/components/shared/SummaryDetailLayout';
import FormModeSelector, { FormMode } from '@/components/shared/FormModeSelector';
import GridModule from '@/components/shared/GridModule';
import LookupField from '@/components/shared/LookupField';
import { ColDef } from 'ag-grid-community';
import { format } from 'date-fns';

export default function PatientMaster() {
  const [data, setData] = useState<any[]>([]);
  const [mode, setMode] = useState<FormMode>('View');
  const [activeTab, setActiveTab] = useState<'summary' | 'detail'>('summary');
  const [currentRecord, setCurrentRecord] = useState<any>({});
  
  useEffect(() => {
    fetchData();
  }, []);

  const fetchData = async () => {
    const res = await apiClient.get('/opd/patient-master');
    setData(res.data);
  };

  const handleRowDoubleClicked = (row: any) => {
    // Format dates for inputs
    const mapped = { ...row };
    if (mapped.PttDob) mapped.PttDob = format(new Date(mapped.PttDob), 'yyyy-MM-dd');
    if (mapped.PttAgeAsOnDt) mapped.PttAgeAsOnDt = format(new Date(mapped.PttAgeAsOnDt), 'yyyy-MM-dd');
    
    setCurrentRecord(mapped);
    setMode('View');
    setActiveTab('detail');
  };

  const handleModeChange = (newMode: FormMode) => {
    setMode(newMode);
    if (newMode === 'New') {
      setCurrentRecord({
        PttName: '', PttSex: 'M', PttTelNo: '',
        PttDob: format(new Date(), 'yyyy-MM-dd'),
        PttAgeAsOnDt: format(new Date(), 'yyyy-MM-dd'),
        PttPcgCode: null, PttAraCode: null, PttStnCode: null
      });
      setActiveTab('detail');
    } else if (newMode === 'Delete' && currentRecord.PttCode) {
      if (window.confirm('Delete this patient universally?')) {
        apiClient.delete(`/opd/patient-master/${currentRecord.PttCode}`).then(() => {
          fetchData();
          setMode('View');
          setActiveTab('summary');
        });
      }
    }
  };

  const handleSave = async (e: React.FormEvent) => {
    e.preventDefault();
    try {
      const payload = { ...currentRecord };
      delete payload.Category;
      delete payload.Area;
      delete payload.Station;

      if (mode === 'New') await apiClient.post('/opd/patient-master', payload);
      else if (mode === 'Edit') await apiClient.put(`/opd/patient-master/${currentRecord.PttCode}`, payload);
      
      fetchData();
      setMode('View');
      setActiveTab('summary');
    } catch (err) {
      alert('Save failed!');
    }
  };

  const cols: ColDef[] = [
    { field: 'PttCode', headerName: 'MRN', width: 100 },
    { field: 'PttName', headerName: 'Patient Name', flex: 1 },
    { field: 'PttSex', headerName: 'Gender', width: 100 },
    { field: 'PttTelNo', headerName: 'Contact', width: 150 },
    { field: 'Category.PcgName', headerName: 'Category', flex: 1 },
    { field: 'Area.AraName', headerName: 'Area', flex: 1 }
  ];

  const summary = (
    <div style={{ height: '100%', display: 'flex', flexDirection: 'column', gap: '10px' }}>
      <div style={{ padding: '0 0 10px 0' }}>
        <h2>Patient Master (Central Demographics)</h2>
      </div>
      <FormModeSelector mode={mode} onModeChange={handleModeChange} />
      <div style={{ flex: 1, minHeight: 0 }}>
        <GridModule rowData={data} columnDefs={cols} onRowDoubleClicked={handleRowDoubleClicked} height="100%" />
      </div>
    </div>
  );

  const isReadonly = mode === 'View';
  const inputStyle = { padding: '8px', background: isReadonly ? 'rgba(0,0,0,0.2)' : 'rgba(255,255,255,0.05)', border: '1px solid #555', color: '#fff', borderRadius: 4 };

  const detail = (
    <div style={{ padding: '10px 0' }}>
      <div style={{ padding: '0 0 10px 0', display: 'flex', justifyContent: 'space-between' }}>
        <h2>Patient Registration Profile</h2>
        <FormModeSelector mode={mode} onModeChange={handleModeChange} />
      </div>

      <form onSubmit={handleSave} style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '20px', maxWidth: '800px', marginTop: 20 }}>
        <div style={{ display: 'flex', flexDirection: 'column', gap: '5px' }}>
          <label>Medical Record Number (MRN)</label>
          <input type="text" value={currentRecord?.PttCode || '(Auto)'} disabled style={{ ...inputStyle, background: 'rgba(0,0,0,0.2)' }} />
        </div>
        
        <div style={{ display: 'flex', flexDirection: 'column', gap: '5px' }}>
          <label>Gender *</label>
          <select disabled={isReadonly} required value={currentRecord?.PttSex || 'M'} onChange={e => setCurrentRecord({...currentRecord, PttSex: e.target.value})} style={inputStyle}>
            <option value="M">Male</option>
            <option value="F">Female</option>
            <option value="O">Other</option>
          </select>
        </div>

        <div style={{ display: 'flex', flexDirection: 'column', gap: '5px', gridColumn: '1 / -1' }}>
          <label>Patient Full Name *</label>
          <input type="text" required disabled={isReadonly} value={currentRecord?.PttName || ''} onChange={e => setCurrentRecord({...currentRecord, PttName: e.target.value})} style={inputStyle} />
        </div>

        <div style={{ display: 'flex', flexDirection: 'column', gap: '5px' }}>
          <label>Date Of Birth Tracking</label>
          <input type="date" disabled={isReadonly} value={currentRecord?.PttDob || ''} onChange={e => setCurrentRecord({...currentRecord, PttDob: e.target.value})} style={inputStyle} />
        </div>

        <div style={{ display: 'flex', flexDirection: 'column', gap: '5px' }}>
          <label>Contact Num</label>
          <input type="text" disabled={isReadonly} value={currentRecord?.PttTelNo || ''} onChange={e => setCurrentRecord({...currentRecord, PttTelNo: e.target.value})} style={inputStyle} />
        </div>

        <div style={{ display: 'flex', flexDirection: 'column', gap: '5px' }}>
          <label>Patient Billing Category</label>
          <LookupField 
            endpoint="/masters/patient-category" 
            valueKey="PcgCode" 
            labelKey="PcgName" 
            value={currentRecord?.PttPcgCode} 
            onChange={(val) => setCurrentRecord({...currentRecord, PttPcgCode: val})} 
            disabled={isReadonly} 
          />
        </div>
        
        <div style={{ display: 'flex', flexDirection: 'column', gap: '5px' }}>
          <label>Address Info</label>
          <input type="text" disabled={isReadonly} value={currentRecord?.PttAddr || ''} onChange={e => setCurrentRecord({...currentRecord, PttAddr: e.target.value})} style={inputStyle} />
        </div>

        <div style={{ display: 'flex', flexDirection: 'column', gap: '5px' }}>
          <label>Geographic Area Code</label>
          <LookupField 
            endpoint="/opd/area-master" 
            valueKey="AraCode" 
            labelKey="AraName" 
            value={currentRecord?.PttAraCode} 
            onChange={(val) => setCurrentRecord({...currentRecord, PttAraCode: val})} 
            disabled={isReadonly} 
          />
        </div>

        <div style={{ display: 'flex', flexDirection: 'column', gap: '5px' }}>
          <label>Geographic Station Code</label>
          <LookupField 
            endpoint="/opd/station-master" 
            valueKey="StnCode" 
            labelKey="StnName" 
            value={currentRecord?.PttStnCode} 
            onChange={(val) => setCurrentRecord({...currentRecord, PttStnCode: val})} 
            disabled={isReadonly} 
          />
        </div>

        {!isReadonly && (
          <div style={{ gridColumn: '1 / -1', marginTop: 20 }}>
            <button type="submit" style={{ padding: '10px 20px', background: '#3bc9db', color: '#0b1420', fontWeight: 'bold', borderRadius: 6, border: 'none', cursor: 'pointer' }}>Save Record</button>
            <button type="button" onClick={() => { setMode('View'); setActiveTab('summary'); }} style={{ marginLeft: 10, padding: '10px 20px', background: 'transparent', color: '#adb5bd', border: '1px solid #adb5bd', borderRadius: 6, cursor: 'pointer' }}>Cancel</button>
          </div>
        )}
      </form>
    </div>
  );

  return <SummaryDetailLayout activeTab={activeTab} onTabChange={setActiveTab} summaryNode={summary} detailNode={detail} />;
}
