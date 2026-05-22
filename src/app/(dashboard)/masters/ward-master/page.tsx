"use client";
import React, { useState, useEffect } from 'react';
import apiClient from '@/lib/apiClient';
import SummaryDetailLayout from '@/components/shared/SummaryDetailLayout';
import FormModeSelector, { FormMode } from '@/components/shared/FormModeSelector';
import GridModule from '@/components/shared/GridModule';
import { ColDef } from 'ag-grid-community';

export default function WardMaster() {
  const [data, setData] = useState<any[]>([]);
  const [mode, setMode] = useState<FormMode>('View');
  const [activeTab, setActiveTab] = useState<'summary' | 'detail'>('summary');
  const [currentRecord, setCurrentRecord] = useState<any>({});
  
  useEffect(() => {
    fetchData();
  }, []);

  const fetchData = async () => {
    const res = await apiClient.get('/masters/ward-master');
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
      setCurrentRecord({ WrdName: '' });
      setActiveTab('detail');
    } else if (newMode === 'Delete' && currentRecord.WrdCode) {
      if (window.confirm('Delete this ward logically?')) {
        apiClient.delete(`/masters/ward-master/${currentRecord.WrdCode}`).then(() => {
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
      if (mode === 'New') await apiClient.post('/masters/ward-master', payload);
      else if (mode === 'Edit') await apiClient.put(`/masters/ward-master/${currentRecord.WrdCode}`, payload);
      
      fetchData();
      setMode('View');
      setActiveTab('summary');
    } catch (err) {
      alert('Save failed!');
    }
  };

  const cols: ColDef[] = [
    { field: 'WrdCode', headerName: 'Code', width: 100 },
    { field: 'WrdName', headerName: 'Ward Name', flex: 1 }
  ];

  const summary = (
    <div style={{ height: '100%', display: 'flex', flexDirection: 'column', gap: '10px' }}>
      <div style={{ padding: '0 0 10px 0', borderBottom: '1px solid var(--border-color)' }}>
        <h2 style={{ margin: 0 }}>Ward Master Directory</h2>
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
        <h2 style={{ margin: 0 }}>Ward Profile Entry</h2>
        <FormModeSelector mode={mode} onModeChange={handleModeChange} />
      </div>

      <form onSubmit={handleSave} className="dashboard-grid" style={{ maxWidth: '500px' }}>
        <div className="form-group">
          <label className="form-label">Ward Code</label>
          <input className="form-control" type="text" value={currentRecord?.WrdCode || '(Auto)'} disabled />
        </div>
        
        <div className="form-group" style={{ gridColumn: '1 / -1' }}>
          <label className="form-label">Ward Name *</label>
          <input className="form-control" type="text" required disabled={isReadonly} value={currentRecord?.WrdName || ''} onChange={e => setCurrentRecord({...currentRecord, WrdName: e.target.value})} />
        </div>

        {!isReadonly && (
          <div className="form-actions" style={{ gridColumn: '1 / -1' }}>
            <button className="btn" type="button" onClick={() => { setMode('View'); setActiveTab('summary'); }}>Cancel</button>
            <button className="btn btn-primary" type="submit">Save Record</button>
          </div>
        )}
      </form>
    </div>
  );

  return <SummaryDetailLayout activeTab={activeTab} onTabChange={setActiveTab} summaryNode={summary} detailNode={detail} />;
}
