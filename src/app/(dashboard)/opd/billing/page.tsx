"use client";
import React, { useState, useEffect, useMemo } from 'react';
import apiClient from '@/lib/apiClient';
import SummaryDetailLayout from '@/components/shared/SummaryDetailLayout';
import FormModeSelector, { FormMode } from '@/components/shared/FormModeSelector';
import GridModule from '@/components/shared/GridModule';
import LookupField from '@/components/shared/LookupField';
import { ColDef } from 'ag-grid-community';
import { format } from 'date-fns';
import { Plus, Trash2 } from 'lucide-react';

interface BillDetail {
  ObdSrvCode: number | null;
  ServiceName?: string;
  ObdUnit: number;
  ObdRate: number;
  ObdAmtBefDisc: number;
  ObdDiscPer: number;
  ObdDiscAmt: number;
  ObdAmtAftDisc: number;
}

export default function Billing() {
  const [data, setData] = useState<any[]>([]);
  const [mode, setMode] = useState<FormMode>('View');
  const [activeTab, setActiveTab] = useState<'summary' | 'detail'>('summary');
  const [currentRecord, setCurrentRecord] = useState<any>({});
  const [details, setDetails] = useState<BillDetail[]>([]);

  useEffect(() => {
    fetchData();
  }, []);

  const fetchData = async () => {
    try {
      const res = await apiClient.get('/opd/billing');
      setData(res.data);
    } catch (err) {
      console.error('Fetch billing error:', err);
    }
  };

  const calculateTotals = (currentDetails: BillDetail[]) => {
    const totalAmt = currentDetails.reduce((sum, d) => sum + (d.ObdAmtAftDisc || 0), 0);
    setCurrentRecord((prev: any) => ({
      ...prev,
      OhdTotalAmt: totalAmt,
      OhdBalAmt: totalAmt - (prev.OhdDepAmt || 0)
    }));
  };

  const handleRowDoubleClicked = (row: any) => {
    setCurrentRecord({
      ...row,
      OhdDate: format(new Date(row.OhdDate), 'yyyy-MM-dd')
    });
    setDetails(row.OutdBill.map((b: any) => ({
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
        OhdDate: format(new Date(), 'yyyy-MM-dd'),
        OhdPttCode: null,
        OhdCDctCode: null,
        OhdTotalAmt: 0,
        OhdDepAmt: 0,
        OhdBalAmt: 0,
        OhdBillType: 'Cash'
      });
      setDetails([{
        ObdSrvCode: null,
        ObdUnit: 1,
        ObdRate: 0,
        ObdAmtBefDisc: 0,
        ObdDiscPer: 0,
        ObdDiscAmt: 0,
        ObdAmtAftDisc: 0
      }]);
      setActiveTab('detail');
    } else if (newMode === 'Delete' && currentRecord.OhdCode) {
      if (window.confirm('Void this invoice?')) {
        apiClient.delete(`/opd/billing/${currentRecord.OhdCode}`).then(() => {
          fetchData();
          setMode('View');
          setActiveTab('summary');
        });
      }
    }
  };

  const updateDetailRow = (index: number, updates: Partial<BillDetail>) => {
    const newDetails = [...details];
    const updated = { ...newDetails[index], ...updates };
    
    // Recalculate row math
    updated.ObdAmtBefDisc = updated.ObdUnit * updated.ObdRate;
    updated.ObdDiscAmt = (updated.ObdAmtBefDisc * updated.ObdDiscPer) / 100;
    updated.ObdAmtAftDisc = updated.ObdAmtBefDisc - updated.ObdDiscAmt;
    
    newDetails[index] = updated;
    setDetails(newDetails);
    calculateTotals(newDetails);
  };

  const addRow = () => {
    setDetails([...details, {
      ObdSrvCode: null,
      ObdUnit: 1,
      ObdRate: 0,
      ObdAmtBefDisc: 0,
      ObdDiscPer: 0,
      ObdDiscAmt: 0,
      ObdAmtAftDisc: 0
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
        OutdBill: details,
        // If cash, record full payment
        OutdBlPymtHdr: currentRecord.OhdBillType === 'Cash' ? [{
          ObpAmt: currentRecord.OhdTotalAmt,
          ObpDate: currentRecord.OhdDate
        }] : []
      };

      await apiClient.post('/opd/billing', payload);
      fetchData();
      setMode('View');
      setActiveTab('summary');
    } catch (err) {
      alert('Save failed! Check required fields.');
    }
  };

  const cols: ColDef[] = [
    { field: 'OhdVchNo', headerName: 'Bill #', width: 90 },
    { field: 'OhdDate', headerName: 'Date', width: 120, valueFormatter: p => format(new Date(p.value), 'dd/MM/yyyy') },
    { field: 'Patient.PttName', headerName: 'Patient Name', flex: 1 },
    { field: 'Doctor.DctName', headerName: 'Consultant', flex: 1 },
    { field: 'OhdTotalAmt', headerName: 'Total', width: 120 },
    { field: 'OhdBillType', headerName: 'Mode', width: 100 }
  ];

  const isReadonly = mode === 'View';
  const inputStyle = { padding: '8px', background: isReadonly ? 'rgba(0,0,0,0.2)' : 'rgba(255,255,255,0.05)', border: '1px solid #555', color: '#fff', borderRadius: 4 };

  const detail = (
    <div style={{ padding: '10px 0' }}>
      <div style={{ display: 'flex', justifyContent: 'space-between', marginBottom: 20 }}>
        <h2>OPD Invoice Generation</h2>
        <FormModeSelector mode={mode} onModeChange={handleModeChange} />
      </div>

      <form onSubmit={handleSave}>
        {/* Header Fields */}
        <div style={{ display: 'grid', gridTemplateColumns: 'repeat(4, 1fr)', gap: '15px', marginBottom: 25 }}>
          <div style={{ display: 'flex', flexDirection: 'column', gap: 5 }}>
            <label>Patient *</label>
            <LookupField 
              endpoint="/opd/patient-master" 
              valueKey="PttCode" labelKey="PttName" 
              value={currentRecord.OhdPttCode}
              onChange={(val) => setCurrentRecord({...currentRecord, OhdPttCode: val})}
              disabled={isReadonly}
            />
          </div>
          <div style={{ display: 'flex', flexDirection: 'column', gap: 5 }}>
            <label>Doctor</label>
            <LookupField 
              endpoint="/masters/doctor-master" 
              valueKey="DctCode" labelKey="DctName" 
              value={currentRecord.OhdCDctCode}
              onChange={(val) => setCurrentRecord({...currentRecord, OhdCDctCode: val})}
              disabled={isReadonly}
            />
          </div>
          <div style={{ display: 'flex', flexDirection: 'column', gap: 5 }}>
            <label>Bill Date</label>
            <input type="date" value={currentRecord.OhdDate || ''} disabled={isReadonly} onChange={e => setCurrentRecord({...currentRecord, OhdDate: e.target.value})} style={inputStyle} />
          </div>
          <div style={{ display: 'flex', flexDirection: 'column', gap: 5 }}>
            <label>Bill Type</label>
            <select value={currentRecord.OhdBillType || 'Cash'} disabled={isReadonly} onChange={e => setCurrentRecord({...currentRecord, OhdBillType: e.target.value})} style={inputStyle}>
              <option value="Cash">Cash</option>
              <option value="Bank">Bank/Card</option>
              <option value="Credit">Credit</option>
            </select>
          </div>
        </div>

        {/* Transaction Grid */}
        <div style={{ background: 'rgba(0,0,0,0.2)', borderRadius: '8px', overflow: 'hidden', border: '1px solid #333' }}>
          <table style={{ width: '100%', borderCollapse: 'collapse' }}>
            <thead style={{ background: 'rgba(255,255,255,0.05)', textAlign: 'left' }}>
              <tr>
                <th style={{ padding: '10px' }}>Service Description</th>
                <th style={{ padding: '10px', width: '80px' }}>Units</th>
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
                      value={row.ObdSrvCode}
                      onChange={(val, rec) => updateDetailRow(idx, { ObdSrvCode: val, ObdRate: rec.SrvCharges })}
                      disabled={isReadonly}
                    />
                  </td>
                  <td style={{ padding: '8px' }}>
                    <input type="number" value={row.ObdUnit} disabled={isReadonly} onChange={e => updateDetailRow(idx, { ObdUnit: parseFloat(e.target.value) || 0 })} style={{ ...inputStyle, width: '100%' }} />
                  </td>
                  <td style={{ padding: '8px' }}>
                    <input type="number" value={row.ObdRate} disabled={isReadonly} onChange={e => updateDetailRow(idx, { ObdRate: parseFloat(e.target.value) || 0 })} style={{ ...inputStyle, width: '100%' }} />
                  </td>
                  <td style={{ padding: '8px' }}>
                    <input type="number" value={row.ObdDiscPer} disabled={isReadonly} onChange={e => updateDetailRow(idx, { ObdDiscPer: parseFloat(e.target.value) || 0 })} style={{ ...inputStyle, width: '100%' }} />
                  </td>
                  <td style={{ padding: '8px', fontWeight: 'bold' }}>
                    {row.ObdAmtAftDisc.toFixed(2)}
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
            <button type="button" onClick={addRow} style={{ display: 'flex', alignItems: 'center', gap: 10, padding: 10, background: 'transparent', border: 'none', color: '#3bc9db', cursor: 'pointer', fontSize: 13 }}>
              <Plus size={16} /> Add Service Line
            </button>
          )}
        </div>

        {/* Totals & Footer */}
        <div style={{ display: 'flex', justifyContent: 'flex-end', marginTop: 25 }}>
          <div style={{ display: 'flex', flexDirection: 'column', gap: 10, width: '250px' }}>
            <div style={{ display: 'flex', justifyContent: 'space-between' }}>
              <span>Bill Subtotal:</span>
              <span style={{ color: '#adb5bd' }}>{(currentRecord.OhdTotalAmt || 0).toFixed(2)}</span>
            </div>
            <div style={{ display: 'flex', justifyContent: 'space-between', fontSize: 18, fontWeight: 'bold', borderTop: '1px solid #444', paddingTop: 10 }}>
              <span>Net Payable:</span>
              <span style={{ color: '#3bc9db' }}>{(currentRecord.OhdTotalAmt || 0).toFixed(2)}</span>
            </div>
            
            {!isReadonly && (
              <div style={{ marginTop: 15, display: 'flex', gap: 10 }}>
                <button type="submit" style={{ flex: 1, padding: '12px', background: '#3bc9db', color: '#0b1420', fontWeight: 'bold', borderRadius: 6, border: 'none', cursor: 'pointer' }}>
                  Save & Post Bill
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
            <h2>Billing History</h2>
            <button onClick={() => handleModeChange('New')} style={{ padding: '8px 16px', background: '#3bc9db', color: '#0b1420', fontWeight: 'bold', borderRadius: 6, border: 'none', cursor: 'pointer' }}>
              New Bill
            </button>
          </div>
          <GridModule rowData={data} columnDefs={cols} onRowDoubleClicked={handleRowDoubleClicked} height="100%" />
        </div>
      }
      detailNode={detail}
    />
  );
}
