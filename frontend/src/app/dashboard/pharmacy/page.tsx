"use client";

import React, { useEffect, useState } from "react";
import Link from "next/link";
import styles from "../../dashboard.module.css";
import { 
  Pill, ShoppingBag, ClipboardList, TrendingUp, ChevronRight,
  Activity, ArrowDownLeft, Store
} from "lucide-react";

export default function PharmacyPortalHubPage() {
  const [stats, setStats] = useState({
    stockCount: 0,
    grossSales: 0,
    grossPurchases: 0
  });
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const fetchPharmacyStats = async () => {
      try {
        const stkRes = await fetch("http://127.0.0.1:8000/api/pharmacy/stock");
        const saleRes = await fetch("http://127.0.0.1:8000/api/pharmacy/sales");
        const purchRes = await fetch("http://127.0.0.1:8000/api/pharmacy/purchases");

        let stocks = 0;
        let sales = 0;
        let purchases = 0;

        if (stkRes.ok) {
          const stkData = await stkRes.json();
          stocks = stkData.length;
        }
        if (saleRes.ok) {
          const saleData = await saleRes.json();
          saleData.forEach((s: any) => { sales += s.OskNetAmt; });
        }
        if (purchRes.ok) {
          const purchData = await purchRes.json();
          purchData.forEach((p: any) => { purchases += p.IskNetAmt; });
        }

        setStats({
          stockCount: stocks,
          grossSales: sales,
          grossPurchases: purchases
        });
      } catch (e) {
        console.log("Error loading pharmacy stats:", e);
      } finally {
        setLoading(false);
      }
    };
    fetchPharmacyStats();
  }, []);

  const pharmacyFeatures = [
    { name: "Vendor Stock Inward", desc: "Log purchase invoices & batches from suppliers.", href: "/dashboard/pharmacy/purchase", icon: ArrowDownLeft, color: "#2563eb", bg: "#eff6ff" },
    { name: "POS Sales Counter", desc: "Dispense medicines and print retail bills.", href: "/dashboard/pharmacy/sale", icon: ShoppingBag, color: "#10b981", bg: "#ecfdf5" },
    { name: "Stock Register", desc: "View available batch quantities & expiry status.", href: "/dashboard/pharmacy/stock-register", icon: ClipboardList, color: "#f59e0b", bg: "#fefbeb" },
    { name: "Stock Transactions", desc: "Audit trail ledger of item stock movements.", href: "/dashboard/pharmacy/stock-transactions", icon: Activity, color: "#8b5cf6", bg: "#f5f3ff" },
    { name: "Medicine Master", desc: "Manage medicines (frmMediMast).", href: "/dashboard/pharmacy/medicines", icon: ClipboardList, color: "#0891b2", bg: "#ecfeff" },
    { name: "Medicine Groups", desc: "Manage medicine groups (frmMediGrpMst).", href: "/dashboard/pharmacy/medicine-groups", icon: ClipboardList, color: "#7c3aed", bg: "#f5f3ff" },
    { name: "Medicine Companies", desc: "Manufacturer / company master (frmMediCpyMst).", href: "/dashboard/pharmacy/medicine-companies", icon: ClipboardList, color: "#059669", bg: "#ecfdf5" },
    { name: "Compositions", desc: "Drug composition master (frmMediCpoMst).", href: "/dashboard/pharmacy/medicine-compositions", icon: ClipboardList, color: "#d97706", bg: "#fffbeb" },
    { name: "Products (Stock Items)", desc: "Non-medicine stock item master (frmProdMast).", href: "/dashboard/pharmacy/products", icon: ClipboardList, color: "#2563eb", bg: "#eff6ff" },
  ];

  return (
    <div style={{ display: "flex", flexDirection: "column", gap: "24px" }}>
      {/* Dynamic Summary Cards */}
      <div className={styles.statsGrid}>
        <div className={styles.card}>
          <div className={styles.cardInfo}>
            <span className={styles.cardLabel}>Medicines In Registry</span>
            <strong className={styles.cardValue}>{loading ? "..." : stats.stockCount}</strong>
          </div>
          <div className={styles.cardIcon} style={{ backgroundColor: "#eff6ff", color: "#2563eb" }}>
            <Pill size={22} />
          </div>
        </div>

        <div className={styles.card}>
          <div className={styles.cardInfo}>
            <span className={styles.cardLabel}>Retail Counter Sales</span>
            <strong className={styles.cardValue} style={{ color: "var(--status-success)" }}>
              ₹{loading ? "..." : stats.grossSales.toLocaleString("en-IN")}
            </strong>
          </div>
          <div className={styles.cardIcon} style={{ backgroundColor: "#ecfdf5", color: "#10b981" }}>
            <Store size={22} />
          </div>
        </div>

        <div className={styles.card}>
          <div className={styles.cardInfo}>
            <span className={styles.cardLabel}>Purchases Committed</span>
            <strong className={styles.cardValue} style={{ color: "var(--status-danger)" }}>
              ₹{loading ? "..." : stats.grossPurchases.toLocaleString("en-IN")}
            </strong>
          </div>
          <div className={styles.cardIcon} style={{ backgroundColor: "#fef2f2", color: "#ef4444" }}>
            <TrendingUp size={22} />
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
          <h2 style={{ fontSize: "20px", color: "var(--accent-color)", marginBottom: "4px" }}>Pharmacy Ledger Dashboard</h2>
          <p style={{ color: "var(--text-secondary)", fontSize: "13px" }}>
            Configure medicine batches, process procurement transactions, audit stock registers, and run the retail POS checkout counter.
          </p>
        </div>
      </div>

      <div style={{ 
        display: "grid", 
        gridTemplateColumns: "repeat(auto-fill, minmax(280px, 1fr))", 
        gap: "20px" 
      }}>
        {pharmacyFeatures.map((item) => {
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
