"use client";

import React, { useState } from "react";
import styles from "../../../dashboard.module.css";
import { FileBarChart, Calendar, Printer } from "lucide-react";

interface LedgerAccount {
  account_name: string;
  debit: number;
  credit: number;
}

export default function AccountsTrialBalancePage() {
  const [ledgers] = useState<LedgerAccount[]>([
    { account_name: "Capital Account (Owner's Equity)", debit: 0, credit: 1500000 },
    { account_name: "OPD Consultation Revenue", debit: 0, credit: 325400 },
    { account_name: "IPD Stay Room Revenue", debit: 0, credit: 745000 },
    { account_name: "Pharmacy Retail Sales", debit: 0, credit: 412500 },
    { account_name: "Laboratory Investigation Revenue", debit: 0, credit: 210950 },
    { account_name: "Staff Salaries Expense", debit: 345000, credit: 0 },
    { account_name: "Printing & Stationery Expenses", debit: 12450, credit: 0 },
    { account_name: "Electricity & Utility Charges", debit: 28900, credit: 0 },
    { account_name: "HDFC Bank Account Balance", debit: 1894200, credit: 0 },
    { account_name: "Cash Office Balance (In Hand)", debit: 93800, credit: 0 },
    { account_name: "Vendor Sundry Creditors", debit: 0, credit: 91500 },
  ]);

  const totalDebits = ledgers.reduce((sum, l) => sum + l.debit, 0);
  const totalCredits = ledgers.reduce((sum, l) => sum + l.credit, 0);

  return (
    <div>
      <div className={styles.toolbar} style={{ justifyContent: "space-between" }}>
        <div style={{ display: "flex", alignItems: "center", gap: "10px" }}>
          <Calendar size={18} style={{ color: "var(--text-secondary)" }} />
          <span style={{ fontSize: "14px", fontWeight: 600 }}>Financial Year: 2026-27</span>
        </div>
        <button className={styles.primaryBtn} onClick={() => window.print()}>
          <Printer size={16} />
          <span>Print Balance Sheet</span>
        </button>
      </div>

      <div className={styles.sectionBox} style={{ maxWidth: "800px" }}>
        <div className={styles.sectionHeader} style={{ textAlign: "center", display: "block" }}>
          <h2 style={{ fontSize: "18px", fontWeight: 700, margin: "0 0 4px 0" }}>STAR HOSPITAL</h2>
          <h3 style={{ fontSize: "14px", color: "var(--text-secondary)", margin: 0 }}>Trial Balance Statement (FY 2026-27)</h3>
        </div>

        <div className={styles.tableContainer}>
          <table className={styles.table}>
            <thead>
              <tr>
                <th>Ledger Account Head</th>
                <th style={{ textAlign: "right" }}>Debit Balance (₹)</th>
                <th style={{ textAlign: "right" }}>Credit Balance (₹)</th>
              </tr>
            </thead>
            <tbody>
              {ledgers.map((l, idx) => (
                <tr key={idx}>
                  <td style={{ fontWeight: 600 }}>{l.account_name}</td>
                  <td style={{ textAlign: "right", color: l.debit > 0 ? "var(--text-primary)" : "var(--text-muted)" }}>
                    {l.debit > 0 ? `₹${l.debit.toLocaleString("en-IN", { minimumFractionDigits: 2 })}` : "-"}
                  </td>
                  <td style={{ textAlign: "right", color: l.credit > 0 ? "var(--text-primary)" : "var(--text-muted)" }}>
                    {l.credit > 0 ? `₹${l.credit.toLocaleString("en-IN", { minimumFractionDigits: 2 })}` : "-"}
                  </td>
                </tr>
              ))}
              <tr style={{ backgroundColor: "var(--bg-secondary)", borderTop: "2px solid var(--border-light)" }}>
                <td style={{ fontWeight: 700 }}>Trial Balance Total</td>
                <td style={{ textAlign: "right", fontWeight: 700, color: "var(--accent-color)", fontSize: "15px" }}>
                  ₹{totalDebits.toLocaleString("en-IN", { minimumFractionDigits: 2 })}
                </td>
                <td style={{ textAlign: "right", fontWeight: 700, color: "var(--accent-color)", fontSize: "15px" }}>
                  ₹{totalCredits.toLocaleString("en-IN", { minimumFractionDigits: 2 })}
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  );
}
