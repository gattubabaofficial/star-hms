"use client";

import React, { useEffect, useState } from "react";
import styles from "../../../dashboard.module.css";
import { Bed as BedIcon, Plus, AlertCircle, Check } from "lucide-react";

interface Bed {
  bdm_code: number;
  bdm_name: string;
  is_occupied: boolean;
  ward?: { wrd_name: string };
}

interface Patient {
  ptt_code: number;
  ptt_name: string;
  ptt_reg_no: number;
}

interface Doctor {
  dct_code: number;
  dct_name: string;
  dct_title: string;
}

export default function IPDAdmissionPage() {
  const [patients, setPatients] = useState<Patient[]>([]);
  const [doctors, setDoctors] = useState<Doctor[]>([]);
  const [beds, setBeds] = useState<Bed[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");
  const [success, setSuccess] = useState("");

  const [formData, setFormData] = useState({
    ipd_ptt_code: "",
    ipd_dct_code: "",
    ipd_bdm_code: "",
    ipd_deposit: "5000"
  });

  const loadDependencies = async () => {
    try {
      const pRes = await fetch("http://127.0.0.1:8000/api/masters/patients");
      const dRes = await fetch("http://127.0.0.1:8000/api/masters/doctors");
      const bRes = await fetch("http://127.0.0.1:8000/api/masters/beds");
      
      if (pRes.ok) {
        const pData = await pRes.json();
        setPatients(pData);
        if (pData.length > 0) setFormData(prev => ({ ...prev, ipd_ptt_code: String(pData[0].ptt_code) }));
      }
      if (dRes.ok) {
        const dData = await dRes.json();
        setDoctors(dData);
        if (dData.length > 0) setFormData(prev => ({ ...prev, ipd_dct_code: String(dData[0].dct_code) }));
      }
      if (bRes.ok) {
        const bData = await bRes.json();
        const availableBeds = bData.filter((b: Bed) => !b.is_occupied);
        setBeds(availableBeds);
        if (availableBeds.length > 0) {
          setFormData(prev => ({ ...prev, ipd_bdm_code: String(availableBeds[0].bdm_code) }));
        }
      }
    } catch (e) {
      console.log("Error loading admission dependencies:", e);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    loadDependencies();
  }, []);

  const handleInputChange = (e: React.ChangeEvent<HTMLInputElement | HTMLSelectElement>) => {
    const { name, value } = e.target;
    setFormData(prev => ({ ...prev, [name]: value }));
  };

  const handleAdmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setError("");
    setSuccess("");

    if (!formData.ipd_ptt_code || !formData.ipd_dct_code || !formData.ipd_bdm_code) {
      setError("Please ensure all fields are selected.");
      return;
    }

    try {
      const token = localStorage.getItem("token");
      const response = await fetch("http://127.0.0.1:8000/api/ipd/admissions", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          "Authorization": `Bearer ${token}`
        },
        body: JSON.stringify({
          ipd_ptt_code: Number(formData.ipd_ptt_code),
          ipd_dct_code: Number(formData.ipd_dct_code),
          ipd_bdm_code: Number(formData.ipd_bdm_code),
          ipd_deposit: Number(formData.ipd_deposit || 0)
        })
      });

      if (response.ok) {
        setSuccess("Patient successfully admitted & bed allocated!");
        setFormData(prev => ({ ...prev, ipd_deposit: "5000" }));
        await loadDependencies();
      } else {
        const errData = await response.json();
        setError(errData.detail || "Failed to admit patient");
      }
    } catch (err) {
      setError("Network error occurred");
    }
  };

  if (loading) {
    return <p style={{ color: "var(--text-secondary)", fontSize: "14px" }}>Loading admission portal...</p>;
  }

  return (
    <div style={{ maxWidth: "680px" }}>
      <div className={styles.sectionBox}>
        <div className={styles.sectionHeader}>
          <div style={{ display: "flex", alignItems: "center", gap: "10px" }}>
            <BedIcon size={22} style={{ color: "var(--accent-color)" }} />
            <h3 className={styles.sectionTitle}>IPD Patient Admission Wizard</h3>
          </div>
        </div>

        <form onSubmit={handleAdmit}>
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
            <label htmlFor="ipd_ptt_code">Select Patient *</label>
            <select
              className={styles.formControl}
              id="ipd_ptt_code"
              name="ipd_ptt_code"
              value={formData.ipd_ptt_code}
              onChange={handleInputChange}
            >
              {patients.map(p => (
                <option key={p.ptt_code} value={p.ptt_code}>
                  {p.ptt_name} (Reg #{p.ptt_reg_no || p.ptt_code})
                </option>
              ))}
            </select>
          </div>

          <div className={styles.formGroup}>
            <label htmlFor="ipd_dct_code">Attending Doctor *</label>
            <select
              className={styles.formControl}
              id="ipd_dct_code"
              name="ipd_dct_code"
              value={formData.ipd_dct_code}
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
              <label htmlFor="ipd_bdm_code">Select Available Bed *</label>
              <select
                className={styles.formControl}
                id="ipd_bdm_code"
                name="ipd_bdm_code"
                value={formData.ipd_bdm_code}
                onChange={handleInputChange}
              >
                {beds.map(b => (
                  <option key={b.bdm_code} value={b.bdm_code}>
                    {b.bdm_name} {b.ward ? `[${b.ward.wrd_name}]` : ""}
                  </option>
                ))}
                {beds.length === 0 && <option value="">No Beds Available</option>}
              </select>
            </div>

            <div className={styles.formGroup}>
              <label htmlFor="ipd_deposit">Initial Advance Deposit (₹) *</label>
              <input
                className={styles.formControl}
                id="ipd_deposit"
                name="ipd_deposit"
                type="number"
                value={formData.ipd_deposit}
                onChange={handleInputChange}
                required
              />
            </div>
          </div>

          <div style={{ marginTop: "24px" }}>
            <button 
              type="submit" 
              className={styles.primaryBtn} 
              style={{ width: "100%", justifyContent: "center" }}
              disabled={beds.length === 0}
            >
              Create IPD Admission Record
            </button>
          </div>
        </form>
      </div>
    </div>
  );
}
