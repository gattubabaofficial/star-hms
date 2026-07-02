"use client";

import React, { useEffect, useState } from "react";
import Link from "next/link";
import styles from "../../dashboard.module.css";
import {
  Stethoscope, FileText, Receipt, CreditCard, RotateCcw,
  ChevronRight, CalendarDays, Users2, Activity, ClipboardList,
  Calendar, Pill, UserCheck, History, FileX,
} from "lucide-react";

const API = "http://127.0.0.1:8000/api/opd";

export default function OPDPortalHubPage() {
  const [stats, setStats] = useState({ todayVisits: 0, billedAmount: 0, collectedAmount: 0 });
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const today = new Date().toISOString().split("T")[0];
    fetch(`${API}/consultations?start_date=${today}&end_date=${today}`)
      .then(r => r.ok ? r.json() : [])
      .then((data: any[]) => {
        setStats({
          todayVisits: data.length,
          billedAmount: data.reduce((s, r) => s + (r.BillAmt || 0), 0),
          collectedAmount: data.reduce((s, r) => s + (r.PaidAmt || 0), 0),
        });
      })
      .catch(() => {})
      .finally(() => setLoading(false));
  }, []);

  const opdFeatures = [
    { name: "Consultation / Registration", desc: "Register OPD patient consultations & assign doctors.", href: "/dashboard/opd/consultation", icon: Stethoscope, color: "#2563eb", bg: "#eff6ff" },
    { name: "Consultation Due Payment", desc: "Collect pending consultation fees.", href: "/dashboard/opd/consultation-due", icon: CreditCard, color: "#10b981", bg: "#ecfdf5" },
    { name: "Consultation Refund", desc: "Process refunds for cancelled consultations.", href: "/dashboard/opd/consultation-refund", icon: RotateCcw, color: "#ef4444", bg: "#fef2f2" },
    { name: "Appointment", desc: "View and manage OPD appointment schedule.", href: "/dashboard/opd/appointment", icon: Calendar, color: "#8b5cf6", bg: "#f5f3ff" },
    { name: "Receipt / Procedures / Diagnostics", desc: "OPD service charges, procedures & diagnostics receipts.", href: "/dashboard/opd/receipt", icon: Receipt, color: "#f59e0b", bg: "#fefbeb" },
    { name: "Receipt Due Payment", desc: "Collect pending OPD receipt amounts.", href: "/dashboard/opd/receipt-due", icon: UserCheck, color: "#0ea5e9", bg: "#f0f9ff" },
    { name: "Receipt Refund", desc: "Process refunds on OPD receipts.", href: "/dashboard/opd/receipt-refund", icon: FileX, color: "#f43f5e", bg: "#fff1f2" },
    { name: "Casual Bill", desc: "Create & manage itemized OPD casual bills.", href: "/dashboard/opd/billing", icon: FileText, color: "#f97316", bg: "#fff7ed" },
    { name: "Casual Bill Payment", desc: "Post payments against OPD casual bills.", href: "/dashboard/opd/casual-bill-payment", icon: Pill, color: "#6366f1", bg: "#eef2ff" },
    { name: "Casual Bill Refund", desc: "Refund overpaid or cancelled casual bills.", href: "/dashboard/opd/casual-bill-refund", icon: ClipboardList, color: "#ec4899", bg: "#fdf2f8" },
    { name: "Outdoor Clinical History", desc: "View complete OPD visit & treatment history.", href: "/dashboard/opd/clinical-history", icon: History, color: "#14b8a6", bg: "#f0fdfa" },
  ];

  return (
    <div style={{ display: "flex", flexDirection: "column", gap: "24px" }}>
      {/* Stats */}
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
            <span className={styles.cardLabel}>Today's Billings</span>
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

      {/* Header */}
      <div style={{ backgroundColor: "var(--accent-light)", borderRadius: "16px", padding: "20px 24px", border: "1px solid rgba(37,99,235,0.1)" }}>
        <h2 style={{ fontSize: "18px", color: "var(--accent-color)", marginBottom: "4px" }}>Out-Patient Department (OPD) Portal</h2>
        <p style={{ color: "var(--text-secondary)", fontSize: "13px" }}>
          Manage consultations, receipts, appointments, billing, and clinical history for outdoor patients.
        </p>
      </div>

      {/* Feature Grid */}
      <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fill, minmax(270px, 1fr))", gap: "16px" }}>
        {opdFeatures.map((item) => {
          const Icon = item.icon;
          return (
            <Link
              key={item.name}
              href={item.href}
              style={{
                display: "flex", alignItems: "center", justifyContent: "space-between",
                backgroundColor: "var(--bg-card)", border: "1px solid var(--border-light)",
                borderRadius: "12px", padding: "18px 20px",
                boxShadow: "0 2px 4px rgba(0,0,0,0.02)",
                transition: "all 0.2s ease", cursor: "pointer",
              }}
              className={styles.navLinkHover}
            >
              <div style={{ display: "flex", alignItems: "center", gap: "14px" }}>
                <div style={{ width: "42px", height: "42px", borderRadius: "10px", color: item.color, backgroundColor: item.bg, display: "flex", alignItems: "center", justifyContent: "center", flexShrink: 0 }}>
                  <Icon size={19} />
                </div>
                <div style={{ display: "flex", flexDirection: "column", gap: "2px" }}>
                  <strong style={{ fontSize: "13px", color: "var(--text-primary)" }}>{item.name}</strong>
                  <span style={{ fontSize: "11px", color: "var(--text-secondary)", lineHeight: "1.3", maxWidth: "190px" }}>{item.desc}</span>
                </div>
              </div>
              <ChevronRight size={15} style={{ color: "var(--text-muted)", flexShrink: 0 }} />
            </Link>
          );
        })}
      </div>
    </div>
  );
}
