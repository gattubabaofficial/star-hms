"use client";

import React, { useState } from "react";
import styles from "../../../dashboard.module.css";
import { Plus, Search, AlertCircle, Check } from "lucide-react";

interface CashPaymentVoucher {
  vch_no: string;
  date: string;
  account_head: string;
  amount: number;
  paid_to: string;
  remarks: string;
}

export default function CashPaymentBookPage() {
  const [vouchers, setVouchers] = useState<CashPaymentVoucher[]>([
    { vch_no: "CPV-001", date: "2026-06-11", account_head: "Printing & Stationery", amount: 1500, paid_to: "Surya Printing Press", remarks: "Hospital OPD case card forms printing" },
    { vch_no: "CPV-002", date: "2026-06-11", account_head: "Office Expenses / Petty Cash", amount: 450, paid_to: "Desi Tea Stall", remarks: "Staff refreshments" }
  ]);

  const [modalOpen, setModalOpen] = useState(false);
  const [formData, setFormData] = useState({
    account_head: "Printing & Stationery",
    amount: "500",
    paid_to: "",
    remarks: ""
  });

  const handleAddPayment = (e: React.FormEvent) => {
    e.preventDefault();
    if (!formData.paid_to.trim()) return;

    const newVch: CashPaymentVoucher = {
      vch_no: `CPV-00${vouchers.length + 1}`,
      date: new Date().toISOString().split("T")[0],
      account_head: formData.account_head,
      amount: Number(formData.amount),
      paid_to: formData.paid_to,
      remarks: formData.remarks || "Payment logged"
    };

    setVouchers(prev => [newVch, ...prev]);
    setFormData({ account_head: "Printing & Stationery", amount: "500", paid_to: "", remarks: "" });
    setModalOpen(false);
  };

  return (
    <div>
      <div className={styles.toolbar} style={{ justifyContent: "space-between" }}>
        <h3 style={{ fontSize: "16px", fontWeight: 600 }}>Cash Payments Register (CPV)</h3>
        <button className={styles.primaryBtn} style={{ backgroundColor: "var(--status-danger)" }} onClick={() => setModalOpen(true)}>
          <Plus size={18} />
          <span>New Cash Payment</span>
        </button>
      </div>

      <div className={styles.tableContainer}>
        <table className={styles.table}>
          <thead>
            <tr>
              <th>Voucher No</th>
              <th>Voucher Date</th>
              <th>Debit Account Head</th>
              <th>Paid To</th>
              <th>Narration / Remarks</th>
              <th>Payment Amount</th>
            </tr>
          </thead>
          <tbody>
            {vouchers.map((v) => (
              <tr key={v.vch_no}>
                <td style={{ fontWeight: 700, color: "var(--status-danger)" }}>{v.vch_no}</td>
                <td>{v.date}</td>
                <td style={{ fontWeight: 600 }}>{v.account_head}</td>
                <td>{v.paid_to}</td>
                <td>{v.remarks}</td>
                <td style={{ fontWeight: 700, color: "var(--status-danger)" }}>₹{v.amount.toLocaleString()}</td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>

      {modalOpen && (
        <div className={styles.modalOverlay}>
          <div className={styles.modalContent} style={{ maxWidth: "450px" }}>
            <div className={styles.modalHeader}>
              <h3 style={{ fontSize: "18px", fontWeight: 600 }}>Create Cash Payment Voucher</h3>
              <button className={styles.closeBtn} onClick={() => setModalOpen(false)}>×</button>
            </div>
            <form onSubmit={handleAddPayment}>
              <div className={styles.modalBody}>
                <div className={styles.formGroup}>
                  <label>Debit Account Head *</label>
                  <select
                    className={styles.formControl}
                    value={formData.account_head}
                    onChange={(e) => setFormData(prev => ({ ...prev, account_head: e.target.value }))}
                  >
                    <option value="Printing & Stationery">Printing & Stationery</option>
                    <option value="Office Expenses / Petty Cash">Office Expenses / Petty Cash</option>
                    <option value="Water & Electricity">Water & Electricity Charges</option>
                    <option value="Staff Salaries Expense">Staff Salaries Expense</option>
                  </select>
                </div>

                <div className={styles.formGroup}>
                  <label>Paid To (Vendor/Employee/Head) *</label>
                  <input
                    type="text"
                    className={styles.formControl}
                    value={formData.paid_to}
                    onChange={(e) => setFormData(prev => ({ ...prev, paid_to: e.target.value }))}
                    placeholder="e.g. Shyam Stationery Shop"
                    required
                  />
                </div>

                <div className={styles.formGroup}>
                  <label>Payment Amount (₹) *</label>
                  <input
                    type="number"
                    className={styles.formControl}
                    value={formData.amount}
                    onChange={(e) => setFormData(prev => ({ ...prev, amount: e.target.value }))}
                    required
                  />
                </div>

                <div className={styles.formGroup}>
                  <label>Narration / Remarks</label>
                  <textarea
                    rows={2}
                    className={styles.formControl}
                    value={formData.remarks}
                    onChange={(e) => setFormData(prev => ({ ...prev, remarks: e.target.value }))}
                  />
                </div>
              </div>
              <div className={styles.modalFooter}>
                <button type="button" className={styles.secondaryBtn} onClick={() => setModalOpen(false)}>Cancel</button>
                <button type="submit" className={styles.primaryBtn} style={{ backgroundColor: "var(--status-danger)" }}>Save Voucher</button>
              </div>
            </form>
          </div>
        </div>
      )}
    </div>
  );
}
