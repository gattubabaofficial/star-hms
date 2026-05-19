"use client";
import React, { useState, useEffect } from 'react';
import apiClient from '@/lib/apiClient';
import SummaryDetailLayout from '@/components/shared/SummaryDetailLayout';
import FormModeSelector, { FormMode } from '@/components/shared/FormModeSelector';
import GridModule from '@/components/shared/GridModule';
import LookupField from '@/components/shared/LookupField';
import { ColDef } from 'ag-grid-community';
import { format } from 'date-fns';

export default function Registration() {
  const [data, setData] = useState<any[]>([]);
  const [mode, setMode] = useState<FormMode>('View');
  const [activeTab, setActiveTab] = useState<'summary' | 'detail'>('summary');
  const [currentRecord, setCurrentRecord] = useState<any>({});
  
  useEffect(() => {
    fetchData();
  }, []);

  const fetchData = async () => {
    const res = await apiClient.get('/opd/registration');
    setData(res.data);
  };

  const handleRowDoubleClicked = (row: any) => {
    const mapped = { ...row };
    if (mapped.OpgDate) mapped.OpgDate = format(new Date(mapped.OpgDate), 'yyyy-MM-dd');
    setCurrentRecord(mapped);
    setMode('View');
    setActiveTab('detail');
  };

  const handleModeChange = (newMode: FormMode) => {
    setMode(newMode);
    if (newMode === 'New') {
      setCurrentRecord({
        OpgDate: format(new Date(), 'yyyy-MM-dd'),
        OpgPttCode: null, 
        OpgCDctCode: null,
        OpgRByCode: null,
        OpgRate: 0,
        OpgDiscPer: 0,
        OpgDiscAmt: 0,
        OpgAmtAftDisc: 0
      });
      setActiveTab('detail');
    } else if (newMode === 'Delete' && currentRecord.OpgCode) {
      if (window.confirm('Delete this registration natively?')) {
        apiClient.delete(`/opd/registration/${currentRecord.OpgCode}`).then(() => {
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
      delete payload.Patient;
      delete payload.ConsultingDoctor;
      delete payload.ReferredBy;

      if (mode === 'New') await apiClient.post('/opd/registration', payload);
      else if (mode === 'Edit') await apiClient.put(`/opd/registration/${currentRecord.OpgCode}`, payload);
      
      fetchData();
      setMode('View');
      setActiveTab('summary');
    } catch (err) {
      alert('Save failed!');
    }
  };

  const cols: ColDef[] = [
    { field: 'OpgVchNo', headerName: 'Voucher No', width: 100 },
    { field: 'OpgDate', headerName: 'Date', width: 120, valueFormatter: params => params.value ? format(new Date(params.value), 'dd/MM/yyyy') : '' },
    { field: 'Patient.PttName', headerName: 'Patient Name', flex: 1 },
    { field: 'ConsultingDoctor.DctName', headerName: 'Consultant', flex: 1 },
    { field: 'OpgAmtAftDisc', headerName: 'Amount', width: 120 }
  ];

  const summary = (
    <div style={{ height: '100%', display: 'flex', flexDirection: 'column', gap: '10px' }}>
      <div style={{ padding: '0 0 10px 0' }}>
        <h2>Outpatient Registration Directory</h2>
      </div>
      <FormModeSelector mode={mode} onModeChange={handleModeChange} />
      <div style={{ flex: 1, minHeight: 0 }}>
        <GridModule rowData={data} columnDefs={cols} onRowDoubleClicked={handleRowDoubleClicked} height="100%" />
      </div>
    </div>
  );

  const isReadonly = mode === 'View';
  const inputStyle = { padding: '8px', background: isReadonly ? 'rgba(0,0,0,0.2)' : 'rgba(255,255,255,0.05)', border: '1px solid #555', color: '#fff', borderRadius: 4 };

  return (
    <SummaryDetailLayout 
      activeTab={activeTab} 
      onTabChange={setActiveTab} 
      summaryNode={summary} 
      detailNode={
        <div style={{ padding: '10px 0' }}>
          <div style={{ padding: '0 0 10px 0', display: 'flex', justifyContent: 'space-between' }}>
            <h2>New Consultation Registration</h2>
            <div>
              <button disabled style={{ marginRight: 10, padding: '8px 16px', background: 'transparent', color: '#adb5bd', border: '1px solid #555', borderRadius: 4 }}>
                Print Receipt
              </button>
              <FormModeSelector mode={mode} onModeChange={handleModeChange} />
            </div>
          </div>

          <form onSubmit={handleSave} style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '20px', maxWidth: '800px', marginTop: 20 }}>
            <div style={{ display: 'flex', flexDirection: 'column', gap: '5px' }}>
              <label>Voucher Number</label>
              <input type="text" value={currentRecord?.OpgVchNo || '(Auto)'} disabled style={{ ...inputStyle, background: 'rgba(0,0,0,0.2)' }} />
            </div>

            <div style={{ display: 'flex', flexDirection: 'column', gap: '5px' }}>
              <label>Registration Date</label>
              <input type="date" disabled={isReadonly} value={currentRecord?.OpgDate || ''} onChange={e => setCurrentRecord({...currentRecord, OpgDate: e.target.value})} style={inputStyle} />
            </div>

            <div style={{ display: 'flex', flexDirection: 'column', gap: '5px', gridColumn: '1 / -1' }}>
              <label>Patient ID Lookup *</label>
              <LookupField 
                endpoint="/opd/patient-master" 
                valueKey="PttCode" 
                labelKey="PttName" 
                value={currentRecord?.OpgPttCode} 
                onChange={(val) => setCurrentRecord({...currentRecord, OpgPttCode: val})} 
                disabled={isReadonly} 
              />
            </div>

            <div style={{ display: 'flex', flexDirection: 'column', gap: '5px' }}>
              <label>Consulting Doctor</label>
              <LookupField 
                endpoint="/masters/doctor-master" 
                valueKey="DctCode" 
                labelKey="DctName" 
                value={currentRecord?.OpgCDctCode} 
                onChange={(val) => setCurrentRecord({...currentRecord, OpgCDctCode: val})} 
                disabled={isReadonly} 
              />
            </div>

            <div style={{ display: 'flex', flexDirection: 'column', gap: '5px' }}>
              <label>Referred By</label>
              <LookupField 
                endpoint="/masters/referral-master" 
                valueKey="RByCode" 
                labelKey="RByName" 
                value={currentRecord?.OpgRByCode} 
                onChange={(val) => setCurrentRecord({...currentRecord, OpgRByCode: val})} 
                disabled={isReadonly} 
              />
            </div>

            <hr style={{ gridColumn: '1 / -1', border: 'none', borderBottom: '1px solid #333', margin: '10px 0' }} />

            <div style={{ display: 'flex', flexDirection: 'column', gap: '5px' }}>
              <label>Consultation Rate</label>
              <input type="number" disabled={isReadonly} value={currentRecord?.OpgRate || 0} onChange={e => setCurrentRecord({...currentRecord, OpgRate: parseFloat(e.target.value)})} style={inputStyle} />
            </div>

            <div style={{ display: 'flex', flexDirection: 'column', gap: '5px' }}>
              <label>Discount %</label>
              <input type="number" disabled={isReadonly} value={currentRecord?.OpgDiscPer || 0} onChange={e => {
                const perc = parseFloat(e.target.value) || 0;
                const amt = (currentRecord.OpgRate || 0) * (perc / 100);
                setCurrentRecord({...currentRecord, OpgDiscPer: perc, OpgDiscAmt: amt, OpgAmtAftDisc: (currentRecord.OpgRate || 0) - amt});
              }} style={inputStyle} />
            </div>

            <div style={{ display: 'flex', flexDirection: 'column', gap: '5px' }}>
              <label>Calculated Net Amount</label>
              <input type="number" value={currentRecord?.OpgAmtAftDisc || currentRecord?.OpgRate || 0} disabled style={{ ...inputStyle, background: 'rgba(0,0,0,0.2)' }} />
            </div>

            {!isReadonly && (
              <div style={{ gridColumn: '1 / -1', marginTop: 20 }}>
                <button type="submit" style={{ padding: '10px 20px', background: '#3bc9db', color: '#0b1420', fontWeight: 'bold', borderRadius: 6, border: 'none', cursor: 'pointer' }}>Register Patient</button>
                <button type="button" onClick={() => { setMode('View'); setActiveTab('summary'); }} style={{ marginLeft: 10, padding: '10px 20px', background: 'transparent', color: '#adb5bd', border: '1px solid #adb5bd', borderRadius: 6, cursor: 'pointer' }}>Cancel</button>
              </div>
            )}
          </form>
        </div>
      } 
    />
  );
}
