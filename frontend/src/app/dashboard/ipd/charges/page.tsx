"use client";

import React, { useEffect, useState, useCallback } from "react";
import { useRouter } from "next/navigation";
import styles from "../../../dashboard.module.css";
import {
  Plus, Pencil, Trash2, Printer, RefreshCw, Download,
  Search, CalendarDays, AlertCircle, FileText, CheckCircle,
  IndianRupee, Clock,
} from "lucide-react";

const API = "http://127.0.0.1:8000/api/ipd";

// ─── Types ────────────────────────────────────────────────────────────────────
interface ChargeRow {
  IbhCode:     number;
  ChargeNo:    number;
  Date:        string;
  Voucher:     string;
  IpdNo:       number | null;
  PttName:     string;
  PttRegNo:    number | null;
  DctName:     string;
  ChargeGroup: string;
  GrossAmt:    number;
  DiscAmt:     number;
  NetAmt:      number;
  Status:      string;
}

// ─── Helpers ──────────────────────────────────────────────────────────────────
function fmtDate(d: string) {
  if (!d) return "—";
  try {
    return new Date(d).toLocaleDateString("en-IN", {
      day: "2-digit", month: "short", year: "numeric",
    });
  } catch { return d; }
}

function fmtAmt(n: number) {
  return "₹" + (n || 0).toLocaleString("en-IN", { minimumFractionDigits: 2, maximumFractionDigits: 2 });
}

function statusBadge(s: string) {
  const map: Record<string, { bg: string; color: string }> = {
    Open:     { bg: "var(--accent-light)",         color: "var(--accent-color)" },
    Closed:   { bg: "var(--status-success-light)",  color: "var(--status-success)" },
    Voided:   { bg: "var(--status-danger-light)",   color: "var(--status-danger)" },
  };
  const c = map[s] || { bg: "var(--bg-secondary)", color: "var(--text-secondary)" };
  return (
    <span style={{
      background: c.bg, color: c.color,
      padding: "3px 10px", borderRadius: 20, fontSize: 11, fontWeight: 700,
      letterSpacing: "0.3px", whiteSpace: "nowrap",
    }}>
      {s || "Open"}
    </span>
  );
}

