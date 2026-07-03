"use client";

import React, { useEffect, useState, useRef } from "react";
import styles from "../../../dashboard.module.css";
import {
  Search, Plus, RefreshCw, X, Save,
  Calendar, Clock, AlertCircle, CheckCircle, Trash2, Printer
} from "lucide-react";

const API = "http://127.0.0.1:8000/api/ipd";

interface ActiveAdmission {
  IhdCode:  number;
  IhdVchNo: number;
  PttCode:  number;
  PttName:  string;
  PttRegNo: number | null;
}

interface RefundRecord {
  IfhCode:    number;
  IfhIpgCode: number;
  VchNo:      number;
  Date:       string;
  Time:       string;
  PttName:    string;
  PttRegNo:   number | null;
  RefuAmt:    number;
  Scheme:     string;
  PymtMode:   string;
  Remark:     string;
  CareOf:     string;
  Address:    string;
}

export default function IPDReceiptRefundPage() {
  const [refunds, setRefunds] = useState<RefundRecord[]>([]);
  const [loading, setLoading] = useState(true);
  const [searchTerm, setSearchTerm] = useState("");
  const todayDate = new Date().toISOString().slice(0, 10);
  const thirtyDaysAgo = new Date(Date.now() - 30 * 24 * 60 * 60 * 1000).toISOString().slice(0, 10);
  const [fromDate, setFromDate] = useState(thirtyDaysAgo);
  const [toDate, setToDate] = useState(todayDate);
  const [selectedRow, setSelectedRow] = useState<RefundRecord | null>(null);

  // Form Modal state
  const [showModal, setShowModal] = useState(false);
  const [activeAdmissions, setActiveAdmissions] = useState<ActiveAdmission[]>([]);
  const [showPatSearch, setShowPatSearch] = useState(false);
  const [patFilter, setPatFilter] = useState("");
  
  // Selected Patient
  const [selectedPat, setSelectedPat] = useState<ActiveAdmission | null>(null);

  // Inputs
  const [rfdDate, setRfdDate] = useState(todayDate);
  const [rfdTime, setRfdTime] = useState("12:00");
  const [amount, setAmount] = useState("");
  const [payMode, setPayMode] = useState("Cash");
  const [remark, setRemark] = useState("");
  const [saving, setSaving] = useState(false);
  const [toast, setToast] = useState<{ msg: string; ok: boolean } | null>(null);

  const patSearchRef = useRef<HTMLInputElement>(null);

  const loadRefunds = async () => {
    setLoading(true);
    try {
      const res = await fetch(`${API}/receipt-refunds?from_date=${fromDate}&to_date=${toDate}`);
      if (res.ok) setRefunds(await res.json());
    } catch (e) {
      console.error(e);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    loadRefunds();
  }, [fromDate, toDate]);

  useEffect(() => {
    const handleKeyDown = (e: KeyboardEvent) => {
      if (e.ctrlKey && e.key.toLowerCase() === "a") {
        e.preventDefault();
        handleAddClick();
      }
      if (e.key === "F5") {
        e.preventDefault();
        loadRefunds();
      }
      if (e.key === "Escape") {
        if (showPatSearch) {
          setShowPatSearch(false);
        } else if (showModal) {
          setShowModal(false);
        }
      }
    };
    window.addEventListener("keydown", handleKeyDown);
    return () => window.removeEventListener("keydown", handleKeyDown);
  }, [showModal, showPatSearch]);

  const showToast = (msg: string, ok = true) => {
    setToast({ msg, ok });
    setTimeout(() => setToast(null), 4000);
  };

  const handleAddClick = () => {
    setSelectedPat(null);
    setAmount("");
    setRemark("");
    setPayMode("Cash");
    setShowModal(true);
  };

  useEffect(() => {
    if (!showPatSearch) return;
    fetch(`${API}/admissions/active`)
      .then(r => r.json())
      .catch(() => [])
      .then(data => setActiveAdmissions(data));
    setTimeout(() => patSearchRef.current?.focus(), 100);
  }, [showPatSearch]);

  const handleSave = async () => {
    if (!selectedPat) { showToast("Please select a patient first.", false); return; }
    const rfdAmt = parseFloat(amount);
    if (!rfdAmt || rfdAmt <= 0) { showToast("Enter a valid refund amount.", false); return; }

    setSaving(true);
    try {
      const res = await fetch(`${API}/receipt-refunds`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          IfhIpgCode: selectedPat.IhdCode,
          IfhPttCode: selectedPat.PttCode,
          IfhRefuAmt: rfdAmt,
          IfhRemark:  `Mode: ${payMode}. ${remark}`.trim(),
        }),
      });

      if (!res.ok) throw new Error("Saving refund failed");
      showToast("Receipt refund issued successfully!");
      setShowModal(false);
      loadRefunds();
    } catch {
      showToast("Transaction failed. Check ledger constraints.", false);
    } finally {
      setSaving(false);
    }
  };

  const totRefunded = refunds.reduce((s, r) => s + (r.RefuAmt || 0), 0);

  const filteredRefunds = refunds.filter(r =>
    r.PttName.toLowerCase().includes(searchTerm.toLowerCase()) ||
    String(r.VchNo).includes(searchTerm)
  );

  const filteredAdmissions = activeAdmissions.filter(a =>
    a.PttName.toLowerCase().includes(patFilter.toLowerCase()) ||
    String(a.IhdVchNo).includes(patFilter)
  );

  return (
    <div style={{ display: "flex", flexDirection: "column", height: "calc(100vh - 110px)", gap: 10 }}>
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
        <div className={styles.modalOverlay} style={{ zIndex: 1100 }}>
          <div className={styles.modalContent} style={{ maxWidth: 480 }}>
            <div className={styles.modalHeader}>
              <h3 style={{ fontSize: 15, fontWeight: 700 }}>Select Patient Admission</h3>
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
                    No matching active admissions found.
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
        <div className={styles.modalOverlay} style={{ zIndex: 1000 }}>
          <div className={styles.modalContent} style={{ maxWidth: 440 }}>
            <div className={styles.modalHeader}>
              <h3 style={{ fontSize: 16, fontWeight: 700 }}>Issue Receipt Refund</h3>
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
                    value={rfdDate}
                    onChange={e => setRfdDate(e.target.value)}
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
                    value={rfdTime}
                    onChange={e => setRfdTime(e.target.value)}
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
                  Refund Amount (INR)
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
                  Refund Method
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
                  <option value="UPI">UPI / Instant Transfer</option>
                  <option value="Cheque">Bank Refund Cheque</option>
                </select>
              </div>

              <div>
                <label style={{ display: "block", fontSize: 12, fontWeight: 600, color: "var(--text-secondary)", marginBottom: 6 }}>
                  Remarks
                </label>
                <textarea
                  value={remark}
                  onChange={e => setRemark(e.target.value)}
                  placeholder="Reason for refund..."
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
                Issue & Save Refund
              </button>
            </div>
          </div>
        </div>
      )}

      {/* Summary Filter bar at the top */}
      <div style={{
        display: "flex", justifyContent: "space-between", alignItems: "center",
        background: "var(--bg-secondary)", padding: "10px 18px", borderRadius: 10,
        border: "1px solid var(--border-light)", flexWrap: "wrap", gap: 10
      }}>
        <div style={{ display: "flex", alignItems: "center", gap: 12 }}>
          <div className={styles.searchBar} style={{ width: 220, marginBottom: 0 }}>
            <Search size={16} />
            <input
              type="text"
              placeholder="Search patient or voucher..."
              value={searchTerm}
              onChange={e => setSearchTerm(e.target.value)}
            />
          </div>

          <div style={{ display: "flex", alignItems: "center", gap: 6, fontSize: 12 }}>
            <span>From Date:</span>
            <input
              type="date"
              value={fromDate}
              onChange={e => setFromDate(e.target.value)}
              style={{ padding: "4px 8px", border: "1px solid var(--border-light)", borderRadius: 6, background: "var(--bg-card)", color: "var(--text-primary)" }}
            />
            <span>To Date:</span>
            <input
              type="date"
              value={toDate}
              onChange={e => setToDate(e.target.value)}
              style={{ padding: "4px 8px", border: "1px solid var(--border-light)", borderRadius: 6, background: "var(--bg-card)", color: "var(--text-primary)" }}
            />
          </div>
        </div>

        <span style={{ fontSize: 13, fontWeight: 700, color: "var(--text-secondary)" }}>
          IPD Receipt Refunds List
        </span>
      </div>

      {/* Summary table */}
      <div className={styles.sectionBox} style={{ padding: 0, flex: 1, display: "flex", flexDirection: "column", overflow: "hidden" }}>
        <div style={{ flex: 1, overflowY: "auto" }}>
          {loading ? (
            <div style={{ padding: 40, textAlign: "center" }}>
              <RefreshCw size={24} className="animate-spin" style={{ color: "var(--text-muted)", margin: "0 auto 10px" }} />
              <span style={{ color: "var(--text-secondary)" }}>Loading refunds...</span>
            </div>
          ) : filteredRefunds.length === 0 ? (
            <div style={{ padding: 40, textAlign: "center", color: "var(--text-muted)" }}>
              No receipt refund records found.
            </div>
          ) : (
            <table className={styles.table} style={{ fontSize: 12, minWidth: 1200, borderCollapse: "collapse", width: "100%" }}>
              <thead style={{ position: "sticky", top: 0, zIndex: 10, background: "var(--bg-secondary)" }}>
                <tr>
                  <th>Date</th>
                  <th>Time</th>
                  <th>Voucher</th>
                  <th>Vchr.No</th>
                  <th>Patient Name</th>
                  <th>Reg.No (UHID)</th>
                  <th>Scheme</th>
                  <th>Pymt Mode</th>
                  <th style={{ textAlign: "right" }}>Refunded Amount (INR)</th>
                  <th>Remark</th>
                  <th>Care of</th>
                  <th>Address</th>
                </tr>
              </thead>
              <tbody>
                {filteredRefunds.map(r => {
                  const selected = selectedRow?.IfhCode === r.IfhCode;
                  return (
                    <tr
                      key={r.IfhCode}
                      onClick={() => setSelectedRow(r)}
                      style={{
                        background: selected ? "var(--accent-light)" : "transparent",
                        cursor: "pointer",
                        borderBottom: "1px solid var(--border-light)",
                      }}
                    >
                      <td>{r.Date}</td>
                      <td style={{ color: "var(--text-secondary)", fontSize: 11 }}>{r.Time || "—"}</td>
                      <td>Receipt Refund</td>
                      <td>
                        <strong style={{ color: "var(--accent-color)" }}>#{r.VchNo}</strong>
                      </td>
                      <td>
                        <strong>{r.PttName}</strong>
                      </td>
                      <td>{r.PttRegNo || "—"}</td>
                      <td>{r.Scheme || "—"}</td>
                      <td>{r.PymtMode}</td>
                      <td style={{ textAlign: "right", fontWeight: 700, color: "var(--status-danger)" }}>
                        ₹{r.RefuAmt.toFixed(2)}
                      </td>
                      <td style={{ fontSize: 11, color: "var(--text-secondary)" }}>{r.Remark || "—"}</td>
                      <td>{r.CareOf || "—"}</td>
                      <td>{r.Address || "—"}</td>
                    </tr>
                  );
                })}
              </tbody>
            </table>
          )}
        </div>

        {/* Grand Total Row */}
        {!loading && filteredRefunds.length > 0 && (
          <div style={{
            background: "#cc0000", color: "#ffffff", padding: "10px 18px",
            display: "grid", gridTemplateColumns: "1fr 150px 350px",
            alignItems: "center", fontWeight: 700, fontSize: 13, borderTop: "2px solid #990000"
          }}>
            <div>GRAND TOTAL</div>
            <div style={{ textAlign: "right" }}>₹{totRefunded.toFixed(2)}</div>
            <div></div>
          </div>
        )}
      </div>

      {/* Buttons toolbar */}
      <div style={{
        display: "flex", gap: 6, padding: "8px 14px", background: "var(--bg-secondary)",
        borderRadius: 8, border: "1px solid var(--border-light)", justifyContent: "center"
      }}>
        {[
          { text: "Add New (Ctrl+A)", color: "#c1f0f0", onClick: handleAddClick },
          { text: "Edit (Enter)", color: "#d9f2d9", onClick: () => selectedRow && showToast(`Edit Voucher #${selectedRow.VchNo}`) },
          { text: "Refresh List (F5)", color: "#f9e6ff", onClick: loadRefunds },
          { text: "Print Voucher (Ctrl+P)", color: "#ffe6cc", onClick: () => window.print() },
          { text: "Print Report (Ctrl+T)", color: "#ffffcc", onClick: () => window.print() },
          { text: "Print to Excel (Ctrl+E)", color: "#fff0f5", onClick: () => showToast("Exporting...") },
          { text: "Configure (F12)", color: "#e6e6ff", onClick: () => showToast("Config...") },
          { text: "Delete (Ctrl+D)", color: "#ffccd5", onClick: () => selectedRow && showToast(`Deleting Voucher #${selectedRow.VchNo}...`) },
          { text: "Exit (Esc)", color: "#f2f2f2", onClick: () => window.history.back() },
        ].map((btn, idx) => (
          <button
            key={idx}
            onClick={btn.onClick}
            style={{
              background: btn.color, color: "#333", border: "1px solid #bbb",
              borderRadius: 4, padding: "8px 12px", fontSize: 12, fontWeight: 700,
              cursor: "pointer", transition: "transform .08s, filter .12s"
            }}
          >
            {btn.text}
          </button>
        ))}
      </div>
    </div>
  );
}
