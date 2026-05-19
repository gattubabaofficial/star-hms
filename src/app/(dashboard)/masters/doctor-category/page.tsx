"use client";
import React, { useState, useEffect } from 'react';
import apiClient from '@/lib/apiClient';
import SummaryDetailLayout from '@/components/shared/SummaryDetailLayout';
import FormModeSelector, { FormMode } from '@/components/shared/FormModeSelector';
import GridModule from '@/components/shared/GridModule';
import { ColDef } from 'ag-grid-community';

export default function DoctorCategory() {
  const [data, setData] = useState<any[]>([]);
  const [mode, setMode] = useState<FormMode>('View');
  const [activeTab, setActiveTab] = useState<'summary' | 'detail'>('summary');
  const [currentRecord, setCurrentRecord] = useState<any>({});
  
  useEffect(() => {
    fetchData();
  }, []);

  const fetchData = async () => {
    const res = await apiClient.get('/masters/doctor-category');
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
      setCurrentRecord({ DcgName: '' });
      setActiveTab('detail');
    } else if (newMode === 'Delete' && currentRecord.DcgCode) {
      if (window.confirm('Delete this record?')) {
        apiClient.delete(`/masters/doctor-category/${currentRecord.DcgCode}`).then(() => {
          fetchData();
          setMode('View');
          setActiveTab('summary');
        });
      }
    }
  };

  const handleSave = async (e: React.FormEvent) => {
    e.preventDefault();
    if (mode === 'New') await apiClient.post('/masters/doctor-category', currentRecord);
    else if (mode === 'Edit') await apiClient.put(`/masters/doctor-category/${currentRecord.DcgCode}`, currentRecord);
    fetchData();
    setMode('View');
    setActiveTab('summary');
  };

  const cols: ColDef[] = [
    { field: 'DcgCode', headerName: 'Code', width: 80 },
    { field: 'DcgName', headerName: 'Doctor Category', flex: 1 },
  ];

  const summary = (
    <div style={{ height: '100%', display: 'flex', flexDirection: 'column', gap: '10px' }}>
      <div style={{ padding: '0 0 10px 0' }}>
        <h2>Doctor Categories</h2>
      </div>
      <FormModeSelector mode={mode} onModeChange={handleModeChange} />
      <div style={{ flex: 1, minHeight: 0 }}>
        <GridModule rowData={data} columnDefs={cols} onRowDoubleClicked={handleRowDoubleClicked} height="100%" />
      </div>
    </div>
  );

  const isReadonly = mode === 'View';

  const detail = (
    <div style={{ padding: '10px 0' }}>
      <div style={{ padding: '0 0 10px 0', display: 'flex', justifyContent: 'space-between' }}>
        <h2>Doctor Category Entry</h2>
        <FormModeSelector mode={mode} onModeChange={handleModeChange} />
      </div>

      <form onSubmit={handleSave} style={{ display: 'flex', flexDirection: 'column', gap: '20px', maxWidth: '400px', marginTop: 20 }}>
        <div style={{ display: 'flex', flexDirection: 'column', gap: '5px' }}>
          <label>Category Code</label>
          <input type="text" value={currentRecord?.DcgCode || '(Auto)'} disabled style={{ padding: '8px', background: 'rgba(0,0,0,0.2)', border: '1px solid #333', color: '#fff', borderRadius: 4 }} />
        </div>
        <div style={{ display: 'flex', flexDirection: 'column', gap: '5px' }}>
          <label>Category Name *</label>
          <input 
            type="text" required disabled={isReadonly}
            value={currentRecord?.DcgName || ''} 
            onChange={e => setCurrentRecord({...currentRecord, DcgName: e.target.value})}
            style={{ padding: '8px', background: isReadonly ? 'rgba(0,0,0,0.2)' : 'rgba(255,255,255,0.05)', border: '1px solid #555', color: '#fff', borderRadius: 4 }} 
          />
        </div>

        {!isReadonly && (
          <div style={{ marginTop: 20 }}>
            <button type="submit" style={{ padding: '10px 20px', background: '#3bc9db', color: '#0b1420', fontWeight: 'bold', borderRadius: 6, border: 'none', cursor: 'pointer' }}>Save Record</button>
            <button type="button" onClick={() => { setMode('View'); setActiveTab('summary'); }} style={{ marginLeft: 10, padding: '10px 20px', background: 'transparent', color: '#adb5bd', border: '1px solid #adb5bd', borderRadius: 6, cursor: 'pointer' }}>Cancel</button>
          </div>
        )}
      </form>
    </div>
  );

  return <SummaryDetailLayout activeTab={activeTab} onTabChange={setActiveTab} summaryNode={summary} detailNode={detail} />;
}
