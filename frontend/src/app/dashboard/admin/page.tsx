"use client";

import React from "react";
import Link from "next/link";
import styles from "../../dashboard.module.css";
import { 
  Users, Shield, Key, Database, ChevronRight, Lock, 
  UserCheck, Server
} from "lucide-react";

export default function AdministrationPortalHubPage() {
  const adminVouchers = [
    { name: "Users Registry", desc: "Add operators, doctors, and pharmacists accounts.", href: "/dashboard/admin/users", icon: Users, color: "#2563eb", bg: "#eff6ff" },
    { name: "Security Role Groups", desc: "Configure role boundaries & privilege layers.", href: "/dashboard/admin/roles", icon: Shield, color: "#10b981", bg: "#ecfdf5" },
    { name: "RBAC Permissions Map", desc: "Set granular permissions per Operator role.", href: "/dashboard/admin/permissions", icon: Key, color: "#f59e0b", bg: "#fefbeb" },
    { name: "Authentication Settings", desc: "Session expiry rules, MFA, and pass complexity.", href: "/dashboard/admin/security", icon: Lock, color: "#8b5cf6", bg: "#f5f3ff" },
    { name: "Database backups", desc: "Dump SQL schemas and schedules recovery.", href: "/dashboard/admin/backup", icon: Database, color: "#ef4444", bg: "#fef2f2" },
  ];

  return (
    <div style={{ display: "flex", flexDirection: "column", gap: "24px" }}>
      {/* Overview stats cards */}
      <div className={styles.statsGrid}>
        <div className={styles.card}>
          <div className={styles.cardInfo}>
            <span className={styles.cardLabel}>Active User Logins</span>
            <strong className={styles.cardValue}>3 Operators</strong>
          </div>
          <div className={styles.cardIcon} style={{ backgroundColor: "#eff6ff", color: "#2563eb" }}>
            <UserCheck size={22} />
          </div>
        </div>

        <div className={styles.card}>
          <div className={styles.cardInfo}>
            <span className={styles.cardLabel}>Database Size</span>
            <strong className={styles.cardValue} style={{ color: "var(--status-success)" }}>128.4 MB</strong>
          </div>
          <div className={styles.cardIcon} style={{ backgroundColor: "#ecfdf5", color: "#10b981" }}>
            <Server size={22} />
          </div>
        </div>

        <div className={styles.card}>
          <div className={styles.cardInfo}>
            <span className={styles.cardLabel}>Configured Roles</span>
            <strong className={styles.cardValue}>4 Groups</strong>
          </div>
          <div className={styles.cardIcon} style={{ backgroundColor: "#fefbeb", color: "#d97706" }}>
            <Shield size={22} />
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
          <h2 style={{ fontSize: "20px", color: "var(--accent-color)", marginBottom: "4px" }}>System Administration Console</h2>
          <p style={{ color: "var(--text-secondary)", fontSize: "13px" }}>
            Manage operators login credentials, update security permissions, configure authentication rules, and scheduling database backup jobs.
          </p>
        </div>
      </div>

      <div style={{ 
        display: "grid", 
        gridTemplateColumns: "repeat(auto-fill, minmax(280px, 1fr))", 
        gap: "20px" 
      }}>
        {adminVouchers.map((item) => {
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
