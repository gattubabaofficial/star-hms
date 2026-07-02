"use client";

import React, { useEffect, useState, useCallback, useRef } from "react";
import { useRouter } from "next/navigation";
import styles from "../../../../dashboard.module.css";
import {
  ArrowLeft, Save, Printer, Plus, Trash2, RefreshCw,
  User, AlertCircle, CheckCircle, Search,
} from "lucide-react";

const API     = "http://127.0.0.1:8000/api/ipd";
const MASTERS = "http://127.0.0.1:8000/api/masters";

// ─── Types ────────────────────────────────────────────────────────────────────
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
  _key:      string;
  SgpCode:   number | "";
  SgpName:   string;
  SrvCode:   number | "";
  SrvName:   string;
  Qty:       string;
  Rate:      string;
  DiscPer:   string;
  Amount:    number;
  Remark:    string;
}

// ─── Helpers ──────────────────────────────────────────────────────────────────
function uid() { return Math.random().toString(36).slice(2); }

function calcAmt(qty: string, rate: string, discPer: string): number {
  const q = parseFloat(qty) || 0;
  const r = parseFloat(rate) || 0;
  const d = parseFloat(discPer) || 0;
  const gross = q * r;
  return Math.round((gross - gross * d / 100) * 100) / 100;
}

function emptyRow(): GridRow {
  return { _key: uid(), SgpCode: "", SgpName: "", SrvCode: "", SrvName: "", Qty: "1", Rate: "0.00", DiscPer: "0.00", Amount: 0, Remark: "" };
}

const EMPTY_PAT: PatientInfo = {
  IhdCode: 0, IhdVchNo: 0, PttCode: null, PttName: "", PttRegNo: null,
  PttSex: "", Age: "", DctCode: null, DctName: "",
  WrdName: "", BedName: "", PcgName: "", Scheme: "",
};

