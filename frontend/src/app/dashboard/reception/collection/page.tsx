"use client";

/**
 * Hospital Reception – Central Collection Desk
 * Faithful re-implementation of the legacy VB6 "Collection Report"
 * (frmCollectionViewRep / CollView.frm).
 *
 * It UNION-merges every money voucher (registration / receipt / advance /
 * payment / refund / bill payment-refund) across OPD, IPD and Lab over a
 * date range, then lets the user filter by voucher type, group the result
 * many ways, drill down, search, print and export to Excel/CSV.
 */

import React, { useEffect, useMemo, useState } from "react";
import styles from "../../../dashboard.module.css";
import {
  Search, Printer, Download, SlidersHorizontal, RefreshCw,
  ArrowLeft, FileBarChart2, ChevronRight,
} from "lucide-react";

const API = process.env.NEXT_PUBLIC_API_URL || "http://localhost:8000";
const getToken = () => (typeof window !== "undefined" ? localStorage.getItem("token") : "");
const authHdr = () => ({ "Content-Type": "application/json", Authorization: `Bearer ${getToken()}` });

// ---- types -----------------------------------------------------------------
interface CollectionRow {
  TrnType: string;
  Module: string;            // Outdoor | Indoor | Lab
  Voucher: string;
  VchNo: string;
  TrnDate: string;           // yyyy-mm-dd
  TrnTime: number | null;
  PttCode: number | null;
  PttName: string;
  PttRegNo: number | null;
  PttRefName: string;
  PttAddr: string;
  AreaName: string;
  StationName: string;
  CategoryName: string;
  DoctorName: string;
  ServiceName: string;
  ServiceGroupName: string;
  ReceivedAmount: number;
  DiscountAmount: number;
}
interface Summary {
  Count: number; ReceivedTotal: number; DiscountTotal: number;
  OutdoorTotal: number; IndoorTotal: number; LabTotal: number;
}

// ---- voucher-type catalogue (the VB6 "Filter By" list) ---------------------
const SOURCES: { code: string; label: string; module: "Outdoor" | "Indoor" | "Lab" }[] = [
  { code: "opd_reg", label: "Outdoor Registration", module: "Outdoor" },
  { code: "opd_reg_refd", label: "Outdoor Reg.Refund", module: "Outdoor" },
  { code: "opd_rcpt", label: "Outdoor Receipts", module: "Outdoor" },
  { code: "opd_pymt", label: "Outdoor Rcpt Payment", module: "Outdoor" },
  { code: "opd_refd", label: "Outdoor Rcpt Refund", module: "Outdoor" },
  { code: "opd_bill_pymt", label: "Outdoor Bill Payment", module: "Outdoor" },
  { code: "opd_bill_refd", label: "Outdoor Bill Refund", module: "Outdoor" },
  { code: "ipd_adv", label: "Indoor Admit.Advance", module: "Indoor" },
  { code: "ipd_rg_pymt", label: "Indoor On A/c.Payment", module: "Indoor" },
  { code: "ipd_rg_refd", label: "Indoor On A/c.Refund", module: "Indoor" },
  { code: "ipd_bill_pymt", label: "Indoor Bill Payment", module: "Indoor" },
  { code: "ipd_bill_refd", label: "Indoor Bill Refund", module: "Indoor" },
  { code: "lab_rcpt", label: "Lab Receipts", module: "Lab" },
  { code: "lab_pymt", label: "Lab Rcpt Payment", module: "Lab" },
  { code: "lab_refd", label: "Lab Rcpt Refund", module: "Lab" },
];
const ALL_CODES = SOURCES.map((s) => s.code);

// ---- grouping modes (the VB6 Grouped / Detailed / Expanded options) --------
type Mode =
  | "detailed" | "expanded" | "date" | "month" | "patient_name" | "patient_regno"
  | "doctor" | "service" | "service_group" | "service_group_service" | "voucher";
