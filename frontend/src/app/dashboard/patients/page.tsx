"use client";

import React, { useEffect, useState } from "react";
import styles from "../../dashboard.module.css";
import { Plus, Search, User, Filter, AlertCircle, Check } from "lucide-react";

interface PatientCategory {
  pcg_code: number;
  pcg_name: string;
  pcg_disc_per: number;
}

interface Patient {
  ptt_code: number;
  ptt_name: string;
  ptt_reg_no: number;
  ptt_reg_date: string;
  ptt_sex: string;
  ptt_dob: string;
  ptt_address: string;
  ptt_telephone: string;
  ptt_sms_no: string;
  ptt_email: string;
  ptt_pcg_code: number;
  ptt_remark: string;
  category?: PatientCategory;
}

export default function PatientsPage() {
  const [patients, setPatients] = useState<Patient[]>([]);
  const [categories, setCategories] = useState<PatientCategory[]>([]);
  const [searchTerm, setSearchTerm] = useState("");
  const [loading, setLoading] = useState(true);
  const [modalOpen, setModalOpen] = useState(false);
  const [error, setError] = useState("");
  const [successMsg, setSuccessMsg] = useState("");

  // Form states
  const [formData, setFormData] = useState({
    ptt_name: "",
    ptt_sex: "M",
    ptt_dob: "",
    ptt_address: "",
    ptt_telephone: "",
    ptt_sms_no: "",
    ptt_email: "",
    ptt_pcg_code: "",
    ptt_remark: ""
  });

  const fetchPatientsAndCategories = async () => {
    try {
      const pRes = await fetch("http://127.0.0.1:8000/api/masters/patients");
      const cRes = await fetch("http://127.0.0.1:8000/api/masters/patient-categories");
      
      if (pRes.ok) {
        const pData = await pRes.json();
        setPatients(pData);
      }
      if (cRes.ok) {
        const cData = await cRes.json();
        setCategories(cData);
        if (cData.length > 0 && !formData.ptt_pcg_code) {
          setFormData(prev => ({ ...prev, ptt_pcg_code: String(cData[0].pcg_code) }));
        }
      }
    } catch (e) {
      console.log("Error loading patient data:", e);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchPatientsAndCategories();
  }, []);

  const handleInputChange = (e: React.ChangeEvent<HTMLInputElement | HTMLSelectElement | HTMLTextAreaElement>) => {
    const { name, value } = e.target;
    setFormData(prev => ({ ...prev, [name]: value }));
  };

  const handleRegisterPatient = async (e: React.FormEvent) => {
    e.preventDefault();
    setError("");
    setSuccessMsg("");

    if (!formData.ptt_name) {
      setError("Patient Name is required.");
      return;
    }

    try {
      const token = localStorage.getItem("token");
      const response = await fetch("http://127.0.0.1:8000/api/masters/patients", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          "Authorization": `Bearer ${token}`
        },
        body: JSON.stringify({
          ptt_name: formData.ptt_name,
          ptt_sex: formData.ptt_sex,
          ptt_dob: formData.ptt_dob || null,
          ptt_address: formData.ptt_address || "",
          ptt_telephone: formData.ptt_telephone || "",
          ptt_sms_no: formData.ptt_sms_no || "",
          ptt_email: formData.ptt_email || "",
          ptt_pcg_code: formData.ptt_pcg_code ? Number(formData.ptt_pcg_code) : null,
          ptt_remark: formData.ptt_remark || ""
        })
      });

      if (!response.ok) {
        const errData = await response.json();
        throw new Error(errData.detail || "Failed to register patient");
      }

      setSuccessMsg("Patient registered successfully!");
      // Reset form
      setFormData({
        ptt_name: "",
        ptt_sex: "M",
        ptt_dob: "",
        ptt_address: "",
        ptt_telephone: "",
        ptt_sms_no: "",
        ptt_email: "",
        ptt_pcg_code: categories.length > 0 ? String(categories[0].pcg_code) : "",
        ptt_remark: ""
      });

      // Reload patients
      await fetchPatientsAndCategories();
      
      // Close modal after delay
      setTimeout(() => {
        setModalOpen(false);
        setSuccessMsg("");
      }, 1500);

    } catch (err: any) {
      setError(err.message || "An error occurred");
    }
  };

  const filteredPatients = patients.filter(p => {
    const query = searchTerm.toLowerCase();
    return (
      p.ptt_name.toLowerCase().includes(query) ||
      (p.ptt_telephone && p.ptt_telephone.includes(query)) ||
      (p.ptt_reg_no && String(p.ptt_reg_no).includes(query))
    );
  });

  return (
    <div>
      {/* Search Toolbar */}
      <div className={styles.toolbar}>
        <div className={styles.searchBar}>
          <Search size={18} style={{ color: "var(--text-secondary)" }} />
          <input
            type="text"
            placeholder="Search by Name, Reg No or Phone..."
            value={searchTerm}
            onChange={(e) => setSearchTerm(e.target.value)}
          />
        </div>
        
        <button className={styles.primaryBtn} onClick={() => setModalOpen(true)}>
          <Plus size={18} />
          <span>Register Patient</span>
        </button>
      </div>

      {/* Patient List Grid */}
      {loading ? (
        <p style={{ color: "var(--text-secondary)", fontSize: "14px" }}>Loading patient registry...</p>
      ) : filteredPatients.length === 0 ? (
        <div style={{ backgroundColor: "var(--bg-card)", border: "1px solid var(--border-light)", borderRadius: "16px", padding: "80px", textAlign: "center" }}>
          <User size={48} style={{ color: "var(--text-muted)", marginBottom: "16px" }} />
          <h3 style={{ fontSize: "18px", marginBottom: "8px" }}>No Patients Found</h3>
          <p style={{ color: "var(--text-secondary)", fontSize: "14px", marginBottom: "20px" }}>No matching records exist in the database.</p>
          <button className={styles.secondaryBtn} style={{ margin: "0 auto" }} onClick={() => setSearchTerm("")}>Clear Filters</button>
        </div>
      ) : (
        <div className={styles.tableContainer}>
          <table className={styles.table}>
            <thead>
              <tr>
                <th>Reg No</th>
                <th>Name</th>
                <th>Sex</th>
                <th>Date of Birth</th>
                <th>Category</th>
                <th>Telephone</th>
                <th>Address</th>
              </tr>
            </thead>
            <tbody>
              {filteredPatients.map((ptt) => (
                <tr key={ptt.ptt_code}>
                  <td style={{ fontWeight: 600, color: "var(--accent-color)" }}>#{ptt.ptt_reg_no || ptt.ptt_code}</td>
                  <td style={{ fontWeight: 600 }}>{ptt.ptt_name}</td>
                  <td>
                    <span className={`${styles.badge} ${ptt.ptt_sex === "M" ? styles.badgeSuccess : styles.badgeWarning}`}>
                      {ptt.ptt_sex || "N/A"}
                    </span>
                  </td>
                  <td>{ptt.ptt_dob ? new Date(ptt.ptt_dob).toLocaleDateString() : "--"}</td>
                  <td>
                    <span className={`${styles.badge} ${styles.badgeAccent}`}>
                      {ptt.category ? ptt.category.pcg_name : "General"}
                    </span>
                  </td>
                  <td>{ptt.ptt_telephone || "--"}</td>
                  <td style={{ color: "var(--text-secondary)", maxWidth: "250px", overflow: "hidden", textOverflow: "ellipsis", whiteSpace: "nowrap" }}>
                    {ptt.ptt_address || "--"}
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      )}

      {/* Register Patient Modal */}
      {modalOpen && (
        <div className={styles.modalOverlay}>
          <div className={styles.modalContent}>
            <div className={styles.modalHeader}>
              <h3 style={{ fontSize: "20px", fontWeight: 600 }}>Patient Registration Form</h3>
              <button className={styles.closeBtn} onClick={() => setModalOpen(false)}>×</button>
            </div>
            
            <form onSubmit={handleRegisterPatient}>
              <div className={styles.modalBody}>
                {error && (
                  <div className={`${styles.errorBox}`} style={{ marginBottom: "20px", display: "flex", alignItems: "center", gap: "8px" }}>
                    <AlertCircle size={16} /> {error}
                  </div>
                )}
                {successMsg && (
                  <div className={`${styles.badge} ${styles.badgeSuccess}`} style={{ width: "100%", padding: "12px", borderRadius: "8px", marginBottom: "20px", gap: "8px", justifyContent: "center" }}>
                    <Check size={16} /> {successMsg}
                  </div>
                )}

                <div className={styles.formGroup}>
                  <label htmlFor="ptt_name">Full Patient Name *</label>
                  <input
                    className={styles.formControl}
                    id="ptt_name"
                    name="ptt_name"
                    type="text"
                    required
                    placeholder="Enter name, e.g. John Doe"
                    value={formData.ptt_name}
                    onChange={handleInputChange}
                  />
                </div>

                <div className={styles.formGrid}>
                  <div className={styles.formGroup}>
                    <label htmlFor="ptt_sex">Sex</label>
                    <select
                      className={styles.formControl}
                      id="ptt_sex"
                      name="ptt_sex"
                      value={formData.ptt_sex}
                      onChange={handleInputChange}
                    >
                      <option value="M">Male</option>
                      <option value="F">Female</option>
                      <option value="O">Other</option>
                    </select>
                  </div>

                  <div className={styles.formGroup}>
                    <label htmlFor="ptt_dob">Date of Birth</label>
                    <input
                      className={styles.formControl}
                      id="ptt_dob"
                      name="ptt_dob"
                      type="date"
                      value={formData.ptt_dob}
                      onChange={handleInputChange}
                    />
                  </div>
                </div>

                <div className={styles.formGrid}>
                  <div className={styles.formGroup}>
                    <label htmlFor="ptt_telephone">Telephone</label>
                    <input
                      className={styles.formControl}
                      id="ptt_telephone"
                      name="ptt_telephone"
                      type="text"
                      placeholder="e.g. 9876543210"
                      value={formData.ptt_telephone}
                      onChange={handleInputChange}
                    />
                  </div>

                  <div className={styles.formGroup}>
                    <label htmlFor="ptt_sms_no">SMS Number</label>
                    <input
                      className={styles.formControl}
                      id="ptt_sms_no"
                      name="ptt_sms_no"
                      type="text"
                      placeholder="e.g. 9876543210"
                      value={formData.ptt_sms_no}
                      onChange={handleInputChange}
                    />
                  </div>
                </div>

                <div className={styles.formGrid}>
                  <div className={styles.formGroup}>
                    <label htmlFor="ptt_email">Email Address</label>
                    <input
                      className={styles.formControl}
                      id="ptt_email"
                      name="ptt_email"
                      type="email"
                      placeholder="e.g. patient@hms.com"
                      value={formData.ptt_email}
                      onChange={handleInputChange}
                    />
                  </div>

                  <div className={styles.formGroup}>
                    <label htmlFor="ptt_pcg_code">Patient Category</label>
                    <select
                      className={styles.formControl}
                      id="ptt_pcg_code"
                      name="ptt_pcg_code"
                      value={formData.ptt_pcg_code}
                      onChange={handleInputChange}
                    >
                      {categories.map(cat => (
                        <option key={cat.pcg_code} value={cat.pcg_code}>
                          {cat.pcg_name} ({cat.pcg_disc_per}% Disc)
                        </option>
                      ))}
                    </select>
                  </div>
                </div>

                <div className={styles.formGroup}>
                  <label htmlFor="ptt_address">Residential Address</label>
                  <input
                    className={styles.formControl}
                    id="ptt_address"
                    name="ptt_address"
                    placeholder="Enter full address"
                    value={formData.ptt_address}
                    onChange={handleInputChange}
                  />
                </div>

                <div className={styles.formGroup}>
                  <label htmlFor="ptt_remark">Internal Remarks</label>
                  <textarea
                    className={styles.formControl}
                    id="ptt_remark"
                    name="ptt_remark"
                    rows={2}
                    placeholder="Any patient allergies or specific notes"
                    value={formData.ptt_remark}
                    onChange={handleInputChange}
                    style={{ resize: "none" }}
                  />
                </div>
              </div>
              
              <div className={styles.modalFooter}>
                <button type="button" className={styles.secondaryBtn} onClick={() => setModalOpen(false)}>Cancel</button>
                <button type="submit" className={styles.primaryBtn}>Save Patient</button>
              </div>
            </form>
          </div>
        </div>
      )}
    </div>
  );
}
