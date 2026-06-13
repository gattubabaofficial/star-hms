"use client";

import React, { useState } from "react";
import styles from "../../../dashboard.module.css";
import { Plus, Search, AlertCircle, Check } from "lucide-react";

interface CashReceiptVoucher {
  vch_no: string;
  date: string;
  account_head: string;
  amount: number;
  received_from: string;
  remarks: string;
}

export default function CashReceiptBookPage() {
  const [vouchers, setVouchers] = useState<CashReceiptVoucher[]>([
    { vch_no: "CRV-001", date: "2026-06-11", account_head: "Consultation Revenue", amount: 12000, received_from: "OPD Collections Desk", remarks: "Daily OPD Cash Receipt transfer" },
    { vch_no: "CRV-002", date: "2026-06-11", account_head: "Pharmacy Cash Sales", amount: 4850, received_from: "Pharmacy Counter", remarks: "POS Daily Cash closure" }
  ]);

  const [modalOpen, setModalOpen] = useState(false);
  const [formData, setFormData] = useState({
    account_head: "Consultation Revenue",
    amount: "1000",
    received_from: "",
    remarks: ""
  });

  const handleAddReceipt = (e: React.FormEvent) => {
    e.preventDefault();
    if (!formData.received_from.trim()) return;

    const newVch: CashReceiptVoucher = {
      vch_no: `CRV-00${vouchers.length + 1}`,
      date: new Date().toISOString().split("T")[0],
      account_head: formData.account_head,
      amount: Number(formData.amount),
      received_from: formData.received_from,
      remarks: formData.remarks || "Cash deposit logged"
    };

    setVouchers(prev => [newVch, ...prev]);
    setFormData({ account_head: "Consultation Revenue", amount: "1000", received_from: "", remarks: "" });
    setModalOpen(false);
  };

  return (
    <div>
      <div className={styles.toolbar} style={{ justifyContent: "space-between" }}>
        <h3 style={{ fontSize: "16px", fontWeight: 600 }}>Cash Receipts Register (CRV)</h3>
        <button className={styles.primaryBtn} onClick={() => setModalOpen(true)}>
          <Plus size={18} />
          <span>New Cash Receipt</span>
        </button>
      </div>

      <div className={styles.tableContainer}>
        <table className={styles.table}>
          <thead>
            <tr>
              <th>Voucher No</th>
              <th>Voucher Date</th>
              <th>Credit Account Head</th>
              <th>Received From</th>
              <th>Narration / Remarks</th>
              <th>Receipt Amount</th>
            </tr>
          </thead>
          <tbody>
            {vouchers.map((v) => (
              <tr key={v.vch_no}>
                <td style={{ fontWeight: 700, color: "var(--status-success)" }}>{v.vch_no}</td>
                <td>{v.date}</td>
                <td style={{ fontWeight: 600 }}>{v.account_head}</td>
                <td>{v.received_from}</td>
                <td>{v.remarks}</td>
                <td style={{ fontWeight: 700, color: "var(--status-success)" }}>₹{v.amount.toLocaleString()}</td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>

      {modalOpen && (
        <div className={styles.modalOverlay}>
          <div className={styles.modalContent} style={{ maxWidth: "450px" }}>
            <div className={styles.modalHeader}>
              <h3 style={{ fontSize: "18px", fontWeight: 600 }}>Create Cash Receipt Voucher</h3>
              <button className={styles.closeBtn} onClick={() => setModalOpen(false)}>×</button>
            </div>
            <form onSubmit={handleAddReceipt}>
              <div className={styles.modalBody}>
                <div className={styles.formGroup}>
                  <label>Credit Account Head *</label>
                  <select
                    className={styles.formControl}
                    value={formData.account_head}
                    onChange={(e) => setFormData(prev => ({ ...prev, account_head: e.target.value }))}
                  >
                    <option value="Consultation Revenue">Consultation Revenue</option>
                    <option value="Pharmacy Cash Sales">Pharmacy Cash Sales</option>
                    <option value="Lab Diagnostic Revenue">Lab Diagnostic Revenue</option>
                    <option value="Other Medical Services">Other Medical Services</option>
                  </select>
                </div>

                <div className={styles.formGroup}>
                  <label>Received From (Customer/Patient/Desk) *</label>
                  <input
                    type="text"
                    className={styles.formControl}
                    value={formData.received_from}
                    onChange={(e) => setFormData(prev => ({ ...prev, received_from: e.target.value }))}
                    placeholder="e.g. Pharmacy Counter Cashier"
                    required
                  />
                </div>

                <div className={styles.formGroup}>
                  <label>Voucher Cash Amount (₹) *</label>
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
                <button type="submit" className={styles.primaryBtn}>Save Receipt</button>
              </div>
            </form>
          </div>
        </div>
      )}
    </div>
  );
}
