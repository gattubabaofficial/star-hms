"use client";
import React, { useState, useEffect } from 'react';
import apiClient from '@/lib/apiClient';
import SummaryDetailLayout from '@/components/shared/SummaryDetailLayout';
import FormModeSelector, { FormMode } from '@/components/shared/FormModeSelector';
import GridModule from '@/components/shared/GridModule';
import LookupField from '@/components/shared/LookupField';
import { ColDef } from 'ag-grid-community';

export default function ServiceMaster() {
  const [data, setData] = useState<any[]>([]);
  const [mode, setMode] = useState<FormMode>('View');
  const [activeTab, setActiveTab] = useState<'summary' | 'detail'>('summary');
  const [currentRecord, setCurrentRecord] = useState<any>({});
  
  useEffect(() => {
    fetchData();
  }, []);

  const fetchData = async () => {
    const res = await apiClient.get('/services/master');
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
        SrvName: '', SrvSgpCode: null, SrvCharges: 0, SrvIndex: 0,
        SrvRateEditable: false, SrvAmtEditable: false, SrvUnitEditable: false,
        SrvMultiDct: false, SrvShowInList: true,
        SrvAutoInsIndr: false, SrvAutoInsOnceIndr: false, SrvAutoCalcIndr: false,
        SrvInfAllowed: false, SrvDefAllowed: false, SrvDiscAllowed: false,
        SrvExtRateSys: false, SrvExtDiscSys: false, SrvExtShareSys: false, SrvExtBargSys: false
      });
      setActiveTab('detail');
    } else if (newMode === 'Delete' && currentRecord.SrvCode) {
      if (window.confirm('Delete this Service definitively?')) {
        apiClient.delete(`/services/master/${currentRecord.SrvCode}`).then(() => {
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
      delete payload.Group;

      if (mode === 'New') await apiClient.post('/services/master', payload);
      else if (mode === 'Edit') await apiClient.put(`/services/master/${currentRecord.SrvCode}`, payload);
      
      fetchData();
      setMode('View');
      setActiveTab('summary');
    } catch (err) {
      alert('Save failed!');
    }
  };

  const cols: ColDef[] = [
    { field: 'SrvCode', headerName: 'ID', width: 80 },
    { field: 'SrvName', headerName: 'Service Name', flex: 1 },
    { field: 'Group.SgpName', headerName: 'Assigned Group', flex: 1 },
    { field: 'SrvCharges', headerName: 'Base Charges', width: 150 }
  ];

  const summary = (
    <div style={{ height: '100%', display: 'flex', flexDirection: 'column', gap: '10px' }}>
      <div style={{ padding: '0 0 10px 0' }}>
        <h2>Hospital Service Definitions</h2>
      </div>
      <FormModeSelector mode={mode} onModeChange={handleModeChange} />
      <div style={{ flex: 1, minHeight: 0 }}>
        <GridModule rowData={data} columnDefs={cols} onRowDoubleClicked={handleRowDoubleClicked} height="100%" />
      </div>
    </div>
  );

  const isReadonly = mode === 'View';
  const inputStyle = { padding: '8px', background: isReadonly ? 'rgba(0,0,0,0.2)' : 'rgba(255,255,255,0.05)',   borderRadius: 4 };

  const CheckboxItem = ({ label, field }: { label: string, field: string }) => (
    <label style={{ display: 'flex', alignItems: 'center', gap: 6, fontSize: 13,  padding: '6px 10px', borderRadius: 4, border: '1px solid #444' }}>
      <input className="form-control" 
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
        <h2>Service Definition Profile</h2>
        <FormModeSelector mode={mode} onModeChange={handleModeChange} />
      </div>

      <form onSubmit={handleSave} style={{ display: 'flex', flexDirection: 'column', gap: '20px', maxWidth: '800px' }}>
        <div style={{ display: 'flex', gap: 20 }}>
          <div style={{ display: 'flex', flexDirection: 'column', gap: '5px', width: 100 }}>
            <label>Service Code</label>
            <input className="form-control" type="text" value={currentRecord?.SrvCode || '(Auto)'} disabled style={{ ...inputStyle }} />
          </div>
          <div style={{ display: 'flex', flexDirection: 'column', gap: '5px', flex: 1 }}>
            <label>Service Description/Name *</label>
            <input className="form-control" type="text" required disabled={isReadonly} value={currentRecord?.SrvName || ''} onChange={e => setCurrentRecord({...currentRecord, SrvName: e.target.value})}  />
          </div>
        </div>

        <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '20px' }}>
          <div style={{ display: 'flex', flexDirection: 'column', gap: '5px' }}>
            <label>Inherited Service Group</label>
            <LookupField 
              endpoint="/services/groups" 
              valueKey="SgpCode" 
              labelKey="SgpName" 
              value={currentRecord?.SrvSgpCode} 
              onChange={(val) => setCurrentRecord({...currentRecord, SrvSgpCode: val})} 
              disabled={isReadonly} 
            />
          </div>
          <div style={{ display: 'flex', flexDirection: 'column', gap: '5px' }}>
            <label>Base Configured Charges</label>
            <input className="form-control" type="number" disabled={isReadonly} value={currentRecord?.SrvCharges || 0} onChange={e => setCurrentRecord({...currentRecord, SrvCharges: parseFloat(e.target.value)})}  />
          </div>
        </div>

        <h4 style={{  marginTop: 10 }}>Service Modifier Flags</h4>
        <div style={{  padding: 15,  display: 'flex', flexWrap: 'wrap', gap: '10px' }}>
          <CheckboxItem label="Rate Value Editable" field="SrvRateEditable" />
          <CheckboxItem label="Amount Value Editable" field="SrvAmtEditable" />
          <CheckboxItem label="Unit Quantity Editable" field="SrvUnitEditable" />
          <CheckboxItem label="Support Multiple Doctors" field="SrvMultiDct" />
          <CheckboxItem label="Inflation Allowed" field="SrvInfAllowed" />
          <CheckboxItem label="Deflation Allowed" field="SrvDefAllowed" />
          <CheckboxItem label="Disc/Bargain Allowed" field="SrvDiscAllowed" />
          <CheckboxItem label="External Rate Mapping" field="SrvExtRateSys" />
          <CheckboxItem label="External Discount Mapping" field="SrvExtDiscSys" />
          <CheckboxItem label="IPD Auto Integration" field="SrvAutoInsIndr" />
          <CheckboxItem label="Show In Master UI Lists" field="SrvShowInList" />
        </div>

        {!isReadonly && (
          <div style={{ marginTop: 10 }}>
            <button type="submit" className="btn btn-primary">Apply Service Data</button>
            <button type="button" onClick={() => { setMode('View'); setActiveTab('summary'); }} style={{ marginLeft: 10, padding: '10px 20px',  border: '1px solid #adb5bd', borderRadius: 6 }}>Cancel</button>
          </div>
        )}
      </form>
    </div>
  );

  return <SummaryDetailLayout activeTab={activeTab} onTabChange={setActiveTab} summaryNode={summary} detailNode={detail} />;
}
