"use client";
import React, { useEffect, useState, useCallback } from "react";
import styles from "../../../dashboard.module.css";
import { RefreshCw, Search, CreditCard } from "lucide-react";

const API = "http://127.0.0.1:8000/api/opd";

interface ConsultDueRow {
  OrrCode:    number;
  OrrOpgCode: number;
  Date:       string;
  Time:       string;
  VchNo:      string;
  PttName:    string;
  PttRegNo:   number | null;
  Scheme:     string;
  PymtMode:   string;
  BillAmt:    number;
  Collected:  number;
  Balance:    number;
  Remark:     string;
  CareOf:     string;
  Address:    string;
}

function getDefaultDates() {
  const to   = new Date();
  const from = new Date();
  from.setDate(from.getDate() - 30);
  return {
    from: from.toISOString().split("T")[0],
    to:   to.toISOString().split("T")[0],
  };
}

export default function OPDConsultationDuePage() {
  const def = getDefaultDates();
  const [list, setList]           = useState<ConsultDueRow[]>([]);
  const [loading, setLoading]     = useState(false);
  const [fromDate, setFromDate]   = useState(def.from);
  const [toDate, setToDate]       = useState(def.to);
  const [search, setSearch]       = useState("");
  const [selectedRow, setSelectedRow] = useState<ConsultDueRow | null>(null);

  const loadList = useCallback(async () => {
    setLoading(true);
    try {
      const r = await fetch(`${API}/consultations/due?from_date=${fromDate}&to_date=${toDate}`);
      if (r.ok) setList(await r.json());
    } catch (e) { console.error(e); }
    finally { setLoading(false); }
  }, [fromDate, toDate]);

  useEffect(() => { loadList(); }, [loadList]);

  const filtered = list.filter(r =>
    r.PttName.toLowerCase().includes(search.toLowerCase()) ||
    String(r.PttRegNo || "").includes(search)
  );

  const totalBill = filtered.reduce((s, r) => s + r.BillAmt, 0);
  const totalColl = filtered.reduce((s, r) => s + r.Collected, 0);
  const totalBal  = filtered.reduce((s, r) => s + r.Balance, 0);

  return (
    <div style={{ display: "flex", flexDirection: "column", height: "100%", gap: 0 }}>
      {/* Toolbar */}
      <div className={styles.toolbar} style={{ flexWrap: "wrap", gap: 8 }}>
        <div className={styles.searchBar}>
          <Search size={16} style={{ color: "var(--text-muted)" }} />
          <input placeholder="Search patient…" value={search} onChange={e => setSearch(e.target.value)} />
        </div>
        <div style={{ display: "flex", alignItems: "center", gap: 8, marginLeft: "auto" }}>
          <span style={{ fontSize: 13, color: "var(--text-secondary)" }}>From:</span>
          <input type="date" value={fromDate} onChange={e => setFromDate(e.target.value)}
            style={{ padding: "4px 8px", border: "1px solid var(--border-light)", borderRadius: 6, background: "var(--bg-card)", color: "var(--text-primary)" }} />
          <span style={{ fontSize: 13, color: "var(--text-secondary)" }}>To:</span>
          <input type="date" value={toDate} onChange={e => setToDate(e.target.value)}
            style={{ padding: "4px 8px", border: "1px solid var(--border-light)", borderRadius: 6, background: "var(--bg-card)", color: "var(--text-primary)" }} />
          <button onClick={loadList} className={styles.btnSecondary} style={{ display: "flex", alignItems: "center", gap: 6 }}>
            <RefreshCw size={14} /> Refresh
          </button>
        </div>
        <span style={{ fontSize: 13, fontWeight: 700, color: "var(--text-secondary)" }}>OPD Consultation Due Payments</span>
      </div>

      {/* Table */}
      <div className={styles.sectionBox} style={{ padding: 0, flex: 1, display: "flex", flexDirection: "column", overflow: "hidden" }}>
        <div style={{ flex: 1, overflowY: "auto" }}>
          {loading ? (
            <div style={{ padding: 40, textAlign: "center" }}>
              <RefreshCw size={24} className="animate-spin" style={{ color: "var(--text-muted)", margin: "0 auto 10px" }} />
              <span style={{ color: "var(--text-secondary)" }}>Loading…</span>
            </div>
          ) : (
            <table className={styles.table} style={{ fontSize: 12, minWidth: 1300, borderCollapse: "collapse", width: "100%" }}>
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
                  <th style={{ textAlign: "right" }}>Bill Amount</th>
                  <th style={{ textAlign: "right" }}>Collected</th>
                  <th style={{ textAlign: "right" }}>Balance</th>
                  <th>Remark</th>
                  <th>Care of</th>
                  <th>Address</th>
                </tr>
              </thead>
              <tbody>
                {filtered.length === 0 ? (
                  <tr>
                    <td colSpan={14} style={{ padding: "40px 0", textAlign: "center", color: "var(--text-secondary)" }}>
                      No consultation due payment records found.
                    </td>
                  </tr>
                ) : (
                  filtered.map(r => {
                    const selected = selectedRow?.OrrCode === r.OrrCode;
                    return (
                      <tr key={r.OrrCode} onClick={() => setSelectedRow(r)}
                        style={{ background: selected ? "var(--accent-light)" : "transparent", cursor: "pointer", borderBottom: "1px solid var(--border-light)" }}>
                        <td>{r.Date}</td>
                        <td>{r.Time || "—"}</td>
                        <td>Consultation Due</td>
                        <td><strong style={{ color: "var(--accent-color)" }}>{r.VchNo}</strong></td>
                        <td><strong>{r.PttName}</strong></td>
                        <td>{r.PttRegNo || "—"}</td>
                        <td>{r.Scheme || "—"}</td>
                        <td>{r.PymtMode}</td>
                        <td style={{ textAlign: "right" }}>₹{r.BillAmt.toFixed(2)}</td>
                        <td style={{ textAlign: "right", fontWeight: 700, color: "var(--status-success)" }}>₹{r.Collected.toFixed(2)}</td>
                        <td style={{ textAlign: "right", fontWeight: 700, color: r.Balance > 0 ? "var(--status-danger)" : "var(--text-secondary)" }}>₹{r.Balance.toFixed(2)}</td>
                        <td style={{ fontSize: 11, color: "var(--text-secondary)" }}>{r.Remark || "—"}</td>
                        <td>{r.CareOf || "—"}</td>
                        <td>{r.Address || "—"}</td>
                      </tr>
                    );
                  })
                )}
              </tbody>
            </table>
          )}
        </div>
        {/* Footer */}
        {filtered.length > 0 && (
          <div style={{ padding: "8px 16px", borderTop: "2px solid var(--border-light)", background: "var(--bg-secondary)", display: "flex", justifyContent: "flex-end", gap: 24, fontSize: 13, fontWeight: 700 }}>
            <span>Records: {filtered.length}</span>
            <span>Total Bill: ₹{totalBill.toFixed(2)}</span>
            <span style={{ color: "var(--status-success)" }}>Total Collected: ₹{totalColl.toFixed(2)}</span>
            <span style={{ color: "var(--status-danger)" }}>Total Balance: ₹{totalBal.toFixed(2)}</span>
          </div>
        )}
      </div>
    </div>
  );
}
