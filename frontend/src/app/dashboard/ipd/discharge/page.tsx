"use client";

import React, { useEffect, useState } from "react";
import styles from "../../../dashboard.module.css";
import {
  LogOut, AlertCircle, CheckCircle, RefreshCw,
  Search, Calendar, Clock, User, ArrowLeft, Info
} from "lucide-react";

const API = "http://127.0.0.1:8000/api/ipd";

interface ActiveAdmission {
  IhdCode:  number;
  IhdVchNo: number;
  PttCode:  number;
  PttName:  string;
  PttRegNo: number | null;
}

interface PatientDetails {
  IhdCode:  number;
  IhdVchNo: number;
  PttCode:  number | null;
  PttName:  string;
  PttRegNo: number | null;
  PttSex:   string;
  Age:      string;
  DctName:  string;
  WrdName:  string;
  BedName:  string;
  PcgName:  string;
  Scheme:   string;
}

const EMPTY_PAT: PatientDetails = {
  IhdCode: 0, IhdVchNo: 0, PttCode: null, PttName: "", PttRegNo: null,
  PttSex: "", Age: "", DctName: "", WrdName: "", BedName: "", PcgName: "", Scheme: "",
};

export default function IPDDischargePage() {
  const [admissions, setAdmissions] = useState<ActiveAdmission[]>([]);
  const [loading, setLoading] = useState(true);
  const [searchTerm, setSearchTerm] = useState("");
  const [selectedPat, setSelectedPat] = useState<ActiveAdmission | null>(null);

  // Loaded Details
  const [patDetails, setPatDetails] = useState<PatientDetails>(EMPTY_PAT);
  const [detailsLoading, setDetailsLoading] = useState(false);
  const [balanceDue, setBalanceDue] = useState<number | null>(null);

  // Inputs
  const today = new Date().toISOString().slice(0, 10);
  const [dischDate, setDischDate] = useState(today);
  const [dischTime, setDischTime] = useState("12:00");
  const [dischRemark, setDischRemark] = useState("");
  
  // Actions
  const [submitting, setSubmitting] = useState(false);
  const [toast, setToast] = useState<{ msg: string; ok: boolean } | null>(null);

  const loadAdmissions = async () => {
    setLoading(true);
    try {
      const res = await fetch(`${API}/admissions/active`);
      if (res.ok) {
        const list = await res.json();
        setAdmissions(list);
        if (list.length > 0 && !selectedPat) {
          setSelectedPat(list[0]);
        }
      }
    } catch (e) {
      console.error(e);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    loadAdmissions();
  }, []);

  const loadPatientFinancials = async (ihdCode: number) => {
    setDetailsLoading(true);
    try {
      // 1. Demographics info
      const infoRes = await fetch(`${API}/charges/patient-info/${ihdCode}`);
      if (infoRes.ok) setPatDetails(await infoRes.json());

      // 2. Ledger financial summary
      const ledgerRes = await fetch(`${API}/registrations/${ihdCode}/linked-trans`);
      if (ledgerRes.ok) {
        const ledger = await ledgerRes.json();
        const billsTotal = ledger.bills?.reduce((s: number, b: any) => s + (b.total || 0), 0) || 0;
        const totalAdv = ledger.advances?.reduce((s: number, a: any) => s + (a.amount || 0), 0) || 0;
        const totalRef = ledger.refunds?.reduce((s: number, r: any) => s + (r.amount || 0), 0) || 0;
        
        const outstanding = billsTotal - totalAdv + totalRef;
        setBalanceDue(outstanding);
      }
    } catch {
      setPatDetails(EMPTY_PAT);
      setBalanceDue(null);
    } finally {
      setDetailsLoading(false);
    }
  };

  useEffect(() => {
    if (selectedPat) {
      loadPatientFinancials(selectedPat.IhdCode);
    }
  }, [selectedPat]);

  const showToast = (msg: string, ok = true) => {
    setToast({ msg, ok });
    setTimeout(() => setToast(null), 4000);
  };

  const handleDischarge = async () => {
    if (!selectedPat) return;
    
    // Check if they have outstanding final bills unpaid
    if (balanceDue !== null && balanceDue > 0) {
      showToast(`Warning: Patient has ₹${balanceDue.toFixed(2)} outstanding balance. Complete billing settlement first.`, false);
      return;
    }

    setSubmitting(true);
    try {
      const token = localStorage.getItem("hms_token");
      const [hour, minute] = dischTime.split(":");
      const minutes = parseInt(hour || "0") * 60 + parseInt(minute || "0");

      const res = await fetch(`${API}/registrations/${selectedPat.IhdCode}/discharge`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          Authorization: `Bearer ${token}`
        },
        body: JSON.stringify({
          disch_date: dischDate,
          disch_time: minutes,
        }),
      });

      if (!res.ok) throw new Error("Discharge request failed");
      showToast("Patient discharged and bed stay released successfully!");
      setSelectedPat(null);
      setPatDetails(EMPTY_PAT);
      setBalanceDue(null);
      loadAdmissions();
    } catch {
      showToast("Discharge transaction failed. Check stay bounds.", false);
    } finally {
      setSubmitting(false);
    }
  };

  const filteredAdmissions = admissions.filter(a =>
    a.PttName.toLowerCase().includes(searchTerm.toLowerCase()) ||
    String(a.IhdVchNo).includes(searchTerm)
  );

  return (
    <div style={{ display: "flex", flexDirection: "column", gap: 20 }}>
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

      {/* Title */}
      <div>
        <h2 style={{ fontSize: 20, fontWeight: 700, margin: 0 }}>IPD Patient Discharge Console</h2>
        <p style={{ fontSize: 13, color: "var(--text-secondary)", marginTop: 4 }}>
          Release allotted bed wards and record stay checkout timestamps.
        </p>
      </div>

      <div style={{ display: "grid", gridTemplateColumns: "300px 1fr", gap: 20, alignItems: "start" }}>
        
        {/* Left Side: Active stay list */}
        <div className={styles.sectionBox} style={{ padding: 0 }}>
          <div style={{ padding: 12, borderBottom: "1px solid var(--border-light)" }}>
            <div className={styles.searchBar}>
              <Search size={16} />
              <input
                type="text"
                placeholder="Search admitted..."
                value={searchTerm}
                onChange={e => setSearchTerm(e.target.value)}
              />
            </div>
          </div>
          <div style={{ maxHeight: 440, overflowY: "auto" }}>
            {loading ? (
              <div style={{ padding: 20, textAlign: "center" }}>
                <RefreshCw size={18} className="animate-spin" style={{ color: "var(--text-muted)" }} />
              </div>
            ) : filteredAdmissions.length === 0 ? (
              <p style={{ padding: 20, textAlign: "center", color: "var(--text-secondary)" }}>
                No active patient stays.
              </p>
            ) : (
              filteredAdmissions.map(a => {
                const active = selectedPat?.IhdCode === a.IhdCode;
                return (
                  <div
                    key={a.IhdCode}
                    onClick={() => setSelectedPat(a)}
                    style={{
                      padding: "10px 16px", borderBottom: "1px solid var(--border-light)",
                      cursor: "pointer", background: active ? "var(--accent-light)" : "transparent",
                      borderLeft: active ? "3px solid var(--accent-color)" : "none",
                      transition: "background .15s",
                    }}
                  >
                    <div style={{ fontWeight: 600, color: "var(--text-primary)" }}>{a.PttName}</div>
                    <div style={{ fontSize: 11, color: "var(--text-secondary)", marginTop: 3 }}>
                      IPD No: #{a.IhdVchNo}
                    </div>
                  </div>
                );
              })
            )}
          </div>
        </div>

        {/* Right Side: Details and checkout triggers */}
        <div style={{ display: "flex", flexDirection: "column", gap: 20 }}>
          {selectedPat ? (
            <div className={styles.sectionBox} style={{ display: "flex", flexDirection: "column", gap: 20 }}>
              <h3 style={{ fontSize: 15, fontWeight: 700, margin: 0, borderBottom: "1px solid var(--border-light)", paddingBottom: 10 }}>
                Selected Patient: {patDetails.PttName || "Loading Details..."}
              </h3>

              <div style={{ display: "grid", gridTemplateColumns: "repeat(3, 1fr)", gap: 14 }}>
                {[
                  { label: "IPD No", value: detailsLoading ? "..." : patDetails.IhdVchNo || "—" },
                  { label: "UHID", value: detailsLoading ? "..." : patDetails.PttRegNo || "—" },
                  { label: "Sex / Age", value: detailsLoading ? "..." : patDetails.PttSex ? `${patDetails.PttSex} / ${patDetails.Age}` : "—" },
                  { label: "Allotted Bed", value: detailsLoading ? "..." : patDetails.BedName ? `${patDetails.WrdName} / ${patDetails.BedName}` : "—" },
                  { label: "Doctor", value: detailsLoading ? "..." : patDetails.DctName || "—" },
                  { label: "Outstanding Dues", value: detailsLoading ? "..." : balanceDue !== null ? `₹${balanceDue.toFixed(2)}` : "—" },
                ].map((item, idx) => (
                  <div key={idx}>
                    <span style={{ fontSize: 11, color: "var(--text-secondary)", display: "block" }}>{item.label}</span>
                    <strong style={{ fontSize: 13, color: "var(--text-primary)", marginTop: 2, display: "block" }}>{item.value}</strong>
                  </div>
                ))}
              </div>

              {balanceDue !== null && balanceDue > 0 && (
                <div style={{
                  background: "#fef2f2", border: "1px solid #fee2e2", borderRadius: 8,
                  padding: "10px 14px", display: "flex", gap: 8, alignItems: "center",
                  color: "#991b1b", fontSize: 13, fontWeight: 500,
                }}>
                  <AlertCircle size={16} />
                  <span>Cannot discharge patient: there are unpaid outstanding dues of ₹{balanceDue.toFixed(2)}.</span>
                </div>
              )}

              <div style={{ borderTop: "1px solid var(--border-light)", paddingTop: 16, display: "flex", flexDirection: "column", gap: 14 }}>
                <h4 style={{ fontSize: 13, fontWeight: 700, margin: 0 }}>Discharge Parameters</h4>

                <div style={{ display: "grid", gridTemplateColumns: "1fr 1fr", gap: 12 }}>
                  <div>
                    <label style={{ display: "block", fontSize: 12, fontWeight: 600, color: "var(--text-secondary)", marginBottom: 6 }}>
                      Discharge Date
                    </label>
                    <input
                      type="date"
                      value={dischDate}
                      onChange={e => setDischDate(e.target.value)}
                      style={{
                        border: "1px solid var(--border-light)", borderRadius: 8,
                        padding: "8px 12px", width: "100%", outline: "none", fontSize: 13,
                        background: "var(--bg-card)", color: "var(--text-primary)",
                      }}
                    />
                  </div>
                  <div>
                    <label style={{ display: "block", fontSize: 12, fontWeight: 600, color: "var(--text-secondary)", marginBottom: 6 }}>
                      Discharge Time
                    </label>
                    <input
                      type="text"
                      value={dischTime}
                      onChange={e => setDischTime(e.target.value)}
                      placeholder="HH:MM"
                      style={{
                        border: "1px solid var(--border-light)", borderRadius: 8,
                        padding: "8px 12px", width: "100%", outline: "none", fontSize: 13,
                        background: "var(--bg-card)", color: "var(--text-primary)",
                      }}
                    />
                  </div>
                </div>

                <div>
                  <label style={{ display: "block", fontSize: 12, fontWeight: 600, color: "var(--text-secondary)", marginBottom: 6 }}>
                    Remarks
                  </label>
                  <textarea
                    value={dischRemark}
                    onChange={e => setDischRemark(e.target.value)}
                    placeholder="Discharge notes..."
                    style={{
                      border: "1px solid var(--border-light)", borderRadius: 8,
                      padding: "8px 12px", width: "100%", outline: "none", fontSize: 13,
                      background: "var(--bg-card)", color: "var(--text-primary)", resize: "none", height: 60,
                    }}
                  />
                </div>

                <button
                  className={styles.primaryBtn}
                  onClick={handleDischarge}
                  disabled={submitting || (balanceDue !== null && balanceDue > 0)}
                  style={{
                    gap: 8, height: 42, background: (balanceDue !== null && balanceDue > 0) ? "var(--text-muted)" : "var(--status-danger)",
                    borderColor: (balanceDue !== null && balanceDue > 0) ? "var(--text-muted)" : "var(--status-danger)",
                    display: "flex", justifyContent: "center", fontWeight: 700, width: "240px", alignSelf: "flex-end",
                  }}
                >
                  {submitting ? <RefreshCw size={16} className="animate-spin" /> : <LogOut size={16} />}
                  Complete Bed Discharge
                </button>
              </div>

            </div>
          ) : (
            <div className={styles.sectionBox} style={{ padding: 40, textAlign: "center", color: "var(--text-muted)" }}>
              <Info size={32} style={{ margin: "0 auto 12px" }} />
              Select an admitted stay from the left list to proceed.
            </div>
          )}
        </div>

      </div>
    </div>
  );
}
