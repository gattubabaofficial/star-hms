"use client";

import React, { useEffect, useState, useCallback, useRef } from "react";
import styles from "../../../dashboard.module.css";
import Link from "next/link";
import {
  Plus, Pencil, Trash2, Printer, FileText, RefreshCw, Download,
  Search, AlertCircle, CheckCircle, X, ChevronRight, Lock,
  CalendarDays, Clock,
} from "lucide-react";

const API = "http://127.0.0.1:8000/api/opd";

// ─── Types ────────────────────────────────────────────────────────────────────
interface ConsultRow {
  OpgCode:   number;
  OpdNo:     string;
  VchNo:     string;
  Token:     number;
  Date:      string;
  Time:      string;
  PttCode:   number | null;
  PttRegNo:  number | null;
  PttName:   string;
  AgeGender: string;
  Consultant: string;
  DctName:   string;
  Department: string;
  BillAmt:   number;
  DiscAmt:   number;
  NetAmt:    number;
  PaidAmt:   number;
  DueAmt:    number;
  Status:    string;
  User:      string;
}

interface PatientLookup {
  PttCode:   number;
  PttRegNo:  number | null;
  PttName:   string;
  PttSex:    string;
  PttDob:    string;
  Age:       string;
  PttAddr:   string;
  PttAraName: string;
  PttTelNo:  string;
  PttEmail:  string;
  PttRefName: string;
  PttRefRela: string;
  PttSMSNo:  string;
  PcgCode:   number | null;
  PcgName:   string;
}

interface DoctorLookup {
  DctCode:   number;
  DctName:   string;
  DctSpeci:  string;
  DctOpdChg: number;
}

interface PatCatg {
  PcgCode:   number;
  PcgName:   string;
  PcgDiscPer: number;
}

interface FormState {
  OpgCode:    number | null;
  OpgPttCode: number | null;
  PttName:    string;
  PttSex:     string;
  PttDob:     string;
  Age:        string;
  PttTelNo:   string;
  PttEmail:   string;
  PttAddr:    string;
  PttAraName: string;
  PttRefName: string;
  PttRefRela: string;
  PttSMSNo:   string;
  OpgDate:    string;
  OpgTime:    string;
  OpgCDctCode: number | null;
  OpgRByCode: number | null;
  PcgCode:    number | null;
  PcgName:    string;
  Scheme:     string;
  ClaimId:    string;
  VisitType:  string;
  Appointment: string;
  Priority:   string;
  OpgRate:    number;
  OpgDiscPer: number;
  DiscAmt:    number;
  NetAmt:     number;
  PaidAmt:    number;
  DueAmt:     number;
  PayMode:    string;
  OpgRemark:  string;
}

// ─── Helpers ──────────────────────────────────────────────────────────────────
function fmtDate(d: string) {
  if (!d) return "—";
  try {
    const [y, m, day] = d.split("-");
    return `${day}-${m}-${y}`;
  } catch { return d; }
}

function fmtAmt(n: number) {
  return (n || 0).toLocaleString("en-IN", { minimumFractionDigits: 2, maximumFractionDigits: 2 });
}

function statusBadge(s: string) {
  const map: Record<string, { bg: string; color: string }> = {
    Paid:    { bg: "#dcfce7", color: "#16a34a" },
    Partial: { bg: "#fef9c3", color: "#ca8a04" },
    Unpaid:  { bg: "#fee2e2", color: "#dc2626" },
    Free:    { bg: "#ede9fe", color: "#7c3aed" },
  };
  const c = map[s] || { bg: "#f1f5f9", color: "#64748b" };
  return (
    <span style={{
      background: c.bg, color: c.color,
      padding: "2px 9px", borderRadius: 20, fontSize: 11, fontWeight: 700,
      letterSpacing: "0.3px", whiteSpace: "nowrap",
    }}>{s || "—"}</span>
  );
}

const today = new Date().toISOString().slice(0, 10);
const firstOfMonth = new Date(new Date().getFullYear(), new Date().getMonth(), 1).toISOString().slice(0, 10);

const BLANK_FORM: FormState = {
  OpgCode: null, OpgPttCode: null,
  PttName: "", PttSex: "", PttDob: "", Age: "",
  PttTelNo: "", PttEmail: "", PttAddr: "", PttAraName: "",
  PttRefName: "", PttRefRela: "", PttSMSNo: "",
  OpgDate: today, OpgTime: "",
  OpgCDctCode: null, OpgRByCode: null,
  PcgCode: null, PcgName: "", Scheme: "", ClaimId: "",
  VisitType: "New Visit", Appointment: "Yes", Priority: "Normal",
  OpgRate: 0, OpgDiscPer: 0, DiscAmt: 0, NetAmt: 0, PaidAmt: 0, DueAmt: 0,
  PayMode: "Cash", OpgRemark: "",
};

// ─── OPD Navigation panel items ───────────────────────────────────────────────
const OPD_NAV = [
  { label: "OPD Consultation / Registration",            href: "/dashboard/opd/consultation", active: true },
  { label: "OPD Consultation Due Payment",               href: "/dashboard/opd/consultation-due" },
  { label: "OPD Consultation Refund",                    href: "/dashboard/opd/consultation-refund" },
  { label: "OPD Appointment",                            href: "/dashboard/opd/appointment" },
  { label: "OPD Receipt / Procedures / Diagnostic Charges", href: "/dashboard/opd/receipt-charges" },
  { label: "OPD Receipt Due Payment",                    href: "/dashboard/opd/receipt-due" },
  { label: "OPD Receipt Refund",                         href: "/dashboard/opd/receipt-refund" },
  { label: "OPD Casual Bill",                            href: "/dashboard/opd/casual-bill" },
  { label: "OPD Casual Bill Payment",                    href: "/dashboard/opd/casual-bill-payment" },
  { label: "OPD Casual Bill Refund",                     href: "/dashboard/opd/casual-bill-refund" },
  { label: "Outdoor Clinical History",                   href: "/dashboard/opd/clinical-history" },
];

const OPD_FORMS = [
  "OPD Consultation (Summary) – OPD_List.frm",
  "OPD Consultation Entry – OPD_Entry.frm",
  "OPD Consultation Due Payment – OPDDuePay.frm",
  "OPD Consultation Refund – OPDRefund.frm",
  "OPD Appointment – OPDAppoint.frm",
  "OPD Receipts / Procedures – OPDRec.frm",
  "OPD Receipt Due Payment – OPDRecDuePay.frm",
  "OPD Receipt Refund – OPDRecRefund.frm",
  "OPD Casual Bill – OPDCasualBill.frm",
  "OPD Casual Bill Payment – OPDCasualBillPay.frm",
  "OPD Casual Bill Refund – OPDCasualBillRefund.frm",
  "Outdoor Clinical History – OPDClinicalHistory.frm",
];

