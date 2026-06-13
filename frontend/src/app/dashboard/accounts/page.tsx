"use client";

import React from "react";
import Link from "next/link";
import styles from "../../dashboard.module.css";
import { 
  DollarSign, Receipt, BookOpen, Layers, RefreshCw, BarChart3,
  ChevronRight, Landmark, ArrowRightLeft
} from "lucide-react";

export default function AccountsPortalHubPage() {
  const accountVouchers = [
    { name: "Cash Receipt (CRV)", desc: "Log cash revenue receipts from billing counters.", href: "/dashboard/accounts/cash-receipt", icon: Receipt, color: "#10b981", bg: "#ecfdf5" },
    { name: "Cash Payment (CPV)", desc: "Record cash expenditures and petty cash vouchers.", href: "/dashboard/accounts/cash-payment", icon: DollarSign, color: "#ef4444", bg: "#fef2f2" },
    { name: "Bank Receipt (BRV)", desc: "Record online transfers, card deposits, & cheque collections.", href: "/dashboard/accounts/bank-receipt", icon: Landmark, color: "#2563eb", bg: "#eff6ff" },
    { name: "Bank Payment (BPV)", desc: "Record cheque payments and bank vendor transfers.", href: "/dashboard/accounts/bank-payment", icon: DollarSign, color: "#f97316", bg: "#fff7ed" },
    { name: "Journal Voucher (JV)", desc: "Post double-entry adjustment and provision journals.", href: "/dashboard/accounts/journal", icon: BookOpen, color: "#8b5cf6", bg: "#f5f3ff" },
    { name: "Contra Transfer (CNV)", desc: "Register cash deposits and withdrawals to/from bank.", href: "/dashboard/accounts/contra", icon: ArrowRightLeft, color: "#06b6d4", bg: "#ecfeff" },
    { name: "Ledger trial Balance", desc: "View debit vs credit account statement balances.", href: "/dashboard/accounts/reports", icon: BarChart3, color: "#eab308", bg: "#fef9c3" },
  ];

  return (
    <div style={{ display: "flex", flexDirection: "column", gap: "24px" }}>
      {/* Overview Cards */}
      <div className={styles.statsGrid}>
        <div className={styles.card}>
          <div className={styles.cardInfo}>
            <span className={styles.cardLabel}>Cash In Hand Office</span>
            <strong className={styles.cardValue}>₹93,800.00</strong>
          </div>
          <div className={styles.cardIcon} style={{ backgroundColor: "#ecfdf5", color: "#10b981" }}>
            <DollarSign size={22} />
          </div>
        </div>

        <div className={styles.card}>
          <div className={styles.cardInfo}>
            <span className={styles.cardLabel}>Bank Assets Balance</span>
            <strong className={styles.cardValue} style={{ color: "var(--accent-color)" }}>₹1,894,200.00</strong>
          </div>
          <div className={styles.cardIcon} style={{ backgroundColor: "#eff6ff", color: "#2563eb" }}>
            <Landmark size={22} />
          </div>
        </div>

        <div className={styles.card}>
          <div className={styles.cardInfo}>
            <span className={styles.cardLabel}>Sundry Accounts Payable</span>
            <strong className={styles.cardValue} style={{ color: "var(--status-danger)" }}>₹91,500.00</strong>
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
          <h2 style={{ fontSize: "20px", color: "var(--accent-color)", marginBottom: "4px" }}>General Ledger Accounts Portal</h2>
          <p style={{ color: "var(--text-secondary)", fontSize: "13px" }}>
            Post accounting vouchers, log cash and bank book transactions, create adjustments, and audit trial balances.
          </p>
        </div>
      </div>

      <div style={{ 
        display: "grid", 
        gridTemplateColumns: "repeat(auto-fill, minmax(280px, 1fr))", 
        gap: "20px" 
      }}>
        {accountVouchers.map((item) => {
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
