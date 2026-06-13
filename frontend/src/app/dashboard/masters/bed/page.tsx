"use client";

import React, { useEffect, useState } from "react";
import styles from "../../../dashboard.module.css";
import { Plus, Bed, AlertCircle, Check } from "lucide-react";

interface Floor {
  flr_code: number;
  flr_name: string;
}

interface Ward {
  wrd_code: number;
  wrd_name: string;
  floor?: Floor;
}

interface BedRecord {
  bdm_code: number;
  bdm_name: string;
  bdm_wrd_code: number;
  is_occupied: boolean;
  ward?: Ward;
}

export default function BedMasterPage() {
  const [beds, setBeds] = useState<BedRecord[]>([]);
  const [wards, setWards] = useState<Ward[]>([]);
  const [loading, setLoading] = useState(true);
  const [modalOpen, setModalOpen] = useState(false);
  
  const [formData, setFormData] = useState({
    bdm_name: "",
    bdm_wrd_code: ""
  });

  const [error, setError] = useState("");
  const [success, setSuccess] = useState("");

  const fetchData = async () => {
    try {
      const bedRes = await fetch("http://127.0.0.1:8000/api/masters/beds");
      const wardRes = await fetch("http://127.0.0.1:8000/api/masters/wards");
      
      if (bedRes.ok) setBeds(await bedRes.json());
      if (wardRes.ok) {
        const wardData = await wardRes.json();
        setWards(wardData);
        if (wardData.length > 0) {
          setFormData(prev => ({ ...prev, bdm_wrd_code: String(wardData[0].wrd_code) }));
        }
      }
    } catch (e) {
      console.log("Error loading bed master data:", e);
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

  const handleAddBed = async (e: React.FormEvent) => {
    e.preventDefault();
    setError("");
    setSuccess("");

    if (!formData.bdm_name.trim()) {
      setError("Bed name/number is required");
      return;
    }

    try {
      const token = localStorage.getItem("token");
      const response = await fetch("http://127.0.0.1:8000/api/masters/beds", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          "Authorization": `Bearer ${token}`
        },
        body: JSON.stringify({
          bdm_name: formData.bdm_name,
          bdm_wrd_code: Number(formData.bdm_wrd_code),
          is_occupied: false
        })
      });

      if (response.ok) {
        setSuccess("Bed added successfully!");
        setFormData(prev => ({ ...prev, bdm_name: "" }));
        await fetchData();
        setTimeout(() => {
          setModalOpen(false);
          setSuccess("");
        }, 1200);
      } else {
        const errData = await response.json();
        setError(errData.detail || "Failed to add bed record");
      }
    } catch (err) {
      setError("Network error occurred");
    }
  };

  return (
    <div>
      <div className={styles.toolbar} style={{ justifyContent: "space-between" }}>
        <h3 style={{ fontSize: "18px", fontWeight: 600 }}>Hospital Beds Mapping</h3>
        <button className={styles.primaryBtn} onClick={() => setModalOpen(true)}>
          <Plus size={18} />
          <span>Configure Bed</span>
        </button>
      </div>

      {loading ? (
        <p style={{ color: "var(--text-secondary)", fontSize: "14px" }}>Loading beds mapping...</p>
      ) : (
        <div className={styles.tableContainer} style={{ maxWidth: "800px" }}>
          <table className={styles.table}>
            <thead>
              <tr>
                <th>Bed Code</th>
                <th>Bed Label</th>
                <th>Ward Location</th>
                <th>Floor</th>
                <th>Occupancy Status</th>
              </tr>
            </thead>
            <tbody>
              {beds.map((bed) => (
                <tr key={bed.bdm_code}>
                  <td style={{ fontWeight: 600, color: "var(--accent-color)" }}>#BD-{bed.bdm_code}</td>
                  <td style={{ fontWeight: 600 }}>{bed.bdm_name}</td>
                  <td>{bed.ward ? bed.ward.wrd_name : "-"}</td>
                  <td>{bed.ward?.floor ? bed.ward.floor.flr_name : "-"}</td>
                  <td>
                    <span className={`${styles.badge} ${bed.is_occupied ? styles.badgeDanger : styles.badgeSuccess}`}>
                      {bed.is_occupied ? "Occupied" : "Available"}
                    </span>
                  </td>
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
              <h3 style={{ fontSize: "18px", fontWeight: 600 }}>Configure Hospital Bed</h3>
              <button className={styles.closeBtn} onClick={() => setModalOpen(false)}>×</button>
            </div>
            <form onSubmit={handleAddBed}>
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
                  <label htmlFor="bdm_name">Bed Identifier / Label *</label>
                  <input
                    id="bdm_name"
                    name="bdm_name"
                    type="text"
                    className={styles.formControl}
                    value={formData.bdm_name}
                    onChange={handleInputChange}
                    placeholder="e.g. Bed-101, ICU-B4"
                    required
                  />
                </div>

                <div className={styles.formGroup}>
                  <label htmlFor="bdm_wrd_code">Ward Assignment *</label>
                  <select
                    id="bdm_wrd_code"
                    name="bdm_wrd_code"
                    className={styles.formControl}
                    value={formData.bdm_wrd_code}
                    onChange={handleInputChange}
                  >
                    {wards.map(w => (
                      <option key={w.wrd_code} value={w.wrd_code}>
                        {w.wrd_name} {w.floor ? `[${w.floor.flr_name}]` : ""}
                      </option>
                    ))}
                  </select>
                </div>
              </div>
              <div className={styles.modalFooter}>
                <button type="button" className={styles.secondaryBtn} onClick={() => setModalOpen(false)}>Cancel</button>
                <button type="submit" className={styles.primaryBtn}>Save Bed</button>
              </div>
            </form>
          </div>
        </div>
      )}
    </div>
  );
}
