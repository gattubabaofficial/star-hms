"use client";

import React, { useEffect, useState } from "react";
import styles from "../../../dashboard.module.css";
import { Search, Plus, ShoppingBag, AlertCircle, Check } from "lucide-react";

interface Medicine {
  SimCode: number;
  SimName: string;
}

interface Batch {
  BatchNo: string;
  MRP: number;
  ExpiryDate: string;
  CurrentStock: number;
}

export default function PharmacySalesPage() {
  const [medicines, setMedicines] = useState<Medicine[]>([]);
  const [batches, setBatches] = useState<Batch[]>([]);
  
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");
  const [success, setSuccess] = useState("");

  const [formData, setFormData] = useState({
    customerName: "Outpatient Guest",
    customerPhone: "",
    selectedMedicine: "",
    selectedBatch: "",
    qty: "1",
    paymentMode: "Cash",
    paidAmount: "0"
  });

  const [cartList, setCartList] = useState<any[]>([]);

  const loadDependencies = async () => {
    try {
      const mRes = await fetch("http://127.0.0.1:8000/api/pharmacy/items");
      if (mRes.ok) {
        const mData = await mRes.json();
        setMedicines(mData);
        if (mData.length > 0) {
          setFormData(prev => ({ ...prev, selectedMedicine: String(mData[0].SimCode) }));
        }
      }
    } catch (e) {
      console.log("Error loading POS dependencies:", e);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    loadDependencies();
  }, []);

  // Fetch batches when medicine changes
  useEffect(() => {
    if (!formData.selectedMedicine) return;
    const fetchBatches = async () => {
      try {
        const res = await fetch(`http://127.0.0.1:8000/api/pharmacy/batches/${formData.selectedMedicine}`);
        if (res.ok) {
          const data = await res.json();
          setBatches(data);
          if (data.length > 0) {
            setFormData(prev => ({ ...prev, selectedBatch: data[0].BatchNo }));
          } else {
            setFormData(prev => ({ ...prev, selectedBatch: "" }));
          }
        }
      } catch (e) {
        console.log("Error fetching batches:", e);
      }
    };
    fetchBatches();
  }, [formData.selectedMedicine]);

  const handleInputChange = (e: React.ChangeEvent<HTMLInputElement | HTMLSelectElement>) => {
    const { name, value } = e.target;
    setFormData(prev => ({ ...prev, [name]: value }));
  };

  const handleAddToCart = () => {
    const med = medicines.find(m => m.SimCode === Number(formData.selectedMedicine));
    const bat = batches.find(b => b.BatchNo === formData.selectedBatch);
    if (!med || !bat) {
      setError("Please select both a medicine and a batch with available stock.");
      return;
    }

    const qty = Number(formData.qty);
    if (qty > bat.CurrentStock) {
      setError(`Insufficient stock. Available: ${bat.CurrentStock} units.`);
      return;
    }

    const newCartRow = {
      OsdSimCode: med.SimCode,
      itemName: med.SimName,
      OsdBatchNo: bat.BatchNo,
      OsdQty: qty,
      OsdRate: bat.MRP,
      OsdDiscPer: 0.0,
      OsdDiscAmt: 0.0,
      OsdTaxPer: 0.0,
      OsdTaxAmt: 0.0,
      OsdAmt: qty * bat.MRP
    };

    setCartList(prev => [...prev, newCartRow]);
    setError("");
  };

  const handleRemoveFromCart = (idx: number) => {
    setCartList(prev => prev.filter((_, i) => i !== idx));
  };

  const calculateCartTotals = () => {
    const total = cartList.reduce((sum, item) => sum + item.OsdAmt, 0);
    return {
      total,
      net: total
    };
  };

  const handleCheckout = async (e: React.FormEvent) => {
    e.preventDefault();
    setError("");
    setSuccess("");

    if (cartList.length === 0) {
      setError("Add at least one medicine item to check out.");
      return;
    }

    const { net } = calculateCartTotals();
    const paid = Number(formData.paidAmount || 0);

    const payload = {
      OskDate: new Date().toISOString().split("T")[0],
      OskPtyCode: null,
      OskPatCode: null,
      OskDocCode: null,
      OskCustomerName: formData.customerName,
      OskCustomerPhone: formData.customerPhone || null,
      OskRefNo: "POS-SALE",
      OskPaymentMode: formData.paymentMode,
      OskPaidAmt: paid,
      OskNetAmt: net,
      OskOtherChg: 0.0,
      OskRoundOff: 0.0,
      OskTax: 0.0,
      OskRemark: "POS Sales billing",
      details: cartList.map(item => ({
        OsdSimCode: item.OsdSimCode,
        OsdBatchNo: item.OsdBatchNo,
        OsdQty: item.OsdQty,
        OsdRate: item.OsdRate,
        OsdDiscPer: 0.0,
        OsdDiscAmt: 0.0,
        OsdTaxPer: 0.0,
        OsdTaxAmt: 0.0,
        OsdAmt: item.OsdAmt
      }))
    };

    try {
      const response = await fetch("http://127.0.0.1:8000/api/pharmacy/sales", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(payload)
      });

      if (response.ok) {
        setSuccess("Dispensed and billed successfully!");
        setCartList([]);
        setFormData(prev => ({ ...prev, paidAmount: "0" }));
      } else {
        const err = await response.json();
        setError(err.detail || "Failed to submit POS invoice");
      }
    } catch (err) {
      setError("Network connection error");
    }
  };

  const { total, net } = calculateCartTotals();

  if (loading) {
    return <p style={{ color: "var(--text-secondary)", fontSize: "14px" }}>Loading pharmacy sales terminal...</p>;
  }

  return (
    <div style={{ display: "grid", gridTemplateColumns: "1.2fr 1fr", gap: "24px", alignItems: "flex-start" }}>
      <div className={styles.sectionBox}>
        <h3 className={styles.sectionTitle} style={{ marginBottom: "20px" }}>POS Sales Terminal</h3>
        <form onSubmit={handleCheckout}>
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
              <label>Customer Name *</label>
              <input
                type="text"
                name="customerName"
                className={styles.formControl}
                value={formData.customerName}
                onChange={handleInputChange}
                required
              />
            </div>
            <div className={styles.formGroup}>
              <label>Contact Phone</label>
              <input
                type="text"
                name="customerPhone"
                className={styles.formControl}
                value={formData.customerPhone}
                onChange={handleInputChange}
                placeholder="e.g. 9812345678"
              />
            </div>
          </div>

          <div style={{ borderTop: "1px solid var(--border-light)", paddingTop: "16px", marginTop: "16px" }}>
            <h4 style={{ fontSize: "14px", fontWeight: 600, marginBottom: "12px" }}>Dispense Medicine</h4>
            
            <div className={styles.formGroup}>
              <label>Select Medicine *</label>
              <select
                name="selectedMedicine"
                className={styles.formControl}
                value={formData.selectedMedicine}
                onChange={handleInputChange}
              >
                {medicines.map(m => (
                  <option key={m.SimCode} value={m.SimCode}>{m.SimName}</option>
                ))}
              </select>
            </div>

            <div className={styles.formGrid}>
              <div className={styles.formGroup}>
                <label>Available Batches *</label>
                <select
                  name="selectedBatch"
                  className={styles.formControl}
                  value={formData.selectedBatch}
                  onChange={handleInputChange}
                >
                  {batches.map(b => (
                    <option key={b.BatchNo} value={b.BatchNo}>
                      {b.BatchNo} (MRP: ₹{b.MRP} | Stock: {b.CurrentStock})
                    </option>
                  ))}
                  {batches.length === 0 && <option value="">No Batch Stock Available</option>}
                </select>
              </div>
              
              <div className={styles.formGroup}>
                <label>Quantity *</label>
                <input
                  type="number"
                  name="qty"
                  className={styles.formControl}
                  value={formData.qty}
                  onChange={handleInputChange}
                  min="1"
                />
              </div>
            </div>

            <button 
              type="button" 
              className={styles.secondaryBtn}
              style={{ width: "100%", justifyContent: "center", marginTop: "12px" }}
              onClick={handleAddToCart}
              disabled={batches.length === 0}
            >
              Add Medicine to Bill
            </button>
          </div>

          <div style={{ borderTop: "1px solid var(--border-light)", paddingTop: "16px", marginTop: "16px" }}>
            <button type="submit" className={styles.primaryBtn} style={{ width: "100%", justifyContent: "center" }}>
              Print & Dispense Invoice
            </button>
          </div>
        </form>
      </div>

      <div style={{ display: "flex", flexDirection: "column", gap: "24px" }}>
        <div className={styles.sectionBox}>
          <h4 style={{ fontSize: "15px", fontWeight: 600, borderBottom: "1px solid var(--border-light)", paddingBottom: "10px", marginBottom: "16px" }}>
            Sales Cart
          </h4>
          {cartList.length === 0 ? (
            <p style={{ color: "var(--text-secondary)", fontSize: "13px", fontStyle: "italic" }}>Cart is empty.</p>
          ) : (
            <div style={{ display: "flex", flexDirection: "column", gap: "8px" }}>
              {cartList.map((item, idx) => (
                <div key={idx} style={{ display: "flex", justifyContent: "space-between", alignItems: "center", backgroundColor: "var(--bg-secondary)", padding: "10px 14px", borderRadius: "8px" }}>
                  <div style={{ display: "flex", flexDirection: "column" }}>
                    <span style={{ fontSize: "13px", fontWeight: 600 }}>{item.itemName}</span>
                    <span style={{ fontSize: "12px", color: "var(--text-secondary)" }}>
                      Batch: {item.OsdBatchNo} | Qty: {item.OsdQty} | MRP: ₹{item.OsdRate}
                    </span>
                  </div>
                  <button className={styles.closeBtn} onClick={() => handleRemoveFromCart(idx)} style={{ color: "var(--status-danger)" }}>×</button>
                </div>
              ))}
            </div>
          )}
        </div>

        <div className={styles.sectionBox}>
          <h4 style={{ fontSize: "15px", fontWeight: 600, borderBottom: "1px solid var(--border-light)", paddingBottom: "10px", marginBottom: "16px" }}>
            POS Bill
          </h4>
          <div style={{ display: "flex", flexDirection: "column", gap: "12px", fontSize: "13px" }}>
            <div style={{ display: "flex", justifyContent: "space-between", fontWeight: 700, fontSize: "15px" }}>
              <span>Total Bill Amt</span>
              <span style={{ color: "var(--accent-color)" }}>₹{net.toFixed(2)}</span>
            </div>

            <div className={styles.formGroup}>
              <label>Payment Method</label>
              <select
                name="paymentMode"
                className={styles.formControl}
                value={formData.paymentMode}
                onChange={handleInputChange}
              >
                <option value="Cash">Cash</option>
                <option value="UPI">UPI Payment</option>
                <option value="Card">Card</option>
              </select>
            </div>

            <div className={styles.formGroup}>
              <label>Paid Amount (₹)</label>
              <input
                type="number"
                name="paidAmount"
                className={styles.formControl}
                value={formData.paidAmount}
                onChange={handleInputChange}
              />
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
