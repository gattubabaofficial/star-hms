"use client";

import React, { useState } from "react";
import styles from "../../../dashboard.module.css";
import { Plus, Search, AlertCircle, Check } from "lucide-react";

interface BankReceiptVoucher {
  vch_no: string;
  date: string;
  account_head: string;
  bank_name: string;
  amount: number;
  ref_no: string;
  received_from: string;
  remarks: string;
}

export default function BankReceiptBookPage() {
  const [vouchers, setVouchers] = useState<BankReceiptVoucher[]>([
    { vch_no: "BRV-001", date: "2026-06-11", account_head: "Inpatient Revenue", bank_name: "State Bank of India", amount: 45000, ref_no: "SBI_TXN_7829107", received_from: "Anil Sethi (Patient)", remarks: "IPD settlement via Netbanking" },
    { vch_no: "BRV-002", date: "2026-06-11", account_head: "Lab Diagnostic Revenue", bank_name: "HDFC Bank", amount: 15500, ref_no: "HDFC_UPI_9901872", received_from: "Lab Collection Desk", remarks: "UPI diagnostic Collections closure" }
  ]);

  const [modalOpen, setModalOpen] = useState(false);
  const [formData, setFormData] = useState({
    account_head: "Inpatient Revenue",
    bank_name: "State Bank of India",
    amount: "10000",
    ref_no: "",
    received_from: "",
    remarks: ""
  });

  const handleAddReceipt = (e: React.FormEvent) => {
    e.preventDefault();
    if (!formData.received_from.trim()) return;

    const newVch: BankReceiptVoucher = {
      vch_no: `BRV-00${vouchers.length + 1}`,
      date: new Date().toISOString().split("T")[0],
      account_head: formData.account_head,
      bank_name: formData.bank_name,
      amount: Number(formData.amount),
      ref_no: formData.ref_no || "N/A",
      received_from: formData.received_from,
      remarks: formData.remarks || "Bank deposit logged"
    };

    setVouchers(prev => [newVch, ...prev]);
    setFormData({ account_head: "Inpatient Revenue", bank_name: "State Bank of India", amount: "10000", ref_no: "", received_from: "", remarks: "" });
    setModalOpen(false);
  };

  return (
    <div>
      <div className={styles.toolbar} style={{ justifyContent: "space-between" }}>
        <h3 style={{ fontSize: "16px", fontWeight: 600 }}>Bank Receipts Register (BRV)</h3>
        <button className={styles.primaryBtn} onClick={() => setModalOpen(true)}>
          <Plus size={18} />
          <span>New Bank Receipt</span>
        </button>
      </div>

      <div className={styles.tableContainer}>
        <table className={styles.table}>
          <thead>
            <tr>
              <th>Voucher No</th>
              <th>Voucher Date</th>
              <th>Credit Account Head</th>
              <th>Target Bank Account</th>
              <th>Payment Ref No</th>
              <th>Received From</th>
              <th>Receipt Amount</th>
            </tr>
          </thead>
          <tbody>
            {vouchers.map((v) => (
              <tr key={v.vch_no}>
                <td style={{ fontWeight: 700, color: "var(--status-success)" }}>{v.vch_no}</td>
                <td>{v.date}</td>
                <td style={{ fontWeight: 600 }}>{v.account_head}</td>
                <td>{v.bank_name}</td>
                <td style={{ fontFamily: "monospace", fontSize: "12px" }}>{v.ref_no}</td>
                <td>{v.received_from}</td>
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
              <h3 style={{ fontSize: "18px", fontWeight: 600 }}>Create Bank Receipt Voucher</h3>
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
                    <option value="Inpatient Revenue">Inpatient Revenue</option>
                    <option value="Lab Diagnostic Revenue">Lab Diagnostic Revenue</option>
                    <option value="Pharmacy UPI Sales">Pharmacy UPI Sales</option>
                  </select>
                </div>

                <div className={styles.formGroup}>
                  <label>Target Bank Account *</label>
                  <select
                    className={styles.formControl}
                    value={formData.bank_name}
                    onChange={(e) => setFormData(prev => ({ ...prev, bank_name: e.target.value }))}
                  >
                    <option value="State Bank of India">State Bank of India (A/C: ...4492)</option>
                    <option value="HDFC Bank">HDFC Bank (A/C: ...8910)</option>
                    <option value="ICICI Bank">ICICI Bank (A/C: ...6291)</option>
                  </select>
                </div>

                <div className={styles.formGroup}>
                  <label>Received From *</label>
                  <input
                    type="text"
                    className={styles.formControl}
                    value={formData.received_from}
                    onChange={(e) => setFormData(prev => ({ ...prev, received_from: e.target.value }))}
                    placeholder="e.g. Anil Sethi"
                    required
                  />
                </div>

                <div className={styles.formGrid}>
                  <div className={styles.formGroup}>
                    <label>Payment Reference No</label>
                    <input
                      type="text"
                      className={styles.formControl}
                      value={formData.ref_no}
                      onChange={(e) => setFormData(prev => ({ ...prev, ref_no: e.target.value }))}
                      placeholder="e.g. UTR / Cheque No"
                    />
                  </div>
                  <div className={styles.formGroup}>
                    <label>Receipt Amount (₹) *</label>
                    <input
                      type="number"
                      className={styles.formControl}
                      value={formData.amount}
                      onChange={(e) => setFormData(prev => ({ ...prev, amount: e.target.value }))}
                      required
                    />
                  </div>
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
