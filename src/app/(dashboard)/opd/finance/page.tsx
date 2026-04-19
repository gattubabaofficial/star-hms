"use client";
import React, { useState, useEffect } from 'react';
import { usePathname } from 'next/navigation';
import { CreditCard, History, PlusCircle, MinusCircle, User, FileText } from 'lucide-react';
import apiClient from '@/lib/apiClient';

interface Bill {
  id: number;
  vchNo: number;
  date: string;
  pttName: string;
  totalAmt: number;
  paidAmt: number;
  balAmt: number;
}

export default function FinanceModule() {
  const pathname = usePathname();
  const mode = pathname.split('/')[2]; // /dashboard/opd/finance -> mode is opd. Wait!
  // Wait, Next.js pathname is /opd/finance (since it's inside (dashboard)).
  // Let's just use pathname.split('/')[1] or check if 'opd', 'ipd', 'lab' is in pathname
  const md = pathname.includes('ipd') ? 'ipd' : pathname.includes('lab') ? 'lab' : 'opd';
  const modeVar = md;
  const [bills, setBills] = useState<Bill[]>([]);
  const [selectedBill, setSelectedBill] = useState<Bill | null>(null);
  const [history, setHistory] = useState<{ payments: any[], refunds: any[] }>({ payments: [], refunds: [] });
  const [amount, setAmount] = useState<string>('');
  const [date, setDate] = useState<string>(new Date().toISOString().split('T')[0]);
  const [loading, setLoading] = useState(false);

  useEffect(() => {
    fetchBills();
  }, [mode]);

  const fetchBills = async () => {
    const endpoint = modeVar === 'opd' ? '/opd/billing' : modeVar === 'ipd' ? '/ipd/admission' : '/lab/billing';
    try {
      const res = await apiClient.get(endpoint);
      const data = res.data;
      // Map legacy fields to common interface
      const mapped = data.map((b: any) => ({
        id: b.OhdCode || b.IbhCode || b.LhdCode,
        vchNo: b.OhdVchNo || b.IbhVchNo || b.LhdVchNo,
        date: b.OhdDate || b.IbhDate || b.LhdDate,
        pttName: b.Patient?.PttName || 'Unknown',
        totalAmt: b.OhdTotalAmt || b.IbhTotalAmt || b.LhdTotalAmt || 0,
        paidAmt: b.OhdDepAmt || b.IbhDepAmt || b.LhdRecvdAmt || 0,
        balAmt: b.OhdBalAmt || b.IbhBalAmt || b.LhdBalAmt || 0,
      }));
      setBills(mapped);
    } catch (e) {
      console.error(e);
    }
  };

  const fetchHistory = async (billId: number) => {
    try {
      const res = await apiClient.get(`/finance/${modeVar}/${billId}`);
      const data = res.data;
      setHistory(data);
    } catch (e) {
      console.error(e);
    }
  };

  const handleTransaction = async (type: 'payment' | 'refund') => {
    if (!selectedBill || !amount) return;
    setLoading(true);
    try {
      const response = await apiClient.post(`/finance/${modeVar}/${type}`, {
          billId: selectedBill.id,
          amount: parseFloat(amount),
          date: new Date(date),
      });
      if (response) {
        alert(`${type === 'payment' ? 'Payment' : 'Refund'} recorded!`);
        setAmount('');
        fetchBills();
        fetchHistory(selectedBill.id);
      }
    } catch (e) {
      alert('Transaction failed');
    } finally {
      setLoading(false);
    }
  };

  return (
    <div style={{ padding: '40px', color: '#fff' }}>
      <header style={{ marginBottom: '30px' }}>
        <h1 style={{ fontSize: '24px', display: 'flex', alignItems: 'center', gap: '10px', textTransform: 'uppercase' }}>
          <CreditCard size={28} color="#fab005" /> {mode} Payments & Refunds
        </h1>
        <p style={{ color: '#868e96', margin: '5px 0 0' }}>Manage financial settlements for {mode.toUpperCase()} billing.</p>
      </header>

      <div style={{ display: 'grid', gridTemplateColumns: '1fr 400px', gap: '30px' }}>
        {/* Left Side: Bill List */}
        <div style={{ display: 'flex', flexDirection: 'column', gap: '24px' }}>
          <div style={{ 
            background: 'rgba(255,255,255,0.03)', 
            borderRadius: '20px',
            border: '1px solid rgba(255,255,255,0.1)',
            overflow: 'hidden'
          }}>
            <table style={{ width: '100%', borderCollapse: 'collapse' }}>
              <thead style={{ background: 'rgba(255,255,255,0.05)' }}>
                <tr>
                  <th style={{ padding: '15px', textAlign: 'left' }}>Bill No.</th>
                  <th style={{ padding: '15px', textAlign: 'left' }}>Patient</th>
                  <th style={{ padding: '15px', textAlign: 'right' }}>Total</th>
                  <th style={{ padding: '15px', textAlign: 'right' }}>Paid</th>
                  <th style={{ padding: '15px', textAlign: 'right' }}>Balance</th>
                  <th style={{ padding: '15px' }}></th>
                </tr>
              </thead>
              <tbody>
                {bills.map(bill => (
                  <tr 
                    key={bill.id} 
                    style={{ 
                      borderBottom: '1px solid rgba(255,255,255,0.05)',
                      background: selectedBill?.id === bill.id ? 'rgba(250, 176, 5, 0.05)' : 'transparent',
                      cursor: 'pointer'
                    }}
                    onClick={() => {
                      setSelectedBill(bill);
                      fetchHistory(bill.id);
                    }}
                  >
                    <td style={{ padding: '15px' }}>#{bill.vchNo}</td>
                    <td style={{ padding: '15px' }}>{bill.pttName}</td>
                    <td style={{ padding: '15px', textAlign: 'right' }}>{bill.totalAmt.toFixed(2)}</td>
                    <td style={{ padding: '15px', textAlign: 'right', color: '#40c057' }}>{bill.paidAmt.toFixed(2)}</td>
                    <td style={{ padding: '15px', textAlign: 'right', color: '#ff6b6b', fontWeight: 600 }}>{bill.balAmt.toFixed(2)}</td>
                    <td style={{ padding: '15px', textAlign: 'center' }}>
                      <span style={{ fontSize: '12px', opacity: 0.5 }}>Select →</span>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </div>

        {/* Right Side: Action Panel */}
        <div style={{ display: 'flex', flexDirection: 'column', gap: '24px' }}>
          {!selectedBill ? (
            <div style={{ 
              padding: '60px 40px', 
              textAlign: 'center', 
              background: 'rgba(255,255,255,0.02)', 
              borderRadius: '20px',
              border: '1px dashed rgba(255,255,255,0.1)'
            }}>
              <FileText size={48} color="#343a40" style={{ marginBottom: '20px' }} />
              <p style={{ color: '#5c5f66' }}>Select a bill from the list to manage payments.</p>
            </div>
          ) : (
            <>
              <div style={{ 
                background: 'rgba(255,255,255,0.03)', 
                padding: '24px', 
                borderRadius: '20px',
                border: '1px solid rgba(255,255,255,0.1)'
              }}>
                <div style={{ display: 'flex', alignItems: 'center', gap: '12px', marginBottom: '20px' }}>
                  <div style={{ padding: '10px', background: '#fab00515', borderRadius: '12px' }}>
                    <User color="#fab005" size={20} />
                  </div>
                  <div>
                    <h3 style={{ margin: 0, fontSize: '16px' }}>{selectedBill.pttName}</h3>
                    <p style={{ margin: 0, fontSize: '12px', color: '#868e96' }}>Bill #{selectedBill.vchNo}</p>
                  </div>
                </div>

                <div style={{ display: 'flex', flexDirection: 'column', gap: '16px' }}>
                  <div>
                    <label style={{ display: 'block', fontSize: '12px', color: '#868e96', marginBottom: '8px' }}>Amount</label>
                    <input 
                      type="number" 
                      value={amount}
                      onChange={(e) => setAmount(e.target.value)}
                      placeholder="0.00"
                      style={{
                        width: '100%',
                        padding: '12px',
                        background: '#1a1a1a',
                        border: '1px solid #333',
                        borderRadius: '10px',
                        color: '#fff',
                        fontSize: '18px'
                      }}
                    />
                  </div>
                  <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '12px' }}>
                    <button 
                      onClick={() => handleTransaction('payment')}
                      disabled={loading}
                      style={{
                        padding: '12px',
                        background: '#40c057',
                        border: 'none',
                        borderRadius: '10px',
                        color: '#fff',
                        fontWeight: 600,
                        cursor: 'pointer',
                        display: 'flex',
                        alignItems: 'center',
                        justifyContent: 'center',
                        gap: '8px'
                      }}
                    >
                      <PlusCircle size={18} /> Payment
                    </button>
                    <button 
                      onClick={() => handleTransaction('refund')}
                      disabled={loading}
                      style={{
                        padding: '12px',
                        background: '#ff6b6b',
                        border: 'none',
                        borderRadius: '10px',
                        color: '#fff',
                        fontWeight: 600,
                        cursor: 'pointer',
                        display: 'flex',
                        alignItems: 'center',
                        justifyContent: 'center',
                        gap: '8px'
                      }}
                    >
                      <MinusCircle size={18} /> Refund
                    </button>
                  </div>
                </div>
              </div>

              <div style={{ 
                background: 'rgba(255,255,255,0.03)', 
                padding: '24px', 
                borderRadius: '20px',
                border: '1px solid rgba(255,255,255,0.1)'
              }}>
                <h3 style={{ marginBottom: '20px', fontSize: '16px', display: 'flex', alignItems: 'center', gap: '8px' }}>
                  <History size={18} color="#adb5bd" /> Transaction History
                </h3>
                <div style={{ display: 'flex', flexDirection: 'column', gap: '12px' }}>
                  {[...history.payments.map(p => ({ ...p, type: 'PAY' })), ...history.refunds.map(r => ({ ...r, type: 'RFD' }))]
                    .sort((a, b) => new Date(b.ObpDate || b.ObrDate || b.IpdDate || b.IrdDate || b.LphDate || b.LrhDate).getTime() - new Date(a.ObpDate || a.ObrDate || a.IpdDate || a.IrdDate || a.LphDate || a.LrhDate).getTime())
                    .map((item, idx) => (
                      <div key={idx} style={{ 
                        display: 'flex', 
                        justifyContent: 'space-between', 
                        padding: '10px', 
                        background: 'rgba(255,255,255,0.02)',
                        borderRadius: '8px',
                        borderLeft: `4px solid ${item.type === 'PAY' ? '#40c057' : '#ff6b6b'}`
                      }}>
                        <div>
                          <span style={{ fontSize: '12px', color: '#adb5bd' }}>
                            {new Date(item.ObpDate || item.ObrDate || item.IpdDate || item.IrdDate || item.LphDate || item.LrhDate).toLocaleDateString()}
                          </span>
                          <div style={{ fontSize: '14px' }}>{item.type} Receipt</div>
                        </div>
                        <div style={{ textAlign: 'right' }}>
                          <span style={{ fontWeight: 600, color: item.type === 'PAY' ? '#40c057' : '#ff6b6b' }}>
                            {item.type === 'PAY' ? '+' : '-'} ₹{(item.ObpAmt || item.ObrAmt || item.IpdAmt || item.IrdAmt || item.LphAmt || item.LrhAmt).toFixed(2)}
                          </span>
                        </div>
                      </div>
                    ))}
                </div>
              </div>
            </>
          )}
        </div>
      </div>
    </div>
  );
}
