"use client";

import React, { useState } from "react";
import styles from "../../../dashboard.module.css";
import { Search, RotateCcw, Plus } from "lucide-react";

interface IPDRefundLog {
  ref_id: string;
  ipd_no: string;
  patient_name: string;
  amount: number;
  reason: string;
  date: string;
}

export default function IPDRefundPage() {
  const [refunds, setRefunds] = useState<IPDRefundLog[]>([
    { ref_id: "IREF-8812", ipd_no: "IPD-102", patient_name: "Anita Bose", amount: 2500, reason: "Excess advance deposit refund upon discharge", date: "2026-06-10 14:00" }
  ]);

  const [searchTerm, setSearchTerm] = useState("");
  const [modalOpen, setModalOpen] = useState(false);
  
  const [formData, setFormData] = useState({
    ipd_no: "",
    patient_name: "",
    amount: "1000",
    reason: ""
  });

  const handleAddRefund = (e: React.FormEvent) => {
    e.preventDefault();
    if (!formData.ipd_no.trim() || !formData.patient_name.trim()) return;

    setRefunds(prev => [
      {
        ref_id: `IREF-${Math.floor(1000 + Math.random() * 9000)}`,
        ipd_no: formData.ipd_no,
        patient_name: formData.patient_name,
        amount: Number(formData.amount),
        reason: formData.reason || "Adjusted deposit balance",
        date: new Date().toISOString().replace("T", " ").substring(0, 16)
      },
      ...prev
    ]);

    setFormData({ ipd_no: "", patient_name: "", amount: "1000", reason: "" });
    setModalOpen(false);
  };

  const filteredRefunds = refunds.filter(r =>
    r.patient_name.toLowerCase().includes(searchTerm.toLowerCase()) ||
    r.ipd_no.toLowerCase().includes(searchTerm.toLowerCase())
  );

  return (
    <div>
      <div className={styles.toolbar}>
        <div className={styles.searchBar}>
          <Search size={18} style={{ color: "var(--text-muted)" }} />
          <input
            type="text"
            placeholder="Search refunds by Patient Name or IPD code..."
            value={searchTerm}
            onChange={(e) => setSearchTerm(e.target.value)}
          />
        </div>
        <button className={styles.primaryBtn} onClick={() => setModalOpen(true)}>
          <Plus size={18} />
          <span>Issue Deposit Refund</span>
        </button>
      </div>

      <div className={styles.tableContainer}>
        <table className={styles.table}>
          <thead>
            <tr>
              <th>Refund ID</th>
              <th>IPD Case Ref</th>
              <th>Patient Name</th>
              <th>Date Issued</th>
              <th>Reason</th>
              <th>Refunded Amount</th>
            </tr>
          </thead>
          <tbody>
            {filteredRefunds.map((r) => (
              <tr key={r.ref_id}>
                <td style={{ fontWeight: 700, color: "var(--status-danger)" }}>{r.ref_id}</td>
                <td style={{ fontWeight: 600 }}>{r.ipd_no}</td>
                <td style={{ fontWeight: 600 }}>{r.patient_name}</td>
                <td>{r.date}</td>
                <td>{r.reason}</td>
                <td style={{ fontWeight: 700, color: "var(--status-danger)" }}>₹{r.amount.toLocaleString()}</td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>

      {modalOpen && (
        <div className={styles.modalOverlay}>
          <div className={styles.modalContent} style={{ maxWidth: "450px" }}>
            <div className={styles.modalHeader}>
              <h3 style={{ fontSize: "18px", fontWeight: 600 }}>Issue Deposit Refund</h3>
              <button className={styles.closeBtn} onClick={() => setModalOpen(false)}>×</button>
            </div>
            <form onSubmit={handleAddRefund}>
              <div className={styles.modalBody}>
                <div className={styles.formGroup}>
                  <label>IPD Case Reference (e.g. IPD-102) *</label>
                  <input
                    type="text"
                    className={styles.formControl}
                    value={formData.ipd_no}
                    onChange={(e) => setFormData(prev => ({ ...prev, ipd_no: e.target.value }))}
                    required
                  />
                </div>

                <div className={styles.formGroup}>
                  <label>Patient Name *</label>
                  <input
                    type="text"
                    className={styles.formControl}
                    value={formData.patient_name}
                    onChange={(e) => setFormData(prev => ({ ...prev, patient_name: e.target.value }))}
                    required
                  />
                </div>

                <div className={styles.formGroup}>
                  <label>Refund Amount (₹) *</label>
                  <input
                    type="number"
                    className={styles.formControl}
                    value={formData.amount}
                    onChange={(e) => setFormData(prev => ({ ...prev, amount: e.target.value }))}
                    required
                  />
                </div>

                <div className={styles.formGroup}>
                  <label>Reason for Refund *</label>
                  <textarea
                    rows={2}
                    className={styles.formControl}
                    value={formData.reason}
                    onChange={(e) => setFormData(prev => ({ ...prev, reason: e.target.value }))}
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
