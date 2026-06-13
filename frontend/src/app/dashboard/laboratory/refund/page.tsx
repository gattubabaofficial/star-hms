"use client";

import React, { useEffect, useState } from "react";
import styles from "../../../dashboard.module.css";
import { Search, Plus, AlertCircle, Check, RotateCcw } from "lucide-react";

interface LabHdr {
  LhdCode: number;
  LhdVchNo: number;
  LhdDate: string;
  LhdPttCode: number;
  LhdTotalAmt: number;
  LhdRecvdAmt: number;
  LhdRfugAmt: number;
  patient_name?: string;
}

export default function LabRefundPage() {
  const [registrations, setRegistrations] = useState<LabHdr[]>([]);
  const [loading, setLoading] = useState(true);
  const [modalOpen, setModalOpen] = useState(false);
  const [selectedRegId, setSelectedRegId] = useState("");
  const [refundAmount, setRefundAmount] = useState("0");
  const [error, setError] = useState("");
  const [success, setSuccess] = useState("");

  const fetchData = async () => {
    try {
      const regRes = await fetch("http://127.0.0.1:8000/api/lab/registrations");
      const pRes = await fetch("http://127.0.0.1:8000/api/masters/patients");
      
      if (regRes.ok && pRes.ok) {
        const regs = await regRes.json();
        const patients = await pRes.json();
        
        const mapped = regs.map((r: any) => {
          const pat = patients.find((p: any) => p.ptt_code === r.LhdPttCode);
          return {
            ...r,
            patient_name: pat ? pat.ptt_name : `Patient #${r.LhdPttCode}`
          };
        });

        setRegistrations(mapped);
        
        const refundable = mapped.filter((r: any) => r.LhdRecvdAmt > r.LhdRfugAmt);
        if (refundable.length > 0) {
          setSelectedRegId(String(refundable[0].LhdCode));
          setRefundAmount(String(refundable[0].LhdRecvdAmt - refundable[0].LhdRfugAmt));
        }
      }
    } catch (e) {
      console.log("Error loading lab refund data:", e);
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
      setRefundAmount(String(reg.LhdRecvdAmt - reg.LhdRfugAmt));
    }
  }, [selectedRegId, registrations]);

  const handlePostRefund = async (e: React.FormEvent) => {
    e.preventDefault();
    setError("");
    setSuccess("");

    if (!selectedRegId || Number(refundAmount) <= 0) {
      setError("Please select a valid registration and amount.");
      return;
    }

    try {
      const response = await fetch("http://127.0.0.1:8000/api/lab/refunds", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          transaction_type: "receipt",
          ref_id: Number(selectedRegId),
          amount: Number(refundAmount),
          date: new Date().toISOString().split("T")[0]
        })
      });

      if (response.ok) {
        setSuccess("Refund logged successfully!");
        await fetchData();
        setTimeout(() => {
          setModalOpen(false);
          setSuccess("");
        }, 1200);
      } else {
        const err = await response.json();
        setError(err.detail || "Failed to issue refund");
      }
    } catch (err) {
      setError("Connection error");
    }
  };

  const refundableRegs = registrations.filter(r => r.LhdRecvdAmt > r.LhdRfugAmt);

  return (
    <div>
      <div className={styles.toolbar} style={{ justifyContent: "space-between" }}>
        <h3 style={{ fontSize: "16px", fontWeight: 600 }}>Lab Refund Desk</h3>
        <button 
          className={styles.primaryBtn} 
          style={{ backgroundColor: "var(--status-danger)" }}
          onClick={() => setModalOpen(true)}
          disabled={refundableRegs.length === 0}
        >
          <Plus size={18} />
          <span>Issue Refund</span>
        </button>
      </div>

      {loading ? (
        <p style={{ color: "var(--text-secondary)", fontSize: "14px" }}>Loading laboratory refunds log...</p>
      ) : registrations.filter(r => r.LhdRfugAmt > 0).length === 0 ? (
        <div style={{ backgroundColor: "var(--bg-card)", border: "1px solid var(--border-light)", borderRadius: "16px", padding: "60px", textAlign: "center" }}>
          <p style={{ color: "var(--text-secondary)", fontSize: "13px" }}>No refund transactions issued today.</p>
        </div>
      ) : (
        <div className={styles.tableContainer}>
          <table className={styles.table}>
            <thead>
              <tr>
                <th>Voucher No</th>
                <th>Patient Name</th>
                <th>Paid Amount</th>
                <th>Refunded Amount</th>
                <th>Refund Date</th>
              </tr>
            </thead>
            <tbody>
              {registrations.filter(r => r.LhdRfugAmt > 0).map((reg) => (
                <tr key={reg.LhdCode}>
                  <td style={{ fontWeight: 600, color: "var(--status-danger)" }}>#VCH-{reg.LhdVchNo}</td>
                  <td style={{ fontWeight: 600 }}>{reg.patient_name}</td>
                  <td>₹{reg.LhdTotalAmt}</td>
                  <td style={{ fontWeight: 700, color: "var(--status-danger)" }}>₹{reg.LhdRfugAmt}</td>
                  <td>{reg.LhdDate}</td>
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
              <h3 style={{ fontSize: "18px", fontWeight: 600 }}>Issue Lab Voucher Refund</h3>
              <button className={styles.closeBtn} onClick={() => setModalOpen(false)}>×</button>
            </div>
            <form onSubmit={handlePostRefund}>
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
                  <label>Select Voucher *</label>
                  <select
                    className={styles.formControl}
                    value={selectedRegId}
                    onChange={(e) => setSelectedRegId(e.target.value)}
                  >
                    {refundableRegs.map(r => (
                      <option key={r.LhdCode} value={r.LhdCode}>
                        {r.patient_name} (Voucher #{r.LhdVchNo} | Paid: ₹{r.LhdRecvdAmt})
                      </option>
                    ))}
                  </select>
                </div>

                <div className={styles.formGroup}>
                  <label>Refund Amount (₹) *</label>
                  <input
                    type="number"
                    className={styles.formControl}
                    value={refundAmount}
                    onChange={(e) => setRefundAmount(e.target.value)}
                    required
                  />
                </div>
              </div>
              <div className={styles.modalFooter}>
                <button type="button" className={styles.secondaryBtn} onClick={() => setModalOpen(false)}>Cancel</button>
                <button type="submit" className={styles.primaryBtn} style={{ backgroundColor: "var(--status-danger)" }}>Issue Refund</button>
              </div>
            </form>
          </div>
        </div>
      )}
    </div>
  );
}
