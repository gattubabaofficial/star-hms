"use client";
import React, { useState, useEffect } from "react";
import styles from "../../../dashboard.module.css";
import { Search, RefreshCw, History, User } from "lucide-react";

const API = "http://127.0.0.1:8000/api/opd";

interface HistoryItem {
  Date:        string;
  Time:        string;
  Type:        string;
  VchNo:       string;
  Doctor:      string;
  Department:  string;
  Diagnosis:   string;
  Amount:      number;
  Paid:        number;
  Balance:     number;
  Status:      string;
  Remark:      string;
}

interface Patient {
  PttCode:  number;
  PttRegNo: number | null;
  PttName:  string;
  PttSex:   string;
  Age:      string;
  PttTelNo: string;
}

export default function OPDClinicalHistoryPage() {
  const [searchVal, setSearchVal]       = useState("");
  const [patients, setPatients]         = useState<Patient[]>([]);
  const [selectedPat, setSelectedPat]   = useState<Patient | null>(null);
  const [showDropdown, setShowDropdown] = useState(false);
  const [history, setHistory]           = useState<HistoryItem[]>([]);
  const [loading, setLoading]           = useState(false);

  // Patient search trigger
  useEffect(() => {
    if (!searchVal.trim()) {
      setPatients([]);
      return;
    }
    const t = setTimeout(async () => {
      try {
        const res = await fetch(`${API}/lookup/patients?search=${encodeURIComponent(searchVal)}`);
        if (res.ok) setPatients(await res.json());
      } catch (e) { console.error(e); }
    }, 300);
    return () => clearTimeout(t);
  }, [searchVal]);

  const selectPatient = async (p: Patient) => {
    setSelectedPat(p);
    setSearchVal(p.PttName);
    setShowDropdown(false);
    setLoading(true);
    try {
      const res = await fetch(`${API}/clinical-history/${p.PttCode}`);
      if (res.ok) {
        const data = await res.json();
        setHistory(data.History || []);
      }
    } catch (e) { console.error(e); } finally { setLoading(false); }
  };

  return (
    <div style={{ display: "flex", flexDirection: "column", height: "100%", gap: 12 }}>
      {/* Search Header */}
      <div className={styles.sectionBox} style={{ padding: "16px 20px" }}>
        <div style={{ fontSize: 14, fontWeight: 700, marginBottom: 8, color: "var(--text-secondary)" }}>
          Patient Search for Clinical History
        </div>
        <div style={{ display: "flex", gap: 12, position: "relative", maxWidth: 500 }}>
          <div style={{ flex: 1, position: "relative" }}>
            <input
              type="text"
              placeholder="Search patient by name or phone..."
              value={searchVal}
              onChange={e => { setSearchVal(e.target.value); setShowDropdown(true); }}
              style={{
                width: "100%", padding: "8px 12px 8px 36px",
                border: "1px solid var(--border-light)", borderRadius: 8,
                background: "var(--bg-card)", color: "var(--text-primary)"
              }}
            />
            <Search size={16} style={{ position: "absolute", left: 12, top: "50%", transform: "translateY(-50%)", color: "var(--text-muted)" }} />
            
            {showDropdown && patients.length > 0 && (
              <div style={{
                position: "absolute", top: "100%", left: 0, right: 0, zIndex: 100,
                background: "var(--bg-card)", border: "1px solid var(--border-light)",
                borderRadius: 8, boxShadow: "0 4px 12px rgba(0,0,0,0.1)",
                maxHeight: 250, overflowY: "auto", marginTop: 4
              }}>
                {patients.map(p => (
                  <div key={p.PttCode} onClick={() => selectPatient(p)}
                    style={{ padding: "10px 14px", cursor: "pointer", borderBottom: "1px solid var(--border-light)" }}
                    onMouseEnter={e => e.currentTarget.style.background = "var(--bg-secondary)"}
                    onMouseLeave={e => e.currentTarget.style.background = ""}>
                    <div style={{ fontWeight: 600, fontSize: 13 }}>{p.PttName} (UHID: {p.PttRegNo})</div>
                    <div style={{ fontSize: 11, color: "var(--text-secondary)" }}>{p.PttSex} · {p.Age} Yrs · {p.PttTelNo}</div>
                  </div>
                ))}
              </div>
            )}
          </div>
        </div>

        {selectedPat && (
          <div style={{ display: "flex", gap: 24, marginTop: 14, fontSize: 13, padding: "10px 14px", background: "var(--bg-secondary)", borderRadius: 8, border: "1px solid var(--border-light)", width: "fit-content" }}>
            <span><strong>UHID:</strong> {selectedPat.PttRegNo || "—"}</span>
            <span><strong>Patient Name:</strong> {selectedPat.PttName}</span>
            <span><strong>Age/Gender:</strong> {selectedPat.Age} Yrs / {selectedPat.PttSex}</span>
            <span><strong>Phone:</strong> {selectedPat.PttTelNo || "—"}</span>
          </div>
        )}
      </div>

      {/* History table */}
      <div className={styles.sectionBox} style={{ padding: 0, flex: 1, display: "flex", flexDirection: "column", overflow: "hidden" }}>
        <div style={{ flex: 1, overflowY: "auto" }}>
          {loading ? (
            <div style={{ padding: 50, textAlign: "center" }}>
              <RefreshCw size={24} className="animate-spin" style={{ color: "var(--text-muted)", margin: "0 auto 10px" }} />
              <div style={{ color: "var(--text-secondary)", fontSize: 13 }}>Fetching clinical logs...</div>
            </div>
          ) : !selectedPat ? (
            <div style={{ padding: 60, textAlign: "center", color: "var(--text-muted)" }}>
              <User size={40} style={{ margin: "0 auto 14px", opacity: 0.3 }} />
              <div style={{ fontSize: 14, fontWeight: 600 }}>No Patient Selected</div>
              <div style={{ fontSize: 12 }}>Please search and select a patient above to load their history records.</div>
            </div>
          ) : history.length === 0 ? (
            <div style={{ padding: 60, textAlign: "center", color: "var(--text-muted)" }}>
              <History size={40} style={{ margin: "0 auto 14px", opacity: 0.3 }} />
              <div style={{ fontSize: 14, fontWeight: 600 }}>No History Found</div>
              <div style={{ fontSize: 12 }}>This patient does not have any recorded consultations or diagnostic receipts.</div>
            </div>
          ) : (
            <table className={styles.table} style={{ fontSize: 12, minWidth: 1000, borderCollapse: "collapse", width: "100%" }}>
              <thead style={{ position: "sticky", top: 0, zIndex: 10, background: "var(--bg-secondary)" }}>
                <tr>
                  <th>Date</th>
                  <th>OPD No</th>
                  <th>Doctor</th>
                  <th>Diagnosis</th>
                  <th>Receipt Type</th>
                  <th style={{ textAlign: "right" }}>Amount</th>
                  <th>Status</th>
                </tr>
              </thead>
              <tbody>
                {history.map((item, idx) => (
                  <tr key={idx} style={{ borderBottom: "1px solid var(--border-light)" }}>
                    <td>{item.Date}</td>
                    <td><strong style={{ color: "var(--accent-color)" }}>{item.VchNo}</strong></td>
                    <td>{item.Doctor || "—"}</td>
                    <td style={{ fontStyle: "italic", color: "var(--text-secondary)" }}>{item.Diagnosis || "—"}</td>
                    <td>{item.Type}</td>
                    <td style={{ textAlign: "right", fontWeight: 700 }}>₹{item.Amount.toFixed(2)}</td>
                    <td>
                      <span style={{
                        fontSize: 11, fontWeight: 600,
                        color: item.Status === "Paid" ? "var(--status-success)" : "var(--status-danger)"
                      }}>{item.Status}</span>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          )}
        </div>
      </div>
    </div>
  );
}
