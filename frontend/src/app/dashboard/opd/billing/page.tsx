"use client";
import React, { useEffect, useState, useCallback } from "react";
import styles from "../../../dashboard.module.css";
import { RefreshCw, Search, FileText } from "lucide-react";

const API = "http://127.0.0.1:8000/api/opd";

interface CasualBillRow {
  OhdCode:  number;
  VchNo:    number;
  Date:     string;
  Time:     string;
  BillType: string;
  PttName:  string;
  PttRegNo: number | null;
  DctName:  string;
  Scheme:   string;
  TotalAmt: number;
  DiscPer:  number;
  DiscAmt:  number;
  NetAmt:   number;
  PaidAmt:  number;
  BalAmt:   number;
  RefuAmt:  number;
  Remark:   string;
  CareOf:   string;
  Address:  string;
}

function getDefaultDates() {
  const to = new Date(); const from = new Date(); from.setDate(from.getDate() - 30);
  return { from: from.toISOString().split("T")[0], to: to.toISOString().split("T")[0] };
}

export default function OPDCasualBillPage() {
  const def = getDefaultDates();
  const [list, setList]         = useState<CasualBillRow[]>([]);
  const [loading, setLoading]   = useState(false);
  const [fromDate, setFromDate] = useState(def.from);
  const [toDate, setToDate]     = useState(def.to);
  const [search, setSearch]     = useState("");
  const [selectedRow, setSelectedRow] = useState<CasualBillRow | null>(null);

  const loadList = useCallback(async () => {
    setLoading(true);
    try {
      const r = await fetch(`${API}/casual-bills?from_date=${fromDate}&to_date=${toDate}`);
      if (r.ok) setList(await r.json());
    } catch (e) { console.error(e); } finally { setLoading(false); }
  }, [fromDate, toDate]);

  useEffect(() => { loadList(); }, [loadList]);

  const filtered = list.filter(r =>
    r.PttName.toLowerCase().includes(search.toLowerCase()) ||
    String(r.PttRegNo || "").includes(search) ||
    r.DctName.toLowerCase().includes(search.toLowerCase())
  );

  const totTotal = filtered.reduce((s, r) => s + r.TotalAmt, 0);
  const totNet   = filtered.reduce((s, r) => s + r.NetAmt, 0);
  const totPaid  = filtered.reduce((s, r) => s + r.PaidAmt, 0);
  const totBal   = filtered.reduce((s, r) => s + r.BalAmt, 0);

  return (
    <div style={{ display: "flex", flexDirection: "column", height: "100%", gap: 0 }}>
      <div className={styles.toolbar} style={{ flexWrap: "wrap", gap: 8 }}>
        <div className={styles.searchBar}>
          <Search size={16} style={{ color: "var(--text-muted)" }} />
          <input placeholder="Search patient, doctor…" value={search} onChange={e => setSearch(e.target.value)} />
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
        <span style={{ fontSize: 13, fontWeight: 700, color: "var(--text-secondary)" }}>OPD Casual Bills</span>
      </div>

      <div className={styles.sectionBox} style={{ padding: 0, flex: 1, display: "flex", flexDirection: "column", overflow: "hidden" }}>
        <div style={{ flex: 1, overflowY: "auto" }}>
          {loading ? (
            <div style={{ padding: 40, textAlign: "center" }}>
              <RefreshCw size={24} className="animate-spin" style={{ color: "var(--text-muted)", margin: "0 auto 10px" }} />
            </div>
          ) : (
            <table className={styles.table} style={{ fontSize: 12, minWidth: 1400, borderCollapse: "collapse", width: "100%" }}>
              <thead style={{ position: "sticky", top: 0, zIndex: 10, background: "var(--bg-secondary)" }}>
                <tr>
                  <th>Date</th>
                  <th>Time</th>
                  <th>Voucher</th>
                  <th>Bill No</th>
                  <th>Patient Name</th>
                  <th>Reg.No (UHID)</th>
                  <th>Doctor</th>
                  <th>Scheme</th>
                  <th style={{ textAlign: "right" }}>Total Amt</th>
                  <th style={{ textAlign: "right" }}>Disc %</th>
                  <th style={{ textAlign: "right" }}>Net Amt</th>
                  <th style={{ textAlign: "right" }}>Paid</th>
                  <th style={{ textAlign: "right" }}>Balance</th>
                  <th>Remark</th>
                  <th>Care of</th>
                  <th>Address</th>
                </tr>
              </thead>
              <tbody>
                {filtered.length === 0 ? (
                  <tr>
                    <td colSpan={16} style={{ padding: "40px 0", textAlign: "center", color: "var(--text-secondary)" }}>
                      No casual bill records found.
                    </td>
                  </tr>
                ) : (
                  filtered.map(r => {
                    const selected = selectedRow?.OhdCode === r.OhdCode;
                    return (
                      <tr key={r.OhdCode} onClick={() => setSelectedRow(r)}
                        style={{ background: selected ? "var(--accent-light)" : "transparent", cursor: "pointer", borderBottom: "1px solid var(--border-light)" }}>
                        <td>{r.Date}</td>
                        <td style={{ color: "var(--text-secondary)", fontSize: 11 }}>{r.Time || "—"}</td>
                        <td>{r.BillType}</td>
                        <td><strong style={{ color: "var(--accent-color)" }}>#{r.VchNo}</strong></td>
                        <td><strong>{r.PttName}</strong></td>
                        <td>{r.PttRegNo || "—"}</td>
                        <td>{r.DctName || "—"}</td>
                        <td>{r.Scheme || "—"}</td>
                        <td style={{ textAlign: "right" }}>₹{r.TotalAmt.toFixed(2)}</td>
                        <td style={{ textAlign: "right", color: "var(--text-secondary)" }}>{r.DiscPer.toFixed(1)}%</td>
                        <td style={{ textAlign: "right", fontWeight: 700 }}>₹{r.NetAmt.toFixed(2)}</td>
                        <td style={{ textAlign: "right", color: "var(--status-success)", fontWeight: 700 }}>₹{r.PaidAmt.toFixed(2)}</td>
                        <td style={{ textAlign: "right", color: r.BalAmt > 0 ? "var(--status-danger)" : "var(--text-muted)" }}>₹{r.BalAmt.toFixed(2)}</td>
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
        {filtered.length > 0 && (
          <div style={{ padding: "8px 16px", borderTop: "2px solid var(--border-light)", background: "var(--bg-secondary)", display: "flex", justifyContent: "flex-end", gap: 24, fontSize: 13, fontWeight: 700 }}>
            <span>Records: {filtered.length}</span>
            <span>Total: ₹{totTotal.toFixed(2)}</span>
            <span>Net: ₹{totNet.toFixed(2)}</span>
            <span style={{ color: "var(--status-success)" }}>Paid: ₹{totPaid.toFixed(2)}</span>
            <span style={{ color: totBal > 0 ? "var(--status-danger)" : "var(--text-muted)" }}>Balance: ₹{totBal.toFixed(2)}</span>
          </div>
        )}
      </div>
    </div>
  );
}
