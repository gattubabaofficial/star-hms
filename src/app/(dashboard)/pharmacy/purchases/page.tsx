"use client";
import React, { useState, useEffect } from 'react';
import { ShoppingCart, Plus, Save, Trash2, Users } from 'lucide-react';

interface PharmacyItem {
  SimCode: number;
  SimName: string;
  SimPurchRate: number;
}

interface Party {
  PryCode: number;
  PryName: string;
}

interface PurchaseDetail {
  simCode: number;
  name: string;
  qty: number;
  rate: number;
  total: number;
}

export default function PharmacyPurchase() {
  const [items, setItems] = useState<PharmacyItem[]>([]);
  const [parties, setParties] = useState<Party[]>([]);
  const [cart, setCart] = useState<PurchaseDetail[]>([]);
  const [selectedItemCode, setSelectedItemCode] = useState<string>('');
  const [qty, setQty] = useState<number>(1);
  const [prtCode, setPrtCode] = useState<string>('');
  const [totalAmt, setTotalAmt] = useState<number>(0);
  const [saving, setSaving] = useState(false);

  useEffect(() => {
    fetch('http://localhost:3001/api/pharmacy/items').then(res => res.json()).then(data => setItems(data));
    fetch('http://localhost:3001/api/pharmacy/parties').then(res => res.json()).then(data => setParties(data));
  }, []);

  const addToCart = () => {
    const item = items.find(i => i.SimCode === parseInt(selectedItemCode));
    if (!item) return;

    const detail: PurchaseDetail = {
      simCode: item.SimCode,
      name: item.SimName,
      qty: qty,
      rate: item.SimPurchRate || 0,
      total: qty * (item.SimPurchRate || 0)
    };

    setCart([...cart, detail]);
    setTotalAmt(prev => prev + detail.total);
    setSelectedItemCode('');
    setQty(1);
  };

  const removeFromCart = (index: number) => {
    const detail = cart[index];
    setTotalAmt(prev => prev - detail.total);
    setCart(cart.filter((_, i) => i !== index));
  };

  const handleSave = async () => {
    if (cart.length === 0 || !prtCode) {
      alert('Please select a supplier and add items.');
      return;
    }
    setSaving(true);
    try {
      const response = await fetch('http://localhost:3001/api/pharmacy/purchases', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          header: { prtCode, totalAmt, date: new Date() },
          details: cart
        })
      });
      if (response.ok) {
        alert('Purchase recorded successfully!');
        setCart([]);
        setTotalAmt(0);
        setPrtCode('');
      }
    } catch (error) {
      alert('Failed to save purchase');
    } finally {
      setSaving(false);
    }
  };

  return (
    <div style={{ padding: '40px', color: '#fff' }}>
      <header style={{ marginBottom: '30px', display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
        <div>
          <h1 style={{ fontSize: '24px', display: 'flex', alignItems: 'center', gap: '10px' }}>
            <ShoppingCart size={28} color="#fab005" /> Pharmacy Purchase (MediPur)
          </h1>
          <p style={{ color: '#868e96', margin: '5px 0 0' }}>Strict Offline Replica: Inward Stock Transaction Entry</p>
        </div>
        <button 
          onClick={handleSave}
          disabled={saving || cart.length === 0}
          style={{
            padding: '12px 24px',
            background: '#fab005',
            border: 'none',
            borderRadius: '12px',
            color: '#000',
            fontWeight: 600,
            cursor: 'pointer',
            display: 'flex',
            alignItems: 'center',
            gap: '8px',
            opacity: saving || cart.length === 0 ? 0.5 : 1
          }}
        >
          <Save size={18} /> {saving ? 'Saving...' : 'Save Purchase'}
        </button>
      </header>

      <div style={{ display: 'grid', gridTemplateColumns: '1fr 350px', gap: '30px' }}>
        <div style={{ display: 'flex', flexDirection: 'column', gap: '24px' }}>
          <div style={{ background: 'rgba(255,255,255,0.03)', padding: '24px', borderRadius: '20px', border: '1px solid rgba(255,255,255,0.1)' }}>
            <h3 style={{ marginBottom: '20px', fontSize: '18px' }}>Add Items</h3>
            <div style={{ display: 'flex', gap: '16px', alignItems: 'flex-end' }}>
              <div style={{ flex: 1 }}>
                <label style={{ display: 'block', fontSize: '12px', color: '#868e96', marginBottom: '8px' }}>Select Medicine</label>
                <select value={selectedItemCode} onChange={(e) => setSelectedItemCode(e.target.value)} style={{ width: '100%', padding: '12px', background: '#1a1a1a', border: '1px solid #333', borderRadius: '10px', color: '#fff' }}>
                  <option value="">-- Choose Item --</option>
                  {items.map(item => (
                    <option key={item.SimCode} value={item.SimCode}>{item.SimName} (Pur. Rate: {item.SimPurchRate})</option>
                  ))}
                </select>
              </div>
              <div style={{ width: '100px' }}>
                <label style={{ display: 'block', fontSize: '12px', color: '#868e96', marginBottom: '8px' }}>Quantity</label>
                <input type="number" value={qty} onChange={(e) => setQty(parseInt(e.target.value))} style={{ width: '100%', padding: '12px', background: '#1a1a1a', border: '1px solid #333', borderRadius: '10px', color: '#fff' }} />
              </div>
              <button onClick={addToCart} style={{ padding: '12px 20px', background: 'rgba(255,255,255,0.05)', border: '1px solid rgba(255,255,255,0.1)', borderRadius: '10px', color: '#fff', cursor: 'pointer', display: 'flex', alignItems: 'center', gap: '8px' }}>
                <Plus size={18} /> Add
              </button>
            </div>
          </div>

          <div style={{ background: 'rgba(255,255,255,0.03)', borderRadius: '20px', border: '1px solid rgba(255,255,255,0.1)', overflow: 'hidden' }}>
            <table style={{ width: '100%', borderCollapse: 'collapse' }}>
              <thead style={{ background: 'rgba(255,255,255,0.05)' }}>
                <tr>
                  <th style={{ padding: '15px', textAlign: 'left', fontSize: '14px', borderBottom: '1px solid #333' }}>S.No</th>
                  <th style={{ padding: '15px', textAlign: 'left', fontSize: '14px', borderBottom: '1px solid #333' }}>Description</th>
                  <th style={{ padding: '15px', textAlign: 'right', fontSize: '14px', borderBottom: '1px solid #333' }}>Qty</th>
                  <th style={{ padding: '15px', textAlign: 'right', fontSize: '14px', borderBottom: '1px solid #333' }}>P.Rate</th>
                  <th style={{ padding: '15px', textAlign: 'right', fontSize: '14px', borderBottom: '1px solid #333' }}>Total</th>
                  <th style={{ padding: '15px', borderBottom: '1px solid #333' }}></th>
                </tr>
              </thead>
              <tbody>
                {cart.length === 0 ? (
                  <tr><td colSpan={6} style={{ padding: '40px', textAlign: 'center', color: '#5c5f66' }}>No items added yet.</td></tr>
                ) : (
                  cart.map((item, idx) => (
                    <tr key={idx} style={{ borderBottom: '1px solid rgba(255,255,255,0.05)' }}>
                      <td style={{ padding: '15px' }}>{idx + 1}</td>
                      <td style={{ padding: '15px' }}>{item.name}</td>
                      <td style={{ padding: '15px', textAlign: 'right' }}>{item.qty}</td>
                      <td style={{ padding: '15px', textAlign: 'right' }}>{item.rate.toFixed(2)}</td>
                      <td style={{ padding: '15px', textAlign: 'right', fontWeight: 600 }}>{item.total.toFixed(2)}</td>
                      <td style={{ padding: '15px', textAlign: 'center' }}><button onClick={() => removeFromCart(idx)} style={{ background: 'none', border: 'none', color: '#ff6b6b', cursor: 'pointer' }}><Trash2 size={16} /></button></td>
                    </tr>
                  ))
                )}
              </tbody>
            </table>
          </div>
        </div>

        <div style={{ display: 'flex', flexDirection: 'column', gap: '24px' }}>
          <div style={{ background: 'rgba(255,255,255,0.03)', padding: '24px', borderRadius: '20px', border: '1px solid rgba(255,255,255,0.1)' }}>
            <h3 style={{ marginBottom: '20px', fontSize: '18px' }}>Supplier Details</h3>
            <div style={{ marginBottom: '16px' }}>
              <label style={{ display: 'block', fontSize: '12px', color: '#868e96', marginBottom: '8px' }}>Select Supplier</label>
              <select value={prtCode} onChange={(e) => setPrtCode(e.target.value)} style={{ width: '100%', padding: '12px', background: '#1a1a1a', border: '1px solid #333', borderRadius: '10px', color: '#fff' }}>
                <option value="">-- Choose Party --</option>
                {parties.map(p => (<option key={p.PryCode} value={p.PryCode}>{p.PryName}</option>))}
              </select>
            </div>
          </div>

          <div style={{ background: '#fab00510', padding: '24px', borderRadius: '20px', border: '1px solid #fab00533' }}>
            <h3 style={{ marginBottom: '20px', fontSize: '18px', color: '#fab005' }}>Purchase Summary</h3>
            <div style={{ display: 'flex', justifyContent: 'space-between', marginBottom: '12px' }}><span style={{ color: '#adb5bd' }}>Goods Amount</span><span>{totalAmt.toFixed(2)}</span></div>
            <div style={{ display: 'flex', justifyContent: 'space-between', marginBottom: '12px' }}><span style={{ color: '#adb5bd' }}>Tax / Other</span><span>0.00</span></div>
            <div style={{ height: '1px', background: 'rgba(255,255,255,0.1)', margin: '15px 0' }}></div>
            <div style={{ display: 'flex', justifyContent: 'space-between', fontSize: '20px', fontWeight: 700 }}><span style={{ color: '#fff' }}>Total Billing</span><span style={{ color: '#fab005' }}>₹{totalAmt.toFixed(2)}</span></div>
          </div>
        </div>
      </div>
    </div>
  );
}