// ─── Component ────────────────────────────────────────────────────────────────
export default function OPDConsultationPage() {
  // ── Master lists ────────────────────────────────────────────────────────────
  const [doctors, setDoctors]    = useState<DoctorLookup[]>([]);
  const [patCatgs, setPatCatgs]  = useState<PatCatg[]>([]);

  // ── List state ──────────────────────────────────────────────────────────────
  const [rows, setRows]         = useState<ConsultRow[]>([]);
  const [loading, setLoading]   = useState(false);
  const [selected, setSelected] = useState<number | null>(null);

  // ── Filters ─────────────────────────────────────────────────────────────────
  const [search, setSearch]         = useState("");
  const [opdNoFilter, setOpdNoFilter] = useState("");
  const [startDate, setStartDate]   = useState(today);
  const [endDate, setEndDate]       = useState(today);
  const [dctFilter, setDctFilter]   = useState<number | "">("");
  const [statusFilter, setStatusFilter] = useState("All");

  // ── Form state ──────────────────────────────────────────────────────────────
  const [form, setForm]               = useState<FormState>(BLANK_FORM);
  const [formMode, setFormMode]       = useState<"add" | "edit" | null>(null);
  const [saving, setSaving]           = useState(false);
  const [deleting, setDeleting]       = useState(false);
  const [showDelConfirm, setShowDelConfirm] = useState(false);

  // ── Patient search ──────────────────────────────────────────────────────────
  const [pttSearch, setPttSearch]       = useState("");
  const [pttResults, setPttResults]     = useState<PatientLookup[]>([]);
  const [showPttDropdown, setShowPttDropdown] = useState(false);
  const pttRef = useRef<HTMLDivElement>(null);

  // ── Toast ────────────────────────────────────────────────────────────────────
  const [toast, setToast] = useState<{ msg: string; ok: boolean } | null>(null);

  function showToast(msg: string, ok = true) {
    setToast({ msg, ok });
    setTimeout(() => setToast(null), 4000);
  }

  // ── Load masters ─────────────────────────────────────────────────────────────
  useEffect(() => {
    Promise.all([
      fetch(`${API}/lookup/doctors`).then(r => r.json()),
      fetch(`${API}/lookup/patient-categories`).then(r => r.json()),
    ]).then(([d, p]) => {
      setDoctors(d);
      setPatCatgs(p);
    }).catch(() => {});
  }, []);

  // ── Fetch list ───────────────────────────────────────────────────────────────
  const fetchRows = useCallback(async () => {
    setLoading(true);
    setSelected(null);
    try {
      const params = new URLSearchParams();
      if (startDate) params.set("start_date", startDate);
      if (endDate)   params.set("end_date", endDate);
      if (search)    params.set("search", search);
      if (opdNoFilter) params.set("opd_no", opdNoFilter);
      if (dctFilter)   params.set("dct_code", String(dctFilter));
      if (statusFilter && statusFilter !== "All") params.set("status", statusFilter);

      const res = await fetch(`${API}/consultations?${params}`);
      if (!res.ok) throw new Error("Failed");
      setRows(await res.json());
    } catch {
      showToast("Failed to load consultations.", false);
    } finally {
      setLoading(false);
    }
  }, [startDate, endDate, search, opdNoFilter, dctFilter, statusFilter]);

  useEffect(() => { fetchRows(); }, [fetchRows]);

  // ── Keyboard shortcuts ───────────────────────────────────────────────────────
  useEffect(() => {
    function onKey(e: KeyboardEvent) {
      if (e.key === "F2") { e.preventDefault(); startAdd(); }
      if (e.key === "F4") { e.preventDefault(); startEdit(); }
      if (e.key === "F8") { e.preventDefault(); if (selected) setShowDelConfirm(true); }
      if (e.key === "F5" && formMode) { e.preventDefault(); handleSave(); }
      if (e.key === "Escape" && formMode) { e.preventDefault(); cancelForm(); }
    }
    window.addEventListener("keydown", onKey);
    return () => window.removeEventListener("keydown", onKey);
  });

  // ── Patient search dropdown ────────────────────────────────────────────────
  useEffect(() => {
    if (!pttSearch || pttSearch.length < 2) { setPttResults([]); return; }
    const t = setTimeout(async () => {
      try {
        const res = await fetch(`${API}/lookup/patients?search=${encodeURIComponent(pttSearch)}`);
        if (res.ok) { setPttResults(await res.json()); setShowPttDropdown(true); }
      } catch {}
    }, 300);
    return () => clearTimeout(t);
  }, [pttSearch]);

  useEffect(() => {
    function handleClick(e: MouseEvent) {
      if (pttRef.current && !pttRef.current.contains(e.target as Node)) {
        setShowPttDropdown(false);
      }
    }
    document.addEventListener("mousedown", handleClick);
    return () => document.removeEventListener("mousedown", handleClick);
  }, []);

  function selectPatient(p: PatientLookup) {
    const pcg = patCatgs.find(c => c.PcgCode === p.PcgCode);
    setForm(prev => ({
      ...prev,
      OpgPttCode: p.PttCode,
      PttName: p.PttName,
      PttSex: p.PttSex,
      PttDob: p.PttDob,
      Age: p.Age,
      PttTelNo: p.PttTelNo,
      PttEmail: p.PttEmail,
      PttAddr: p.PttAddr,
      PttAraName: p.PttAraName,
      PttRefName: p.PttRefName,
      PttRefRela: p.PttRefRela,
      PttSMSNo: p.PttSMSNo,
      PcgCode: p.PcgCode,
      PcgName: p.PcgName,
      Scheme: pcg?.PcgName || "",
    }));
    setPttSearch(`${p.PttName} (UHID: ${p.PttRegNo})`);
    setShowPttDropdown(false);
    if (pcg) recalcBilling({}, pcg.PcgDiscPer);
  }

  function recalcBilling(overrides: Partial<FormState> = {}, forcedDiscPer?: number) {
    setForm(prev => {
      const merged = { ...prev, ...overrides };
      const rate    = merged.OpgRate || 0;
      const discPer = forcedDiscPer !== undefined ? forcedDiscPer : merged.OpgDiscPer || 0;
      const disc    = Math.round((rate * discPer / 100) * 100) / 100;
      const net     = Math.round((rate - disc) * 100) / 100;
      return { ...merged, OpgDiscPer: discPer, DiscAmt: disc, NetAmt: net, PaidAmt: net, DueAmt: 0 };
    });
  }

  // ── Doctor selection → rate auto-fill ────────────────────────────────────
  function onDoctorChange(dctCode: number | null) {
    const dct = doctors.find(d => d.DctCode === dctCode);
    setForm(prev => {
      const rate = dct?.DctOpdChg || prev.OpgRate;
      const disc = Math.round((rate * (prev.OpgDiscPer || 0) / 100) * 100) / 100;
      const net  = rate - disc;
      return { ...prev, OpgCDctCode: dctCode, OpgRate: rate, DiscAmt: disc, NetAmt: net, PaidAmt: net, DueAmt: 0 };
    });
  }

  // ── Form operations ───────────────────────────────────────────────────────
  function startAdd() {
    setForm({ ...BLANK_FORM, OpgDate: today });
    setPttSearch("");
    setPttResults([]);
    setFormMode("add");
    setTimeout(() => document.getElementById("ptt-search-input")?.focus(), 100);
  }

  function startEdit() {
    if (!selected) return;
    const row = rows.find(r => r.OpgCode === selected);
    if (!row) return;
    setForm({
      OpgCode: row.OpgCode,
      OpgPttCode: row.PttCode,
      PttName: row.PttName,
      PttSex: row.AgeGender.split(" / ")[1] || "",
      PttDob: "", Age: row.AgeGender.split(" / ")[0] || "",
      PttTelNo: "", PttEmail: "", PttAddr: "", PttAraName: "",
      PttRefName: "", PttRefRela: "", PttSMSNo: "",
      OpgDate: row.Date,
      OpgTime: row.Time,
      OpgCDctCode: row.DctName ? (doctors.find(d => d.DctName === row.DctName)?.DctCode || null) : null,
      OpgRByCode: null,
      PcgCode: null, PcgName: "", Scheme: "", ClaimId: "",
      VisitType: "Follow-up", Appointment: "Yes", Priority: "Normal",
      OpgRate: row.BillAmt,
      OpgDiscPer: row.BillAmt > 0 ? Math.round((row.DiscAmt / row.BillAmt) * 100) : 0,
      DiscAmt: row.DiscAmt,
      NetAmt: row.NetAmt,
      PaidAmt: row.PaidAmt,
      DueAmt: row.DueAmt,
      PayMode: "Cash",
      OpgRemark: row.User,
    });
    setPttSearch(`${row.PttName} (UHID: ${row.PttRegNo})`);
    setFormMode("edit");
  }

  function cancelForm() {
    setFormMode(null);
    setForm(BLANK_FORM);
    setPttSearch("");
  }

  async function handleSave(saveAndNew = false) {
    if (!form.OpgPttCode) { showToast("Please select a patient.", false); return; }
    if (!form.OpgCDctCode) { showToast("Please select a doctor.", false); return; }
    setSaving(true);
    try {
      const token = localStorage.getItem("token") || localStorage.getItem("hms_token");
      const payload = {
        OpgPttCode: form.OpgPttCode,
        OpgCDctCode: form.OpgCDctCode,
        OpgRByCode: form.OpgRByCode || null,
        OpgDate: form.OpgDate,
        OpgTime: form.OpgTime
          ? parseInt(form.OpgTime.split(":")[0]) * 60 + parseInt(form.OpgTime.split(":")[1] || "0")
          : 0,
        OpgRate: form.OpgRate,
        OpgUnit: 1,
        OpgDiscPer: form.OpgDiscPer,
        OpgRemark: form.OpgRemark,
      };

      let url = `${API}/consultations`;
      let method = "POST";
      if (formMode === "edit" && form.OpgCode) {
        url = `${API}/consultations/${form.OpgCode}`;
        method = "PUT";
      }

      const res = await fetch(url, {
        method,
        headers: { "Content-Type": "application/json", Authorization: `Bearer ${token}` },
        body: JSON.stringify(payload),
      });
      if (!res.ok) { const e = await res.json(); throw new Error(e.detail || "Save failed"); }

      showToast(formMode === "edit" ? "Record updated." : "Registration saved.");
      await fetchRows();
      if (saveAndNew) {
        startAdd();
      } else {
        cancelForm();
      }
    } catch (err: any) {
      showToast(err.message || "Save failed.", false);
    } finally {
      setSaving(false);
    }
  }

  async function handleDelete() {
    if (!selected) return;
    setDeleting(true);
    try {
      const token = localStorage.getItem("token") || localStorage.getItem("hms_token");
      const res = await fetch(`${API}/consultations/${selected}`, {
        method: "DELETE",
        headers: { Authorization: `Bearer ${token}` },
      });
      if (!res.ok) throw new Error("Delete failed");
      showToast("Record deleted.");
      setShowDelConfirm(false);
      setSelected(null);
      cancelForm();
      fetchRows();
    } catch {
      showToast("Delete failed.", false);
    } finally {
      setDeleting(false);
    }
  }

  function handleExport() {
    const headers = ["OPD No","Voucher","Date","Time","Token","UHID","Patient","Age/Gender","Consultant","Doctor","Dept","Bill Amt","Disc","Net Amt","Paid","Due","Status"];
    const csvRows = [
      headers.join(","),
      ...rows.map(r => [
        r.OpdNo, r.VchNo, r.Date, r.Time, r.Token, r.PttRegNo,
        `"${r.PttName}"`, `"${r.AgeGender}"`, `"${r.Consultant}"`,
        `"${r.DctName}"`, `"${r.Department}"`,
        r.BillAmt, r.DiscAmt, r.NetAmt, r.PaidAmt, r.DueAmt, r.Status,
      ].join(",")),
    ];
    const blob = new Blob([csvRows.join("\n")], { type: "text/csv;charset=utf-8;" });
    const a = document.createElement("a"); a.href = URL.createObjectURL(blob);
    a.download = `opd_consultations_${today}.csv`; a.click();
    showToast("Exported to CSV.");
  }

  // ── Totals ──────────────────────────────────────────────────────────────────
  const totalBill = rows.reduce((a, r) => a + r.BillAmt, 0);
  const totalDisc = rows.reduce((a, r) => a + r.DiscAmt, 0);
  const totalNet  = rows.reduce((a, r) => a + r.NetAmt,  0);
  const totalPaid = rows.reduce((a, r) => a + r.PaidAmt, 0);
  const totalDue  = rows.reduce((a, r) => a + r.DueAmt,  0);
  const selectedRow = rows.find(r => r.OpgCode === selected);

  // ── Render ───────────────────────────────────────────────────────────────────
  return (
    <div style={{ display: "flex", gap: 0, minHeight: "100vh" }}>

      {/* ── Toast ─────────────────────────────────────────────────────────────── */}
      {toast && (
        <div style={{
          position: "fixed", top: 20, right: 20, zIndex: 9999,
          background: toast.ok ? "#10b981" : "#ef4444",
          color: "#fff", padding: "12px 20px", borderRadius: 10,
          boxShadow: "0 8px 24px rgba(0,0,0,.18)",
          display: "flex", alignItems: "center", gap: 8,
          fontWeight: 600, fontSize: 13,
        }}>
          {toast.ok ? <CheckCircle size={16}/> : <AlertCircle size={16}/>}
          {toast.msg}
        </div>
      )}

      {/* ── Delete confirm modal ───────────────────────────────────────────────── */}
      {showDelConfirm && (
        <div className={styles.modalOverlay}>
          <div className={styles.modalContent} style={{ maxWidth: 420 }}>
            <div className={styles.modalHeader}>
              <h3 style={{ fontSize: 16, fontWeight: 700 }}>Confirm Delete</h3>
              <button className={styles.closeBtn} onClick={() => setShowDelConfirm(false)}>×</button>
            </div>
            <div className={styles.modalBody}>
              <p style={{ color: "var(--text-secondary)", fontSize: 13, lineHeight: 1.6 }}>
                Delete <strong>{selectedRow?.OpdNo}</strong> for <strong>{selectedRow?.PttName}</strong>?
                <br />This action cannot be undone.
              </p>
            </div>
            <div className={styles.modalFooter}>
              <button className={styles.secondaryBtn} onClick={() => setShowDelConfirm(false)}>Cancel</button>
              <button
                className={styles.primaryBtn}
                style={{ background: "var(--status-danger)", minWidth: 90 }}
                onClick={handleDelete} disabled={deleting}
              >
                {deleting ? <RefreshCw size={13} className="animate-spin"/> : "Delete"}
              </button>
            </div>
          </div>
        </div>
      )}

      {/* ── Main content ──────────────────────────────────────────────────────── */}
      <div style={{ flex: 1, display: "flex", flexDirection: "column", gap: 0, minWidth: 0 }}>

        {/* ── SUMMARY SECTION ─────────────────────────────────────────────────── */}
        <div className={styles.sectionBox} style={{ padding: 0, overflow: "hidden", marginBottom: 12 }}>

          {/* Section title */}
          <div style={{
            padding: "12px 18px",
            background: "var(--bg-card)",
            borderBottom: "1px solid var(--border-light)",
            fontWeight: 700, fontSize: 15, color: "var(--text-primary)",
          }}>
            OPD Consultation / Registration (Summary)
          </div>

          {/* Search / Filter row */}
          <div style={{
            padding: "12px 18px",
            background: "var(--bg-secondary)",
            borderBottom: "1px solid var(--border-light)",
            display: "flex", alignItems: "center", gap: 10, flexWrap: "wrap",
          }}>
            <div style={{ display: "flex", flexDirection: "column", gap: 2, minWidth: 180, flex: 1 }}>
              <label style={{ fontSize: 10, fontWeight: 600, color: "var(--text-muted)", textTransform: "uppercase", letterSpacing: "0.5px" }}>UHID / Patient / Mobile</label>
              <div className={styles.searchBar} style={{ margin: 0 }}>
                <Search size={14} style={{ color: "var(--text-muted)" }}/>
                <input
                  type="text"
                  placeholder="Search patient or UHID..."
                  value={search}
                  onChange={e => setSearch(e.target.value)}
                />
              </div>
            </div>

            <div style={{ display: "flex", flexDirection: "column", gap: 2, minWidth: 140 }}>
              <label style={{ fontSize: 10, fontWeight: 600, color: "var(--text-muted)", textTransform: "uppercase", letterSpacing: "0.5px" }}>OPD No.</label>
              <input
                type="text"
                placeholder="Search OPD No..."
                value={opdNoFilter}
                onChange={e => setOpdNoFilter(e.target.value)}
                style={{ border: "1px solid var(--border-light)", borderRadius: 7, padding: "7px 10px", fontSize: 13, background: "var(--bg-card)", color: "var(--text-primary)", outline: "none" }}
              />
            </div>

            <div style={{ display: "flex", flexDirection: "column", gap: 2 }}>
              <label style={{ fontSize: 10, fontWeight: 600, color: "var(--text-muted)", textTransform: "uppercase", letterSpacing: "0.5px" }}>From Date</label>
              <div style={{ display: "flex", alignItems: "center", gap: 6 }}>
                <CalendarDays size={13} style={{ color: "var(--text-muted)" }}/>
                <input type="date" value={startDate} onChange={e => setStartDate(e.target.value)}
                  style={{ border: "1px solid var(--border-light)", borderRadius: 7, padding: "7px 10px", fontSize: 13, background: "var(--bg-card)", color: "var(--text-primary)", outline: "none" }}/>
              </div>
            </div>

            <div style={{ display: "flex", flexDirection: "column", gap: 2 }}>
              <label style={{ fontSize: 10, fontWeight: 600, color: "var(--text-muted)", textTransform: "uppercase", letterSpacing: "0.5px" }}>To Date</label>
              <div style={{ display: "flex", alignItems: "center", gap: 6 }}>
                <CalendarDays size={13} style={{ color: "var(--text-muted)" }}/>
                <input type="date" value={endDate} onChange={e => setEndDate(e.target.value)}
                  style={{ border: "1px solid var(--border-light)", borderRadius: 7, padding: "7px 10px", fontSize: 13, background: "var(--bg-card)", color: "var(--text-primary)", outline: "none" }}/>
              </div>
            </div>

            <div style={{ display: "flex", flexDirection: "column", gap: 2, minWidth: 150 }}>
              <label style={{ fontSize: 10, fontWeight: 600, color: "var(--text-muted)", textTransform: "uppercase", letterSpacing: "0.5px" }}>Doctor</label>
              <select value={dctFilter} onChange={e => setDctFilter(e.target.value === "" ? "" : Number(e.target.value))}
                style={{ border: "1px solid var(--border-light)", borderRadius: 7, padding: "7px 10px", fontSize: 13, background: "var(--bg-card)", color: "var(--text-primary)", outline: "none" }}>
                <option value="">All</option>
                {doctors.map(d => <option key={d.DctCode} value={d.DctCode}>{d.DctName}</option>)}
              </select>
            </div>

            <div style={{ display: "flex", flexDirection: "column", gap: 2, minWidth: 120 }}>
              <label style={{ fontSize: 10, fontWeight: 600, color: "var(--text-muted)", textTransform: "uppercase", letterSpacing: "0.5px" }}>Status</label>
              <select value={statusFilter} onChange={e => setStatusFilter(e.target.value)}
                style={{ border: "1px solid var(--border-light)", borderRadius: 7, padding: "7px 10px", fontSize: 13, background: "var(--bg-card)", color: "var(--text-primary)", outline: "none" }}>
                {["All","Paid","Partial","Unpaid","Free"].map(s => <option key={s}>{s}</option>)}
              </select>
            </div>

            <div style={{ display: "flex", flexDirection: "column", gap: 2, justifyContent: "flex-end", paddingTop: 16 }}>
              <div style={{ display: "flex", gap: 6 }}>
                <button onClick={fetchRows} className={styles.primaryBtn} style={{ padding: "7px 14px", fontSize: 12, gap: 5 }}>
                  <Search size={13}/> Search
                </button>
                <button onClick={() => { setSearch(""); setOpdNoFilter(""); setStartDate(today); setEndDate(today); setDctFilter(""); setStatusFilter("All"); }}
                  className={styles.secondaryBtn} style={{ padding: "7px 14px", fontSize: 12, gap: 5 }}>
                  <X size={13}/> Clear
                </button>
              </div>
            </div>
          </div>

          {/* Toolbar */}
          <div style={{
            padding: "8px 18px",
            borderBottom: "1px solid var(--border-light)",
            display: "flex", alignItems: "center", gap: 6, flexWrap: "wrap",
          }}>
            <button className={styles.primaryBtn} style={{ padding: "7px 13px", fontSize: 12, gap: 5 }} onClick={startAdd}>
              <Plus size={13}/> Add New (F2)
            </button>
            <button className={styles.secondaryBtn} style={{ padding: "7px 13px", fontSize: 12, gap: 5, opacity: selected ? 1 : 0.5 }}
              disabled={!selected} onClick={startEdit}>
              <Pencil size={13}/> Edit (F4)
            </button>
            <button className={styles.secondaryBtn}
              style={{ padding: "7px 13px", fontSize: 12, gap: 5, opacity: selected ? 1 : 0.5, color: selected ? "var(--status-danger)" : undefined }}
              disabled={!selected} onClick={() => selected && setShowDelConfirm(true)}>
              <Trash2 size={13}/> Delete (F8)
            </button>
            <div style={{ width: 1, height: 24, background: "var(--border-light)", margin: "0 2px" }}/>
            <button className={styles.secondaryBtn} style={{ padding: "7px 13px", fontSize: 12, gap: 5, opacity: selected ? 1 : 0.5 }}
              disabled={!selected}>
              <Printer size={13}/> Print Voucher (F7)
            </button>
            <button className={styles.secondaryBtn} style={{ padding: "7px 13px", fontSize: 12, gap: 5 }}>
              <FileText size={13}/> Print Report
            </button>
            <button className={styles.secondaryBtn} style={{ padding: "7px 13px", fontSize: 12, gap: 5 }} onClick={handleExport}>
              <Download size={13}/> Export to Excel
            </button>
            <button className={styles.secondaryBtn} style={{ padding: "7px 13px", fontSize: 12, gap: 5 }}
              onClick={fetchRows} disabled={loading}>
              <RefreshCw size={13} className={loading ? "animate-spin" : ""}/> Refresh
            </button>
            {selected && (
              <span style={{ marginLeft: "auto", fontSize: 11, color: "var(--text-secondary)", fontStyle: "italic" }}>
                Selected: {selectedRow?.OpdNo} — {selectedRow?.PttName}
              </span>
            )}
          </div>

          {/* Summary table */}
          {loading ? (
            <div style={{ padding: 40, textAlign: "center" }}>
              <RefreshCw size={24} style={{ color: "var(--text-muted)", animation: "spin 1s linear infinite" }}/>
              <p style={{ color: "var(--text-secondary)", fontSize: 13, marginTop: 8 }}>Loading…</p>
            </div>
          ) : (
            <>
              <div className={styles.tableContainer} style={{ maxHeight: 320, overflowY: "auto" }}>
                <table className={styles.table} style={{ fontSize: 12 }}>
                  <thead>
                    <tr>
                      <th style={{ minWidth: 120 }}>OPD No</th>
                      <th style={{ minWidth: 80 }}>Voucher</th>
                      <th style={{ minWidth: 90 }}>Date</th>
                      <th style={{ minWidth: 60 }}>Time</th>
                      <th style={{ minWidth: 50 }}>Token</th>
                      <th style={{ minWidth: 70 }}>UHID</th>
                      <th style={{ minWidth: 130 }}>Patient Name</th>
                      <th style={{ minWidth: 90 }}>Age / Gender</th>
                      <th style={{ minWidth: 120 }}>Consultant</th>
                      <th style={{ minWidth: 120 }}>Doctor</th>
                      <th style={{ minWidth: 100 }}>Department</th>
                      <th style={{ minWidth: 80, textAlign: "right" }}>Bill Amt</th>
                      <th style={{ minWidth: 70, textAlign: "right" }}>Disc (₹)</th>
                      <th style={{ minWidth: 80, textAlign: "right" }}>Net Amt</th>
                      <th style={{ minWidth: 70, textAlign: "right" }}>Paid (₹)</th>
                      <th style={{ minWidth: 60, textAlign: "right" }}>Due (₹)</th>
                      <th style={{ minWidth: 70 }}>Status</th>
                      <th style={{ minWidth: 60 }}>User</th>
                    </tr>
                  </thead>
                  <tbody>
                    {rows.length === 0 ? (
                      <tr>
                        <td colSpan={18} style={{ padding: "40px 0", textAlign: "center", color: "var(--text-secondary)" }}>
                          No records found. Adjust filters or click Add New to create the first consultation.
                        </td>
                      </tr>
                    ) : (
                      rows.map(r => (
                        <tr
                          key={r.OpgCode}
                          onClick={() => setSelected(r.OpgCode === selected ? null : r.OpgCode)}
                          onDoubleClick={() => { setSelected(r.OpgCode); startEdit(); }}
                          style={{
                            cursor: "pointer",
                            background: selected === r.OpgCode ? "var(--accent-light)" : undefined,
                            transition: "background .1s",
                          }}
                        >
                          <td style={{ color: "var(--accent-color)", fontWeight: 700 }}>{r.OpdNo}</td>
                          <td style={{ color: "var(--text-secondary)" }}>{r.VchNo}</td>
                          <td>{fmtDate(r.Date)}</td>
                          <td style={{ color: "var(--text-secondary)" }}>{r.Time || "—"}</td>
                          <td style={{ textAlign: "center" }}>{r.Token}</td>
                          <td style={{ color: "var(--text-secondary)" }}>{r.PttRegNo ?? "—"}</td>
                          <td style={{ fontWeight: 600 }}>{r.PttName}</td>
                          <td style={{ color: "var(--text-secondary)" }}>{r.AgeGender}</td>
                          <td>{r.Consultant || "—"}</td>
                          <td>{r.DctName || "—"}</td>
                          <td style={{ color: "var(--text-secondary)" }}>{r.Department || "—"}</td>
                          <td style={{ textAlign: "right" }}>{fmtAmt(r.BillAmt)}</td>
                          <td style={{ textAlign: "right", color: "var(--status-danger)" }}>
                            {r.DiscAmt > 0 ? `${fmtAmt(r.DiscAmt)}` : "0.00"}
                          </td>
                          <td style={{ textAlign: "right", fontWeight: 700 }}>{fmtAmt(r.NetAmt)}</td>
                          <td style={{ textAlign: "right", color: "var(--status-success)" }}>{fmtAmt(r.PaidAmt)}</td>
                          <td style={{ textAlign: "right", color: r.DueAmt > 0 ? "var(--status-danger)" : "var(--text-secondary)" }}>
                            {fmtAmt(r.DueAmt)}
                          </td>
                          <td>{statusBadge(r.Status)}</td>
                          <td style={{ color: "var(--text-muted)", fontSize: 11 }}>{r.User}</td>
                        </tr>
                      ))
                    )}
                  </tbody>
                </table>
              </div>

              {/* Footer totals */}
              <div style={{
                padding: "10px 18px",
                background: "var(--bg-secondary)",
                borderTop: "1px solid var(--border-light)",
                display: "flex", gap: 24, alignItems: "center",
                fontSize: 12, fontWeight: 600,
              }}>
                <span style={{ color: "var(--text-secondary)" }}>Total Records: {rows.length}</span>
                <span style={{ marginLeft: "auto" }}>
                  Bill: <span style={{ color: "var(--text-primary)" }}>₹{fmtAmt(totalBill)}</span>
                </span>
                <span>
                  Disc: <span style={{ color: "var(--status-danger)" }}>₹{fmtAmt(totalDisc)}</span>
                </span>
                <span>
                  Net: <span style={{ color: "var(--text-primary)", fontSize: 13 }}>₹{fmtAmt(totalNet)}</span>
                </span>
                <span>
                  Paid: <span style={{ color: "var(--status-success)" }}>₹{fmtAmt(totalPaid)}</span>
                </span>
                <span>
                  Due: <span style={{ color: totalDue > 0 ? "var(--status-danger)" : "var(--text-secondary)" }}>₹{fmtAmt(totalDue)}</span>
                </span>
              </div>
            </>
          )}
        </div>

        {/* ── ENTRY FORM SECTION ──────────────────────────────────────────────── */}
        <div className={styles.sectionBox} style={{ padding: 0, overflow: "hidden" }}>
          {/* Form header */}
          <div style={{
            padding: "10px 18px",
            background: "var(--bg-card)",
            borderBottom: "1px solid var(--border-light)",
            display: "flex", alignItems: "center", gap: 12,
          }}>
            <ChevronRight size={16} style={{ color: "var(--accent-color)" }}/>
            <span style={{ fontWeight: 700, fontSize: 14, color: "var(--text-primary)" }}>
              OPD Consultation / Registration Entry
            </span>
            {formMode && (
              <span style={{
                background: formMode === "edit" ? "#fef9c3" : "var(--accent-light)",
                color: formMode === "edit" ? "#ca8a04" : "var(--accent-color)",
                padding: "2px 10px", borderRadius: 20, fontSize: 11, fontWeight: 700,
              }}>
                {formMode === "edit" ? "EDIT MODE" : "NEW ENTRY"}
              </span>
            )}
          </div>

          {!formMode ? (
            <div style={{ padding: "30px", textAlign: "center", color: "var(--text-secondary)", fontSize: 13 }}>
              Click <strong>Add New (F2)</strong> to create a new consultation, or select a row and click <strong>Edit (F4)</strong> to modify.
            </div>
          ) : (
            <div style={{ padding: "16px 18px" }}>
              <div style={{ display: "grid", gridTemplateColumns: "1fr 320px", gap: 20 }}>

                {/* ── Left: Patient + Visit ─────────────────────────────────── */}
                <div style={{ display: "flex", flexDirection: "column", gap: 16 }}>

                  {/* Patient Information */}
                  <fieldset style={{ border: "1px solid var(--border-light)", borderRadius: 8, padding: "12px 16px" }}>
                    <legend style={{ fontSize: 12, fontWeight: 700, color: "var(--accent-color)", padding: "0 6px" }}>Patient Information</legend>

                    <div style={{ display: "grid", gridTemplateColumns: "1fr 2fr 1fr", gap: 10, marginBottom: 10 }}>
                      {/* UHID (patient search) */}
                      <div style={{ position: "relative" }} ref={pttRef}>
                        <label style={labelStyle}>UHID *</label>
                        <div style={{ position: "relative" }}>
                          <input
                            id="ptt-search-input"
                            type="text"
                            value={pttSearch}
                            onChange={e => { setPttSearch(e.target.value); setShowPttDropdown(true); }}
                            placeholder="Search UHID or name..."
                            style={inputStyle}
                          />
                          <Search size={13} style={{ position: "absolute", right: 8, top: "50%", transform: "translateY(-50%)", color: "var(--text-muted)" }}/>
                        </div>
                        {showPttDropdown && pttResults.length > 0 && (
                          <div style={{
                            position: "absolute", top: "100%", left: 0, right: 0, zIndex: 200,
                            background: "var(--bg-card)", border: "1px solid var(--border-light)",
                            borderRadius: 8, boxShadow: "0 8px 24px rgba(0,0,0,.12)",
                            maxHeight: 220, overflowY: "auto",
                          }}>
                            {pttResults.map(p => (
                              <div key={p.PttCode} onClick={() => selectPatient(p)}
                                style={{ padding: "8px 12px", cursor: "pointer", fontSize: 12, borderBottom: "1px solid var(--border-light)" }}
                                onMouseEnter={e => (e.currentTarget.style.background = "var(--bg-secondary)")}
                                onMouseLeave={e => (e.currentTarget.style.background = "")}>
                                <div style={{ fontWeight: 600 }}>{p.PttName} <span style={{ color: "var(--text-muted)" }}>(UHID: {p.PttRegNo})</span></div>
                                <div style={{ color: "var(--text-secondary)", fontSize: 11 }}>{p.PttSex} · {p.Age} yrs · {p.PttTelNo}</div>
                              </div>
                            ))}
                          </div>
                        )}
                      </div>

                      <div>
                        <label style={labelStyle}>Patient Name *</label>
                        <input style={{ ...inputStyle, background: "var(--bg-secondary)", cursor: "default" }} value={form.PttName} readOnly/>
                      </div>

                      <div>
                        <label style={labelStyle}>Age / Gender *</label>
                        <div style={{ display: "grid", gridTemplateColumns: "1fr 1fr", gap: 6 }}>
                          <input style={{ ...inputStyle, background: "var(--bg-secondary)", cursor: "default" }} value={form.Age} readOnly placeholder="Age"/>
                          <select style={selectStyle} value={form.PttSex} onChange={e => setForm(p => ({ ...p, PttSex: e.target.value }))}>
                            <option value="">Sex</option>
                            <option>Male</option>
                            <option>Female</option>
                            <option>Other</option>
                          </select>
                        </div>
                      </div>
                    </div>

                    <div style={{ display: "grid", gridTemplateColumns: "1fr 1fr 1fr 1fr", gap: 10, marginBottom: 10 }}>
                      <div>
                        <label style={labelStyle}>Mobile</label>
                        <input style={{ ...inputStyle, background: "var(--bg-secondary)" }} value={form.PttTelNo} readOnly/>
                      </div>
                      <div>
                        <label style={labelStyle}>E-Mail</label>
                        <input style={{ ...inputStyle, background: "var(--bg-secondary)" }} value={form.PttEmail} readOnly/>
                      </div>
                      <div>
                        <label style={labelStyle}>Blood Group</label>
                        <select style={selectStyle} value="" onChange={() => {}}>
                          <option>—</option>
                          {["A+","A-","B+","B-","AB+","AB-","O+","O-"].map(bg => <option key={bg}>{bg}</option>)}
                        </select>
                      </div>
                      <div>
                        <label style={labelStyle}>Occupation</label>
                        <input style={inputStyle} placeholder="Occupation"/>
                      </div>
                    </div>

                    <div style={{ display: "grid", gridTemplateColumns: "2fr 1fr 1fr 1fr", gap: 10 }}>
                      <div>
                        <label style={labelStyle}>Address</label>
                        <input style={{ ...inputStyle, background: "var(--bg-secondary)" }} value={form.PttAddr} readOnly/>
                      </div>
                      <div>
                        <label style={labelStyle}>Area</label>
                        <input style={{ ...inputStyle, background: "var(--bg-secondary)" }} value={form.PttAraName} readOnly/>
                      </div>
                      <div>
                        <label style={labelStyle}>Guardian Name</label>
                        <input style={{ ...inputStyle, background: "var(--bg-secondary)" }} value={form.PttRefName} readOnly/>
                      </div>
                      <div>
                        <label style={labelStyle}>Relationship</label>
                        <input style={{ ...inputStyle, background: "var(--bg-secondary)" }} value={form.PttRefRela} readOnly/>
                      </div>
                    </div>
                  </fieldset>

                  {/* Visit Information */}
                  <fieldset style={{ border: "1px solid var(--border-light)", borderRadius: 8, padding: "12px 16px" }}>
                    <legend style={{ fontSize: 12, fontWeight: 700, color: "var(--accent-color)", padding: "0 6px" }}>Visit Information</legend>

                    <div style={{ display: "grid", gridTemplateColumns: "1fr 1fr 1fr 1fr 1fr", gap: 10, marginBottom: 10 }}>
                      <div>
                        <label style={labelStyle}>OPD No. *</label>
                        <div style={{ position: "relative" }}>
                          <input style={{ ...inputStyle, background: "var(--bg-secondary)", paddingRight: 28, cursor: "default", fontSize: 11 }}
                            value={form.OpgCode ? `Auto-generated` : "Auto"} readOnly/>
                          <Lock size={11} style={{ position: "absolute", right: 8, top: "50%", transform: "translateY(-50%)", color: "var(--text-muted)" }}/>
                        </div>
                      </div>
                      <div>
                        <label style={labelStyle}>Voucher No.</label>
                        <input style={{ ...inputStyle, background: "var(--bg-secondary)", cursor: "default", fontSize: 11 }} value={form.OpgCode ? `VC-${form.OpgCode}` : "Auto"} readOnly/>
                      </div>
                      <div>
                        <label style={labelStyle}>Date *</label>
                        <input type="date" style={inputStyle} value={form.OpgDate} onChange={e => setForm(p => ({ ...p, OpgDate: e.target.value }))}/>
                      </div>
                      <div>
                        <label style={labelStyle}>Time *</label>
                        <div style={{ position: "relative" }}>
                          <input type="time" style={inputStyle} value={form.OpgTime} onChange={e => setForm(p => ({ ...p, OpgTime: e.target.value }))}/>
                        </div>
                      </div>
                      <div>
                        <label style={labelStyle}>Token No.</label>
                        <input style={{ ...inputStyle, background: "var(--bg-secondary)", cursor: "default" }} value={form.OpgCode ? String(form.OpgCode) : "Auto"} readOnly/>
                      </div>
                    </div>

                    <div style={{ display: "grid", gridTemplateColumns: "1fr 1fr 1fr", gap: 10, marginBottom: 10 }}>
                      <div>
                        <label style={labelStyle}>Department</label>
                        <input style={{ ...inputStyle, background: "var(--bg-secondary)", cursor: "default" }}
                          value={doctors.find(d => d.DctCode === form.OpgCDctCode)?.DctSpeci || ""} readOnly placeholder="Auto from Doctor"/>
                      </div>
                      <div>
                        <label style={labelStyle}>Doctor *</label>
                        <select style={selectStyle} value={form.OpgCDctCode ?? ""}
                          onChange={e => onDoctorChange(e.target.value ? Number(e.target.value) : null)}>
                          <option value="">— Select Doctor —</option>
                          {doctors.map(d => <option key={d.DctCode} value={d.DctCode}>{d.DctName}</option>)}
                        </select>
                      </div>
                      <div>
                        <label style={labelStyle}>Consultant</label>
                        <select style={selectStyle} value={form.OpgCDctCode ?? ""}
                          onChange={e => onDoctorChange(e.target.value ? Number(e.target.value) : null)}>
                          <option value="">— Select —</option>
                          {doctors.map(d => <option key={d.DctCode} value={d.DctCode}>{d.DctName}</option>)}
                        </select>
                      </div>
                    </div>

                    <div style={{ display: "grid", gridTemplateColumns: "1fr 1fr 1fr 1fr 1fr", gap: 10 }}>
                      <div>
                        <label style={labelStyle}>Visit Type *</label>
                        <select style={selectStyle} value={form.VisitType} onChange={e => setForm(p => ({ ...p, VisitType: e.target.value }))}>
                          <option>New Visit</option>
                          <option>Follow-up</option>
                          <option>Emergency</option>
                        </select>
                      </div>
                      <div>
                        <label style={labelStyle}>Patient Category</label>
                        <select style={selectStyle} value={form.PcgCode ?? ""}
                          onChange={e => {
                            const pcg = patCatgs.find(c => c.PcgCode === Number(e.target.value));
                            setForm(p => ({ ...p, PcgCode: pcg?.PcgCode || null, PcgName: pcg?.PcgName || "", Scheme: pcg?.PcgName || "" }));
                            if (pcg) recalcBilling({}, pcg.PcgDiscPer);
                          }}>
                          <option value="">General</option>
                          {patCatgs.map(c => <option key={c.PcgCode} value={c.PcgCode}>{c.PcgName}</option>)}
                        </select>
                      </div>
                      <div>
                        <label style={labelStyle}>Scheme</label>
                        <input style={inputStyle} value={form.Scheme} onChange={e => setForm(p => ({ ...p, Scheme: e.target.value }))} placeholder="General"/>
                      </div>
                      <div>
                        <label style={labelStyle}>Claim ID</label>
                        <input style={inputStyle} value={form.ClaimId} onChange={e => setForm(p => ({ ...p, ClaimId: e.target.value }))} placeholder="Claim ID (if any)"/>
                      </div>
                      <div>
                        <label style={labelStyle}>Reference Doctor</label>
                        <select style={selectStyle} value={form.OpgRByCode ?? ""} onChange={e => setForm(p => ({ ...p, OpgRByCode: e.target.value ? Number(e.target.value) : null }))}>
                          <option value="">— None —</option>
                          {doctors.map(d => <option key={d.DctCode} value={d.DctCode}>{d.DctName}</option>)}
                        </select>
                      </div>
                    </div>

                    <div style={{ display: "grid", gridTemplateColumns: "1fr 1fr", gap: 10, marginTop: 10 }}>
                      <div>
                        <label style={labelStyle}>Appointment</label>
                        <select style={selectStyle} value={form.Appointment} onChange={e => setForm(p => ({ ...p, Appointment: e.target.value }))}>
                          <option>Yes</option>
                          <option>No</option>
                        </select>
                      </div>
                      <div>
                        <label style={labelStyle}>Priority</label>
                        <select style={selectStyle} value={form.Priority} onChange={e => setForm(p => ({ ...p, Priority: e.target.value }))}>
                          <option>Normal</option>
                          <option>Urgent</option>
                          <option>Emergency</option>
                        </select>
                      </div>
                    </div>
                  </fieldset>
                </div>

                {/* ── Right: Billing panel ──────────────────────────────────── */}
                <div style={{ display: "flex", flexDirection: "column", gap: 16 }}>
                  <fieldset style={{ border: "1px solid var(--border-light)", borderRadius: 8, padding: "12px 16px", height: "100%" }}>
                    <legend style={{ fontSize: 12, fontWeight: 700, color: "var(--accent-color)", padding: "0 6px" }}>Billing Information</legend>

                    <div style={{ display: "flex", justifyContent: "space-between", alignItems: "center", padding: "8px 0", borderBottom: "1px solid var(--border-light)", marginBottom: 10 }}>
                      <span style={{ fontSize: 13, color: "var(--text-secondary)" }}>Consultation Charge (₹)</span>
                      <span style={{ fontSize: 15, fontWeight: 700 }}>{fmtAmt(form.OpgRate)}</span>
                    </div>

                    <div style={{ marginBottom: 12 }}>
                      <label style={labelStyle}>Consultation Charge (₹)</label>
                      <input type="number" style={inputStyle} value={form.OpgRate || ""}
                        onChange={e => {
                          const rate = parseFloat(e.target.value) || 0;
                          const disc = Math.round(rate * (form.OpgDiscPer || 0) / 100 * 100) / 100;
                          const net  = rate - disc;
                          setForm(p => ({ ...p, OpgRate: rate, DiscAmt: disc, NetAmt: net, PaidAmt: net, DueAmt: 0 }));
                        }}
                        placeholder="0.00" min="0"/>
                    </div>

                    <div style={{ marginBottom: 12 }}>
                      <label style={labelStyle}>Discount (%)</label>
                      <input type="number" style={inputStyle} value={form.OpgDiscPer || ""}
                        onChange={e => {
                          const discPer = parseFloat(e.target.value) || 0;
                          const disc    = Math.round(form.OpgRate * discPer / 100 * 100) / 100;
                          const net     = form.OpgRate - disc;
                          setForm(p => ({ ...p, OpgDiscPer: discPer, DiscAmt: disc, NetAmt: net, PaidAmt: net, DueAmt: 0 }));
                        }}
                        placeholder="0.00" min="0" max="100"/>
                    </div>

                    <div style={{ display: "flex", justifyContent: "space-between", alignItems: "center", padding: "8px 0", borderBottom: "1px solid var(--border-light)", marginBottom: 10 }}>
                      <span style={{ fontSize: 13, color: "var(--text-secondary)" }}>Discount (₹)</span>
                      <span style={{ fontSize: 14, fontWeight: 600, color: "var(--status-danger)" }}>
                        {form.DiscAmt > 0 ? fmtAmt(form.DiscAmt) : "0.00"}
                      </span>
                    </div>

                    <div style={{ display: "flex", justifyContent: "space-between", alignItems: "center", padding: "10px 0", borderBottom: "2px solid var(--border-light)", marginBottom: 12 }}>
                      <span style={{ fontSize: 14, fontWeight: 700, color: "var(--text-primary)" }}>Net Amount</span>
                      <span style={{ fontSize: 18, fontWeight: 800, color: "var(--accent-color)" }}>₹ {fmtAmt(form.NetAmt)}</span>
                    </div>

                    <fieldset style={{ border: "1px solid var(--border-light)", borderRadius: 6, padding: "10px 12px", marginBottom: 12 }}>
                      <legend style={{ fontSize: 11, fontWeight: 700, color: "var(--text-secondary)", padding: "0 4px" }}>Payment Details</legend>

                      <div style={{ marginBottom: 8 }}>
                        <label style={labelStyle}>Received (₹) *</label>
                        <input type="number" style={inputStyle} value={form.PaidAmt || ""}
                          onChange={e => {
                            const paid = parseFloat(e.target.value) || 0;
                            setForm(p => ({ ...p, PaidAmt: paid, DueAmt: Math.max(0, p.NetAmt - paid) }));
                          }}
                          placeholder="0.00" min="0"/>
                      </div>

                      <div style={{ display: "flex", justifyContent: "space-between", marginBottom: 8 }}>
                        <span style={{ fontSize: 12, color: "var(--text-secondary)" }}>Due (₹)</span>
                        <span style={{ fontSize: 13, fontWeight: 700, color: form.DueAmt > 0 ? "var(--status-danger)" : "var(--text-secondary)" }}>
                          {fmtAmt(form.DueAmt)}
                        </span>
                      </div>

                      <div>
                        <label style={labelStyle}>Payment Mode</label>
                        <select style={selectStyle} value={form.PayMode} onChange={e => setForm(p => ({ ...p, PayMode: e.target.value }))}>
                          {["Cash","Card","UPI","NEFT","Cheque","DD"].map(m => <option key={m}>{m}</option>)}
                        </select>
                      </div>
                    </fieldset>

                    <div>
                      <label style={labelStyle}>Remarks</label>
                      <textarea
                        style={{ ...inputStyle, resize: "vertical", minHeight: 60 }}
                        value={form.OpgRemark}
                        onChange={e => setForm(p => ({ ...p, OpgRemark: e.target.value }))}
                        placeholder="General consultation"
                      />
                    </div>
                  </fieldset>
                </div>
              </div>

              {/* ── Bottom action buttons ──────────────────────────────────── */}
              <div style={{
                display: "flex", gap: 8, paddingTop: 14,
                borderTop: "1px solid var(--border-light)", marginTop: 14,
              }}>
                <button className={styles.primaryBtn} style={{ padding: "9px 20px", fontSize: 13, gap: 6 }}
                  onClick={() => handleSave(false)} disabled={saving}>
                  {saving ? <RefreshCw size={14} className="animate-spin"/> : <CheckCircle size={14}/>}
                  + Save (F5)
                </button>
                <button className={styles.primaryBtn} style={{ padding: "9px 20px", fontSize: 13, gap: 6, background: "#16a34a" }}
                  onClick={() => handleSave(false)} disabled={saving}>
                  <Printer size={14}/> Save &amp; Print (F6)
                </button>
                <button className={styles.primaryBtn} style={{ padding: "9px 20px", fontSize: 13, gap: 6, background: "#7c3aed" }}
                  onClick={() => handleSave(true)} disabled={saving}>
                  <Plus size={14}/> Save &amp; New (F7)
                </button>
                <button className={styles.secondaryBtn} style={{ padding: "9px 20px", fontSize: 13, gap: 6, color: "var(--status-danger)" }}
                  onClick={cancelForm}>
                  <X size={14}/> Cancel (Esc)
                </button>
              </div>
            </div>
          )}
        </div>
      </div>


    </div>
  );
}

// ── Shared inline styles ───────────────────────────────────────────────────────
const inputStyle: React.CSSProperties = {
  width: "100%",
  border: "1px solid var(--border-light)",
  borderRadius: 7,
  padding: "7px 10px",
  fontSize: 12,
  background: "var(--bg-card)",
  color: "var(--text-primary)",
  outline: "none",
  boxSizing: "border-box",
};

const selectStyle: React.CSSProperties = {
  ...inputStyle,
  cursor: "pointer",
};

const labelStyle: React.CSSProperties = {
  display: "block",
  fontSize: 10,
  fontWeight: 600,
  color: "var(--text-muted)",
  textTransform: "uppercase",
  letterSpacing: "0.4px",
  marginBottom: 3,
};
