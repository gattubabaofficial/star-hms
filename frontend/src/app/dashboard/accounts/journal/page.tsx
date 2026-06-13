"use client";

import React, { useState } from "react";
import styles from "../../../dashboard.module.css";
import { Plus, Search, AlertCircle, Check } from "lucide-react";

interface JournalVoucher {
  vch_no: string;
  date: string;
  debit_head: string;
  credit_head: string;
  amount: number;
  narration: string;
}

export default function JournalVoucherPage() {
  const [vouchers, setVouchers] = useState<JournalVoucher[]>([
    { vch_no: "JV-001", date: "2026-06-11", debit_head: "Depreciation on Lab Equipment", credit_head: "Lab Equipment Asset", amount: 8500, narration: "Monthly depreciation adjustment" },
    { vch_no: "JV-002", date: "2026-06-11", debit_head: "Salaries Payable", credit_head: "Accrued Salaries Head", amount: 145000, narration: "Provision for staff salaries" }
  ]);

  const [modalOpen, setModalOpen] = useState(false);
  const [formData, setFormData] = useState({
    debit_head: "Depreciation on Lab Equipment",
    credit_head: "Lab Equipment Asset",
    amount: "5000",
    narration: ""
  });

  const handleAddJV = (e: React.FormEvent) => {
    e.preventDefault();
    if (formData.debit_head === formData.credit_head) return;

    const newVch: JournalVoucher = {
      vch_no: `JV-00${vouchers.length + 1}`,
      date: new Date().toISOString().split("T")[0],
      debit_head: formData.debit_head,
      credit_head: formData.credit_head,
      amount: Number(formData.amount),
      narration: formData.narration || "Adjustment journal entry logged"
    };

    setVouchers(prev => [newVch, ...prev]);
    setFormData({ debit_head: "Depreciation on Lab Equipment", credit_head: "Lab Equipment Asset", amount: "5000", narration: "" });
    setModalOpen(false);
  };

  return (
    <div>
      <div className={styles.toolbar} style={{ justifyContent: "space-between" }}>
        <h3 style={{ fontSize: "16px", fontWeight: 600 }}>General Journal Voucher Register (JV)</h3>
        <button className={styles.primaryBtn} onClick={() => setModalOpen(true)}>
          <Plus size={18} />
          <span>New Journal Voucher</span>
        </button>
      </div>

      <div className={styles.tableContainer}>
        <table className={styles.table}>
          <thead>
            <tr>
              <th>Voucher No</th>
              <th>Voucher Date</th>
              <th>Debit Account (Dr.)</th>
              <th>Credit Account (Cr.)</th>
              <th>Voucher Narration</th>
              <th>Total Amount</th>
            </tr>
          </thead>
          <tbody>
            {vouchers.map((v) => (
              <tr key={v.vch_no}>
                <td style={{ fontWeight: 700, color: "var(--accent-color)" }}>{v.vch_no}</td>
                <td>{v.date}</td>
                <td style={{ fontWeight: 600 }}>{v.debit_head}</td>
                <td style={{ fontWeight: 600, color: "var(--text-secondary)" }}>{v.credit_head}</td>
                <td>{v.narration}</td>
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
              <h3 style={{ fontSize: "18px", fontWeight: 600 }}>Create Journal Voucher (JV)</h3>
              <button className={styles.closeBtn} onClick={() => setModalOpen(false)}>×</button>
            </div>
            <form onSubmit={handleAddJV}>
              <div className={styles.modalBody}>
                <div className={styles.formGroup}>
                  <label>Debit Account Head (Dr.) *</label>
                  <select
                    className={styles.formControl}
                    value={formData.debit_head}
                    onChange={(e) => setFormData(prev => ({ ...prev, debit_head: e.target.value }))}
                  >
                    <option value="Depreciation on Lab Equipment">Depreciation on Lab Equipment</option>
                    <option value="Salaries Payable">Salaries Payable</option>
                    <option value="Office Equipment Expense">Office Equipment Expense</option>
                  </select>
                </div>

                <div className={styles.formGroup}>
                  <label>Credit Account Head (Cr.) *</label>
                  <select
                    className={styles.formControl}
                    value={formData.credit_head}
                    onChange={(e) => setFormData(prev => ({ ...prev, credit_head: e.target.value }))}
                  >
                    <option value="Lab Equipment Asset">Lab Equipment Asset</option>
                    <option value="Accrued Salaries Head">Accrued Salaries Head</option>
                    <option value="Cash Clearing A/C">Cash Clearing A/C</option>
                  </select>
                </div>

                <div className={styles.formGroup}>
                  <label>Voucher Amount (₹) *</label>
                  <input
                    type="number"
                    className={styles.formControl}
                    value={formData.amount}
                    onChange={(e) => setFormData(prev => ({ ...prev, amount: e.target.value }))}
                    required
                  />
                </div>

                <div className={styles.formGroup}>
                  <label>Narration / Adjustment Reason *</label>
                  <textarea
                    rows={2}
                    className={styles.formControl}
                    value={formData.narration}
                    onChange={(e) => setFormData(prev => ({ ...prev, narration: e.target.value }))}
                    required
                  />
                </div>
              </div>
              <div className={styles.modalFooter}>
                <button type="button" className={styles.secondaryBtn} onClick={() => setModalOpen(false)}>Cancel</button>
                <button type="submit" className={styles.primaryBtn}>Save Journal</button>
              </div>
            </form>
          </div>
        </div>
      )}
    </div>
  );
}