const MODES: { value: Mode; label: string; group: "Grouped" | "Detailed" }[] = [
  { value: "date", label: "Date-wise", group: "Grouped" },
  { value: "month", label: "Month-wise", group: "Grouped" },
  { value: "patient_name", label: "Patient Name-wise", group: "Grouped" },
  { value: "patient_regno", label: "Patient Reg.No-wise", group: "Grouped" },
  { value: "doctor", label: "Consult Doctor-wise", group: "Grouped" },
  { value: "service", label: "Service-wise", group: "Grouped" },
  { value: "service_group", label: "Service Group-wise", group: "Grouped" },
  { value: "service_group_service", label: "Service Group / Service-wise", group: "Grouped" },
  { value: "voucher", label: "Voucher Type-wise", group: "Grouped" },
  { value: "detailed", label: "Detailed", group: "Detailed" },
  { value: "expanded", label: "Expanded", group: "Detailed" },
];

const MONTHS = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
const today = () => new Date().toISOString().slice(0, 10);
const money = (n: number) =>
  (n < 0 ? "-" : "") + "₹" + Math.abs(n).toLocaleString("en-IN", { minimumFractionDigits: 2, maximumFractionDigits: 2 });
const fmtDate = (d: string) => { const [y, m, dd] = d.split("-"); return `${dd}/${m}/${y}`; };

interface Doctor { dct_code: number; dct_name: string; dct_title?: string | null; }
interface Service { srv_code: number; srv_name: string; srv_sgp_code?: number | null; }
interface SrvGroup { sgp_code: number; sgp_name: string; }

