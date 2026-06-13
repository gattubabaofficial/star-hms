"use client";

import React, { useEffect, useState } from "react";
import styles from "../../../dashboard.module.css";
import { Plus, Layers, AlertCircle, Check } from "lucide-react";

interface ServiceGroup {
  sgp_code: number;
  sgp_name: string;
}

export default function ServiceGroupPage() {
  const [groups, setGroups] = useState<ServiceGroup[]>([]);
  const [loading, setLoading] = useState(true);
  const [modalOpen, setModalOpen] = useState(false);
  const [groupName, setGroupName] = useState("");
  const [error, setError] = useState("");
  const [success, setSuccess] = useState("");

  const fetchGroups = async () => {
    try {
      const response = await fetch("http://127.0.0.1:8000/api/masters/service-groups");
      if (response.ok) {
        setGroups(await response.json());
      }
    } catch (e) {
      console.log("Error loading service groups:", e);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchGroups();
  }, []);

  const handleAddGroup = async (e: React.FormEvent) => {
    e.preventDefault();
    setError("");
    setSuccess("");

    if (!groupName.trim()) {
      setError("Group name is required");
      return;
    }

    try {
      const token = localStorage.getItem("token");
      const response = await fetch("http://127.0.0.1:8000/api/masters/service-groups", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          "Authorization": `Bearer ${token}`
        },
        body: JSON.stringify({ sgp_name: groupName })
      });

      if (response.ok) {
        setSuccess("Service group added successfully!");
        setGroupName("");
        await fetchGroups();
        setTimeout(() => {
          setModalOpen(false);
          setSuccess("");
        }, 1200);
      } else {
        const data = await response.json();
        setError(data.detail || "Failed to add service group");
      }
    } catch (err) {
      setError("Network error occurred");
    }
  };

  return (
    <div>
      <div className={styles.toolbar} style={{ justifyContent: "space-between" }}>
        <h3 style={{ fontSize: "18px", fontWeight: 600 }}>Clinical Service Groups</h3>
        <button className={styles.primaryBtn} onClick={() => setModalOpen(true)}>
          <Plus size={18} />
          <span>Add Service Group</span>
        </button>
      </div>

      {loading ? (
        <p style={{ color: "var(--text-secondary)", fontSize: "14px" }}>Loading service groups...</p>
      ) : (
        <div className={styles.tableContainer} style={{ maxWidth: "600px" }}>
          <table className={styles.table}>
            <thead>
              <tr>
                <th>Code</th>
                <th>Group Name</th>
              </tr>
            </thead>
            <tbody>
              {groups.map((group) => (
                <tr key={group.sgp_code}>
                  <td style={{ fontWeight: 600, color: "var(--accent-color)" }}>#{group.sgp_code}</td>
                  <td style={{ fontWeight: 600 }}>{group.sgp_name}</td>
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
              <h3 style={{ fontSize: "18px", fontWeight: 600 }}>Add Service Group</h3>
              <button className={styles.closeBtn} onClick={() => setModalOpen(false)}>×</button>
            </div>
            <form onSubmit={handleAddGroup}>
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
                  <label htmlFor="groupName">Group Name *</label>
                  <input
                    id="groupName"
                    type="text"
                    className={styles.formControl}
                    value={groupName}
                    onChange={(e) => setGroupName(e.target.value)}
                    placeholder="e.g. Consultations, General Lab, Cardiology Services"
                    required
                  />
                </div>
              </div>
              <div className={styles.modalFooter}>
                <button type="button" className={styles.secondaryBtn} onClick={() => setModalOpen(false)}>Cancel</button>
                <button type="submit" className={styles.primaryBtn}>Save Group</button>
              </div>
            </form>
          </div>
        </div>
      )}
    </div>
  );
}
