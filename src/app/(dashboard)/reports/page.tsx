"use client";
import React, { useState, useEffect } from 'react';
import apiClient from '@/lib/apiClient';
import GridModule from '@/components/shared/GridModule';
import { ColDef } from 'ag-grid-community';
import { format, startOfDay } from 'date-fns';
import { FileText, Search, Download } from 'lucide-react';

export default function Reports() {
  const [from, setFrom] = useState(format(startOfDay(new Date()), 'yyyy-MM-dd'));
  const [to, setTo] = useState(format(new Date(), 'yyyy-MM-dd'));
  const [data, setData] = useState<{ opd: any[], lab: any[], ipd: any[] }>({ opd: [], lab: [], ipd: [] });

  const fetchCollection = async () => {
    try {
      const res = await apiClient.get(`/reporting/collection?from=${from}&to=${to}`);
      setData(res.data);
    } catch (err) {
      console.error('Fetch collection report error:', err);
    }
  };

  useEffect(() => {
    fetchCollection();
  }, []);

  const opdCols: ColDef[] = [
    { field: 'OhdVchNo', headerName: 'Bill #', width: 90 },
    { field: 'OhdDate', headerName: 'Date', width: 120, valueFormatter: p => format(new Date(p.value), 'dd/MM/yyyy') },
    { field: 'Patient.PttName', headerName: 'Patient', flex: 1 },
    { field: 'OhdTotalAmt', headerName: 'Amount', width: 120, cellStyle: { fontWeight: 'bold' } },
  ];

  const labCols: ColDef[] = [
    { field: 'LhdVchNo', headerName: 'Lab #', width: 90 },
    { field: 'LhdDate', headerName: 'Date', width: 120, valueFormatter: p => format(new Date(p.value), 'dd/MM/yyyy') },
    { field: 'Patient.PttName', headerName: 'Patient', flex: 1 },
    { field: 'LhdTotalAmt', headerName: 'Amount', width: 120, cellStyle: { fontWeight: 'bold' } },
  ];

  const ipdCols: ColDef[] = [
    { field: 'IbhVchNo', headerName: 'IPD Bill #', width: 110 },
    { field: 'IbhDate', headerName: 'Date', width: 120, valueFormatter: p => format(new Date(p.value), 'dd/MM/yyyy') },
    { field: 'Patient.PttName', headerName: 'Patient', flex: 1 },
    { field: 'IbhTotalAmt', headerName: 'Amount', width: 120, cellStyle: { fontWeight: 'bold' } },
  ];

  const totalRev = (data.opd.reduce((s, r) => s + (r.OhdTotalAmt || 0), 0)) +
                   (data.lab.reduce((s, r) => s + (r.LhdTotalAmt || 0), 0)) +
                   (data.ipd.reduce((s, r) => s + (r.IbhTotalAmt || 0), 0));

  return (
    <div style={{ padding: '30px', display: 'flex', flexDirection: 'column', gap: '30px', height: '100%' }}>
      <header style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'flex-start' }}>
        <div>
           <h1 style={{ fontSize: '28px', marginBottom: '5px', display: 'flex', alignItems: 'center', gap: '15px' }}>
            <FileText color="#3bc9db" size={32} /> Collection Auditing Hub
          </h1>
          <p style={{ color: '#adb5bd' }}>Detailed financial logs across all hospital profit centers.</p>
        </div>
        <div style={{ padding: '20px', background: 'rgba(59,201,219,0.1)', borderRadius: '12px', border: '1px solid #3bc9db', textAlign: 'right' }}>
           <div style={{ fontSize: '12px', color: '#adb5bd', textTransform: 'uppercase', letterSpacing: '1px' }}>Range Total Revenue</div>
           <div style={{ fontSize: '24px', fontWeight: 'bold', color: '#3bc9db' }}>₹{totalRev.toLocaleString()}</div>
        </div>
      </header>

      {/* Filter Bar */}
      <div style={{ display: 'flex', gap: '15px', alignItems: 'flex-end', padding: '20px', background: 'rgba(255,255,255,0.02)', borderRadius: '12px', border: '1px solid #333' }}>
        <div style={{ display: 'flex', flexDirection: 'column', gap: '5px' }}>
          <label style={{ fontSize: '12px', color: '#666' }}>From Date</label>
          <input type="date" value={from} onChange={e => setFrom(e.target.value)} style={{ padding: '8px', background: 'rgba(0,0,0,0.2)', border: '1px solid #444', color: '#fff', borderRadius: '4px' }} />
        </div>
        <div style={{ display: 'flex', flexDirection: 'column', gap: '5px' }}>
          <label style={{ fontSize: '12px', color: '#666' }}>To Date</label>
          <input type="date" value={to} onChange={e => setTo(e.target.value)} style={{ padding: '8px', background: 'rgba(0,0,0,0.2)', border: '1px solid #444', color: '#fff', borderRadius: '4px' }} />
        </div>
        <button onClick={fetchCollection} style={{ padding: '10px 20px', background: '#3bc9db', color: '#0b1420', border: 'none', borderRadius: '6px', cursor: 'pointer', fontWeight: 'bold', display: 'flex', alignItems: 'center', gap: '8px' }}>
          <Search size={18} /> Update Report
        </button>
        <button style={{ padding: '10px 20px', background: 'transparent', color: '#adb5bd', border: '1px solid #444', borderRadius: '6px', cursor: 'pointer', fontWeight: 'bold', display: 'flex', alignItems: 'center', gap: '8px' }}>
          <Download size={18} /> Export CSV
        </button>
      </div>

      {/* Report Grids */}
      <div style={{ flex: 1, display: 'grid', gridTemplateColumns: 'repeat(3, 1fr)', gap: '20px', minHeight: '500px' }}>
         <div style={{ display: 'flex', flexDirection: 'column', gap: '10px' }}>
            <h3 style={{ color: '#40c057', fontSize: '16px' }}>Outpatient Revenue (OPD)</h3>
            <GridModule rowData={data.opd} columnDefs={opdCols} height="100%" />
         </div>
         <div style={{ display: 'flex', flexDirection: 'column', gap: '10px' }}>
            <h3 style={{ color: '#7950f2', fontSize: '16px' }}>Investigation Revenue (Lab)</h3>
            <GridModule rowData={data.lab} columnDefs={labCols} height="100%" />
         </div>
         <div style={{ display: 'flex', flexDirection: 'column', gap: '10px' }}>
            <h3 style={{ color: '#3bc9db', fontSize: '16px' }}>Inpatient Revenue (IPD)</h3>
            <GridModule rowData={data.ipd} columnDefs={ipdCols} height="100%" />
         </div>
      </div>
    </div>
  );
}