// ─── Component ────────────────────────────────────────────────────────────────
export default function NewChargePage() {
  const router = useRouter();

  // Lookup state
  const [admissions, setAdmissions]   = useState<ActiveAdmission[]>([]);
  const [groups, setGroups]           = useState<ServiceGroup[]>([]);
  const [allItems, setAllItems]       = useState<ServiceItem[]>([]);
  const [showAdmSearch, setShowAdmSearch] = useState(false);
  const [admSearch, setAdmSearch]     = useState("");

  // Patient info
  const [patInfo, setPatInfo]   = useState<PatientInfo>(EMPTY_PAT);
  const [ipdInput, setIpdInput] = useState("");
  const [patLoading, setPatLoading] = useState(false);

  // Charge entry grid
  const [gridRows, setGridRows] = useState<GridRow[]>([emptyRow()]);

  // Header fields
  const today = new Date().toISOString().slice(0, 10);
  const [chargeDate, setChargeDate] = useState(today);
  const [remark, setRemark]         = useState("");

  // Save state
  const [saving, setSaving]     = useState(false);
  const [toast, setToast]       = useState<{ msg: string; ok: boolean } | null>(null);
  const [printMode, setPrintMode] = useState<null | { header: any; lines: GridRow[] }>(null);

  const admSearchRef = useRef<HTMLInputElement>(null);

  // ── Loaders ────────────────────────────────────────────────────────────────
  useEffect(() => {
    // Load service groups and items upfront
    Promise.all([
      fetch(`${API}/charge-groups`).then(r => r.json()).catch(() => []),
      fetch(`${API}/charge-items`).then(r => r.json()).catch(() => []),
    ]).then(([grps, items]) => {
      setGroups(grps);
      setAllItems(items);
    });
  }, []);

  // Load active admissions for search
  useEffect(() => {
    if (!showAdmSearch) return;
    fetch(`${API}/admissions/active`)
      .then(r => r.json())
      .catch(() => [])
      .then(data => setAdmissions(data));
    setTimeout(() => admSearchRef.current?.focus(), 100);
  }, [showAdmSearch]);

  // ── Patient Info loader ────────────────────────────────────────────────────
  async function loadPatientByIhd(ihdCode: number) {
    setPatLoading(true);
    try {
      const res = await fetch(`${API}/charges/patient-info/${ihdCode}`);
      if (!res.ok) throw new Error("Not found");
      setPatInfo(await res.json());
    } catch {
      showToast("Admission not found for this IPD No.", false);
      setPatInfo(EMPTY_PAT);
    } finally {
      setPatLoading(false);
    }
  }

  function handleIpdSearch() {
    const v = parseInt(ipdInput.trim());
    if (!v) { showToast("Enter a valid IPD No.", false); return; }
    // Find in admissions list by IhdVchNo
    fetch(`${API}/admissions/active?search=${v}`)
      .then(r => r.json())
      .then((list: ActiveAdmission[]) => {
        const match = list.find(a => a.IhdVchNo === v);
        if (match) loadPatientByIhd(match.IhdCode);
        else showToast("No active admission found for IPD No " + v, false);
      });
  }

  // ── Toast ──────────────────────────────────────────────────────────────────
  function showToast(msg: string, ok = true) {
    setToast({ msg, ok });
    setTimeout(() => setToast(null), 4000);
  }

  // ── Grid helpers ───────────────────────────────────────────────────────────
  function addRow() {
    setGridRows(prev => [...prev, emptyRow()]);
  }

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

      // When Charge Group changes → reset item
      if (field === "SgpCode") {
        const grp = groups.find(g => g.SgpCode === Number(value));
        updated.SgpName = grp?.SgpName || "";
        updated.SrvCode = "";
        updated.SrvName = "";
        updated.Rate    = "0.00";
        updated.Amount  = 0;
      }

      // When Charge Item changes → auto-fill rate
      if (field === "SrvCode") {
        const srv = allItems.find(i => i.SrvCode === Number(value));
        if (srv) {
          updated.SrvName = srv.SrvName;
          updated.Rate    = srv.SrvCharges.toFixed(2);
          updated.DiscPer = srv.SrvDiscPer.toFixed(2);
        }
      }

      // Recalculate amount whenever qty/rate/disc changes
      updated.Amount = calcAmt(
        field === "Qty"     ? String(value) : updated.Qty,
        field === "Rate"    ? String(value) : updated.Rate,
        field === "DiscPer" ? String(value) : updated.DiscPer,
      );

      return updated;
    }));
  }

  // ── Validation ─────────────────────────────────────────────────────────────
  function validate(): string | null {
    if (!patInfo.IhdCode) return "Select an admitted patient (IPD No) first.";
    if (!chargeDate) return "Charge date is required.";
    const validLines = gridRows.filter(r => r.SrvCode !== "");
    if (validLines.length === 0) return "Add at least one charge item.";
    for (const ln of validLines) {
      if ((parseFloat(ln.Qty) || 0) <= 0) return "Quantity must be greater than 0.";
      if ((parseFloat(ln.Rate) || 0) <= 0) return "Rate must be greater than 0 for all items.";
    }
    return null;
  }

  // ── Save (Task 6) ──────────────────────────────────────────────────────────
  async function handleSave() {
    const err = validate();
    if (err) { showToast(err, false); return; }

    setSaving(true);
    try {
      const token = localStorage.getItem("hms_token");
      const lines = gridRows
        .filter(r => r.SrvCode !== "")
        .map(r => ({
          SrvCode: Number(r.SrvCode),
          Qty:     parseFloat(r.Qty)     || 1,
          Rate:    parseFloat(r.Rate)    || 0,
          DiscPer: parseFloat(r.DiscPer) || 0,
        }));

      const payload = {
        IbhIhdCode:  patInfo.IhdCode,
        IbhPttCode:  patInfo.PttCode,
        IbhDate:     chargeDate,
        IbhBillType: "Indoor Charges",
        IbhRemark:   remark,
        lines,
      };

      const res = await fetch(`${API}/charges`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          Authorization: `Bearer ${token}`,
        },
        body: JSON.stringify(payload),
      });

      if (!res.ok) {
        const err = await res.json().catch(() => ({}));
        throw new Error(err.detail || "Save failed");
      }

      showToast("Charge saved successfully!", true);
      // Navigate back to summary
      setTimeout(() => router.push("/dashboard/ipd/charges"), 1200);
    } catch (e: any) {
      showToast(e.message || "Failed to save charge.", false);
    } finally {
      setSaving(false);
    }
  }

  // ── Print (Task 7) ────────────────────────────────────────────────────────
  function handlePrint() {
    const err = validate();
    if (err) { showToast(err, false); return; }

    // Build print content
    const now = new Date();
    const totalGross = gridRows.reduce((s, r) => s + (parseFloat(r.Qty) || 0) * (parseFloat(r.Rate) || 0), 0);
    const totalDisc  = gridRows.reduce((s, r) => {
      const gross = (parseFloat(r.Qty) || 0) * (parseFloat(r.Rate) || 0);
      return s + gross * (parseFloat(r.DiscPer) || 0) / 100;
    }, 0);
    const totalNet = gridRows.reduce((s, r) => s + r.Amount, 0);

    const printHTML = `
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <title>Indoor Charge Receipt</title>
  <style>
    * { margin: 0; padding: 0; box-sizing: border-box; }
    body { font-family: Arial, sans-serif; font-size: 12px; color: #111; padding: 20px; }
    .header { text-align: center; margin-bottom: 16px; }
    .header h1 { font-size: 20px; font-weight: bold; }
    .header h2 { font-size: 14px; font-weight: 600; color: #333; margin-top: 4px; }
    .divider { border-top: 1.5px solid #111; margin: 10px 0; }
    .info-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 4px 20px; margin-bottom: 12px; }
    .info-row { display: flex; gap: 6px; }
    .info-label { font-weight: bold; min-width: 100px; }
    table { width: 100%; border-collapse: collapse; margin-top: 8px; }
    th { background: #1e3a5f; color: #fff; padding: 6px 8px; text-align: left; font-size: 11px; }
    td { padding: 5px 8px; border-bottom: 1px solid #ddd; font-size: 11px; }
    tr:nth-child(even) td { background: #f8f9fa; }
    .amount-col { text-align: right; }
    .total-row td { font-weight: bold; border-top: 2px solid #111; }
    .footer { margin-top: 32px; display: flex; justify-content: space-between; }
    .sig-line { text-align: center; border-top: 1px solid #666; padding-top: 4px; margin-top: 40px; font-size: 11px; }
    @media print { body { padding: 10px; } }
  </style>
</head>
<body>
<div class="header">
  <h1>STAR HOSPITAL MANAGEMENT SYSTEM</h1>
  <h2>INDOOR CHARGE RECEIPT</h2>
</div>
<div class="divider"></div>

<div class="info-grid">
  <div class="info-row"><span class="info-label">Date:</span><span>${new Date(chargeDate).toLocaleDateString("en-IN", { day: "2-digit", month: "long", year: "numeric" })}</span></div>
  <div class="info-row"><span class="info-label">Print Time:</span><span>${now.toLocaleTimeString("en-IN")}</span></div>
  <div class="info-row"><span class="info-label">IPD No:</span><span>${patInfo.IhdVchNo}</span></div>
  <div class="info-row"><span class="info-label">UHID:</span><span>${patInfo.PttRegNo ?? ""}</span></div>
  <div class="info-row"><span class="info-label">Patient Name:</span><span>${patInfo.PttName}</span></div>
  <div class="info-row"><span class="info-label">Age / Gender:</span><span>${patInfo.Age} / ${patInfo.PttSex}</span></div>
  <div class="info-row"><span class="info-label">Doctor:</span><span>${patInfo.DctName}</span></div>
  <div class="info-row"><span class="info-label">Ward / Bed:</span><span>${patInfo.WrdName} / ${patInfo.BedName}</span></div>
  <div class="info-row"><span class="info-label">Category:</span><span>${patInfo.PcgName}</span></div>
  <div class="info-row"><span class="info-label">Scheme:</span><span>${patInfo.Scheme}</span></div>
</div>

<div class="divider"></div>
<table>
  <thead>
    <tr>
      <th>#</th>
      <th>Charge Group</th>
      <th>Charge Item</th>
      <th class="amount-col">Qty</th>
      <th class="amount-col">Rate (₹)</th>
      <th class="amount-col">Discount</th>
      <th class="amount-col">Amount (₹)</th>
      <th>Remarks</th>
    </tr>
  </thead>
  <tbody>
    ${gridRows.filter(r => r.SrvCode !== "").map((r, i) => `
    <tr>
      <td>${i + 1}</td>
      <td>${r.SgpName}</td>
      <td>${r.SrvName}</td>
      <td class="amount-col">${parseFloat(r.Qty) || 0}</td>
      <td class="amount-col">${parseFloat(r.Rate).toFixed(2)}</td>
      <td class="amount-col">${parseFloat(r.DiscPer).toFixed(2)}%</td>
      <td class="amount-col">${r.Amount.toFixed(2)}</td>
      <td>${r.Remark}</td>
    </tr>`).join("")}
    <tr class="total-row">
      <td colspan="4"></td>
      <td class="amount-col">Gross: ₹${totalGross.toFixed(2)}</td>
      <td class="amount-col">Disc: ₹${totalDisc.toFixed(2)}</td>
      <td class="amount-col">Net: ₹${totalNet.toFixed(2)}</td>
      <td></td>
    </tr>
  </tbody>
</table>

${remark ? `<p style="margin-top:12px;"><strong>Remarks:</strong> ${remark}</p>` : ""}

<div class="footer">
  <div class="sig-line" style="width:200px">Patient / Attendant Signature</div>
  <div class="sig-line" style="width:200px">Cashier Signature</div>
  <div class="sig-line" style="width:200px">Authorised Signatory</div>
</div>
</body>
</html>`;

    const win = window.open("", "_blank", "width=800,height=700");
    if (!win) { showToast("Pop-up blocked. Allow pop-ups and try again.", false); return; }
    win.document.write(printHTML);
    win.document.close();
    win.focus();
    setTimeout(() => win.print(), 500);
  }

  // ── Derived totals ─────────────────────────────────────────────────────────
  const totalGross = gridRows.reduce((s, r) => s + (parseFloat(r.Qty) || 0) * (parseFloat(r.Rate) || 0), 0);
  const totalDisc  = gridRows.reduce((s, r) => {
    const g = (parseFloat(r.Qty) || 0) * (parseFloat(r.Rate) || 0);
    return s + g * (parseFloat(r.DiscPer) || 0) / 100;
  }, 0);
  const totalNet = gridRows.reduce((s, r) => s + r.Amount, 0);

  const canSave = !!patInfo.IhdCode && gridRows.some(r => r.SrvCode !== "");

  // Items filtered by selected group per row
  function itemsForRow(row: GridRow): ServiceItem[] {
    if (!row.SgpCode) return allItems;
    return allItems.filter(i => i.SgpCode === Number(row.SgpCode));
  }

  // Filtered admissions for search modal
  const filteredAdm = admissions.filter(a => {
    const s = admSearch.toLowerCase();
    return (
      !s ||
      a.PttName.toLowerCase().includes(s) ||
      String(a.PttRegNo || "").includes(s) ||
      String(a.IhdVchNo).includes(s)
    );
  });

  return (
    <div style={{ display: "flex", flexDirection: "column", gap: 20 }}>

      {/* Toast */}
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

      {/* Admission Search Modal */}
      {showAdmSearch && (
        <div className={styles.modalOverlay}>
          <div className={styles.modalContent} style={{ maxWidth: 560 }}>
            <div className={styles.modalHeader}>
              <h3 style={{ fontSize: 16, fontWeight: 700 }}>Select Admission</h3>
              <button className={styles.closeBtn} onClick={() => setShowAdmSearch(false)}>×</button>
            </div>
            <div className={styles.modalBody}>
              <div className={styles.searchBar} style={{ marginBottom: 12 }}>
                <Search size={14} style={{ color: "var(--text-muted)" }} />
                <input
                  ref={admSearchRef}
                  type="text"
                  placeholder="Search by patient name, UHID, IPD No…"
                  value={admSearch}
                  onChange={e => setAdmSearch(e.target.value)}
                />
              </div>
              <div className={styles.tableContainer} style={{ maxHeight: 320 }}>
                <table className={styles.table} style={{ fontSize: 13 }}>
                  <thead>
                    <tr>
                      <th>IPD No</th>
                      <th>UHID</th>
                      <th>Patient Name</th>
                    </tr>
                  </thead>
                  <tbody>
                    {filteredAdm.length === 0 ? (
                      <tr>
                        <td colSpan={3} style={{ textAlign: "center", color: "var(--text-secondary)", padding: 20 }}>
                          No active admissions found.
                        </td>
                      </tr>
                    ) : filteredAdm.map(a => (
                      <tr
                        key={a.IhdCode}
                        style={{ cursor: "pointer" }}
                        onClick={() => {
                          setIpdInput(String(a.IhdVchNo));
                          setShowAdmSearch(false);
                          setAdmSearch("");
                          loadPatientByIhd(a.IhdCode);
                        }}
                      >
                        <td style={{ fontWeight: 700, color: "var(--accent-color)" }}>{a.IhdVchNo}</td>
                        <td>{a.PttRegNo ?? "—"}</td>
                        <td style={{ fontWeight: 600 }}>{a.PttName}</td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      )}

      {/* Page header */}
      <div style={{
        display: "flex", alignItems: "center", justifyContent: "space-between",
        paddingBottom: 16, borderBottom: "1px solid var(--border-light)",
      }}>
        <div style={{ display: "flex", alignItems: "center", gap: 12 }}>
          <button
            id="btn-back-charges"
            className={styles.secondaryBtn}
            style={{ padding: "8px 14px", gap: 6, fontSize: 13 }}
            onClick={() => router.push("/dashboard/ipd/charges")}
          >
            <ArrowLeft size={15} /> Back
          </button>
          <div>
            <h2 style={{ fontSize: 20, fontWeight: 700, color: "var(--text-primary)", margin: 0 }}>
              New Indoor Charge
            </h2>
            <p style={{ color: "var(--text-secondary)", fontSize: 12, marginTop: 2 }}>
              Create a new charge session for an admitted patient
            </p>
          </div>
        </div>

        {/* Action buttons */}
        <div style={{ display: "flex", gap: 10 }}>
          <button
            id="btn-print-new-charge"
            className={styles.secondaryBtn}
            style={{ gap: 6, padding: "10px 18px", fontSize: 13 }}
            onClick={handlePrint}
            disabled={!canSave}
          >
            <Printer size={15} /> Print
          </button>
          <button
            id="btn-save-charge"
            className={styles.primaryBtn}
            style={{ gap: 6, padding: "10px 20px", fontSize: 13, opacity: canSave ? 1 : 0.4 }}
            onClick={handleSave}
            disabled={!canSave || saving}
          >
            {saving ? <RefreshCw size={15} className="animate-spin" /> : <Save size={15} />}
            {saving ? "Saving…" : "Save"}
          </button>
        </div>
      </div>

      {/* ══ TASK 4 — Patient Information Section ════════════════════════════════ */}
      <div className={styles.sectionBox}>
        <div className={styles.sectionHeader}>
          <div style={{ display: "flex", alignItems: "center", gap: 8 }}>
            <User size={17} style={{ color: "var(--accent-color)" }} />
            <h3 className={styles.sectionTitle} style={{ fontSize: 15 }}>Patient Information</h3>
          </div>

          {/* IPD No lookup */}
          <div style={{ display: "flex", gap: 8, alignItems: "center" }}>
            <div className={styles.searchBar} style={{ maxWidth: 180, padding: "7px 12px" }}>
              <input
                id="ipd-no-input"
                type="number"
                placeholder="IPD No"
                value={ipdInput}
                onChange={e => setIpdInput(e.target.value)}
                onKeyDown={e => e.key === "Enter" && handleIpdSearch()}
                style={{ fontWeight: 600 }}
              />
            </div>
            <button
              id="btn-find-ipd"
              className={styles.secondaryBtn}
              style={{ padding: "8px 14px", gap: 6, fontSize: 13 }}
              onClick={handleIpdSearch}
              disabled={patLoading}
            >
              {patLoading ? <RefreshCw size={13} className="animate-spin" /> : <Search size={13} />}
              Find
            </button>
            <button
              className={styles.secondaryBtn}
              style={{ padding: "8px 14px", gap: 6, fontSize: 13 }}
              onClick={() => setShowAdmSearch(true)}
            >
              Browse…
            </button>
          </div>
        </div>

        <div style={{
          display: "grid",
          gridTemplateColumns: "repeat(auto-fill, minmax(200px, 1fr))",
          gap: "14px 20px",
        }}>
          {[
            { label: "UHID",         value: patInfo.PttRegNo ?? "" },
            { label: "Patient Name", value: patInfo.PttName },
            { label: "Age",          value: patInfo.Age },
            { label: "Gender",       value: patInfo.PttSex },
            { label: "Doctor",       value: patInfo.DctName },
            { label: "Ward",         value: patInfo.WrdName },
            { label: "Room / Bed",   value: patInfo.BedName },
            { label: "Category",     value: patInfo.PcgName },
            { label: "Scheme",       value: patInfo.Scheme },
          ].map(f => (
            <div key={f.label} className={styles.formGroup}>
              <label style={{ fontSize: 11, fontWeight: 700, color: "var(--text-secondary)", textTransform: "uppercase", letterSpacing: "0.5px", marginBottom: 4, display: "block" }}>
                {f.label}
              </label>
              <div style={{
                padding: "9px 12px", borderRadius: 8, fontSize: 14, fontWeight: 600,
                background: "var(--bg-secondary)", border: "1px solid var(--border-light)",
                color: f.value ? "var(--text-primary)" : "var(--text-muted)",
                minHeight: 38,
              }}>
                {f.value || <span style={{ fontWeight: 400, fontStyle: "italic", fontSize: 12 }}>—</span>}
              </div>
            </div>
          ))}

          {/* Charge Date — editable */}
          <div className={styles.formGroup}>
            <label style={{ fontSize: 11, fontWeight: 700, color: "var(--text-secondary)", textTransform: "uppercase", letterSpacing: "0.5px", marginBottom: 4, display: "block" }}>
              Charge Date
            </label>
            <input
              id="charge-date-input"
              type="date"
              value={chargeDate}
              onChange={e => setChargeDate(e.target.value)}
              className={styles.formControl}
            />
          </div>

          {/* Remark */}
          <div className={styles.formGroup} style={{ gridColumn: "span 2" }}>
            <label style={{ fontSize: 11, fontWeight: 700, color: "var(--text-secondary)", textTransform: "uppercase", letterSpacing: "0.5px", marginBottom: 4, display: "block" }}>
              Remarks
            </label>
            <input
              id="charge-remark-input"
              type="text"
              className={styles.formControl}
              placeholder="Optional remarks…"
              value={remark}
              onChange={e => setRemark(e.target.value)}
            />
          </div>
        </div>
      </div>

      {/* ══ TASK 5 — Charge Entry Grid ══════════════════════════════════════════ */}
      <div className={styles.sectionBox}>
        <div className={styles.sectionHeader}>
          <h3 className={styles.sectionTitle} style={{ fontSize: 15 }}>Charge Entry</h3>
          <button
            id="btn-add-row"
            className={styles.primaryBtn}
            style={{ gap: 6, padding: "8px 14px", fontSize: 13 }}
            onClick={addRow}
          >
            <Plus size={14} /> Add Row
          </button>
        </div>

        <div className={styles.tableContainer}>
          <table className={styles.table} style={{ fontSize: 13 }}>
            <thead>
              <tr>
                <th style={{ width: 40  }}>#</th>
                <th style={{ width: 180 }}>Charge Group</th>
                <th>Charge Item</th>
                <th style={{ width: 75,  textAlign: "center" }}>Qty</th>
                <th style={{ width: 100, textAlign: "right"  }}>Rate (₹)</th>
                <th style={{ width: 80,  textAlign: "center" }}>Disc %</th>
                <th style={{ width: 110, textAlign: "right"  }}>Amount (₹)</th>
                <th>Remarks</th>
                <th style={{ width: 48  }}></th>
              </tr>
            </thead>
            <tbody>
              {gridRows.map((row, idx) => (
                <tr key={row._key}>
                  <td style={{ textAlign: "center", color: "var(--text-secondary)", fontWeight: 600 }}>{idx + 1}</td>

                  {/* Charge Group */}
                  <td>
                    <select
                      className={styles.formControl}
                      style={{ fontSize: 12, padding: "5px 8px" }}
                      value={row.SgpCode}
                      onChange={e => updateRow(row._key, "SgpCode", e.target.value)}
                    >
                      <option value="">— Group —</option>
                      {groups.map(g => (
                        <option key={g.SgpCode} value={g.SgpCode}>{g.SgpName}</option>
                      ))}
                    </select>
                  </td>

                  {/* Charge Item */}
                  <td>
                    <select
                      className={styles.formControl}
                      style={{ fontSize: 12, padding: "5px 8px" }}
                      value={row.SrvCode}
                      onChange={e => updateRow(row._key, "SrvCode", e.target.value)}
                    >
                      <option value="">— Select Item —</option>
                      {itemsForRow(row).map(i => (
                        <option key={i.SrvCode} value={i.SrvCode}>{i.SrvName}</option>
                      ))}
                    </select>
                  </td>

                  {/* Qty */}
                  <td>
                    <input
                      type="number"
                      min="0"
                      step="0.5"
                      className={styles.formControl}
                      style={{ fontSize: 12, padding: "5px 8px", textAlign: "center" }}
                      value={row.Qty}
                      onChange={e => updateRow(row._key, "Qty", e.target.value)}
                    />
                  </td>

                  {/* Rate */}
                  <td>
                    <input
                      type="number"
                      min="0"
                      step="0.01"
                      className={styles.formControl}
                      style={{ fontSize: 12, padding: "5px 8px", textAlign: "right" }}
                      value={row.Rate}
                      onChange={e => updateRow(row._key, "Rate", e.target.value)}
                    />
                  </td>

                  {/* Discount % */}
                  <td>
                    <input
                      type="number"
                      min="0"
                      max="100"
                      step="0.01"
                      className={styles.formControl}
                      style={{ fontSize: 12, padding: "5px 8px", textAlign: "center" }}
                      value={row.DiscPer}
                      onChange={e => updateRow(row._key, "DiscPer", e.target.value)}
                    />
                  </td>

                  {/* Amount (computed) */}
                  <td style={{ textAlign: "right", fontWeight: 700, color: "var(--status-success)" }}>
                    ₹{row.Amount.toFixed(2)}
                  </td>

                  {/* Remarks */}
                  <td>
                    <input
                      type="text"
                      className={styles.formControl}
                      style={{ fontSize: 12, padding: "5px 8px" }}
                      value={row.Remark}
                      placeholder="Optional…"
                      onChange={e => updateRow(row._key, "Remark", e.target.value)}
                    />
                  </td>

                  {/* Delete row */}
                  <td style={{ textAlign: "center" }}>
                    <button
                      style={{
                        background: "none", border: "none", cursor: "pointer",
                        color: "var(--status-danger)", padding: 4, borderRadius: 6,
                      }}
                      title="Delete row"
                      onClick={() => deleteRow(row._key)}
                    >
                      <Trash2 size={14} />
                    </button>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>

        {/* Totals footer */}
        <div style={{
          marginTop: 0,
          padding: "14px 20px",
          background: "var(--bg-secondary)",
          borderTop: "1px solid var(--border-light)",
          borderRadius: "0 0 16px 16px",
          display: "flex", justifyContent: "flex-end", gap: 40,
          fontSize: 13, fontWeight: 600,
        }}>
          <span>
            Gross Amount:&nbsp;
            <span style={{ color: "var(--text-primary)", fontSize: 15 }}>
              ₹{totalGross.toLocaleString("en-IN", { minimumFractionDigits: 2 })}
            </span>
          </span>
          <span>
            Discount:&nbsp;
            <span style={{ color: "var(--status-danger)", fontSize: 15 }}>
              ₹{totalDisc.toLocaleString("en-IN", { minimumFractionDigits: 2 })}
            </span>
          </span>
          <span>
            Net Amount:&nbsp;
            <span style={{ color: "var(--status-success)", fontSize: 16, fontWeight: 800 }}>
              ₹{totalNet.toLocaleString("en-IN", { minimumFractionDigits: 2 })}
            </span>
          </span>
        </div>
      </div>

      {/* Save / Cancel bottom bar */}
      <div style={{
        display: "flex", justifyContent: "flex-end", gap: 12,
        padding: "16px 0",
      }}>
        <button
          className={styles.secondaryBtn}
          style={{ padding: "10px 20px" }}
          onClick={() => router.push("/dashboard/ipd/charges")}
        >
          Cancel
        </button>
        <button
          id="btn-save-charge-bottom"
          className={styles.primaryBtn}
          style={{ gap: 8, padding: "10px 28px", opacity: canSave ? 1 : 0.4 }}
          onClick={handleSave}
          disabled={!canSave || saving}
        >
          {saving ? <RefreshCw size={15} className="animate-spin" /> : <Save size={15} />}
          {saving ? "Saving…" : "Save Charge"}
        </button>
      </div>
    </div>
  );
}
