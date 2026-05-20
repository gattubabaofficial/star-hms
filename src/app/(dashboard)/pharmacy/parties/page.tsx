"use client";
import React, { useState, useEffect } from 'react';
import apiClient from '@/lib/apiClient';
import SummaryDetailLayout from '@/components/shared/SummaryDetailLayout';
import FormModeSelector, { FormMode } from '@/components/shared/FormModeSelector';
import GridModule from '@/components/shared/GridModule';
import { ColDef } from 'ag-grid-community';
import { Settings, Users, Home } from 'lucide-react';

export default function PharmacyParties() {
  const [data, setData] = useState<any[]>([]);
  const [groups, setGroups] = useState<any[]>([]);
  const [areas, setAreas] = useState<any[]>([]);
  const [mode, setMode] = useState<FormMode>('View');
  const [activeTab, setActiveTab] = useState<'summary' | 'detail'>('summary');
  const [currentRecord, setCurrentRecord] = useState<any>({});

  useEffect(() => {
    fetchData();
    fetchGroups();
    fetchAreas();
  }, []);

  const fetchData = async () => {
    try {
      const res = await apiClient.get('/pharmacy/parties');
      setData(res.data);
    } catch (err) {
      console.error('Fetch pharmacy parties error:', err);
    }
  };

  const fetchGroups = async () => {
    try {
      const res = await apiClient.get('/pharmacy/party-groups');
      setGroups(res.data);
    } catch (err) {
      console.error('Fetch party groups error:', err);
    }
  };

  const fetchAreas = async () => {
    try {
      const res = await apiClient.get('/opd/area-master');
      setAreas(res.data);
    } catch (err) {
      console.error('Fetch areas error:', err);
    }
  };

  const handleRowDoubleClicked = (row: any) => {
    setCurrentRecord({ ...row });
    setMode('View');
    setActiveTab('detail');
  };

  const handleModeChange = (newMode: FormMode) => {
    setMode(newMode);
    if (newMode === 'New') {
      setCurrentRecord({
        PryName: '',
        PryPgpCode: groups[0]?.PgpCode || null,
        PryAraCode: areas[0]?.AraCode || null,
        PryAddr: '',
        PryTelNo: '',
        PryEmail: ''
      });
      setActiveTab('detail');
    } else if (newMode === 'Delete' && currentRecord.PryCode) {
      if (window.confirm('Delete this supplier/party?')) {
        apiClient.delete(`/pharmacy/parties/${currentRecord.PryCode}`).then(() => {
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
        await apiClient.post('/pharmacy/parties', currentRecord);
      } else if (mode === 'Edit') {
        await apiClient.put(`/pharmacy/parties/${currentRecord.PryCode}`, currentRecord);
      }
      fetchData();
      setMode('View');
      setActiveTab('summary');
    } catch (err) {
      alert('Save failed! Check required fields.');
    }
  };

  const cols: ColDef[] = [
    { field: 'PryCode', headerName: 'Supplier Code', width: 120 },
    { field: 'PryName', headerName: 'Supplier Name', flex: 1 },
    { field: 'group.PgpName', headerName: 'Party Group', width: 150 },
    { field: 'PryTelNo', headerName: 'Contact No', width: 150 },
    { field: 'PryEmail', headerName: 'Email', flex: 1 }
  ];

  const isReadonly = mode === 'View';
  const inputStyle = { padding: '8px', background: isReadonly ? 'rgba(0,0,0,0.2)' : 'rgba(255,255,255,0.05)', border: '1px solid #555', color: '#fff', borderRadius: 4, width: '100%' };

  const detail = (
    <div style={{ padding: '10px 0' }}>
      <div style={{ display: 'flex', justifyContent: 'space-between', marginBottom: 20 }}>
        <h2>Party Supplier Configuration</h2>
        <FormModeSelector mode={mode} onModeChange={handleModeChange} />
      </div>

      <form onSubmit={handleSave} style={{ display: 'flex', flexDirection: 'column', gap: 20 }}>
        <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: 20 }}>
          {/* Supplier Info */}
          <div style={{ padding: 20, background: 'rgba(255,255,255,0.02)', borderRadius: 12, border: '1px solid #333', display: 'flex', flexDirection: 'column', gap: 15 }}>
            <h3 style={{ margin: 0, fontSize: 16, color: '#3bc9db', display: 'flex', alignItems: 'center', gap: 10 }}>
              <Users size={18} /> Supplier Identification
            </h3>
            <div>
              <label>Supplier Name *</label>
              <input 
                type="text" 
                required
                value={currentRecord.PryName || ''} 
                disabled={isReadonly} 
                onChange={e => setCurrentRecord({...currentRecord, PryName: e.target.value})} 
                style={inputStyle} 
              />
            </div>
            <div>
              <label>Party Group *</label>
              <select 
                value={currentRecord.PryPgpCode || ''} 
                disabled={isReadonly} 
                onChange={e => setCurrentRecord({...currentRecord, PryPgpCode: parseInt(e.target.value) || null})} 
                style={inputStyle}
              >
                <option value="">-- Choose Party Group --</option>
                {groups.map(g => (
                  <option key={g.PgpCode} value={g.PgpCode}>{g.PgpName}</option>
                ))}
              </select>
            </div>
            <div>
              <label>Operating Area *</label>
              <select 
                value={currentRecord.PryAraCode || ''} 
                disabled={isReadonly} 
                onChange={e => setCurrentRecord({...currentRecord, PryAraCode: parseInt(e.target.value) || null})} 
                style={inputStyle}
              >
                <option value="">-- Choose Area --</option>
                {areas.map(a => (
                  <option key={a.AraCode} value={a.AraCode}>{a.AraName}</option>
                ))}
              </select>
            </div>
          </div>

          {/* Contact Details */}
          <div style={{ padding: 20, background: 'rgba(255,255,255,0.02)', borderRadius: 12, border: '1px solid #333', display: 'flex', flexDirection: 'column', gap: 15 }}>
            <h3 style={{ margin: 0, fontSize: 16, color: '#3bc9db', display: 'flex', alignItems: 'center', gap: 10 }}>
              <Home size={18} /> Contact & Demographics
            </h3>
            <div>
              <label>Telephone/Mobile</label>
              <input 
                type="text" 
                value={currentRecord.PryTelNo || ''} 
                disabled={isReadonly} 
                onChange={e => setCurrentRecord({...currentRecord, PryTelNo: e.target.value})} 
                style={inputStyle} 
              />
            </div>
            <div>
              <label>Email Address</label>
              <input 
                type="email" 
                value={currentRecord.PryEmail || ''} 
                disabled={isReadonly} 
                onChange={e => setCurrentRecord({...currentRecord, PryEmail: e.target.value})} 
                style={inputStyle} 
              />
            </div>
            <div>
              <label>Street Address</label>
              <textarea 
                value={currentRecord.PryAddr || ''} 
                disabled={isReadonly} 
                onChange={e => setCurrentRecord({...currentRecord, PryAddr: e.target.value})} 
                style={{ ...inputStyle, height: 75, resize: 'none' }} 
              />
            </div>
          </div>
        </div>

        {!isReadonly && (
          <div style={{ display: 'flex', justifyContent: 'flex-end', gap: 10 }}>
            <button type="submit" style={{ padding: '12px 32px', background: '#3bc9db', color: '#0b1420', fontWeight: 'bold', borderRadius: 8, border: 'none', cursor: 'pointer' }}>
              Save Supplier
            </button>
            <button type="button" onClick={() => setActiveTab('summary')} style={{ padding: '12px 24px', background: 'transparent', color: '#adb5bd', border: '1px solid #555', borderRadius: 8, cursor: 'pointer' }}>
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
      summaryNode={
        <div style={{ height: '100%', display: 'flex', flexDirection: 'column', gap: 10 }}>
          <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
            <h2 style={{ display: 'flex', alignItems: 'center', gap: 10 }}>
              <Settings size={24} color="#3bc9db" /> Supplier Party Master
            </h2>
            <button onClick={() => handleModeChange('New')} style={{ padding: '8px 16px', background: '#3bc9db', color: '#0b1420', fontWeight: 'bold', borderRadius: 6, border: 'none', cursor: 'pointer' }}>
              New Supplier
            </button>
          </div>
          <GridModule rowData={data} columnDefs={cols} onRowDoubleClicked={handleRowDoubleClicked} height="100%" />
        </div>
      }
      detailNode={detail}
    />
  );
}
