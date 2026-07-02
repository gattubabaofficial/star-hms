"use client";

import React, { useEffect, useState, useRef } from "react";
import styles from "../../../dashboard.module.css";
import {
  Search, RefreshCw, X, Save, Printer, ArrowLeft, Plus, Trash2, Calendar, FileText, CheckCircle
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

interface PrescriptionItem {
  _key: string;
  MedName: string;
  Dosage: string;
  Freq: string;
  Days: string;
}

interface DischargeSummary {
  IdsCode:         number;
  IdsIpgCode:      number;
  IdsDate:         string;
  IdsTime:         string;
  IdsComplaints:   string;
  IdsFindings:     string;
  IdsCourse:       string;
  IdsCondition:    string;
  IdsAdvice:       string;
  IdsPrescription: string; // JSON String
  IdsFollowUpDate: string;
}

const EMPTY_PAT: PatientInfo = {
  IhdCode: 0, IhdVchNo: 0, PttCode: null, PttName: "", PttRegNo: null,
  PttSex: "", Age: "", DctName: "", WrdName: "", BedName: "", PcgName: "", Scheme: "",
  PttRefName: "", PttAddr: "",
};

const EMPTY_SUMMARY: DischargeSummary = {
  IdsCode: 0,
  IdsIpgCode: 0,
  IdsDate: new Date().toISOString().slice(0, 10),
  IdsTime: "12:00",
  IdsComplaints: "",
  IdsFindings: "",
  IdsCourse: "",
  IdsCondition: "",
  IdsAdvice: "",
  IdsPrescription: "[]",
  IdsFollowUpDate: ""
};

function uid() { return Math.random().toString(36).slice(2); }

export default function DischargeSummaryPage() {
  const [admissions, setAdmissions] = useState<ActiveAdmission[]>([]);
  const [showPatSearch, setShowPatSearch] = useState(false);
  const [patFilter, setPatFilter] = useState("");
  const [selectedPat, setSelectedPat] = useState<ActiveAdmission | null>(null);
  const [patInfo, setPatInfo] = useState<PatientInfo>(EMPTY_PAT);
  const [patLoading, setPatLoading] = useState(false);

  // Form inputs
  const [summary, setSummary] = useState<DischargeSummary>(EMPTY_SUMMARY);
  const [prescriptions, setPrescriptions] = useState<PrescriptionItem[]>([]);
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
      const res = await fetch(`${API}/charges/patient-info/${ihdCode}`);
      if (res.ok) {
        setPatInfo(await res.json());
      }
      
      const sumRes = await fetch(`${API}/discharge-summary/${ihdCode}`);
      if (sumRes.ok) {
        const data = await sumRes.json() as DischargeSummary;
        setSummary(data);
        try {
          setPrescriptions(JSON.parse(data.IdsPrescription || "[]"));
        } catch {
          setPrescriptions([]);
        }
      }
    } catch (e) {
      console.error(e);
      showToast("Error loading patient discharge details.", false);
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

  const handleInputChange = (field: keyof DischargeSummary, val: any) => {
    setSummary(prev => ({ ...prev, [field]: val }));
  };

  // Prescription list adjustments
  const addMedRow = () => {
    setPrescriptions(prev => [...prev, { _key: uid(), MedName: "", Dosage: "1-0-1", Freq: "After food", Days: "5" }]);
  };

  const removeMedRow = (key: string) => {
    setPrescriptions(prev => prev.filter(p => p._key !== key));
  };

  const handleMedChange = (key: string, field: keyof PrescriptionItem, val: string) => {
    setPrescriptions(prev => prev.map(p => p._key === key ? { ...p, [field]: val } : p));
  };

  const handleSave = async () => {
    if (!selectedPat) {
      showToast("Please select a patient admission stay.", false);
      return;
    }
    setSaving(true);
    try {
      const res = await fetch(`${API}/discharge-summary`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          ...summary,
          IdsIpgCode: selectedPat.IhdCode,
          IdsPrescription: JSON.stringify(prescriptions)
        })
      });
      if (res.ok) {
        showToast("Discharge Summary details committed successfully!");
        loadPatientDetails(selectedPat.IhdCode);
      } else {
        showToast("Failed to save discharge summary.", false);
      }
    } catch (e) {
      console.error(e);
      showToast("Network error saving discharge summary.", false);
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
      {/* Toast message alert */}
      {toast && (
        <div className={`${styles.toast} ${toast.ok ? styles.toastSuccess : styles.toastError}`}>
          {toast.msg}
        </div>
      )}

      {/* Header bar */}
      <div style={{ display: "flex", justifyContent: "space-between", alignItems: "center" }}>
        <div>
          <h2 style={{ fontSize: 20, fontWeight: 800, margin: 0, display: "flex", alignItems: "center", gap: 8 }}>
            <FileText style={{ color: "var(--accent-color)" }} /> Patient Discharge Summary Builder
          </h2>
          <span style={{ fontSize: 12, color: "var(--text-secondary)" }}>
            Document medical stay course, condition on discharge, take-home prescription medicines and advise.
          </span>
        </div>

        <button className={styles.secondaryBtn} onClick={() => window.history.back()} style={{ display: "flex", alignItems: "center", gap: 6 }}>
          <ArrowLeft size={15} /> Back
        </button>
      </div>

      {/* Workspace split */}
      <div style={{ display: "grid", gridTemplateColumns: "1.2fr 2fr", gap: 20, alignItems: "start" }}>
        {/* Left Side Column */}
        <div style={{ display: "flex", flexDirection: "column", gap: 20 }}>
          {/* Patient Selector */}
          <div className={styles.sectionBox} style={{ display: "flex", flexDirection: "column", gap: 14 }}>
            <div style={{ borderBottom: "1px solid var(--border-light)", paddingBottom: 10 }}>
              <h3 style={{ fontSize: 14, fontWeight: 700, margin: 0 }}>Select stay case</h3>
            </div>
            
            <div style={{ display: "flex", gap: 6 }}>
              <input
                type="text"
                readOnly
                placeholder="Choose active patient..."
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
                  <span style={{ color: "var(--text-secondary)" }}>UHID / Reg No: </span>
                  <strong>{patInfo.PttRegNo || "—"}</strong>
                </div>
                <div>
                  <span style={{ color: "var(--text-secondary)" }}>Consulting Doctor: </span>
                  <strong>{patInfo.DctName}</strong>
                </div>
                <div>
                  <span style={{ color: "var(--text-secondary)" }}>Bed and Ward: </span>
                  <strong>{patInfo.WrdName} / {patInfo.BedName}</strong>
                </div>
                <div>
                  <span style={{ color: "var(--text-secondary)" }}>Address / Referal: </span>
                  <strong>{patInfo.PttAddr || "—"} ({patInfo.PttRefName || "—"})</strong>
                </div>
              </div>
            )}
          </div>

          {/* Condition on Discharge */}
          <div className={styles.sectionBox} style={{ display: "flex", flexDirection: "column", gap: 14 }}>
            <div style={{ borderBottom: "1px solid var(--border-light)", paddingBottom: 10, display: "flex", alignItems: "center", gap: 8 }}>
              <CheckCircle size={18} style={{ color: "var(--status-success)" }} />
              <h3 style={{ fontSize: 14, fontWeight: 700, margin: 0 }}>Discharge Conditions & Advise</h3>
            </div>

            <div>
              <label style={{ display: "block", fontSize: 11, fontWeight: 600, color: "var(--text-secondary)", marginBottom: 4 }}>
                General Condition on Discharge
              </label>
              <input
                type="text"
                placeholder="e.g. Stable, Conscious, Ambulatory..."
                value={summary.IdsCondition}
                onChange={e => handleInputChange("IdsCondition", e.target.value)}
                style={{
                  border: "1px solid var(--border-light)", borderRadius: 8,
                  padding: "8px 12px", width: "100%", outline: "none", fontSize: 13,
                  background: "var(--bg-card)", color: "var(--text-primary)",
                }}
              />
            </div>

            <div>
              <label style={{ display: "block", fontSize: 11, fontWeight: 600, color: "var(--text-secondary)", marginBottom: 4 }}>
                Advise, Diet & Limitations
              </label>
              <textarea
                rows={3}
                placeholder="Dietary instructions, physical activity limitations, etc..."
                value={summary.IdsAdvice}
                onChange={e => handleInputChange("IdsAdvice", e.target.value)}
                style={{
                  border: "1px solid var(--border-light)", borderRadius: 8,
                  padding: "8px 12px", width: "100%", outline: "none", fontSize: 13,
                  background: "var(--bg-card)", color: "var(--text-primary)", resize: "none"
                }}
              />
            </div>

            <div>
              <label style={{ display: "block", fontSize: 11, fontWeight: 600, color: "var(--text-secondary)", marginBottom: 4 }}>
                Follow-Up Date
              </label>
              <input
                type="date"
                value={summary.IdsFollowUpDate}
                onChange={e => handleInputChange("IdsFollowUpDate", e.target.value)}
                style={{
                  border: "1px solid var(--border-light)", borderRadius: 8,
                  padding: "8px 12px", width: "100%", outline: "none", fontSize: 13,
                  background: "var(--bg-card)", color: "var(--text-primary)",
                }}
              />
            </div>
          </div>
        </div>

        {/* Right Side Column */}
        <div style={{ display: "flex", flexDirection: "column", gap: 20 }}>
          {/* Main Case Summary details */}
          <div className={styles.sectionBox} style={{ display: "flex", flexDirection: "column", gap: 14 }}>
            <div style={{ borderBottom: "1px solid var(--border-light)", paddingBottom: 10, display: "flex", justifyContent: "space-between", alignItems: "center" }}>
              <h3 style={{ fontSize: 14, fontWeight: 700, margin: 0 }}>Course Summary Details</h3>
              <div style={{ display: "flex", gap: 10, fontSize: 12 }}>
                <span>Date:</span>
                <input
                  type="date"
                  value={summary.IdsDate}
                  onChange={e => handleInputChange("IdsDate", e.target.value)}
                  style={{ border: "1px solid var(--border-light)", borderRadius: 4, padding: "2px 6px" }}
                />
                <span>Time:</span>
                <input
                  type="text"
                  value={summary.IdsTime}
                  onChange={e => handleInputChange("IdsTime", e.target.value)}
                  style={{ border: "1px solid var(--border-light)", borderRadius: 4, padding: "2px 6px", width: 60 }}
                />
              </div>
            </div>

            <div style={{ display: "flex", flexDirection: "column", gap: 12 }}>
              <div>
                <label style={{ display: "block", fontSize: 12, fontWeight: 600, color: "var(--text-secondary)", marginBottom: 6 }}>
                  Admission Chief Complaints & History
                </label>
                <textarea
                  rows={2}
                  placeholder="Summarize complaints on admission..."
                  value={summary.IdsComplaints}
                  onChange={e => handleInputChange("IdsComplaints", e.target.value)}
                  style={{
                    border: "1px solid var(--border-light)", borderRadius: 8,
                    padding: "8px 12px", width: "100%", outline: "none", fontSize: 13,
                    background: "var(--bg-card)", color: "var(--text-primary)", resize: "vertical"
                  }}
                />
              </div>

              <div>
                <label style={{ display: "block", fontSize: 12, fontWeight: 600, color: "var(--text-secondary)", marginBottom: 6 }}>
                  Investigation Findings & Lab Summary
                </label>
                <textarea
                  rows={2}
                  placeholder="Key investigations findings, pathology, x-ray details..."
                  value={summary.IdsFindings}
                  onChange={e => handleInputChange("IdsFindings", e.target.value)}
                  style={{
                    border: "1px solid var(--border-light)", borderRadius: 8,
                    padding: "8px 12px", width: "100%", outline: "none", fontSize: 13,
                    background: "var(--bg-card)", color: "var(--text-primary)", resize: "vertical"
                  }}
                />
              </div>

              <div>
                <label style={{ display: "block", fontSize: 12, fontWeight: 600, color: "var(--text-secondary)", marginBottom: 6 }}>
                  Course in Hospital & Treatment Administered
                </label>
                <textarea
                  rows={3}
                  placeholder="Specify procedures, surgery notes, antibiotic course or daily progress..."
                  value={summary.IdsCourse}
                  onChange={e => handleInputChange("IdsCourse", e.target.value)}
                  style={{
                    border: "1px solid var(--border-light)", borderRadius: 8,
                    padding: "8px 12px", width: "100%", outline: "none", fontSize: 13,
                    background: "var(--bg-card)", color: "var(--text-primary)", resize: "vertical"
                  }}
                />
              </div>
            </div>
          </div>

          {/* Discharge Prescription Grid */}
          <div className={styles.sectionBox} style={{ display: "flex", flexDirection: "column", gap: 14 }}>
            <div style={{ display: "flex", justifyContent: "space-between", alignItems: "center", borderBottom: "1px solid var(--border-light)", paddingBottom: 10 }}>
              <h3 style={{ fontSize: 14, fontWeight: 700, margin: 0 }}>Take-Home Medications Prescription</h3>
              <button className={styles.secondaryBtn} onClick={addMedRow} style={{ padding: "4px 10px", fontSize: 12, display: "flex", alignItems: "center", gap: 4 }}>
                <Plus size={14} /> Add Medicine
              </button>
            </div>

            <div style={{ maxHeight: 250, overflowY: "auto" }}>
              <table className={styles.table} style={{ fontSize: 12, width: "100%" }}>
                <thead>
                  <tr>
                    <th>Medicine Name</th>
                    <th style={{ width: 100 }}>Dosage</th>
                    <th style={{ width: 150 }}>Frequency / Instr.</th>
                    <th style={{ width: 80 }}>Days</th>
                    <th style={{ width: 50 }}></th>
                  </tr>
                </thead>
                <tbody>
                  {prescriptions.length === 0 ? (
                    <tr>
                      <td colSpan={5} style={{ textAlign: "center", color: "var(--text-muted)", padding: 20 }}>
                        No medicines added. Click 'Add Medicine' above.
                      </td>
                    </tr>
                  ) : (
                    prescriptions.map(p => (
                      <tr key={p._key}>
                        <td>
                          <input
                            type="text"
                            placeholder="e.g. Tab. Paracetamol 650mg"
                            value={p.MedName}
                            onChange={e => handleMedChange(p._key, "MedName", e.target.value)}
                            style={{
                              border: "1px solid var(--border-light)", borderRadius: 4,
                              padding: "4px 8px", width: "100%", outline: "none", fontSize: 12,
                              background: "var(--bg-card)", color: "var(--text-primary)",
                            }}
                          />
                        </td>
                        <td>
                          <input
                            type="text"
                            placeholder="e.g. 1-0-1"
                            value={p.Dosage}
                            onChange={e => handleMedChange(p._key, "Dosage", e.target.value)}
                            style={{
                              border: "1px solid var(--border-light)", borderRadius: 4,
                              padding: "4px 8px", width: "100%", outline: "none", fontSize: 12,
                              background: "var(--bg-card)", color: "var(--text-primary)",
                            }}
                          />
                        </td>
                        <td>
                          <input
                            type="text"
                            placeholder="e.g. After meals"
                            value={p.Freq}
                            onChange={e => handleMedChange(p._key, "Freq", e.target.value)}
                            style={{
                              border: "1px solid var(--border-light)", borderRadius: 4,
                              padding: "4px 8px", width: "100%", outline: "none", fontSize: 12,
                              background: "var(--bg-card)", color: "var(--text-primary)",
                            }}
                          />
                        </td>
                        <td>
                          <input
                            type="text"
                            placeholder="e.g. 5 days"
                            value={p.Days}
                            onChange={e => handleMedChange(p._key, "Days", e.target.value)}
                            style={{
                              border: "1px solid var(--border-light)", borderRadius: 4,
                              padding: "4px 8px", width: "100%", outline: "none", fontSize: 12,
                              background: "var(--bg-card)", color: "var(--text-primary)",
                            }}
                          />
                        </td>
                        <td>
                          <button
                            className={styles.secondaryBtn}
                            onClick={() => removeMedRow(p._key)}
                            style={{ padding: 6, color: "var(--status-danger)", borderColor: "var(--border-light)" }}
                          >
                            <Trash2 size={13} />
                          </button>
                        </td>
                      </tr>
                    ))
                  )}
                </tbody>
              </table>
            </div>

            <div style={{ display: "flex", gap: 10, justifyContent: "flex-end", borderTop: "1px solid var(--border-light)", paddingTop: 14 }}>
              <button className={styles.secondaryBtn} onClick={() => window.print()} style={{ display: "flex", alignItems: "center", gap: 6 }}>
                <Printer size={15} /> Print Summary
              </button>
              <button className={styles.primaryBtn} onClick={handleSave} disabled={saving} style={{ display: "flex", alignItems: "center", gap: 6 }}>
                {saving ? <RefreshCw size={15} className="animate-spin" /> : <Save size={15} />}
                Save Summary
              </button>
            </div>
          </div>
        </div>
      </div>

      {/* Patient Lookup Search Modal */}
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
                  placeholder="Search name or IPD No..."
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