export default function CollectionDeskPage() {
  // criteria
  const [fromDate, setFromDate] = useState(today());
  const [toDate, setToDate] = useState(today());
  const [selected, setSelected] = useState<Set<string>>(new Set(ALL_CODES));
  const [mode, setMode] = useState<Mode>("detailed");
  const [dctCode, setDctCode] = useState("");
  const [srvCode, setSrvCode] = useState("");
  const [sgpCode, setSgpCode] = useState("");

  // data
  const [rows, setRows] = useState<CollectionRow[]>([]);
  const [summary, setSummary] = useState<Summary | null>(null);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState("");
  const [search, setSearch] = useState("");
  const [showConfig, setShowConfig] = useState(true);

  // drill-down stack (client-side filters on the loaded rows)
  const [drill, setDrill] = useState<{ label: string; pred: (r: CollectionRow) => boolean }[]>([]);

  // dropdown masters
  const [doctors, setDoctors] = useState<Doctor[]>([]);
  const [services, setServices] = useState<Service[]>([]);
  const [groups, setGroups] = useState<SrvGroup[]>([]);

  useEffect(() => {
    Promise.all([
      fetch(`${API}/api/masters/doctors`).then((r) => r.json()).catch(() => []),
      fetch(`${API}/api/masters/services`).then((r) => r.json()).catch(() => []),
      fetch(`${API}/api/masters/service-groups`).then((r) => r.json()).catch(() => []),
    ]).then(([d, s, g]) => {
      setDoctors(Array.isArray(d) ? d : []);
      setServices(Array.isArray(s) ? s : []);
      setGroups(Array.isArray(g) ? g : []);
    });
  }, []);

  const loadReport = async () => {
    if (fromDate > toDate) { setError("From Date must be on or before To Date."); return; }
    setLoading(true); setError(""); setDrill([]); setSearch("");
    try {
      const p = new URLSearchParams({ start_date: fromDate, end_date: toDate });
      if (selected.size < ALL_CODES.length) p.set("include", Array.from(selected).join(","));
      if (dctCode) p.set("dct_code", dctCode);
      if (srvCode) p.set("srv_code", srvCode);
      if (sgpCode) p.set("sgp_code", sgpCode);
      const r = await fetch(`${API}/api/reports/collection?${p.toString()}`, { headers: authHdr() });
      if (!r.ok) throw new Error(await r.text());
      const data = await r.json();
      setRows(data.Rows || []);
      setSummary(data.Summary || null);
      setShowConfig(false);
    } catch (e: any) {
      setError(e?.message || "Failed to load collection report");
      setRows([]); setSummary(null);
    }
    setLoading(false);
  };

  // ---- "Filter By" checkbox helpers ----------------------------------------
  const toggleSource = (code: string) =>
    setSelected((s) => { const n = new Set(s); n.has(code) ? n.delete(code) : n.add(code); return n; });
  const moduleState = (mod: string): "all" | "some" | "none" => {
    const codes = SOURCES.filter((s) => s.module === mod).map((s) => s.code);
    const on = codes.filter((c) => selected.has(c)).length;
    return on === 0 ? "none" : on === codes.length ? "all" : "some";
  };
  const toggleModule = (mod: string) => {
    const codes = SOURCES.filter((s) => s.module === mod).map((s) => s.code);
    const turnOn = moduleState(mod) !== "all";
    setSelected((s) => { const n = new Set(s); codes.forEach((c) => (turnOn ? n.add(c) : n.delete(c))); return n; });
  };

  // ---- drill-down -----------------------------------------------------------
  const drilled = useMemo(() => rows.filter((r) => drill.every((d) => d.pred(r))), [rows, drill]);
  const drillInto = (label: string, pred: (r: CollectionRow) => boolean) =>
    setDrill((d) => [...d, { label, pred }]);

  // ---- grouping engine ------------------------------------------------------
  interface GridCol { key: string; title: string; align?: "left" | "right"; }
  interface GridRow { cells: Record<string, string>; raw?: CollectionRow; group?: { label: string; pred: (r: CollectionRow) => boolean }; }

  const grid = useMemo(() => {
    const detailed = mode === "detailed" || mode === "expanded";
    let cols: GridCol[];
    let body: GridRow[] = [];
    let recd = 0, disc = 0, cnt = 0;

    if (detailed) {
      cols = [
        { key: "Voucher", title: "Voucher" },
        { key: "VchNo", title: "Vch.No", align: "right" },
        { key: "TrnDate", title: "Date" },
        { key: "PttName", title: "Patient Name" },
        { key: "PttRegNo", title: "Reg.No", align: "right" },
        ...(mode === "expanded" ? [{ key: "ServiceName", title: "Service" } as GridCol] : []),
        { key: "ReceivedAmount", title: "Recd.Amt", align: "right" },
        { key: "DiscountAmount", title: "Discount", align: "right" },
        { key: "PttRefName", title: "Care of" },
        { key: "PttAddr", title: "Address" },
        { key: "AreaName", title: "Area" },
        { key: "StationName", title: "Station" },
        { key: "CategoryName", title: "Category" },
      ];
      body = drilled.map((r) => {
        recd += r.ReceivedAmount; disc += r.DiscountAmount; cnt += 1;
        return {
          raw: r,
          cells: {
            Voucher: r.Voucher, VchNo: r.VchNo, TrnDate: fmtDate(r.TrnDate),
            PttName: r.PttName, PttRegNo: r.PttRegNo?.toString() ?? "",
            ServiceName: r.ServiceName, ReceivedAmount: money(r.ReceivedAmount),
            DiscountAmount: money(r.DiscountAmount), PttRefName: r.PttRefName,
            PttAddr: r.PttAddr, AreaName: r.AreaName, StationName: r.StationName, CategoryName: r.CategoryName,
          },
        };
      });
      return { cols, body, total: { recd, disc, cnt }, grouped: false };
    }

    // grouped modes -----------------------------------------------------------
    const keyOf = (r: CollectionRow): { k: string; cells: Record<string, string>; pred: (x: CollectionRow) => boolean } => {
      switch (mode) {
        case "date":
          return { k: r.TrnDate, cells: { g0: fmtDate(r.TrnDate) }, pred: (x) => x.TrnDate === r.TrnDate };
        case "month": {
          const ym = r.TrnDate.slice(0, 7);
          const [y, m] = ym.split("-");
          return { k: ym, cells: { g0: `${MONTHS[parseInt(m) - 1]}-${y}` }, pred: (x) => x.TrnDate.slice(0, 7) === ym };
        }
        case "patient_name":
        case "patient_regno": {
          const k = String(r.PttCode ?? r.PttName);
          return {
            k,
            cells: { g0: r.PttName || "—", g1: r.PttRegNo?.toString() ?? "", g2: r.PttRefName },
            pred: (x) => String(x.PttCode ?? x.PttName) === k,
          };
        }
        case "doctor":
          return { k: r.DoctorName || "—", cells: { g0: r.DoctorName || "(Unspecified)" }, pred: (x) => (x.DoctorName || "—") === (r.DoctorName || "—") };
        case "service":
          return { k: r.ServiceName || "—", cells: { g0: r.ServiceName || "(Unspecified)" }, pred: (x) => (x.ServiceName || "—") === (r.ServiceName || "—") };
        case "service_group":
          return { k: r.ServiceGroupName || "—", cells: { g0: r.ServiceGroupName || "(Unspecified)" }, pred: (x) => (x.ServiceGroupName || "—") === (r.ServiceGroupName || "—") };
        case "service_group_service": {
          const k = `${r.ServiceGroupName}|${r.ServiceName}`;
          return { k, cells: { g0: r.ServiceGroupName || "(Unspecified)", g1: r.ServiceName || "(Unspecified)" }, pred: (x) => `${x.ServiceGroupName}|${x.ServiceName}` === k };
        }
        case "voucher":
          return { k: r.Voucher, cells: { g0: r.Voucher }, pred: (x) => x.Voucher === r.Voucher };
        default:
          return { k: "", cells: {}, pred: () => true };
      }
    };

    const colMap: Record<string, GridCol[]> = {
      date: [{ key: "g0", title: "Date" }],
      month: [{ key: "g0", title: "Month" }],
      patient_name: [{ key: "g0", title: "Patient Name" }, { key: "g1", title: "Reg.No", align: "right" }, { key: "g2", title: "Care of" }],
      patient_regno: [{ key: "g1", title: "Reg.No", align: "right" }, { key: "g0", title: "Patient Name" }, { key: "g2", title: "Care of" }],
      doctor: [{ key: "g0", title: "Consulting Doctor" }],
      service: [{ key: "g0", title: "Service" }],
      service_group: [{ key: "g0", title: "Service Group" }],
      service_group_service: [{ key: "g0", title: "Service Group" }, { key: "g1", title: "Service" }],
      voucher: [{ key: "g0", title: "Voucher Type" }],
    };
    cols = [
      ...colMap[mode],
      { key: "TrnCount", title: "Count", align: "right" },
      { key: "ReceivedAmount", title: "Recd.Amt", align: "right" },
      { key: "DiscountAmount", title: "Discount", align: "right" },
    ];

    const buckets = new Map<string, { cells: Record<string, string>; recd: number; disc: number; cnt: number; pred: (x: CollectionRow) => boolean }>();
    for (const r of drilled) {
      const { k, cells, pred } = keyOf(r);
      const b = buckets.get(k) || { cells, recd: 0, disc: 0, cnt: 0, pred };
      b.recd += r.ReceivedAmount; b.disc += r.DiscountAmount; b.cnt += 1;
      buckets.set(k, b);
    }
    body = Array.from(buckets.values()).map((b) => {
      recd += b.recd; disc += b.disc; cnt += b.cnt;
      const label = colMap[mode].map((c) => b.cells[c.key]).filter(Boolean).join(" / ");
      return {
        group: { label, pred: b.pred },
        cells: {
          ...b.cells,
          TrnCount: b.cnt.toString(),
          ReceivedAmount: money(b.recd),
          DiscountAmount: money(b.disc),
        },
      };
    });
    return { cols, body, total: { recd, disc, cnt }, grouped: true };
  }, [drilled, mode]);

  // search filter over the visible grid rows
  const visibleBody = useMemo(() => {
    if (!search.trim()) return grid.body;
    const q = search.toLowerCase();
    return grid.body.filter((r) => Object.values(r.cells).some((v) => v.toLowerCase().includes(q)));
  }, [grid, search]);

  // ---- export ---------------------------------------------------------------
  const exportCsv = () => {
    const head = grid.cols.map((c) => `"${c.title}"`).join(",");
    const lines = visibleBody.map((r) => grid.cols.map((c) => `"${(r.cells[c.key] ?? "").replace(/"/g, '""')}"`).join(","));
    const totalLine = grid.cols
      .map((c) => c.key === "ReceivedAmount" ? `"${money(grid.total.recd)}"`
        : c.key === "DiscountAmount" ? `"${money(grid.total.disc)}"`
        : c.key === "TrnCount" ? `"${grid.total.cnt}"`
        : c === grid.cols[0] ? '"Grand Total"' : '""').join(",");
    const csv = [`"Collection Report ${fmtDate(fromDate)} to ${fmtDate(toDate)}"`, head, ...lines, totalLine].join("\n");
    const blob = new Blob([csv], { type: "text/csv;charset=utf-8;" });
    const a = document.createElement("a");
    a.href = URL.createObjectURL(blob);
    a.download = `CollectionReport_${fromDate}_to_${toDate}.csv`;
    a.click();
  };

  const selectedCount = selected.size;

  return (
    <div style={{ display: "flex", flexDirection: "column", gap: "20px" }}>
      {/* breadcrumb / heading */}
      <div style={{ display: "flex", alignItems: "center", justifyContent: "space-between", flexWrap: "wrap", gap: "12px" }}>
        <div>
          <h2 style={{ fontSize: "20px", fontWeight: 700, color: "var(--text-primary)" }}>Central Collection Desk</h2>
          <p style={{ color: "var(--text-secondary)", fontSize: "13px" }}>
            Consolidated OPD / IPD / Lab collection report — receipts, advances, payments &amp; refunds.
          </p>
        </div>
        <div style={{ display: "flex", gap: "10px", flexWrap: "wrap" }}>
          <button className={styles.secondaryBtn} onClick={() => setShowConfig((s) => !s)} style={{ gap: "8px" }}>
            <SlidersHorizontal size={16} /> Configure
          </button>
          <button className={styles.secondaryBtn} onClick={exportCsv} disabled={!rows.length} style={{ gap: "8px" }}>
            <Download size={16} /> Export Excel
          </button>
          <button className={styles.secondaryBtn} onClick={() => window.print()} disabled={!rows.length} style={{ gap: "8px" }}>
            <Printer size={16} /> Print
          </button>
        </div>
      </div>

      {/* configure panel */}
      {showConfig && (
        <div className={styles.sectionBox} style={{ padding: "20px", display: "flex", flexDirection: "column", gap: "20px" }}>
          {/* date range + filters */}
          <div className={styles.formGrid} style={{ display: "grid", gridTemplateColumns: "repeat(auto-fit,minmax(180px,1fr))", gap: "14px" }}>
            <div className={styles.formGroup}>
              <label>From Date *</label>
              <input type="date" className={styles.formControl} value={fromDate} onChange={(e) => setFromDate(e.target.value)} />
            </div>
            <div className={styles.formGroup}>
              <label>To Date *</label>
              <input type="date" className={styles.formControl} value={toDate} onChange={(e) => setToDate(e.target.value)} />
            </div>
            <div className={styles.formGroup}>
              <label>Consulting Doctor</label>
              <select className={styles.formControl} value={dctCode} onChange={(e) => setDctCode(e.target.value)}>
                <option value="">— All —</option>
                {doctors.map((d) => <option key={d.dct_code} value={d.dct_code}>{(d.dct_title ? d.dct_title + " " : "") + d.dct_name}</option>)}
              </select>
            </div>
            <div className={styles.formGroup}>
              <label>Service Group</label>
              <select className={styles.formControl} value={sgpCode} onChange={(e) => setSgpCode(e.target.value)}>
                <option value="">— All —</option>
                {groups.map((g) => <option key={g.sgp_code} value={g.sgp_code}>{g.sgp_name}</option>)}
              </select>
            </div>
            <div className={styles.formGroup}>
              <label>Service</label>
              <select className={styles.formControl} value={srvCode} onChange={(e) => setSrvCode(e.target.value)}>
                <option value="">— All —</option>
                {services.map((s) => <option key={s.srv_code} value={s.srv_code}>{s.srv_name}</option>)}
              </select>
            </div>
            <div className={styles.formGroup}>
              <label>Group / View As</label>
              <select className={styles.formControl} value={mode} onChange={(e) => setMode(e.target.value as Mode)}>
                <optgroup label="Grouped">
                  {MODES.filter((m) => m.group === "Grouped").map((m) => <option key={m.value} value={m.value}>{m.label}</option>)}
                </optgroup>
                <optgroup label="Detailed">
                  {MODES.filter((m) => m.group === "Detailed").map((m) => <option key={m.value} value={m.value}>{m.label}</option>)}
                </optgroup>
              </select>
            </div>
          </div>

          {/* filter-by voucher types */}
          <div>
            <div style={{ fontSize: "13px", fontWeight: 600, color: "var(--text-primary)", marginBottom: "10px" }}>
              Filter By Voucher Type <span style={{ color: "var(--text-secondary)", fontWeight: 400 }}>({selectedCount}/{ALL_CODES.length} selected)</span>
            </div>
            <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fit,minmax(240px,1fr))", gap: "16px" }}>
              {(["Outdoor", "Indoor", "Lab"] as const).map((mod) => {
                const st = moduleState(mod);
                return (
                  <div key={mod} style={{ border: "1px solid var(--border-light)", borderRadius: "10px", padding: "12px" }}>
                    <label style={{ display: "flex", alignItems: "center", gap: "8px", fontWeight: 600, fontSize: "13px", cursor: "pointer", marginBottom: "8px" }}>
                      <input type="checkbox" ref={(el) => { if (el) el.indeterminate = st === "some"; }}
                        checked={st === "all"} onChange={() => toggleModule(mod)} />
                      {mod} Collection ({st === "all" ? "All" : st === "none" ? "None" : "Partial"})
                    </label>
                    <div style={{ display: "flex", flexDirection: "column", gap: "4px", paddingLeft: "6px" }}>
                      {SOURCES.filter((s) => s.module === mod).map((s) => (
                        <label key={s.code} style={{ display: "flex", alignItems: "center", gap: "8px", fontSize: "12.5px", color: "var(--text-secondary)", cursor: "pointer" }}>
                          <input type="checkbox" checked={selected.has(s.code)} onChange={() => toggleSource(s.code)} />
                          {s.label}
                        </label>
                      ))}
                    </div>
                  </div>
                );
              })}
            </div>
          </div>

          {error && <div style={{ color: "var(--status-danger)", fontSize: "13px" }}>{error}</div>}

          <div style={{ display: "flex", gap: "10px" }}>
            <button className={styles.primaryBtn} onClick={loadReport} disabled={loading} style={{ gap: "8px", minWidth: "160px", justifyContent: "center" }}>
              {loading ? <RefreshCw size={16} className="animate-spin" /> : <FileBarChart2 size={16} />}
              {loading ? "Loading…" : "View Report"}
            </button>
            <button className={styles.secondaryBtn} onClick={() => { setSelected(new Set(ALL_CODES)); setDctCode(""); setSrvCode(""); setSgpCode(""); setMode("detailed"); }}>
              Reset Filters
            </button>
          </div>
        </div>
      )}

      {/* summary cards */}
      {summary && (
        <div className={styles.statsGrid}>
          {[
            { label: "Outdoor Collection", val: summary.OutdoorTotal, color: "var(--accent-color)", bg: "var(--accent-light)" },
            { label: "Indoor Collection", val: summary.IndoorTotal, color: "var(--status-warning)", bg: "var(--status-warning-light)" },
            { label: "Lab Collection", val: summary.LabTotal, color: "var(--status-info, #0ea5e9)", bg: "var(--accent-light)" },
            { label: "Net Collection", val: summary.ReceivedTotal, color: "var(--status-success)", bg: "var(--status-success-light)" },
          ].map((c) => (
            <div key={c.label} className={styles.card}>
              <div className={styles.cardInfo}>
                <span className={styles.cardLabel}>{c.label}</span>
                <span className={styles.cardValue} style={{ fontSize: "20px" }}>{money(c.val)}</span>
              </div>
              <div className={styles.cardIcon} style={{ color: c.color, backgroundColor: c.bg }}>
                <FileBarChart2 size={22} />
              </div>
            </div>
          ))}
        </div>
      )}

      {/* result grid */}
      {summary && (
        <div className={styles.sectionBox}>
          <div className={styles.sectionHeader} style={{ flexWrap: "wrap", gap: "12px" }}>
            <div style={{ display: "flex", alignItems: "center", gap: "10px", flexWrap: "wrap" }}>
              <h3 className={styles.sectionTitle}>
                {MODES.find((m) => m.value === mode)?.label} — {fmtDate(fromDate)} to {fmtDate(toDate)}
              </h3>
              {drill.length > 0 && (
                <span style={{ display: "flex", alignItems: "center", gap: "6px", fontSize: "12px", color: "var(--text-secondary)" }}>
                  {drill.map((d, i) => (
                    <span key={i} style={{ display: "flex", alignItems: "center", gap: "6px" }}>
                      <ChevronRight size={12} /> {d.label}
                    </span>
                  ))}
                  <button className={styles.secondaryBtn} style={{ padding: "2px 8px", marginLeft: "6px" }} onClick={() => setDrill((d) => d.slice(0, -1))}>
                    <ArrowLeft size={12} /> Back
                  </button>
                </span>
              )}
            </div>
            <div className={styles.searchBar} style={{ maxWidth: "260px" }}>
              <Search size={16} style={{ color: "var(--text-muted)" }} />
              <input value={search} onChange={(e) => setSearch(e.target.value)} placeholder="Search grid…" />
            </div>
          </div>

          <div className={styles.tableContainer}>
            <table className={styles.table}>
              <thead>
                <tr>{grid.cols.map((c) => <th key={c.key} style={{ textAlign: c.align ?? "left" }}>{c.title}</th>)}</tr>
              </thead>
              <tbody>
                {visibleBody.length === 0 && (
                  <tr><td colSpan={grid.cols.length} style={{ textAlign: "center", padding: "36px", color: "var(--text-secondary)" }}>No transactions for the selected criteria.</td></tr>
                )}
                {visibleBody.map((r, i) => (
                  <tr key={i}
                    onClick={() => grid.grouped && r.group && drillInto(r.group.label, r.group.pred)}
                    style={{ cursor: grid.grouped ? "pointer" : "default" }}>
                    {grid.cols.map((c) => {
                      const isAmt = c.key === "ReceivedAmount" || c.key === "DiscountAmount";
                      const neg = isAmt && (r.raw ? (r.raw as any)[c.key] < 0 : (r.cells[c.key] || "").startsWith("-"));
                      return (
                        <td key={c.key} style={{
                          textAlign: c.align ?? "left",
                          fontWeight: c.key === "Voucher" || c.key === "g0" ? 600 : undefined,
                          color: neg ? "var(--status-danger)" : undefined,
                        }}>{r.cells[c.key]}</td>
                      );
                    })}
                  </tr>
                ))}
              </tbody>
              {visibleBody.length > 0 && (
                <tfoot>
                  <tr style={{ fontWeight: 700, borderTop: "2px solid var(--border-light)", backgroundColor: "var(--bg-secondary)" }}>
                    {grid.cols.map((c, idx) => (
                      <td key={c.key} style={{ textAlign: c.align ?? "left" }}>
                        {idx === 0 ? `Grand Total (${grid.total.cnt})`
                          : c.key === "TrnCount" ? grid.total.cnt
                          : c.key === "ReceivedAmount" ? money(grid.total.recd)
                          : c.key === "DiscountAmount" ? money(grid.total.disc) : ""}
                      </td>
                    ))}
                  </tr>
                </tfoot>
              )}
            </table>
          </div>
          {grid.grouped && (
            <p style={{ fontSize: "12px", color: "var(--text-muted)", marginTop: "10px" }}>
              Tip: click any row to drill down into its detailed transactions.
            </p>
          )}
        </div>
      )}
    </div>
  );
}
