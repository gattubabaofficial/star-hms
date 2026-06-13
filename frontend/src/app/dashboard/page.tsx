"use client";

import React, { useEffect, useState } from "react";
import styles from "../dashboard.module.css";
import { 
  Users, UserRound, Bed, DollarSign, CalendarRange, 
  ArrowRight, ShieldCheck, Heart, UserPlus, Stethoscope, PlusCircle
} from "lucide-react";
import Link from "next/link";

interface Stats {
  total_patients: number;
  total_doctors: number;
  total_beds: number;
  occupied_beds: number;
  opd_today_count: number;
  ipd_today_count: number;
  total_revenue_today: number;
}

interface Patient {
  ptt_code: number;
  ptt_name: string;
  ptt_reg_no: number;
  ptt_sex: string;
  ptt_telephone: string;
}

export default function DashboardPage() {
  const [stats, setStats] = useState<Stats>({
    total_patients: 0,
    total_doctors: 0,
    total_beds: 0,
    occupied_beds: 0,
    opd_today_count: 0,
    ipd_today_count: 0,
    total_revenue_today: 0.0,
  });
  const [recentPatients, setRecentPatients] = useState<Patient[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const fetchDashboardData = async () => {
      try {
        const statsRes = await fetch("http://127.0.0.1:8000/api/system/dashboard-stats");
        if (statsRes.ok) {
          const statsData = await statsRes.json();
          setStats(statsData);
        }

        const patientsRes = await fetch("http://127.0.0.1:8000/api/masters/patients");
        if (patientsRes.ok) {
          const patientsData = await patientsRes.json();
          // Sort descending and take top 5
          const sorted = patientsData.sort((a: any, b: any) => b.ptt_code - a.ptt_code).slice(0, 5);
          setRecentPatients(sorted);
        }
      } catch (e) {
        console.log("Error loading dashboard metrics:", e);
      } finally {
        setLoading(false);
      }
    };

    fetchDashboardData();
  }, []);

  const statsItems = [
    { 
      label: "Total Patients", 
      value: stats.total_patients, 
      icon: Users, 
      iconColor: "#2563eb", 
      bgColor: "#eff6ff" 
    },
    { 
      label: "On-Duty Doctors", 
      value: stats.total_doctors, 
      icon: UserRound, 
      iconColor: "#10b981", 
      bgColor: "#ecfdf5" 
    },
    { 
      label: "Bed Occupancy", 
      value: `${stats.occupied_beds}/${stats.total_beds}`, 
      icon: Bed, 
      iconColor: "#f59e0b", 
      bgColor: "#fefbeb" 
    },
    { 
      label: "Revenue Today", 
      value: `₹${stats.total_revenue_today.toLocaleString('en-IN', { minimumFractionDigits: 2, maximumFractionDigits: 2 })}`, 
      icon: DollarSign, 
      iconColor: "#ef4444", 
      bgColor: "#fef2f2" 
    },
  ];

  return (
    <div>
      {/* Welcome Section */}
      <div style={{ 
        backgroundColor: "var(--accent-light)", 
        borderRadius: "16px", 
        padding: "32px", 
        border: "1px solid rgba(37, 99, 235, 0.1)",
        marginBottom: "32px",
        display: "flex",
        alignItems: "center",
        justifyContent: "space-between",
        gap: "24px"
      }}>
        <div style={{ display: "flex", flexDirection: "column", gap: "8px" }}>
          <h2 style={{ fontSize: "24px", color: "var(--accent-color)" }}>Welcome to Star HMS</h2>
          <p style={{ color: "var(--text-secondary)", fontSize: "14px", maxWidth: "600px" }}>
            The system database has been successfully migrated to PostgreSQL. You have full administrative control over registrations, consultations, admissions, and operational matrix grids.
          </p>
        </div>
        <div style={{ display: "flex", gap: "8px" }}>
          <span className={`${styles.badge} ${styles.badgeSuccess}`} style={{ gap: "6px", padding: "8px 16px", borderRadius: "10px" }}>
            <ShieldCheck size={16} /> Admin Mode Active
          </span>
        </div>
      </div>

      {/* Stats Widgets Grid */}
      <div className={styles.statsGrid}>
        {statsItems.map((item) => {
          const Icon = item.icon;
          return (
            <div key={item.label} className={styles.card}>
              <div className={styles.cardInfo}>
                <span className={styles.cardLabel}>{item.label}</span>
                <span className={styles.cardValue}>{item.value}</span>
              </div>
              <div className={styles.cardIcon} style={{ color: item.iconColor, backgroundColor: item.bgColor }}>
                <Icon size={24} />
              </div>
            </div>
          );
        })}
      </div>

      {/* Main Sections (Quick Actions + Recent Patients) */}
      <div className={styles.dashboardSections}>
        {/* Recent Patient Registrations */}
        <div className={styles.sectionBox}>
          <div className={styles.sectionHeader}>
            <h3 className={styles.sectionTitle}>Recently Registered Patients</h3>
            <Link href="/dashboard/patients" style={{ fontSize: "13px", color: "var(--accent-color)", fontWeight: 600, display: "flex", alignItems: "center", gap: "4px" }}>
              View All <ArrowRight size={14} />
            </Link>
          </div>
          {loading ? (
            <p style={{ color: "var(--text-secondary)", padding: "24px 0", fontSize: "14px" }}>Loading patient grid...</p>
          ) : recentPatients.length === 0 ? (
            <div style={{ padding: "40px 0", textAlign: "center", color: "var(--text-secondary)" }}>
              <Heart size={32} style={{ color: "var(--text-muted)", marginBottom: "12px" }} />
              <p style={{ fontSize: "14px" }}>No registered patients found. Go to Patients to create one.</p>
            </div>
          ) : (
            <div className={styles.tableContainer}>
              <table className={styles.table}>
                <thead>
                  <tr>
                    <th>Reg No</th>
                    <th>Name</th>
                    <th>Sex</th>
                    <th>Telephone</th>
                  </tr>
                </thead>
                <tbody>
                  {recentPatients.map((ptt) => (
                    <tr key={ptt.ptt_code}>
                      <td style={{ fontWeight: 600, color: "var(--accent-color)" }}>#{ptt.ptt_reg_no || ptt.ptt_code}</td>
                      <td style={{ fontWeight: 500 }}>{ptt.ptt_name}</td>
                      <td>
                        <span className={`${styles.badge} ${ptt.ptt_sex === "M" ? styles.badgeSuccess : styles.badgeWarning}`}>
                          {ptt.ptt_sex || "N/A"}
                        </span>
                      </td>
                      <td>{ptt.ptt_telephone || "--"}</td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          )}
        </div>

        {/* Quick Actions Panel */}
        <div className={styles.sectionBox} style={{ display: "flex", flexDirection: "column", gap: "20px" }}>
          <div className={styles.sectionHeader} style={{ marginBottom: "0px" }}>
            <h3 className={styles.sectionTitle}>Quick Access Tools</h3>
          </div>
          <div style={{ display: "flex", flexDirection: "column", gap: "12px" }}>
            <Link href="/dashboard/patients" className={styles.secondaryBtn} style={{ justifyContent: "flex-start", padding: "16px", borderRadius: "12px" }}>
              <UserPlus size={18} style={{ color: "var(--accent-color)" }} />
              <div style={{ display: "flex", flexDirection: "column", alignItems: "flex-start", gap: "2px" }}>
                <span style={{ fontSize: "14px", fontWeight: 600 }}>Register Patient</span>
                <span style={{ fontSize: "11px", color: "var(--text-secondary)" }}>Add new record to PostgreSQL</span>
              </div>
            </Link>
            <Link href="/dashboard/opd" className={styles.secondaryBtn} style={{ justifyContent: "flex-start", padding: "16px", borderRadius: "12px" }}>
              <Stethoscope size={18} style={{ color: "var(--status-success)" }} />
              <div style={{ display: "flex", flexDirection: "column", alignItems: "flex-start", gap: "2px" }}>
                <span style={{ fontSize: "14px", fontWeight: 600 }}>New OPD Visit</span>
                <span style={{ fontSize: "11px", color: "var(--text-secondary)" }}>Create out-patient consultation visit</span>
              </div>
            </Link>
            <Link href="/dashboard/ipd" className={styles.secondaryBtn} style={{ justifyContent: "flex-start", padding: "16px", borderRadius: "12px" }}>
              <Bed size={18} style={{ color: "var(--status-warning)" }} />
              <div style={{ display: "flex", flexDirection: "column", alignItems: "flex-start", gap: "2px" }}>
                <span style={{ fontSize: "14px", fontWeight: 600 }}>Admit to Ward</span>
                <span style={{ fontSize: "11px", color: "var(--text-secondary)" }}>Allocate bed and check state matrix</span>
              </div>
            </Link>
          </div>
        </div>
      </div>
    </div>
  );
}
