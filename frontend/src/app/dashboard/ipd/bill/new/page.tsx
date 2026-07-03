"use client";

import React, { useEffect, useState, useCallback, useRef } from "react";
import { useRouter } from "next/navigation";
import styles from "../../../../dashboard.module.css";
import {
  ArrowLeft, Save, Plus, Trash2, RefreshCw,
  User, AlertCircle, CheckCircle, Search, Calendar,
  Clock, IndianRupee, FileText, Sparkles, CheckSquare, LogOut,
} from "lucide-react";

const API     = "http://127.0.0.1:8000/api/ipd";
const MASTERS = "http://127.0.0.1:8000/api/masters";

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
  DctCode:  number | null;
  DctName:  string;
  WrdName:  string;
  BedName:  string;
  PcgName:  string;
  Scheme:   string;
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
  _key:         string;
  IbsCode:      number | null;
  SgpCode:      number | "";
  SgpName:      string;
  SrvCode:      number | "";
  SrvName:      string;
  Qty:          string;
  Rate:         string;
  DiscPer:      string;
  Amount:       number;
  Remark:       string;
  IbbsFromDate: string;
  IbbsFromTime: number;
  IbbsToDate:   string;
  IbbsToTime:   number;
}

function uid() { return Math.random().toString(36).slice(2); }

function fmtAmt(n: number) {
  return "₹" + (n || 0).toLocaleString("en-IN", { minimumFractionDigits: 2, maximumFractionDigits: 2 });
}

function calcAmt(qty: string, rate: string, discPer: string): number {
  const q = parseFloat(qty) || 0;
  const r = parseFloat(rate) || 0;
  const d = parseFloat(discPer) || 0;
  const gross = q * r;
  return Math.round((gross - gross * d / 100) * 100) / 100;
}

function emptyRow(): GridRow {
  return {
    _key: uid(), IbsCode: null, SgpCode: "", SgpName: "", SrvCode: "", SrvName: "",
    Qty: "1", Rate: "0.00", DiscPer: "0.00", Amount: 0, Remark: "",
    IbbsFromDate: "", IbbsFromTime: 0, IbbsToDate: "", IbbsToTime: 0,
  };
}

const EMPTY_PAT: PatientInfo = {
  IhdCode: 0, IhdVchNo: 0, PttCode: null, PttName: "", PttRegNo: null,
  PttSex: "", Age: "", DctCode: null, DctName: "",
  WrdName: "", BedName: "", PcgName: "", Scheme: "",
};

