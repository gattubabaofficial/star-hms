"use client";

import React, { useEffect, useState } from "react";
import Link from "next/link";
import styles from "../../dashboard.module.css";
import { 
  FlaskConical, Receipt, CreditCard, RotateCcw, ChevronRight, 
  Activity, ClipboardList, TrendingUp
} from "lucide-react";

export default function LaboratoryPortalHubPage() {
  const [stats, setStats] = useState({
    totalReceipts: 0,
    billedAmt: 0,
    collectedAmt: 0
  });
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const fetchLabStats = async () => {
      try {
        const response = await fetch("http://127.0.0.1:8000/api/lab/registrations");
        if (response.ok) {
          const data = await response.json();
          let billed = 0;
          let collected = 0;
          data.forEach((r: any) => {
            billed += r.LhdTotalAmt;
            collected += r.LhdRecvdAmt;
          });

          setStats({
            totalReceipts: data.length,
            billedAmt: billed,
            collectedAmt: collected
          });
        }
      } catch (e) {
        console.log("Error loading lab stats:", e);
      } finally {
        setLoading(false);
      }
    };
    fetchLabStats();
  }, []);

  const labFeatures = [
    { name: "Receipt & Billing", desc: "Register diagnostic investigations & issue patient bills.", href: "/dashboard/laboratory/receipt", icon: Receipt, color: "#2563eb", bg: "#eff6ff" },
    { name: "Collections Tracker", desc: "Collect pending laboratory transaction balances.", href: "/dashboard/laboratory/payment", icon: CreditCard, color: "#10b981", bg: "#ecfdf5" },
    { name: "Refund Console", desc: "Refund cancelled medical diagnostic test vouchers.", href: "/dashboard/laboratory/refund", icon: RotateCcw, color: "#ef4444", bg: "#fef2f2" },
  ];

  return (
    <div style={{ display: "flex", flexDirection: "column", gap: "24px" }}>
      {/* Real-time stats widgets */}
      <div className={styles.statsGrid}>
        <div className={styles.card}>
          <div className={styles.cardInfo}>
            <span className={styles.cardLabel}>Diagnostic Bills Today</span>
            <strong className={styles.cardValue}>{loading ? "..." : stats.totalReceipts}</strong>
          </div>
          <div className={styles.cardIcon} style={{ backgroundColor: "#eff6ff", color: "#2563eb" }}>
            <ClipboardList size={22} />
          </div>
        </div>

        <div className={styles.card}>
          <div className={styles.cardInfo}>
            <span className={styles.cardLabel}>Gross Lab Billing</span>
            <strong className={styles.cardValue}>₹{loading ? "..." : stats.billedAmt.toLocaleString("en-IN")}</strong>
          </div>
          <div className={styles.cardIcon} style={{ backgroundColor: "#fefbeb", color: "#d97706" }}>
            <TrendingUp size={22} />
          </div>
        </div>

        <div className={styles.card}>
          <div className={styles.cardInfo}>
            <span className={styles.cardLabel}>Gross Collections</span>
            <strong className={styles.cardValue} style={{ color: "var(--status-success)" }}>
              ₹{loading ? "..." : stats.collectedAmt.toLocaleString("en-IN")}
            </strong>
          </div>
          <div className={styles.cardIcon} style={{ backgroundColor: "#ecfdf5", color: "#10b981" }}>
            <Activity size={22} />
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
          <h2 style={{ fontSize: "20px", color: "var(--accent-color)", marginBottom: "4px" }}>Laboratory & Diagnostics Hub</h2>
          <p style={{ color: "var(--text-secondary)", fontSize: "13px" }}>
            Register diagnostic pathology investigations, track billing invoice collections, and manage patient refunds.
          </p>
        </div>
      </div>

      <div style={{ 
        display: "grid", 
        gridTemplateColumns: "repeat(auto-fill, minmax(280px, 1fr))", 
        gap: "20px" 
      }}>
        {labFeatures.map((item) => {
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
