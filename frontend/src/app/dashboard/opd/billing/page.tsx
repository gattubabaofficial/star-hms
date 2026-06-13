"use client";

import React, { useEffect, useState } from "react";
import styles from "../../../dashboard.module.css";
import { Layers, CreditCard, Search, ArrowUpRight } from "lucide-react";

interface OPDBill {
  bill_id: number;
  bill_no: string;
  total_amount: number;
  discount_amount: number;
  net_amount: number;
  paid_amount: number;
  status: string;
  created_at: string;
}

interface OPDRegistration {
  opg_code: number;
  patient?: { ptt_name: string };
  bills: OPDBill[];
}

export default function OPDBillingConsolePage() {
  const [bills, setBills] = useState<OPDBill[]>([]);
  const [loading, setLoading] = useState(true);
  const [stats, setStats] = useState({
    totalBilled: 0,
    totalCollected: 0,
    totalOutstanding: 0
  });

  useEffect(() => {
    const fetchBills = async () => {
      try {
        const response = await fetch("http://127.0.0.1:8000/api/opd/registrations");
        if (response.ok) {
          const regs: OPDRegistration[] = await response.json();
          const allBills: OPDBill[] = [];
          let billed = 0;
          let collected = 0;

          regs.forEach(r => {
            if (r.bills && r.bills.length > 0) {
              const b = r.bills[0];
              // Attach patient name for rendering convenience
              (b as any).patientName = r.patient?.ptt_name || "Unknown";
              allBills.push(b);
              billed += b.net_amount;
              collected += b.paid_amount;
            }
          });

          setBills(allBills);
          setStats({
            totalBilled: billed,
            totalCollected: collected,
            totalOutstanding: billed - collected
          });
        }
      } catch (e) {
        console.log("Error loading billing console data:", e);
      } finally {
        setLoading(false);
      }
    };
    fetchBills();
  }, []);

  return (
    <div>
      {/* Mini stats dashboard */}
      <div className={styles.statsGrid} style={{ marginBottom: "24px" }}>
        <div className={styles.card}>
          <div className={styles.cardInfo}>
            <span className={styles.cardLabel}>Total Net Billed</span>
            <strong className={styles.cardValue}>₹{stats.totalBilled.toLocaleString("en-IN")}</strong>
          </div>
          <div className={styles.cardIcon} style={{ backgroundColor: "#eff6ff", color: "var(--accent-color)" }}>
            <Layers size={22} />
          </div>
        </div>

        <div className={styles.card}>
          <div className={styles.cardInfo}>
            <span className={styles.cardLabel}>Total Collections</span>
            <strong className={styles.cardValue} style={{ color: "var(--status-success)" }}>₹{stats.totalCollected.toLocaleString("en-IN")}</strong>
          </div>
          <div className={styles.cardIcon} style={{ backgroundColor: "#ecfdf5", color: "var(--status-success)" }}>
            <CreditCard size={22} />
          </div>
        </div>

        <div className={styles.card}>
          <div className={styles.cardInfo}>
            <span className={styles.cardLabel}>Outstanding Balance</span>
            <strong className={styles.cardValue} style={{ color: "var(--status-danger)" }}>₹{stats.totalOutstanding.toLocaleString("en-IN")}</strong>
          </div>
          <div className={styles.cardIcon} style={{ backgroundColor: "#fef2f2", color: "var(--status-danger)" }}>
            <ArrowUpRight size={22} />
          </div>
        </div>
      </div>

      <h3 style={{ fontSize: "16px", fontWeight: 600, marginBottom: "16px" }}>OPD Invoice Summary Ledger</h3>

      {loading ? (
        <p style={{ color: "var(--text-secondary)", fontSize: "14px" }}>Loading billing ledger...</p>
      ) : bills.length === 0 ? (
        <div style={{ backgroundColor: "var(--bg-card)", border: "1px solid var(--border-light)", borderRadius: "16px", padding: "40px", textAlign: "center" }}>
          <p style={{ color: "var(--text-secondary)", fontSize: "13px" }}>No billing records are present today.</p>
        </div>
      ) : (
        <div className={styles.tableContainer}>
          <table className={styles.table}>
            <thead>
              <tr>
                <th>Invoice No</th>
                <th>Patient Name</th>
                <th>Total Charges</th>
                <th>Discount</th>
                <th>Net Total</th>
                <th>Collected</th>
                <th>Payment State</th>
              </tr>
            </thead>
            <tbody>
              {bills.map((b) => (
                <tr key={b.bill_id}>
                  <td style={{ fontWeight: 600, color: "var(--accent-color)" }}>{b.bill_no}</td>
                  <td style={{ fontWeight: 600 }}>{(b as any).patientName}</td>
                  <td>₹{b.total_amount}</td>
                  <td style={{ color: "var(--status-success)" }}>-₹{b.discount_amount}</td>
                  <td style={{ fontWeight: 600 }}>₹{b.net_amount}</td>
                  <td style={{ fontWeight: 600, color: "var(--accent-color)" }}>₹{b.paid_amount}</td>
                  <td>
                    <span className={`${styles.badge} ${
                      b.status === "paid" ? styles.badgeSuccess :
                      b.status === "partial" ? styles.badgeWarning : styles.badgeDanger
                    }`}>
                      {b.status}
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
