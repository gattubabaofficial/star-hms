"use client";

import React, { useEffect, useState } from "react";
import styles from "../../../dashboard.module.css";
import { Plus, Search, AlertCircle, Check } from "lucide-react";

interface Vendor {
  PrtCode: number;
  PrtName: string;
}

interface Medicine {
  SimCode: number;
  SimName: string;
}

export default function PharmacyPurchasePage() {
  const [vendors, setVendors] = useState<Vendor[]>([]);
  const [medicines, setMedicines] = useState<Medicine[]>([]);
  const [loading, setLoading] = useState(true);
  
  const [error, setError] = useState("");
  const [success, setSuccess] = useState("");

  const [formData, setFormData] = useState({
    IskPtyCode: "",
    IskRefNo: "",
    IskOtherChg: "0",
    IskRoundOff: "0",
    selectedMedicine: "",
    batchNo: "B-001",
    expiryDate: new Date(Date.now() + 365*24*60*60*1000).toISOString().split("T")[0],
    mrp: "10",
    qty: "100",
    rate: "8"
  });

  const [detailsList, setDetailsList] = useState<any[]>([]);

  const loadData = async () => {
    try {
      const vRes = await fetch("http://127.0.0.1:8000/api/pharmacy/parties");
      const mRes = await fetch("http://127.0.0.1:8000/api/pharmacy/items");
      
      if (vRes.ok) {
        const vData = await vRes.json();
        setVendors(vData);
        if (vData.length > 0) setFormData(prev => ({ ...prev, IskPtyCode: String(vData[0].PrtCode) }));
      }
      if (mRes.ok) {
        const mData = await mRes.json();
        setMedicines(mData);
        if (mData.length > 0) setFormData(prev => ({ ...prev, selectedMedicine: String(mData[0].SimCode) }));
      }
    } catch (e) {
      console.log("Error loading purchase register dependancies:", e);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    loadData();
  }, []);

  const handleAddRow = () => {
    const med = medicines.find(m => m.SimCode === Number(formData.selectedMedicine));
    if (!med) return;

    const qty = Number(formData.qty);
    const rate = Number(formData.rate);
    const mrp = Number(formData.mrp);
    const amt = qty * rate;

    const newRow = {
      IsdSimCode: med.SimCode,
      itemName: med.SimName,
      IsdBatchNo: formData.batchNo,
      IsdExpiryDate: formData.expiryDate,
      IsdMRP: mrp,
      IsdQty: qty,
      IsdRate: rate,
      IsdDiscPer: 0,
      IsdDiscAmt: 0,
      IsdTaxPer: 0,
      IsdTaxAmt: 0,
      IsdAmt: amt
    };

    setDetailsList(prev => [...prev, newRow]);
  };

  const handleRemoveRow = (idx: number) => {
    setDetailsList(prev => prev.filter((_, i) => i !== idx));
  };

  const calculateNet = () => {
    const total = detailsList.reduce((sum, item) => sum + item.IsdAmt, 0);
    const other = Number(formData.IskOtherChg || 0);
    const round = Number(formData.IskRoundOff || 0);
    return total + other - round;
  };

  const handleSavePurchase = async (e: React.FormEvent) => {
    e.preventDefault();
    setError("");
    setSuccess("");

    if (detailsList.length === 0) {
      setError("Please add at least one medicine stock line item.");
      return;
    }

    const net = calculateNet();

    const payload = {
      IskDate: new Date().toISOString().split("T")[0],
      IskPtyCode: Number(formData.IskPtyCode),
      IskRefNo: formData.IskRefNo || "REF-PURCH",
      IskNetAmt: net,
      IskOtherChg: Number(formData.IskOtherChg),
      IskRoundOff: Number(formData.IskRoundOff),
      IskTax: 0.0,
      IskRemark: "Inward Purchase",
      details: detailsList.map(item => ({
        IsdSimCode: item.IsdSimCode,
        IsdBatchNo: item.IsdBatchNo,
        IsdExpiryDate: item.IsdExpiryDate,
        IsdMRP: item.IsdMRP,
        IsdQty: item.IsdQty,
        IsdRate: item.IsdRate,
        IsdDiscPer: 0,
        IsdDiscAmt: 0,
        IsdTaxPer: 0,
        IsdTaxAmt: 0,
        IsdAmt: item.IsdAmt
      }))
    };

    try {
      const response = await fetch("http://127.0.0.1:8000/api/pharmacy/purchases", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(payload)
      });

      if (response.ok) {
        setSuccess("Stock Inward voucher saved successfully!");
        setDetailsList([]);
      } else {
        const err = await response.json();
        setError(err.detail || "Failed to save purchase voucher");
      }
    } catch (err) {
      setError("Network connection error");
    }
  };

  if (loading) {
    return <p style={{ color: "var(--text-secondary)", fontSize: "14px" }}>Loading purchase register...</p>;
  }

  return (
    <div style={{ display: "grid", gridTemplateColumns: "1.2fr 1fr", gap: "24px", alignItems: "flex-start" }}>
      <div className={styles.sectionBox}>
        <h3 className={styles.sectionTitle} style={{ marginBottom: "20px" }}>Log Vendor Stock Inward</h3>
        <form onSubmit={handleSavePurchase}>
          {error && (
            <div style={{ color: "var(--status-danger)", display: "flex", alignItems: "center", gap: "6px", fontSize: "13px", marginBottom: "16px" }}>
              <AlertCircle size={16} /> {error}
            </div>
          )}
          {success && (
            <div style={{ color: "var(--status-success)", display: "flex", alignItems: "center", gap: "6px", fontSize: "13px", marginBottom: "16px" }}>
              <Check size={16} /> {success}
            </div>
          )}

          <div className={styles.formGrid}>
            <div className={styles.formGroup}>
              <label>Select Vendor *</label>
              <select
                className={styles.formControl}
                value={formData.IskPtyCode}
                onChange={(e) => setFormData(prev => ({ ...prev, IskPtyCode: e.target.value }))}
              >
                {vendors.map(v => (
                  <option key={v.PrtCode} value={v.PrtCode}>{v.PrtName}</option>
                ))}
              </select>
            </div>
            <div className={styles.formGroup}>
              <label>Ref/Invoice Number</label>
              <input
                type="text"
                className={styles.formControl}
                value={formData.IskRefNo}
                onChange={(e) => setFormData(prev => ({ ...prev, IskRefNo: e.target.value }))}
                placeholder="e.g. INV-9901"
              />
            </div>
          </div>

          <div style={{ borderTop: "1px solid var(--border-light)", paddingTop: "16px", marginTop: "16px" }}>
            <h4 style={{ fontSize: "14px", fontWeight: 600, marginBottom: "12px" }}>Item Inward Details</h4>
            
            <div className={styles.formGroup}>
              <label>Select Medicine *</label>
              <select
                className={styles.formControl}
                value={formData.selectedMedicine}
                onChange={(e) => setFormData(prev => ({ ...prev, selectedMedicine: e.target.value }))}
              >
                {medicines.map(m => (
                  <option key={m.SimCode} value={m.SimCode}>{m.SimName}</option>
                ))}
              </select>
            </div>

            <div className={styles.formGrid}>
              <div className={styles.formGroup}>
                <label>Batch Number *</label>
                <input
                  type="text"
                  className={styles.formControl}
                  value={formData.batchNo}
                  onChange={(e) => setFormData(prev => ({ ...prev, batchNo: e.target.value }))}
                />
              </div>
              <div className={styles.formGroup}>
                <label>Expiry Date *</label>
                <input
                  type="date"
                  className={styles.formControl}
                  value={formData.expiryDate}
                  onChange={(e) => setFormData(prev => ({ ...prev, expiryDate: e.target.value }))}
                />
              </div>
            </div>

            <div className={styles.formGrid} style={{ gridTemplateColumns: "1fr 1fr 1fr" }}>
              <div className={styles.formGroup}>
                <label>Quantity *</label>
                <input
                  type="number"
                  className={styles.formControl}
                  value={formData.qty}
                  onChange={(e) => setFormData(prev => ({ ...prev, qty: e.target.value }))}
                />
              </div>
              <div className={styles.formGroup}>
                <label>Cost Rate (₹) *</label>
                <input
                  type="number"
                  className={styles.formControl}
                  value={formData.rate}
                  onChange={(e) => setFormData(prev => ({ ...prev, rate: e.target.value }))}
                />
              </div>
              <div className={styles.formGroup}>
                <label>MRP (₹) *</label>
                <input
                  type="number"
                  className={styles.formControl}
                  value={formData.mrp}
                  onChange={(e) => setFormData(prev => ({ ...prev, mrp: e.target.value }))}
                />
              </div>
            </div>

            <button 
              type="button" 
              className={styles.secondaryBtn} 
              style={{ width: "100%", justifyContent: "center", marginTop: "12px" }}
              onClick={handleAddRow}
            >
              Add Item to Cart
            </button>
          </div>

          <div style={{ borderTop: "1px solid var(--border-light)", paddingTop: "16px", marginTop: "16px" }}>
            <button type="submit" className={styles.primaryBtn} style={{ width: "100%", justifyContent: "center" }}>
              Commit Purchase Voucher
            </button>
          </div>
        </form>
      </div>

      <div style={{ display: "flex", flexDirection: "column", gap: "24px" }}>
        <div className={styles.sectionBox}>
          <h4 style={{ fontSize: "15px", fontWeight: 600, borderBottom: "1px solid var(--border-light)", paddingBottom: "10px", marginBottom: "16px" }}>
            Items Added
          </h4>
          {detailsList.length === 0 ? (
            <p style={{ color: "var(--text-secondary)", fontSize: "13px", fontStyle: "italic" }}>No line items added.</p>
          ) : (
            <div style={{ display: "flex", flexDirection: "column", gap: "8px" }}>
              {detailsList.map((item, idx) => (
                <div key={idx} style={{ display: "flex", justifyContent: "space-between", alignItems: "center", backgroundColor: "var(--bg-secondary)", padding: "10px 14px", borderRadius: "8px" }}>
                  <div style={{ display: "flex", flexDirection: "column" }}>
                    <span style={{ fontSize: "13px", fontWeight: 600 }}>{item.itemName}</span>
                    <span style={{ fontSize: "12px", color: "var(--text-secondary)" }}>
                      Batch: {item.IsdBatchNo} | Qty: {item.IsdQty} | Cost: ₹{item.IsdRate}
                    </span>
                  </div>
                  <button className={styles.closeBtn} onClick={() => handleRemoveRow(idx)} style={{ color: "var(--status-danger)" }}>×</button>
                </div>
              ))}
            </div>
          )}
        </div>

        <div className={styles.sectionBox}>
          <h4 style={{ fontSize: "15px", fontWeight: 600, borderBottom: "1px solid var(--border-light)", paddingBottom: "10px", marginBottom: "16px" }}>
            Voucher Totals
          </h4>
          <div style={{ display: "flex", flexDirection: "column", gap: "10px", fontSize: "13px" }}>
            <div style={{ display: "flex", justifyContent: "space-between" }}>
              <span>Items Cost Total</span>
              <strong>₹{detailsList.reduce((sum, item) => sum + item.IsdAmt, 0).toFixed(2)}</strong>
            </div>
            <div style={{ display: "flex", justifyContent: "space-between", alignItems: "center" }}>
              <span>Other Charges (₹)</span>
              <input
                type="number"
                className={styles.formControl}
                style={{ width: "100px", padding: "6px" }}
                value={formData.IskOtherChg}
                onChange={(e) => setFormData(prev => ({ ...prev, IskOtherChg: e.target.value }))}
              />
            </div>
            <div style={{ display: "flex", justifyContent: "space-between", alignItems: "center" }}>
              <span>Round Off (₹)</span>
              <input
                type="number"
                className={styles.formControl}
                style={{ width: "100px", padding: "6px" }}
                value={formData.IskRoundOff}
                onChange={(e) => setFormData(prev => ({ ...prev, IskRoundOff: e.target.value }))}
              />
            </div>
            <div style={{ display: "flex", justifyContent: "space-between", fontWeight: 700, fontSize: "15px", borderTop: "1px solid var(--border-light)", paddingTop: "10px" }}>
              <span>Net Inward Cost</span>
              <span style={{ color: "var(--accent-color)" }}>₹{calculateNet().toFixed(2)}</span>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
