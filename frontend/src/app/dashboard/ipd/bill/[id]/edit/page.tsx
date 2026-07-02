"use client";

import React, { useEffect, useState, useCallback, useRef } from "react";
import { useRouter, useParams } from "next/navigation";
import styles from "../../../../../dashboard.module.css";
import {
  ArrowLeft, Save, Plus, Trash2, RefreshCw,
  User, AlertCircle, CheckCircle, Search, Calendar,
  Clock, IndianRupee, FileText, Sparkles, CheckSquare, LogOut,
} from "lucide-react";

const API     = "http://127.0.0.1:8000/api/ipd";
const MASTERS = "http://127.0.0.1:8000/api/masters";

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
    _key: uid(),
    IbsCode: null,
    SgpCode: "",
    SgpName: "",
    SrvCode: "",
    SrvName: "",
    Qty: "1",
    Rate: "0.00",
    DiscPer: "0.00",
    Amount: 0,
    Remark: "",
    IbbsFromDate: "",
    IbbsFromTime: 0,
    IbbsToDate: "",
    IbbsToTime: 0
  };
}

const EMPTY_PAT: PatientInfo = {
  IhdCode: 0, IhdVchNo: 0, PttCode: null, PttName: "", PttRegNo: null,
  PttSex: "", Age: "", DctCode: null, DctName: "",
  WrdName: "", BedName: "", PcgName: "", Scheme: "",
};

