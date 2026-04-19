"use client";
import React, { useState, useEffect } from 'react';
import apiClient from '@/lib/apiClient';
import SummaryDetailLayout from '@/components/shared/SummaryDetailLayout';
import FormModeSelector, { FormMode } from '@/components/shared/FormModeSelector';
import GridModule from '@/components/shared/GridModule';
import LookupField from '@/components/shared/LookupField';
import { ColDef } from 'ag-grid-community';

export default function ReferralMaster() {
  const [data, setData] = useState<any[]>([]);
  const [mode, setMode] = useState<FormMode>('View');
  const [activeTab, setActiveTab] = useState<'summary' | 'detail'>('summary');
  const [currentRecord, setCurrentRecord] = useState<any>({});
  
  useEffect(() => {
    fetchData();
  }, []);

  const fetchData = async () => {
    const res = await apiClient.get('/masters/referral-master');
    setData(res.data);
  };

  const handleRowDoubleClicked = (row: any) => {
    setCurrentRecord(row);
    setMode('View');
    setActiveTab('detail');
  };

  const handleModeChange = (newMode: FormMode) => {
    setMode(newMode);
    if (newMode === 'New') {
      setCurrentRecord({
        RByName: '', RBySpeci: '', RByShare: 0,
        RByAddr: '', RByTelNo: '', RByEmail: '',
        RByRfgCode: null
      });
      setActiveTab('detail');
    } else if (newMode === 'Delete' && currentRecord.RByCode) {
      if (window.confirm('Delete this referral record logically?')) {
        apiClient.delete(`/masters/referral-master/${currentRecord.RByCode}`).then(() => {
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

      if (mode === 'New') await apiClient.post('/masters/referral-master', payload);
      else if (mode === 'Edit') await apiClient.put(`/masters/referral-master/${currentRecord.RByCode}`, payload);
      
      fetchData();
      setMode('View');
      setActiveTab('summary');
    } catch (err) {
      alert('Save failed!');
    }
  };

  const cols: ColDef[] = [
    { field: 'RByCode', headerName: 'Code', width: 80 },
    { field: 'RByName', headerName: 'Referral Name', flex: 1 },
    { field: 'RBySpeci', headerName: 'Speciality', flex: 1 },
    { field: 'Category.RfgName', headerName: 'Category', flex: 1 }
  ];

  const summary = (
    <div style={{ height: '100%', display: 'flex', flexDirection: 'column', gap: '10px' }}>
      <div style={{ padding: '0 0 10px 0' }}>
        <h2>Referral Directory</h2>
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
        <h2>Referral External Config</h2>
        <FormModeSelector mode={mode} onModeChange={handleModeChange} />
      </div>

      <form onSubmit={handleSave} style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '20px', maxWidth: '800px', marginTop: 20 }}>
        <div style={{ display: 'flex', flexDirection: 'column', gap: '5px' }}>
          <label>Referral Code</label>
          <input type="text" value={currentRecord?.RByCode || '(Auto)'} disabled style={{ ...inputStyle, background: 'rgba(0,0,0,0.2)' }} />
        </div>

        <div style={{ display: 'flex', flexDirection: 'column', gap: '5px' }}>
          <label>Name *</label>
          <input type="text" required disabled={isReadonly} value={currentRecord?.RByName || ''} onChange={e => setCurrentRecord({...currentRecord, RByName: e.target.value})} style={inputStyle} />
        </div>

        <div style={{ display: 'flex', flexDirection: 'column', gap: '5px' }}>
          <label>Speciality</label>
          <input type="text" disabled={isReadonly} value={currentRecord?.RBySpeci || ''} onChange={e => setCurrentRecord({...currentRecord, RBySpeci: e.target.value})} style={inputStyle} />
        </div>

        <div style={{ display: 'flex', flexDirection: 'column', gap: '5px' }}>
          <label>Contact Num</label>
          <input type="text" disabled={isReadonly} value={currentRecord?.RByTelNo || ''} onChange={e => setCurrentRecord({...currentRecord, RByTelNo: e.target.value})} style={inputStyle} />
        </div>

        <div style={{ display: 'flex', flexDirection: 'column', gap: '5px' }}>
          <label>Email ID</label>
          <input type="email" disabled={isReadonly} value={currentRecord?.RByEmail || ''} onChange={e => setCurrentRecord({...currentRecord, RByEmail: e.target.value})} style={inputStyle} />
        </div>

        <div style={{ display: 'flex', flexDirection: 'column', gap: '5px' }}>
          <label>Referral Category</label>
          <LookupField 
            endpoint="/masters/referral-category" 
            valueKey="RfgCode" 
            labelKey="RfgName" 
            value={currentRecord?.RByRfgCode} 
            onChange={(val: any) => setCurrentRecord({...currentRecord, RByRfgCode: val})} 
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
