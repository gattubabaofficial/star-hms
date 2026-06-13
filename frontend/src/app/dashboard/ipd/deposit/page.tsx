"use client";

import React, { useEffect, useState } from "react";
import styles from "../../../dashboard.module.css";
import { Search, Plus, PiggyBank } from "lucide-react";

interface DepositRecord {
  ipd_code: number;
  patient_name: string;
  bed_name: string;
  deposit_amount: number;
  admission_date: string;
}

export default function IPDDepositPage() {
  const [deposits, setDeposits] = useState<DepositRecord[]>([]);
  const [loading, setLoading] = useState(true);
  const [searchTerm, setSearchTerm] = useState("");

  useEffect(() => {
    const fetchDeposits = async () => {
      try {
        const response = await fetch("http://127.0.0.1:8000/api/ipd/admissions");
        if (response.ok) {
          const admissions = await response.json();
          const records = admissions.map((a: any) => ({
            ipd_code: a.ipd_code,
            patient_name: a.patient?.ptt_name || "Unknown",
            bed_name: a.bed?.bdm_name || "-",
            deposit_amount: a.ipd_deposit,
            admission_date: new Date(a.ipd_admission_date).toLocaleString("en-IN", { dateStyle: "short" })
          }));
          setDeposits(records);
        }
      } catch (e) {
        console.log("Error fetching deposits:", e);
      } finally {
        setLoading(false);
      }
    };
    fetchDeposits();
  }, []);

  const filteredDeposits = deposits.filter(d =>
    d.patient_name.toLowerCase().includes(searchTerm.toLowerCase()) ||
    d.bed_name.toLowerCase().includes(searchTerm.toLowerCase())
  );

  return (
    <div>
      <div className={styles.toolbar}>
        <div className={styles.searchBar}>
          <Search size={18} style={{ color: "var(--text-muted)" }} />
          <input
            type="text"
            placeholder="Search deposits by Patient or Bed..."
            value={searchTerm}
            onChange={(e) => setSearchTerm(e.target.value)}
          />
        </div>
      </div>

      {loading ? (
        <p style={{ color: "var(--text-secondary)", fontSize: "14px" }}>Loading deposit registry...</p>
      ) : filteredDeposits.length === 0 ? (
        <div style={{ backgroundColor: "var(--bg-card)", border: "1px solid var(--border-light)", borderRadius: "16px", padding: "60px", textAlign: "center" }}>
          <PiggyBank size={40} style={{ color: "var(--text-muted)", marginBottom: "16px" }} />
          <h3 style={{ fontSize: "16px", marginBottom: "8px" }}>No Deposits Recorded</h3>
          <p style={{ color: "var(--text-secondary)", fontSize: "13px" }}>No advance deposits logged.</p>
        </div>
      ) : (
        <div className={styles.tableContainer} style={{ maxWidth: "800px" }}>
          <table className={styles.table}>
            <thead>
              <tr>
                <th>Adm Ref</th>
                <th>Admission Date</th>
                <th>Patient Name</th>
                <th>Allocated Bed</th>
                <th>Advance Deposit Amount</th>
              </tr>
            </thead>
            <tbody>
              {filteredDeposits.map((d) => (
                <tr key={d.ipd_code}>
                  <td style={{ fontWeight: 600, color: "var(--accent-color)" }}>#IPD-{d.ipd_code}</td>
                  <td>{d.admission_date}</td>
                  <td style={{ fontWeight: 600 }}>{d.patient_name}</td>
                  <td>{d.bed_name}</td>
                  <td style={{ fontWeight: 700, color: "var(--status-success)" }}>₹{d.deposit_amount.toLocaleString()}</td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      )}
    </div>
  );
}
