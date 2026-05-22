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
    { field: 'OhdTotalAmt', headerName: 'Amount', width: 120, cellStyle: {  } },
  ];

  const labCols: ColDef[] = [
    { field: 'LhdVchNo', headerName: 'Lab #', width: 90 },
    { field: 'LhdDate', headerName: 'Date', width: 120, valueFormatter: p => format(new Date(p.value), 'dd/MM/yyyy') },
    { field: 'Patient.PttName', headerName: 'Patient', flex: 1 },
    { field: 'LhdTotalAmt', headerName: 'Amount', width: 120, cellStyle: {  } },
  ];

  const ipdCols: ColDef[] = [
    { field: 'IbhVchNo', headerName: 'IPD Bill #', width: 110 },
    { field: 'IbhDate', headerName: 'Date', width: 120, valueFormatter: p => format(new Date(p.value), 'dd/MM/yyyy') },
    { field: 'Patient.PttName', headerName: 'Patient', flex: 1 },
    { field: 'IbhTotalAmt', headerName: 'Amount', width: 120, cellStyle: {  } },
  ];

  const totalRev = (data.opd.reduce((s, r) => s + (r.OhdTotalAmt || 0), 0)) +
                   (data.lab.reduce((s, r) => s + (r.LhdTotalAmt || 0), 0)) +
                   (data.ipd.reduce((s, r) => s + (r.IbhTotalAmt || 0), 0));

  return (
    <div style={{ padding: '30px', display: 'flex', flexDirection: 'column', gap: '30px', height: '100%' }}>
      <header style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'flex-start' }}>
        <div>
           <h1 style={{ fontSize: '28px', marginBottom: '5px', display: 'flex', alignItems: 'center', gap: '15px' }}>
            <FileText color="currentColor" size={32} /> Collection Auditing Hub
          </h1>
          <p >Detailed financial logs across all hospital profit centers.</p>
        </div>
        <div style={{ padding: '20px',    textAlign: 'right' }}>
           <div style={{ fontSize: '12px',  textTransform: 'uppercase', letterSpacing: '1px' }}>Range Total Revenue</div>
           <div style={{ fontSize: '24px' }}>₹{totalRev.toLocaleString()}</div>
        </div>
      </header>

      {/* Filter Bar */}
      <div style={{ display: 'flex', gap: '15px', alignItems: 'flex-end', padding: '20px'}}>
        <div className="form-group">
          <label className="form-label">From Date</label>
          <input className="form-control" type="date" value={from} onChange={e => setFrom(e.target.value)} />
        </div>
        <div className="form-group">
          <label className="form-label">To Date</label>
          <input className="form-control" type="date" value={to} onChange={e => setTo(e.target.value)} />
        </div>
        <button onClick={fetchCollection} className="btn btn-primary" style={{ display: 'flex', alignItems: 'center', gap: '8px' }}>
          <Search size={18} /> Update Report
        </button>
        <button className="btn btn-primary" style={{ display: 'flex', alignItems: 'center', gap: '8px' }}>
          <Download size={18} /> Export CSV
        </button>
      </div>

      {/* Report Grids */}
      <div style={{ flex: 1, display: 'grid', gridTemplateColumns: 'repeat(3, 1fr)', gap: '20px', minHeight: '500px' }}>
         <div style={{ display: 'flex', flexDirection: 'column', gap: '10px' }}>
            <h3 style={{ fontSize: '16px' }}>Outpatient Revenue (OPD)</h3>
            <GridModule rowData={data.opd} columnDefs={opdCols} height="100%" />
         </div>
         <div style={{ display: 'flex', flexDirection: 'column', gap: '10px' }}>
            <h3 style={{ fontSize: '16px' }}>Investigation Revenue (Lab)</h3>
            <GridModule rowData={data.lab} columnDefs={labCols} height="100%" />
         </div>
         <div style={{ display: 'flex', flexDirection: 'column', gap: '10px' }}>
            <h3 style={{ fontSize: '16px' }}>Inpatient Revenue (IPD)</h3>
            <GridModule rowData={data.ipd} columnDefs={ipdCols} height="100%" />
         </div>
      </div>
    </div>
  );
}
