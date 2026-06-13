"use client";

import React, { useEffect, useState } from "react";
import styles from "../../dashboard.module.css";
import { Plus, Search, UserRound, AlertCircle, Check } from "lucide-react";

interface DoctorCategory {
  dcg_code: number;
  dcg_name: string;
}

interface DoctorRole {
  drl_code: number;
  drl_name: string;
}

interface Doctor {
  dct_code: number;
  dct_title: string;
  dct_name: string;
  dct_specialty: string;
  dct_dcg_code: number;
  dct_drl_code: number;
  dct_address: string;
  dct_telephone: string;
  dct_email: string;
  dct_share_percent: number;
  category?: DoctorCategory;
  role?: DoctorRole;
}

export default function DoctorsPage() {
  const [doctors, setDoctors] = useState<Doctor[]>([]);
  const [categories, setCategories] = useState<DoctorCategory[]>([]);
  const [roles, setRoles] = useState<DoctorRole[]>([]);
  const [searchTerm, setSearchTerm] = useState("");
  const [loading, setLoading] = useState(true);
  const [modalOpen, setModalOpen] = useState(false);
  const [error, setError] = useState("");
  const [successMsg, setSuccessMsg] = useState("");

  // Form states
  const [formData, setFormData] = useState({
    dct_title: "Dr.",
    dct_name: "",
    dct_specialty: "",
    dct_dcg_code: "",
    dct_drl_code: "",
    dct_address: "",
    dct_telephone: "",
    dct_email: "",
    dct_share_percent: "0.0"
  });

  const fetchDoctorData = async () => {
    try {
      const dRes = await fetch("http://127.0.0.1:8000/api/masters/doctors");
      const cRes = await fetch("http://127.0.0.1:8000/api/masters/doctor-categories");
      const rRes = await fetch("http://127.0.0.1:8000/api/masters/doctor-roles");
      
      if (dRes.ok) {
        const dData = await dRes.json();
        setDoctors(dData);
      }
      if (cRes.ok) {
        const cData = await cRes.json();
        setCategories(cData);
        if (cData.length > 0 && !formData.dct_dcg_code) {
          setFormData(prev => ({ ...prev, dct_dcg_code: String(cData[0].dcg_code) }));
        }
      }
      if (rRes.ok) {
        const rData = await rRes.json();
        setRoles(rData);
        if (rData.length > 0 && !formData.dct_drl_code) {
          setFormData(prev => ({ ...prev, dct_drl_code: String(rData[0].drl_code) }));
        }
      }
    } catch (e) {
      console.log("Error loading doctor directory:", e);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchDoctorData();
  }, []);

  const handleInputChange = (e: React.ChangeEvent<HTMLInputElement | HTMLSelectElement>) => {
    const { name, value } = e.target;
    setFormData(prev => ({ ...prev, [name]: value }));
  };

  const handleRegisterDoctor = async (e: React.FormEvent) => {
    e.preventDefault();
    setError("");
    setSuccessMsg("");

    if (!formData.dct_name) {
      setError("Doctor Name is required.");
      return;
    }

    try {
      const token = localStorage.getItem("token");
      const response = await fetch("http://127.0.0.1:8000/api/masters/doctors", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          "Authorization": `Bearer ${token}`
        },
        body: JSON.stringify({
          dct_title: formData.dct_title,
          dct_name: formData.dct_name,
          dct_specialty: formData.dct_specialty || "",
          dct_dcg_code: formData.dct_dcg_code ? Number(formData.dct_dcg_code) : null,
          dct_drl_code: formData.dct_drl_code ? Number(formData.dct_drl_code) : null,
          dct_address: formData.dct_address || "",
          dct_telephone: formData.dct_telephone || "",
          dct_email: formData.dct_email || "",
          dct_share_percent: Number(formData.dct_share_percent || 0.0)
        })
      });

      if (!response.ok) {
        const errData = await response.json();
        throw new Error(errData.detail || "Failed to register doctor");
      }

      setSuccessMsg("Doctor registered successfully!");
      // Reset form
      setFormData({
        dct_title: "Dr.",
        dct_name: "",
        dct_specialty: "",
        dct_dcg_code: categories.length > 0 ? String(categories[0].dcg_code) : "",
        dct_drl_code: roles.length > 0 ? String(roles[0].drl_code) : "",
        dct_address: "",
        dct_telephone: "",
        dct_email: "",
        dct_share_percent: "0.0"
      });

      await fetchDoctorData();
      
      setTimeout(() => {
        setModalOpen(false);
        setSuccessMsg("");
      }, 1500);

    } catch (err: any) {
      setError(err.message || "An error occurred");
    }
  };

  const filteredDoctors = doctors.filter(d => {
    const query = searchTerm.toLowerCase();
    return (
      d.dct_name.toLowerCase().includes(query) ||
      (d.dct_specialty && d.dct_specialty.toLowerCase().includes(query)) ||
      (d.dct_telephone && d.dct_telephone.includes(query))
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
            placeholder="Search by Name or Specialty..."
            value={searchTerm}
            onChange={(e) => setSearchTerm(e.target.value)}
          />
        </div>
        
        <button className={styles.primaryBtn} onClick={() => setModalOpen(true)}>
          <Plus size={18} />
          <span>Register Doctor</span>
        </button>
      </div>

      {/* Doctor Grid Table */}
      {loading ? (
        <p style={{ color: "var(--text-secondary)", fontSize: "14px" }}>Loading doctor directory...</p>
      ) : filteredDoctors.length === 0 ? (
        <div style={{ backgroundColor: "var(--bg-card)", border: "1px solid var(--border-light)", borderRadius: "16px", padding: "80px", textAlign: "center" }}>
          <UserRound size={48} style={{ color: "var(--text-muted)", marginBottom: "16px" }} />
          <h3 style={{ fontSize: "18px", marginBottom: "8px" }}>No Doctors Found</h3>
          <p style={{ color: "var(--text-secondary)", fontSize: "14px", marginBottom: "20px" }}>No matching records exist in the directory.</p>
          <button className={styles.secondaryBtn} style={{ margin: "0 auto" }} onClick={() => setSearchTerm("")}>Clear Filters</button>
        </div>
      ) : (
        <div className={styles.tableContainer}>
          <table className={styles.table}>
            <thead>
              <tr>
                <th>Code</th>
                <th>Name</th>
                <th>Specialty</th>
                <th>Category</th>
                <th>Role</th>
                <th>Telephone</th>
                <th>Email</th>
                <th>Share %</th>
              </tr>
            </thead>
            <tbody>
              {filteredDoctors.map((dct) => (
                <tr key={dct.dct_code}>
                  <td style={{ fontWeight: 600, color: "var(--accent-color)" }}>#{dct.dct_code}</td>
                  <td style={{ fontWeight: 600 }}>{dct.dct_title} {dct.dct_name}</td>
                  <td style={{ fontWeight: 500 }}>{dct.dct_specialty || "General Medicine"}</td>
                  <td>
                    <span className={`${styles.badge} ${styles.badgeAccent}`}>
                      {dct.category ? dct.category.dcg_name : "General"}
                    </span>
                  </td>
                  <td>
                    <span className={`${styles.badge} ${styles.badgeSuccess}`}>
                      {dct.role ? dct.role.drl_name : "Consultant"}
                    </span>
                  </td>
                  <td>{dct.dct_telephone || "--"}</td>
                  <td>{dct.dct_email || "--"}</td>
                  <td style={{ fontWeight: 600 }}>{dct.dct_share_percent}%</td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      )}

      {/* Register Doctor Modal */}
      {modalOpen && (
        <div className={styles.modalOverlay}>
          <div className={styles.modalContent}>
            <div className={styles.modalHeader}>
              <h3 style={{ fontSize: "20px", fontWeight: 600 }}>Doctor Registration Form</h3>
              <button className={styles.closeBtn} onClick={() => setModalOpen(false)}>×</button>
            </div>
            
            <form onSubmit={handleRegisterDoctor}>
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

                <div className={styles.formGrid}>
                  <div className={styles.formGroup} style={{ flex: "0 0 100px" }}>
                    <label htmlFor="dct_title">Title</label>
                    <select
                      className={styles.formControl}
                      id="dct_title"
                      name="dct_title"
                      value={formData.dct_title}
                      onChange={handleInputChange}
                    >
                      <option value="Dr.">Dr.</option>
                      <option value="Mr.">Mr.</option>
                      <option value="Ms.">Ms.</option>
                      <option value="Prof.">Prof.</option>
                    </select>
                  </div>

                  <div className={styles.formGroup} style={{ flex: "1" }}>
                    <label htmlFor="dct_name">Full Doctor Name *</label>
                    <input
                      className={styles.formControl}
                      id="dct_name"
                      name="dct_name"
                      type="text"
                      required
                      placeholder="Enter name, e.g. John Smith"
                      value={formData.dct_name}
                      onChange={handleInputChange}
                    />
                  </div>
                </div>

                <div className={styles.formGroup}>
                  <label htmlFor="dct_specialty">Medical Specialty</label>
                  <input
                    className={styles.formControl}
                    id="dct_specialty"
                    name="dct_specialty"
                    type="text"
                    placeholder="e.g. Cardiology, Pediatrics, Orthopedics"
                    value={formData.dct_specialty}
                    onChange={handleInputChange}
                  />
                </div>

                <div className={styles.formGrid}>
                  <div className={styles.formGroup}>
                    <label htmlFor="dct_dcg_code">Doctor Category</label>
                    <select
                      className={styles.formControl}
                      id="dct_dcg_code"
                      name="dct_dcg_code"
                      value={formData.dct_dcg_code}
                      onChange={handleInputChange}
                    >
                      {categories.map(cat => (
                        <option key={cat.dcg_code} value={cat.dcg_code}>
                          {cat.dcg_name}
                        </option>
                      ))}
                    </select>
                  </div>

                  <div className={styles.formGroup}>
                    <label htmlFor="dct_drl_code">Doctor Role</label>
                    <select
                      className={styles.formControl}
                      id="dct_drl_code"
                      name="dct_drl_code"
                      value={formData.dct_drl_code}
                      onChange={handleInputChange}
                    >
                      {roles.map(role => (
                        <option key={role.drl_code} value={role.drl_code}>
                          {role.drl_name}
                        </option>
                      ))}
                    </select>
                  </div>
                </div>

                <div className={styles.formGrid}>
                  <div className={styles.formGroup}>
                    <label htmlFor="dct_telephone">Telephone</label>
                    <input
                      className={styles.formControl}
                      id="dct_telephone"
                      name="dct_telephone"
                      type="text"
                      placeholder="e.g. 9876543210"
                      value={formData.dct_telephone}
                      onChange={handleInputChange}
                    />
                  </div>

                  <div className={styles.formGroup}>
                    <label htmlFor="dct_email">Email Address</label>
                    <input
                      className={styles.formControl}
                      id="dct_email"
                      name="dct_email"
                      type="email"
                      placeholder="e.g. doctor@hms.com"
                      value={formData.dct_email}
                      onChange={handleInputChange}
                    />
                  </div>
                </div>

                <div className={styles.formGrid}>
                  <div className={styles.formGroup}>
                    <label htmlFor="dct_share_percent">Share / Commission %</label>
                    <input
                      className={styles.formControl}
                      id="dct_share_percent"
                      name="dct_share_percent"
                      type="number"
                      step="0.1"
                      placeholder="e.g. 10.0"
                      value={formData.dct_share_percent}
                      onChange={handleInputChange}
                    />
                  </div>

                  <div className={styles.formGroup}>
                    <label htmlFor="dct_address">Clinic/Home Address</label>
                    <input
                      className={styles.formControl}
                      id="dct_address"
                      name="dct_address"
                      placeholder="Enter address details"
                      value={formData.dct_address}
                      onChange={handleInputChange}
                    />
                  </div>
                </div>
              </div>
              
              <div className={styles.modalFooter}>
                <button type="button" className={styles.secondaryBtn} onClick={() => setModalOpen(false)}>Cancel</button>
                <button type="submit" className={styles.primaryBtn}>Save Doctor</button>
              </div>
            </form>
          </div>
        </div>
      )}
    </div>
  );
}
