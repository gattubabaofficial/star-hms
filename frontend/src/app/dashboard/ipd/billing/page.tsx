"use client";

import React, { useEffect, useState } from "react";
import styles from "../../../dashboard.module.css";
import { Layers, Search } from "lucide-react";

interface IPDBill {
  bill_id: number;
  bill_no: string;
  room_charges: number;
  service_charges: number;
  total_amount: number;
  discount_amount: number;
  net_amount: number;
  paid_amount: number;
  status: string;
  created_at: string;
}

interface IPDAdmission {
  ipd_code: number;
  patient?: { ptt_name: string };
  bills: IPDBill[];
}

export default function IPDBillingPage() {
  const [bills, setBills] = useState<IPDBill[]>([]);
  const [loading, setLoading] = useState(true);
  const [searchTerm, setSearchTerm] = useState("");

  useEffect(() => {
    const loadBills = async () => {
      try {
        const response = await fetch("http://127.0.0.1:8000/api/ipd/admissions");
        if (response.ok) {
          const admissions: IPDAdmission[] = await response.json();
          const allBills: IPDBill[] = [];

          admissions.forEach(adm => {
            if (adm.bills && adm.bills.length > 0) {
              adm.bills.forEach(bill => {
                (bill as any).patientName = adm.patient?.ptt_name || "Unknown";
                allBills.push(bill);
              });
            }
          });

          setBills(allBills);
        }
      } catch (e) {
        console.log("Error loading billing records:", e);
      } finally {
        setLoading(false);
      }
    };
    loadBills();
  }, []);

  const filteredBills = bills.filter(b => 
    b.bill_no.toLowerCase().includes(searchTerm.toLowerCase()) ||
    ((b as any).patientName || "").toLowerCase().includes(searchTerm.toLowerCase())
  );

  return (
    <div>
      <div className={styles.toolbar}>
        <div className={styles.searchBar}>
          <Search size={18} style={{ color: "var(--text-muted)" }} />
          <input
            type="text"
            placeholder="Search IPD bills by Patient Name or Invoice No..."
            value={searchTerm}
            onChange={(e) => setSearchTerm(e.target.value)}
          />
        </div>
      </div>

      {loading ? (
        <p style={{ color: "var(--text-secondary)", fontSize: "14px" }}>Loading IPD invoices...</p>
      ) : filteredBills.length === 0 ? (
        <div style={{ backgroundColor: "var(--bg-card)", border: "1px solid var(--border-light)", borderRadius: "16px", padding: "40px", textAlign: "center" }}>
          <p style={{ color: "var(--text-secondary)", fontSize: "13px" }}>No IPD billing records match the query.</p>
        </div>
      ) : (
        <div className={styles.tableContainer}>
          <table className={styles.table}>
            <thead>
              <tr>
                <th>Invoice No</th>
                <th>Patient Name</th>
                <th>Room Charges</th>
                <th>Service Charges</th>
                <th>Total Charges</th>
                <th>Discount</th>
                <th>Net Paid</th>
                <th>Status</th>
              </tr>
            </thead>
            <tbody>
              {filteredBills.map((b) => (
                <tr key={b.bill_id}>
                  <td style={{ fontWeight: 600, color: "var(--accent-color)" }}>{b.bill_no}</td>
                  <td style={{ fontWeight: 600 }}>{(b as any).patientName}</td>
                  <td>₹{b.room_charges.toLocaleString()}</td>
                  <td>₹{b.service_charges.toLocaleString()}</td>
                  <td>₹{b.total_amount.toLocaleString()}</td>
                  <td style={{ color: "var(--status-success)" }}>-₹{b.discount_amount.toLocaleString()}</td>
                  <td style={{ fontWeight: 700 }}>₹{b.net_amount.toLocaleString()}</td>
                  <td>
                    <span className={`${styles.badge} ${
                      b.status === "paid" ? styles.badgeSuccess :
                      b.status === "partial" ? styles.badgeWarning : styles.badgeDanger
                    }`}>
                      {b.status}
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
