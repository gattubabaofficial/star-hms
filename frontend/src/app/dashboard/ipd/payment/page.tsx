"use client";

import React, { useEffect, useState } from "react";
import styles from "../../../dashboard.module.css";
import { Search, CreditCard, Banknote, CheckCircle } from "lucide-react";

interface PaymentRecord {
  bill_no: string;
  patient_name: string;
  amount: number;
  date: string;
  method: string;
  status: string;
}

export default function IPDPaymentsPage() {
  const [payments, setPayments] = useState<PaymentRecord[]>([]);
  const [loading, setLoading] = useState(true);
  const [searchTerm, setSearchTerm] = useState("");

  useEffect(() => {
    const fetchPayments = async () => {
      try {
        const response = await fetch("http://127.0.0.1:8000/api/ipd/admissions");
        if (response.ok) {
          const admissions = await response.json();
          const records: PaymentRecord[] = [];
          
          admissions.forEach((a: any) => {
            if (a.bills && a.bills.length > 0) {
              a.bills.forEach((b: any) => {
                records.push({
                  bill_no: b.bill_no,
                  patient_name: a.patient?.ptt_name || "Unknown",
                  amount: b.paid_amount,
                  date: new Date(b.created_at).toLocaleString("en-IN", { dateStyle: "short", timeStyle: "short" }),
                  method: b.paid_amount > 0 ? "Bank Transfer / Card" : "Pending",
                  status: b.status
                });
              });
            }
          });
          setPayments(records);
        }
      } catch (e) {
        console.log("Error fetching IPD payments:", e);
      } finally {
        setLoading(false);
      }
    };
    fetchPayments();
  }, []);

  const filteredPayments = payments.filter(p =>
    p.patient_name.toLowerCase().includes(searchTerm.toLowerCase()) ||
    p.bill_no.toLowerCase().includes(searchTerm.toLowerCase())
  );

  return (
    <div>
      <div className={styles.toolbar}>
        <div className={styles.searchBar}>
          <Search size={18} style={{ color: "var(--text-muted)" }} />
          <input
            type="text"
            placeholder="Search IPD payments by Patient or Bill No..."
            value={searchTerm}
            onChange={(e) => setSearchTerm(e.target.value)}
          />
        </div>
      </div>

      {loading ? (
        <p style={{ color: "var(--text-secondary)", fontSize: "14px" }}>Loading payments ledger...</p>
      ) : filteredPayments.length === 0 ? (
        <div style={{ backgroundColor: "var(--bg-card)", border: "1px solid var(--border-light)", borderRadius: "16px", padding: "60px", textAlign: "center" }}>
          <CreditCard size={40} style={{ color: "var(--text-muted)", marginBottom: "16px" }} />
          <h3 style={{ fontSize: "16px", marginBottom: "8px" }}>No Payments Registered</h3>
          <p style={{ color: "var(--text-secondary)", fontSize: "13px" }}>No IPD settlements found.</p>
        </div>
      ) : (
        <div className={styles.tableContainer}>
          <table className={styles.table}>
            <thead>
              <tr>
                <th>Invoice / Bill No</th>
                <th>Patient Name</th>
                <th>Payment Date & Time</th>
                <th>Payment Mode</th>
                <th>Total Settled Amount</th>
                <th>Settlement State</th>
              </tr>
            </thead>
            <tbody>
              {filteredPayments.map((p, idx) => (
                <tr key={idx}>
                  <td style={{ fontWeight: 600, color: "var(--accent-color)" }}>{p.bill_no}</td>
                  <td style={{ fontWeight: 600 }}>{p.patient_name}</td>
                  <td>{p.date}</td>
                  <td>
                    <span style={{ display: "inline-flex", alignItems: "center", gap: "6px" }}>
                      <Banknote size={15} style={{ color: "var(--accent-color)" }} />
                      {p.method}
                    </span>
                  </td>
                  <td style={{ fontWeight: 700 }}>₹{p.amount.toLocaleString()}</td>
                  <td>
                    <span className={`${styles.badge} ${
                      p.status === "paid" ? styles.badgeSuccess : styles.badgeWarning
                    }`}>
                      {p.status}
                    </span>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      )}
    </div>
  );
}
