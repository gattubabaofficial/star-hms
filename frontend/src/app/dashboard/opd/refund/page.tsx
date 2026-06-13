"use client";

import React, { useState } from "react";
import styles from "../../../dashboard.module.css";
import { Search, RotateCcw, AlertTriangle, Plus } from "lucide-react";

interface RefundLog {
  ref_id: string;
  bill_no: string;
  patient_name: string;
  refund_amount: number;
  reason: string;
  date: string;
  status: "Approved" | "Processing" | "Rejected";
}

export default function OPDRefundPage() {
  const [refunds, setRefunds] = useState<RefundLog[]>([
    { ref_id: "REF-99011", bill_no: "OPD-20260611-0002", patient_name: "Sonia Rao", refund_amount: 150, reason: "Excess consultation fee charged", date: "2026-06-11 12:05", status: "Approved" },
    { ref_id: "REF-99012", bill_no: "OPD-20260611-0004", patient_name: "Rajesh Kumar", refund_amount: 250, reason: "Doctor unavailable (Consultation cancelled)", date: "2026-06-11 16:10", status: "Approved" },
  ]);

  const [searchTerm, setSearchTerm] = useState("");
  const [modalOpen, setModalOpen] = useState(false);
  const [formData, setFormData] = useState({
    bill_no: "",
    patient_name: "",
    refund_amount: "500",
    reason: ""
  });

  const handleAddRefund = (e: React.FormEvent) => {
    e.preventDefault();
    if (!formData.bill_no.trim() || !formData.patient_name.trim()) return;

    const newRef: RefundLog = {
      ref_id: `REF-${Math.floor(10000 + Math.random() * 90000)}`,
      bill_no: formData.bill_no,
      patient_name: formData.patient_name,
      refund_amount: Number(formData.refund_amount),
      reason: formData.reason || "Patient Category adjustment",
      date: new Date().toISOString().replace("T", " ").substring(0, 16),
      status: "Approved"
    };

    setRefunds(prev => [newRef, ...prev]);
    setFormData({ bill_no: "", patient_name: "", refund_amount: "500", reason: "" });
    setModalOpen(false);
  };

  const filteredRefunds = refunds.filter(r =>
    r.patient_name.toLowerCase().includes(searchTerm.toLowerCase()) ||
    r.bill_no.toLowerCase().includes(searchTerm.toLowerCase())
  );

  return (
    <div>
      <div className={styles.toolbar}>
        <div className={styles.searchBar}>
          <Search size={18} style={{ color: "var(--text-muted)" }} />
          <input
            type="text"
            placeholder="Search refunds by Patient or Bill No..."
            value={searchTerm}
            onChange={(e) => setSearchTerm(e.target.value)}
          />
        </div>
        <button className={styles.primaryBtn} onClick={() => setModalOpen(true)}>
          <Plus size={18} />
          <span>Issue Refund</span>
        </button>
      </div>

      <div className={styles.tableContainer}>
        <table className={styles.table}>
          <thead>
            <tr>
              <th>Refund ID</th>
              <th>Bill Number</th>
              <th>Patient Name</th>
              <th>Refund Date</th>
              <th>Reason</th>
              <th>Amount Returned</th>
              <th>Status</th>
            </tr>
          </thead>
          <tbody>
            {filteredRefunds.map((r) => (
              <tr key={r.ref_id}>
                <td style={{ fontWeight: 700, color: "var(--status-danger)" }}>{r.ref_id}</td>
                <td style={{ fontWeight: 600 }}>{r.bill_no}</td>
                <td style={{ fontWeight: 600 }}>{r.patient_name}</td>
                <td>{r.date}</td>
                <td>{r.reason}</td>
                <td style={{ fontWeight: 700, color: "var(--status-danger)" }}>₹{r.refund_amount.toFixed(2)}</td>
                <td>
                  <span className={`${styles.badge} ${styles.badgeSuccess}`}>
                    {r.status}
                  </span>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>

      {modalOpen && (
        <div className={styles.modalOverlay}>
          <div className={styles.modalContent} style={{ maxWidth: "450px" }}>
            <div className={styles.modalHeader}>
              <h3 style={{ fontSize: "18px", fontWeight: 600 }}>Issue Consultation Refund</h3>
              <button className={styles.closeBtn} onClick={() => setModalOpen(false)}>×</button>
            </div>
            <form onSubmit={handleAddRefund}>
              <div className={styles.modalBody}>
                <div className={styles.formGroup}>
                  <label>Original Bill No *</label>
                  <input
                    type="text"
                    className={styles.formControl}
                    placeholder="e.g. OPD-20260611-0001"
                    value={formData.bill_no}
                    onChange={(e) => setFormData(prev => ({ ...prev, bill_no: e.target.value }))}
                    required
                  />
                </div>

                <div className={styles.formGroup}>
                  <label>Patient Name *</label>
                  <input
                    type="text"
                    className={styles.formControl}
                    placeholder="e.g. Amit Patel"
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
                    value={formData.refund_amount}
                    onChange={(e) => setFormData(prev => ({ ...prev, refund_amount: e.target.value }))}
                    required
                  />
                </div>

                <div className={styles.formGroup}>
                  <label>Reason for Refund *</label>
                  <textarea
                    rows={2}
                    className={styles.formControl}
                    placeholder="e.g. Consultation cancelled, doctor absent"
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