// ─── Component ────────────────────────────────────────────────────────────────
export default function IndoorChargesPage() {
  const router = useRouter();

  const today = new Date().toISOString().slice(0, 10);
  const firstOfMonth = new Date(new Date().getFullYear(), new Date().getMonth(), 1)
    .toISOString().slice(0, 10);

  const [rows, setRows]           = useState<ChargeRow[]>([]);
  const [loading, setLoading]     = useState(false);
  const [selected, setSelected]   = useState<number | null>(null);
  const [search, setSearch]       = useState("");
  const [startDate, setStartDate] = useState(firstOfMonth);
  const [endDate, setEndDate]     = useState(today);
  const [toast, setToast]         = useState<{ msg: string; ok: boolean } | null>(null);
  const [deleting, setDeleting]   = useState(false);
  const [showDeleteConfirm, setShowDeleteConfirm] = useState(false);

  // ── Data fetch ──────────────────────────────────────────────────────────────
  const fetchRows = useCallback(async () => {
    setLoading(true);
    setSelected(null);
    try {
      const params = new URLSearchParams();
      if (startDate) params.set("start_date", startDate);
      if (endDate)   params.set("end_date", endDate);
      if (search)    params.set("search", search);

      const res = await fetch(`${API}/charges?${params}`);
      if (!res.ok) throw new Error("Failed to load charges");
      setRows(await res.json());
    } catch (e) {
      showToast("Failed to load charges from server.", false);
    } finally {
      setLoading(false);
    }
  }, [startDate, endDate, search]);

  useEffect(() => { fetchRows(); }, [fetchRows]);

  // ── Toast ───────────────────────────────────────────────────────────────────
  function showToast(msg: string, ok = true) {
    setToast({ msg, ok });
    setTimeout(() => setToast(null), 4000);
  }

  // ── Delete ──────────────────────────────────────────────────────────────────
  async function handleDelete() {
    if (!selected) return;
    setDeleting(true);
    try {
      const token = localStorage.getItem("hms_token");
      const res = await fetch(`${API}/charges/${selected}`, {
        method: "DELETE",
        headers: { Authorization: `Bearer ${token}` },
      });
      if (!res.ok) throw new Error("Delete failed");
      showToast("Charge deleted successfully.", true);
      setShowDeleteConfirm(false);
      setSelected(null);
      fetchRows();
    } catch {
      showToast("Failed to delete charge.", false);
    } finally {
      setDeleting(false);
    }
  }

  // ── Print ───────────────────────────────────────────────────────────────────
  function handlePrint() {
    if (!selected) { showToast("Select a charge to print.", false); return; }
    router.push(`/dashboard/ipd/charges/${selected}/print`);
  }

  // ── Export ──────────────────────────────────────────────────────────────────
  function handleExport() {
    const header = ["Charge No","Date","Voucher","IPD No","Patient","UHID","Doctor","Charge Group","Gross","Discount","Net","Status"];
    const csvRows = [
      header.join(","),
      ...filtered.map(r => [
        r.ChargeNo, r.Date, r.Voucher, r.IpdNo ?? "",
        `"${r.PttName}"`, r.PttRegNo ?? "", `"${r.DctName}"`,
        `"${r.ChargeGroup}"`, r.GrossAmt, r.DiscAmt, r.NetAmt, r.Status,
      ].join(",")),
    ];
    const blob = new Blob([csvRows.join("\n")], { type: "text/csv;charset=utf-8;" });
    const url  = URL.createObjectURL(blob);
    const a    = document.createElement("a"); a.href = url;
    a.download = `indoor_charges_${today}.csv`; a.click();
    URL.revokeObjectURL(url);
    showToast("Exported to CSV.");
  }

  // ── Filtered (client-side live filter) ────────────────────────────────────
  const filtered = rows.filter(r => {
    if (!search) return true;
    const s = search.toLowerCase();
    return (
      r.PttName.toLowerCase().includes(s) ||
      String(r.PttRegNo || "").includes(s) ||
      String(r.ChargeNo || "").includes(s) ||
      String(r.IpdNo || "").includes(s) ||
      r.DctName.toLowerCase().includes(s)
    );
  });

  // ── Summary totals ─────────────────────────────────────────────────────────
  const totalGross = filtered.reduce((a, r) => a + r.GrossAmt, 0);
  const totalDisc  = filtered.reduce((a, r) => a + r.DiscAmt,  0);
  const totalNet   = filtered.reduce((a, r) => a + r.NetAmt,   0);

  const selectedRow = selected ? filtered.find(r => r.IbhCode === selected) : null;

  return (
    <div style={{ display: "flex", flexDirection: "column", gap: 20 }}>

      {/* ── Toast ────────────────────────────────────────────────────────────── */}
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

      {/* ── Delete Confirm ────────────────────────────────────────────────────── */}
      {showDeleteConfirm && (
        <div className={styles.modalOverlay}>
          <div className={styles.modalContent} style={{ maxWidth: 420 }}>
            <div className={styles.modalHeader}>
              <h3 style={{ fontSize: 17, fontWeight: 700 }}>Confirm Delete</h3>
              <button className={styles.closeBtn} onClick={() => setShowDeleteConfirm(false)}>×</button>
            </div>
            <div className={styles.modalBody}>
              <p style={{ color: "var(--text-secondary)", fontSize: 14, lineHeight: 1.6 }}>
                Are you sure you want to delete <strong>Charge #{selectedRow?.ChargeNo}</strong> for
                &nbsp;<strong>{selectedRow?.PttName}</strong>?
                <br />This action cannot be undone.
              </p>
            </div>
            <div className={styles.modalFooter}>
              <button className={styles.secondaryBtn} onClick={() => setShowDeleteConfirm(false)}>
                Cancel
              </button>
              <button
                className={styles.primaryBtn}
                style={{ background: "var(--status-danger)", minWidth: 100 }}
                onClick={handleDelete}
                disabled={deleting}
              >
                {deleting ? <RefreshCw size={14} className="animate-spin" /> : "Delete"}
              </button>
            </div>
          </div>
        </div>
      )}

      {/* ── Page header ───────────────────────────────────────────────────────── */}
      <div style={{
        display: "flex", alignItems: "center", justifyContent: "space-between",
        paddingBottom: 16, borderBottom: "1px solid var(--border-light)",
      }}>
        <div>
          <h2 style={{ fontSize: 22, fontWeight: 700, color: "var(--text-primary)", margin: 0 }}>
            Indoor Charges
          </h2>
          <p style={{ color: "var(--text-secondary)", fontSize: 13, marginTop: 3 }}>
            Transaction summary — charge sessions per admitted patient
          </p>
        </div>
        <span style={{
          background: "var(--accent-light)", color: "var(--accent-color)",
          padding: "6px 14px", borderRadius: 8, fontSize: 12, fontWeight: 700,
        }}>
          IPD MODULE
        </span>
      </div>

      {/* ── Summary KPI cards ─────────────────────────────────────────────────── */}
      <div style={{ display: "grid", gridTemplateColumns: "repeat(3, 1fr)", gap: 16 }}>
        {[
          { label: "Total Charges", value: filtered.length, icon: <FileText size={20} />, color: "var(--accent-color)", bg: "var(--accent-light)" },
          { label: "Gross Amount",  value: fmtAmt(totalGross), icon: <IndianRupee size={20} />, color: "#7c3aed", bg: "#ede9fe" },
          { label: "Net Amount",    value: fmtAmt(totalNet),   icon: <IndianRupee size={20} />, color: "var(--status-success)", bg: "var(--status-success-light)" },
        ].map(k => (
          <div key={k.label} className={styles.card}>
            <div className={styles.cardInfo}>
              <span className={styles.cardLabel}>{k.label}</span>
              <span style={{ fontSize: typeof k.value === "string" ? 20 : 32, fontWeight: 700, color: "var(--text-primary)", fontFamily: "Outfit, sans-serif" }}>
                {k.value}
              </span>
            </div>
            <div className={styles.cardIcon} style={{ color: k.color, background: k.bg }}>
              {k.icon}
            </div>
          </div>
        ))}
      </div>

      {/* ── Main panel ────────────────────────────────────────────────────────── */}
      <div className={styles.sectionBox} style={{ padding: 0, overflow: "hidden" }}>

        {/* Filters row */}
        <div style={{
          padding: "16px 20px",
          background: "var(--bg-secondary)",
          borderBottom: "1px solid var(--border-light)",
          display: "flex", alignItems: "center", gap: 12, flexWrap: "wrap",
        }}>
          {/* Search */}
          <div className={styles.searchBar} style={{ maxWidth: 280, flex: 1 }}>
            <Search size={16} style={{ color: "var(--text-muted)", flexShrink: 0 }} />
            <input
              id="charge-search"
              type="text"
              placeholder="Search patient, UHID, charge no…"
              value={search}
              onChange={e => setSearch(e.target.value)}
            />
          </div>

          {/* Date From */}
          <div style={{ display: "flex", alignItems: "center", gap: 8 }}>
            <CalendarDays size={14} style={{ color: "var(--text-muted)" }} />
            <span style={{ fontSize: 12, color: "var(--text-secondary)", fontWeight: 600 }}>From</span>
            <input
              id="charge-date-from"
              type="date"
              value={startDate}
              onChange={e => setStartDate(e.target.value)}
              style={{
                border: "1px solid var(--border-light)",
                borderRadius: 8, padding: "7px 10px",
                fontSize: 13, background: "var(--bg-card)",
                color: "var(--text-primary)", outline: "none",
              }}
            />
          </div>

          {/* Date To */}
          <div style={{ display: "flex", alignItems: "center", gap: 8 }}>
            <span style={{ fontSize: 12, color: "var(--text-secondary)", fontWeight: 600 }}>To</span>
            <input
              id="charge-date-to"
              type="date"
              value={endDate}
              onChange={e => setEndDate(e.target.value)}
              style={{
                border: "1px solid var(--border-light)",
                borderRadius: 8, padding: "7px 10px",
                fontSize: 13, background: "var(--bg-card)",
                color: "var(--text-primary)", outline: "none",
              }}
            />
          </div>
        </div>

        {/* Toolbar */}
        <div style={{
          padding: "10px 20px",
          borderBottom: "1px solid var(--border-light)",
          display: "flex", alignItems: "center", gap: 8, flexWrap: "wrap",
        }}>
          {/* Add */}
          <button
            id="btn-add-charge"
            className={styles.primaryBtn}
            style={{ gap: 6, padding: "8px 16px", fontSize: 13 }}
            onClick={() => router.push("/dashboard/ipd/charges/new")}
          >
            <Plus size={15} /> Add
          </button>

          {/* Edit */}
          <button
            id="btn-edit-charge"
            className={styles.secondaryBtn}
            style={{ gap: 6, padding: "8px 16px", fontSize: 13, opacity: selected ? 1 : 0.5 }}
            disabled={!selected}
            onClick={() => selected && router.push(`/dashboard/ipd/charges/${selected}/edit`)}
          >
            <Pencil size={15} /> Edit
          </button>

          {/* Delete */}
          <button
            id="btn-delete-charge"
            className={styles.secondaryBtn}
            style={{ gap: 6, padding: "8px 16px", fontSize: 13, opacity: selected ? 1 : 0.5, color: selected ? "var(--status-danger)" : undefined }}
            disabled={!selected}
            onClick={() => setShowDeleteConfirm(true)}
          >
            <Trash2 size={15} /> Delete
          </button>

          <div style={{ width: 1, height: 28, background: "var(--border-light)", margin: "0 4px" }} />

          {/* Print */}
          <button
            id="btn-print-charge"
            className={styles.secondaryBtn}
            style={{ gap: 6, padding: "8px 16px", fontSize: 13, opacity: selected ? 1 : 0.5 }}
            disabled={!selected}
            onClick={handlePrint}
          >
            <Printer size={15} /> Print
          </button>

          {/* Refresh */}
          <button
            id="btn-refresh-charges"
            className={styles.secondaryBtn}
            style={{ gap: 6, padding: "8px 16px", fontSize: 13 }}
            onClick={fetchRows}
            disabled={loading}
          >
            <RefreshCw size={15} className={loading ? "animate-spin" : ""} /> Refresh
          </button>

          {/* Export */}
          <button
            id="btn-export-charges"
            className={styles.secondaryBtn}
            style={{ gap: 6, padding: "8px 16px", fontSize: 13 }}
            onClick={handleExport}
          >
            <Download size={15} /> Export
          </button>

          {selected && (
            <span style={{ marginLeft: "auto", fontSize: 12, color: "var(--text-secondary)", fontStyle: "italic" }}>
              Selected: Charge #{selectedRow?.ChargeNo} — {selectedRow?.PttName}
            </span>
          )}
        </div>

        {/* Grid */}
        {loading ? (
          <div style={{ padding: 60, textAlign: "center" }}>
            <RefreshCw size={28} style={{ color: "var(--text-muted)", animation: "spin 1s linear infinite" }} />
            <p style={{ marginTop: 12, color: "var(--text-secondary)", fontSize: 14 }}>Loading charges…</p>
          </div>
        ) : filtered.length === 0 ? (
          <div style={{ padding: 60, textAlign: "center" }}>
            <FileText size={40} style={{ color: "var(--text-muted)", marginBottom: 12 }} />
            <h4 style={{ fontSize: 15, fontWeight: 600, color: "var(--text-primary)", margin: "0 0 6px" }}>
              No Charges Found
            </h4>
            <p style={{ fontSize: 13, color: "var(--text-secondary)" }}>
              Adjust the date range or search term, or click Add to create a new charge.
            </p>
          </div>
        ) : (
          <>
            <div className={styles.tableContainer} style={{ maxHeight: "calc(100vh - 460px)", overflowY: "auto" }}>
              <table className={styles.table} style={{ fontSize: 13 }}>
                <thead>
                  <tr>
                    <th style={{ width: 90  }}>Charge No</th>
                    <th style={{ width: 100 }}>Date</th>
                    <th style={{ width: 80  }}>Voucher</th>
                    <th style={{ width: 70  }}>IPD No</th>
                    <th>Patient Name</th>
                    <th style={{ width: 80  }}>UHID</th>
                    <th>Doctor</th>
                    <th>Charge Group</th>
                    <th style={{ width: 100, textAlign: "right" }}>Gross Amt</th>
                    <th style={{ width: 90,  textAlign: "right" }}>Discount</th>
                    <th style={{ width: 100, textAlign: "right" }}>Net Amt</th>
                    <th style={{ width: 80  }}>Status</th>
                  </tr>
                </thead>
                <tbody>
                  {filtered.map(r => (
                    <tr
                      key={r.IbhCode}
                      onClick={() => setSelected(r.IbhCode === selected ? null : r.IbhCode)}
                      onDoubleClick={() => router.push(`/dashboard/ipd/charges/${r.IbhCode}/edit`)}
                      style={{
                        cursor: "pointer",
                        background: selected === r.IbhCode ? "var(--accent-light)" : undefined,
                        transition: "background .12s",
                      }}
                    >
                      <td style={{ fontWeight: 700, color: "var(--accent-color)" }}>
                        #{r.ChargeNo}
                      </td>
                      <td style={{ color: "var(--text-secondary)" }}>{fmtDate(r.Date)}</td>
                      <td style={{ fontSize: 12 }}>{r.Voucher || "—"}</td>
                      <td style={{ fontSize: 12, color: "var(--text-secondary)" }}>
                        {r.IpdNo ?? "—"}
                      </td>
                      <td style={{ fontWeight: 600 }}>{r.PttName || "—"}</td>
                      <td style={{ fontSize: 12, color: "var(--text-secondary)" }}>
                        {r.PttRegNo ?? "—"}
                      </td>
                      <td style={{ fontSize: 12 }}>{r.DctName || "—"}</td>
                      <td style={{ fontSize: 12 }}>{r.ChargeGroup || "—"}</td>
                      <td style={{ textAlign: "right", fontWeight: 500 }}>{fmtAmt(r.GrossAmt)}</td>
                      <td style={{ textAlign: "right", color: "var(--status-danger)", fontSize: 12 }}>
                        {r.DiscAmt > 0 ? `−${fmtAmt(r.DiscAmt)}` : "—"}
                      </td>
                      <td style={{ textAlign: "right", fontWeight: 700, color: "var(--status-success)" }}>
                        {fmtAmt(r.NetAmt)}
                      </td>
                      <td>{statusBadge(r.Status)}</td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>

            {/* Footer totals */}
            <div style={{
              padding: "12px 20px",
              background: "var(--bg-secondary)",
              borderTop: "1px solid var(--border-light)",
              display: "flex", gap: 32, alignItems: "center",
              fontSize: 13, fontWeight: 600,
            }}>
              <span style={{ color: "var(--text-secondary)" }}>
                {filtered.length} record{filtered.length !== 1 ? "s" : ""}
              </span>
              <span>
                Gross: <span style={{ color: "var(--text-primary)" }}>{fmtAmt(totalGross)}</span>
              </span>
              <span>
                Discount: <span style={{ color: "var(--status-danger)" }}>{fmtAmt(totalDisc)}</span>
              </span>
              <span>
                Net Total: <span style={{ color: "var(--status-success)", fontSize: 15 }}>{fmtAmt(totalNet)}</span>
              </span>
            </div>
          </>
        )}
      </div>
    </div>
  );
}
