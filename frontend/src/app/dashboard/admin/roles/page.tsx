"use client";

import React, { useState } from "react";
import styles from "../../../dashboard.module.css";
import { Plus, Shield, Search } from "lucide-react";

interface RoleGroup {
  id: number;
  role_name: string;
  user_count: number;
  privilege_level: "High" | "Medium" | "Low";
  description: string;
}

export default function AdminRolesPage() {
  const [roles, setRoles] = useState<RoleGroup[]>([
    { id: 1, role_name: "System Administrator", user_count: 1, privilege_level: "High", description: "Full access to settings, databases, backups, security panel, and clinical hubs." },
    { id: 2, role_name: "Attending Doctor / Physician", user_count: 1, privilege_level: "Medium", description: "Access to OPD consultation, IPD admissions, and master registries read-only." },
    { id: 3, role_name: "Chief Pharmacist", user_count: 1, privilege_level: "Medium", description: "Access to POS counter, medicine inventories, and purchase register." },
    { id: 4, role_name: "Lab Diagnostics Technician", user_count: 0, privilege_level: "Medium", description: "Access to lab registration, receipt entries, and test logs." },
  ]);

  const [modalOpen, setModalOpen] = useState(false);
  const [formData, setFormData] = useState({
    role_name: "",
    privilege_level: "Medium" as "High" | "Medium" | "Low",
    description: ""
  });

  const handleAddRole = (e: React.FormEvent) => {
    e.preventDefault();
    if (!formData.role_name.trim()) return;

    setRoles(prev => [
      ...prev,
      {
        id: prev.length + 1,
        role_name: formData.role_name,
        user_count: 0,
        privilege_level: formData.privilege_level,
        description: formData.description || "Privilege group"
      }
    ]);
    setFormData({ role_name: "", privilege_level: "Medium", description: "" });
    setModalOpen(false);
  };

  return (
    <div>
      <div className={styles.toolbar} style={{ justifyContent: "space-between" }}>
        <h3 style={{ fontSize: "16px", fontWeight: 600 }}>Security privilege Groups</h3>
        <button className={styles.primaryBtn} onClick={() => setModalOpen(true)}>
          <Plus size={18} />
          <span>Add Role Group</span>
        </button>
      </div>

      <div className={styles.tableContainer}>
        <table className={styles.table}>
          <thead>
            <tr>
              <th>Role Group</th>
              <th>Description</th>
              <th>Active Users</th>
              <th>Privilege Clearance</th>
            </tr>
          </thead>
          <tbody>
            {roles.map((r) => (
              <tr key={r.id}>
                <td style={{ fontWeight: 700, color: "var(--accent-color)" }}>{r.role_name}</td>
                <td>{r.description}</td>
                <td style={{ fontWeight: 600 }}>{r.user_count} operators</td>
                <td>
                  <span className={`${styles.badge} ${
                    r.privilege_level === "High" ? styles.badgeDanger :
                    r.privilege_level === "Medium" ? styles.badgeWarning : styles.badgeSuccess
                  }`}>
                    {r.privilege_level}
                  </span>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>

      {modalOpen && (
        <div className={styles.modalOverlay}>
          <div className={styles.modalContent} style={{ maxWidth: "450px" }}>
            <div className={styles.modalHeader}>
              <h3 style={{ fontSize: "18px", fontWeight: 600 }}>Add Privilege Role Group</h3>
              <button className={styles.closeBtn} onClick={() => setModalOpen(false)}>×</button>
            </div>
            <form onSubmit={handleAddRole}>
              <div className={styles.modalBody}>
                <div className={styles.formGroup}>
                  <label>Role Group Name *</label>
                  <input
                    type="text"
                    className={styles.formControl}
                    value={formData.role_name}
                    onChange={(e) => setFormData(prev => ({ ...prev, role_name: e.target.value }))}
                    placeholder="e.g. Finance Auditor"
                    required
                  />
                </div>

                <div className={styles.formGroup}>
                  <label>Security Clearance Level</label>
                  <select
                    className={styles.formControl}
                    value={formData.privilege_level}
                    onChange={(e) => setFormData(prev => ({ ...prev, privilege_level: e.target.value as any }))}
                  >
                    <option value="Low">Low Clearance</option>
                    <option value="Medium">Medium Clearance</option>
                    <option value="High">High Clearance</option>
                  </select>
                </div>

                <div className={styles.formGroup}>
                  <label>Role Scope / Description *</label>
                  <textarea
                    rows={3}
                    className={styles.formControl}
                    value={formData.description}
                    onChange={(e) => setFormData(prev => ({ ...prev, description: e.target.value }))}
                    placeholder="Describe module boundaries..."
                    required
                  />
                </div>
              </div>
              <div className={styles.modalFooter}>
                <button type="button" className={styles.secondaryBtn} onClick={() => setModalOpen(false)}>Cancel</button>
                <button type="submit" className={styles.primaryBtn}>Save Role Group</button>
              </div>
            </form>
          </div>
        </div>
      )}
    </div>
  );
}
