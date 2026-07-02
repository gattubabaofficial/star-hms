"use client";

import React, { useEffect, useState, useRef } from "react";
import styles from "../../../dashboard.module.css";
import {
  Search, RefreshCw, X, FileText, Calendar, Clock, AlertCircle, CheckCircle, Info
} from "lucide-react";

const API = "http://127.0.0.1:8000/api/ipd";

interface ActiveAdmission {
  IhdCode:  number;
  IhdVchNo: number;
  PttCode:  number;
  PttName:  string;
  PttRegNo: number | null;
}

interface BedHistoryRow {
  Sno:          number;
  BedName:      string;
  WardName:     string;
  FromDate:     string;
  FromTime:     string;
  ToDate:       string;
  ToTime:       string;
  DischStatus:  string;
  NextBed:      string;
  Remark:       string;
}

interface TrnHistoryRow {
  Date:         string;
  Voucher:      string;
  VchNo:        number;
  DrAmt:        number;
  CrAmt:        number;
  BalAmt:       number;
  AmtAftDisc:   number;
  DiscAmt:      number;
  RefdDisc:     number;
  CutOffAmt:    number;
  WOffAmt:      number;
}

interface AdmissionDetails {
  Code:             number;
  IpdNo:            number;
  PatientName:      string;
  AgeSex:           string;
  CareOf:           string;
  Address:          string;
  Area:             string;
  Station:          string;
  DOA:              string;
  TOA:              string;
  UHID:             number | null;
  BedNo:            string;
  Ward:             string;
  Floor:            string;
  DOD:              string;
  TOD:              string;
  bed_history:      BedHistoryRow[];
  trn_history:      TrnHistoryRow[];
}

