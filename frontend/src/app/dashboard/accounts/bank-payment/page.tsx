"use client";

import React, { useState } from "react";
import styles from "../../../dashboard.module.css";
import { Plus, Search, AlertCircle, Check } from "lucide-react";

interface BankPaymentVoucher {
  vch_no: string;
  date: string;
  account_head: string;
  bank_name: string;
  amount: number;
  ref_no: string;
  paid_to: string;
  remarks: string;
}

export default function BankPaymentBookPage() {
  const [vouchers, setVouchers] = useState<BankPaymentVoucher[]>([
    { vch_no: "BPV-001", date: "2026-06-11", account_head: "Medical Consumables Purchase", bank_name: "HDFC Bank", amount: 125000, ref_no: "HDFC_NEFT_990126", paid_to: "Surya Medicals Wholesale Ltd", remarks: "Syringes, bandages bulk procurement" },
    { vch_no: "BPV-002", date: "2026-06-11", account_head: "Diagnostic Lab Equip Repair", bank_name: "State Bank of India", amount: 18000, ref_no: "CHQ_009982", paid_to: "Siemens Healthcare Servs", remarks: "Analyzer calibration charges" }
  ]);

  const [modalOpen, setModalOpen] = useState(false);
  const [formData, setFormData] = useState({
    account_head: "Medical Consumables Purchase",
    bank_name: "HDFC Bank",
    amount: "25000",
    ref_no: "",
    paid_to: "",
    remarks: ""
  });

  const handleAddPayment = (e: React.FormEvent) => {
    e.preventDefault();
    if (!formData.paid_to.trim()) return;

    const newVch: BankPaymentVoucher = {
      vch_no: `BPV-00${vouchers.length + 1}`,
      date: new Date().toISOString().split("T")[0],
      account_head: formData.account_head,
      bank_name: formData.bank_name,
      amount: Number(formData.amount),
      ref_no: formData.ref_no || "Cheque/NEFT",
      paid_to: formData.paid_to,
      remarks: formData.remarks || "Bank payment logged"
    };

    setVouchers(prev => [newVch, ...prev]);
    setFormData({ account_head: "Medical Consumables Purchase", bank_name: "HDFC Bank", amount: "25000", ref_no: "", paid_to: "", remarks: "" });
    setModalOpen(false);
  };

  return (
    <div>
      <div className={styles.toolbar} style={{ justifyContent: "space-between" }}>
        <h3 style={{ fontSize: "16px", fontWeight: 600 }}>Bank Payments Register (BPV)</h3>
        <button className={styles.primaryBtn} style={{ backgroundColor: "var(--status-danger)" }} onClick={() => setModalOpen(true)}>
          <Plus size={18} />
          <span>New Bank Payment</span>
        </button>
      </div>

      <div className={styles.tableContainer}>
        <table className={styles.table}>
          <thead>
            <tr>
              <th>Voucher No</th>
              <th>Voucher Date</th>
              <th>Debit Account Head</th>
              <th>Source Bank Account</th>
              <th>Cheque/Reference No</th>
              <th>Paid To</th>
              <th>Payment Amount</th>
            </tr>
          </thead>
          <tbody>
            {vouchers.map((v) => (
              <tr key={v.vch_no}>
                <td style={{ fontWeight: 700, color: "var(--status-danger)" }}>{v.vch_no}</td>
                <td>{v.date}</td>
                <td style={{ fontWeight: 600 }}>{v.account_head}</td>
                <td>{v.bank_name}</td>
                <td style={{ fontFamily: "monospace", fontSize: "12px" }}>{v.ref_no}</td>
                <td>{v.paid_to}</td>
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
              <h3 style={{ fontSize: "18px", fontWeight: 600 }}>Create Bank Payment Voucher</h3>
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
                    <option value="Medical Consumables Purchase">Medical Consumables Purchase</option>
                    <option value="Diagnostic Lab Equip Repair">Diagnostic Lab Equip Repair</option>
                    <option value="Hospital Building Rent">Hospital Building Rent</option>
                    <option value="Professional Consultant Fees">Professional Consultant Fees</option>
                  </select>
                </div>

                <div className={styles.formGroup}>
                  <label>Source Bank Account *</label>
                  <select
                    className={styles.formControl}
                    value={formData.bank_name}
                    onChange={(e) => setFormData(prev => ({ ...prev, bank_name: e.target.value }))}
                  >
                    <option value="HDFC Bank">HDFC Bank (A/C: ...8910)</option>
                    <option value="State Bank of India">State Bank of India (A/C: ...4492)</option>
                    <option value="ICICI Bank">ICICI Bank (A/C: ...6291)</option>
                  </select>
                </div>

                <div className={styles.formGroup}>
                  <label>Paid To (Vendor/Entity) *</label>
                  <input
                    type="text"
                    className={styles.formControl}
                    value={formData.paid_to}
                    onChange={(e) => setFormData(prev => ({ ...prev, paid_to: e.target.value }))}
                    placeholder="e.g. Siemens Healthcare"
                    required
                  />
                </div>

                <div className={styles.formGrid}>
                  <div className={styles.formGroup}>
                    <label>Cheque / Transfer Ref *</label>
                    <input
                      type="text"
                      className={styles.formControl}
                      value={formData.ref_no}
                      onChange={(e) => setFormData(prev => ({ ...prev, ref_no: e.target.value }))}
                      placeholder="e.g. NEFT Reference, Cheque No"
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
