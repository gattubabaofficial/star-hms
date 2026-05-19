"use client";
import React, { useState, useEffect } from 'react';
import apiClient from '@/lib/apiClient';
import SummaryDetailLayout from '@/components/shared/SummaryDetailLayout';
import FormModeSelector, { FormMode } from '@/components/shared/FormModeSelector';
import GridModule from '@/components/shared/GridModule';
import LookupField from '@/components/shared/LookupField';
import { ColDef } from 'ag-grid-community';

type MasterType = 'Floors' | 'Wards' | 'Beds';

export default function InpatientMasters() {
  const [activeMaster, setActiveMaster] = useState<MasterType>('Beds');
  const [data, setData] = useState<any[]>([]);
  const [mode, setMode] = useState<FormMode>('View');
  const [activeTab, setActiveTab] = useState<'summary' | 'detail'>('summary');
  const [currentRecord, setCurrentRecord] = useState<any>({});

  useEffect(() => {
    fetchData();
  }, [activeMaster]);

  const fetchData = async () => {
    const endpointMap = { Floors: '/ipd/floors', Wards: '/ipd/wards', Beds: '/ipd/beds' };
    const res = await apiClient.get(endpointMap[activeMaster]);
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
      const initialMap = {
        Floors: { FlrName: '', FlrShowInList: true },
        Wards: { WrdName: '' },
        Beds: { BdmName: '', BdmWrdCode: null, BdmFlrCode: null, BdmCharges: 0, BdmSrvCode: null }
      };
      setCurrentRecord(initialMap[activeMaster]);
      setActiveTab('detail');
    }
  };

  const handleSave = async (e: React.FormEvent) => {
    e.preventDefault();
    const endpointMap = { Floors: '/ipd/floors', Wards: '/ipd/wards', Beds: '/ipd/beds' };
    await apiClient.post(endpointMap[activeMaster], currentRecord);
    fetchData();
    setMode('View');
    setActiveTab('summary');
  };

  const columnsMap: Record<MasterType, ColDef[]> = {
    Floors: [{ field: 'FlrCode', headerName: 'ID', width: 80 }, { field: 'FlrName', headerName: 'Floor Name', flex: 1 }],
    Wards: [{ field: 'WrdCode', headerName: 'ID', width: 80 }, { field: 'WrdName', headerName: 'Ward Name', flex: 1 }],
    Beds: [
      { field: 'BdmCode', headerName: 'ID', width: 80 },
      { field: 'BdmName', headerName: 'Bed Name', flex: 1 },
      { field: 'Ward.WrdName', headerName: 'Ward', width: 120 },
      { field: 'Floor.FlrName', headerName: 'Floor', width: 120 },
      { field: 'BdmCharges', headerName: 'Base Charge', width: 120 }
    ]
  };

  const summary = (
    <div style={{ height: '100%', display: 'flex', flexDirection: 'column', gap: 10 }}>
      <div style={{ display: 'flex', gap: 10, background: 'rgba(255,255,255,0.05)', padding: 10, borderRadius: 8 }}>
        {(['Beds', 'Wards', 'Floors'] as MasterType[]).map(m => (
          <button 
            key={m} 
            onClick={() => { setActiveMaster(m); setMode('View'); setActiveTab('summary'); }}
            style={{ 
              padding: '8px 16px', borderRadius: 6, border: 'none', cursor: 'pointer',
              background: activeMaster === m ? '#3bc9db' : 'transparent',
              color: activeMaster === m ? '#0b1420' : '#adb5bd',
              fontWeight: 'bold'
            }}
          >
            {m}
          </button>
        ))}
      </div>
      <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
        <h2>Hospital {activeMaster} Framework</h2>
        <FormModeSelector mode={mode} onModeChange={handleModeChange} />
      </div>
      <GridModule rowData={data} columnDefs={columnsMap[activeMaster]} onRowDoubleClicked={handleRowDoubleClicked} height="100%" />
    </div>
  );

  const inputStyle = { padding: '8px', background: 'rgba(255,255,255,0.05)', border: '1px solid #555', color: '#fff', borderRadius: 4, width: '100%' };

  const detail = (
    <div style={{ padding: '10px 0' }}>
       <div style={{ display: 'flex', justifyContent: 'space-between', marginBottom: 20 }}>
        <h2>Configure {activeMaster.slice(0, -1)}</h2>
        <FormModeSelector mode={mode} onModeChange={handleModeChange} />
      </div>
      <form onSubmit={handleSave} style={{ maxWidth: 500, display: 'flex', flexDirection: 'column', gap: 20 }}>
        {activeMaster === 'Floors' && (
          <div>
            <label>Floor Name</label>
            <input type="text" value={currentRecord.FlrName || ''} onChange={e => setCurrentRecord({...currentRecord, FlrName: e.target.value})} style={inputStyle} />
          </div>
        )}
        {activeMaster === 'Wards' && (
          <div>
            <label>Ward Name</label>
            <input type="text" value={currentRecord.WrdName || ''} onChange={e => setCurrentRecord({...currentRecord, WrdName: e.target.value})} style={inputStyle} />
          </div>
        )}
        {activeMaster === 'Beds' && (
          <>
            <div>
              <label>Bed Identifier/Name</label>
              <input type="text" value={currentRecord.BdmName || ''} onChange={e => setCurrentRecord({...currentRecord, BdmName: e.target.value})} style={inputStyle} />
            </div>
            <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: 10 }}>
              <div>
                <label>Ward Mapping</label>
                <LookupField endpoint="/ipd/wards" valueKey="WrdCode" labelKey="WrdName" value={currentRecord.BdmWrdCode} onChange={v => setCurrentRecord({...currentRecord, BdmWrdCode: v})} />
              </div>
              <div>
                <label>Floor Mapping</label>
                <LookupField endpoint="/ipd/floors" valueKey="FlrCode" labelKey="FlrName" value={currentRecord.BdmFlrCode} onChange={v => setCurrentRecord({...currentRecord, BdmFlrCode: v})} />
              </div>
            </div>
            <div>
              <label>Service Rate Entity (BdmCharges)</label>
              <input type="number" value={currentRecord.BdmCharges || 0} onChange={e => setCurrentRecord({...currentRecord, BdmCharges: parseFloat(e.target.value)})} style={inputStyle} />
            </div>
          </>
        )}
        {mode !== 'View' && (
          <button type="submit" style={{ padding: '12px', background: '#3bc9db', color: '#0b1420', fontWeight: 'bold', borderRadius: 6, border: 'none', cursor: 'pointer' }}>
            Save Selection
          </button>
        )}
      </form>
    </div>
  );

  return <SummaryDetailLayout activeTab={activeTab} onTabChange={setActiveTab} summaryNode={summary} detailNode={detail} />;
}
