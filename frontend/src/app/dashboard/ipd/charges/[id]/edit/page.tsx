"use client";

import React, { useEffect, useState, use } from "react";
import { useRouter } from "next/navigation";
import styles from "../../../../../dashboard.module.css";
import {
  ArrowLeft, Save, Printer, Plus, Trash2, RefreshCw,
  User, AlertCircle, CheckCircle, Search,
} from "lucide-react";

const API = "http://127.0.0.1:8000/api/ipd";

interface GridRow {
  _key:    string;
  SgpCode: number | "";
  SgpName: string;
  SrvCode: number | "";
  SrvName: string;
  Qty:     string;
  Rate:    string;
  DiscPer: string;
  Amount:  number;
  Remark:  string;
}

interface ServiceGroup { SgpCode: number; SgpName: string; }
interface ServiceItem  { SrvCode: number; SrvName: string; SgpCode: number; SrvCharges: number; SrvDiscPer: number; }

function uid() { return Math.random().toString(36).slice(2); }
function calcAmt(qty: string, rate: string, discPer: string) {
  const q = parseFloat(qty) || 0;
  const r = parseFloat(rate) || 0;
  const d = parseFloat(discPer) || 0;
  const g = q * r;
  return Math.round((g - g * d / 100) * 100) / 100;
}

