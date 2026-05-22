"use client";
import React, { useState, useEffect } from 'react';
import apiClient from '@/lib/apiClient';
import SummaryDetailLayout from '@/components/shared/SummaryDetailLayout';
import FormModeSelector, { FormMode } from '@/components/shared/FormModeSelector';
import GridModule from '@/components/shared/GridModule';
import { ColDef } from 'ag-grid-community';

export default function PatientCategory() {
  const [data, setData] = useState<any[]>([]);
  const [mode, setMode] = useState<FormMode>('View');
  const [activeTab, setActiveTab] = useState<'summary' | 'detail'>('summary');
  const [currentRecord, setCurrentRecord] = useState<any>({});
  
  useEffect(() => {
    fetchData();
  }, []);

  const fetchData = async () => {
    try {
      const res = await apiClient.get('/masters/patient-category');
      setData(res.data);
    } catch (e) {
      console.error(e);
    }
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
        PcgName: '',
        PcgInfAllowed: false,
        PcgDefAllowed: false,
        PcgDiscAllowed: false,
        PcgDiscPer: 0,
        PcgShowInList: true
      });
      setActiveTab('detail');
    } else if (newMode === 'Delete' && currentRecord.PcgCode) {
      if (window.confirm('Delete this record logically?')) {
        apiClient.delete(`/masters/patient-category/${currentRecord.PcgCode}`)
          .then(() => {
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
      if (mode === 'New') {
        await apiClient.post('/masters/patient-category', currentRecord);
      } else if (mode === 'Edit') {
        await apiClient.put(`/masters/patient-category/${currentRecord.PcgCode}`, currentRecord);
      }
      fetchData();
      setMode('View');
      setActiveTab('summary');
    } catch (err) {
      alert('Save failed!');
    }
  };

  const cols: ColDef[] = [
    { field: 'PcgCode', headerName: 'Code', width: 80 },
    { field: 'PcgName', headerName: 'Category Name', flex: 1 },
    { field: 'PcgDiscPer', headerName: 'Discount %', width: 120 }
  ];

  const summary = (
    <div style={{ height: '100%', display: 'flex', flexDirection: 'column', gap: '10px' }}>
      <div style={{ padding: '0 0 10px 0', borderBottom: '1px solid var(--border-color)' }}>
        <h2 style={{ margin: 0 }}>Patient Categories</h2>
        <p style={{  fontSize: 14 }}>Manage global patient billing classifications</p>
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
      <div style={{ padding: '0 0 10px 0', display: 'flex', justifyContent: 'space-between', borderBottom: '1px solid var(--border-color)', marginBottom: '15px' }}>
        <div>
          <h2 style={{ margin: 0 }}>Patient Category Entry</h2>
          <p style={{  fontSize: 14 }}>{mode} Mode</p>
        </div>
        <FormModeSelector mode={mode} onModeChange={handleModeChange} />
      </div>

      <form onSubmit={handleSave} className="dashboard-grid" style={{ maxWidth: '800px' }}>
        <div className="form-group">
          <label className="form-label">Category Code</label>
          <input className="form-control" type="text" value={currentRecord?.PcgCode || '(Auto)'} disabled style={{ padding: '8px',    borderRadius: 4 }} />
        </div>
        <div className="form-group">
          <label className="form-label">Category Name *</label>
          <input className="form-control" 
            type="text" 
            required 
            disabled={isReadonly}
            value={currentRecord?.PcgName || ''} 
            onChange={e => setCurrentRecord({...currentRecord, PcgName: e.target.value})}
            style={{ padding: '8px', background: isReadonly ? 'rgba(0,0,0,0.2)' : 'rgba(255,255,255,0.05)',   borderRadius: 4 }} 
          />
        </div>
        
        <div className="form-group">
          <label className="form-label">Discount %</label>
          <input className="form-control" 
            type="number" 
            disabled={isReadonly}
            value={currentRecord?.PcgDiscPer || 0} 
            onChange={e => setCurrentRecord({...currentRecord, PcgDiscPer: parseFloat(e.target.value)})}
            style={{ padding: '8px', background: isReadonly ? 'rgba(0,0,0,0.2)' : 'rgba(255,255,255,0.05)',   borderRadius: 4 }} 
          />
        </div>

        <div style={{ gridColumn: '1 / -1', display: 'flex', gap: '20px', marginTop: 10 }}>
          <label style={{ display: 'flex', alignItems: 'center', gap: 5 }}>
            <input className="form-control" type="checkbox" disabled={isReadonly} checked={currentRecord?.PcgInfAllowed || false} onChange={e => setCurrentRecord({...currentRecord, PcgInfAllowed: e.target.checked})} />
            Inflation Allowed
          </label>
          <label style={{ display: 'flex', alignItems: 'center', gap: 5 }}>
            <input className="form-control" type="checkbox" disabled={isReadonly} checked={currentRecord?.PcgDefAllowed || false} onChange={e => setCurrentRecord({...currentRecord, PcgDefAllowed: e.target.checked})} />
            Deflation Allowed
          </label>
          <label style={{ display: 'flex', alignItems: 'center', gap: 5 }}>
            <input className="form-control" type="checkbox" disabled={isReadonly} checked={currentRecord?.PcgDiscAllowed || false} onChange={e => setCurrentRecord({...currentRecord, PcgDiscAllowed: e.target.checked})} />
            Discount Allowed
          </label>
          <label style={{ display: 'flex', alignItems: 'center', gap: 5 }}>
            <input className="form-control" type="checkbox" disabled={isReadonly} checked={currentRecord?.PcgShowInList || false} onChange={e => setCurrentRecord({...currentRecord, PcgShowInList: e.target.checked})} />
            Show In List
          </label>
        </div>

        {!isReadonly && (
          <div className="form-actions" style={{ gridColumn: '1 / -1' }}>
            <button className="btn btn-primary" type="submit">
              Save Record
            </button>
            <button className="btn" type="button" onClick={() => { setMode('View'); setActiveTab('summary'); }}>
              Cancel
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
      summaryNode={summary} 
      detailNode={detail} 
    />
  );
}
