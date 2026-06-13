"use client";

import React, { useEffect, useState } from "react";
import styles from "../../../dashboard.module.css";
import { Stethoscope, AlertCircle, Check, Printer } from "lucide-react";

interface Patient {
  ptt_code: number;
  ptt_name: string;
  ptt_reg_no: number;
  category?: {
    pcg_name: string;
    pcg_disc_per: number;
  };
}

interface Doctor {
  dct_code: number;
  dct_name: string;
  dct_title: string;
}

export default function OPDRegistrationPage() {
  const [patients, setPatients] = useState<Patient[]>([]);
  const [doctors, setDoctors] = useState<Doctor[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");
  const [success, setSuccess] = useState("");

  const [formData, setFormData] = useState({
    opg_ptt_code: "",
    opg_dct_code: "",
    opg_fee: "500",
    discount_amount: "0",
    paid_amount: "500"
  });

  useEffect(() => {
    const loadData = async () => {
      try {
        const pRes = await fetch("http://127.0.0.1:8000/api/masters/patients");
        const dRes = await fetch("http://127.0.0.1:8000/api/masters/doctors");
        
        if (pRes.ok) {
          const pData = await pRes.json();
          setPatients(pData);
          if (pData.length > 0) {
            setFormData(prev => ({ ...prev, opg_ptt_code: String(pData[0].ptt_code) }));
          }
        }
        if (dRes.ok) {
          const dData = await dRes.json();
          setDoctors(dData);
          if (dData.length > 0) {
            setFormData(prev => ({ ...prev, opg_dct_code: String(dData[0].dct_code) }));
          }
        }
      } catch (e) {
        console.log("Error loading registration dependencies:", e);
      } finally {
        setLoading(false);
      }
    };
    loadData();
  }, []);

  // Recalculate discount
  useEffect(() => {
    if (!formData.opg_ptt_code || !formData.opg_fee) return;
    const selectedPtt = patients.find(p => p.ptt_code === Number(formData.opg_ptt_code));
    const fee = Number(formData.opg_fee || 0);
    
    if (selectedPtt && selectedPtt.category) {
      const discPer = selectedPtt.category.pcg_disc_per || 0;
      const discAmt = (fee * discPer) / 100;
      const net = fee - discAmt;
      setFormData(prev => ({
        ...prev,
        discount_amount: String(discAmt),
        paid_amount: String(net)
      }));
    } else {
      setFormData(prev => ({
        ...prev,
        discount_amount: "0",
        paid_amount: String(fee)
      }));
    }
  }, [formData.opg_ptt_code, formData.opg_fee, patients]);

  const handleInputChange = (e: React.ChangeEvent<HTMLInputElement | HTMLSelectElement>) => {
    const { name, value } = e.target;
    setFormData(prev => ({ ...prev, [name]: value }));
  };

  const handleRegister = async (e: React.FormEvent) => {
    e.preventDefault();
    setError("");
    setSuccess("");

    if (!formData.opg_ptt_code || !formData.opg_dct_code) {
      setError("Please select both a patient and consulting doctor.");
      return;
    }

    const fee = Number(formData.opg_fee || 0);
    const disc = Number(formData.discount_amount || 0);
    const paid = Number(formData.paid_amount || 0);
    const net = fee - disc;

    try {
      const token = localStorage.getItem("token");
      
      // 1. Create OPD Visit
      const regResponse = await fetch("http://127.0.0.1:8000/api/opd/registrations", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          "Authorization": `Bearer ${token}`
        },
        body: JSON.stringify({
          opg_ptt_code: Number(formData.opg_ptt_code),
          opg_dct_code: Number(formData.opg_dct_code),
          opg_fee: fee
        })
      });

      if (!regResponse.ok) {
        const errData = await regResponse.json();
        throw new Error(errData.detail || "Failed to register OPD visit");
      }

      const regData = await regResponse.json();

      // 2. Create Bill
      const billResponse = await fetch("http://127.0.0.1:8000/api/opd/bills", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          "Authorization": `Bearer ${token}`
        },
        body: JSON.stringify({
          opg_code: regData.opg_code,
          total_amount: fee,
          discount_amount: disc,
          net_amount: net,
          paid_amount: paid,
          status: paid >= net ? "paid" : paid > 0 ? "partial" : "unpaid"
        })
      });

      if (!billResponse.ok) {
        throw new Error("Visit created, but invoice generation failed.");
      }

      setSuccess("OPD Visit & Consultation Invoice successfully logged!");
      // Reset form
      setFormData(prev => ({
        ...prev,
        opg_fee: "500",
        discount_amount: "0",
        paid_amount: "500"
      }));
    } catch (err: any) {
      setError(err.message || "An error occurred during registration");
    }
  };

  if (loading) {
    return <p style={{ color: "var(--text-secondary)", fontSize: "14px" }}>Loading registration console...</p>;
  }

  return (
    <div style={{ maxWidth: "680px" }}>
      <div className={styles.sectionBox}>
        <div className={styles.sectionHeader}>
          <div style={{ display: "flex", alignItems: "center", gap: "10px" }}>
            <Stethoscope size={22} style={{ color: "var(--accent-color)" }} />
            <h3 className={styles.sectionTitle}>OPD Patient Visit Registration</h3>
          </div>
        </div>

        <form onSubmit={handleRegister}>
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
            <label htmlFor="opg_ptt_code">Select Registered Patient *</label>
            <select
              className={styles.formControl}
              id="opg_ptt_code"
              name="opg_ptt_code"
              value={formData.opg_ptt_code}
              onChange={handleInputChange}
            >
              {patients.map(p => (
                <option key={p.ptt_code} value={p.ptt_code}>
                  {p.ptt_name} (Reg #{p.ptt_reg_no || p.ptt_code}) {p.category ? `[${p.category.pcg_name}]` : ""}
                </option>
              ))}
            </select>
          </div>

          <div className={styles.formGroup}>
            <label htmlFor="opg_dct_code">Consulting Doctor *</label>
            <select
              className={styles.formControl}
              id="opg_dct_code"
              name="opg_dct_code"
              value={formData.opg_dct_code}
              onChange={handleInputChange}
            >
              {doctors.map(d => (
                <option key={d.dct_code} value={d.dct_code}>
                  {d.dct_title} {d.dct_name}
                </option>
              ))}
            </select>
          </div>

          <div className={styles.formGrid}>
            <div className={styles.formGroup}>
              <label htmlFor="opg_fee">Base Consultation Fee (₹) *</label>
              <input
                className={styles.formControl}
                id="opg_fee"
                name="opg_fee"
                type="number"
                value={formData.opg_fee}
                onChange={handleInputChange}
                required
              />
            </div>

            <div className={styles.formGroup}>
              <label htmlFor="discount_amount">Category Discount (₹)</label>
              <input
                className={styles.formControl}
                id="discount_amount"
                name="discount_amount"
                type="number"
                readOnly
                style={{ backgroundColor: "var(--bg-secondary)", cursor: "not-allowed" }}
                value={formData.discount_amount}
              />
            </div>
          </div>

          <div className={styles.formGroup}>
            <label htmlFor="paid_amount">Paid Amount (₹) *</label>
            <input
              className={styles.formControl}
              id="paid_amount"
              name="paid_amount"
              type="number"
              value={formData.paid_amount}
              onChange={handleInputChange}
              required
            />
          </div>

          <div style={{ marginTop: "24px", display: "flex", justifyContent: "flex-end" }}>
            <button type="submit" className={styles.primaryBtn} style={{ width: "100%", justifyContent: "center" }}>
              Log Visit & Generate Invoice
            </button>
          </div>
        </form>
      </div>
    </div>
  );
}
