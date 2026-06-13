"use client";

import React, { useState } from "react";
import styles from "../../../dashboard.module.css";
import { Plus, Search, AlertCircle, Check } from "lucide-react";

interface ContraVoucher {
  vch_no: string;
  date: string;
  source_head: "Cash Office" | "HDFC Bank" | "State Bank of India";
  dest_head: "Cash Office" | "HDFC Bank" | "State Bank of India";
  amount: number;
  remarks: string;
}

export default function ContraVoucherPage() {
  const [vouchers, setVouchers] = useState<ContraVoucher[]>([
    { vch_no: "CNV-001", date: "2026-06-11", source_head: "Cash Office", dest_head: "HDFC Bank", amount: 25000, remarks: "OPD cash collection deposited into HDFC account" },
    { vch_no: "CNV-002", date: "2026-06-11", source_head: "State Bank of India", dest_head: "Cash Office", amount: 10000, remarks: "Self-withdrawal for petty cash replenishing" }
  ]);

  const [modalOpen, setModalOpen] = useState(false);
  const [formData, setFormData] = useState({
    source_head: "Cash Office" as any,
    dest_head: "HDFC Bank" as any,
    amount: "5000",
    remarks: ""
  });

  const handleAddContra = (e: React.FormEvent) => {
    e.preventDefault();
    if (formData.source_head === formData.dest_head) return;

    const newVch: ContraVoucher = {
      vch_no: `CNV-00${vouchers.length + 1}`,
      date: new Date().toISOString().split("T")[0],
      source_head: formData.source_head,
      dest_head: formData.dest_head,
      amount: Number(formData.amount),
      remarks: formData.remarks || "Fund transfer logged"
    };

    setVouchers(prev => [newVch, ...prev]);
    setFormData({ source_head: "Cash Office", dest_head: "HDFC Bank", amount: "5000", remarks: "" });
    setModalOpen(false);
  };

  return (
    <div>
      <div className={styles.toolbar} style={{ justifyContent: "space-between" }}>
        <h3 style={{ fontSize: "16px", fontWeight: 600 }}>Contra Transfer Voucher Register (CNV)</h3>
        <button className={styles.primaryBtn} onClick={() => setModalOpen(true)}>
          <Plus size={18} />
          <span>New Contra Transfer</span>
        </button>
      </div>

      <div className={styles.tableContainer}>
        <table className={styles.table}>
          <thead>
            <tr>
              <th>Voucher No</th>
              <th>Voucher Date</th>
              <th>Debit Account (To)</th>
              <th>Credit Account (From)</th>
              <th>Narration / Remarks</th>
              <th>Transfer Amount</th>
            </tr>
          </thead>
          <tbody>
            {vouchers.map((v) => (
              <tr key={v.vch_no}>
                <td style={{ fontWeight: 700, color: "var(--accent-color)" }}>{v.vch_no}</td>
                <td>{v.date}</td>
                <td style={{ fontWeight: 600 }}>{v.dest_head}</td>
                <td style={{ fontWeight: 600, color: "var(--text-secondary)" }}>{v.source_head}</td>
                <td>{v.remarks}</td>
                <td style={{ fontWeight: 700 }}>₹{v.amount.toLocaleString()}</td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>

      {modalOpen && (
        <div className={styles.modalOverlay}>
          <div className={styles.modalContent} style={{ maxWidth: "450px" }}>
            <div className={styles.modalHeader}>
              <h3 style={{ fontSize: "18px", fontWeight: 600 }}>Create Contra Voucher (CNV)</h3>
              <button className={styles.closeBtn} onClick={() => setModalOpen(false)}>×</button>
            </div>
            <form onSubmit={handleAddContra}>
              <div className={styles.modalBody}>
                <div className={styles.formGroup}>
                  <label>Transfer From (Source Account) *</label>
                  <select
                    className={styles.formControl}
                    value={formData.source_head}
                    onChange={(e) => setFormData(prev => ({ ...prev, source_head: e.target.value as any }))}
                  >
                    <option value="Cash Office">Cash Office (In Hand)</option>
                    <option value="HDFC Bank">HDFC Bank (A/C: ...8910)</option>
                    <option value="State Bank of India">State Bank of India (A/C: ...4492)</option>
                  </select>
                </div>

                <div className={styles.formGroup}>
                  <label>Transfer To (Destination Account) *</label>
                  <select
                    className={styles.formControl}
                    value={formData.dest_head}
                    onChange={(e) => setFormData(prev => ({ ...prev, dest_head: e.target.value as any }))}
                  >
                    <option value="HDFC Bank">HDFC Bank (A/C: ...8910)</option>
                    <option value="State Bank of India">State Bank of India (A/C: ...4492)</option>
                    <option value="Cash Office">Cash Office (In Hand)</option>
                  </select>
                </div>

                <div className={styles.formGroup}>
                  <label>Transfer Amount (₹) *</label>
                  <input
                    type="number"
                    className={styles.formControl}
                    value={formData.amount}
                    onChange={(e) => setFormData(prev => ({ ...prev, amount: e.target.value }))}
                    required
                  />
                </div>

                <div className={styles.formGroup}>
                  <label>Narration / remarks *</label>
                  <textarea
                    rows={2}
                    className={styles.formControl}
                    value={formData.remarks}
                    onChange={(e) => setFormData(prev => ({ ...prev, remarks: e.target.value }))}
                    required
                  />
                </div>
              </div>
              <div className={styles.modalFooter}>
                <button type="button" className={styles.secondaryBtn} onClick={() => setModalOpen(false)}>Cancel</button>
                <button type="submit" className={styles.primaryBtn}>Save Contra</button>
              </div>
            </form>
          </div>
        </div>
      )}
    </div>
  );
}
