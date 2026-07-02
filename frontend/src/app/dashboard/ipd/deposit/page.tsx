"use client";

import React, { useEffect, useState, useRef } from "react";
import styles from "../../../dashboard.module.css";
import {
  Search, Plus, PiggyBank, RefreshCw, X, Save,
  Calendar, Clock, AlertCircle, CheckCircle, User,
  FileText, CreditCard, ArrowLeft
} from "lucide-react";

const API = "http://127.0.0.1:8000/api/ipd";

interface ActiveAdmission {
  IhdCode:  number;
  IhdVchNo: number;
  PttCode:  number;
  PttName:  string;
  PttRegNo: number | null;
}

interface DepositRecord {
  IgtCode:    number;
  IgtIpgCode: number;
  VchNo:      number;
  Date:       string;
  Time:       number;
  PttName:    string;
  PttRegNo:   number | null;
  DpogAmt:    number;
  AdjAmt:     number;
  BalAmt:     number;
  Remark:     string;
}

export default function IPDDepositPage() {
  const [deposits, setDeposits] = useState<DepositRecord[]>([]);
  const [loading, setLoading] = useState(true);
  const [searchTerm, setSearchTerm] = useState("");
  const [toast, setToast] = useState<{ msg: string; ok: boolean } | null>(null);

  // Form Modal state
  const [showModal, setShowModal] = useState(false);
  const [activeAdmissions, setActiveAdmissions] = useState<ActiveAdmission[]>([]);
  const [showPatSearch, setShowPatSearch] = useState(false);
  const [patFilter, setPatFilter] = useState("");
  
  // Selected Patient
  const [selectedPat, setSelectedPat] = useState<ActiveAdmission | null>(null);
  
  // Inputs
  const today = new Date().toISOString().slice(0, 10);
  const [depDate, setDepDate] = useState(today);
  const [depTime, setDepTime] = useState("12:00");
  const [amount, setAmount] = useState("");
  const [payMode, setPayMode] = useState("Cash");
  const [remark, setRemark] = useState("");
  const [saving, setSaving] = useState(false);

  const patSearchRef = useRef<HTMLInputElement>(null);

  const loadDeposits = async () => {
    setLoading(true);
    try {
      const res = await fetch(`${API}/deposits`);
      if (res.ok) setDeposits(await res.json());
    } catch (e) {
      console.error(e);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    loadDeposits();
  }, []);

  useEffect(() => {
    if (!showPatSearch) return;
    fetch(`${API}/admissions/active`)
      .then(r => r.json())
      .catch(() => [])
      .then(data => setActiveAdmissions(data));
    setTimeout(() => patSearchRef.current?.focus(), 100);
  }, [showPatSearch]);

  const showToast = (msg: string, ok = true) => {
    setToast({ msg, ok });
    setTimeout(() => setToast(null), 4000);
  };

  const handleSave = async () => {
    if (!selectedPat) { showToast("Please select a patient first.", false); return; }
    const depAmt = parseFloat(amount);
    if (!depAmt || depAmt <= 0) { showToast("Enter a valid deposit amount.", false); return; }

    setSaving(true);
    try {
      const res = await fetch(`${API}/deposits`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          IgtIpgCode: selectedPat.IhdCode,
          IgtPttCode: selectedPat.PttCode,
          IgtDpogAmt: depAmt,
          IgtAdjAmt:  0.0,
          IgtRemark:  `Mode: ${payMode}. ${remark}`.trim(),
        }),
      });

      if (!res.ok) throw new Error("Saving deposit failed");
      showToast("Deposit collected successfully!");
      setShowModal(false);
      // Reset inputs
      setSelectedPat(null);
      setAmount("");
      setRemark("");
      loadDeposits();
    } catch {
      showToast("Transaction failed. Check database limits.", false);
    } finally {
      setSaving(false);
    }
  };

  const filteredDeposits = deposits.filter(d =>
    d.PttName.toLowerCase().includes(searchTerm.toLowerCase()) ||
    String(d.VchNo).includes(searchTerm)
  );

  const filteredAdmissions = activeAdmissions.filter(a =>
    a.PttName.toLowerCase().includes(patFilter.toLowerCase()) ||
    String(a.IhdVchNo).includes(patFilter)
  );

  return (
    <div style={{ display: "flex", flexDirection: "column", gap: 20 }}>
      {/* Toast Alert */}
      {toast && (
        <div style={{
          position: "fixed", top: 24, right: 24, zIndex: 9999,
          background: toast.ok ? "#10b981" : "#ef4444",
          color: "#fff", padding: "14px 22px", borderRadius: 12,
          boxShadow: "0 8px 24px rgba(0,0,0,.18)",
          display: "flex", alignItems: "center", gap: 10,
          fontWeight: 600, fontSize: 14,
        }}>
          {toast.ok ? <CheckCircle size={18} /> : <AlertCircle size={18} />}
          {toast.msg}
        </div>
      )}

      {/* Patient Search Lookup */}
      {showPatSearch && (
        <div className={styles.modalOverlay}>
          <div className={styles.modalContent} style={{ maxWidth: 480 }}>
            <div className={styles.modalHeader}>
              <h3 style={{ fontSize: 15, fontWeight: 700 }}>Select Active Patient Admission</h3>
              <button className={styles.closeBtn} onClick={() => setShowPatSearch(false)}>×</button>
            </div>
            <div className={styles.modalBody} style={{ padding: "14px 20px" }}>
              <div className={styles.searchBar} style={{ marginBottom: 12 }}>
                <Search size={16} />
                <input
                  ref={patSearchRef}
                  type="text"
                  placeholder="Filter name or IPD No..."
                  value={patFilter}
                  onChange={e => setPatFilter(e.target.value)}
                />
              </div>
              <div style={{ maxHeight: 240, overflowY: "auto" }}>
                {filteredAdmissions.length === 0 ? (
                  <p style={{ padding: "16px 0", textAlign: "center", color: "var(--text-secondary)" }}>
                    No active admissions found.
                  </p>
                ) : (
                  filteredAdmissions.map(a => (
                    <div
                      key={a.IhdCode}
                      className={styles.dropdownItem}
                      style={{
                        padding: "10px 12px", borderBottom: "1px solid var(--border-light)",
                        cursor: "pointer", transition: "background .12s",
                      }}
                      onClick={() => {
                        setSelectedPat(a);
                        setShowPatSearch(false);
                        setPatFilter("");
                      }}
                    >
                      <div style={{ display: "flex", justifyContent: "space-between", fontWeight: 600 }}>
                        <span>{a.PttName}</span>
                        <span style={{ color: "var(--accent-color)" }}>IPD #{a.IhdVchNo}</span>
                      </div>
                    </div>
                  ))
                )}
              </div>
            </div>
          </div>
        </div>
      )}

      {/* Main Form Modal */}
      {showModal && (
        <div className={styles.modalOverlay}>
          <div className={styles.modalContent} style={{ maxWidth: 440 }}>
            <div className={styles.modalHeader}>
              <h3 style={{ fontSize: 16, fontWeight: 700, display: "flex", alignItems: "center", gap: 8 }}>
                <PiggyBank size={18} style={{ color: "var(--accent-color)" }} />
                Collect Advance Deposit
              </h3>
              <button className={styles.closeBtn} onClick={() => setShowModal(false)}>×</button>
            </div>
            <div className={styles.modalBody} style={{ display: "flex", flexDirection: "column", gap: 14, padding: 20 }}>
              
              <div>
                <label style={{ display: "block", fontSize: 12, fontWeight: 600, color: "var(--text-secondary)", marginBottom: 6 }}>
                  Select Patient
                </label>
                <div style={{ display: "flex", gap: 6 }}>
                  <input
                    type="text"
                    readOnly
                    value={selectedPat ? `${selectedPat.PttName} (IPD No: ${selectedPat.IhdVchNo})` : "Click search to select patient..."}
                    style={{
                      border: "1px solid var(--border-light)", borderRadius: 8,
                      padding: "8px 12px", width: "100%", outline: "none", fontSize: 13,
                      background: "var(--bg-secondary)", color: selectedPat ? "var(--text-primary)" : "var(--text-muted)",
                    }}
                  />
                  <button className={styles.secondaryBtn} onClick={() => setShowPatSearch(true)} style={{ padding: 8 }}>
                    <Search size={16} />
                  </button>
                </div>
              </div>

              <div style={{ display: "grid", gridTemplateColumns: "1fr 1fr", gap: 10 }}>
                <div>
                  <label style={{ display: "block", fontSize: 12, fontWeight: 600, color: "var(--text-secondary)", marginBottom: 6 }}>
                    Date
                  </label>
                  <input
                    type="date"
                    value={depDate}
                    onChange={e => setDepDate(e.target.value)}
                    style={{
                      border: "1px solid var(--border-light)", borderRadius: 8,
                      padding: "8px 12px", width: "100%", outline: "none", fontSize: 13,
                      background: "var(--bg-card)", color: "var(--text-primary)",
                    }}
                  />
                </div>
                <div>
                  <label style={{ display: "block", fontSize: 12, fontWeight: 600, color: "var(--text-secondary)", marginBottom: 6 }}>
                    Time
                  </label>
                  <input
                    type="text"
                    value={depTime}
                    onChange={e => setDepTime(e.target.value)}
                    placeholder="HH:MM"
                    style={{
                      border: "1px solid var(--border-light)", borderRadius: 8,
                      padding: "8px 12px", width: "100%", outline: "none", fontSize: 13,
                      background: "var(--bg-card)", color: "var(--text-primary)",
                    }}
                  />
                </div>
              </div>

              <div>
                <label style={{ display: "block", fontSize: 12, fontWeight: 600, color: "var(--text-secondary)", marginBottom: 6 }}>
                  Deposit Amount (INR)
                </label>
                <input
                  type="text"
                  placeholder="0.00"
                  value={amount}
                  onChange={e => setAmount(e.target.value)}
                  style={{
                    border: "1px solid var(--border-light)", borderRadius: 8,
                    padding: "8px 12px", width: "100%", outline: "none", fontSize: 13,
                    background: "var(--bg-card)", color: "var(--text-primary)", fontWeight: 700,
                  }}
                />
              </div>

              <div>
                <label style={{ display: "block", fontSize: 12, fontWeight: 600, color: "var(--text-secondary)", marginBottom: 6 }}>
                  Payment Method
                </label>
                <select
                  value={payMode}
                  onChange={e => setPayMode(e.target.value)}
                  style={{
                    border: "1px solid var(--border-light)", borderRadius: 8,
                    padding: "8px 12px", width: "100%", outline: "none", fontSize: 13,
                    background: "var(--bg-card)", color: "var(--text-primary)",
                  }}
                >
                  <option value="Cash">Cash</option>
                  <option value="UPI">UPI / GPay / PhonePe</option>
                  <option value="Card">Credit / Debit Card</option>
                  <option value="Bank">Bank Transfer / Cheque</option>
                </select>
              </div>

              <div>
                <label style={{ display: "block", fontSize: 12, fontWeight: 600, color: "var(--text-secondary)", marginBottom: 6 }}>
                  Remarks
                </label>
                <textarea
                  value={remark}
                  onChange={e => setRemark(e.target.value)}
                  placeholder="Deposit reference details..."
                  style={{
                    border: "1px solid var(--border-light)", borderRadius: 8,
                    padding: "8px 12px", width: "100%", outline: "none", fontSize: 13,
                    background: "var(--bg-card)", color: "var(--text-primary)", resize: "none", height: 60,
                  }}
                />
              </div>

              <button
                className={styles.primaryBtn}
                onClick={handleSave}
                disabled={saving}
                style={{ width: "100%", display: "flex", justifyContent: "center", gap: 8, height: 40 }}
              >
                {saving ? <RefreshCw size={16} className="animate-spin" /> : <Save size={16} />}
                Collect & Save Deposit
              </button>
            </div>
          </div>
        </div>
      )}

      {/* Title & Toolbar */}
      <div style={{ display: "flex", justifyContent: "space-between", alignItems: "center" }}>
        <div>
          <h2 style={{ fontSize: 20, fontWeight: 700, margin: 0 }}>IPD Pre-Deposits & Advances</h2>
          <p style={{ fontSize: 13, color: "var(--text-secondary)", marginTop: 4 }}>
            Collect advance payments from active inpatients and post records directly to ledger.
          </p>
        </div>
        <button className={styles.primaryBtn} onClick={() => setShowModal(true)} style={{ gap: 6 }}>
          <Plus size={16} /> Collect Deposit
        </button>
      </div>

      {/* Search and stats bar */}
      <div style={{ display: "flex", gap: 12 }}>
        <div className={styles.searchBar} style={{ flex: 1 }}>
          <Search size={18} style={{ color: "var(--text-muted)" }} />
          <input
            type="text"
            placeholder="Search deposits by patient or voucher no..."
            value={searchTerm}
            onChange={e => setSearchTerm(e.target.value)}
          />
        </div>
        <button className={styles.secondaryBtn} onClick={loadDeposits} style={{ padding: 10 }}>
          <RefreshCw size={15} />
        </button>
      </div>

      {/* Main Table view */}
      <div className={styles.sectionBox} style={{ padding: 0 }}>
        {loading ? (
          <div style={{ padding: 40, textAlign: "center" }}>
            <RefreshCw size={24} className="animate-spin" style={{ color: "var(--text-muted)", margin: "0 auto 10px" }} />
            <span style={{ color: "var(--text-secondary)", fontSize: 13 }}>Fetching ledger deposits...</span>
          </div>
        ) : filteredDeposits.length === 0 ? (
          <div style={{ padding: 40, textAlign: "center", color: "var(--text-muted)" }}>
            No advance deposit records found.
          </div>
        ) : (
          <div className={styles.tableContainer}>
            <table className={styles.table} style={{ fontSize: 13 }}>
              <thead>
                <tr>
                  <th>Voucher No</th>
                  <th>Date</th>
                  <th>Patient Name</th>
                  <th style={{ textAlign: "right" }}>Collected (INR)</th>
                  <th style={{ textAlign: "right" }}>Adjusted (INR)</th>
                  <th style={{ textAlign: "right" }}>Balance Remaining</th>
                  <th>Remarks</th>
                </tr>
              </thead>
              <tbody>
                {filteredDeposits.map(d => (
                  <tr key={d.IgtCode}>
                    <td>
                      <strong style={{ color: "var(--accent-color)" }}>#{d.VchNo}</strong>
                    </td>
                    <td>{d.Date}</td>
                    <td>
                      <strong style={{ color: "var(--text-primary)" }}>{d.PttName}</strong>
                    </td>
                    <td style={{ textAlign: "right", fontWeight: 700, color: "var(--status-success)" }}>
                      ₹{d.DpogAmt.toFixed(2)}
                    </td>
                    <td style={{ textAlign: "right" }}>
                      ₹{d.AdjAmt.toFixed(2)}
                    </td>
                    <td style={{ textAlign: "right", fontWeight: 700 }}>
                      ₹{d.BalAmt.toFixed(2)}
                    </td>
                    <td style={{ color: "var(--text-secondary)", fontSize: 12 }}>{d.Remark || "—"}</td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        )}
      </div>
    </div>
  );
}
