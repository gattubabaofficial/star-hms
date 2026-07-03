"use client";

import React, { useEffect, useState, useRef } from "react";
import styles from "../../../dashboard.module.css";
import {
  Search, RefreshCw, X, Save, Printer, ArrowLeft, HeartPulse, ShieldAlert, FileText, ClipboardList
} from "lucide-react";

const API = "http://127.0.0.1:8000/api/ipd";

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
  DctName:  string;
  WrdName:  string;
  BedName:  string;
  PcgName:  string;
  Scheme:   string;
  PttRefName: string;
  PttAddr:    string;
}

interface ClinicalHistory {
  IchCode:       number;
  IchIpgCode:    number;
  IchDate:       string;
  IchTime:       string;
  IchComplaints: string;
  IchHistory:    string;
  IchAllergies:  string;
  IchTemp:       number;
  IchPulse:      number;
  IchBP:         string;
  IchSPO2:       number;
  IchSystemic:   string;
  IchDiagnosis:  string;
}

const EMPTY_PAT: PatientInfo = {
  IhdCode: 0, IhdVchNo: 0, PttCode: null, PttName: "", PttRegNo: null,
  PttSex: "", Age: "", DctName: "", WrdName: "", BedName: "", PcgName: "", Scheme: "",
  PttRefName: "", PttAddr: "",
};

const EMPTY_HISTORY: ClinicalHistory = {
  IchCode: 0,
  IchIpgCode: 0,
  IchDate: new Date().toISOString().slice(0, 10),
  IchTime: "12:00",
  IchComplaints: "",
  IchHistory: "",
  IchAllergies: "",
  IchTemp: 98.6,
  IchPulse: 72,
  IchBP: "",
  IchSPO2: 98,
  IchSystemic: "",
  IchDiagnosis: ""
};

