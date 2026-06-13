"use client";

import React, { useEffect, useState } from "react";
import styles from "../../../dashboard.module.css";
import { LogOut, AlertCircle, Check } from "lucide-react";

interface Bed {
  bdm_code: number;
  bdm_name: string;
}

interface Patient {
  ptt_name: string;
}

interface IPDAdmission {
  ipd_code: number;
  ipd_ptt_code: number;
  ipd_dct_code: number;
  ipd_bdm_code: number;
  ipd_admission_date: string;
  ipd_deposit: number;
  ipd_status: string;
  patient?: Patient;
  bed?: Bed;
}

export default function IPDDischargePage() {
  const [admissions, setAdmissions] = useState<IPDAdmission[]>([]);
  const [loading, setLoading] = useState(true);
  
  const [selectedAdmId, setSelectedAdmId] = useState("");
  const [selectedAdmission, setSelectedAdmission] = useState<IPDAdmission | null>(null);

  const [formData, setFormData] = useState({
    room_charges: "3000",
    service_charges: "1500",
    discount_amount: "0",
    paid_amount: "4500"
  });

  const [error, setError] = useState("");
  const [success, setSuccess] = useState("");

  const loadAdmissions = async () => {
    try {
      const response = await fetch("http://127.0.0.1:8000/api/ipd/admissions");
      if (response.ok) {
        const data: IPDAdmission[] = await response.json();
        const active = data.filter(a => a.ipd_status === "admitted");
        setAdmissions(active);
        if (active.length > 0) {
          setSelectedAdmId(String(active[0].ipd_code));
        } else {
          setSelectedAdmId("");
          setSelectedAdmission(null);
        }
      }
    } catch (e) {
      console.log("Error loading active admissions:", e);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    loadAdmissions();
  }, []);

  // Update selection details
  useEffect(() => {
    if (!selectedAdmId) return;
    const adm = admissions.find(a => a.ipd_code === Number(selectedAdmId));
    if (adm) {
      setSelectedAdmission(adm);
      
      // Calculate days stayed
      const days = Math.max(1, Math.ceil((Date.now() - new Date(adm.ipd_admission_date).getTime()) / (1000 * 60 * 60 * 24)));
      const calculatedRoom = days * 1500; // ₹1500 per day
      const service = 1500; // Base service charges
      const net = calculatedRoom + service - Number(adm.ipd_deposit || 0);

      setFormData({
        room_charges: String(calculatedRoom),
        service_charges: String(service),
        discount_amount: "0",
        paid_amount: String(Math.max(0, net))
      });
    }
  }, [selectedAdmId, admissions]);

  const handleInputChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    const { name, value } = e.target;
    setFormData(prev => ({ ...prev, [name]: value }));
  };

  const handleDischarge = async (e: React.FormEvent) => {
    e.preventDefault();
    setError("");
    setSuccess("");

    if (!selectedAdmission) return;

    const room = Number(formData.room_charges || 0);
    const service = Number(formData.service_charges || 0);
    const disc = Number(formData.discount_amount || 0);
    const paid = Number(formData.paid_amount || 0);
    const total = room + service;
    const net = total - disc;

    try {
      const token = localStorage.getItem("token");
      
      // 1. Send discharge request
      const disRes = await fetch(`http://127.0.0.1:8000/api/ipd/discharge/${selectedAdmission.ipd_code}`, {
        method: "POST",
        headers: { "Authorization": `Bearer ${token}` }
      });

      if (!disRes.ok) {
        const err = await disRes.json();
        throw new Error(err.detail || "Failed to discharge patient");
      }

      // 2. Generate final bill
      const billRes = await fetch("http://127.0.0.1:8000/api/ipd/bills", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          "Authorization": `Bearer ${token}`
        },
        body: JSON.stringify({
          ipd_code: selectedAdmission.ipd_code,
          room_charges: room,
          service_charges: service,
          total_amount: total,
          discount_amount: disc,
          net_amount: net,
          paid_amount: paid,
          status: paid >= net ? "paid" : paid > 0 ? "partial" : "unpaid"
        })
      });

      if (!billRes.ok) {
        throw new Error("Discharged successfully, but invoice failed to save.");
      }

      setSuccess("Discharge processed & invoice registered! Bed is now liberated.");
      await loadAdmissions();
    } catch (err: any) {
      setError(err.message || "Network error occurred");
    }
  };

  if (loading) {
    return <p style={{ color: "var(--text-secondary)", fontSize: "14px" }}>Loading discharge console...</p>;
  }

  return (
    <div style={{ maxWidth: "680px" }}>
      <div className={styles.sectionBox}>
        <div className={styles.sectionHeader}>
          <div style={{ display: "flex", alignItems: "center", gap: "10px" }}>
            <LogOut size={22} style={{ color: "var(--status-danger)" }} />
            <h3 className={styles.sectionTitle}>In-Patient Discharge Wizard</h3>
          </div>
        </div>

        {admissions.length === 0 ? (
          <p style={{ color: "var(--text-secondary)", fontSize: "14px", padding: "16px 0" }}>No patients are actively admitted to the hospital.</p>
        ) : (
          <form onSubmit={handleDischarge}>
            {error && (
              <div style={{ color: "var(--status-danger)", display: "flex", alignItems: "center", gap: "6px", fontSize: "13px", marginBottom: "16px" }}>
                <AlertCircle size={16} /> {error}
              </div>
            )}
            {success && (
              <div style={{ color: "var(--status-success)", display: "flex", alignItems: "center", gap: "6px", fontSize: "13px", marginBottom: "16px" }}>
                <Check size={16} /> {success}
              </div>
            )}

            <div className={styles.formGroup}>
              <label htmlFor="selectedAdmId">Select Active Admission *</label>
              <select
                className={styles.formControl}
                id="selectedAdmId"
                value={selectedAdmId}
                onChange={(e) => setSelectedAdmId(e.target.value)}
              >
                {admissions.map(a => (
                  <option key={a.ipd_code} value={a.ipd_code}>
                    {a.patient?.ptt_name} (Bed: {a.bed?.bdm_name || "-"} | Adm #{a.ipd_code})
                  </option>
                ))}
              </select>
            </div>

            {selectedAdmission && (
              <div style={{ backgroundColor: "var(--bg-secondary)", padding: "16px", borderRadius: "10px", display: "flex", flexDirection: "column", gap: "6px", marginBottom: "20px", fontSize: "13px" }}>
                <div>Patient Name: <strong>{selectedAdmission.patient?.ptt_name}</strong></div>
                <div>Allotted Bed: <strong>{selectedAdmission.bed?.bdm_name || "-"}</strong></div>
                <div>Admission Date: <strong>{new Date(selectedAdmission.ipd_admission_date).toLocaleString()}</strong></div>
                <div>Advance Deposit Paid: <strong style={{ color: "var(--status-success)" }}>₹{selectedAdmission.ipd_deposit}</strong></div>
              </div>
            )}

            <div className={styles.formGrid}>
              <div className={styles.formGroup}>
                <label htmlFor="room_charges">Calculated Stay Charges (₹)</label>
                <input
                  className={styles.formControl}
                  id="room_charges"
                  name="room_charges"
                  type="number"
                  required
                  value={formData.room_charges}
                  onChange={handleInputChange}
                />
              </div>

              <div className={styles.formGroup}>
                <label htmlFor="service_charges">Clinical/Service Charges (₹)</label>
                <input
                  className={styles.formControl}
                  id="service_charges"
                  name="service_charges"
                  type="number"
                  required
                  value={formData.service_charges}
                  onChange={handleInputChange}
                />
              </div>
            </div>

            <div className={styles.formGrid}>
              <div className={styles.formGroup}>
                <label htmlFor="discount_amount">Applied Discount (₹)</label>
                <input
                  className={styles.formControl}
                  id="discount_amount"
                  name="discount_amount"
                  type="number"
                  value={formData.discount_amount}
                  onChange={handleInputChange}
                />
              </div>

              <div className={styles.formGroup}>
                <label htmlFor="paid_amount">Net Settlement Amount (₹)</label>
                <input
                  className={styles.formControl}
                  id="paid_amount"
                  name="paid_amount"
                  type="number"
                  value={formData.paid_amount}
                  onChange={handleInputChange}
                />
              </div>
            </div>

            <div style={{ marginTop: "24px" }}>
              <button type="submit" className={styles.primaryBtn} style={{ width: "100%", justifyContent: "center", backgroundColor: "var(--status-danger)" }}>
                Process Final Discharge & Invoice
              </button>
            </div>
          </form>
        )}
      </div>
    </div>
  );
}
