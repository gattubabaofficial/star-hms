"use client";

import React, { useEffect, useState } from "react";
import styles from "../../../dashboard.module.css";
import { FlaskConical, Plus, Search, AlertCircle, Check } from "lucide-react";

interface Patient {
  ptt_code: number;
  ptt_name: string;
  ptt_reg_no: number;
}

interface Doctor {
  dct_code: number;
  dct_name: string;
  dct_title: string;
}

interface Service {
  srv_code: number;
  srv_name: string;
  srv_rate: number;
}

export default function LabReceiptPage() {
  const [patients, setPatients] = useState<Patient[]>([]);
  const [doctors, setDoctors] = useState<Doctor[]>([]);
  const [services, setServices] = useState<Service[]>([]);
  
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");
  const [success, setSuccess] = useState("");

  const [formData, setFormData] = useState({
    LhdPttCode: "",
    LhdCDctCode: "",
    selectedService: "",
    LhdDiscPer: "0",
    LhdRecvdAmt: "0"
  });

  const [selectedTests, setSelectedTests] = useState<Service[]>([]);

  const loadDependencies = async () => {
    try {
      const pRes = await fetch("http://127.0.0.1:8000/api/masters/patients");
      const dRes = await fetch("http://127.0.0.1:8000/api/masters/doctors");
      const sRes = await fetch("http://127.0.0.1:8000/api/masters/services");
      
      if (pRes.ok) {
        const pData = await pRes.json();
        setPatients(pData);
        if (pData.length > 0) setFormData(prev => ({ ...prev, LhdPttCode: String(pData[0].ptt_code) }));
      }
      if (dRes.ok) {
        const dData = await dRes.json();
        setDoctors(dData);
        if (dData.length > 0) setFormData(prev => ({ ...prev, LhdCDctCode: String(dData[0].dct_code) }));
      }
      if (sRes.ok) {
        const sData = await sRes.json();
        setServices(sData);
        if (sData.length > 0) setFormData(prev => ({ ...prev, selectedService: String(sData[0].srv_code) }));
      }
    } catch (e) {
      console.log("Error loading dependencies:", e);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    loadDependencies();
  }, []);

  const handleAddTest = () => {
    const srv = services.find(s => s.srv_code === Number(formData.selectedService));
    if (srv && !selectedTests.some(t => t.srv_code === srv.srv_code)) {
      setSelectedTests(prev => [...prev, srv]);
    }
  };

  const handleRemoveTest = (code: number) => {
    setSelectedTests(prev => prev.filter(t => t.srv_code !== code));
  };

  const calculateTotals = () => {
    const subtotal = selectedTests.reduce((sum, t) => sum + t.srv_rate, 0);
    const discPer = Number(formData.LhdDiscPer || 0);
    const discAmt = (subtotal * discPer) / 100;
    const net = subtotal - discAmt;
    const recvd = Number(formData.LhdRecvdAmt || 0);
    const bal = net - recvd;

    return { subtotal, discAmt, net, bal };
  };

  const handleRegisterReceipt = async (e: React.FormEvent) => {
    e.preventDefault();
    setError("");
    setSuccess("");

    if (selectedTests.length === 0) {
      setError("Please add at least one laboratory diagnostic test.");
      return;
    }

    const { subtotal, discAmt, net, bal } = calculateTotals();
    const discPer = Number(formData.LhdDiscPer || 0);
    const recvd = Number(formData.LhdRecvdAmt || 0);

    const payload = {
      LhdDate: new Date().toISOString().split("T")[0],
      LhdPttCode: Number(formData.LhdPttCode),
      LhdCDctCode: formData.LhdCDctCode ? Number(formData.LhdCDctCode) : null,
      LhdRByCode: null,
      LhdDiscPer: discPer,
      LhdTotalAmt: subtotal,
      LhdRecvdAmt: recvd,
      LhdRfugAmt: 0,
      LhdBalAmt: bal,
      LhdAdvAmt: 0,
      LhdRemark: "Diagnostic Investigation",
      details: selectedTests.map(t => ({
        LrdSrvCode: t.srv_code,
        LrdUnit: 1.0,
        LrdRate: t.srv_rate,
        LrdAmtBefDisc: t.srv_rate,
        LrdDiscPer: discPer,
        LrdDiscAmt: (t.srv_rate * discPer) / 100,
        LrdAmtAftDisc: t.srv_rate - (t.srv_rate * discPer) / 100
      }))
    };

    try {
      const response = await fetch("http://127.0.0.1:8000/api/lab/registrations", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(payload)
      });

      if (response.ok) {
        setSuccess("Laboratory Receipt registered successfully!");
        setSelectedTests([]);
        setFormData(prev => ({ ...prev, LhdDiscPer: "0", LhdRecvdAmt: "0" }));
      } else {
        const err = await response.json();
        setError(err.detail || "Failed to log lab receipt");
      }
    } catch (err) {
      setError("Network connection error");
    }
  };

  const { subtotal, discAmt, net, bal } = calculateTotals();

  if (loading) {
    return <p style={{ color: "var(--text-secondary)", fontSize: "14px" }}>Loading receipt module...</p>;
  }

  return (
    <div style={{ display: "grid", gridTemplateColumns: "1.2fr 1fr", gap: "24px", alignItems: "flex-start" }}>
      <div className={styles.sectionBox}>
        <div className={styles.sectionHeader}>
          <h3 className={styles.sectionTitle}>Create Lab Invoice Receipt</h3>
        </div>

        <form onSubmit={handleRegisterReceipt}>
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

          <div className={styles.formGroup}>
            <label>Patient *</label>
            <select
              className={styles.formControl}
              value={formData.LhdPttCode}
              onChange={(e) => setFormData(prev => ({ ...prev, LhdPttCode: e.target.value }))}
            >
              {patients.map(p => (
                <option key={p.ptt_code} value={p.ptt_code}>{p.ptt_name} (Reg #{p.ptt_reg_no})</option>
              ))}
            </select>
          </div>

          <div className={styles.formGroup}>
            <label>Referencing Doctor</label>
            <select
              className={styles.formControl}
              value={formData.LhdCDctCode}
              onChange={(e) => setFormData(prev => ({ ...prev, LhdCDctCode: e.target.value }))}
            >
              {doctors.map(d => (
                <option key={d.dct_code} value={d.dct_code}>{d.dct_title} {d.dct_name}</option>
              ))}
            </select>
          </div>

          <div className={styles.formGroup} style={{ borderTop: "1px solid var(--border-light)", paddingTop: "16px", marginTop: "16px" }}>
            <label>Add Investigation Test</label>
            <div style={{ display: "flex", gap: "12px" }}>
              <select
                className={styles.formControl}
                value={formData.selectedService}
                onChange={(e) => setFormData(prev => ({ ...prev, selectedService: e.target.value }))}
              >
                {services.map(s => (
                  <option key={s.srv_code} value={s.srv_code}>{s.srv_name} (₹{s.srv_rate})</option>
                ))}
              </select>
              <button type="button" className={styles.primaryBtn} onClick={handleAddTest}>Add</button>
            </div>
          </div>

          <div style={{ marginTop: "24px" }}>
            <button type="submit" className={styles.primaryBtn} style={{ width: "100%", justifyContent: "center" }}>
              Register & Save Receipt
            </button>
          </div>
        </form>
      </div>

      <div style={{ display: "flex", flexDirection: "column", gap: "24px" }}>
        <div className={styles.sectionBox}>
          <h4 style={{ fontSize: "15px", fontWeight: 600, borderBottom: "1px solid var(--border-light)", paddingBottom: "10px", marginBottom: "16px" }}>
            Investigation Cart
          </h4>
          {selectedTests.length === 0 ? (
            <p style={{ color: "var(--text-secondary)", fontSize: "13px", fontStyle: "italic" }}>No diagnostic tests added yet.</p>
          ) : (
            <div style={{ display: "flex", flexDirection: "column", gap: "8px" }}>
              {selectedTests.map(t => (
                <div key={t.srv_code} style={{ display: "flex", justifyContent: "space-between", alignItems: "center", backgroundColor: "var(--bg-secondary)", padding: "10px 14px", borderRadius: "8px" }}>
                  <div style={{ display: "flex", flexDirection: "column" }}>
                    <span style={{ fontSize: "13px", fontWeight: 600 }}>{t.srv_name}</span>
                    <span style={{ fontSize: "12px", color: "var(--accent-color)" }}>₹{t.srv_rate}</span>
                  </div>
                  <button className={styles.closeBtn} onClick={() => handleRemoveTest(t.srv_code)} style={{ color: "var(--status-danger)" }}>×</button>
                </div>
              ))}
            </div>
          )}
        </div>

        <div className={styles.sectionBox}>
          <h4 style={{ fontSize: "15px", fontWeight: 600, borderBottom: "1px solid var(--border-light)", paddingBottom: "10px", marginBottom: "16px" }}>
            Bill Calculation
          </h4>
          <div style={{ display: "flex", flexDirection: "column", gap: "10px", fontSize: "13px" }}>
            <div style={{ display: "flex", justifyContent: "space-between" }}>
              <span>Cart Subtotal</span>
              <strong>₹{subtotal.toFixed(2)}</strong>
            </div>

            <div style={{ display: "flex", justifyContent: "space-between", alignItems: "center" }}>
              <span>Discount (%)</span>
              <input
                type="number"
                className={styles.formControl}
                style={{ width: "80px", padding: "6px" }}
                value={formData.LhdDiscPer}
                onChange={(e) => setFormData(prev => ({ ...prev, LhdDiscPer: e.target.value }))}
              />
            </div>

            <div style={{ display: "flex", justifyContent: "space-between" }}>
              <span>Discount Amount</span>
              <span style={{ color: "var(--status-success)" }}>-₹{discAmt.toFixed(2)}</span>
            </div>

            <div style={{ display: "flex", justifyContent: "space-between", fontWeight: 700, fontSize: "15px" }}>
              <span>Net Payable</span>
              <span style={{ color: "var(--accent-color)" }}>₹{net.toFixed(2)}</span>
            </div>

            <div style={{ display: "flex", justifyContent: "space-between", alignItems: "center", borderTop: "1px solid var(--border-light)", paddingTop: "10px" }}>
              <span>Recvd Cash (₹)</span>
              <input
                type="number"
                className={styles.formControl}
                style={{ width: "120px", padding: "6px" }}
                value={formData.LhdRecvdAmt}
                onChange={(e) => setFormData(prev => ({ ...prev, LhdRecvdAmt: e.target.value }))}
              />
            </div>

            <div style={{ display: "flex", justifyContent: "space-between", fontWeight: 600 }}>
              <span>Remaining Balance</span>
              <span style={{ color: bal > 0 ? "var(--status-danger)" : "var(--status-success)" }}>₹{bal.toFixed(2)}</span>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
