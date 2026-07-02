"use client";

import React, { useEffect, useState, useRef } from "react";
import styles from "../../../dashboard.module.css";
import {
  Search, Plus, RefreshCw, X, Save,
  Calendar, Clock, AlertCircle, CheckCircle, Trash2, Printer, FileSpreadsheet
} from "lucide-react";

const API = "http://127.0.0.1:8000/api/ipd";

interface ActiveAdmission {
  IhdCode:  number;
  IhdVchNo: number;
  PttCode:  number;
  PttName:  string;
  PttRegNo: number | null;
}

interface PatientInfo {
  IhdCode:  number;
  IhdVchNo: number;
  PttCode:  number | null;
  PttName:  string;
  PttRegNo: number | null;
  PttSex:   string;
  Age:      string;
  DctName:  string;
  WrdName:  string;
  BedName:  string;
  PcgName:  string;
  Scheme:   string;
  PttRefName: string;
  PttAddr:    string;
}

interface ServiceGroup { SgpCode: number; SgpName: string; }
interface ServiceItem  {
  SrvCode:    number;
  SrvName:    string;
  SgpCode:    number;
  SrvCharges: number;
  SrvDiscPer: number;
}

interface GridRow {
  _key:    string;
  SgpCode: number | "";
  SrvCode: number | "";
  SrvName: string;
  Qty:     string;
  Rate:    string;
  DiscPer: string;
  Amount:  number;
  Remark:  string;
}

interface ReceiptSummaryRow {
  IbhCode:      number;
  Date:         string;
  Voucher:      string;
  VchNo:        number;
  PatientName:  string;
  UHID:         number | null;
  Scheme:       string;
  PymtMode:     string;
  Charges:      number;
  DueAmt:       number;
  AdvAmt:       number;
  RecdAmt:      number;
  DepoAmt:      number;
  RefuAmt:      number;
  Discount:     number;
  CareOf:       string;
  Address:      string;
}

function uid() { return Math.random().toString(36).slice(2); }

function calcAmt(qty: string, rate: string, discPer: string): number {
  const q = parseFloat(qty) || 0;
  const r = parseFloat(rate) || 0;
  const d = parseFloat(discPer) || 0;
  const gross = q * r;
  return Math.round((gross - gross * d / 100) * 100) / 100;
}

function emptyRow(): GridRow {
  return {
    _key: uid(), SgpCode: "", SrvCode: "", SrvName: "",
    Qty: "1", Rate: "0.00", DiscPer: "0.00", Amount: 0, Remark: ""
  };
}

const EMPTY_PAT: PatientInfo = {
  IhdCode: 0, IhdVchNo: 0, PttCode: null, PttName: "", PttRegNo: null,
  PttSex: "", Age: "", DctName: "", WrdName: "", BedName: "", PcgName: "", Scheme: "",
  PttRefName: "", PttAddr: "",
};

