"use client";

import React, { useEffect, useState } from "react";
import styles from "../../../dashboard.module.css";
import { Plus, DoorOpen, AlertCircle, Check } from "lucide-react";

interface Floor {
  flr_code: number;
  flr_name: string;
}

interface Ward {
  wrd_code: number;
  wrd_name: string;
  wrd_flr_code?: number;
  floor?: Floor;
}

export default function WardMasterPage() {
  const [wards, setWards] = useState<Ward[]>([]);
  const [floors, setFloors] = useState<Floor[]>([]);
  const [loading, setLoading] = useState(true);
  const [modalOpen, setModalOpen] = useState(false);
  
  const [formData, setFormData] = useState({
    wrd_name: "",
    wrd_flr_code: ""
  });

  const [error, setError] = useState("");
  const [success, setSuccess] = useState("");

  const fetchData = async () => {
    try {
      const wardRes = await fetch("http://127.0.0.1:8000/api/masters/wards");
      const floorRes = await fetch("http://127.0.0.1:8000/api/masters/floors");
      
      if (wardRes.ok) setWards(await wardRes.json());
      if (floorRes.ok) {
        const floorData = await floorRes.json();
        setFloors(floorData);
        if (floorData.length > 0) {
          setFormData(prev => ({ ...prev, wrd_flr_code: String(floorData[0].flr_code) }));
        }
      }
    } catch (e) {
      console.log("Error loading ward master data:", e);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchData();
  }, []);

  const handleInputChange = (e: React.ChangeEvent<HTMLInputElement | HTMLSelectElement>) => {
    const { name, value } = e.target;
    setFormData(prev => ({ ...prev, [name]: value }));
  };

  const handleAddWard = async (e: React.FormEvent) => {
    e.preventDefault();
    setError("");
    setSuccess("");

    if (!formData.wrd_name.trim()) {
      setError("Ward name is required");
      return;
    }

    try {
      const token = localStorage.getItem("token");
      const response = await fetch("http://127.0.0.1:8000/api/masters/wards", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          "Authorization": `Bearer ${token}`
        },
        body: JSON.stringify({
          wrd_name: formData.wrd_name,
          wrd_flr_code: Number(formData.wrd_flr_code)
        })
      });

      if (response.ok) {
        setSuccess("Ward added successfully!");
        setFormData(prev => ({ ...prev, wrd_name: "" }));
        await fetchData();
        setTimeout(() => {
          setModalOpen(false);
          setSuccess("");
        }, 1200);
      } else {
        const errData = await response.json();
        setError(errData.detail || "Failed to add ward");
      }
    } catch (err) {
      setError("Network error occurred");
    }
  };

  return (
    <div>
      <div className={styles.toolbar} style={{ justifyContent: "space-between" }}>
        <h3 style={{ fontSize: "18px", fontWeight: 600 }}>Clinical Wards Directory</h3>
        <button className={styles.primaryBtn} onClick={() => setModalOpen(true)}>
          <Plus size={18} />
          <span>Add Clinical Ward</span>
        </button>
      </div>

      {loading ? (
        <p style={{ color: "var(--text-secondary)", fontSize: "14px" }}>Loading ward directory...</p>
      ) : (
        <div className={styles.tableContainer} style={{ maxWidth: "600px" }}>
          <table className={styles.table}>
            <thead>
              <tr>
                <th>Code</th>
                <th>Ward Name</th>
                <th>Floor Location</th>
              </tr>
            </thead>
            <tbody>
              {wards.map((ward) => (
                <tr key={ward.wrd_code}>
                  <td style={{ fontWeight: 600, color: "var(--accent-color)" }}>#{ward.wrd_code}</td>
                  <td style={{ fontWeight: 600 }}>{ward.wrd_name}</td>
                  <td>{ward.floor ? ward.floor.flr_name : "-"}</td>
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
              <h3 style={{ fontSize: "18px", fontWeight: 600 }}>Add Clinical Ward</h3>
              <button className={styles.closeBtn} onClick={() => setModalOpen(false)}>×</button>
            </div>
            <form onSubmit={handleAddWard}>
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
                  <label htmlFor="wrd_name">Ward Name *</label>
                  <input
                    id="wrd_name"
                    name="wrd_name"
                    type="text"
                    className={styles.formControl}
                    value={formData.wrd_name}
                    onChange={handleInputChange}
                    placeholder="e.g. ICU, General Ward A, Pediatric Ward"
                    required
                  />
                </div>

                <div className={styles.formGroup}>
                  <label htmlFor="wrd_flr_code">Floor Location *</label>
                  <select
                    id="wrd_flr_code"
                    name="wrd_flr_code"
                    className={styles.formControl}
                    value={formData.wrd_flr_code}
                    onChange={handleInputChange}
                  >
                    {floors.map(f => (
                      <option key={f.flr_code} value={f.flr_code}>{f.flr_name}</option>
                    ))}
                  </select>
                </div>
              </div>
              <div className={styles.modalFooter}>
                <button type="button" className={styles.secondaryBtn} onClick={() => setModalOpen(false)}>Cancel</button>
                <button type="submit" className={styles.primaryBtn}>Save Ward</button>
              </div>
            </form>
          </div>
        </div>
      )}
    </div>
  );
}
