"use client";

import React, { useState } from "react";
import styles from "../../../dashboard.module.css";
import { Search, CreditCard, Wallet, Banknote } from "lucide-react";

interface PaymentLog {
  tx_id: string;
  bill_no: string;
  patient_name: string;
  amount: number;
  method: "Cash" | "UPI" | "Credit Card" | "Debit Card";
  ref_no: string;
  date: string;
  status: "Completed" | "Pending" | "Failed";
}

export default function OPDPaymentPage() {
  const [payments, setPayments] = useState<PaymentLog[]>([
    { tx_id: "TXN-77821", bill_no: "OPD-20260611-0001", patient_name: "Amit Patel", amount: 500, method: "Cash", ref_no: "N/A", date: "2026-06-11 10:15", status: "Completed" },
    { tx_id: "TXN-77822", bill_no: "OPD-20260611-0002", patient_name: "Sonia Rao", amount: 425, method: "UPI", ref_no: "upi_672901127", date: "2026-06-11 11:30", status: "Completed" },
    { tx_id: "TXN-77823", bill_no: "OPD-20260611-0003", patient_name: "John Miller", amount: 500, method: "Credit Card", ref_no: "auth_882910a", date: "2026-06-11 14:20", status: "Completed" },
    { tx_id: "TXN-77824", bill_no: "OPD-20260611-0004", patient_name: "Rajesh Kumar", amount: 250, method: "UPI", ref_no: "upi_192019721", date: "2026-06-11 15:45", status: "Completed" },
  ]);

  const [searchTerm, setSearchTerm] = useState("");

  const filteredPayments = payments.filter(p =>
    p.patient_name.toLowerCase().includes(searchTerm.toLowerCase()) ||
    p.bill_no.toLowerCase().includes(searchTerm.toLowerCase()) ||
    p.tx_id.toLowerCase().includes(searchTerm.toLowerCase())
  );

  return (
    <div>
      <div className={styles.toolbar}>
        <div className={styles.searchBar}>
          <Search size={18} style={{ color: "var(--text-muted)" }} />
          <input
            type="text"
            placeholder="Search payments by Patient, Bill No, or Txn ID..."
            value={searchTerm}
            onChange={(e) => setSearchTerm(e.target.value)}
          />
        </div>
      </div>

      <div className={styles.tableContainer}>
        <table className={styles.table}>
          <thead>
            <tr>
              <th>Txn ID</th>
              <th>Bill Number</th>
              <th>Patient Name</th>
              <th>Date & Time</th>
              <th>Payment Mode</th>
              <th>Reference No</th>
              <th>Amount Paid</th>
              <th>Status</th>
            </tr>
          </thead>
          <tbody>
            {filteredPayments.map((p) => (
              <tr key={p.tx_id}>
                <td style={{ fontWeight: 700, color: "var(--accent-color)" }}>{p.tx_id}</td>
                <td style={{ fontWeight: 600 }}>{p.bill_no}</td>
                <td style={{ fontWeight: 600 }}>{p.patient_name}</td>
                <td>{p.date}</td>
                <td>
                  <span style={{ display: "inline-flex", alignItems: "center", gap: "6px", fontSize: "13px" }}>
                    {p.method === "Cash" && <Banknote size={15} style={{ color: "#10b981" }} />}
                    {p.method === "UPI" && <Wallet size={15} style={{ color: "#2563eb" }} />}
                    {p.method.includes("Card") && <CreditCard size={15} style={{ color: "#f59e0b" }} />}
                    {p.method}
                  </span>
                </td>
                <td style={{ fontFamily: "monospace", fontSize: "12px", color: "var(--text-secondary)" }}>{p.ref_no}</td>
                <td style={{ fontWeight: 700 }}>₹{p.amount.toFixed(2)}</td>
                <td>
                  <span className={`${styles.badge} ${styles.badgeSuccess}`}>
                    {p.status}
                  </span>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </div>
  );
}
