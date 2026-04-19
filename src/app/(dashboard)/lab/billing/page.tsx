"use client";
import React, { useState, useEffect } from 'react';
import apiClient from '@/lib/apiClient';
import SummaryDetailLayout from '@/components/shared/SummaryDetailLayout';
import FormModeSelector, { FormMode } from '@/components/shared/FormModeSelector';
import GridModule from '@/components/shared/GridModule';
import LookupField from '@/components/shared/LookupField';
import { ColDef } from 'ag-grid-community';
import { format } from 'date-fns';
import { Plus, Trash2 } from 'lucide-react';

interface LabDetail {
  LrdSrvCode: number | null;
  ServiceName?: string;
  LrdUnit: number;
  LrdRate: number;
  LrdAmtBefDisc: number;
  LrdDiscPer: number;
  LrdDiscAmt: number;
  LrdAmtAftDisc: number;
}

export default function LabBilling() {
  const [data, setData] = useState<any[]>([]);
  const [mode, setMode] = useState<FormMode>('View');
  const [activeTab, setActiveTab] = useState<'summary' | 'detail'>('summary');
  const [currentRecord, setCurrentRecord] = useState<any>({});
  const [details, setDetails] = useState<LabDetail[]>([]);

  useEffect(() => {
    fetchData();
  }, []);

  const fetchData = async () => {
    try {
      const res = await apiClient.get('/lab/billing');
      setData(res.data);
    } catch (err) {
      console.error('Fetch lab billing error:', err);
    }
  };

  const calculateTotals = (currentDetails: LabDetail[]) => {
    const totalAmt = currentDetails.reduce((sum, d) => sum + (d.LrdAmtAftDisc || 0), 0);
    setCurrentRecord((prev: any) => ({
      ...prev,
      LhdTotalAmt: totalAmt,
      LhdBalAmt: totalAmt - (prev.LhdRecvdAmt || 0)
    }));
  };

  const handleRowDoubleClicked = (row: any) => {
    setCurrentRecord({
      ...row,
      LhdDate: format(new Date(row.LhdDate), 'yyyy-MM-dd')
    });
    setDetails(row.LabRcpt.map((b: any) => ({
      ...b,
      ServiceName: b.Service?.SrvName
    })));
    setMode('View');
    setActiveTab('detail');
  };

  const handleModeChange = (newMode: FormMode) => {
    setMode(newMode);
    if (newMode === 'New') {
      setCurrentRecord({
        LhdDate: format(new Date(), 'yyyy-MM-dd'),
        LhdPttCode: null,
        LhdCDctCode: null,
        LhdTotalAmt: 0,
        LhdRecvdAmt: 0,
        LhdBalAmt: 0,
        LhdReceiptType: 'Cash'
      });
      setDetails([{
        LrdSrvCode: null,
        LrdUnit: 1,
        LrdRate: 0,
        LrdAmtBefDisc: 0,
        LrdDiscPer: 0,
        LrdDiscAmt: 0,
        LrdAmtAftDisc: 0
      }]);
      setActiveTab('detail');
    } else if (newMode === 'Delete' && currentRecord.LhdCode) {
      if (window.confirm('Void this laboratory invoice?')) {
        apiClient.delete(`/lab/billing/${currentRecord.LhdCode}`).then(() => {
          fetchData();
          setMode('View');
          setActiveTab('summary');
        });
      }
    }
  };

  const updateDetailRow = (index: number, updates: Partial<LabDetail>) => {
    const newDetails = [...details];
    const updated = { ...newDetails[index], ...updates };
    
    // Row math
    updated.LrdAmtBefDisc = updated.LrdUnit * updated.LrdRate;
    updated.LrdDiscAmt = (updated.LrdAmtBefDisc * updated.LrdDiscPer) / 100;
    updated.LrdAmtAftDisc = updated.LrdAmtBefDisc - updated.LrdDiscAmt;
    
    newDetails[index] = updated;
    setDetails(newDetails);
    calculateTotals(newDetails);
  };

  const addRow = () => {
    setDetails([...details, {
      LrdSrvCode: null,
      LrdUnit: 1,
      LrdRate: 0,
      LrdAmtBefDisc: 0,
      LrdDiscPer: 0,
      LrdDiscAmt: 0,
      LrdAmtAftDisc: 0
    }]);
  };

  const removeRow = (index: number) => {
    if (details.length === 1) return;
    const newDetails = details.filter((_, i) => i !== index);
    setDetails(newDetails);
    calculateTotals(newDetails);
  };

  const handleSave = async (e: React.FormEvent) => {
    e.preventDefault();
    try {
      const payload = {
        ...currentRecord,
        LabRcpt: details,
        // Auto-handle full receipt if cash
        LabPymtHdr: currentRecord.LhdReceiptType === 'Cash' ? [{
          LphAmt: currentRecord.LhdTotalAmt,
          LphDate: currentRecord.LhdDate
        }] : []
      };

      await apiClient.post('/lab/billing', payload);
      fetchData();
      setMode('View');
      setActiveTab('summary');
    } catch (err) {
      alert('Save failed! Ensure patient and at least one service are selected.');
    }
  };

  const cols: ColDef[] = [
    { field: 'LhdVchNo', headerName: 'Lab #', width: 90 },
    { field: 'LhdDate', headerName: 'Date', width: 120, valueFormatter: p => format(new Date(p.value), 'dd/MM/yyyy') },
    { field: 'Patient.PttName', headerName: 'Patient Name', flex: 1 },
    { field: 'LhdTotalAmt', headerName: 'Bill Amt', width: 120 },
    { field: 'LhdReceiptType', headerName: 'Mode', width: 100 }
  ];

  const isReadonly = mode === 'View';
  const inputStyle = { padding: '8px', background: isReadonly ? 'rgba(0,0,0,0.2)' : 'rgba(255,255,255,0.05)', border: '1px solid #555', color: '#fff', borderRadius: 4 };

  const detail = (
    <div style={{ padding: '10px 0' }}>
      <div style={{ display: 'flex', justifyContent: 'space-between', marginBottom: 20 }}>
        <h2>Investigation Entry & Billing</h2>
        <FormModeSelector mode={mode} onModeChange={handleModeChange} />
      </div>

      <form onSubmit={handleSave}>
        {/* Lab Header */}
        <div style={{ display: 'grid', gridTemplateColumns: 'repeat(4, 1fr)', gap: '15px', marginBottom: 25 }}>
          <div style={{ display: 'flex', flexDirection: 'column', gap: 5 }}>
            <label>Patient *</label>
            <LookupField 
              endpoint="/opd/patient-master" 
              valueKey="PttCode" labelKey="PttName" 
              value={currentRecord.LhdPttCode}
              onChange={(val) => setCurrentRecord({...currentRecord, LhdPttCode: val})}
              disabled={isReadonly}
            />
          </div>
          <div style={{ display: 'flex', flexDirection: 'column', gap: 5 }}>
            <label>Ordering Doctor</label>
            <LookupField 
              endpoint="/masters/doctor-master" 
              valueKey="DctCode" labelKey="DctName" 
              value={currentRecord.LhdCDctCode}
              onChange={(val) => setCurrentRecord({...currentRecord, LhdCDctCode: val})}
              disabled={isReadonly}
            />
          </div>
          <div style={{ display: 'flex', flexDirection: 'column', gap: 5 }}>
            <label>Investigation Date</label>
            <input type="date" value={currentRecord.LhdDate || ''} disabled={isReadonly} onChange={e => setCurrentRecord({...currentRecord, LhdDate: e.target.value})} style={inputStyle} />
          </div>
          <div style={{ display: 'flex', flexDirection: 'column', gap: 5 }}>
            <label>Receipt Category</label>
            <select value={currentRecord.LhdReceiptType || 'Cash'} disabled={isReadonly} onChange={e => setCurrentRecord({...currentRecord, LhdReceiptType: e.target.value})} style={inputStyle}>
              <option value="Cash">Direct Cash</option>
              <option value="Bank">Bank/Digital</option>
              <option value="Credit">Institutional Credit</option>
            </select>
          </div>
        </div>

        {/* Dynamic Investigation Grid */}
        <div style={{ background: 'rgba(0,0,0,0.2)', borderRadius: '8px', border: '1px solid #333', overflow: 'hidden' }}>
          <table style={{ width: '100%', borderCollapse: 'collapse' }}>
            <thead style={{ background: 'rgba(255,255,255,0.05)', textAlign: 'left' }}>
              <tr>
                <th style={{ padding: '10px' }}>Investigation Name</th>
                <th style={{ padding: '10px', width: '80px' }}>Qty</th>
                <th style={{ padding: '10px', width: '120px' }}>Rate</th>
                <th style={{ padding: '10px', width: '100px' }}>Disc %</th>
                <th style={{ padding: '10px', width: '120px' }}>Net Amt</th>
                {!isReadonly && <th style={{ padding: '10px', width: '50px' }}></th>}
              </tr>
            </thead>
            <tbody>
              {details.map((row, idx) => (
                <tr key={idx} style={{ borderTop: '1px solid #333' }}>
                  <td style={{ padding: '8px' }}>
                    <LookupField 
                      endpoint="/services/master" 
                      valueKey="SrvCode" labelKey="SrvName" 
                      value={row.LrdSrvCode}
                      onChange={(val, rec) => updateDetailRow(idx, { LrdSrvCode: val, LrdRate: rec.SrvCharges })}
                      disabled={isReadonly}
                    />
                  </td>
                  <td style={{ padding: '8px' }}>
                    <input type="number" value={row.LrdUnit} disabled={isReadonly} onChange={e => updateDetailRow(idx, { LrdUnit: parseFloat(e.target.value) || 0 })} style={{ ...inputStyle, width: '100%' }} />
                  </td>
                  <td style={{ padding: '8px' }}>
                    <input type="number" value={row.LrdRate} disabled={isReadonly} onChange={e => updateDetailRow(idx, { LrdRate: parseFloat(e.target.value) || 0 })} style={{ ...inputStyle, width: '100%' }} />
                  </td>
                  <td style={{ padding: '8px' }}>
                    <input type="number" value={row.LrdDiscPer} disabled={isReadonly} onChange={e => updateDetailRow(idx, { LrdDiscPer: parseFloat(e.target.value) || 0 })} style={{ ...inputStyle, width: '100%' }} />
                  </td>
                  <td style={{ padding: '8px', fontWeight: 'bold' }}>
                    {row.LrdAmtAftDisc.toFixed(2)}
                  </td>
                  {!isReadonly && (
                    <td style={{ padding: '8px' }}>
                      <button type="button" onClick={() => removeRow(idx)} style={{ background: 'transparent', border: 'none', color: '#ff6b6b', cursor: 'pointer' }}>
                        <Trash2 size={18} />
                      </button>
                    </td>
                  )}
                </tr>
              ))}
            </tbody>
          </table>
          {!isReadonly && (
            <button type="button" onClick={addRow} style={{ padding: 10, background: 'transparent', border: 'none', color: '#3bc9db', cursor: 'pointer', display: 'flex', alignItems: 'center', gap: 10 }}>
              <Plus size={16} /> Add Investigation
            </button>
          )}
        </div>

        {/* Footer Sums */}
        <div style={{ display: 'flex', justifyContent: 'flex-end', marginTop: 25 }}>
          <div style={{ width: '250px', display: 'flex', flexDirection: 'column', gap: 10 }}>
            <div style={{ display: 'flex', justifyContent: 'space-between', fontSize: 18, fontWeight: 'bold', color: '#3bc9db' }}>
              <span>Bill Amount:</span>
              <span>{(currentRecord.LhdTotalAmt || 0).toFixed(2)}</span>
            </div>
            {!isReadonly && (
              <div style={{ marginTop: 15, display: 'flex', gap: 10 }}>
                <button type="submit" style={{ flex: 1, padding: '12px', background: '#3bc9db', color: '#0b1420', fontWeight: 'bold', borderRadius: 6, border: 'none', cursor: 'pointer' }}>
                  Post Investigation
                </button>
                <button type="button" onClick={() => setActiveTab('summary')} style={{ padding: '12px', background: 'transparent', color: '#adb5bd', border: '1px solid #555', borderRadius: 6, cursor: 'pointer' }}>
                  Cancel
                </button>
              </div>
            )}
          </div>
        </div>
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
            <h2>Diagnostic Billing Registry</h2>
            <button onClick={() => handleModeChange('New')} style={{ padding: '8px 16px', background: '#3bc9db', color: '#0b1420', fontWeight: 'bold', borderRadius: 6, border: 'none', cursor: 'pointer' }}>
              New Investigation
            </button>
          </div>
          <GridModule rowData={data} columnDefs={cols} onRowDoubleClicked={handleRowDoubleClicked} height="100%" />
        </div>
      }
      detailNode={detail}
    />
  );
}
