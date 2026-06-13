"use client";

import React from "react";
import Link from "next/link";
import styles from "../../dashboard.module.css";
import { 
  Users, UserRound, Award, Share2, Layers, Building, 
  DoorOpen, Bed, Box, Shield, ShieldCheck, ChevronRight
} from "lucide-react";

export default function MastersHubPage() {
  const masterLinks = [
    { name: "Patient Category", desc: "Configure discount rules and patient groupings.", href: "/dashboard/masters/patient-category", icon: Users, color: "#2563eb", bg: "#eff6ff" },
    { name: "Doctor Category", desc: "Configure doctor tier pricing (Senior, Resident).", href: "/dashboard/masters/doctor-category", icon: UserRound, color: "#10b981", bg: "#ecfdf5" },
    { name: "Doctor Role", desc: "Configure roles (Consultant, Surgeon, Referral).", href: "/dashboard/masters/doctor-role", icon: Award, color: "#f59e0b", bg: "#fefbeb" },
    { name: "Doctor Master", desc: "Manage doctors and details.", href: "/dashboard/masters/doctor", icon: UserRound, color: "#8b5cf6", bg: "#f5f3ff" },
    { name: "Referral Master", desc: "Manage inland and outland referrers.", href: "/dashboard/masters/referral", icon: Share2, color: "#ec4899", bg: "#fdf2f8" },
    { name: "Service Group Master", desc: "Configure service groups (Lab, OPD, IPD Rooms).", href: "/dashboard/masters/service-group", icon: Layers, color: "#06b6d4", bg: "#ecfeff" },
    { name: "Service Master", desc: "Manage fee schedule and consultation rates.", href: "/dashboard/masters/service", icon: Layers, color: "#3b82f6", bg: "#eff6ff" },
    { name: "Diagnosis ICD", desc: "Directory of clinical ICD classification codes.", href: "/dashboard/masters/diagnosis", icon: HeartIcon, color: "#ef4444", bg: "#fef2f2" },
    { name: "Procedure Codes", desc: "Configure surgical and ICU billing codes.", href: "/dashboard/masters/procedure", icon: Layers, color: "#14b8a6", bg: "#f0fdfa" },
    { name: "Floor Master", desc: "Hospital layout floors registry.", href: "/dashboard/masters/floor", icon: Building, color: "#6b7280", bg: "#f3f4f6" },
    { name: "Ward Master", desc: "Manage clinical wards configurations.", href: "/dashboard/masters/ward", icon: DoorOpen, color: "#f97316", bg: "#fff7ed" },
    { name: "Bed Master", desc: "Bed mapping configurations.", href: "/dashboard/masters/bed", icon: Bed, color: "#059669", bg: "#ecfdf5" },
    { name: "Package Master", desc: "Configure comprehensive checkup health packages.", href: "/dashboard/masters/package", icon: Box, color: "#d97706", bg: "#fffbeb" },
  ];

  function HeartIcon(props: any) {
    return (
      <svg
        {...props}
        xmlns="http://www.w3.org/2000/svg"
        width="24"
        height="24"
        viewBox="0 0 24 24"
        fill="none"
        stroke="currentColor"
        strokeWidth="2"
        strokeLinecap="round"
        strokeLinejoin="round"
      >
        <path d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z" />
      </svg>
    );
  }

  return (
    <div style={{ display: "flex", flexDirection: "column", gap: "24px" }}>
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
          <h2 style={{ fontSize: "20px", color: "var(--accent-color)", marginBottom: "4px" }}>Hospital Master Registries</h2>
          <p style={{ color: "var(--text-secondary)", fontSize: "13px" }}>
            Configure default settings, layouts, doctors, and rates. Changes reflect in real-time on registrations.
          </p>
        </div>
      </div>

      <div style={{ 
        display: "grid", 
        gridTemplateColumns: "repeat(auto-fill, minmax(280px, 1fr))", 
        gap: "20px" 
      }}>
        {masterLinks.map((item) => {
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
