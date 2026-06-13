"use client";

import React, { useEffect, useState } from "react";
import Link from "next/link";
import styles from "../../dashboard.module.css";
import { 
  Stethoscope, FileText, Receipt, CreditCard, RotateCcw, 
  ChevronRight, CalendarDays, Users2, Activity
} from "lucide-react";

export default function OPDPortalHubPage() {
  const [stats, setStats] = useState({
    todayVisits: 0,
    billedAmount: 0,
    collectedAmount: 0
  });
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const fetchOPDStats = async () => {
      try {
        const response = await fetch("http://127.0.0.1:8000/api/opd/registrations");
        if (response.ok) {
          const data = await response.json();
          let billed = 0;
          let collected = 0;
          data.forEach((r: any) => {
            if (r.bills && r.bills.length > 0) {
              billed += r.bills[0].net_amount;
              collected += r.bills[0].paid_amount;
            }
          });

          setStats({
            todayVisits: data.length,
            billedAmount: billed,
            collectedAmount: collected
          });
        }
      } catch (e) {
        console.log("Error loading stats:", e);
      } finally {
        setLoading(false);
      }
    };
    fetchOPDStats();
  }, []);

  const opdFeatures = [
    { name: "Consultation Registration", desc: "Register patient consultations & assign doctors.", href: "/dashboard/opd/registration", icon: Stethoscope, color: "#2563eb", bg: "#eff6ff" },
    { name: "Receipt Logs", desc: "Search and print patient consultation receipts.", href: "/dashboard/opd/receipt", icon: Receipt, color: "#10b981", bg: "#ecfdf5" },
    { name: "Billing Console", desc: "Itemized billing registers and revenue graphs.", href: "/dashboard/opd/billing", icon: FileText, color: "#f59e0b", bg: "#fefbeb" },
    { name: "Payment Ledger", desc: "View transactional breakdown (Cash, Card, UPI).", href: "/dashboard/opd/payment", icon: CreditCard, color: "#8b5cf6", bg: "#f5f3ff" },
    { name: "Refund Log", desc: "Process refunds for cancelled consultations.", href: "/dashboard/opd/refund", icon: RotateCcw, color: "#ef4444", bg: "#fef2f2" },
  ];

  return (
    <div style={{ display: "flex", flexDirection: "column", gap: "24px" }}>
      {/* Dynamic Summary Cards */}
      <div className={styles.statsGrid}>
        <div className={styles.card}>
          <div className={styles.cardInfo}>
            <span className={styles.cardLabel}>Today's Visits</span>
            <strong className={styles.cardValue}>{loading ? "..." : stats.todayVisits}</strong>
          </div>
          <div className={styles.cardIcon} style={{ backgroundColor: "#eff6ff", color: "#2563eb" }}>
            <CalendarDays size={22} />
          </div>
        </div>

        <div className={styles.card}>
          <div className={styles.cardInfo}>
            <span className={styles.cardLabel}>Consultation Billings</span>
            <strong className={styles.cardValue}>₹{loading ? "..." : stats.billedAmount.toLocaleString("en-IN")}</strong>
          </div>
          <div className={styles.cardIcon} style={{ backgroundColor: "#fefbeb", color: "#d97706" }}>
            <Activity size={22} />
          </div>
        </div>

        <div className={styles.card}>
          <div className={styles.cardInfo}>
            <span className={styles.cardLabel}>Today's Collections</span>
            <strong className={styles.cardValue} style={{ color: "var(--status-success)" }}>
              ₹{loading ? "..." : stats.collectedAmount.toLocaleString("en-IN")}
            </strong>
          </div>
          <div className={styles.cardIcon} style={{ backgroundColor: "#ecfdf5", color: "#10b981" }}>
            <Users2 size={22} />
          </div>
        </div>
      </div>

      <div style={{ 
        backgroundColor: "var(--accent-light)", 
        borderRadius: "16px", 
        padding: "24px", 
        border: "1px solid rgba(37, 99, 235, 0.1)",
        display: "flex",
        alignItems: "center",
        justifyContent: "space-between"
      }}>
        <div>
          <h2 style={{ fontSize: "20px", color: "var(--accent-color)", marginBottom: "4px" }}>Out-Patient Department (OPD) Portal</h2>
          <p style={{ color: "var(--text-secondary)", fontSize: "13px" }}>
            Track and process out-patient consults, diagnostic prescriptions, receipt logs, and payment settlements.
          </p>
        </div>
      </div>

      <div style={{ 
        display: "grid", 
        gridTemplateColumns: "repeat(auto-fill, minmax(280px, 1fr))", 
        gap: "20px" 
      }}>
        {opdFeatures.map((item) => {
          const Icon = item.icon;
          return (
            <Link 
              key={item.name} 
              href={item.href}
              style={{
                display: "flex",
                alignItems: "center",
                justifyContent: "space-between",
                backgroundColor: "var(--bg-card)",
                border: "1px solid var(--border-light)",
                borderRadius: "12px",
                padding: "20px",
                boxShadow: "0 2px 4px rgba(0,0,0,0.01)",
                transition: "all 0.2s ease",
                cursor: "pointer"
              }}
              className={styles.navLinkHover}
            >
              <div style={{ display: "flex", alignItems: "center", gap: "16px" }}>
                <div style={{ 
                  width: "44px", 
                  height: "44px", 
                  borderRadius: "10px", 
                  color: item.color, 
                  backgroundColor: item.bg,
                  display: "flex",
                  alignItems: "center",
                  justifyContent: "center"
                }}>
                  <Icon size={20} />
                </div>
                <div style={{ display: "flex", flexDirection: "column", gap: "2px" }}>
                  <strong style={{ fontSize: "14px", color: "var(--text-primary)" }}>{item.name}</strong>
                  <span style={{ fontSize: "11px", color: "var(--text-secondary)", lineHeight: "1.3", maxWidth: "180px" }}>{item.desc}</span>
                </div>
              </div>
              <ChevronRight size={16} style={{ color: "var(--text-muted)" }} />
            </Link>
          );
        })}
      </div>
    </div>
  );
}
