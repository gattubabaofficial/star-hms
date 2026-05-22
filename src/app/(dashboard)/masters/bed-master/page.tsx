"use client";
import React, { useState, useEffect } from 'react';
import apiClient from '@/lib/apiClient';
import SummaryDetailLayout from '@/components/shared/SummaryDetailLayout';
import FormModeSelector, { FormMode } from '@/components/shared/FormModeSelector';
import GridModule from '@/components/shared/GridModule';
import LookupField from '@/components/shared/LookupField';
import { ColDef } from 'ag-grid-community';

export default function BedMaster() {
  const [data, setData] = useState<any[]>([]);
  const [mode, setMode] = useState<FormMode>('View');
  const [activeTab, setActiveTab] = useState<'summary' | 'detail'>('summary');
  const [currentRecord, setCurrentRecord] = useState<any>({});
  
  useEffect(() => {
    fetchData();
  }, []);

  const fetchData = async () => {
    const res = await apiClient.get('/masters/bed-master');
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
      setCurrentRecord({ BdmName: '', BdmWrdCode: null, BdmFlrCode: null, BdmSts: 0 }); // 0 = Available
      setActiveTab('detail');
    } else if (newMode === 'Delete' && currentRecord.BdmCode) {
      if (window.confirm('Delete this bed logically?')) {
        apiClient.delete(`/masters/bed-master/${currentRecord.BdmCode}`).then(() => {
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
      delete payload.ward;
      delete payload.floor;
      
      if (mode === 'New') await apiClient.post('/masters/bed-master', payload);
      else if (mode === 'Edit') await apiClient.put(`/masters/bed-master/${currentRecord.BdmCode}`, payload);
      
      fetchData();
      setMode('View');
      setActiveTab('summary');
    } catch (err) {
      alert('Save failed!');
    }
  };

  const cols: ColDef[] = [
    { field: 'BdmCode', headerName: 'Bed Code', width: 100 },
    { field: 'BdmName', headerName: 'Bed Name/No.', flex: 1 },
    { field: 'ward.WrdName', headerName: 'Ward', flex: 1 },
    { field: 'floor.FlrName', headerName: 'Floor', flex: 1 }
  ];

  const summary = (
    <div style={{ height: '100%', display: 'flex', flexDirection: 'column', gap: '10px' }}>
      <div style={{ padding: '0 0 10px 0', borderBottom: '1px solid var(--border-color)' }}>
        <h2 style={{ margin: 0 }}>Bed Master Directory</h2>
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
        <h2 style={{ margin: 0 }}>Bed Profile Entry</h2>
        <FormModeSelector mode={mode} onModeChange={handleModeChange} />
      </div>

      <form onSubmit={handleSave} className="dashboard-grid" style={{ maxWidth: '800px' }}>
        <div className="form-group">
          <label className="form-label">Bed Code</label>
          <input className="form-control" type="text" value={currentRecord?.BdmCode || '(Auto)'} disabled />
        </div>
        
        <div className="form-group">
          <label className="form-label">Bed Name/No. *</label>
          <input className="form-control" type="text" required disabled={isReadonly} value={currentRecord?.BdmName || ''} onChange={e => setCurrentRecord({...currentRecord, BdmName: e.target.value})} />
        </div>

        <div className="form-group">
          <label className="form-label">Ward Mapping</label>
          <LookupField 
            endpoint="/masters/ward-master" 
            valueKey="WrdCode" 
            labelKey="WrdName" 
            value={currentRecord?.BdmWrdCode} 
            onChange={(val: any) => setCurrentRecord({...currentRecord, BdmWrdCode: val})} 
            disabled={isReadonly} 
          />
        </div>

        <div className="form-group">
          <label className="form-label">Floor Mapping</label>
          <LookupField 
            endpoint="/masters/floor-master" 
            valueKey="FlrCode" 
            labelKey="FlrName" 
            value={currentRecord?.BdmFlrCode} 
            onChange={(val: any) => setCurrentRecord({...currentRecord, BdmFlrCode: val})} 
            disabled={isReadonly} 
          />
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
