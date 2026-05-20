"use client";
import React, { useState, useEffect } from 'react';
import apiClient from '@/lib/apiClient';
import SummaryDetailLayout from '@/components/shared/SummaryDetailLayout';
import FormModeSelector, { FormMode } from '@/components/shared/FormModeSelector';
import GridModule from '@/components/shared/GridModule';
import { ColDef } from 'ag-grid-community';
import { Settings, Plus, ShoppingBag } from 'lucide-react';

export default function PharmacyItems() {
  const [data, setData] = useState<any[]>([]);
  const [groups, setGroups] = useState<any[]>([]);
  const [mode, setMode] = useState<FormMode>('View');
  const [activeTab, setActiveTab] = useState<'summary' | 'detail'>('summary');
  const [currentRecord, setCurrentRecord] = useState<any>({});

  useEffect(() => {
    fetchData();
    fetchGroups();
  }, []);

  const fetchData = async () => {
    try {
      const res = await apiClient.get('/pharmacy/items');
      setData(res.data);
    } catch (err) {
      console.error('Fetch pharmacy items error:', err);
    }
  };

  const fetchGroups = async () => {
    try {
      const res = await apiClient.get('/pharmacy/item-groups');
      setGroups(res.data);
    } catch (err) {
      console.error('Fetch item groups error:', err);
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
        SimName: '',
        SimSigCode: groups[0]?.SigCode || null
      });
      setActiveTab('detail');
    } else if (newMode === 'Delete' && currentRecord.SimCode) {
      if (window.confirm('Delete this item?')) {
        apiClient.delete(`/pharmacy/items/${currentRecord.SimCode}`).then(() => {
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
        await apiClient.post('/pharmacy/items', currentRecord);
      } else if (mode === 'Edit') {
        await apiClient.put(`/pharmacy/items/${currentRecord.SimCode}`, currentRecord);
      }
      fetchData();
      setMode('View');
      setActiveTab('summary');
    } catch (err) {
      alert('Save failed! Check required fields.');
    }
  };

  const cols: ColDef[] = [
    { field: 'SimCode', headerName: 'Item Code', width: 120 },
    { field: 'SimName', headerName: 'Item Name', flex: 1 },
    { field: 'group.SigName', headerName: 'Item Group', flex: 1 }
  ];

  const isReadonly = mode === 'View';
  const inputStyle = { padding: '8px', background: isReadonly ? 'rgba(0,0,0,0.2)' : 'rgba(255,255,255,0.05)', border: '1px solid #555', color: '#fff', borderRadius: 4, width: '100%' };

  const detail = (
    <div style={{ padding: '10px 0' }}>
      <div style={{ display: 'flex', justifyContent: 'space-between', marginBottom: 20 }}>
        <h2>Pharmacy Item Configuration</h2>
        <FormModeSelector mode={mode} onModeChange={handleModeChange} />
      </div>

      <form onSubmit={handleSave} style={{ display: 'flex', flexDirection: 'column', gap: 20 }}>
        <div style={{ padding: 20, background: 'rgba(255,255,255,0.02)', borderRadius: 12, border: '1px solid #333', display: 'flex', flexDirection: 'column', gap: 20 }}>
          <h3 style={{ margin: 0, fontSize: 16, color: '#3bc9db', display: 'flex', alignItems: 'center', gap: 10 }}>
            <ShoppingBag size={18} /> Item Metadata
          </h3>
          <div>
            <label>Item Name *</label>
            <input 
              type="text" 
              required
              value={currentRecord.SimName || ''} 
              disabled={isReadonly} 
              onChange={e => setCurrentRecord({...currentRecord, SimName: e.target.value})} 
              style={inputStyle} 
            />
          </div>
          <div>
            <label>Item Group *</label>
            <select 
              value={currentRecord.SimSigCode || ''} 
              disabled={isReadonly} 
              onChange={e => setCurrentRecord({...currentRecord, SimSigCode: parseInt(e.target.value) || null})} 
              style={inputStyle}
            >
              <option value="">-- Choose Item Group --</option>
              {groups.map(g => (
                <option key={g.SigCode} value={g.SigCode}>{g.SigName}</option>
              ))}
            </select>
          </div>
        </div>

        {!isReadonly && (
          <div style={{ display: 'flex', justifyContent: 'flex-end', gap: 10 }}>
            <button type="submit" style={{ padding: '12px 32px', background: '#3bc9db', color: '#0b1420', fontWeight: 'bold', borderRadius: 8, border: 'none', cursor: 'pointer' }}>
              Save Item
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
              <Settings size={24} color="#3bc9db" /> Pharmacy Item Master
            </h2>
            <button onClick={() => handleModeChange('New')} style={{ padding: '8px 16px', background: '#3bc9db', color: '#0b1420', fontWeight: 'bold', borderRadius: 6, border: 'none', cursor: 'pointer' }}>
              New Item
            </button>
          </div>
          <GridModule rowData={data} columnDefs={cols} onRowDoubleClicked={handleRowDoubleClicked} height="100%" />
        </div>
      }
      detailNode={detail}
    />
  );
}
