"use client";

import React, { useEffect, useState } from "react";
import Link from "next/link";
import styles from "../../dashboard.module.css";
import { 
  Bed, DoorOpen, LayoutGrid, Receipt, PiggyBank, CreditCard, 
  RotateCcw, LogOut, ChevronRight, CheckSquare, Layers
} from "lucide-react";

export default function IPDPortalHubPage() {
  const [stats, setStats] = useState({
    activeAdmissions: 0,
    totalBeds: 0,
    occupiedBeds: 0
  });
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const fetchIPDStats = async () => {
      try {
        const admRes = await fetch("http://127.0.0.1:8000/api/ipd/admissions");
        const bedRes = await fetch("http://127.0.0.1:8000/api/masters/beds");
        
        let activeAdms = 0;
        let totBeds = 0;
        let occBeds = 0;

        if (admRes.ok) {
          const admissions = await admRes.json();
          activeAdms = admissions.filter((a: any) => a.ipd_status === "admitted").length;
        }
        if (bedRes.ok) {
          const beds = await bedRes.json();
          totBeds = beds.length;
          occBeds = beds.filter((b: any) => b.is_occupied).length;
        }

        setStats({
          activeAdmissions: activeAdms,
          totalBeds: totBeds,
          occupiedBeds: occBeds
        });
      } catch (e) {
        console.log("Error loading stats:", e);
      } finally {
        setLoading(false);
      }
    };
    fetchIPDStats();
  }, []);

  const ipdFeatures = [
    { name: "Inpatient Admission", desc: "Admit patient & register initial deposit.", href: "/dashboard/ipd/admission", icon: DoorOpen, color: "#2563eb", bg: "#eff6ff" },
    { name: "Bed Occupancy Grid", desc: "Interactive map of ward beds & floor status.", href: "/dashboard/ipd/bed-status", icon: LayoutGrid, color: "#10b981", bg: "#ecfdf5" },
    { name: "IPD Billing Console", desc: "Generate invoices for ward stays & services.", href: "/dashboard/ipd/bill", icon: Receipt, color: "#f59e0b", bg: "#fefbeb" },
    { name: "Advance Deposits", desc: "Log advance payments and deposit registry.", href: "/dashboard/ipd/deposit", icon: PiggyBank, color: "#06b6d4", bg: "#ecfeff" },
    { name: "Settlements Desk", desc: "Record final discharge payments & receipts.", href: "/dashboard/ipd/payment", icon: CreditCard, color: "#8b5cf6", bg: "#f5f3ff" },
    { name: "Refund Console", desc: "Refund excess deposit payments.", href: "/dashboard/ipd/refund", icon: RotateCcw, color: "#ec4899", bg: "#fdf2f8" },
    { name: "Discharge Wizard", desc: "Check-out patient & release allotted bed.", href: "/dashboard/ipd/discharge", icon: LogOut, color: "#ef4444", bg: "#fef2f2" },
  ];

  return (
    <div style={{ display: "flex", flexDirection: "column", gap: "24px" }}>
      {/* Real-time statistics widgets */}
      <div className={styles.statsGrid}>
        <div className={styles.card}>
          <div className={styles.cardInfo}>
            <span className={styles.cardLabel}>Active Admitted Patients</span>
            <strong className={styles.cardValue}>{loading ? "..." : stats.activeAdmissions}</strong>
          </div>
          <div className={styles.cardIcon} style={{ backgroundColor: "#eff6ff", color: "#2563eb" }}>
            <DoorOpen size={22} />
          </div>
        </div>

        <div className={styles.card}>
          <div className={styles.cardInfo}>
            <span className={styles.cardLabel}>Available Beds</span>
            <strong className={styles.cardValue} style={{ color: "var(--status-success)" }}>
              {loading ? "..." : stats.totalBeds - stats.occupiedBeds}
            </strong>
          </div>
          <div className={styles.cardIcon} style={{ backgroundColor: "#ecfdf5", color: "#10b981" }}>
            <Bed size={22} />
          </div>
        </div>

        <div className={styles.card}>
          <div className={styles.cardInfo}>
            <span className={styles.cardLabel}>Occupied Beds</span>
            <strong className={styles.cardValue} style={{ color: "var(--status-danger)" }}>
              {loading ? "..." : stats.occupiedBeds}
            </strong>
          </div>
          <div className={styles.cardIcon} style={{ backgroundColor: "#fef2f2", color: "#ef4444" }}>
            <Layers size={22} />
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
          <h2 style={{ fontSize: "20px", color: "var(--accent-color)", marginBottom: "4px" }}>In-Patient Department (IPD) Portal</h2>
          <p style={{ color: "var(--text-secondary)", fontSize: "13px" }}>
            Manage room listings, patient admissions, deposit collection, final stay billing calculations, and patient discharge logs.
          </p>
        </div>
      </div>

      <div style={{ 
        display: "grid", 
        gridTemplateColumns: "repeat(auto-fill, minmax(280px, 1fr))", 
        gap: "20px" 
      }}>
        {ipdFeatures.map((item) => {
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
