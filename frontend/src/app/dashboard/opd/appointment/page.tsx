"use client";
import React, { useEffect, useState, useCallback } from "react";
import styles from "../../../dashboard.module.css";
import { RefreshCw, Search, Calendar } from "lucide-react";

const API = "http://127.0.0.1:8000/api/opd";

interface AppointmentRow {
  OpgCode:    number;
  OpdNo:      string;
  Date:       string;
  Time:       string;
  Token:      number;
  PttRegNo:   number | null;
  PttName:    string;
  AgeGender:  string;
  DctName:    string;
  Department: string;
  Scheme:     string;
  NetAmt:     number;
  Status:     string;
  Remark:     string;
}

function getDefaultDates() {
  const to = new Date(); const from = new Date(); from.setDate(from.getDate() - 7);
  return { from: from.toISOString().split("T")[0], to: to.toISOString().split("T")[0] };
}

const STATUS_COLOR: Record<string, string> = { Paid: "var(--status-success)", Free: "var(--text-muted)", Due: "var(--status-danger)" };

export default function OPDAppointmentPage() {
  const def = getDefaultDates();
  const [list, setList]         = useState<AppointmentRow[]>([]);
  const [loading, setLoading]   = useState(false);
  const [fromDate, setFromDate] = useState(def.from);
  const [toDate, setToDate]     = useState(def.to);
  const [search, setSearch]     = useState("");
  const [selectedRow, setSelectedRow] = useState<AppointmentRow | null>(null);

  const loadList = useCallback(async () => {
    setLoading(true);
    try {
      const r = await fetch(`${API}/appointments?from_date=${fromDate}&to_date=${toDate}`);
      if (r.ok) setList(await r.json());
    } catch (e) { console.error(e); } finally { setLoading(false); }
  }, [fromDate, toDate]);

  useEffect(() => { loadList(); }, [loadList]);

  const filtered = list.filter(r =>
    r.PttName.toLowerCase().includes(search.toLowerCase()) ||
    String(r.PttRegNo || "").includes(search) ||
    r.OpdNo.toLowerCase().includes(search.toLowerCase()) ||
    r.DctName.toLowerCase().includes(search.toLowerCase())
  );

  return (
    <div style={{ display: "flex", flexDirection: "column", height: "100%", gap: 0 }}>
      <div className={styles.toolbar} style={{ flexWrap: "wrap", gap: 8 }}>
        <div className={styles.searchBar}>
          <Search size={16} style={{ color: "var(--text-muted)" }} />
          <input placeholder="Search patient, doctor, OPD No…" value={search} onChange={e => setSearch(e.target.value)} />
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
        <span style={{ fontSize: 13, fontWeight: 700, color: "var(--text-secondary)" }}>OPD Appointment Schedule</span>
      </div>

      <div className={styles.sectionBox} style={{ padding: 0, flex: 1, display: "flex", flexDirection: "column", overflow: "hidden" }}>
        <div style={{ flex: 1, overflowY: "auto" }}>
          {loading ? (
            <div style={{ padding: 40, textAlign: "center" }}>
              <RefreshCw size={24} className="animate-spin" style={{ color: "var(--text-muted)", margin: "0 auto 10px" }} />
              <span style={{ color: "var(--text-secondary)" }}>Loading…</span>
            </div>
          ) : (
            <table className={styles.table} style={{ fontSize: 12, minWidth: 1200, borderCollapse: "collapse", width: "100%" }}>
              <thead style={{ position: "sticky", top: 0, zIndex: 10, background: "var(--bg-secondary)" }}>
                <tr>
                  <th>Date</th>
                  <th>Time</th>
                  <th>Token</th>
                  <th>OPD No</th>
                  <th>Patient Name</th>
                  <th>Age/Gender</th>
                  <th>Doctor</th>
                  <th>Department</th>
                  <th>Scheme</th>
                  <th>Status</th>
                  <th>Remark</th>
                </tr>
              </thead>
              <tbody>
                {filtered.length === 0 ? (
                  <tr>
                    <td colSpan={11} style={{ padding: "40px 0", textAlign: "center", color: "var(--text-secondary)" }}>
                      No appointments found.
                    </td>
                  </tr>
                ) : (
                  filtered.map(r => {
                    const selected = selectedRow?.OpgCode === r.OpgCode;
                    return (
                      <tr key={r.OpgCode} onClick={() => setSelectedRow(r)}
                        style={{ background: selected ? "var(--accent-light)" : "transparent", cursor: "pointer", borderBottom: "1px solid var(--border-light)" }}>
                        <td>{r.Date}</td>
                        <td style={{ color: "var(--text-secondary)", fontSize: 11 }}>{r.Time || "—"}</td>
                        <td>
                          <span style={{ background: "var(--accent-color)", color: "#fff", borderRadius: 4, padding: "2px 7px", fontWeight: 700, fontSize: 11 }}>
                            {r.Token}
                          </span>
                        </td>
                        <td><span style={{ color: "var(--accent-color)", fontWeight: 600 }}>{r.OpdNo}</span></td>
                        <td><strong>{r.PttName}</strong></td>
                        <td style={{ fontSize: 11, color: "var(--text-secondary)" }}>{r.AgeGender || "—"}</td>
                        <td>{r.DctName || "—"}</td>
                        <td style={{ fontSize: 11 }}>{r.Department || "—"}</td>
                        <td>{r.Scheme || "—"}</td>
                        <td>
                          <span style={{ fontSize: 11, fontWeight: 600, color: STATUS_COLOR[r.Status] || "var(--text-primary)" }}>
                            {r.Status}
                          </span>
                        </td>
                        <td style={{ fontSize: 11, color: "var(--text-secondary)" }}>{r.Remark || "—"}</td>
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
            <span>Total Appointments: {filtered.length}</span>
          </div>
        )}
      </div>
    </div>
  );
}
