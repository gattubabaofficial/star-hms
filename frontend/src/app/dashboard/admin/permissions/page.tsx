"use client";

import React, { useState } from "react";
import styles from "../../../dashboard.module.css";
import { Check, ShieldAlert, Key } from "lucide-react";

interface RolePermission {
  module: string;
  admin: boolean;
  doctor: boolean;
  pharmacist: boolean;
  laboratory: boolean;
}

export default function AdminPermissionsPage() {
  const [permissions, setPermissions] = useState<RolePermission[]>([
    { module: "Dashboard Widgets view", admin: true, doctor: true, pharmacist: true, laboratory: true },
    { module: "OPD Patient Visit Registration", admin: true, doctor: true, pharmacist: false, laboratory: false },
    { module: "Consultation billing & Invoice", admin: true, doctor: false, pharmacist: false, laboratory: false },
    { module: "IPD Admission & Bed Allocation", admin: true, doctor: true, pharmacist: false, laboratory: false },
    { module: "IPD Discharge Wizard & Settlement", admin: true, doctor: false, pharmacist: false, laboratory: false },
    { module: "Laboratory receipts & tests entry", admin: true, doctor: false, pharmacist: false, laboratory: true },
    { module: "Pharmacy POS counters & billing", admin: true, doctor: false, pharmacist: true, laboratory: false },
    { module: "General accounts & double entries", admin: true, doctor: false, pharmacist: false, laboratory: false },
    { module: "Users Registry & DB Backup", admin: true, doctor: false, pharmacist: false, laboratory: false },
  ]);

  const togglePermission = (idx: number, role: "admin" | "doctor" | "pharmacist" | "laboratory") => {
    if (role === "admin") return; // Admin is strictly true

    setPermissions(prev => prev.map((p, i) => {
      if (i === idx) {
        return {
          ...p,
          [role]: !p[role]
        };
      }
      return p;
    }));
  };

  return (
    <div>
      <div className={styles.toolbar} style={{ justifyContent: "flex-end" }}>
        <div style={{ display: "flex", alignItems: "center", gap: "8px", fontSize: "13px", color: "var(--text-secondary)" }}>
          <Key size={15} style={{ color: "var(--accent-color)" }} />
          <span>Click checkboxes to toggle permissions (Admin role is locked)</span>
        </div>
      </div>

      <div className={styles.tableContainer}>
        <table className={styles.table}>
          <thead>
            <tr>
              <th>Clinical / Admin Module Scope</th>
              <th style={{ textAlign: "center" }}>Sys Admin</th>
              <th style={{ textAlign: "center" }}>Doctor</th>
              <th style={{ textAlign: "center" }}>Pharmacist</th>
              <th style={{ textAlign: "center" }}>Lab Tech</th>
            </tr>
          </thead>
          <tbody>
            {permissions.map((p, idx) => (
              <tr key={idx}>
                <td style={{ fontWeight: 600 }}>{p.module}</td>
                <td style={{ textAlign: "center" }}>
                  <input
                    type="checkbox"
                    checked={p.admin}
                    readOnly
                    style={{ transform: "scale(1.2)", cursor: "not-allowed" }}
                  />
                </td>
                <td style={{ textAlign: "center" }}>
                  <input
                    type="checkbox"
                    checked={p.doctor}
                    onChange={() => togglePermission(idx, "doctor")}
                    style={{ transform: "scale(1.2)", cursor: "pointer" }}
                  />
                </td>
                <td style={{ textAlign: "center" }}>
                  <input
                    type="checkbox"
                    checked={p.pharmacist}
                    onChange={() => togglePermission(idx, "pharmacist")}
                    style={{ transform: "scale(1.2)", cursor: "pointer" }}
                  />
                </td>
                <td style={{ textAlign: "center" }}>
                  <input
                    type="checkbox"
                    checked={p.laboratory}
                    onChange={() => togglePermission(idx, "laboratory")}
                    style={{ transform: "scale(1.2)", cursor: "pointer" }}
                  />
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </div>
  );
}
