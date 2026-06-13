"use client";

import React, { useEffect, useState } from "react";
import styles from "../../../dashboard.module.css";
import { Plus, Building, AlertCircle, Check } from "lucide-react";

interface Floor {
  flr_code: number;
  flr_name: string;
}

export default function FloorMasterPage() {
  const [floors, setFloors] = useState<Floor[]>([]);
  const [loading, setLoading] = useState(true);
  const [modalOpen, setModalOpen] = useState(false);
  const [floorName, setFloorName] = useState("");
  const [error, setError] = useState("");
  const [success, setSuccess] = useState("");

  const fetchFloors = async () => {
    try {
      const response = await fetch("http://127.0.0.1:8000/api/masters/floors");
      if (response.ok) {
        setFloors(await response.json());
      }
    } catch (e) {
      console.log("Error loading floors:", e);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchFloors();
  }, []);

  const handleAddFloor = async (e: React.FormEvent) => {
    e.preventDefault();
    setError("");
    setSuccess("");

    if (!floorName.trim()) {
      setError("Floor name is required");
      return;
    }

    try {
      const token = localStorage.getItem("token");
      const response = await fetch("http://127.0.0.1:8000/api/masters/floors", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          "Authorization": `Bearer ${token}`
        },
        body: JSON.stringify({ flr_name: floorName })
      });

      if (response.ok) {
        setSuccess("Floor added successfully!");
        setFloorName("");
        await fetchFloors();
        setTimeout(() => {
          setModalOpen(false);
          setSuccess("");
        }, 1200);
      } else {
        const data = await response.json();
        setError(data.detail || "Failed to add floor");
      }
    } catch (err) {
      setError("Network error occurred");
    }
  };

  return (
    <div>
      <div className={styles.toolbar} style={{ justifyContent: "space-between" }}>
        <h3 style={{ fontSize: "18px", fontWeight: 600 }}>Hospital Floors Directory</h3>
        <button className={styles.primaryBtn} onClick={() => setModalOpen(true)}>
          <Plus size={18} />
          <span>Add Hospital Floor</span>
        </button>
      </div>

      {loading ? (
        <p style={{ color: "var(--text-secondary)", fontSize: "14px" }}>Loading floors...</p>
      ) : (
        <div className={styles.tableContainer} style={{ maxWidth: "600px" }}>
          <table className={styles.table}>
            <thead>
              <tr>
                <th>Code</th>
                <th>Floor Name</th>
              </tr>
            </thead>
            <tbody>
              {floors.map((floor) => (
                <tr key={floor.flr_code}>
                  <td style={{ fontWeight: 600, color: "var(--accent-color)" }}>#{floor.flr_code}</td>
                  <td style={{ fontWeight: 600 }}>{floor.flr_name}</td>
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
              <h3 style={{ fontSize: "18px", fontWeight: 600 }}>Add Hospital Floor</h3>
              <button className={styles.closeBtn} onClick={() => setModalOpen(false)}>×</button>
            </div>
            <form onSubmit={handleAddFloor}>
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
                  <label htmlFor="floorName">Floor Name *</label>
                  <input
                    id="floorName"
                    type="text"
                    className={styles.formControl}
                    value={floorName}
                    onChange={(e) => setFloorName(e.target.value)}
                    placeholder="e.g. Ground Floor, First Floor"
                    required
                  />
                </div>
              </div>
              <div className={styles.modalFooter}>
                <button type="button" className={styles.secondaryBtn} onClick={() => setModalOpen(false)}>Cancel</button>
                <button type="submit" className={styles.primaryBtn}>Save Floor</button>
              </div>
            </form>
          </div>
        </div>
      )}
    </div>
  );
}
