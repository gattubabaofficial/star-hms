"use client";

import React, { useEffect, useState } from "react";
import styles from "../../../dashboard.module.css";
import { Plus, UserRound, Search, AlertCircle, Check } from "lucide-react";

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
  dct_title?: string;
  dct_name: string;
  dct_specialty?: string;
  dct_dcg_code?: number;
  dct_drl_code?: number;
  dct_address?: string;
  dct_telephone?: string;
  dct_email?: string;
  dct_share_percent: number;
  category?: DoctorCategory;
  role?: DoctorRole;
}

export default function DoctorMasterPage() {
  const [doctors, setDoctors] = useState<Doctor[]>([]);
  const [categories, setCategories] = useState<DoctorCategory[]>([]);
  const [roles, setRoles] = useState<DoctorRole[]>([]);
  
  const [loading, setLoading] = useState(true);
  const [searchTerm, setSearchTerm] = useState("");
  const [modalOpen, setModalOpen] = useState(false);
  
  // Form state
  const [formData, setFormData] = useState({
    dct_title: "Dr.",
    dct_name: "",
    dct_specialty: "",
    dct_dcg_code: "",
    dct_drl_code: "",
    dct_address: "",
    dct_telephone: "",
    dct_email: "",
    dct_share_percent: "0"
  });

  const [error, setError] = useState("");
  const [success, setSuccess] = useState("");

  const fetchData = async () => {
    try {
      const docRes = await fetch("http://127.0.0.1:8000/api/masters/doctors");
      const catRes = await fetch("http://127.0.0.1:8000/api/masters/doctor-categories");
      const roleRes = await fetch("http://127.0.0.1:8000/api/masters/doctor-roles");
      
      if (docRes.ok) setDoctors(await docRes.json());
      if (catRes.ok) {
        const catData = await catRes.json();
        setCategories(catData);
        if (catData.length > 0) {
          setFormData(prev => ({ ...prev, dct_dcg_code: String(catData[0].dcg_code) }));
        }
      }
      if (roleRes.ok) {
        const roleData = await roleRes.json();
        setRoles(roleData);
        if (roleData.length > 0) {
          setFormData(prev => ({ ...prev, dct_drl_code: String(roleData[0].drl_code) }));
        }
      }
    } catch (e) {
      console.log("Error loading doctor master data:", e);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchData();
  }, []);

  const handleInputChange = (e: React.ChangeEvent<HTMLInputElement | HTMLSelectElement | HTMLTextAreaElement>) => {
    const { name, value } = e.target;
    setFormData(prev => ({ ...prev, [name]: value }));
  };

  const handleAddDoctor = async (e: React.FormEvent) => {
    e.preventDefault();
    setError("");
    setSuccess("");

    if (!formData.dct_name.trim()) {
      setError("Doctor name is required");
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
          dct_specialty: formData.dct_specialty || null,
          dct_dcg_code: formData.dct_dcg_code ? Number(formData.dct_dcg_code) : null,
          dct_drl_code: formData.dct_drl_code ? Number(formData.dct_drl_code) : null,
          dct_address: formData.dct_address || null,
          dct_telephone: formData.dct_telephone || null,
          dct_email: formData.dct_email || null,
          dct_share_percent: Number(formData.dct_share_percent || 0)
        })
      });

      if (response.ok) {
        setSuccess("Doctor details saved successfully!");
        setFormData({
          dct_title: "Dr.",
          dct_name: "",
          dct_specialty: "",
          dct_dcg_code: categories[0]?.dcg_code ? String(categories[0].dcg_code) : "",
          dct_drl_code: roles[0]?.drl_code ? String(roles[0].drl_code) : "",
          dct_address: "",
          dct_telephone: "",
          dct_email: "",
          dct_share_percent: "0"
        });
        await fetchData();
        setTimeout(() => {
          setModalOpen(false);
          setSuccess("");
        }, 1200);
      } else {
        const errData = await response.json();
        setError(errData.detail || "Failed to add doctor record");
      }
    } catch (err) {
      setError("Network error occurred");
    }
  };

  const filteredDoctors = doctors.filter(doc => 
    doc.dct_name.toLowerCase().includes(searchTerm.toLowerCase()) ||
    (doc.dct_specialty && doc.dct_specialty.toLowerCase().includes(searchTerm.toLowerCase()))
  );

  return (
    <div>
      <div className={styles.toolbar}>
        <div className={styles.searchBar}>
          <Search size={18} style={{ color: "var(--text-muted)" }} />
          <input
            type="text"
            placeholder="Search doctors by name or specialty..."
            value={searchTerm}
            onChange={(e) => setSearchTerm(e.target.value)}
          />
        </div>
        <button className={styles.primaryBtn} onClick={() => setModalOpen(true)}>
          <Plus size={18} />
          <span>Add Doctor</span>
        </button>
      </div>

      {loading ? (
        <p style={{ color: "var(--text-secondary)", fontSize: "14px" }}>Loading doctor directory...</p>
      ) : filteredDoctors.length === 0 ? (
        <div style={{ backgroundColor: "var(--bg-card)", border: "1px solid var(--border-light)", borderRadius: "16px", padding: "80px", textAlign: "center" }}>
          <UserRound size={48} style={{ color: "var(--text-muted)", marginBottom: "16px" }} />
          <h3 style={{ fontSize: "18px", marginBottom: "8px" }}>No Doctor Records</h3>
          <p style={{ color: "var(--text-secondary)", fontSize: "14px", marginBottom: "20px" }}>No doctors found matching the query.</p>
          <button className={styles.primaryBtn} style={{ margin: "0 auto" }} onClick={() => setModalOpen(true)}>Add Doctor Record</button>
        </div>
      ) : (
        <div className={styles.tableContainer}>
          <table className={styles.table}>
            <thead>
              <tr>
                <th>Title & Name</th>
                <th>Specialty</th>
                <th>Category</th>
                <th>Role</th>
                <th>Telephone</th>
                <th>Share %</th>
              </tr>
            </thead>
            <tbody>
              {filteredDoctors.map((doc) => (
                <tr key={doc.dct_code}>
                  <td style={{ fontWeight: 600 }}>
                    <span style={{ color: "var(--accent-color)" }}>{doc.dct_title || "Dr."}</span> {doc.dct_name}
                  </td>
                  <td>{doc.dct_specialty || "General Medicine"}</td>
                  <td>{doc.category ? doc.category.dcg_name : "-"}</td>
                  <td>{doc.role ? doc.role.drl_name : "-"}</td>
                  <td>{doc.dct_telephone || "-"}</td>
                  <td style={{ fontWeight: 600 }}>{doc.dct_share_percent}%</td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      )}

      {modalOpen && (
        <div className={styles.modalOverlay}>
          <div className={styles.modalContent} style={{ maxWidth: "600px" }}>
            <div className={styles.modalHeader}>
              <h3 style={{ fontSize: "18px", fontWeight: 600 }}>Register New Doctor</h3>
              <button className={styles.closeBtn} onClick={() => setModalOpen(false)}>×</button>
            </div>
            <form onSubmit={handleAddDoctor}>
              <div className={styles.modalBody}>
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

                <div className={styles.formGrid}>
                  <div className={styles.formGroup}>
                    <label htmlFor="dct_title">Title *</label>
                    <select
                      id="dct_title"
                      name="dct_title"
                      className={styles.formControl}
                      value={formData.dct_title}
                      onChange={handleInputChange}
                    >
                      <option value="Dr.">Dr.</option>
                      <option value="Prof.">Prof.</option>
                      <option value="Mr.">Mr.</option>
                      <option value="Mrs.">Mrs.</option>
                      <option value="Ms.">Ms.</option>
                    </select>
                  </div>

                  <div className={styles.formGroup}>
                    <label htmlFor="dct_name">Doctor Name *</label>
                    <input
                      id="dct_name"
                      name="dct_name"
                      type="text"
                      className={styles.formControl}
                      value={formData.dct_name}
                      onChange={handleInputChange}
                      required
                    />
                  </div>
                </div>

                <div className={styles.formGrid}>
                  <div className={styles.formGroup}>
                    <label htmlFor="dct_specialty">Specialty / Dept</label>
                    <input
                      id="dct_specialty"
                      name="dct_specialty"
                      type="text"
                      className={styles.formControl}
                      value={formData.dct_specialty}
                      onChange={handleInputChange}
                      placeholder="e.g. Cardiology, Orthopedics"
                    />
                  </div>

                  <div className={styles.formGroup}>
                    <label htmlFor="dct_share_percent">Hospital Share %</label>
                    <input
                      id="dct_share_percent"
                      name="dct_share_percent"
                      type="number"
                      className={styles.formControl}
                      value={formData.dct_share_percent}
                      onChange={handleInputChange}
                    />
                  </div>
                </div>

                <div className={styles.formGrid}>
                  <div className={styles.formGroup}>
                    <label htmlFor="dct_dcg_code">Doctor Category *</label>
                    <select
                      id="dct_dcg_code"
                      name="dct_dcg_code"
                      className={styles.formControl}
                      value={formData.dct_dcg_code}
                      onChange={handleInputChange}
                    >
                      {categories.map(c => (
                        <option key={c.dcg_code} value={c.dcg_code}>{c.dcg_name}</option>
                      ))}
                    </select>
                  </div>

                  <div className={styles.formGroup}>
                    <label htmlFor="dct_drl_code">Doctor Role *</label>
                    <select
                      id="dct_drl_code"
                      name="dct_drl_code"
                      className={styles.formControl}
                      value={formData.dct_drl_code}
                      onChange={handleInputChange}
                    >
                      {roles.map(r => (
                        <option key={r.drl_code} value={r.drl_code}>{r.drl_name}</option>
                      ))}
                    </select>
                  </div>
                </div>

                <div className={styles.formGrid}>
                  <div className={styles.formGroup}>
                    <label htmlFor="dct_telephone">Telephone</label>
                    <input
                      id="dct_telephone"
                      name="dct_telephone"
                      type="text"
                      className={styles.formControl}
                      value={formData.dct_telephone}
                      onChange={handleInputChange}
                    />
                  </div>

                  <div className={styles.formGroup}>
                    <label htmlFor="dct_email">Email Address</label>
                    <input
                      id="dct_email"
                      name="dct_email"
                      type="email"
                      className={styles.formControl}
                      value={formData.dct_email}
                      onChange={handleInputChange}
                    />
                  </div>
                </div>

                <div className={styles.formGroup}>
                  <label htmlFor="dct_address">Residential Address</label>
                  <textarea
                    id="dct_address"
                    name="dct_address"
                    rows={2}
                    className={styles.formControl}
                    value={formData.dct_address}
                    onChange={handleInputChange}
                    style={{ resize: "vertical" }}
                  />
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