export default function EditChargePage({ params }: { params: Promise<{ id: string }> }) {
  const { id } = use(params);
  const router = useRouter();

  const [loading, setLoading]     = useState(true);
  const [header, setHeader]       = useState<any>(null);
  const [gridRows, setGridRows]   = useState<GridRow[]>([]);
  const [groups, setGroups]       = useState<ServiceGroup[]>([]);
  const [allItems, setAllItems]   = useState<ServiceItem[]>([]);
  const [saving, setSaving]       = useState(false);
  const [toast, setToast]         = useState<{ msg: string; ok: boolean } | null>(null);
  const [chargeDate, setChargeDate] = useState("");
  const [remark, setRemark]       = useState("");

  function showToast(msg: string, ok = true) {
    setToast({ msg, ok });
    setTimeout(() => setToast(null), 4000);
  }

  useEffect(() => {
    Promise.all([
      fetch(`${API}/charges/${id}`).then(r => r.json()),
      fetch(`${API}/charge-groups`).then(r => r.json()).catch(() => []),
      fetch(`${API}/charge-items`).then(r => r.json()).catch(() => []),
    ]).then(([chargeData, grps, items]) => {
      setHeader(chargeData.header);
      setChargeDate(chargeData.header?.Date || new Date().toISOString().slice(0, 10));
      setRemark(chargeData.header?.Remark || "");
      setGroups(grps);
      setAllItems(items);
      const rows: GridRow[] = (chargeData.lines || []).map((ln: any) => ({
        _key:    uid(),
        SgpCode: ln.SgpCode || "",
        SgpName: ln.SgpName || "",
        SrvCode: ln.SrvCode || "",
        SrvName: ln.SrvName || "",
        Qty:     String(ln.Qty || 1),
        Rate:    String(ln.Rate || 0),
        DiscPer: String(ln.DiscPer || 0),
        Amount:  ln.NetAmt || 0,
        Remark:  ln.Remark || "",
      }));
      setGridRows(rows.length ? rows : [{ _key: uid(), SgpCode: "", SgpName: "", SrvCode: "", SrvName: "", Qty: "1", Rate: "0.00", DiscPer: "0.00", Amount: 0, Remark: "" }]);
    }).catch(() => showToast("Failed to load charge data.", false))
      .finally(() => setLoading(false));
  }, [id]);

  function addRow() { setGridRows(prev => [...prev, { _key: uid(), SgpCode: "", SgpName: "", SrvCode: "", SrvName: "", Qty: "1", Rate: "0.00", DiscPer: "0.00", Amount: 0, Remark: "" }]); }
  function deleteRow(key: string) { setGridRows(prev => { const next = prev.filter(r => r._key !== key); return next.length ? next : [{ _key: uid(), SgpCode: "", SgpName: "", SrvCode: "", SrvName: "", Qty: "1", Rate: "0.00", DiscPer: "0.00", Amount: 0, Remark: "" }]; }); }

  function updateRow(key: string, field: keyof GridRow, value: string | number) {
    setGridRows(prev => prev.map(r => {
      if (r._key !== key) return r;
      const u = { ...r, [field]: value };
      if (field === "SgpCode") {
        const g = groups.find(g => g.SgpCode === Number(value));
        u.SgpName = g?.SgpName || "";
        u.SrvCode = ""; u.SrvName = ""; u.Rate = "0.00"; u.Amount = 0;
      }
      if (field === "SrvCode") {
        const s = allItems.find(i => i.SrvCode === Number(value));
        if (s) { u.SrvName = s.SrvName; u.Rate = s.SrvCharges.toFixed(2); u.DiscPer = s.SrvDiscPer.toFixed(2); }
      }
      u.Amount = calcAmt(field === "Qty" ? String(value) : u.Qty, field === "Rate" ? String(value) : u.Rate, field === "DiscPer" ? String(value) : u.DiscPer);
      return u;
    }));
  }

  async function handleSave() {
    const validLines = gridRows.filter(r => r.SrvCode !== "");
    if (!validLines.length) { showToast("Add at least one charge item.", false); return; }
    setSaving(true);
    try {
      const token = localStorage.getItem("hms_token");
      const res = await fetch(`${API}/charges/${id}`, {
        method: "PUT",
        headers: { "Content-Type": "application/json", Authorization: `Bearer ${token}` },
        body: JSON.stringify({
          IbhDate: chargeDate, IbhRemark: remark,
          lines: validLines.map(r => ({ SrvCode: Number(r.SrvCode), Qty: parseFloat(r.Qty) || 1, Rate: parseFloat(r.Rate) || 0, DiscPer: parseFloat(r.DiscPer) || 0 })),
        }),
      });
      if (!res.ok) throw new Error("Update failed");
      showToast("Charge updated successfully!");
      setTimeout(() => router.push("/dashboard/ipd/charges"), 1200);
    } catch (e: any) {
      showToast(e.message || "Failed to update.", false);
    } finally {
      setSaving(false);
    }
  }

  const totalGross = gridRows.reduce((s, r) => s + (parseFloat(r.Qty) || 0) * (parseFloat(r.Rate) || 0), 0);
  const totalDisc  = gridRows.reduce((s, r) => { const g = (parseFloat(r.Qty) || 0) * (parseFloat(r.Rate) || 0); return s + g * (parseFloat(r.DiscPer) || 0) / 100; }, 0);
  const totalNet   = gridRows.reduce((s, r) => s + r.Amount, 0);
  const itemsForRow = (row: GridRow) => row.SgpCode ? allItems.filter(i => i.SgpCode === Number(row.SgpCode)) : allItems;

  if (loading) return <div style={{ padding: 60, textAlign: "center" }}><RefreshCw size={28} style={{ color: "var(--text-muted)", animation: "spin 1s linear infinite" }} /></div>;

  return (
    <div style={{ display: "flex", flexDirection: "column", gap: 20 }}>
      {toast && (
        <div style={{ position: "fixed", top: 24, right: 24, zIndex: 9999, background: toast.ok ? "#10b981" : "#ef4444", color: "#fff", padding: "14px 22px", borderRadius: 12, boxShadow: "0 8px 24px rgba(0,0,0,.18)", display: "flex", alignItems: "center", gap: 10, fontWeight: 600, fontSize: 14 }}>
          {toast.ok ? <CheckCircle size={18} /> : <AlertCircle size={18} />}
          {toast.msg}
        </div>
      )}

      <div style={{ display: "flex", alignItems: "center", justifyContent: "space-between", paddingBottom: 16, borderBottom: "1px solid var(--border-light)" }}>
        <div style={{ display: "flex", alignItems: "center", gap: 12 }}>
          <button className={styles.secondaryBtn} style={{ padding: "8px 14px", gap: 6, fontSize: 13 }} onClick={() => router.push("/dashboard/ipd/charges")}>
            <ArrowLeft size={15} /> Back
          </button>
          <div>
            <h2 style={{ fontSize: 20, fontWeight: 700, margin: 0 }}>Edit Charge #{header?.ChargeNo}</h2>
            <p style={{ color: "var(--text-secondary)", fontSize: 12, marginTop: 2 }}>{header?.PttName} — IPD #{header?.IpdNo}</p>
          </div>
        </div>
        <button id="btn-save-edit-charge" className={styles.primaryBtn} style={{ gap: 6, padding: "10px 20px" }} onClick={handleSave} disabled={saving}>
          {saving ? <RefreshCw size={15} className="animate-spin" /> : <Save size={15} />}
          {saving ? "Saving…" : "Save Changes"}
        </button>
      </div>

      {/* Patient Info read-only */}
      <div className={styles.sectionBox}>
        <div className={styles.sectionHeader}><h3 className={styles.sectionTitle} style={{ fontSize: 15 }}>Patient Information</h3></div>
        <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fill, minmax(200px, 1fr))", gap: "12px 20px" }}>
          {[
            { label: "UHID",         value: header?.PttRegNo },
            { label: "Patient Name", value: header?.PttName },
            { label: "Doctor",       value: header?.DctName },
            { label: "IPD No",       value: header?.IpdNo },
            { label: "Status",       value: header?.Status },
          ].map(f => (
            <div key={f.label} className={styles.formGroup}>
              <label style={{ fontSize: 11, fontWeight: 700, color: "var(--text-secondary)", textTransform: "uppercase", display: "block", marginBottom: 4 }}>{f.label}</label>
              <div style={{ padding: "9px 12px", borderRadius: 8, fontSize: 14, fontWeight: 600, background: "var(--bg-secondary)", border: "1px solid var(--border-light)" }}>
                {f.value || "—"}
              </div>
            </div>
          ))}
          <div className={styles.formGroup}>
            <label style={{ fontSize: 11, fontWeight: 700, color: "var(--text-secondary)", textTransform: "uppercase", display: "block", marginBottom: 4 }}>Charge Date</label>
            <input type="date" value={chargeDate} onChange={e => setChargeDate(e.target.value)} className={styles.formControl} />
          </div>
          <div className={styles.formGroup} style={{ gridColumn: "span 2" }}>
            <label style={{ fontSize: 11, fontWeight: 700, color: "var(--text-secondary)", textTransform: "uppercase", display: "block", marginBottom: 4 }}>Remarks</label>
            <input type="text" value={remark} onChange={e => setRemark(e.target.value)} className={styles.formControl} placeholder="Optional remarks…" />
          </div>
        </div>
      </div>

      {/* Charge Grid */}
      <div className={styles.sectionBox}>
        <div className={styles.sectionHeader}>
          <h3 className={styles.sectionTitle} style={{ fontSize: 15 }}>Charge Entry</h3>
          <button className={styles.primaryBtn} style={{ gap: 6, padding: "8px 14px", fontSize: 13 }} onClick={addRow}><Plus size={14} /> Add Row</button>
        </div>
        <div className={styles.tableContainer}>
          <table className={styles.table} style={{ fontSize: 13 }}>
            <thead>
              <tr>
                <th style={{ width: 40 }}>#</th>
                <th style={{ width: 180 }}>Charge Group</th>
                <th>Charge Item</th>
                <th style={{ width: 75, textAlign: "center" }}>Qty</th>
                <th style={{ width: 100, textAlign: "right" }}>Rate (₹)</th>
                <th style={{ width: 80, textAlign: "center" }}>Disc %</th>
                <th style={{ width: 110, textAlign: "right" }}>Amount (₹)</th>
                <th>Remarks</th>
                <th style={{ width: 48 }}></th>
              </tr>
            </thead>
            <tbody>
              {gridRows.map((row, idx) => (
                <tr key={row._key}>
                  <td style={{ textAlign: "center", color: "var(--text-secondary)", fontWeight: 600 }}>{idx + 1}</td>
                  <td>
                    <select className={styles.formControl} style={{ fontSize: 12, padding: "5px 8px" }} value={row.SgpCode} onChange={e => updateRow(row._key, "SgpCode", e.target.value)}>
                      <option value="">— Group —</option>
                      {groups.map(g => <option key={g.SgpCode} value={g.SgpCode}>{g.SgpName}</option>)}
                    </select>
                  </td>
                  <td>
                    <select className={styles.formControl} style={{ fontSize: 12, padding: "5px 8px" }} value={row.SrvCode} onChange={e => updateRow(row._key, "SrvCode", e.target.value)}>
                      <option value="">— Select Item —</option>
                      {itemsForRow(row).map(i => <option key={i.SrvCode} value={i.SrvCode}>{i.SrvName}</option>)}
                    </select>
                  </td>
                  <td><input type="number" min="0" step="0.5" className={styles.formControl} style={{ fontSize: 12, padding: "5px 8px", textAlign: "center" }} value={row.Qty} onChange={e => updateRow(row._key, "Qty", e.target.value)} /></td>
                  <td><input type="number" min="0" step="0.01" className={styles.formControl} style={{ fontSize: 12, padding: "5px 8px", textAlign: "right" }} value={row.Rate} onChange={e => updateRow(row._key, "Rate", e.target.value)} /></td>
                  <td><input type="number" min="0" max="100" step="0.01" className={styles.formControl} style={{ fontSize: 12, padding: "5px 8px", textAlign: "center" }} value={row.DiscPer} onChange={e => updateRow(row._key, "DiscPer", e.target.value)} /></td>
                  <td style={{ textAlign: "right", fontWeight: 700, color: "var(--status-success)" }}>₹{row.Amount.toFixed(2)}</td>
                  <td><input type="text" className={styles.formControl} style={{ fontSize: 12, padding: "5px 8px" }} value={row.Remark} placeholder="Optional…" onChange={e => updateRow(row._key, "Remark", e.target.value)} /></td>
                  <td style={{ textAlign: "center" }}>
                    <button style={{ background: "none", border: "none", cursor: "pointer", color: "var(--status-danger)", padding: 4, borderRadius: 6 }} onClick={() => deleteRow(row._key)}><Trash2 size={14} /></button>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
        <div style={{ padding: "14px 20px", background: "var(--bg-secondary)", borderTop: "1px solid var(--border-light)", borderRadius: "0 0 16px 16px", display: "flex", justifyContent: "flex-end", gap: 40, fontSize: 13, fontWeight: 600 }}>
          <span>Gross: <span style={{ color: "var(--text-primary)", fontSize: 15 }}>₹{totalGross.toLocaleString("en-IN", { minimumFractionDigits: 2 })}</span></span>
          <span>Discount: <span style={{ color: "var(--status-danger)", fontSize: 15 }}>₹{totalDisc.toLocaleString("en-IN", { minimumFractionDigits: 2 })}</span></span>
          <span>Net: <span style={{ color: "var(--status-success)", fontSize: 16, fontWeight: 800 }}>₹{totalNet.toLocaleString("en-IN", { minimumFractionDigits: 2 })}</span></span>
        </div>
      </div>

      <div style={{ display: "flex", justifyContent: "flex-end", gap: 12, paddingTop: 8 }}>
        <button className={styles.secondaryBtn} style={{ padding: "10px 20px" }} onClick={() => router.push("/dashboard/ipd/charges")}>Cancel</button>
        <button className={styles.primaryBtn} style={{ gap: 8, padding: "10px 28px" }} onClick={handleSave} disabled={saving}>
          {saving ? <RefreshCw size={15} className="animate-spin" /> : <Save size={15} />}
          {saving ? "Saving…" : "Save Changes"}
        </button>
      </div>
    </div>
  );
}
