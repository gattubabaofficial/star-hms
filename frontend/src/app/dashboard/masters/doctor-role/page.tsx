"use client";

import React, { useEffect, useState } from "react";
import styles from "../../../dashboard.module.css";
import { Plus, Award, AlertCircle, Check } from "lucide-react";

interface DoctorRole {
  drl_code: number;
  drl_name: string;
}

export default function DoctorRolePage() {
  const [roles, setRoles] = useState<DoctorRole[]>([]);
  const [loading, setLoading] = useState(true);
  const [modalOpen, setModalOpen] = useState(false);
  const [roleName, setRoleName] = useState("");
  const [error, setError] = useState("");
  const [success, setSuccess] = useState("");

  const fetchRoles = async () => {
    try {
      const response = await fetch("http://127.0.0.1:8000/api/masters/doctor-roles");
      if (response.ok) {
        setRoles(await response.json());
      }
    } catch (e) {
      console.log("Error loading doctor roles:", e);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchRoles();
  }, []);

  const handleAddRole = async (e: React.FormEvent) => {
    e.preventDefault();
    setError("");
    setSuccess("");

    if (!roleName.trim()) {
      setError("Role name is required");
      return;
    }

    try {
      const token = localStorage.getItem("token");
      const response = await fetch("http://127.0.0.1:8000/api/masters/doctor-roles", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          "Authorization": `Bearer ${token}`
        },
        body: JSON.stringify({ drl_name: roleName })
      });

      if (response.ok) {
        setSuccess("Doctor role added successfully!");
        setRoleName("");
        await fetchRoles();
        setTimeout(() => {
          setModalOpen(false);
          setSuccess("");
        }, 1200);
      } else {
        const data = await response.json();
        setError(data.detail || "Failed to add doctor role");
      }
    } catch (err) {
      setError("Network error occurred");
    }
  };

  return (
    <div>
      <div className={styles.toolbar} style={{ justifyContent: "space-between" }}>
        <h3 style={{ fontSize: "18px", fontWeight: 600 }}>Doctor Roles Configuration</h3>
        <button className={styles.primaryBtn} onClick={() => setModalOpen(true)}>
          <Plus size={18} />
          <span>Add Doctor Role</span>
        </button>
      </div>

      {loading ? (
        <p style={{ color: "var(--text-secondary)", fontSize: "14px" }}>Loading doctor roles...</p>
      ) : (
        <div className={styles.tableContainer} style={{ maxWidth: "600px" }}>
          <table className={styles.table}>
            <thead>
              <tr>
                <th>Code</th>
                <th>Role Name</th>
              </tr>
            </thead>
            <tbody>
              {roles.map((role) => (
                <tr key={role.drl_code}>
                  <td style={{ fontWeight: 600, color: "var(--accent-color)" }}>#{role.drl_code}</td>
                  <td style={{ fontWeight: 600 }}>{role.drl_name}</td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      )}

      {modalOpen && (
        <div className={styles.modalOverlay}>
          <div className={styles.modalContent} style={{ maxWidth: "450px" }}>
            <div className={styles.modalHeader}>
              <h3 style={{ fontSize: "18px", fontWeight: 600 }}>Add Doctor Role</h3>
              <button className={styles.closeBtn} onClick={() => setModalOpen(false)}>×</button>
            </div>
            <form onSubmit={handleAddRole}>
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
                <div className={styles.formGroup}>
                  <label htmlFor="roleName">Role Name *</label>
                  <input
                    id="roleName"
                    type="text"
                    className={styles.formControl}
                    value={roleName}
                    onChange={(e) => setRoleName(e.target.value)}
                    placeholder="e.g. Consultant Surgeon, Resident Officer"
                    required
                  />
                </div>
              </div>
              <div className={styles.modalFooter}>
                <button type="button" className={styles.secondaryBtn} onClick={() => setModalOpen(false)}>Cancel</button>
                <button type="submit" className={styles.primaryBtn}>Save Role</button>
              </div>
            </form>
          </div>
        </div>
      )}
    </div>
  );
}