export default function IPDReceiptChargesPage() {
  // Summary List states
  const [list, setList] = useState<ReceiptSummaryRow[]>([]);
  const [loading, setLoading] = useState(true);
  const [searchTerm, setSearchTerm] = useState("");
  const todayDate = new Date().toISOString().slice(0, 10);
  const thirtyDaysAgo = new Date(Date.now() - 30 * 24 * 60 * 60 * 1000).toISOString().slice(0, 10);
  const [fromDate, setFromDate] = useState(thirtyDaysAgo);
  const [toDate, setToDate] = useState(todayDate);
  const [selectedRow, setSelectedRow] = useState<ReceiptSummaryRow | null>(null);

  // Form Entry Modal states
  const [showModal, setShowModal] = useState(false);
  const [activeAdmissions, setActiveAdmissions] = useState<ActiveAdmission[]>([]);
  const [showPatSearch, setShowPatSearch] = useState(false);
  const [patFilter, setPatFilter] = useState("");
  const [patInfo, setPatInfo] = useState<PatientInfo>(EMPTY_PAT);
  const [ipdInput, setIpdInput] = useState("");
  const [patLoading, setPatLoading] = useState(false);

  // Form Inputs
  const [chargeDate, setChargeDate] = useState(todayDate);
  const [chargeTime, setChargeTime] = useState("12:00");
  const [discountPer, setDiscountPer] = useState("0.00");
  const [remark, setRemark] = useState("");
  const [payMode, setPayMode] = useState("Cash");

  // Detail Grid
  const [gridRows, setGridRows] = useState<GridRow[]>([emptyRow()]);
  const [groups, setGroups] = useState<ServiceGroup[]>([]);
  const [allItems, setAllItems] = useState<ServiceItem[]>([]);
  const [saving, setSaving] = useState(false);
  const [toast, setToast] = useState<{ msg: string; ok: boolean } | null>(null);

  const patSearchRef = useRef<HTMLInputElement>(null);

  // Load summary list from backend
  const loadSummaryList = async () => {
    setLoading(true);
    try {
      const res = await fetch(`${API}/charges/summary?from_date=${fromDate}&to_date=${toDate}`);
      if (res.ok) {
        setList(await res.json());
      }
    } catch (e) {
      console.error(e);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    loadSummaryList();
  }, [fromDate, toDate]);

  // Load lookups
  useEffect(() => {
    Promise.all([
      fetch(`${API}/charge-groups`).then(r => r.json()).catch(() => []),
      fetch(`${API}/charge-items`).then(r => r.json()).catch(() => []),
    ]).then(([grps, items]) => {
      setGroups(grps);
      setAllItems(items);
    });
  }, []);

  // Keyboard shortcut hooks
  useEffect(() => {
    const handleKeyDown = (e: KeyboardEvent) => {
      // Ctrl + A -> Add New
      if (e.ctrlKey && e.key.toLowerCase() === "a") {
        e.preventDefault();
        handleAddClick();
      }
      // F5 -> Refresh
      if (e.key === "F5") {
        e.preventDefault();
        loadSummaryList();
      }
      // Escape -> Exit Modal or Page
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
    setPatInfo(EMPTY_PAT);
    setIpdInput("");
    setGridRows([emptyRow()]);
    setRemark("");
    setDiscountPer("0.00");
    setShowModal(true);
  };

  // Select patient info on IPD No input
  useEffect(() => {
    if (!showPatSearch) return;
    fetch(`${API}/admissions/active`)
      .then(r => r.json())
      .catch(() => [])
      .then(data => setActiveAdmissions(data));
    setTimeout(() => patSearchRef.current?.focus(), 100);
  }, [showPatSearch]);

  const loadPatientDetails = async (ihdCode: number) => {
    setPatLoading(true);
    try {
      const res = await fetch(`${API}/charges/patient-info/${ihdCode}`);
      if (res.ok) {
        const info = await res.json();
        setPatInfo(info);
        setIpdInput(String(info.IhdVchNo));
      }
    } catch {
      showToast("Error loading patient demographics.", false);
    } finally {
      setPatLoading(false);
    }
  };

  const handleIpdSearch = () => {
    const v = parseInt(ipdInput.trim());
    if (!v) { showToast("Enter a valid IPD No.", false); return; }
    fetch(`${API}/admissions/active?search=${v}`)
      .then(r => r.json())
      .then((list: ActiveAdmission[]) => {
        const match = list.find(a => a.IhdVchNo === v);
        if (match) loadPatientDetails(match.IhdCode);
        else showToast("No active admission found.", false);
      });
  };

  // Detail Grid Rows Management
  const addRow = () => setGridRows(prev => [...prev, emptyRow()]);
  const deleteRow = (key: string) => {
    setGridRows(prev => {
      const next = prev.filter(r => r._key !== key);
      return next.length ? next : [emptyRow()];
    });
  };

  const updateRow = (key: string, field: keyof GridRow, value: string | number) => {
    setGridRows(prev => prev.map(r => {
      if (r._key !== key) return r;
      const updated = { ...r, [field]: value };

      if (field === "SgpCode") {
        updated.SrvCode = "";
        updated.SrvName = "";
        updated.Rate    = "0.00";
        updated.Amount  = 0;
      }

      if (field === "SrvCode") {
        const srv = allItems.find(i => i.SrvCode === Number(value));
        if (srv) {
          updated.SrvName = srv.SrvName;
          updated.Rate    = srv.SrvCharges.toFixed(2);
          updated.DiscPer = srv.SrvDiscPer.toFixed(2);
        }
      }

      updated.Amount = calcAmt(
        field === "Qty"     ? String(value) : updated.Qty,
        field === "Rate"    ? String(value) : updated.Rate,
        field === "DiscPer" ? String(value) : updated.DiscPer,
      );

      return updated;
    }));
  };

  const grossTot = gridRows.reduce((sum, r) => sum + r.Amount, 0);
  const discPct  = parseFloat(discountPer) || 0;
  const discAmt  = Math.round((grossTot * discPct / 100) * 100) / 100;
  const netTotal = grossTot - discAmt;

  const handleSave = async () => {
    if (!patInfo.IhdCode) { showToast("Select a patient first.", false); return; }
    if (gridRows.filter(r => r.SrvCode !== "").length === 0) {
      showToast("Please add at least one charge line item.", false);
      return;
    }

    setSaving(true);
    try {
      const token = localStorage.getItem("hms_token");
      const payload = {
        IbhIhdCode:   patInfo.IhdCode,
        IbhPttCode:   patInfo.PttCode,
        IbhDate:      chargeDate,
        IbhBillType:  "Indoor Charges",
        IbhDiscPer:   discPct,
        IbhDepAmt:    0.0,
        IbhRfugAmt:   0.0,
        IbhBalAmt:    netTotal,
        IbhRemark:    `Mode: ${payMode}. ${remark}`.trim(),
        IbhStatus:    "Open",
        discharge_patient: false,
        lines: gridRows.filter(r => r.SrvCode !== "").map(r => ({
          SrvCode:      r.SrvCode,
          Qty:          parseFloat(r.Qty) || 1,
          Rate:         parseFloat(r.Rate) || 0,
          DiscPer:      parseFloat(r.DiscPer) || 0,
          Remark:       r.Remark,
        })),
      };

      const res = await fetch(`${API}/charges`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          Authorization: `Bearer ${token}`,
        },
        body: JSON.stringify(payload),
      });

      if (!res.ok) throw new Error("Posting charges failed");
      showToast("Receipt saved successfully!");
      setShowModal(false);
      loadSummaryList();
    } catch {
      showToast("Transaction failed. Check ledger constraints.", false);
    } finally {
      setSaving(false);
    }
  };

  // Grand Totals calculator for summary list
  const totCharges = list.reduce((s, r) => s + (r.Charges || 0), 0);
  const totDue     = list.reduce((s, r) => s + (r.DueAmt || 0), 0);
  const totAdv     = list.reduce((s, r) => s + (r.AdvAmt || 0), 0);
  const totRecd    = list.reduce((s, r) => s + (r.RecdAmt || 0), 0);
  const totDepo    = list.reduce((s, r) => s + (r.DepoAmt || 0), 0);
  const totRefu    = list.reduce((s, r) => s + (r.RefuAmt || 0), 0);
  const totDisc    = list.reduce((s, r) => s + (r.Discount || 0), 0);

  const filteredSummaryList = list.filter(r =>
    r.PatientName.toLowerCase().includes(searchTerm.toLowerCase()) ||
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

      {/* Patient Search Lookup Dialog */}
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
                        loadPatientDetails(a.IhdCode);
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

      {/* Entry Form Modal */}
      {showModal && (
        <div className={styles.modalOverlay} style={{ zIndex: 1000 }}>
          <div className={styles.modalContent} style={{ maxWidth: 900, width: "95%" }}>
            <div className={styles.modalHeader}>
              <h3 style={{ fontSize: 16, fontWeight: 700 }}>Add New Indoor Receipt</h3>
              <button className={styles.closeBtn} onClick={() => setShowModal(false)}>×</button>
            </div>
            <div className={styles.modalBody} style={{ display: "flex", flexDirection: "column", gap: 14, padding: 20 }}>
              
              <div style={{ display: "grid", gridTemplateColumns: "1fr 1fr 1fr", gap: 12 }}>
                <div>
                  <label style={{ display: "block", fontSize: 12, fontWeight: 600, color: "var(--text-secondary)", marginBottom: 6 }}>
                    IPD No
                  </label>
                  <div style={{ display: "flex", gap: 6 }}>
                    <input
                      type="text"
                      value={ipdInput}
                      onChange={e => setIpdInput(e.target.value)}
                      onKeyDown={e => e.key === "Enter" && handleIpdSearch()}
                      placeholder="Enter IPD No..."
                      style={{
                        border: "1px solid var(--border-light)", borderRadius: 8,
                        padding: "8px 12px", width: "100%", outline: "none", fontSize: 13,
                        background: "var(--bg-card)", color: "var(--text-primary)",
                      }}
                    />
                    <button className={styles.secondaryBtn} onClick={() => setShowPatSearch(true)} style={{ padding: 10 }}>
                      <Search size={15} />
                    </button>
                  </div>
                </div>

                <div>
                  <label style={{ display: "block", fontSize: 12, fontWeight: 600, color: "var(--text-secondary)", marginBottom: 6 }}>
                    Receipt Date
                  </label>
                  <input
                    type="date"
                    value={chargeDate}
                    onChange={e => setChargeDate(e.target.value)}
                    style={{
                      border: "1px solid var(--border-light)", borderRadius: 8,
                      padding: "8px 12px", width: "100%", outline: "none", fontSize: 13,
                      background: "var(--bg-card)", color: "var(--text-primary)",
                    }}
                  />
                </div>

                <div>
                  <label style={{ display: "block", fontSize: 12, fontWeight: 600, color: "var(--text-secondary)", marginBottom: 6 }}>
                    Receipt Time
                  </label>
                  <input
                    type="text"
                    value={chargeTime}
                    onChange={e => setChargeTime(e.target.value)}
                    style={{
                      border: "1px solid var(--border-light)", borderRadius: 8,
                      padding: "8px 12px", width: "100%", outline: "none", fontSize: 13,
                      background: "var(--bg-card)", color: "var(--text-primary)",
                    }}
                  />
                </div>
              </div>

              {patInfo.IhdCode > 0 && (
                <div style={{ background: "var(--bg-secondary)", padding: 12, borderRadius: 8, display: "grid", gridTemplateColumns: "repeat(4, 1fr)", gap: 10 }}>
                  <div>
                    <span style={{ fontSize: 11, color: "var(--text-secondary)", display: "block" }}>Patient Name</span>
                    <strong style={{ fontSize: 13 }}>{patInfo.PttName}</strong>
                  </div>
                  <div>
                    <span style={{ fontSize: 11, color: "var(--text-secondary)", display: "block" }}>Allotted Bed</span>
                    <strong style={{ fontSize: 13 }}>{patInfo.WrdName} / {patInfo.BedName}</strong>
                  </div>
                  <div>
                    <span style={{ fontSize: 11, color: "var(--text-secondary)", display: "block" }}>Doctor</span>
                    <strong style={{ fontSize: 13 }}>{patInfo.DctName}</strong>
                  </div>
                  <div>
                    <span style={{ fontSize: 11, color: "var(--text-secondary)", display: "block" }}>Scheme / Group</span>
                    <strong style={{ fontSize: 13 }}>{patInfo.PcgName} ({patInfo.Scheme})</strong>
                  </div>
                </div>
              )}

              {/* Grid details */}
              <div style={{ border: "1px solid var(--border-light)", borderRadius: 8, overflow: "hidden" }}>
                <div style={{ background: "var(--bg-secondary)", padding: "10px 14px", display: "flex", justifyContent: "space-between", alignItems: "center" }}>
                  <span style={{ fontSize: 12, fontWeight: 700 }}>Diagnostics & Procedures Grid</span>
                  <button className={styles.secondaryBtn} onClick={addRow} style={{ gap: 6, padding: "4px 8px", fontSize: 11 }}>
                    <Plus size={12} /> Add Row
                  </button>
                </div>
                <div style={{ maxHeight: 200, overflowY: "auto" }}>
                  <table className={styles.table} style={{ fontSize: 12, borderCollapse: "collapse", width: "100%" }}>
                    <thead>
                      <tr>
                        <th style={{ width: 180 }}>Charge Group</th>
                        <th>Service / Procedure Item</th>
                        <th style={{ width: 60, textAlign: "right" }}>Qty</th>
                        <th style={{ width: 80, textAlign: "right" }}>Rate</th>
                        <th style={{ width: 60, textAlign: "right" }}>Disc %</th>
                        <th style={{ width: 90, textAlign: "right" }}>Amount</th>
                        <th>Remarks</th>
                        <th style={{ width: 40 }}></th>
                      </tr>
                    </thead>
                    <tbody>
                      {gridRows.map(r => (
                        <tr key={r._key}>
                          <td>
                            <select
                              value={r.SgpCode}
                              onChange={e => updateRow(r._key, "SgpCode", e.target.value)}
                              style={{ width: "100%", padding: 4, borderRadius: 4, border: "1px solid var(--border-light)", background: "var(--bg-card)", color: "var(--text-primary)" }}
                            >
                              <option value="">— Select —</option>
                              {groups.map(g => <option key={g.SgpCode} value={g.SgpCode}>{g.SgpName}</option>)}
                            </select>
                          </td>
                          <td>
                            <select
                              value={r.SrvCode}
                              onChange={e => updateRow(r._key, "SrvCode", e.target.value)}
                              disabled={!r.SgpCode}
                              style={{ width: "100%", padding: 4, borderRadius: 4, border: "1px solid var(--border-light)", background: "var(--bg-card)", color: "var(--text-primary)" }}
                            >
                              <option value="">— Select —</option>
                              {allItems.filter(item => item.SgpCode === Number(r.SgpCode)).map(item => (
                                <option key={item.SrvCode} value={item.SrvCode}>{item.SrvName}</option>
                              ))}
                            </select>
                          </td>
                          <td>
                            <input
                              type="text"
                              value={r.Qty}
                              onChange={e => updateRow(r._key, "Qty", e.target.value)}
                              style={{ width: "100%", textAlign: "right", padding: 4, borderRadius: 4, border: "1px solid var(--border-light)", background: "var(--bg-card)", color: "var(--text-primary)" }}
                            />
                          </td>
                          <td>
                            <input
                              type="text"
                              value={r.Rate}
                              onChange={e => updateRow(r._key, "Rate", e.target.value)}
                              style={{ width: "100%", textAlign: "right", padding: 4, borderRadius: 4, border: "1px solid var(--border-light)", background: "var(--bg-card)", color: "var(--text-primary)" }}
                            />
                          </td>
                          <td>
                            <input
                              type="text"
                              value={r.DiscPer}
                              onChange={e => updateRow(r._key, "DiscPer", e.target.value)}
                              style={{ width: "100%", textAlign: "right", padding: 4, borderRadius: 4, border: "1px solid var(--border-light)", background: "var(--bg-card)", color: "var(--text-primary)" }}
                            />
                          </td>
                          <td style={{ textAlign: "right", fontWeight: 700 }}>
                            ₹{r.Amount.toFixed(2)}
                          </td>
                          <td>
                            <input
                              type="text"
                              value={r.Remark}
                              onChange={e => updateRow(r._key, "Remark", e.target.value)}
                              style={{ width: "100%", padding: 4, borderRadius: 4, border: "1px solid var(--border-light)", background: "var(--bg-card)", color: "var(--text-primary)" }}
                            />
                          </td>
                          <td>
                            <button className={styles.secondaryBtn} onClick={() => deleteRow(r._key)} style={{ padding: 4, color: "var(--status-danger)" }}>
                              <Trash2 size={12} />
                            </button>
                          </td>
                        </tr>
                      ))}
                    </tbody>
                  </table>
                </div>
              </div>

              {/* Bottom calculations & payments */}
              <div style={{ display: "grid", gridTemplateColumns: "1fr 300px", gap: 20, borderTop: "1px solid var(--border-light)", paddingTop: 14 }}>
                <div style={{ display: "flex", flexDirection: "column", gap: 10 }}>
                  <div style={{ display: "grid", gridTemplateColumns: "1fr 1fr", gap: 10 }}>
                    <div>
                      <label style={{ display: "block", fontSize: 11, fontWeight: 600, color: "var(--text-secondary)", marginBottom: 4 }}>
                        Payment Mode
                      </label>
                      <select
                        value={payMode}
                        onChange={e => setPayMode(e.target.value)}
                        style={{ width: "100%", padding: "6px 10px", borderRadius: 6, border: "1px solid var(--border-light)", background: "var(--bg-card)", color: "var(--text-primary)", fontSize: 12 }}
                      >
                        <option value="Cash">Cash</option>
                        <option value="UPI">UPI / Instant Transfer</option>
                        <option value="Card">Credit / Debit Card</option>
                      </select>
                    </div>
                    <div>
                      <label style={{ display: "block", fontSize: 11, fontWeight: 600, color: "var(--text-secondary)", marginBottom: 4 }}>
                        Remarks
                      </label>
                      <input
                        type="text"
                        value={remark}
                        onChange={e => setRemark(e.target.value)}
                        placeholder="Voucher details..."
                        style={{ width: "100%", padding: "6px 10px", borderRadius: 6, border: "1px solid var(--border-light)", background: "var(--bg-card)", color: "var(--text-primary)", fontSize: 12 }}
                      />
                    </div>
                  </div>
                </div>

                <div style={{ display: "flex", flexDirection: "column", gap: 8, fontSize: 13 }}>
                  <div style={{ display: "flex", justifyContent: "space-between" }}>
                    <span>Gross Amount:</span>
                    <strong>₹{grossTot.toFixed(2)}</strong>
                  </div>
                  <div style={{ display: "flex", justifyContent: "space-between", alignItems: "center" }}>
                    <span>Discount %:</span>
                    <input
                      type="text"
                      value={discountPer}
                      onChange={e => setDiscountPer(e.target.value)}
                      style={{ width: 60, textAlign: "right", padding: 4, borderRadius: 4, border: "1px solid var(--border-light)", background: "var(--bg-card)", color: "var(--text-primary)" }}
                    />
                  </div>
                  <div style={{ display: "flex", justifyContent: "space-between", fontSize: 14, fontWeight: 700, borderTop: "1px solid var(--border-light)", paddingTop: 6 }}>
                    <span>Net Amount:</span>
                    <span style={{ color: "var(--status-success)" }}>₹{netTotal.toFixed(2)}</span>
                  </div>
                  
                  <button
                    className={styles.primaryBtn}
                    onClick={handleSave}
                    disabled={saving}
                    style={{ marginTop: 10, width: "100%", display: "flex", justifyContent: "center", gap: 8, height: 38 }}
                  >
                    {saving ? <RefreshCw size={15} className="animate-spin" /> : <Save size={15} />}
                    Save Receipt (Enter)
                  </button>
                </div>
              </div>

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
          Indoor Receipt Summary List
        </span>
      </div>

      {/* Summary Table Grid view */}
      <div className={styles.sectionBox} style={{ padding: 0, flex: 1, display: "flex", flexDirection: "column", overflow: "hidden" }}>
        <div style={{ flex: 1, overflowY: "auto" }}>
          {loading ? (
            <div style={{ padding: 40, textAlign: "center" }}>
              <RefreshCw size={24} className="animate-spin" style={{ color: "var(--text-muted)", margin: "0 auto 10px" }} />
              <span style={{ color: "var(--text-secondary)" }}>Loading summary...</span>
            </div>
          ) : filteredSummaryList.length === 0 ? (
            <div style={{ padding: 40, textAlign: "center", color: "var(--text-muted)" }}>
              No indoor receipt records found for this date range.
            </div>
          ) : (
            <table className={styles.table} style={{ fontSize: 12, minWidth: 1400, borderCollapse: "collapse", width: "100%" }}>
              <thead style={{ position: "sticky", top: 0, zIndex: 10, background: "var(--bg-secondary)" }}>
                <tr>
                  <th>Date</th>
                  <th>Voucher</th>
                  <th>Vchr.No</th>
                  <th>Patient Name</th>
                  <th>UHID</th>
                  <th>Scheme</th>
                  <th>Pymt Mode</th>
                  <th style={{ textAlign: "right" }}>Charges</th>
                  <th style={{ textAlign: "right" }}>Due Amt</th>
                  <th style={{ textAlign: "right" }}>Adv.Amt</th>
                  <th style={{ textAlign: "right" }}>Recd.Amt</th>
                  <th style={{ textAlign: "right" }}>Depo.Amt</th>
                  <th style={{ textAlign: "right" }}>Refu.Amt</th>
                  <th style={{ textAlign: "right" }}>Discount</th>
                  <th>Care of</th>
                  <th>Address</th>
                </tr>
              </thead>
              <tbody>
                {filteredSummaryList.map(r => {
                  const selected = selectedRow?.IbhCode === r.IbhCode;
                  return (
                    <tr
                      key={r.IbhCode}
                      onClick={() => setSelectedRow(r)}
                      style={{
                        background: selected ? "var(--accent-light)" : "transparent",
                        cursor: "pointer",
                        borderBottom: "1px solid var(--border-light)",
                      }}
                    >
                      <td>{r.Date}</td>
                      <td>{r.Voucher}</td>
                      <td>
                        <strong style={{ color: "var(--accent-color)" }}>#{r.VchNo}</strong>
                      </td>
                      <td>
                        <strong>{r.PatientName}</strong>
                      </td>
                      <td>{r.UHID || "—"}</td>
                      <td>{r.Scheme || "—"}</td>
                      <td>{r.PymtMode}</td>
                      <td style={{ textAlign: "right", fontWeight: 600 }}>₹{r.Charges.toFixed(2)}</td>
                      <td style={{ textAlign: "right" }}>₹{r.DueAmt.toFixed(2)}</td>
                      <td style={{ textAlign: "right" }}>₹{r.AdvAmt.toFixed(2)}</td>
                      <td style={{ textAlign: "right" }}>₹{r.RecdAmt.toFixed(2)}</td>
                      <td style={{ textAlign: "right" }}>₹{r.DepoAmt.toFixed(2)}</td>
                      <td style={{ textAlign: "right" }}>₹{r.RefuAmt.toFixed(2)}</td>
                      <td style={{ textAlign: "right" }}>₹{r.Discount.toFixed(2)}</td>
                      <td>{r.CareOf || "—"}</td>
                      <td>{r.Address || "—"}</td>
                    </tr>
                  );
                })}
              </tbody>
            </table>
          )}
        </div>

        {/* Grand Total Row at the bottom of the table (matching legacy style!) */}
        {!loading && filteredSummaryList.length > 0 && (
          <div style={{
            background: "#cc0000", color: "#ffffff", padding: "10px 18px",
            display: "grid", gridTemplateColumns: "1fr repeat(7, 100px) 250px",
            alignItems: "center", fontWeight: 700, fontSize: 13, borderTop: "2px solid #990000"
          }}>
            <div>GRAND TOTAL</div>
            <div style={{ textAlign: "right" }}>₹{totCharges.toFixed(2)}</div>
            <div style={{ textAlign: "right" }}>₹{totDue.toFixed(2)}</div>
            <div style={{ textAlign: "right" }}>₹{totAdv.toFixed(2)}</div>
            <div style={{ textAlign: "right" }}>₹{totRecd.toFixed(2)}</div>
            <div style={{ textAlign: "right" }}>₹{totDepo.toFixed(2)}</div>
            <div style={{ textAlign: "right" }}>₹{totRefu.toFixed(2)}</div>
            <div style={{ textAlign: "right" }}>₹{totDisc.toFixed(2)}</div>
            <div></div>
          </div>
        )}
      </div>

      {/* Styled legacy action buttons at the bottom */}
      <div style={{
        display: "flex", gap: 6, padding: "8px 14px", background: "var(--bg-secondary)",
        borderRadius: 8, border: "1px solid var(--border-light)", justifyContent: "center"
      }}>
        {[
          { text: "Add New (Ctrl+A)", color: "#c1f0f0", onClick: handleAddClick },
          { text: "Edit (Enter)", color: "#d9f2d9", onClick: () => selectedRow && showToast(`Edit functionality for Voucher #${selectedRow.VchNo}`) },
          { text: "Refresh List (F5)", color: "#f9e6ff", onClick: loadSummaryList },
          { text: "Print Voucher (Ctrl+P)", color: "#ffe6cc", onClick: () => window.print() },
          { text: "Print Report (Ctrl+T)", color: "#ffffcc", onClick: () => window.print() },
          { text: "Print to Excel (Ctrl+E)", color: "#fff0f5", onClick: () => showToast("Exporting to Excel...") },
          { text: "Configure (F12)", color: "#e6e6ff", onClick: () => showToast("Configuration opened...") },
          { text: "Delete (Ctrl+D)", color: "#ffccd5", onClick: () => selectedRow && showToast(`Deleting Voucher #${selectedRow.VchNo}...`) },
          { text: "Exit (Esc)", color: "#f2f2f2", onClick: () => window.history.back() },
        ].map((btn, idx) => (
          <button
            key={idx}
            onClick={btn.onClick}
            style={{
              background: btn.color, color: "#333", border: "1px solid #bbb",
              borderRadius: 4, padding: "8px 12px", fontSize: 12, fontWeight: 700,
              cursor: "pointer", transition: "transform .08s, filter .12s",
              boxShadow: "0 2px 4px rgba(0,0,0,0.06)"
            }}
            onMouseDown={e => (e.currentTarget.style.transform = "scale(0.96)")}
            onMouseUp={e => (e.currentTarget.style.transform = "scale(1)")}
            onMouseEnter={e => (e.currentTarget.style.filter = "brightness(0.95)")}
            onMouseLeave={e => (e.currentTarget.style.filter = "brightness(1)")}
          >
            {btn.text}
          </button>
        ))}
      </div>
    </div>
  );
}
