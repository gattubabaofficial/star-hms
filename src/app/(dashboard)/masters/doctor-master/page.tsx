"use client";
import React, { useState, useEffect } from 'react';
import apiClient from '@/lib/apiClient';
import SummaryDetailLayout from '@/components/shared/SummaryDetailLayout';
import FormModeSelector, { FormMode } from '@/components/shared/FormModeSelector';
import GridModule from '@/components/shared/GridModule';
import LookupField from '@/components/shared/LookupField';
import { ColDef } from 'ag-grid-community';

export default function DoctorMaster() {
  const [data, setData] = useState<any[]>([]);
  const [mode, setMode] = useState<FormMode>('View');
  const [activeTab, setActiveTab] = useState<'summary' | 'detail'>('summary');
  const [currentRecord, setCurrentRecord] = useState<any>({});
  
  useEffect(() => {
    fetchData();
  }, []);

  const fetchData = async () => {
    const res = await apiClient.get('/masters/doctor-master');
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
        DctTitle: '', DctName: '', DctSpeci: '', DctShare: 0,
        DctAddr: '', DctTelNo: '', DctEmail: '',
        DctDcgCode: null, DctDrlCode: null
      });
      setActiveTab('detail');
    } else if (newMode === 'Delete' && currentRecord.DctCode) {
      if (window.confirm('Delete this consultant record logically?')) {
        apiClient.delete(`/masters/doctor-master/${currentRecord.DctCode}`).then(() => {
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
      // Strip out relation objects from GET response when doing PUT/POST
      delete payload.Category;
      delete payload.Role;

      if (mode === 'New') await apiClient.post('/masters/doctor-master', payload);
      else if (mode === 'Edit') await apiClient.put(`/masters/doctor-master/${currentRecord.DctCode}`, payload);
      
      fetchData();
      setMode('View');
      setActiveTab('summary');
    } catch (err) {
      alert('Save failed!');
    }
  };

  const cols: ColDef[] = [
    { field: 'DctCode', headerName: 'Code', width: 80 },
    { field: 'DctName', headerName: 'Consultant', flex: 1 },
    { field: 'DctSpeci', headerName: 'Speciality', flex: 1 },
    { field: 'Category.DcgName', headerName: 'Category', flex: 1 }
  ];

  const summary = (
    <div style={{ height: '100%', display: 'flex', flexDirection: 'column', gap: '10px' }}>
      <div style={{ padding: '0 0 10px 0', borderBottom: '1px solid var(--border-color)' }}>
        <h2 style={{ margin: 0 }}>Consultant Directory</h2>
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
        <h2 style={{ margin: 0 }}>Consultant Profile Entry</h2>
        <FormModeSelector mode={mode} onModeChange={handleModeChange} />
      </div>

      <form onSubmit={handleSave} className="dashboard-grid" style={{ maxWidth: '800px' }}>
        <div className="form-group">
          <label className="form-label">Doctor Code</label>
          <input className="form-control" type="text" value={currentRecord?.DctCode || '(Auto)'} disabled />
        </div>
        
        <div className="form-group">
          <label className="form-label">Title</label>
          <input className="form-control" type="text" disabled={isReadonly} value={currentRecord?.DctTitle || ''} onChange={e => setCurrentRecord({...currentRecord, DctTitle: e.target.value})} />
        </div>

        <div className="form-group" style={{ gridColumn: '1 / -1' }}>
          <label className="form-label">Name *</label>
          <input className="form-control" type="text" required disabled={isReadonly} value={currentRecord?.DctName || ''} onChange={e => setCurrentRecord({...currentRecord, DctName: e.target.value})} />
        </div>

        <div className="form-group">
          <label className="form-label">Speciality</label>
          <input className="form-control" type="text" disabled={isReadonly} value={currentRecord?.DctSpeci || ''} onChange={e => setCurrentRecord({...currentRecord, DctSpeci: e.target.value})} />
        </div>

        <div className="form-group">
          <label className="form-label">Contact Num</label>
          <input className="form-control" type="text" disabled={isReadonly} value={currentRecord?.DctTelNo || ''} onChange={e => setCurrentRecord({...currentRecord, DctTelNo: e.target.value})} />
        </div>

        <div className="form-group">
          <label className="form-label">Category Mapping</label>
          <LookupField 
            endpoint="/masters/doctor-category" 
            valueKey="DcgCode" 
            labelKey="DcgName" 
            value={currentRecord?.DctDcgCode} 
            onChange={(val: any) => setCurrentRecord({...currentRecord, DctDcgCode: val})} 
            disabled={isReadonly} 
          />
        </div>

        <div className="form-group">
          <label className="form-label">Security Role Mapping</label>
          <LookupField 
            endpoint="/masters/doctor-role" 
            valueKey="DrlCode" 
            labelKey="DrlName" 
            value={currentRecord?.DctDrlCode} 
            onChange={(val: any) => setCurrentRecord({...currentRecord, DctDrlCode: val})} 
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
