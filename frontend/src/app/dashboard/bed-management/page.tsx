"use client";

import React, { useEffect, useState } from "react";
import styles from "../../dashboard.module.css";
import { Plus, Building, Bed, ArrowRight, DoorOpen } from "lucide-react";

interface Floor {
  flr_code: number;
  flr_name: string;
}

interface Ward {
  wrd_code: number;
  wrd_name: string;
  wrd_flr_code?: number;
  floor?: {
    flr_name: string;
  };
}

export default function BedManagementPage() {
  const [activeTab, setActiveTab] = useState<"floors" | "wards">("floors");
  const [loading, setLoading] = useState(true);
  const [floors, setFloors] = useState<Floor[]>([]);
  const [wards, setWards] = useState<Ward[]>([]);

  const fetchData = async () => {
    try {
      const fRes = await fetch("http://127.0.0.1:8000/api/masters/floors");
      const wRes = await fetch("http://127.0.0.1:8000/api/masters/wards");
      if (fRes.ok) setFloors(await fRes.json());
      if (wRes.ok) setWards(await wRes.json());
    } catch (e) {
      console.log("Error loading bed master lists:", e);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchData();
  }, []);

  return (
    <div>
      {/* Sub tabs */}
      <div style={{ display: "flex", gap: "12px", marginBottom: "24px" }}>
        <button 
          className={activeTab === "floors" ? styles.primaryBtn : styles.secondaryBtn} 
          onClick={() => setActiveTab("floors")}
          style={{ gap: "8px" }}
        >
          <Building size={16} /> Hospital Floors Setup
        </button>
        <button 
          className={activeTab === "wards" ? styles.primaryBtn : styles.secondaryBtn} 
          onClick={() => setActiveTab("wards")}
          style={{ gap: "8px" }}
        >
          <DoorOpen size={16} /> Ward Allocator Config
        </button>
      </div>

      {/* Toolbar */}
      <div className={styles.toolbar} style={{ justifyContent: "flex-end" }}>
        <button className={styles.primaryBtn}>
          <Plus size={18} />
          <span>Add Location</span>
        </button>
      </div>

      {/* Grid Layouts */}
      {loading ? (
        <p style={{ color: "var(--text-secondary)", fontSize: "14px" }}>Loading structure logs...</p>
      ) : activeTab === "floors" ? (
        <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fill, minmax(280px, 1fr))", gap: "24px" }}>
          {floors.map(flr => (
            <div key={flr.flr_code} className={styles.card} style={{ justifyContent: "flex-start", gap: "16px" }}>
              <div className={styles.cardIcon} style={{ color: "var(--accent-color)", backgroundColor: "var(--accent-light)" }}>
                <Building size={20} />
              </div>
              <div style={{ display: "flex", flexDirection: "column", gap: "4px" }}>
                <span style={{ fontSize: "12px", color: "var(--text-secondary)", fontWeight: 600 }}>FLOOR CODE #{flr.flr_code}</span>
                <strong style={{ fontSize: "16px" }}>{flr.flr_name}</strong>
              </div>
            </div>
          ))}
        </div>
      ) : (
        <div className={styles.tableContainer} style={{ maxWidth: "800px" }}>
          <table className={styles.table}>
            <thead>
              <tr>
                <th>Ward Code</th>
                <th>Ward Description</th>
                <th>Assigned Floor</th>
              </tr>
            </thead>
            <tbody>
              {wards.map((wrd) => (
                <tr key={wrd.wrd_code}>
                  <td style={{ fontWeight: 600, color: "var(--accent-color)" }}>#{wrd.wrd_code}</td>
                  <td style={{ fontWeight: 600 }}>{wrd.wrd_name}</td>
                  <td>
                    <span className={`${styles.badge} ${styles.badgeAccent}`}>
                      {wrd.floor ? wrd.floor.flr_name : "General Sector"}
                    </span>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      )}
    </div>
  );
}
