"use client";

import React, { useEffect, useState } from "react";
import styles from "../../dashboard.module.css";
import { FileBarChart2, Printer, Search, Calendar, ChevronRight, HelpCircle } from "lucide-react";

interface CollectionLog {
  id: number;
  date: string;
  type: "OPD" | "IPD" | "LAB";
  patient_name: string;
  amount: number;
  payment_method: string;
}

export default function ReportsPage() {
  const [loading, setLoading] = useState(true);
  const [logs, setLogs] = useState<CollectionLog[]>([
    { id: 1, date: "2026-06-11T10:00:00", type: "OPD", patient_name: "Amit Kumar", amount: 500.0, payment_method: "Cash" },
    { id: 2, date: "2026-06-11T10:30:00", type: "LAB", patient_name: "Amit Kumar", amount: 350.0, payment_method: "UPI" },
    { id: 3, date: "2026-06-11T11:15:00", type: "IPD", patient_name: "Ramesh Meena", amount: 5000.0, payment_method: "Card" },
    { id: 4, date: "2026-06-11T12:00:00", type: "OPD", patient_name: "Jane Doe", amount: 500.0, payment_method: "Cash" },
  ]);

  useEffect(() => {
    const timer = setTimeout(() => setLoading(false), 300);
    return () => clearTimeout(timer);
  }, []);

  const totalAmount = logs.reduce((sum, item) => sum + item.amount, 0);

  return (
    <div style={{ display: "flex", flexDirection: "column", gap: "32px" }}>
      {/* Metrics Row */}
      <div className={styles.statsGrid}>
        <div className={styles.card}>
          <div className={styles.cardInfo}>
            <span className={styles.cardLabel}>OPD Collection</span>
            <span className={styles.cardValue}>₹1,000.00</span>
          </div>
          <div className={styles.cardIcon} style={{ color: "var(--accent-color)", backgroundColor: "var(--accent-light)" }}>
            <FileBarChart2 size={24} />
          </div>
        </div>

        <div className={styles.card}>
          <div className={styles.cardInfo}>
            <span className={styles.cardLabel}>IPD Collection</span>
            <span className={styles.cardValue}>₹5,000.00</span>
          </div>
          <div className={styles.cardIcon} style={{ color: "var(--status-warning)", backgroundColor: "var(--status-warning-light)" }}>
            <FileBarChart2 size={24} />
          </div>
        </div>

        <div className={styles.card}>
          <div className={styles.cardInfo}>
            <span className={styles.cardLabel}>Total Collection</span>
            <span className={styles.cardValue}>₹{totalAmount.toLocaleString('en-IN', { minimumFractionDigits: 2 })}</span>
          </div>
          <div className={styles.cardIcon} style={{ color: "var(--status-success)", backgroundColor: "var(--status-success-light)" }}>
            <FileBarChart2 size={24} />
          </div>
        </div>
      </div>

      {/* Detail Table */}
      <div className={styles.sectionBox}>
        <div className={styles.sectionHeader}>
          <h3 className={styles.sectionTitle}>Daily Transaction Log</h3>
          <button className={styles.secondaryBtn} onClick={() => window.print()} style={{ gap: "6px" }}>
            <Printer size={16} /> Print Register
          </button>
        </div>

        {loading ? (
          <p style={{ color: "var(--text-secondary)", fontSize: "14px" }}>Loading daily registers...</p>
        ) : (
          <div className={styles.tableContainer}>
            <table className={styles.table}>
              <thead>
                <tr>
                  <th>Trans ID</th>
                  <th>Timestamp</th>
                  <th>Module</th>
                  <th>Patient Name</th>
                  <th>Payment Method</th>
                  <th>Collected Amount</th>
                </tr>
              </thead>
              <tbody>
                {logs.map((item) => (
                  <tr key={item.id}>
                    <td style={{ fontWeight: 600, color: "var(--accent-color)" }}>#TX-{item.id}</td>
                    <td>{new Date(item.date).toLocaleString()}</td>
                    <td>
                      <span className={`${styles.badge} ${
                        item.type === "OPD" ? styles.badgeAccent :
                        item.type === "IPD" ? styles.badgeWarning : styles.badgeSuccess
                      }`}>
                        {item.type}
                      </span>
                    </td>
                    <td style={{ fontWeight: 600 }}>{item.patient_name}</td>
                    <td>{item.payment_method}</td>
                    <td style={{ fontWeight: 700 }}>₹{item.amount.toFixed(2)}</td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        )}
      </div>
    </div>
  );
}
