"use client";
import React, { useState, useEffect } from 'react';
import { ShoppingCart, Plus, Save, Trash2, Search } from 'lucide-react';
import apiClient from '@/lib/apiClient';
import LookupField from '@/components/shared/LookupField';

interface PharmacyItem {
  SimCode: number;
  SimName: string;
  SimSaleRate: number;
  Group?: { SigName: string };
}

interface SaleDetail {
  simCode: number;
  name: string;
  qty: number;
  rate: number;
  total: number;
}

export default function PharmacySale() {
  const [items, setItems] = useState<PharmacyItem[]>([]);
  const [cart, setCart] = useState<SaleDetail[]>([]);
  const [selectedItemCode, setSelectedItemCode] = useState<string>('');
  const [qty, setQty] = useState<number>(1);
  const [pttCode, setPttCode] = useState<number | null>(null);
  const [totalAmt, setTotalAmt] = useState<number>(0);
  const [saving, setSaving] = useState(false);

  useEffect(() => {
    apiClient.get('/pharmacy/items')
      .then(res => setItems(res.data));
  }, []);

  const addToCart = () => {
    const item = items.find(i => i.SimCode === parseInt(selectedItemCode));
    if (!item) return;

    const detail: SaleDetail = {
      simCode: item.SimCode,
      name: item.SimName,
      qty: qty,
      rate: item.SimSaleRate || 0,
      total: qty * (item.SimSaleRate || 0)
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
    if (cart.length === 0) return;
    setSaving(true);
    try {
      const response = await apiClient.post('/pharmacy/sales', {
        SahPttCode: pttCode || null,
        SahTotalAmt: totalAmt,
        SahDate: new Date().toISOString(),
        Details: cart.map(item => ({
          SalSimCode: item.simCode,
          SalQty: item.qty,
          SalRate: item.rate,
          SalAmount: item.total
        }))
      });
      if (response) {
        alert('Sale recorded successfully!');
        setCart([]);
        setTotalAmt(0);
        setPttCode(null);
      }
    } catch (error) {
      alert('Failed to save sale');
    } finally {
      setSaving(false);
    }
  };

  return (
    <div style={{ padding: '40px' }}>
      <header style={{ marginBottom: '30px', display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
        <div>
          <h1 style={{ fontSize: '24px', display: 'flex', alignItems: 'center', gap: '10px' }}>
            <ShoppingCart size={28} color="currentColor" /> Pharmacy Sales (MediSale)
          </h1>
          <p style={{  margin: '5px 0 0' }}>Strict Offline Replica: Pharmacy Transaction Entry</p>
        </div>
        <button 
          onClick={handleSave}
          disabled={saving || cart.length === 0}
          style={{
            padding: '12px 24px',

            
            
            color: '#000',
            fontWeight: 600,
            
            display: 'flex',
            alignItems: 'center',
            gap: '8px',
            opacity: saving || cart.length === 0 ? 0.5 : 1
          }}
        >
          <Save size={18} /> {saving ? 'Saving...' : 'Save Invoice'}
        </button>
      </header>

      <div style={{ display: 'grid', gridTemplateColumns: '1fr 350px', gap: '30px' }}>
        {/* Left Side: Transaction Entry */}
        <div style={{ display: 'flex', flexDirection: 'column', gap: '24px' }}>
          <div className="dashboard-card" style={{ padding: '24px' }}>
            <h3 style={{ marginBottom: '20px', fontSize: '18px' }}>Add Items</h3>
            <div style={{ display: 'flex', gap: '16px', alignItems: 'flex-end' }}>
              <div style={{ flex: 1 }}>
                <label style={{ display: 'block', fontSize: '12px',  marginBottom: '8px' }}>Select Medicine</label>
                <select className="form-control" 
                  value={selectedItemCode}
                  onChange={(e) => setSelectedItemCode(e.target.value)}
                  style={{
                    width: '100%',
                    padding: '12px',
                    
                    
                    borderRadius: '10px' }}
                >
                  <option value="">-- Choose Item --</option>
                  {items.map(item => (
                    <option key={item.SimCode} value={item.SimCode}>
                      {item.SimName} (Rate: {item.SimSaleRate})
                    </option>
                  ))}
                </select>
              </div>
              <div style={{ width: '100px' }}>
                <label style={{ display: 'block', fontSize: '12px',  marginBottom: '8px' }}>Quantity</label>
                <input className="form-control" 
                  type="number" 
                  value={qty}
                  onChange={(e) => setQty(parseInt(e.target.value))}
                  style={{
                    width: '100%',
                    padding: '12px',
                    
                    
                    borderRadius: '10px' }}
                />
              </div>
              <button 
                onClick={addToCart}
                style={{
                  padding: '12px 20px',
                  
                  
                  borderRadius: '10px',
                  
                  
                  display: 'flex',
                  alignItems: 'center',
                  gap: '8px'
                }}
              >
                <Plus size={18} /> Add
              </button>
            </div>
          </div>

          <div style={{ 
             
            borderRadius: '20px',
            
            overflow: 'hidden'
          }}>
            <table style={{ width: '100%', borderCollapse: 'collapse' }}>
              <thead >
                <tr>
                  <th style={{ padding: '15px', textAlign: 'left', fontSize: '14px', borderBottom: '1px solid var(--border-color)' }}>S.No</th>
                  <th style={{ padding: '15px', textAlign: 'left', fontSize: '14px', borderBottom: '1px solid var(--border-color)' }}>Description</th>
                  <th style={{ padding: '15px', textAlign: 'right', fontSize: '14px', borderBottom: '1px solid var(--border-color)' }}>Qty</th>
                  <th style={{ padding: '15px', textAlign: 'right', fontSize: '14px', borderBottom: '1px solid var(--border-color)' }}>Rate</th>
                  <th style={{ padding: '15px', textAlign: 'right', fontSize: '14px', borderBottom: '1px solid var(--border-color)' }}>Total</th>
                  <th style={{ padding: '15px', borderBottom: '1px solid var(--border-color)' }}></th>
                </tr>
              </thead>
              <tbody>
                {cart.length === 0 ? (
                  <tr>
                    <td colSpan={6} style={{ padding: '40px', textAlign: 'center', color: '#5c5f66' }}>No items added yet.</td>
                  </tr>
                ) : (
                  cart.map((item, idx) => (
                    <tr key={idx} >
                      <td style={{ padding: '15px' }}>{idx + 1}</td>
                      <td style={{ padding: '15px' }}>{item.name}</td>
                      <td style={{ padding: '15px', textAlign: 'right' }}>{item.qty}</td>
                      <td style={{ padding: '15px', textAlign: 'right' }}>{item.rate.toFixed(2)}</td>
                      <td style={{ padding: '15px', textAlign: 'right', fontWeight: 600 }}>{item.total.toFixed(2)}</td>
                      <td style={{ padding: '15px', textAlign: 'center' }}>
                        <button onClick={() => removeFromCart(idx)} style={{ background: 'none',  color: '#ff6b6b' }}>
                          <Trash2 size={16} />
                        </button>
                      </td>
                    </tr>
                  ))
                )}
              </tbody>
            </table>
          </div>
        </div>

        {/* Right Side: Total Summary */}
        <div style={{ display: 'flex', flexDirection: 'column', gap: '24px' }}>
          <div className="dashboard-card" style={{ padding: '24px' }}>
            <h3 style={{ marginBottom: '20px', fontSize: '18px' }}>Patient Details</h3>
            <div style={{ marginBottom: '16px' }}>
              <label style={{ display: 'block', fontSize: '12px',  marginBottom: '8px' }}>Patient Lookup (Optional)</label>
              <LookupField 
                endpoint="/opd/patient-master" 
                valueKey="PttCode" 
                labelKey="PttName" 
                value={pttCode} 
                onChange={(val) => setPttCode(val)} 
              />
            </div>
          </div>

          <div className="dashboard-card" style={{ padding: '24px' }}>
            <h3 style={{ marginBottom: '20px', fontSize: '18px'}}>Sale Summary</h3>
            <div style={{ display: 'flex', justifyContent: 'space-between', marginBottom: '12px' }}>
              <span >Sub Total</span>
              <span>{totalAmt.toFixed(2)}</span>
            </div>
            <div style={{ display: 'flex', justifyContent: 'space-between', marginBottom: '12px' }}>
              <span >Discount</span>
              <span>0.00</span>
            </div>
            <div style={{ height: '1px',  margin: '15px 0' }}></div>
            <div style={{ display: 'flex', justifyContent: 'space-between', fontSize: '20px', fontWeight: 700 }}>
              <span >Net Payable</span>
              <span >₹{totalAmt.toFixed(2)}</span>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