export default function IPDDischargeStatusPage() {
  const [admissions, setAdmissions] = useState<ActiveAdmission[]>([]);
  const [showLookup, setShowLookup] = useState(false);
  const [lookupFilter, setLookupFilter] = useState("");
  const [lookupLoading, setLookupLoading] = useState(false);

  // Loaded data details
  const [selectedAdm, setSelectedAdm] = useState<ActiveAdmission | null>(null);
  const [details, setDetails] = useState<AdmissionDetails | null>(null);
  const [loadingDetails, setLoadingDetails] = useState(false);
  const [billedFilter, setBilledFilter] = useState<"all" | "billed" | "unbilled">("all");

  const [toast, setToast] = useState<{ msg: string; ok: boolean } | null>(null);
  const searchRef = useRef<HTMLInputElement>(null);

  // Load active admissions list
  const loadAdmissions = async () => {
    setLookupLoading(true);
    try {
      const res = await fetch(`${API}/admissions/active`);
      if (res.ok) setAdmissions(await res.json());
    } catch (e) {
      console.error(e);
    } finally {
      setLookupLoading(false);
    }
  };

  useEffect(() => {
    loadAdmissions();
  }, []);

  const loadDischargeHistory = async (code: number) => {
    setLoadingDetails(true);
    try {
      const res = await fetch(`${API}/registrations/${code}/discharge-history`);
      if (res.ok) {
        setDetails(await res.json());
      } else {
        showToast("Error retrieving stay history logs.", false);
      }
    } catch {
      showToast("Connection failed.", false);
    } finally {
      setLoadingDetails(false);
    }
  };

  useEffect(() => {
    if (selectedAdm) {
      loadDischargeHistory(selectedAdm.IhdCode);
    }
  }, [selectedAdm]);

  useEffect(() => {
    if (!showLookup) return;
    loadAdmissions();
    setTimeout(() => searchRef.current?.focus(), 100);
  }, [showLookup]);

  useEffect(() => {
    const handleKeyDown = (e: KeyboardEvent) => {
      if (e.key === "F5") {
        e.preventDefault();
        if (selectedAdm) loadDischargeHistory(selectedAdm.IhdCode);
      }
      if (e.key === "Escape") {
        setShowLookup(false);
      }
    };
    window.addEventListener("keydown", handleKeyDown);
    return () => window.removeEventListener("keydown", handleKeyDown);
  }, [selectedAdm]);

  const showToast = (msg: string, ok = true) => {
    setToast({ msg, ok });
    setTimeout(() => setToast(null), 4000);
  };

  // Grand Totals calculations for transaction list
  const filteredTrns = details?.trn_history.filter(t => {
    if (billedFilter === "billed") return t.Voucher.includes("Bill") || t.Voucher.includes("Settlement");
    if (billedFilter === "unbilled") return !t.Voucher.includes("Bill") && !t.Voucher.includes("Settlement");
    return true;
  }) || [];

  const totDr       = filteredTrns.reduce((s, t) => s + (t.DrAmt || 0), 0);
  const totCr       = filteredTrns.reduce((s, t) => s + (t.CrAmt || 0), 0);
  const totBal      = filteredTrns.length > 0 ? filteredTrns[filteredTrns.length - 1].BalAmt : 0;
  const totAmtAft   = filteredTrns.reduce((s, t) => s + (t.AmtAftDisc || 0), 0);
  const totDisc     = filteredTrns.reduce((s, t) => s + (t.DiscAmt || 0), 0);
  const totRefdDisc = filteredTrns.reduce((s, t) => s + (t.RefdDisc || 0), 0);
  const totCutOff   = filteredTrns.reduce((s, t) => s + (t.CutOffAmt || 0), 0);
  const totWOff     = filteredTrns.reduce((s, t) => s + (t.WOffAmt || 0), 0);

  const filteredAdmissions = admissions.filter(a =>
    a.PttName.toLowerCase().includes(lookupFilter.toLowerCase()) ||
    String(a.IhdVchNo).includes(lookupFilter)
  );

  return (
    <div style={{ display: "flex", flexDirection: "column", gap: 16 }}>
      {/* Toast Alert */}
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

      {/* Patient Search Lookup */}
      {showLookup && (
        <div className={styles.modalOverlay}>
          <div className={styles.modalContent} style={{ maxWidth: 480 }}>
            <div className={styles.modalHeader}>
              <h3 style={{ fontSize: 15, fontWeight: 700 }}>Select IPD Admission</h3>
              <button className={styles.closeBtn} onClick={() => setShowLookup(false)}>×</button>
            </div>
            <div className={styles.modalBody} style={{ padding: "14px 20px" }}>
              <div className={styles.searchBar} style={{ marginBottom: 12 }}>
                <Search size={16} />
                <input
                  ref={searchRef}
                  type="text"
                  placeholder="Filter name or IPD No..."
                  value={lookupFilter}
                  onChange={e => setLookupFilter(e.target.value)}
                />
              </div>
              <div style={{ maxHeight: 240, overflowY: "auto" }}>
                {lookupLoading ? (
                  <div style={{ padding: 20, textAlign: "center" }}>
                    <RefreshCw size={18} className="animate-spin" style={{ color: "var(--text-muted)", margin: "0 auto" }} />
                  </div>
                ) : filteredAdmissions.length === 0 ? (
                  <p style={{ padding: "16px 0", textAlign: "center", color: "var(--text-secondary)" }}>
                    No matching admissions found.
                  </p>
                ) : (
                  filteredAdmissions.map(a => (
                    <div
                      key={a.IhdCode}
                      className={styles.dropdownItem}
                      style={{
                        padding: "10px 12px", borderBottom: "1px solid var(--border-light)",
                        cursor: "pointer", transition: "background .12s",
                      }}
                      onClick={() => {
                        setSelectedAdm(a);
                        setShowLookup(false);
                        setLookupFilter("");
                      }}
                    >
                      <div style={{ display: "flex", justifyContent: "space-between", fontWeight: 600 }}>
                        <span>{a.PttName}</span>
                        <span style={{ color: "var(--accent-color)" }}>IPD #{a.IhdVchNo}</span>
                      </div>
                    </div>
                  ))
                )}
              </div>
            </div>
          </div>
        </div>
      )}

      {/* Main Workspace Frame */}
      <div style={{
        background: "#f4e3cf", border: "2px solid #bfa487", borderRadius: 8,
        padding: 16, display: "flex", flexDirection: "column", gap: 14,
        boxShadow: "0 4px 14px rgba(0,0,0,0.12)"
      }}>
        
        {/* Workspace Title Header */}
        <div style={{ display: "flex", justifyContent: "space-between", borderBottom: "1.5px solid #bfa487", paddingBottom: 8 }}>
          <strong style={{ color: "#543d2b", fontSize: 15 }}>Indoor Discharge / Bed Shift / Transaction Details</strong>
          <button className={styles.secondaryBtn} onClick={() => window.history.back()} style={{ padding: "4px 8px", fontSize: 12, background: "#eed6be" }}>
            Exit (Esc)
          </button>
        </div>

        {/* Demographics Lookup Section */}
        <div style={{ display: "grid", gridTemplateColumns: "1fr 260px", gap: 20 }}>
          
          <div style={{ display: "grid", gridTemplateColumns: "repeat(4, 1fr)", gap: 10, fontSize: 12 }}>
            <div>
              <span style={{ display: "block", color: "#5c4331", fontWeight: 600 }}>Ipd No:</span>
              <div style={{ display: "flex", gap: 4, marginTop: 4 }}>
                <input
                  type="text"
                  readOnly
                  value={details ? details.IpdNo : ""}
                  placeholder="Click lookup..."
                  style={{ width: "100%", padding: 4, border: "1px solid #c2a88e", borderRadius: 4, background: "#fff", outline: "none" }}
                />
                <button style={{ padding: "4px 8px", border: "1px solid #c2a88e", borderRadius: 4, background: "#eed6be" }} onClick={() => setShowLookup(true)}>
                  <Search size={13} />
                </button>
              </div>
            </div>

            <div>
              <span style={{ display: "block", color: "#5c4331", fontWeight: 600 }}>Patient Name:</span>
              <input
                type="text"
                readOnly
                value={details ? details.PatientName : ""}
                style={{ width: "100%", padding: 4, border: "1px solid #c2a88e", borderRadius: 4, background: "#fff", marginTop: 4 }}
              />
            </div>

            <div>
              <span style={{ display: "block", color: "#5c4331", fontWeight: 600 }}>Age / Sex:</span>
              <input
                type="text"
                readOnly
                value={details ? details.AgeSex : ""}
                style={{ width: "100%", padding: 4, border: "1px solid #c2a88e", borderRadius: 4, background: "#fff", marginTop: 4 }}
              />
            </div>

            <div>
              <span style={{ display: "block", color: "#5c4331", fontWeight: 600 }}>UHID No:</span>
              <input
                type="text"
                readOnly
                value={details ? details.UHID || "" : ""}
                style={{ width: "100%", padding: 4, border: "1px solid #c2a88e", borderRadius: 4, background: "#fff", marginTop: 4 }}
              />
            </div>

            <div style={{ gridColumn: "span 2" }}>
              <span style={{ display: "block", color: "#5c4331", fontWeight: 600 }}>Care of:</span>
              <input
                type="text"
                readOnly
                value={details ? details.CareOf : ""}
                style={{ width: "100%", padding: 4, border: "1px solid #c2a88e", borderRadius: 4, background: "#fff", marginTop: 4 }}
              />
            </div>

            <div>
              <span style={{ display: "block", color: "#5c4331", fontWeight: 600 }}>D.O.A.:</span>
              <input
                type="text"
                readOnly
                value={details ? details.DOA : ""}
                style={{ width: "100%", padding: 4, border: "1px solid #c2a88e", borderRadius: 4, background: "#fff", marginTop: 4 }}
              />
            </div>

            <div>
              <span style={{ display: "block", color: "#5c4331", fontWeight: 600 }}>T.O.A.:</span>
              <input
                type="text"
                readOnly
                value={details ? details.TOA : ""}
                style={{ width: "100%", padding: 4, border: "1px solid #c2a88e", borderRadius: 4, background: "#fff", marginTop: 4 }}
              />
            </div>

            <div style={{ gridColumn: "span 2" }}>
              <span style={{ display: "block", color: "#5c4331", fontWeight: 600 }}>Address:</span>
              <input
                type="text"
                readOnly
                value={details ? details.Address : ""}
                style={{ width: "100%", padding: 4, border: "1px solid #c2a88e", borderRadius: 4, background: "#fff", marginTop: 4 }}
              />
            </div>

            <div>
              <span style={{ display: "block", color: "#5c4331", fontWeight: 600 }}>D.O.D.:</span>
              <input
                type="text"
                readOnly
                value={details ? details.DOD : ""}
                style={{ width: "100%", padding: 4, border: "1px solid #c2a88e", borderRadius: 4, background: "#fff", marginTop: 4 }}
              />
            </div>

            <div>
              <span style={{ display: "block", color: "#5c4331", fontWeight: 600 }}>T.O.D.:</span>
              <input
                type="text"
                readOnly
                value={details ? details.TOD : ""}
                style={{ width: "100%", padding: 4, border: "1px solid #c2a88e", borderRadius: 4, background: "#fff", marginTop: 4 }}
              />
            </div>

            <div>
              <span style={{ display: "block", color: "#5c4331", fontWeight: 600 }}>Bed No:</span>
              <input
                type="text"
                readOnly
                value={details ? details.BedNo : ""}
                style={{ width: "100%", padding: 4, border: "1px solid #c2a88e", borderRadius: 4, background: "#fff", marginTop: 4 }}
              />
            </div>

            <div>
              <span style={{ display: "block", color: "#5c4331", fontWeight: 600 }}>Ward:</span>
              <input
                type="text"
                readOnly
                value={details ? details.Ward : ""}
                style={{ width: "100%", padding: 4, border: "1px solid #c2a88e", borderRadius: 4, background: "#fff", marginTop: 4 }}
              />
            </div>

            <div>
              <span style={{ display: "block", color: "#5c4331", fontWeight: 600 }}>Floor:</span>
              <input
                type="text"
                readOnly
                value={details ? details.Floor : ""}
                style={{ width: "100%", padding: 4, border: "1px solid #c2a88e", borderRadius: 4, background: "#fff", marginTop: 4 }}
              />
            </div>

            <div></div>
          </div>

          {/* Optional selection checkbox panel */}
          <div style={{
            border: "1px solid #c2a88e", borderRadius: 6, padding: "10px 14px",
            display: "flex", flexDirection: "column", gap: 10, background: "#eed6be"
          }}>
            <span style={{ fontSize: 11, fontWeight: 700, color: "#5c4331" }}>Optional Filter:</span>
            <div style={{ display: "flex", flexDirection: "column", gap: 8, fontSize: 13 }}>
              <label style={{ display: "flex", alignItems: "center", gap: 6, cursor: "pointer" }}>
                <input
                  type="radio"
                  name="billed_opt"
                  checked={billedFilter === "all"}
                  onChange={() => setBilledFilter("all")}
                />
                <span>All Transactions</span>
              </label>
              <label style={{ display: "flex", alignItems: "center", gap: 6, cursor: "pointer" }}>
                <input
                  type="radio"
                  name="billed_opt"
                  checked={billedFilter === "billed"}
                  onChange={() => setBilledFilter("billed")}
                />
                <span>Billed Stays Only</span>
              </label>
              <label style={{ display: "flex", alignItems: "center", gap: 6, cursor: "pointer" }}>
                <input
                  type="radio"
                  name="billed_opt"
                  checked={billedFilter === "unbilled"}
                  onChange={() => setBilledFilter("unbilled")}
                />
                <span>Un-Billed Stays Only</span>
              </label>
            </div>
            
            <button
              className={styles.secondaryBtn}
              onClick={() => selectedAdm && loadDischargeHistory(selectedAdm.IhdCode)}
              style={{ marginTop: 10, width: "100%", display: "flex", justifyContent: "center", gap: 6, fontSize: 12, background: "#f4e3cf" }}
            >
              <RefreshCw size={13} /> Refresh Details (F5)
            </button>
          </div>

        </div>

        {/* 1. Bed / Room History Grid */}
        <div style={{ display: "flex", flexDirection: "column", gap: 6 }}>
          <div style={{ background: "#ccdfcc", padding: "6px 12px", border: "1px solid #a8c4a8", borderRadius: "4px 4px 0 0", fontSize: 12, fontWeight: 700, color: "#324e32" }}>
            Bed / Room stay History Logs
          </div>
          <div style={{ maxHeight: 150, overflowY: "auto", background: "#fff", border: "1px solid #c2a88e", borderRadius: "0 0 4px 4px" }}>
            {loadingDetails ? (
              <div style={{ padding: 20, textAlign: "center" }}><RefreshCw className="animate-spin" size={16} /></div>
            ) : !details?.bed_history.length ? (
              <p style={{ padding: "16px", fontSize: 12, color: "#888", textAlign: "center" }}>No bed transfer logs found.</p>
            ) : (
              <table className={styles.table} style={{ fontSize: 11, width: "100%", borderCollapse: "collapse" }}>
                <thead>
                  <tr style={{ background: "#eee" }}>
                    <th style={{ width: 44 }}>SNo</th>
                    <th>Bed Name</th>
                    <th>Ward Name</th>
                    <th>From Date</th>
                    <th>Time</th>
                    <th>To Date</th>
                    <th>Time</th>
                    <th>Disch. Status</th>
                    <th>Next Bed</th>
                    <th>Remark</th>
                  </tr>
                </thead>
                <tbody>
                  {details.bed_history.map(b => (
                    <tr key={b.Sno}>
                      <td>{b.Sno}</td>
                      <td><strong>{b.BedName}</strong></td>
                      <td>{b.WardName}</td>
                      <td>{b.FromDate}</td>
                      <td>{b.FromTime}</td>
                      <td>{b.ToDate || "—"}</td>
                      <td>{b.ToTime || "—"}</td>
                      <td>
                        <span style={{
                          color: b.DischStatus === "Occupied" ? "green" : b.DischStatus === "Discharged" ? "red" : "orange",
                          fontWeight: 600
                        }}>{b.DischStatus}</span>
                      </td>
                      <td>{b.NextBed || "—"}</td>
                      <td>{b.Remark || "—"}</td>
                    </tr>
                  ))}
                </tbody>
              </table>
            )}
          </div>
        </div>

        {/* 2. Transaction History Ledger Grid */}
        <div style={{ display: "flex", flexDirection: "column", gap: 6 }}>
          <div style={{ background: "#eed6be", padding: "6px 12px", border: "1px solid #c2a88e", borderRadius: "4px 4px 0 0", fontSize: 12, fontWeight: 700, color: "#543d2b" }}>
            Linked Ledger Transactions Details
          </div>
          <div style={{ maxHeight: 200, overflowY: "auto", background: "#fff", border: "1px solid #c2a88e" }}>
            {loadingDetails ? (
              <div style={{ padding: 20, textAlign: "center" }}><RefreshCw className="animate-spin" size={16} /></div>
            ) : !filteredTrns.length ? (
              <p style={{ padding: "16px", fontSize: 12, color: "#888", textAlign: "center" }}>No transaction vouchers recorded.</p>
            ) : (
              <table className={styles.table} style={{ fontSize: 11, width: "100%", borderCollapse: "collapse", minWidth: 1200 }}>
                <thead>
                  <tr style={{ background: "#eee" }}>
                    <th>Date</th>
                    <th>Voucher type</th>
                    <th>Vch.No</th>
                    <th style={{ textAlign: "right" }}>Bill / Dr.Amt</th>
                    <th style={{ textAlign: "right" }}>Pymt / Cr.Amt</th>
                    <th style={{ textAlign: "right" }}>Bal.Amt</th>
                    <th style={{ textAlign: "right" }}>Bill Amt</th>
                    <th style={{ textAlign: "right" }}>Bill Disc</th>
                    <th style={{ textAlign: "right" }}>Refd.Disc</th>
                    <th style={{ textAlign: "right" }}>CutOff.Amt</th>
                    <th style={{ textAlign: "right" }}>W/Off.Amt</th>
                  </tr>
                </thead>
                <tbody>
                  {filteredTrns.map((t, i) => (
                    <tr key={i}>
                      <td>{t.Date}</td>
                      <td>{t.Voucher}</td>
                      <td><strong style={{ color: "var(--accent-color)" }}>#{t.VchNo}</strong></td>
                      <td style={{ textAlign: "right", color: t.DrAmt > 0 ? "red" : "inherit" }}>₹{t.DrAmt.toFixed(2)}</td>
                      <td style={{ textAlign: "right", color: t.CrAmt > 0 ? "green" : "inherit" }}>₹{t.CrAmt.toFixed(2)}</td>
                      <td style={{ textAlign: "right", fontWeight: 700 }}>₹{t.BalAmt.toFixed(2)}</td>
                      <td style={{ textAlign: "right" }}>₹{t.AmtAftDisc.toFixed(2)}</td>
                      <td style={{ textAlign: "right" }}>₹{t.DiscAmt.toFixed(2)}</td>
                      <td style={{ textAlign: "right" }}>₹{t.RefdDisc.toFixed(2)}</td>
                      <td style={{ textAlign: "right" }}>₹{t.CutOffAmt.toFixed(2)}</td>
                      <td style={{ textAlign: "right" }}>₹{t.WOffAmt.toFixed(2)}</td>
                    </tr>
                  ))}
                </tbody>
              </table>
            )}
          </div>

          {/* Grand Total red row */}
          {!loadingDetails && filteredTrns.length > 0 && (
            <div style={{
              background: "#cc0000", color: "#ffffff", padding: "8px 12px",
              display: "grid", gridTemplateColumns: "1.2fr repeat(8, 100px)",
              alignItems: "center", fontWeight: 700, fontSize: 12, borderTop: "2px solid #990000",
              borderRadius: "0 0 4px 4px"
            }}>
              <div>GRAND TOTAL</div>
              <div style={{ textAlign: "right" }}>₹{totDr.toFixed(2)}</div>
              <div style={{ textAlign: "right" }}>₹{totCr.toFixed(2)}</div>
              <div style={{ textAlign: "right" }}>₹{totBal.toFixed(2)}</div>
              <div style={{ textAlign: "right" }}>₹{totAmtAft.toFixed(2)}</div>
              <div style={{ textAlign: "right" }}>₹{totDisc.toFixed(2)}</div>
              <div style={{ textAlign: "right" }}>₹{totRefdDisc.toFixed(2)}</div>
              <div style={{ textAlign: "right" }}>₹{totCutOff.toFixed(2)}</div>
              <div style={{ textAlign: "right" }}>₹{totWOff.toFixed(2)}</div>
            </div>
          )}
        </div>

      </div>
    </div>
  );
}
