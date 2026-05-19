"use client";
import React, { useState, useEffect } from 'react';
import apiClient from '@/lib/apiClient';
import SummaryDetailLayout from '@/components/shared/SummaryDetailLayout';
import FormModeSelector, { FormMode } from '@/components/shared/FormModeSelector';
import GridModule from '@/components/shared/GridModule';
import { ColDef } from 'ag-grid-community';

export default function ServiceGroup() {
  const [data, setData] = useState<any[]>([]);
  const [mode, setMode] = useState<FormMode>('View');
  const [activeTab, setActiveTab] = useState<'summary' | 'detail'>('summary');
  const [currentRecord, setCurrentRecord] = useState<any>({});
  
  useEffect(() => {
    fetchData();
  }, []);

  const fetchData = async () => {
    const res = await apiClient.get('/services/groups');
    setData(res.data);
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
        SgpName: '', SgpIndex: 0, SgpExpanded: false, SgpEditable: false,
        SgpInfAllowed: false, SgpDefAllowed: false, SgpDiscAllowed: false, SgpDiscPer: 0,
        SgpExtRateSys: false, SgpDctwseRateSys: false, SgpPcgwseRateSys: false, SgpRBywseRateSys: false, SgpRTowseRateSys: false, SgpTimewseRateSys: false,
        SgpExtDiscSys: false, SgpDctwseDiscSys: false, SgpPcgwseDiscSys: false,
        SgpExtBargSys: false, SgpExtShareSys: false, SgpDctwseShareSys: false,
        SgpShowInList: true
      });
      setActiveTab('detail');
    } else if (newMode === 'Delete' && currentRecord.SgpCode) {
      if (window.confirm('Delete this Service Group recursively?')) {
        apiClient.delete(`/services/groups/${currentRecord.SgpCode}`).then(() => {
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
      if (mode === 'New') await apiClient.post('/services/groups', payload);
      else if (mode === 'Edit') await apiClient.put(`/services/groups/${currentRecord.SgpCode}`, payload);
      
      fetchData();
      setMode('View');
      setActiveTab('summary');
    } catch (err) {
      alert('Save failed!');
    }
  };

  const cols: ColDef[] = [
    { field: 'SgpCode', headerName: 'ID', width: 80 },
    { field: 'SgpName', headerName: 'Group Name', flex: 1 },
    { field: 'SgpShowInList', headerName: 'Visible', width: 100 },
    { field: 'SgpExtRateSys', headerName: 'Ext Rate Sys', width: 120 }
  ];

  const summary = (
    <div style={{ height: '100%', display: 'flex', flexDirection: 'column', gap: '10px' }}>
      <div style={{ padding: '0 0 10px 0' }}>
        <h2>Service Groups Configuration</h2>
      </div>
      <FormModeSelector mode={mode} onModeChange={handleModeChange} />
      <div style={{ flex: 1, minHeight: 0 }}>
        <GridModule rowData={data} columnDefs={cols} onRowDoubleClicked={handleRowDoubleClicked} height="100%" />
      </div>
    </div>
  );

  const isReadonly = mode === 'View';
  const inputStyle = { padding: '8px', background: isReadonly ? 'rgba(0,0,0,0.2)' : 'rgba(255,255,255,0.05)', border: '1px solid #555', color: '#fff', borderRadius: 4 };

  const CheckboxItem = ({ label, field }: { label: string, field: string }) => (
    <label style={{ display: 'flex', alignItems: 'center', gap: 6, fontSize: 13, background: 'rgba(0,0,0,0.2)', padding: '6px 10px', borderRadius: 4, border: '1px solid #444' }}>
      <input 
        type="checkbox" 
        disabled={isReadonly} 
        checked={currentRecord[field] || false} 
        onChange={e => setCurrentRecord({ ...currentRecord, [field]: e.target.checked })} 
      />
      {label}
    </label>
  );

  const detail = (
    <div style={{ padding: '10px 0' }}>
      <div style={{ display: 'flex', justifyContent: 'space-between', marginBottom: 20 }}>
        <h2>Service Group Builder</h2>
        <FormModeSelector mode={mode} onModeChange={handleModeChange} />
      </div>

      <form onSubmit={handleSave} style={{ display: 'flex', flexDirection: 'column', gap: '20px', maxWidth: '900px' }}>
        {/* Core Info */}
        <div style={{ display: 'flex', gap: 20 }}>
          <div style={{ display: 'flex', flexDirection: 'column', gap: '5px', width: 100 }}>
            <label>Group Code</label>
            <input type="text" value={currentRecord?.SgpCode || '(Auto)'} disabled style={{ ...inputStyle, background: 'rgba(0,0,0,0.2)' }} />
          </div>
          <div style={{ display: 'flex', flexDirection: 'column', gap: '5px', flex: 1 }}>
            <label>Group Name *</label>
            <input type="text" required disabled={isReadonly} value={currentRecord?.SgpName || ''} onChange={e => setCurrentRecord({...currentRecord, SgpName: e.target.value})} style={inputStyle} />
          </div>
        </div>

        {/* Matrix Rules */}
        <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '20px', background: 'rgba(255,255,255,0.02)', padding: 15, borderRadius: 8, border: '1px solid #333' }}>
          
          {/* Rate Systems */}
          <div>
            <h4 style={{ color: '#3bc9db', marginBottom: 10 }}>Rate Dependencies</h4>
            <div style={{ display: 'grid', gridTemplateColumns: '1fr', gap: '8px' }}>
              <CheckboxItem label="Enable External Rate System" field="SgpExtRateSys" />
              <CheckboxItem label="Doctor-Wise Rate Dependency" field="SgpDctwseRateSys" />
              <CheckboxItem label="Patient-Wise Category Rate Dependency" field="SgpPcgwseRateSys" />
              <CheckboxItem label="Referral-By-Wise Rate Dependency" field="SgpRBywseRateSys" />
              <CheckboxItem label="Referral-To-Wise Rate Dependency" field="SgpRTowseRateSys" />
              <CheckboxItem label="Time-Based (Clock) Rate Dependency" field="SgpTimewseRateSys" />
            </div>
          </div>

          {/* Discount & Share Systems */}
          <div>
            <h4 style={{ color: '#ff8787', marginBottom: 10 }}>Discount & Revenue Shares</h4>
            <div style={{ display: 'grid', gridTemplateColumns: '1fr', gap: '8px' }}>
              <CheckboxItem label="Enable External Discount System" field="SgpExtDiscSys" />
              <CheckboxItem label="Doctor-Wise Discount System" field="SgpDctwseDiscSys" />
              <CheckboxItem label="Patient-Wise Category Discount System" field="SgpPcgwseDiscSys" />
              <hr style={{ borderColor: '#444' }} />
              <CheckboxItem label="Enable Generic Sharing System" field="SgpExtShareSys" />
              <CheckboxItem label="Doctor-Wise Sharing Protocol" field="SgpDctwseShareSys" />
            </div>
          </div>
          
        </div>

        {/* Generic Flag Settings */}
        <div style={{ background: 'rgba(255,255,255,0.02)', padding: 15, borderRadius: 8, border: '1px solid #333' }}>
            <h4 style={{ color: '#adb5bd', marginBottom: 10 }}>Global Security Toggles</h4>
            <div style={{ display: 'flex', flexWrap: 'wrap', gap: '10px' }}>
              <CheckboxItem label="Is Editable by Desk" field="SgpEditable" />
              <CheckboxItem label="Allow Record Inflation" field="SgpInfAllowed" />
              <CheckboxItem label="Allow Record Deflation" field="SgpDefAllowed" />
              <CheckboxItem label="Allow Fixed Discounts" field="SgpDiscAllowed" />
              <CheckboxItem label="Allow External Bargaining" field="SgpExtBargSys" />
              <CheckboxItem label="Show In Billing Drops" field="SgpShowInList" />
            </div>
        </div>

        {!isReadonly && (
          <div style={{ marginTop: 10 }}>
            <button type="submit" style={{ padding: '10px 20px', background: '#3bc9db', color: '#0b1420', fontWeight: 'bold', borderRadius: 6, border: 'none', cursor: 'pointer' }}>Save Settings Map</button>
            <button type="button" onClick={() => { setMode('View'); setActiveTab('summary'); }} style={{ marginLeft: 10, padding: '10px 20px', background: 'transparent', color: '#adb5bd', border: '1px solid #adb5bd', borderRadius: 6, cursor: 'pointer' }}>Cancel</button>
          </div>
        )}
      </form>
    </div>
  );

  return <SummaryDetailLayout activeTab={activeTab} onTabChange={setActiveTab} summaryNode={summary} detailNode={detail} />;
}
