"use client";

import React, { useState } from "react";
import styles from "../../../dashboard.module.css";
import { Plus, User, AlertCircle, Check } from "lucide-react";

interface SystemUser {
  id: number;
  username: string;
  email: string;
  full_name: string;
  role: string;
  is_active: boolean;
}

export default function AdminUsersPage() {
  const [users, setUsers] = useState<SystemUser[]>([
    { id: 1, username: "admin", email: "admin@starhospital.com", full_name: "Lead Administrator", role: "admin", is_active: true },
    { id: 2, username: "dr_sharma", email: "sharma@starhospital.com", full_name: "Dr. A. K. Sharma", role: "doctor", is_active: true },
    { id: 3, username: "pharmacy_user", email: "dispensary@starhospital.com", full_name: "Senior Pharmacist", role: "pharmacist", is_active: true }
  ]);

  const [modalOpen, setModalOpen] = useState(false);
  
  const [formData, setFormData] = useState({
    username: "",
    full_name: "",
    email: "",
    role: "admin",
    password: ""
  });

  const [error, setError] = useState("");
  const [success, setSuccess] = useState("");

  const handleInputChange = (e: React.ChangeEvent<HTMLInputElement | HTMLSelectElement>) => {
    const { name, value } = e.target;
    setFormData(prev => ({ ...prev, [name]: value }));
  };

  const handleAddUser = async (e: React.FormEvent) => {
    e.preventDefault();
    setError("");
    setSuccess("");

    if (!formData.username.trim() || !formData.email.trim()) {
      setError("Username and email are required");
      return;
    }

    try {
      const response = await fetch("http://127.0.0.1:8000/api/auth/register", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          username: formData.username,
          email: formData.email,
          password: formData.password || "Password@123",
          full_name: formData.full_name,
          role: formData.role
        })
      });

      if (response.ok) {
        setSuccess("User created successfully on the database!");
        setUsers(prev => [
          ...prev,
          {
            id: prev.length + 1,
            username: formData.username,
            email: formData.email,
            full_name: formData.full_name,
            role: formData.role,
            is_active: true
          }
        ]);
        setFormData({ username: "", full_name: "", email: "", role: "admin", password: "" });
        setTimeout(() => {
          setModalOpen(false);
          setSuccess("");
        }, 1200);
      } else {
        const err = await response.json();
        setError(err.detail || "Failed to register user");
      }
    } catch (err) {
      setError("Network connection error");
    }
  };

  return (
    <div>
      <div className={styles.toolbar} style={{ justifyContent: "space-between" }}>
        <h3 style={{ fontSize: "16px", fontWeight: 600 }}>System Operators Registry</h3>
        <button className={styles.primaryBtn} onClick={() => setModalOpen(true)}>
          <Plus size={18} />
          <span>Register User</span>
        </button>
      </div>

      <div className={styles.tableContainer}>
        <table className={styles.table}>
          <thead>
            <tr>
              <th>User ID</th>
              <th>Username</th>
              <th>Full Name</th>
              <th>Email Address</th>
              <th>Assigned Role</th>
              <th>Account State</th>
            </tr>
          </thead>
          <tbody>
            {users.map((u) => (
              <tr key={u.id}>
                <td style={{ fontWeight: 600, color: "var(--accent-color)" }}>#{u.id}</td>
                <td style={{ fontWeight: 700 }}>{u.username}</td>
                <td>{u.full_name}</td>
                <td>{u.email}</td>
                <td>
                  <span className={`${styles.badge} ${styles.badgeAccent}`}>
                    {u.role}
                  </span>
                </td>
                <td>
                  <span className={`${styles.badge} ${u.is_active ? styles.badgeSuccess : styles.badgeDanger}`}>
                    {u.is_active ? "Active" : "Disabled"}
                  </span>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>

      {modalOpen && (
        <div className={styles.modalOverlay}>
          <div className={styles.modalContent} style={{ maxWidth: "480px" }}>
            <div className={styles.modalHeader}>
              <h3 style={{ fontSize: "18px", fontWeight: 600 }}>Register System Operator</h3>
              <button className={styles.closeBtn} onClick={() => setModalOpen(false)}>×</button>
            </div>
            <form onSubmit={handleAddUser}>
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
                  <label>Username (Internal login) *</label>
                  <input
                    type="text"
                    name="username"
                    className={styles.formControl}
                    value={formData.username}
                    onChange={handleInputChange}
                    placeholder="e.g. jsmith"
                    required
                  />
                </div>

                <div className={styles.formGroup}>
                  <label>Full Name *</label>
                  <input
                    type="text"
                    name="full_name"
                    className={styles.formControl}
                    value={formData.full_name}
                    onChange={handleInputChange}
                    placeholder="e.g. John Smith"
                    required
                  />
                </div>

                <div className={styles.formGroup}>
                  <label>Email Address *</label>
                  <input
                    type="email"
                    name="email"
                    className={styles.formControl}
                    value={formData.email}
                    onChange={handleInputChange}
                    placeholder="e.g. smith@starhospital.com"
                    required
                  />
                </div>

                <div className={styles.formGrid}>
                  <div className={styles.formGroup}>
                    <label>Role Assignment</label>
                    <select
                      name="role"
                      className={styles.formControl}
                      value={formData.role}
                      onChange={handleInputChange}
                    >
                      <option value="admin">System Admin</option>
                      <option value="doctor">Consulting Doctor</option>
                      <option value="pharmacist">Pharmacist</option>
                      <option value="laboratory">Lab Tech</option>
                    </select>
                  </div>
                  <div className={styles.formGroup}>
                    <label>Password *</label>
                    <input
                      type="password"
                      name="password"
                      className={styles.formControl}
                      value={formData.password}
                      onChange={handleInputChange}
                      placeholder="Min 6 characters"
                      required
                    />
                  </div>
                </div>
              </div>
              <div className={styles.modalFooter}>
                <button type="button" className={styles.secondaryBtn} onClick={() => setModalOpen(false)}>Cancel</button>
                <button type="submit" className={styles.primaryBtn}>Save User</button>
              </div>
            </form>
          </div>
        </div>
      )}
    </div>
  );
}