export default function NewIPDBillPage() {
  const router = useRouter();

  // Lookups
  const [admissions, setAdmissions]   = useState<ActiveAdmission[]>([]);
  const [groups, setGroups]           = useState<ServiceGroup[]>([]);
  const [allItems, setAllItems]       = useState<ServiceItem[]>([]);
  const [showAdmSearch, setShowAdmSearch] = useState(false);
  const [admSearch, setAdmSearch]     = useState("");

  // Patient / Ledger
  const [patInfo, setPatInfo]         = useState<PatientInfo>(EMPTY_PAT);
  const [ipdInput, setIpdInput]       = useState("");
  const [patLoading, setPatLoading]   = useState(false);
  const [advancePaid, setAdvancePaid] = useState(0.0);
  const [refundPaid, setRefundPaid]   = useState(0.0);
  const [priorBilled, setPriorBilled] = useState(0.0);

  // Billing inputs
  const today = new Date().toISOString().slice(0, 10);
  const [billDate, setBillDate]       = useState(today);
  const [billTime, setBillTime]       = useState("12:00");
  const [discountPer, setDiscountPer] = useState("0.00");
  const [remark, setRemark]           = useState("");

  // Patient Discharge block
  const [dischargePatient, setDischargePatient] = useState(true);
  const [dischargeDate, setDischargeDate]       = useState(today);
  const [dischargeTime, setDischargeTime]       = useState("12:00");

  // Grid
  const [gridRows, setGridRows]       = useState<GridRow[]>([emptyRow()]);
  const [calculatingStays, setCalculatingStays] = useState(false);

  // Actions
  const [saving, setSaving]           = useState(false);
  const [toast, setToast]             = useState<{ msg: string; ok: boolean } | null>(null);

  const admSearchRef = useRef<HTMLInputElement>(null);

  // Fetch Lookups
  useEffect(() => {
    Promise.all([
      fetch(`${API}/charge-groups`).then(r => r.json()).catch(() => []),
      fetch(`${API}/charge-items`).then(r => r.json()).catch(() => []),
    ]).then(([grps, items]) => {
      setGroups(grps);
      setAllItems(items);
    });
  }, []);

  // Fetch Active Admissions
  useEffect(() => {
    if (!showAdmSearch) return;
    fetch(`${API}/admissions/active`)
      .then(r => r.json())
      .catch(() => [])
      .then(data => setAdmissions(data));
    setTimeout(() => admSearchRef.current?.focus(), 100);
  }, [showAdmSearch]);

  // Load Patient Detail & Financial Ledger history
  async function loadPatientDetails(ihdCode: number) {
    setPatLoading(true);
    try {
      const infoRes = await fetch(`${API}/charges/patient-info/${ihdCode}`);
      if (!infoRes.ok) throw new Error("Patient details failed");
      const info: PatientInfo = await infoRes.json();
      setPatInfo(info);
      setIpdInput(String(info.IhdVchNo));

      // Fetch financial advances / prior bills
      const ledgerRes = await fetch(`${API}/registrations/${ihdCode}/linked-trans`);
      if (ledgerRes.ok) {
        const ledger = await ledgerRes.json();
        const totalAdv = ledger.advances?.reduce((sum: number, a: any) => sum + (a.amount || 0), 0) || 0;
        const totalRef = ledger.refunds?.reduce((sum: number, r: any) => sum + (r.amount || 0), 0) || 0;
        const totalBill = ledger.bills?.reduce((sum: number, b: any) => sum + (b.total || 0), 0) || 0;
        
        setAdvancePaid(totalAdv);
        setRefundPaid(totalRef);
        setPriorBilled(totalBill);
      }
    } catch {
      showToast("Error loading patient billing records.", false);
      setPatInfo(EMPTY_PAT);
    } finally {
      setPatLoading(false);
    }
  }

  function handleIpdSearch() {
    const v = parseInt(ipdInput.trim());
    if (!v) { showToast("Enter a valid IPD No.", false); return; }
    fetch(`${API}/admissions/active?search=${v}`)
      .then(r => r.json())
      .then((list: ActiveAdmission[]) => {
        const match = list.find(a => a.IhdVchNo === v);
        if (match) loadPatientDetails(match.IhdCode);
        else showToast("No active admission found for IPD No " + v, false);
      });
  }

  // Calculate Bed Stays API trigger
  async function triggerAutoStays() {
    if (!patInfo.IhdCode) { showToast("Select a patient stay first.", false); return; }
    setCalculatingStays(true);
    try {
      const res = await fetch(`${API}/billing/${patInfo.IhdCode}/calculate-bed-charges`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ bill_date: billDate, bill_time: billTime }),
      });
      if (!res.ok) throw new Error("Calculation engine failed");
      const stays = await res.json();
      
      if (!stays || stays.length === 0) {
        showToast("No active stay days pending calculations.", true);
        return;
      }

      // Convert calculated stay segments to GridRows
      const stayRows: GridRow[] = stays.map((s: any) => {
        const srv = allItems.find(item => item.SrvCode === s.SrvCode);
        return {
          _key:         uid(),
          IbsCode:      s.IbsCode,
          SgpCode:      srv?.SgpCode || "",
          SgpName:      "",
          SrvCode:      s.SrvCode,
          SrvName:      s.SrvName,
          Qty:          String(s.Qty),
          Rate:         parseFloat(s.Rate).toFixed(2),
          DiscPer:      "0.00",
          Amount:       s.Amount,
          Remark:       s.Remark,
          IbbsFromDate: s.IbbsFromDate,
          IbbsFromTime: s.IbbsFromTime,
          IbbsToDate:   s.IbbsToDate,
          IbbsToTime:   s.IbbsToTime,
        };
      });

      // Filter out existing blank row if empty
      setGridRows(prev => {
        const filtered = prev.filter(r => r.SrvCode !== "");
        return [...stayRows, ...filtered];
      });
      showToast("Auto stay calculations complete!");
    } catch {
      showToast("Calculation engine failed to parse stay logs.", false);
    } finally {
      setCalculatingStays(false);
    }
  }

  function showToast(msg: string, ok = true) {
    setToast({ msg, ok });
    setTimeout(() => setToast(null), 4000);
  }

  // Grid Controls
  function addRow() { setGridRows(prev => [...prev, emptyRow()]); }
  function deleteRow(key: string) {
    setGridRows(prev => {
      const next = prev.filter(r => r._key !== key);
      return next.length ? next : [emptyRow()];
    });
  }

  function updateRow(key: string, field: keyof GridRow, value: string | number) {
    setGridRows(prev => prev.map(r => {
      if (r._key !== key) return r;
      const updated = { ...r, [field]: value };

      if (field === "SgpCode") {
        const grp = groups.find(g => g.SgpCode === Number(value));
        updated.SgpName = grp?.SgpName || "";
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
  }

  // Calculations
  const grossTot = gridRows.reduce((sum, r) => sum + r.Amount, 0);
  const discPct  = parseFloat(discountPer) || 0;
  const discAmt  = Math.round((grossTot * discPct / 100) * 100) / 100;
  const netTotal = grossTot - discAmt;
  const balDue   = netTotal - advancePaid + refundPaid;

  async function handleSave() {
    if (!patInfo.IhdCode) { showToast("Select a patient to save.", false); return; }
    if (gridRows.filter(r => r.SrvCode !== "").length === 0) {
      showToast("Invoice must contain at least one valid stay or service charge row.", false);
      return;
    }

    setSaving(true);
    try {
      const token = localStorage.getItem("hms_token");
      
      const payload = {
        IbhIhdCode:   patInfo.IhdCode,
        IbhPttCode:   patInfo.PttCode,
        IbhDate:      billDate,
        IbhBillType:  "Final Bill",
        IbhDiscPer:   discPct,
        IbhDepAmt:    advancePaid,
        IbhRfugAmt:   refundPaid,
        IbhBalAmt:    balDue,
        IbhRemark:    remark,
        IbhStatus:    balDue <= 0 ? "Closed" : "Open",
        discharge_patient: dischargePatient,
        discharge_date:    dischargePatient ? dischargeDate : null,
        discharge_time:    dischargePatient ? dischargeTime : null,
        lines: gridRows.filter(r => r.SrvCode !== "").map(r => ({
          SrvCode:      r.SrvCode,
          Qty:          parseFloat(r.Qty) || 1,
          Rate:         parseFloat(r.Rate) || 0,
          DiscPer:      parseFloat(r.DiscPer) || 0,
          IbsCode:      r.IbsCode,
          IbbsFromDate: r.IbbsFromDate,
          IbbsFromTime: r.IbbsFromTime,
          IbbsToDate:   r.IbbsToDate,
          IbbsToTime:   r.IbbsToTime,
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

      if (!res.ok) throw new Error("Failed to post bill");
      showToast("Invoice posted successfully!", true);
      setTimeout(() => router.push("/dashboard/ipd/bill"), 1500);
    } catch {
      showToast("Transaction failed. Check ledger constraints.", false);
    } finally {
      setSaving(false);
    }
  }

  const filteredAdmissions = admissions.filter(a =>
    a.PttName.toLowerCase().includes(admSearch.toLowerCase()) ||
    String(a.IhdVchNo).includes(admSearch)
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
          fontWeight: 600, fontSize: 14, animation: "slideIn .2s ease",
        }}>
          {toast.ok ? <CheckCircle size={18} /> : <AlertCircle size={18} />}
          {toast.msg}
        </div>
      )}

      {/* Lookup Modal */}
      {showAdmSearch && (
        <div className={styles.modalOverlay}>
          <div className={styles.modalContent} style={{ maxWidth: 540 }}>
            <div className={styles.modalHeader}>
              <h3 style={{ fontSize: 16, fontWeight: 700 }}>Select Active Patient Admission</h3>
              <button className={styles.closeBtn} onClick={() => setShowAdmSearch(false)}>×</button>
            </div>
            <div className={styles.modalBody} style={{ padding: "14px 20px" }}>
              <div className={styles.searchBar} style={{ marginBottom: 12 }}>
                <Search size={16} />
                <input
                  ref={admSearchRef}
                  type="text"
                  placeholder="Filter name or IPD No..."
                  value={admSearch}
                  onChange={e => setAdmSearch(e.target.value)}
                />
              </div>
              <div style={{ maxHeight: 280, overflowY: "auto" }}>
                {filteredAdmissions.length === 0 ? (
                  <p style={{ padding: "16px 0", textAlign: "center", color: "var(--text-secondary)" }}>
                    No matching stay found.
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
                        setShowAdmSearch(false);
                        setAdmSearch("");
                      }}
                    >
                      <div style={{ display: "flex", justifyContent: "space-between", fontWeight: 600 }}>
                        <span>{a.PttName}</span>
                        <span style={{ color: "var(--accent-color)" }}>IPD #{a.IhdVchNo}</span>
                      </div>
                      <div style={{ fontSize: 12, color: "var(--text-secondary)", marginTop: 2 }}>
                        UHID: {a.PttRegNo || "—"}
                      </div>
                    </div>
                  ))
                )}
              </div>
            </div>
          </div>
        </div>
      )}

      {/* Header bar */}
      <div style={{ display: "flex", alignItems: "center", gap: 12 }}>
        <button className={styles.secondaryBtn} style={{ padding: 8 }} onClick={() => router.push("/dashboard/ipd/bill")}>
          <ArrowLeft size={16} />
        </button>
        <div>
          <h2 style={{ fontSize: 20, fontWeight: 700, margin: 0 }}>Create Settlement Invoice</h2>
          <p style={{ fontSize: 13, color: "var(--text-secondary)", marginTop: 3 }}>
            Calculate ward stay segments, adjust pre-deposits, and prepare patient discharge settlement.
          </p>
        </div>
      </div>

      <div style={{ display: "grid", gridTemplateColumns: "1fr 340px", gap: 20, alignItems: "start" }}>
        
        {/* Main form section */}
        <div style={{ display: "flex", flexDirection: "column", gap: 20 }}>
          
          {/* Section 1: Patient lookup & metadata */}
          <div className={styles.sectionBox} style={{ display: "grid", gridTemplateColumns: "repeat(3, 1fr)", gap: 14 }}>
            <div>
              <label style={{ display: "block", fontSize: 12, fontWeight: 600, color: "var(--text-secondary)", marginBottom: 6 }}>
                IPD No
              </label>
              <div style={{ display: "flex", gap: 6 }}>
                <input
                  id="inp-ipd-no"
                  type="text"
                  value={ipdInput}
                  onChange={e => setIpdInput(e.target.value)}
                  onKeyDown={e => e.key === "Enter" && handleIpdSearch()}
                  placeholder="IPD No"
                  style={{
                    border: "1px solid var(--border-light)", borderRadius: 8,
                    padding: "8px 12px", width: "100%", outline: "none", fontSize: 13,
                    background: "var(--bg-card)", color: "var(--text-primary)",
                  }}
                />
                <button
                  id="btn-ipd-lookup"
                  className={styles.secondaryBtn}
                  onClick={() => setShowAdmSearch(true)}
                  style={{ padding: "8px 10px", flexShrink: 0 }}
                >
                  <Search size={15} />
                </button>
              </div>
            </div>

            <div>
              <label style={{ display: "block", fontSize: 12, fontWeight: 600, color: "var(--text-secondary)", marginBottom: 6 }}>
                Billing Date
              </label>
              <input
                id="inp-bill-date"
                type="date"
                value={billDate}
                onChange={e => setBillDate(e.target.value)}
                style={{
                  border: "1px solid var(--border-light)", borderRadius: 8,
                  padding: "8px 12px", width: "100%", outline: "none", fontSize: 13,
                  background: "var(--bg-card)", color: "var(--text-primary)",
                }}
              />
            </div>

            <div>
              <label style={{ display: "block", fontSize: 12, fontWeight: 600, color: "var(--text-secondary)", marginBottom: 6 }}>
                Billing Time
              </label>
              <input
                id="inp-bill-time"
                type="text"
                value={billTime}
                onChange={e => setBillTime(e.target.value)}
                placeholder="HH:MM"
                style={{
                  border: "1px solid var(--border-light)", borderRadius: 8,
                  padding: "8px 12px", width: "100%", outline: "none", fontSize: 13,
                  background: "var(--bg-card)", color: "var(--text-primary)",
                }}
              />
            </div>
          </div>

          {/* Section 2: Patient demographics details */}
          <div className={styles.sectionBox} style={{ display: "grid", gridTemplateColumns: "repeat(3, 1fr)", gap: 14 }}>
            {[
              { label: "Patient Name", value: patLoading ? "Loading..." : patInfo.PttName || "—" },
              { label: "Allotted Bed", value: patLoading ? "Loading..." : patInfo.BedName ? `${patInfo.WrdName} / ${patInfo.BedName}` : "—" },
              { label: "Consultant Doctor", value: patLoading ? "Loading..." : patInfo.DctName || "—" },
              { label: "Category / Scheme", value: patLoading ? "Loading..." : patInfo.PcgName ? `${patInfo.PcgName} (${patInfo.Scheme || "—"})` : "—" },
              { label: "Sex / Age", value: patLoading ? "Loading..." : patInfo.PttSex ? `${patInfo.PttSex} / ${patInfo.Age || "—"}` : "—" },
              { label: "UHID No", value: patLoading ? "Loading..." : patInfo.PttRegNo || "—" },
            ].map((d, i) => (
              <div key={i} style={{ display: "flex", flexDirection: "column", gap: 4 }}>
                <span style={{ fontSize: 11, color: "var(--text-secondary)", fontWeight: 500 }}>{d.label}</span>
                <strong style={{ fontSize: 13, color: "var(--text-primary)", fontWeight: 600 }}>{d.value}</strong>
              </div>
            ))}
          </div>

          {/* Section 3: Details grid */}
          <div className={styles.sectionBox} style={{ padding: 0 }}>
            <div style={{
              padding: "12px 20px", borderBottom: "1px solid var(--border-light)",
              display: "flex", justifyContent: "space-between", alignItems: "center",
              background: "var(--bg-secondary)",
            }}>
              <span style={{ fontSize: 13, fontWeight: 700 }}>Stay & Services Charge Lines</span>
              <div style={{ display: "flex", gap: 8 }}>
                <button
                  id="btn-auto-stays"
                  className={styles.secondaryBtn}
                  onClick={triggerAutoStays}
                  disabled={calculatingStays || !patInfo.IhdCode}
                  style={{ gap: 6, fontSize: 12, background: "var(--accent-light)", color: "var(--accent-color)" }}
                >
                  {calculatingStays ? <RefreshCw size={13} className="animate-spin" /> : <Sparkles size={13} />}
                  Auto Calculate Stays
                </button>
                <button
                  id="btn-add-line"
                  className={styles.secondaryBtn}
                  onClick={addRow}
                  style={{ gap: 6, fontSize: 12 }}
                >
                  <Plus size={13} /> Add Charge Line
                </button>
              </div>
            </div>

            <div className={styles.tableContainer} style={{ overflowX: "auto" }}>
              <table className={styles.table} style={{ fontSize: 12, minWidth: 840 }}>
                <thead>
                  <tr>
                    <th style={{ width: 140 }}>Category Group</th>
                    <th style={{ width: 220 }}>Service Name</th>
                    <th style={{ width: 60, textAlign: "right" }}>Qty</th>
                    <th style={{ width: 80, textAlign: "right" }}>Rate</th>
                    <th style={{ width: 60, textAlign: "right" }}>Disc %</th>
                    <th style={{ width: 90, textAlign: "right" }}>Amount</th>
                    <th>Billing Remarks</th>
                    <th style={{ width: 44 }}></th>
                  </tr>
                </thead>
                <tbody>
                  {gridRows.map((r) => (
                    <tr key={r._key} style={{ background: r.IbsCode ? "#f8fafc" : undefined }}>
                      <td>
                        {r.IbsCode ? (
                          <span style={{ fontSize: 11, fontWeight: 700, color: "var(--accent-color)", background: "var(--accent-light)", padding: "2px 6px", borderRadius: 4 }}>
                            WARD STAY
                          </span>
                        ) : (
                          <select
                            value={r.SgpCode}
                            onChange={e => updateRow(r._key, "SgpCode", e.target.value)}
                            style={{ width: "100%", padding: 4, borderRadius: 4, border: "1px solid var(--border-light)", background: "var(--bg-card)", color: "var(--text-primary)" }}
                          >
                            <option value="">— Select —</option>
                            {groups.map(g => <option key={g.SgpCode} value={g.SgpCode}>{g.SgpName}</option>)}
                          </select>
                        )}
                      </td>
                      <td>
                        {r.IbsCode ? (
                          <strong style={{ fontSize: 12 }}>{r.SrvName}</strong>
                        ) : (
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
                        )}
                      </td>
                      <td>
                        <input
                          type="text"
                          value={r.Qty}
                          onChange={e => updateRow(r._key, "Qty", e.target.value)}
                          disabled={!!r.IbsCode}
                          style={{ width: "100%", textAlign: "right", padding: 4, borderRadius: 4, border: "1px solid var(--border-light)", background: "var(--bg-card)", color: "var(--text-primary)" }}
                        />
                      </td>
                      <td>
                        <input
                          type="text"
                          value={r.Rate}
                          onChange={e => updateRow(r._key, "Rate", e.target.value)}
                          disabled={!!r.IbsCode}
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
                        {fmtAmt(r.Amount)}
                      </td>
                      <td>
                        <input
                          type="text"
                          value={r.Remark}
                          onChange={e => updateRow(r._key, "Remark", e.target.value)}
                          placeholder="Line comments"
                          style={{ width: "100%", padding: 4, borderRadius: 4, border: "1px solid var(--border-light)", background: "var(--bg-card)", color: "var(--text-primary)" }}
                        />
                      </td>
                      <td>
                        <button
                          className={styles.secondaryBtn}
                          onClick={() => deleteRow(r._key)}
                          style={{ padding: 4, color: "var(--status-danger)", opacity: r.IbsCode ? 0.4 : 1 }}
                          disabled={!!r.IbsCode}
                        >
                          <Trash2 size={13} />
                        </button>
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          </div>
        </div>

        {/* Right billing totals panel */}
        <div style={{ display: "flex", flexDirection: "column", gap: 20 }}>
          
          {/* Patient Discharge section */}
          <div className={styles.sectionBox} style={{ display: "flex", flexDirection: "column", gap: 12 }}>
            <div style={{ display: "flex", alignItems: "center", gap: 8 }}>
              <input
                id="chk-discharge"
                type="checkbox"
                checked={dischargePatient}
                onChange={e => setDischargePatient(e.target.checked)}
                style={{ width: 16, height: 16, cursor: "pointer" }}
              />
              <label htmlFor="chk-discharge" style={{ fontSize: 13, fontWeight: 700, cursor: "pointer", display: "flex", alignItems: "center", gap: 4 }}>
                <LogOut size={14} style={{ color: "var(--status-danger)" }} />
                Discharge Bed Stay?
              </label>
            </div>
            
            {dischargePatient && (
              <div style={{ display: "flex", flexDirection: "column", gap: 10, borderTop: "1px solid var(--border-light)", paddingTop: 10 }}>
                <div>
                  <label style={{ display: "block", fontSize: 11, fontWeight: 600, color: "var(--text-secondary)", marginBottom: 4 }}>Discharge Date</label>
                  <input
                    id="inp-discharge-date"
                    type="date"
                    value={dischargeDate}
                    onChange={e => setDischargeDate(e.target.value)}
                    style={{ width: "100%", padding: "6px 10px", borderRadius: 6, border: "1px solid var(--border-light)", background: "var(--bg-card)", color: "var(--text-primary)", fontSize: 12 }}
                  />
                </div>
                <div>
                  <label style={{ display: "block", fontSize: 11, fontWeight: 600, color: "var(--text-secondary)", marginBottom: 4 }}>Discharge Time (HH:MM)</label>
                  <input
                    id="inp-discharge-time"
                    type="text"
                    value={dischargeTime}
                    onChange={e => setDischargeTime(e.target.value)}
                    placeholder="HH:MM"
                    style={{ width: "100%", padding: "6px 10px", borderRadius: 6, border: "1px solid var(--border-light)", background: "var(--bg-card)", color: "var(--text-primary)", fontSize: 12 }}
                  />
                </div>
              </div>
            )}
          </div>

          {/* Pricing settlements */}
          <div className={styles.sectionBox} style={{ display: "flex", flexDirection: "column", gap: 14 }}>
            <h3 style={{ fontSize: 14, fontWeight: 700, margin: 0 }}>Calculation Breakdown</h3>
            
            <div style={{ display: "flex", flexDirection: "column", gap: 10, fontSize: 13 }}>
              
              <div style={{ display: "flex", justifyContent: "space-between" }}>
                <span style={{ color: "var(--text-secondary)" }}>Gross Charges Total:</span>
                <span style={{ fontWeight: 600 }}>{fmtAmt(grossTot)}</span>
              </div>

              <div style={{ display: "flex", justifyContent: "space-between", alignItems: "center" }}>
                <span style={{ color: "var(--text-secondary)" }}>Bill Discount %:</span>
                <input
                  id="inp-discount"
                  type="text"
                  value={discountPer}
                  onChange={e => setDiscountPer(e.target.value)}
                  style={{ width: 70, textAlign: "right", padding: "4px 8px", borderRadius: 6, border: "1px solid var(--border-light)", background: "var(--bg-card)", color: "var(--text-primary)", fontSize: 12 }}
                />
              </div>

              <div style={{ display: "flex", justifyContent: "space-between" }}>
                <span style={{ color: "var(--text-secondary)" }}>Discount Amount:</span>
                <span style={{ color: "var(--status-danger)", fontWeight: 600 }}>-{fmtAmt(discAmt)}</span>
              </div>

              <div style={{ width: "100%", height: 1, background: "var(--border-light)" }} />

              <div style={{ display: "flex", justifyContent: "space-between", fontSize: 14, fontWeight: 700 }}>
                <span>Net Total:</span>
                <span>{fmtAmt(netTotal)}</span>
              </div>

              <div style={{ display: "flex", justifyContent: "space-between", color: "var(--status-success)" }}>
                <span>Advance Deposits Adjusted:</span>
                <span>-{fmtAmt(advancePaid)}</span>
              </div>

              <div style={{ display: "flex", justifyContent: "space-between", color: "var(--status-danger)" }}>
                <span>Refunds Processed:</span>
                <span>+{fmtAmt(refundPaid)}</span>
              </div>

              {priorBilled > 0 && (
                <div style={{ display: "flex", justifyContent: "space-between", color: "var(--text-muted)", fontSize: 11, fontStyle: "italic" }}>
                  <span>Prior Invoices Summary:</span>
                  <span>{fmtAmt(priorBilled)}</span>
                </div>
              )}

              <div style={{ width: "100%", height: 1, background: "var(--border-light)" }} />

              <div style={{
                display: "flex", justifyContent: "space-between", fontSize: 15, fontWeight: 800,
                color: balDue > 0 ? "var(--status-danger)" : "var(--status-success)",
              }}>
                <span>{balDue > 0 ? "Outstanding Due:" : "Refund Surplus:"}</span>
                <span>{fmtAmt(Math.abs(balDue))}</span>
              </div>
            </div>

            <div>
              <label style={{ display: "block", fontSize: 11, fontWeight: 600, color: "var(--text-secondary)", marginBottom: 6 }}>Remarks</label>
              <textarea
                id="inp-remark"
                value={remark}
                onChange={e => setRemark(e.target.value)}
                placeholder="Settlement remarks..."
                style={{ width: "100%", height: 60, padding: 8, borderRadius: 6, border: "1px solid var(--border-light)", background: "var(--bg-card)", color: "var(--text-primary)", resize: "none", fontSize: 12 }}
              />
            </div>

            <button
              id="btn-save-bill"
              className={styles.primaryBtn}
              onClick={handleSave}
              disabled={saving || !patInfo.IhdCode}
              style={{ width: "100%", gap: 8, height: 42, display: "flex", justifyContent: "center", fontWeight: 700 }}
            >
              {saving ? <RefreshCw size={16} className="animate-spin" /> : <Save size={16} />}
              Save & Commit Invoice
            </button>
          </div>
        </div>
      </div>
    </div>
  );
}
