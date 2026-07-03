"use client";

import React from "react";
import Link from "next/link";
import styles from "../../dashboard.module.css";
import { 
  Users, UserRound, Award, Share2, Layers, Building, 
  DoorOpen, Bed, Box, Shield, ShieldCheck, ChevronRight,
  Building2, Briefcase, BadgeCheck
} from "lucide-react";

function HeartIcon(props: React.SVGProps<SVGSVGElement>) {
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

interface MasterLink {
  name: string;
  desc: string;
  href: string;
  icon: React.ElementType;
  color: string;
  bg: string;
}

const masterLinks: MasterLink[] = [
  { name: "Patient Category", desc: "Configure discount rules and patient groupings.", href: "/dashboard/masters/patient-category", icon: Users, color: "#2563eb", bg: "#eff6ff" },
  { name: "Doctor Category", desc: "Configure doctor tier pricing (Senior, Resident).", href: "/dashboard/masters/doctor-category", icon: UserRound, color: "#10b981", bg: "#ecfdf5" },
  { name: "Doctor Role", desc: "Configure roles (Consultant, Surgeon, Referral).", href: "/dashboard/masters/doctor-role", icon: Award, color: "#f59e0b", bg: "#fefbeb" },
  { name: "Doctor Master", desc: "Manage doctors and details.", href: "/dashboard/masters/doctor", icon: UserRound, color: "#8b5cf6", bg: "#f5f3ff" },
  { name: "Referred By Master", desc: "Manage inland and outland referrers.", href: "/dashboard/masters/referral-by", icon: Share2, color: "#ec4899", bg: "#fdf2f8" },
  { name: "Referred To Master", desc: "Manage inland and outland recipients.", href: "/dashboard/masters/referral-to", icon: Share2, color: "#8b5cf6", bg: "#f5f3ff" },
  { name: "Service Group Master", desc: "Configure service groups (Lab, OPD, IPD Rooms).", href: "/dashboard/masters/service-group", icon: Layers, color: "#06b6d4", bg: "#ecfeff" },
  { name: "Service Master", desc: "Manage fee schedule and consultation rates.", href: "/dashboard/masters/service", icon: Layers, color: "#3b82f6", bg: "#eff6ff" },
  { name: "Diagnosis ICD", desc: "Directory of clinical ICD classification codes.", href: "/dashboard/masters/diagnosis", icon: HeartIcon, color: "#ef4444", bg: "#fef2f2" },
  { name: "Procedure Codes", desc: "Configure surgical and ICU billing codes.", href: "/dashboard/masters/procedure", icon: Layers, color: "#14b8a6", bg: "#f0fdfa" },
  { name: "Floor Master", desc: "Hospital layout floors registry.", href: "/dashboard/masters/floor", icon: Building, color: "#6b7280", bg: "#f3f4f6" },
  { name: "Ward Master", desc: "Manage clinical wards configurations.", href: "/dashboard/masters/ward", icon: DoorOpen, color: "#f97316", bg: "#fff7ed" },
  { name: "Bed Master", desc: "Bed mapping configurations.", href: "/dashboard/masters/bed", icon: Bed, color: "#059669", bg: "#ecfdf5" },
  { name: "Package Master", desc: "Configure comprehensive checkup health packages.", href: "/dashboard/masters/package", icon: Box, color: "#d97706", bg: "#fffbeb" },
];

const medicalStoreLinks: MasterLink[] = [
  { name: "Supplier Group Master", desc: "Manage supplier group classifications.", href: "/dashboard/masters/party-group", icon: Layers, color: "#7c3aed", bg: "#f5f3ff" },
  { name: "Supplier (Party) Master", desc: "Manage supplier (party) details.", href: "/dashboard/masters/party", icon: Building2, color: "#0891b2", bg: "#ecfeff" },
  { name: "Product Group Master", desc: "Manage product group classifications.", href: "/dashboard/masters/product-group", icon: Layers, color: "#f59e0b", bg: "#fefbeb" },
  { name: "Product Master", desc: "Manage pharmacy products/medicines.", href: "/dashboard/masters/product", icon: Box, color: "#059669", bg: "#ecfdf5" },
];

const payrollLinks: MasterLink[] = [
  { name: "Department Master", desc: "Manage hospital departments (ICU, Surgery, HR…).", href: "/dashboard/masters/payroll/department", icon: Building2, color: "#7c3aed", bg: "#f5f3ff" },
  { name: "Designation Master", desc: "Manage employee designations (Nurse, Admin…).", href: "/dashboard/masters/payroll/designation", icon: Briefcase, color: "#0891b2", bg: "#ecfeff" },
  { name: "Employee Master", desc: "Register and manage hospital staff records.", href: "/dashboard/masters/payroll/employee", icon: BadgeCheck, color: "#059669", bg: "#ecfdf5" },
  { name: "Employee Master (Legacy)", desc: "Exact legacy payroll employee master (frmEmpMast).", href: "/dashboard/masters/payroll/employee-legacy", icon: BadgeCheck, color: "#7c3aed", bg: "#f5f3ff" },
  { name: "Holiday Master", desc: "Configure payroll holiday calendar (frmHoliMast).", href: "/dashboard/masters/payroll/holidays", icon: Briefcase, color: "#f59e0b", bg: "#fefbeb" },
];

function MasterCard({ item }: { item: MasterLink }) {
  const Icon = item.icon;
  return (
    <Link
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
        cursor: "pointer",
      }}
      className={styles.navLinkHover}
    >
      <div style={{ display: "flex", alignItems: "center", gap: "16px" }}>
        <div style={{
          width: "44px", height: "44px", borderRadius: "10px",
          color: item.color, backgroundColor: item.bg,
          display: "flex", alignItems: "center", justifyContent: "center",
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
}

export default function MastersHubPage() {
  return (
    <div style={{ display: "flex", flexDirection: "column", gap: "28px" }}>
      {/* Header */}
      <div style={{
        backgroundColor: "var(--accent-light)",
        borderRadius: "16px",
        padding: "24px",
        border: "1px solid rgba(37, 99, 235, 0.1)",
        display: "flex", alignItems: "center", justifyContent: "space-between"
      }}>
        <div>
          <h2 style={{ fontSize: "20px", color: "var(--accent-color)", marginBottom: "4px" }}>Hospital Master Registries</h2>
          <p style={{ color: "var(--text-secondary)", fontSize: "13px" }}>
            Configure default settings, layouts, doctors, rates, and payroll. Changes reflect in real-time on registrations.
          </p>
        </div>
      </div>

      {/* General Masters */}
      <div>
        <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fill, minmax(280px, 1fr))", gap: "20px" }}>
          {masterLinks.map((item) => <MasterCard key={item.name} item={item} />)}
        </div>
      </div>

      {/* Medical Store Masters Section */}
      <div style={{
        border: "1px solid rgba(37, 99, 235, 0.2)",
        borderRadius: "16px",
        overflow: "hidden",
      }}>
        {/* Section header */}
        <div style={{
          background: "linear-gradient(135deg, rgba(37,99,235,0.08) 0%, rgba(6,182,212,0.06) 100%)",
          borderBottom: "1px solid rgba(37, 99, 235, 0.15)",
          padding: "16px 24px",
          display: "flex",
          alignItems: "center",
          gap: "12px",
        }}>
          <div style={{
            width: "36px", height: "36px", borderRadius: "8px",
            background: "linear-gradient(135deg, #2563eb, #06b6d4)",
            display: "flex", alignItems: "center", justifyContent: "center",
          }}>
            <Box size={18} style={{ color: "#fff" }} />
          </div>
          <div>
            <h3 style={{ fontSize: "15px", fontWeight: 700, color: "var(--text-primary)", margin: 0 }}>
              Medical Store Masters
            </h3>
            <p style={{ fontSize: "12px", color: "var(--text-secondary)", margin: 0 }}>
              Configure suppliers, groups, and pharmaceutical product catalog lists
            </p>
          </div>
        </div>
        {/* Cards */}
        <div style={{ padding: "20px", display: "grid", gridTemplateColumns: "repeat(auto-fill, minmax(280px, 1fr))", gap: "16px" }}>
          {medicalStoreLinks.map((item) => <MasterCard key={item.name} item={item} />)}
        </div>
      </div>

      {/* Payroll Masters Section */}
      <div style={{
        border: "1px solid rgba(124, 58, 237, 0.2)",
        borderRadius: "16px",
        overflow: "hidden",
      }}>
        {/* Section header */}
        <div style={{
          background: "linear-gradient(135deg, rgba(124,58,237,0.08) 0%, rgba(8,145,178,0.06) 100%)",
          borderBottom: "1px solid rgba(124, 58, 237, 0.15)",
          padding: "16px 24px",
          display: "flex",
          alignItems: "center",
          gap: "12px",
        }}>
          <div style={{
            width: "36px", height: "36px", borderRadius: "8px",
            background: "linear-gradient(135deg, #7c3aed, #0891b2)",
            display: "flex", alignItems: "center", justifyContent: "center",
          }}>
            <Users size={18} style={{ color: "#fff" }} />
          </div>
          <div>
            <h3 style={{ fontSize: "15px", fontWeight: 700, color: "var(--text-primary)", margin: 0 }}>
              Payroll Masters
            </h3>
            <p style={{ fontSize: "12px", color: "var(--text-secondary)", margin: 0 }}>
              Configure departments, designations, and employee records for payroll management
            </p>
          </div>
        </div>
        {/* Cards */}
        <div style={{ padding: "20px", display: "grid", gridTemplateColumns: "repeat(auto-fill, minmax(280px, 1fr))", gap: "16px" }}>
          {payrollLinks.map((item) => <MasterCard key={item.name} item={item} />)}
        </div>
      </div>
    </div>
  );
}
