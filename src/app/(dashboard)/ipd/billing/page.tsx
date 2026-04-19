"use client";
import React, { useState, useEffect } from 'react';
import apiClient from '@/lib/apiClient';
import SummaryDetailLayout from '@/components/shared/SummaryDetailLayout';
import FormModeSelector, { FormMode } from '@/components/shared/FormModeSelector';
import GridModule from '@/components/shared/GridModule';
import LookupField from '@/components/shared/LookupField';
import { ColDef } from 'ag-grid-community';
import { format } from 'date-fns';
import { Calculator, Receipt, History } from 'lucide-react';

interface IPDBillDetail {
  IbdSrvCode: number | null;
  SrvName?: string;
  IbdUnit: number;
  IbdRate: number;
  IbdAmtBefDisc: number;
  IbdAmtAftDisc: number;
}

export default function IpdBilling() {
  const [data, setData] = useState<any[]>([]);
  const [mode, setMode] = useState<FormMode>('View');
  const [activeTab, setActiveTab] = useState<'summary' | 'detail'>('summary');
  const [currentRecord, setCurrentRecord] = useState<any>({});
  const [details, setDetails] = useState<IPDBillDetail[]>([]);

  useEffect(() => {
    // In actual app, we'd fetch billing history
    setData([]);
  }, []);

  const fetchAccruedCharges = async (admId: number) => {
    try {
      const res = await apiClient.get(`/ipd-billing/preview/${admId}`);
      const accrued = res.data.accruedServices.map((s: any) => ({
        IbdSrvCode: s.SrvCode,
        SrvName: s.SrvName,
        IbdUnit: s.Unit,
        IbdRate: s.Rate,
        IbdAmtBefDisc: s.Amount,
        IbdAmtAftDisc: s.Amount
      }));
      setDetails(accrued);
      calculateTotals(accrued);
    } catch (err) {
      console.error('Accrual preview error:', err);
    }
  };

  const calculateTotals = (currentDetails: IPDBillDetail[]) => {
    const totalAmt = currentDetails.reduce((sum, d) => sum + (d.IbdAmtAftDisc || 0), 0);
    setCurrentRecord((prev: any) => ({
      ...prev,
      IbhTotalAmt: totalAmt,
      IbhBalAmt: totalAmt - (prev.IbhDepAmt || 0)
    }));
  };

  const handleModeChange = (newMode: FormMode) => {
    setMode(newMode);
    if (newMode === 'New') {
      setCurrentRecord({
        IbhDate: format(new Date(), 'yyyy-MM-dd'),
        IbhIhdCode: null,
        IbhPttCode: null,
        IbhTotalAmt: 0,
        IbhDepAmt: 0,
        IbhBalAmt: 0,
        IbhBillType: 'Final'
      });
      setDetails([]);
      setActiveTab('detail');
    }
  };

  const handleSave = async (e: React.FormEvent) => {
    e.preventDefault();
    await apiClient.post('/ipd-billing/billing', {
      ...currentRecord,
      IndrBill: details
    });
    setMode('View');
    setActiveTab('summary');
  };

  const detail = (
    <div style={{ padding: '10px 0' }}>
       <div style={{ display: 'flex', justifyContent: 'space-between', marginBottom: 25 }}>
        <h2>Inpatient Transaction Ledger</h2>
        <FormModeSelector mode={mode} onModeChange={handleModeChange} />
      </div>

      <form onSubmit={handleSave}>
        <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: 20, marginBottom: 25 }}>
          {/* Billing Context */}
          <div style={{ padding: 20, background: 'rgba(255,255,255,0.02)', borderRadius: 12, border: '1px solid #333' }}>
            <h3 style={{ margin: 0, fontSize: 16, color: '#3bc9db', display: 'flex', alignItems: 'center', gap: 10, marginBottom: 15 }}>
              <Receipt size={18} /> Administrative Header
            </h3>
            <div style={{ display: 'flex', flexDirection: 'column', gap: 15 }}>
              <div>
                <label>Active admission *</label>
                <LookupField 
                  endpoint="/ipd/admission" 
                  valueKey="IhdCode" 
                  labelKey="Patient.PttName" 
                  value={currentRecord.IbhIhdCode}
                  onChange={(val, rec) => {
                    setCurrentRecord({ ...currentRecord, IbhIhdCode: val, IbhPttCode: rec.IhdPttCode });
                    fetchAccruedCharges(val);
                  }}
                  disabled={mode === 'View'}
                />
              </div>
              <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: 10 }}>
                <div>
                   <label>Invoice Date</label>
                   <input type="date" value={currentRecord.IbhDate || ''} style={{ padding: 8, background: 'rgba(255,255,255,0.05)', border: '1px solid #555', color: '#fff', width: '100%' }} disabled={mode === 'View'} />
                </div>
                <div>
                   <label>Bill Type</label>
                   <select value={currentRecord.IbhBillType} style={{ padding: 8, background: 'rgba(255,255,255,0.05)', border: '1px solid #555', color: '#fff', width: '100%' }} disabled={mode === 'View'}>
                      <option value="Interim">Interim / Partial</option>
                      <option value="Final">Final Discharge Settlement</option>
                   </select>
                </div>
              </div>
            </div>
          </div>

          {/* Financial Totals */}
          <div style={{ padding: 20, background: 'rgba(255,255,255,0.02)', borderRadius: 12, border: '1px solid #333' }}>
             <h3 style={{ margin: 0, fontSize: 16, color: '#3bc9db', display: 'flex', alignItems: 'center', gap: 10, marginBottom: 15 }}>
              <Calculator size={18} /> Financial Summary
            </h3>
            <div style={{ display: 'flex', flexDirection: 'column', gap: 10 }}>
               <div style={{ display: 'flex', justifyContent: 'space-between', padding: '10px 0', borderBottom: '1px solid #333' }}>
                  <span>Gross Inpatient Charges</span>
                  <span style={{ fontWeight: 'bold' }}>{(currentRecord.IbhTotalAmt || 0).toFixed(2)}</span>
               </div>
               <div style={{ display: 'flex', justifyContent: 'space-between', padding: '10px 0', borderBottom: '1px solid #333' }}>
                  <span>Less: Previous Deposits</span>
                  <span style={{ color: '#ff6b6b' }}>- {(currentRecord.IbhDepAmt || 0).toFixed(2)}</span>
               </div>
               <div style={{ display: 'flex', justifyContent: 'space-between', padding: '15px 0', fontSize: 20, color: '#3bc9db', fontWeight: 'bold' }}>
                  <span>Net Payable Amount</span>
                  <span>{(currentRecord.IbhBalAmt || 0).toFixed(2)}</span>
               </div>
            </div>
          </div>
        </div>

        {/* Accrued Detail Table */}
        <div style={{ background: 'rgba(0,0,0,0.2)', borderRadius: '12px', border: '1px solid #333', overflow: 'hidden' }}>
           <table style={{ width: '100%', borderCollapse: 'collapse' }}>
              <thead style={{ background: 'rgba(255,255,255,0.05)', textAlign: 'left' }}>
                <tr>
                   <th style={{ padding: 12 }}>Stay & Service Description</th>
                   <th style={{ padding: 12 }}>Qty/Days</th>
                   <th style={{ padding: 12 }}>Rate</th>
                   <th style={{ padding: 12 }}>Total</th>
                </tr>
              </thead>
              <tbody>
                {details.map((row, idx) => (
                  <tr key={idx} style={{ borderTop: '1px solid #333' }}>
                     <td style={{ padding: 12 }}>{row.SrvName}</td>
                     <td style={{ padding: 12 }}>{row.IbdUnit}</td>
                     <td style={{ padding: 12 }}>{row.IbdRate.toFixed(2)}</td>
                     <td style={{ padding: 12, fontWeight: 'bold' }}>{row.IbdAmtAftDisc.toFixed(2)}</td>
                  </tr>
                ))}
                {details.length === 0 && (
                   <tr>
                      <td colSpan={4} style={{ padding: 40, textAlign: 'center', color: '#666' }}>
                         Select an active admission to preview accrued diagnostic and boarding charges.
                      </td>
                   </tr>
                )}
              </tbody>
           </table>
        </div>

        {mode === 'New' && details.length > 0 && (
           <div style={{ marginTop: 25, display: 'flex', justifyContent: 'flex-end' }}>
              <button type="submit" style={{ padding: '12px 32px', background: '#3bc9db', color: '#0b1420', fontWeight: 'bold', borderRadius: 8, border: 'none', cursor: 'pointer' }}>
                 Post IPD Invoice & Settle
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
        <div style={{ height: '100%', display: 'flex', flexDirection: 'column', gap: 20 }}>
           <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
            <h2 style={{ display: 'flex', alignItems: 'center', gap: 10 }}>
              <History size={24} /> Inpatient Billing History
            </h2>
            <button onClick={() => handleModeChange('New')} style={{ padding: '8px 16px', background: '#3bc9db', color: '#0b1420', fontWeight: 'bold', borderRadius: 6, border: 'none', cursor: 'pointer' }}>
              Create New IPD Bill
            </button>
          </div>
          <div style={{ flex: 1, display: 'flex', alignItems: 'center', justifyContent: 'center', background: 'rgba(0,0,0,0.2)', borderRadius: 12, border: '1px dashed #444', color: '#666' }}>
             Billing history registry will be implemented in the next sub-phase.
          </div>
        </div>
      }
      detailNode={detail}
    />
  );
}
