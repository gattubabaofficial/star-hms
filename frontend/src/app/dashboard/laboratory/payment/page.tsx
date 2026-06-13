"use client";

import React, { useEffect, useState } from "react";
import styles from "../../../dashboard.module.css";
import { Search, Plus, AlertCircle, Check, CreditCard } from "lucide-react";

interface LabHdr {
  LhdCode: number;
  LhdVchNo: number;
  LhdDate: string;
  LhdPttCode: number;
  LhdTotalAmt: number;
  LhdRecvdAmt: number;
  LhdBalAmt: number;
  patient_name?: string; // resolved in frontend list
}

export default function LabPaymentPage() {
  const [registrations, setRegistrations] = useState<LabHdr[]>([]);
  const [loading, setLoading] = useState(true);
  const [modalOpen, setModalOpen] = useState(false);
  const [selectedRegId, setSelectedRegId] = useState("");
  const [payAmount, setPayAmount] = useState("0");
  const [error, setError] = useState("");
  const [success, setSuccess] = useState("");

  const fetchData = async () => {
    try {
      const regRes = await fetch("http://127.0.0.1:8000/api/lab/registrations");
      const pRes = await fetch("http://127.0.0.1:8000/api/masters/patients");
      
      if (regRes.ok && pRes.ok) {
        const regs = await regRes.json();
        const patients = await pRes.json();
        
        // Match patient names
        const mapped = regs.map((r: any) => {
          const pat = patients.find((p: any) => p.ptt_code === r.LhdPttCode);
          return {
            ...r,
            patient_name: pat ? pat.ptt_name : `Patient #${r.LhdPttCode}`
          };
        });

        setRegistrations(mapped);
        
        const pending = mapped.filter((r: any) => r.LhdBalAmt > 0);
        if (pending.length > 0) {
          setSelectedRegId(String(pending[0].LhdCode));
          setPayAmount(String(pending[0].LhdBalAmt));
        }
      }
    } catch (e) {
      console.log("Error loading lab payment data:", e);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchData();
  }, []);

  useEffect(() => {
    if (!selectedRegId) return;
    const reg = registrations.find(r => r.LhdCode === Number(selectedRegId));
    if (reg) {
      setPayAmount(String(reg.LhdBalAmt));
    }
  }, [selectedRegId, registrations]);

  const handlePostPayment = async (e: React.FormEvent) => {
    e.preventDefault();
    setError("");
    setSuccess("");

    if (!selectedRegId || Number(payAmount) <= 0) {
      setError("Please select a valid registration and amount.");
      return;
    }

    try {
      const response = await fetch("http://127.0.0.1:8000/api/lab/payments", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          transaction_type: "receipt",
          ref_id: Number(selectedRegId),
          amount: Number(payAmount),
          date: new Date().toISOString().split("T")[0]
        })
      });

      if (response.ok) {
        setSuccess("Payment posted successfully!");
        await fetchData();
        setTimeout(() => {
          setModalOpen(false);
          setSuccess("");
        }, 1200);
      } else {
        const err = await response.json();
        setError(err.detail || "Failed to post payment");
      }
    } catch (err) {
      setError("Connection error");
    }
  };

  const pendingRegs = registrations.filter(r => r.LhdBalAmt > 0);

  return (
    <div>
      <div className={styles.toolbar} style={{ justifyContent: "space-between" }}>
        <h3 style={{ fontSize: "16px", fontWeight: 600 }}>Lab Collections Desk</h3>
        <button 
          className={styles.primaryBtn} 
          onClick={() => setModalOpen(true)}
          disabled={pendingRegs.length === 0}
        >
          <Plus size={18} />
          <span>Collect Balance</span>
        </button>
      </div>

      {loading ? (
        <p style={{ color: "var(--text-secondary)", fontSize: "14px" }}>Loading lab collections...</p>
      ) : registrations.length === 0 ? (
        <div style={{ backgroundColor: "var(--bg-card)", border: "1px solid var(--border-light)", borderRadius: "16px", padding: "60px", textAlign: "center" }}>
          <p style={{ color: "var(--text-secondary)", fontSize: "13px" }}>No lab transactions found.</p>
        </div>
      ) : (
        <div className={styles.tableContainer}>
          <table className={styles.table}>
            <thead>
              <tr>
                <th>Voucher No</th>
                <th>Date</th>
                <th>Patient Name</th>
                <th>Total Bill</th>
                <th>Amount Collected</th>
                <th>Balance Outstanding</th>
                <th>State</th>
              </tr>
            </thead>
            <tbody>
              {registrations.map((reg) => (
                <tr key={reg.LhdCode}>
                  <td style={{ fontWeight: 600, color: "var(--accent-color)" }}>#VCH-{reg.LhdVchNo}</td>
                  <td>{reg.LhdDate}</td>
                  <td style={{ fontWeight: 600 }}>{reg.patient_name}</td>
                  <td>₹{reg.LhdTotalAmt.toLocaleString()}</td>
                  <td style={{ color: "var(--status-success)" }}>₹{reg.LhdRecvdAmt.toLocaleString()}</td>
                  <td style={{ fontWeight: 700, color: reg.LhdBalAmt > 0 ? "var(--status-danger)" : "var(--text-secondary)" }}>
                    ₹{reg.LhdBalAmt.toLocaleString()}
                  </td>
                  <td>
                    <span className={`${styles.badge} ${reg.LhdBalAmt === 0 ? styles.badgeSuccess : styles.badgeWarning}`}>
                      {reg.LhdBalAmt === 0 ? "Settled" : "Pending"}
                    </span>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      )}

      {modalOpen && (
        <div className={styles.modalOverlay}>
          <div className={styles.modalContent} style={{ maxWidth: "450px" }}>
            <div className={styles.modalHeader}>
              <h3 style={{ fontSize: "18px", fontWeight: 600 }}>Collect Outstanding Lab Balance</h3>
              <button className={styles.closeBtn} onClick={() => setModalOpen(false)}>×</button>
            </div>
            <form onSubmit={handlePostPayment}>
              <div className={styles.modalBody}>
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
                  <label>Pending Lab Voucher *</label>
                  <select
                    className={styles.formControl}
                    value={selectedRegId}
                    onChange={(e) => setSelectedRegId(e.target.value)}
                  >
                    {pendingRegs.map(r => (
                      <option key={r.LhdCode} value={r.LhdCode}>
                        {r.patient_name} (Voucher #{r.LhdVchNo} | Bal: ₹{r.LhdBalAmt})
                      </option>
                    ))}
                  </select>
                </div>

                <div className={styles.formGroup}>
                  <label>Collection Amount (₹) *</label>
                  <input
                    type="number"
                    className={styles.formControl}
                    value={payAmount}
                    onChange={(e) => setPayAmount(e.target.value)}
                    required
                  />
                </div>
              </div>
              <div className={styles.modalFooter}>
                <button type="button" className={styles.secondaryBtn} onClick={() => setModalOpen(false)}>Cancel</button>
                <button type="submit" className={styles.primaryBtn}>Post Payment</button>
              </div>
            </form>
          </div>
        </div>
      )}
    </div>
  );
}
