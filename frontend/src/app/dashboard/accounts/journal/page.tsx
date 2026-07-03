"use client";

import React, { useState, useEffect } from "react";
import styles from "../../../dashboard.module.css";
import { Plus, AlertCircle } from "lucide-react";

interface AccountLedger { ah_code: number; ah_name: string; }
interface VoucherType { vtm_code: number; vtm_name: string | null; }
interface Journal {
  jrn_code: number;
  jrn_vtm_code: number | null;
  jrn_date: string | null;
  jrn_ah_code: number;
  jrn_amt: number;
  jrn_narr: string | null;
  jrn_l_ah_code: number;
  voucher_type_name: string | null;
  debit_head_name: string | null;
  credit_head_name: string | null;
}

const API = process.env.NEXT_PUBLIC_API_URL || "http://localhost:8000";
const getToken = () => typeof window !== "undefined" ? localStorage.getItem("token") : "";
const authHdr = () => ({ "Content-Type": "application/json", Authorization: `Bearer ${getToken()}` });

const emptyForm = { jrn_vtm_code: "", jrn_ah_code: "", jrn_l_ah_code: "", jrn_amt: "", jrn_narr: "", jrn_date: new Date().toISOString().split("T")[0] };

export default function JournalVoucherPage() {
  const [vouchers, setVouchers] = useState<Journal[]>([]);
  const [ledgers, setLedgers] = useState<AccountLedger[]>([]);
  const [voucherTypes, setVoucherTypes] = useState<VoucherType[]>([]);
  const [editing, setEditing] = useState<Journal | null>(null);
  const [modalOpen, setModalOpen] = useState(false);
  const [formData, setFormData] = useState(emptyForm);
  const [error, setError] = useState("");
  const [loading, setLoading] = useState(false);

  const load = async () => {
    try {
      const [jr, lg, vt] = await Promise.all([
        fetch(`${API}/api/accounts/journals`).then(r => r.json()),
        fetch(`${API}/api/accounts/account-ledgers`).then(r => r.json()),
        fetch(`${API}/api/accounts/voucher-types`).then(r => r.json()),
      ]);
      setVouchers(jr);
      setLedgers(lg);
      setVoucherTypes(vt);
    } catch (e) {
      console.error("Error loading journal data:", e);
    }
  };

  useEffect(() => {
    load();
  }, []);

  const openNew = () => {
    setEditing(null);
    setFormData(emptyForm);
    setError("");
    setModalOpen(true);
  };

  const openEdit = (v: Journal) => {
    setEditing(v);
    setFormData({
      jrn_vtm_code: v.jrn_vtm_code?.toString() ?? "",
      jrn_ah_code: v.jrn_ah_code.toString(),
      jrn_l_ah_code: v.jrn_l_ah_code.toString(),
      jrn_amt: v.jrn_amt.toString(),
      jrn_narr: v.jrn_narr ?? "",
      jrn_date: v.jrn_date ? v.jrn_date.split("T")[0] : new Date().toISOString().split("T")[0],
    });
    setError("");
    setModalOpen(true);
  };

  const handleSave = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!formData.jrn_ah_code || !formData.jrn_l_ah_code) {
      setError("Debit and credit account heads are required");
      return;
    }
    if (formData.jrn_ah_code === formData.jrn_l_ah_code) {
      setError("Debit and credit account heads must differ");
      return;
    }
    if (!formData.jrn_amt || Number(formData.jrn_amt) <= 0) {
      setError("Enter a valid amount");
      return;
    }
    setLoading(true);
    setError("");
    try {
      const body = {
        jrn_vtm_code: formData.jrn_vtm_code ? parseInt(formData.jrn_vtm_code) : null,
        jrn_ah_code: parseInt(formData.jrn_ah_code),
        jrn_l_ah_code: parseInt(formData.jrn_l_ah_code),
        jrn_amt: Number(formData.jrn_amt),
        jrn_narr: formData.jrn_narr,
        jrn_date: formData.jrn_date,
        jrn_rec_state: 1,
      };
      const url = editing ? `${API}/api/accounts/journals/${editing.jrn_code}` : `${API}/api/accounts/journals`;
      const r = await fetch(url, {
        method: editing ? "PUT" : "POST",
        headers: authHdr(),
        body: JSON.stringify(body),
      });
      if (!r.ok) throw new Error(await r.text());
      load();
      setModalOpen(false);
    } catch (e: any) {
      setError(e.message);
    }
    setLoading(false);
  };

  const del = async (code: number) => {
    if (!confirm("Delete this journal voucher?")) return;
    try {
      const r = await fetch(`${API}/api/accounts/journals/${code}`, { method: "DELETE", headers: authHdr() });
      if (!r.ok) throw new Error("Failed to delete");
      load();
    } catch (e: any) {
      alert(e.message);
    }
  };

  return (
    <div>
      <div className={styles.toolbar} style={{ justifyContent: "space-between" }}>
        <h3 style={{ fontSize: "16px", fontWeight: 600 }}>General Journal Voucher Register (JV)</h3>
        <button className={styles.primaryBtn} onClick={openNew}>
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
              <th style={{ textAlign: "right" }}>Actions</th>
            </tr>
          </thead>
          <tbody>
            {vouchers.length === 0 && (
              <tr>
                <td colSpan={7} style={{ textAlign: "center", padding: "40px", color: "var(--text-secondary)" }}>No journal vouchers found</td>
              </tr>
            )}
            {vouchers.map((v) => (
              <tr key={v.jrn_code}>
                <td style={{ fontWeight: 700, color: "var(--accent-color)" }}>JV-{v.jrn_code}</td>
                <td>{v.jrn_date ? v.jrn_date.split("T")[0] : "—"}</td>
                <td style={{ fontWeight: 600 }}>{v.debit_head_name ?? "—"}</td>
                <td style={{ fontWeight: 600, color: "var(--text-secondary)" }}>{v.credit_head_name ?? "—"}</td>
                <td>{v.jrn_narr}</td>
                <td style={{ fontWeight: 700 }}>₹{v.jrn_amt.toLocaleString()}</td>
                <td style={{ textAlign: "right" }}>
                  <button onClick={() => openEdit(v)} className={styles.secondaryBtn} style={{ display: "inline-flex", padding: "6px 12px", marginRight: "8px" }}>Edit</button>
                  <button onClick={() => del(v.jrn_code)} className={styles.secondaryBtn} style={{ display: "inline-flex", padding: "6px 12px", color: "var(--status-danger)" }}>Delete</button>
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
              <h3 style={{ fontSize: "18px", fontWeight: 600 }}>{editing ? "Edit" : "Create"} Journal Voucher (JV)</h3>
              <button className={styles.closeBtn} onClick={() => setModalOpen(false)}>×</button>
            </div>
            <form onSubmit={handleSave}>
              <div className={styles.modalBody}>
                {error && (
                  <div style={{ color: "var(--status-danger)", display: "flex", alignItems: "center", gap: "8px", fontSize: "13px", marginBottom: "16px" }}>
                    <AlertCircle size={16} /> {error}
                  </div>
                )}

                <div className={styles.formGroup}>
                  <label>Voucher Type</label>
                  <select
                    className={styles.formControl}
                    value={formData.jrn_vtm_code}
                    onChange={(e) => setFormData(prev => ({ ...prev, jrn_vtm_code: e.target.value }))}
                  >
                    <option value="">— Select Voucher Type —</option>
                    {voucherTypes.map(vt => <option key={vt.vtm_code} value={vt.vtm_code}>{vt.vtm_name}</option>)}
                  </select>
                </div>

                <div className={styles.formGroup}>
                  <label>Voucher Date</label>
                  <input
                    type="date"
                    className={styles.formControl}
                    value={formData.jrn_date}
                    onChange={(e) => setFormData(prev => ({ ...prev, jrn_date: e.target.value }))}
                  />
                </div>

                <div className={styles.formGroup}>
                  <label>Debit Account Head (Dr.) *</label>
                  <select
                    className={styles.formControl}
                    value={formData.jrn_ah_code}
                    onChange={(e) => setFormData(prev => ({ ...prev, jrn_ah_code: e.target.value }))}
                    required
                  >
                    <option value="">— Select Debit Head —</option>
                    {ledgers.map(l => <option key={l.ah_code} value={l.ah_code}>{l.ah_name}</option>)}
                  </select>
                </div>

                <div className={styles.formGroup}>
                  <label>Credit Account Head (Cr.) *</label>
                  <select
                    className={styles.formControl}
                    value={formData.jrn_l_ah_code}
                    onChange={(e) => setFormData(prev => ({ ...prev, jrn_l_ah_code: e.target.value }))}
                    required
                  >
                    <option value="">— Select Credit Head —</option>
                    {ledgers.map(l => <option key={l.ah_code} value={l.ah_code}>{l.ah_name}</option>)}
                  </select>
                </div>

                <div className={styles.formGroup}>
                  <label>Voucher Amount (₹) *</label>
                  <input
                    type="number"
                    className={styles.formControl}
                    value={formData.jrn_amt}
                    onChange={(e) => setFormData(prev => ({ ...prev, jrn_amt: e.target.value }))}
                    required
                  />
                </div>

                <div className={styles.formGroup}>
                  <label>Narration / Adjustment Reason</label>
                  <textarea
                    rows={2}
                    className={styles.formControl}
                    value={formData.jrn_narr}
                    onChange={(e) => setFormData(prev => ({ ...prev, jrn_narr: e.target.value }))}
                  />
                </div>
              </div>
              <div className={styles.modalFooter}>
                <button type="button" className={styles.secondaryBtn} onClick={() => setModalOpen(false)}>Cancel</button>
                <button type="submit" className={styles.primaryBtn} disabled={loading}>{loading ? "Saving…" : "Save Journal"}</button>
              </div>
            </form>
          </div>
        </div>
      )}
    </div>
  );
}
