"use client";

import React, { useState } from "react";
import styles from "../../../dashboard.module.css";
import { Database, Plus, Search, Calendar, RefreshCw } from "lucide-react";

interface BackupRecord {
  filename: string;
  size: string;
  created_at: string;
  trigger_mode: "Manual" | "Scheduled";
  status: "Successful" | "Corrupt" | "Running";
}

export default function AdminBackupPage() {
  const [backups, setBackups] = useState<BackupRecord[]>([
    { filename: "hms_prod_v26_20260611_0400.sql", size: "128.4 MB", created_at: "2026-06-11 04:00", trigger_mode: "Scheduled", status: "Successful" },
    { filename: "hms_prod_v26_20260610_0400.sql", size: "128.1 MB", created_at: "2026-06-10 04:00", trigger_mode: "Scheduled", status: "Successful" },
    { filename: "hms_before_migration_reconstruction.sql", size: "126.9 MB", created_at: "2026-06-09 17:15", trigger_mode: "Manual", status: "Successful" }
  ]);

  const [loading, setLoading] = useState(false);

  const handleCreateBackup = () => {
    setLoading(true);
    setTimeout(() => {
      const newBackup: BackupRecord = {
        filename: `hms_prod_manual_${Date.now()}.sql`,
        size: "128.5 MB",
        created_at: new Date().toISOString().replace("T", " ").substring(0, 16),
        trigger_mode: "Manual",
        status: "Successful"
      };
      setBackups(prev => [newBackup, ...prev]);
      setLoading(false);
    }, 1500);
  };

  return (
    <div>
      <div className={styles.toolbar} style={{ justifyContent: "space-between" }}>
        <div style={{ display: "flex", alignItems: "center", gap: "10px" }}>
          <Database size={18} style={{ color: "var(--accent-color)" }} />
          <span style={{ fontSize: "14px", fontWeight: 600 }}>Active Database Server: PostgreSQL Localhost</span>
        </div>
        
        <button className={styles.primaryBtn} onClick={handleCreateBackup} disabled={loading}>
          <RefreshCw size={16} className={loading ? "animate-spin" : ""} />
          <span>{loading ? "Generating Dump..." : "Backup Database Now"}</span>
        </button>
      </div>

      <div className={styles.tableContainer}>
        <table className={styles.table}>
          <thead>
            <tr>
              <th>Backup File Name</th>
              <th>File Size</th>
              <th>Creation Timestamp</th>
              <th>Trigger Mode</th>
              <th>Status</th>
            </tr>
          </thead>
          <tbody>
            {backups.map((b, idx) => (
              <tr key={idx}>
                <td style={{ fontWeight: 600, color: "var(--text-primary)" }}>{b.filename}</td>
                <td>{b.size}</td>
                <td>{b.created_at}</td>
                <td>{b.trigger_mode}</td>
                <td>
                  <span className={`${styles.badge} ${styles.badgeSuccess}`}>
                    {b.status}
                  </span>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </div>
  );
}