export default function ClinicalHistoryPage() {
  const [admissions, setAdmissions] = useState<ActiveAdmission[]>([]);
  const [showPatSearch, setShowPatSearch] = useState(false);
  const [patFilter, setPatFilter] = useState("");
  const [selectedPat, setSelectedPat] = useState<ActiveAdmission | null>(null);
  const [patInfo, setPatInfo] = useState<PatientInfo>(EMPTY_PAT);
  const [patLoading, setPatLoading] = useState(false);

  // Form Inputs
  const [caseSheet, setCaseSheet] = useState<ClinicalHistory>(EMPTY_HISTORY);
  const [saving, setSaving] = useState(false);
  const [toast, setToast] = useState<{ msg: string; ok: boolean } | null>(null);

  const patSearchRef = useRef<HTMLInputElement>(null);

  // Load active admissions list
  useEffect(() => {
    if (!showPatSearch) return;
    fetch(`${API}/admissions/active`)
      .then(r => r.json())
      .catch(() => [])
      .then(data => setAdmissions(data));
    setTimeout(() => patSearchRef.current?.focus(), 100);
  }, [showPatSearch]);

  const showToast = (msg: string, ok = true) => {
    setToast({ msg, ok });
    setTimeout(() => setToast(null), 4000);
  };

  const loadPatientDetails = async (ihdCode: number) => {
    setPatLoading(true);
    try {
      // 1. Load demographics
      const res = await fetch(`${API}/charges/patient-info/${ihdCode}`);
      if (res.ok) {
        const data = await res.json();
        setPatInfo(data);
      }
      
      // 2. Load existing clinical history
      const histRes = await fetch(`${API}/clinical-history/${ihdCode}`);
      if (histRes.ok) {
        setCaseSheet(await histRes.json());
      }
    } catch (e) {
      console.error(e);
      showToast("Error loading patient case data.", false);
    } finally {
      setPatLoading(false);
    }
  };

  const handlePatSelect = (pat: ActiveAdmission) => {
    setSelectedPat(pat);
    loadPatientDetails(pat.IhdCode);
    setShowPatSearch(false);
    setPatFilter("");
  };

  const handleInputChange = (field: keyof ClinicalHistory, val: any) => {
    setCaseSheet(prev => ({ ...prev, [field]: val }));
  };

  const handleSave = async () => {
    if (!selectedPat) {
      showToast("Please select a patient stay.", false);
      return;
    }
    setSaving(true);
    try {
      const res = await fetch(`${API}/clinical-history`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          ...caseSheet,
          IchIpgCode: selectedPat.IhdCode
        })
      });
      if (res.ok) {
        showToast("Clinical history case sheet saved successfully!");
        loadPatientDetails(selectedPat.IhdCode);
      } else {
        showToast("Failed to save case sheet.", false);
      }
    } catch (e) {
      console.error(e);
      showToast("Network error saving case sheet.", false);
    } finally {
      setSaving(false);
    }
  };

  const filteredAdmissions = admissions.filter(a => {
    const s = patFilter.toLowerCase();
    return (
      a.PttName.toLowerCase().includes(s) ||
      (a.IhdVchNo && a.IhdVchNo.toString().includes(s))
    );
  });

  return (
    <div style={{ padding: "20px 24px", display: "flex", flexDirection: "column", gap: 18, minHeight: "100%", background: "var(--bg-primary)" }}>
      {/* Toast Alert */}
      {toast && (
        <div className={`${styles.toast} ${toast.ok ? styles.toastSuccess : styles.toastError}`}>
          {toast.msg}
        </div>
      )}

      {/* Page Header */}
      <div style={{ display: "flex", justifyContent: "space-between", alignItems: "center" }}>
        <div>
          <h2 style={{ fontSize: 20, fontWeight: 800, margin: 0, display: "flex", alignItems: "center", gap: 8 }}>
            <ClipboardList style={{ color: "var(--accent-color)" }} /> Clinical History / Case Sheet
          </h2>
          <span style={{ fontSize: 12, color: "var(--text-secondary)" }}>
            Inpatient clinical records, general examinations, and provisional diagnosis.
          </span>
        </div>

        <button className={styles.secondaryBtn} onClick={() => window.history.back()} style={{ display: "flex", alignItems: "center", gap: 6 }}>
          <ArrowLeft size={15} /> Back
        </button>
      </div>

      {/* Content Form Workspace */}
      <div style={{ display: "grid", gridTemplateColumns: "1.2fr 2fr", gap: 20, alignItems: "start" }}>
        {/* Left Side: Patient Selector & Vital Signs */}
        <div style={{ display: "flex", flexDirection: "column", gap: 20 }}>
          {/* Patient Search Card */}
          <div className={styles.sectionBox} style={{ display: "flex", flexDirection: "column", gap: 14 }}>
            <div style={{ borderBottom: "1px solid var(--border-light)", paddingBottom: 10 }}>
              <h3 style={{ fontSize: 14, fontWeight: 700, margin: 0 }}>Patient Lookup</h3>
            </div>
            
            <div style={{ display: "flex", gap: 6 }}>
              <input
                type="text"
                readOnly
                placeholder="Select Patient Admission..."
                value={selectedPat ? `${selectedPat.PttName} (IPD No: ${selectedPat.IhdVchNo})` : ""}
                style={{
                  border: "1px solid var(--border-light)", borderRadius: 8,
                  padding: "8px 12px", width: "100%", outline: "none", fontSize: 13,
                  background: "var(--bg-secondary)", color: "var(--text-primary)", cursor: "default"
                }}
              />
              <button className={styles.primaryBtn} onClick={() => setShowPatSearch(true)} style={{ padding: 10 }}>
                <Search size={15} />
              </button>
            </div>

            {patInfo.IhdCode > 0 && (
              <div style={{ display: "flex", flexDirection: "column", gap: 8, padding: 12, background: "var(--bg-secondary)", borderRadius: 8, fontSize: 12 }}>
                <div>
                  <span style={{ color: "var(--text-secondary)" }}>UHID: </span>
                  <strong>{patInfo.PttRegNo || "—"}</strong>
                </div>
                <div>
                  <span style={{ color: "var(--text-secondary)" }}>Consulting Doctor: </span>
                  <strong>{patInfo.DctName}</strong>
                </div>
                <div>
                  <span style={{ color: "var(--text-secondary)" }}>Ward & Bed: </span>
                  <strong>{patInfo.WrdName} / {patInfo.BedName}</strong>
                </div>
                <div>
                  <span style={{ color: "var(--text-secondary)" }}>Scheme Category: </span>
                  <strong>{patInfo.PcgName} ({patInfo.Scheme})</strong>
                </div>
              </div>
            )}
          </div>

          {/* Vitals Case Panel */}
          <div className={styles.sectionBox} style={{ display: "flex", flexDirection: "column", gap: 14 }}>
            <div style={{ borderBottom: "1px solid var(--border-light)", paddingBottom: 10, display: "flex", alignItems: "center", gap: 8 }}>
              <HeartPulse size={18} style={{ color: "red" }} />
              <h3 style={{ fontSize: 14, fontWeight: 700, margin: 0 }}>Vitals Signs Log</h3>
            </div>

            <div style={{ display: "grid", gridTemplateColumns: "1fr 1fr", gap: 12 }}>
              <div>
                <label style={{ display: "block", fontSize: 11, fontWeight: 600, color: "var(--text-secondary)", marginBottom: 4 }}>
                  Temp (°F)
                </label>
                <input
                  type="number"
                  step="0.1"
                  value={caseSheet.IchTemp}
                  onChange={e => handleInputChange("IchTemp", parseFloat(e.target.value) || 98.6)}
                  style={{
                    border: "1px solid var(--border-light)", borderRadius: 8,
                    padding: "8px 12px", width: "100%", outline: "none", fontSize: 13,
                    background: "var(--bg-card)", color: "var(--text-primary)",
                  }}
                />
              </div>

              <div>
                <label style={{ display: "block", fontSize: 11, fontWeight: 600, color: "var(--text-secondary)", marginBottom: 4 }}>
                  Pulse Rate (bpm)
                </label>
                <input
                  type="number"
                  value={caseSheet.IchPulse}
                  onChange={e => handleInputChange("IchPulse", parseInt(e.target.value) || 72)}
                  style={{
                    border: "1px solid var(--border-light)", borderRadius: 8,
                    padding: "8px 12px", width: "100%", outline: "none", fontSize: 13,
                    background: "var(--bg-card)", color: "var(--text-primary)",
                  }}
                />
              </div>

              <div>
                <label style={{ display: "block", fontSize: 11, fontWeight: 600, color: "var(--text-secondary)", marginBottom: 4 }}>
                  Blood Pressure (mmHg)
                </label>
                <input
                  type="text"
                  placeholder="e.g. 120/80"
                  value={caseSheet.IchBP}
                  onChange={e => handleInputChange("IchBP", e.target.value)}
                  style={{
                    border: "1px solid var(--border-light)", borderRadius: 8,
                    padding: "8px 12px", width: "100%", outline: "none", fontSize: 13,
                    background: "var(--bg-card)", color: "var(--text-primary)",
                  }}
                />
              </div>

              <div>
                <label style={{ display: "block", fontSize: 11, fontWeight: 600, color: "var(--text-secondary)", marginBottom: 4 }}>
                  Oxygen Saturation SPO2 (%)
                </label>
                <input
                  type="number"
                  value={caseSheet.IchSPO2}
                  onChange={e => handleInputChange("IchSPO2", parseInt(e.target.value) || 98)}
                  style={{
                    border: "1px solid var(--border-light)", borderRadius: 8,
                    padding: "8px 12px", width: "100%", outline: "none", fontSize: 13,
                    background: "var(--bg-card)", color: "var(--text-primary)",
                  }}
                />
              </div>
            </div>
          </div>
        </div>

        {/* Right Side: Structured Clinical Details Input */}
        <div className={styles.sectionBox} style={{ display: "flex", flexDirection: "column", gap: 14 }}>
          <div style={{ borderBottom: "1px solid var(--border-light)", paddingBottom: 10, display: "flex", justifyContent: "space-between", alignItems: "center" }}>
            <h3 style={{ fontSize: 14, fontWeight: 700, margin: 0 }}>Case History & Observations</h3>
            
            <div style={{ display: "flex", gap: 10, fontSize: 12 }}>
              <span>Date:</span>
              <input
                type="date"
                value={caseSheet.IchDate}
                onChange={e => handleInputChange("IchDate", e.target.value)}
                style={{ border: "1px solid var(--border-light)", borderRadius: 4, padding: "2px 6px" }}
              />
              <span>Time:</span>
              <input
                type="text"
                value={caseSheet.IchTime}
                onChange={e => handleInputChange("IchTime", e.target.value)}
                style={{ border: "1px solid var(--border-light)", borderRadius: 4, padding: "2px 6px", width: 60 }}
              />
            </div>
          </div>

          <div style={{ display: "flex", flexDirection: "column", gap: 12 }}>
            <div>
              <label style={{ display: "block", fontSize: 12, fontWeight: 600, color: "var(--text-secondary)", marginBottom: 6 }}>
                Chief Complaints & History of Present Illness
              </label>
              <textarea
                rows={3}
                placeholder="Enter complaints, symptoms, timeline details..."
                value={caseSheet.IchComplaints}
                onChange={e => handleInputChange("IchComplaints", e.target.value)}
                style={{
                  border: "1px solid var(--border-light)", borderRadius: 8,
                  padding: "8px 12px", width: "100%", outline: "none", fontSize: 13,
                  background: "var(--bg-card)", color: "var(--text-primary)", resize: "vertical"
                }}
              />
            </div>

            <div>
              <label style={{ display: "block", fontSize: 12, fontWeight: 600, color: "var(--text-secondary)", marginBottom: 6 }}>
                Past Medical, Surgical & Family History
              </label>
              <textarea
                rows={2}
                placeholder="Prior surgeries, illnesses, family medical conditions..."
                value={caseSheet.IchHistory}
                onChange={e => handleInputChange("IchHistory", e.target.value)}
                style={{
                  border: "1px solid var(--border-light)", borderRadius: 8,
                  padding: "8px 12px", width: "100%", outline: "none", fontSize: 13,
                  background: "var(--bg-card)", color: "var(--text-primary)", resize: "vertical"
                }}
              />
            </div>

            <div>
              <label style={{ display: "flex", fontSize: 12, fontWeight: 600, color: "var(--text-secondary)", marginBottom: 6, alignItems: "center", gap: 6 }}>
                <ShieldAlert size={14} style={{ color: "var(--status-danger)" }} /> Drug Allergies & Contraindications
              </label>
              <input
                type="text"
                placeholder="e.g. Penicillin, Aspirin allergy..."
                value={caseSheet.IchAllergies}
                onChange={e => handleInputChange("IchAllergies", e.target.value)}
                style={{
                  border: "1px solid var(--border-light)", borderRadius: 8,
                  padding: "8px 12px", width: "100%", outline: "none", fontSize: 13,
                  background: "var(--bg-card)", color: "var(--text-primary)",
                }}
              />
            </div>

            <div>
              <label style={{ display: "block", fontSize: 12, fontWeight: 600, color: "var(--text-secondary)", marginBottom: 6 }}>
                Systemic Examination & Physical Findings
              </label>
              <textarea
                rows={3}
                placeholder="Findings for CNS, Respiratory, Cardiovascular, Abdominal checks..."
                value={caseSheet.IchSystemic}
                onChange={e => handleInputChange("IchSystemic", e.target.value)}
                style={{
                  border: "1px solid var(--border-light)", borderRadius: 8,
                  padding: "8px 12px", width: "100%", outline: "none", fontSize: 13,
                  background: "var(--bg-card)", color: "var(--text-primary)", resize: "vertical"
                }}
              />
            </div>

            <div>
              <label style={{ display: "block", fontSize: 12, fontWeight: 600, color: "var(--text-secondary)", marginBottom: 6 }}>
                Working / Provisional Diagnosis
              </label>
              <input
                type="text"
                placeholder="Enter working medical diagnosis..."
                value={caseSheet.IchDiagnosis}
                onChange={e => handleInputChange("IchDiagnosis", e.target.value)}
                style={{
                  border: "1px solid var(--border-light)", borderRadius: 8,
                  padding: "8px 12px", width: "100%", outline: "none", fontSize: 13,
                  background: "var(--bg-card)", color: "var(--text-primary)",
                }}
              />
            </div>
          </div>

          <div style={{ display: "flex", gap: 10, justifyContent: "flex-end", borderTop: "1px solid var(--border-light)", paddingTop: 14 }}>
            <button className={styles.secondaryBtn} onClick={() => window.print()} style={{ display: "flex", alignItems: "center", gap: 6 }}>
              <Printer size={15} /> Print Case Sheet
            </button>
            <button className={styles.primaryBtn} onClick={handleSave} disabled={saving} style={{ display: "flex", alignItems: "center", gap: 6 }}>
              {saving ? <RefreshCw size={15} className="animate-spin" /> : <Save size={15} />}
              Save Case History
            </button>
          </div>
        </div>
      </div>

      {/* Patient Search Lookup Modal */}
      {showPatSearch && (
        <div className={styles.modalOverlay} style={{ zIndex: 1100 }}>
          <div className={styles.modalContent} style={{ maxWidth: 500 }}>
            <div className={styles.modalHeader}>
              <h3 style={{ fontSize: 14, fontWeight: 700 }}>Search Active IPD Patients</h3>
              <button className={styles.closeBtn} onClick={() => setShowPatSearch(false)}>×</button>
            </div>
            <div className={styles.modalBody} style={{ padding: 14 }}>
              <div className={styles.searchBar} style={{ width: "100%", marginBottom: 12 }}>
                <Search size={16} />
                <input
                  type="text"
                  ref={patSearchRef}
                  placeholder="Search by name or IPD no..."
                  value={patFilter}
                  onChange={e => setPatFilter(e.target.value)}
                />
              </div>

              <div style={{ maxHeight: 300, overflowY: "auto", border: "1px solid var(--border-light)", borderRadius: 8 }}>
                {filteredAdmissions.length === 0 ? (
                  <p style={{ padding: 16, textAlign: "center", color: "var(--text-muted)", fontSize: 12, margin: 0 }}>
                    No active admissions found.
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
                      onClick={() => handlePatSelect(a)}
                    >
                      <div style={{ display: "flex", justifyContent: "space-between", fontWeight: 600, fontSize: 13 }}>
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
    </div>
  );
}
