"use client";

import React, { useEffect, useState } from "react";
import styles from "../../../dashboard.module.css";
import { Bed as BedIcon } from "lucide-react";

interface Floor {
  flr_code: number;
  flr_name: string;
}

interface Ward {
  wrd_code: number;
  wrd_name: string;
  wrd_flr_code: number;
}

interface Bed {
  bdm_code: number;
  bdm_name: string;
  bdm_wrd_code: number;
  is_occupied: boolean;
}

export default function BedStatusGridPage() {
  const [floors, setFloors] = useState<Floor[]>([]);
  const [wards, setWards] = useState<Ward[]>([]);
  const [beds, setBeds] = useState<Bed[]>([]);
  const [loading, setLoading] = useState(true);

  const fetchData = async () => {
    try {
      const fRes = await fetch("http://127.0.0.1:8000/api/masters/floors");
      const wRes = await fetch("http://127.0.0.1:8000/api/masters/wards");
      const bRes = await fetch("http://127.0.0.1:8000/api/masters/beds");
      
      if (fRes.ok) setFloors(await fRes.json());
      if (wRes.ok) setWards(await wRes.json());
      if (bRes.ok) setBeds(await bRes.json());
    } catch (e) {
      console.log("Error loading bed occupancy data:", e);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchData();
  }, []);

  if (loading) {
    return <p style={{ color: "var(--text-secondary)", fontSize: "14px" }}>Loading occupancy status...</p>;
  }

  return (
    <div>
      <div className={styles.sectionBox}>
        <div className={styles.sectionHeader}>
          <h3 className={styles.sectionTitle}>Interactive Bed Occupancy Grid</h3>
          <div style={{ display: "flex", gap: "16px", fontSize: "12px", fontWeight: 600 }}>
            <span style={{ display: "flex", alignItems: "center", gap: "6px", color: "var(--status-success)" }}>
              <span style={{ width: "12px", height: "12px", borderRadius: "3px", backgroundColor: "var(--status-success)" }} /> Available
            </span>
            <span style={{ display: "flex", alignItems: "center", gap: "6px", color: "var(--status-danger)" }}>
              <span style={{ width: "12px", height: "12px", borderRadius: "3px", backgroundColor: "var(--status-danger)" }} /> Occupied
            </span>
          </div>
        </div>

        {floors.map(floor => {
          const floorWards = wards.filter(w => w.wrd_flr_code === floor.flr_code);
          return (
            <div key={floor.flr_code} style={{ marginBottom: "24px" }}>
              <h4 style={{ fontSize: "15px", color: "var(--accent-color)", borderBottom: "1px solid var(--border-light)", paddingBottom: "6px", marginBottom: "16px" }}>
                {floor.flr_name}
              </h4>
              
              <div style={{ display: "flex", flexDirection: "column", gap: "16px" }}>
                {floorWards.map(ward => {
                  const wardBeds = beds.filter(b => b.bdm_wrd_code === ward.wrd_code);
                  return (
                    <div key={ward.wrd_code} style={{ backgroundColor: "var(--bg-secondary)", padding: "16px", borderRadius: "12px", display: "flex", flexDirection: "column", gap: "12px" }}>
                      <span style={{ fontSize: "13px", fontWeight: 600, color: "var(--text-secondary)" }}>{ward.wrd_name}</span>
                      
                      <div style={{ display: "flex", flexWrap: "wrap", gap: "12px" }}>
                        {wardBeds.map(bed => (
                          <div
                            key={bed.bdm_code}
                            style={{
                              display: "flex",
                              flexDirection: "column",
                              alignItems: "center",
                              justifyContent: "center",
                              gap: "6px",
                              width: "90px",
                              height: "80px",
                              borderRadius: "10px",
                              border: "1px solid",
                              backgroundColor: "#fff",
                              borderColor: bed.is_occupied ? "rgba(239,68,68,0.2)" : "rgba(16,185,129,0.2)",
                              boxShadow: "0 2px 4px rgba(0,0,0,0.02)"
                            }}
                          >
                            <BedIcon size={20} style={{ color: bed.is_occupied ? "var(--status-danger)" : "var(--status-success)" }} />
                            <span style={{ fontSize: "12px", fontWeight: 600, color: "var(--text-primary)" }}>{bed.bdm_name}</span>
                          </div>
                        ))}
                        {wardBeds.length === 0 && <span style={{ fontSize: "12px", color: "var(--text-muted)", fontStyle: "italic" }}>No beds configured.</span>}
                      </div>
                    </div>
                  );
                })}
              </div>
            </div>
          );
        })}
      </div>
    </div>
  );
}