export default function EditIPDBillPage() {
  const router = useRouter();
  const params = useParams();
  const id = params?.id;

  // Lookups
  const [groups, setGroups]           = useState<ServiceGroup[]>([]);
  const [allItems, setAllItems]       = useState<ServiceItem[]>([]);

  // Patient / Ledger
  const [patInfo, setPatInfo]         = useState<PatientInfo>(EMPTY_PAT);
  const [patLoading, setPatLoading]   = useState(false);
  const [advancePaid, setAdvancePaid] = useState(0.0);
  const [refundPaid, setRefundPaid]   = useState(0.0);
  const [priorBilled, setPriorBilled] = useState(0.0);

  // Billing inputs
  const [billDate, setBillDate]       = useState("");
  const [billTime, setBillTime]       = useState("12:00");
  const [discountPer, setDiscountPer] = useState("0.00");
  const [remark, setRemark]           = useState("");

  // Patient Discharge block
  const [dischargePatient, setDischargePatient] = useState(false);
  const [dischargeDate, setDischargeDate]       = useState("");
  const [dischargeTime, setDischargeTime]       = useState("12:00");

  // Grid
  const [gridRows, setGridRows]       = useState<GridRow[]>([]);
  const [loading, setLoading]         = useState(true);
  const [calculatingStays, setCalculatingStays] = useState(false);

  // Actions
  const [saving, setSaving]           = useState(false);
  const [toast, setToast]             = useState<{ msg: string; ok: boolean } | null>(null);

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

  // Fetch Invoice Details
  const loadInvoice = useCallback(async () => {
    if (!id) return;
    setLoading(true);
    try {
      const res = await fetch(`${API}/charges/${id}`);
      if (!res.ok) throw new Error("Invoice details failed");
      const data = await res.json();
      
      const hdr = data.header;
      setBillDate(hdr.Date);
      setDiscountPer(hdr.IbhDiscPer ? hdr.IbhDiscPer.toFixed(2) : "0.00");
      setRemark(hdr.Remark || "");
      
      // Load patient details & finances
      await loadPatientDetails(hdr.IhdCode);

      // Map line items
      const lines: GridRow[] = data.lines.map((l: any) => ({
        _key:         uid(),
        IbsCode:      l.IbsCode || null,
        SgpCode:      l.SgpCode || "",
        SgpName:      l.SgpName || "",
        SrvCode:      l.SrvCode || "",
        SrvName:      l.SrvName || "",
        Qty:          String(l.Qty),
        Rate:         parseFloat(l.Rate).toFixed(2),
        DiscPer:      parseFloat(l.DiscPer).toFixed(2),
        Amount:       l.NetAmt,
        Remark:       l.Remark || "",
        IbbsFromDate: l.IbbsFromDate || "",
        IbbsFromTime: l.IbbsFromTime || 0,
        IbbsToDate:   l.IbbsToDate || "",
        IbbsToTime:   l.IbbsToTime || 0,
      }));

      setGridRows(lines.length ? lines : []);
    } catch {
      showToast("Failed to load invoice records from server.", false);
    } finally {
      setLoading(false);
    }
  }, [id]);

  useEffect(() => {
    if (groups.length && allItems.length) {
      loadInvoice();
    }
  }, [groups, allItems, loadInvoice]);

  // Load Patient Detail & Financial Ledger history
  async function loadPatientDetails(ihdCode: number) {
    setPatLoading(true);
    try {
      const infoRes = await fetch(`${API}/charges/patient-info/${ihdCode}`);
      if (!infoRes.ok) throw new Error("Patient details failed");
      const info: PatientInfo = await infoRes.json();
      setPatInfo(info);

      const ledgerRes = await fetch(`${API}/registrations/${ihdCode}/linked-trans`);
      if (ledgerRes.ok) {
        const ledger = await ledgerRes.json();
        const totalAdv = ledger.advances?.reduce((sum: number, a: any) => sum + (a.amount || 0), 0) || 0;
        const totalRef = ledger.refunds?.reduce((sum: number, r: any) => sum + (r.amount || 0), 0) || 0;
        
        // Compute prior billed total excluding this active invoice bill
        const totalBill = ledger.bills?.filter((b: any) => b.code !== Number(id))
          .reduce((sum: number, b: any) => sum + (b.total || 0), 0) || 0;
        
        setAdvancePaid(totalAdv);
        setRefundPaid(totalRef);
        setPriorBilled(totalBill);
      }
    } catch {
      showToast("Error loading patient billing records.", false);
    } finally {
      setPatLoading(false);
    }
  }

  // Calculate Bed Stays API trigger
  async function triggerAutoStays() {
    if (!patInfo.IhdCode) return;
    setCalculatingStays(true);
    try {
      const res = await fetch(`${API}/billing/${patInfo.IhdCode}/calculate-bed-charges`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ bill_date: billDate, bill_time: billTime }),
      });
      if (!res.ok) throw new Error("Stay calculations failed");
      const stays = await res.json();
      
      if (!stays || stays.length === 0) {
        showToast("No active stay days pending calculations.", true);
        return;
      }

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

      // Filter out existing stay segment items to avoid duplication on recalculation
      setGridRows(prev => {
        const manualRows = prev.filter(r => !r.IbsCode);
        return [...stayRows, ...manualRows];
      });
      showToast("Stays recalculated successfully!");
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
    if (gridRows.filter(r => r.SrvCode !== "").length === 0) {
      showToast("Invoice must contain at least one stay or service charge row.", false);
      return;
    }

    setSaving(true);
    try {
      const token = localStorage.getItem("hms_token");
      
      const payload = {
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

      const res = await fetch(`${API}/charges/${id}`, {
        method: "PUT",
        headers: {
          "Content-Type": "application/json",
          Authorization: `Bearer ${token}`,
        },
        body: JSON.stringify(payload),
      });

      if (!res.ok) throw new Error("Failed to update bill");
      showToast("Invoice updated successfully!", true);
      setTimeout(() => router.push("/dashboard/ipd/bill"), 1500);
    } catch {
      showToast("Update failed. Check stay constraints.", false);
    } finally {
      setSaving(false);
    }
  }

  if (loading) {
    return (
      <div style={{ padding: 60, textAlign: "center" }}>
        <RefreshCw size={28} style={{ color: "var(--text-muted)", animation: "spin 1s linear infinite" }} />
        <p style={{ marginTop: 12, color: "var(--text-secondary)", fontSize: 14 }}>Loading invoice settings...</p>
      </div>
    );
  }

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

      {/* Header bar */}
      <div style={{ display: "flex", alignItems: "center", gap: 12 }}>
        <button className={styles.secondaryBtn} style={{ padding: 8 }} onClick={() => router.push("/dashboard/ipd/bill")}>
          <ArrowLeft size={16} />
        </button>
        <div>
          <h2 style={{ fontSize: 20, fontWeight: 700, margin: 0 }}>Edit Stay Settlement Invoice</h2>
          <p style={{ fontSize: 13, color: "var(--text-secondary)", marginTop: 3 }}>
            Modify stay segments, manual procedures, and discharge ledger for Invoice #{id}.
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
              <input
                type="text"
                value={patInfo.IhdVchNo || ""}
                disabled
                style={{
                  border: "1px solid var(--border-light)", borderRadius: 8,
                  padding: "8px 12px", width: "100%", outline: "none", fontSize: 13,
                  background: "var(--bg-secondary)", color: "var(--text-secondary)",
                }}
              />
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
                  disabled={calculatingStays}
                  style={{ gap: 6, fontSize: 12, background: "var(--accent-light)", color: "var(--accent-color)" }}
                >
                  {calculatingStays ? <RefreshCw size={13} className="animate-spin" /> : <Sparkles size={13} />}
                  Recalculate Stays
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
              disabled={saving}
              style={{ width: "100%", gap: 8, height: 42, display: "flex", justifyContent: "center", fontWeight: 700 }}
            >
              {saving ? <RefreshCw size={16} className="animate-spin" /> : <Save size={16} />}
              Update & Save Invoice
            </button>
          </div>
        </div>
      </div>
    </div>
  );
}
