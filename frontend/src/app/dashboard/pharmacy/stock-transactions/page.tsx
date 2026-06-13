"use client";

import React, { useEffect, useState } from "react";
import styles from "../../../dashboard.module.css";
import { Search, ArrowDownRight, ArrowUpRight } from "lucide-react";

interface Medicine {
  SimCode: number;
  SimName: string;
}

interface Transaction {
  Date: string;
  Type: "Purchase" | "Sale";
  VchNo: number;
  BatchNo: string;
  QtyIn: number;
  QtyOut: number;
  Rate: number;
  Balance: number;
}

export default function StockTransactionsPage() {
  const [medicines, setMedicines] = useState<Medicine[]>([]);
  const [transactions, setTransactions] = useState<Transaction[]>([]);
  const [loading, setLoading] = useState(true);
  const [selectedMedCode, setSelectedMedCode] = useState("");

  useEffect(() => {
    const loadMeds = async () => {
      try {
        const res = await fetch("http://127.0.0.1:8000/api/pharmacy/items");
        if (res.ok) {
          const data = await res.json();
          setMedicines(data);
          if (data.length > 0) setSelectedMedCode(String(data[0].SimCode));
        }
      } catch (e) {
        console.log("Error loading medicines catalog:", e);
      } finally {
        setLoading(false);
      }
    };
    loadMeds();
  }, []);

  useEffect(() => {
    if (!selectedMedCode) return;
    const loadTransactions = async () => {
      try {
        const response = await fetch(`http://127.0.0.1:8000/api/pharmacy/transactions/${selectedMedCode}`);
        if (response.ok) {
          setTransactions(await response.json());
        }
      } catch (e) {
        console.log("Error loading transactions:", e);
      }
    };
    loadTransactions();
  }, [selectedMedCode]);

  return (
    <div>
      <div className={styles.toolbar} style={{ justifyContent: "flex-start", gap: "16px" }}>
        <div className={styles.formGroup} style={{ marginBottom: 0, minWidth: "280px" }}>
          <label htmlFor="medicineSelector" style={{ fontSize: "11px", fontWeight: 700, textTransform: "uppercase" }}>
            Select Medicine Audit Target
          </label>
          <select
            id="medicineSelector"
            className={styles.formControl}
            value={selectedMedCode}
            onChange={(e) => setSelectedMedCode(e.target.value)}
          >
            {medicines.map(m => (
              <option key={m.SimCode} value={m.SimCode}>{m.SimName}</option>
            ))}
          </select>
        </div>
      </div>

      {loading ? (
        <p style={{ color: "var(--text-secondary)", fontSize: "14px" }}>Loading movement logs...</p>
      ) : transactions.length === 0 ? (
        <div style={{ backgroundColor: "var(--bg-card)", border: "1px solid var(--border-light)", borderRadius: "16px", padding: "60px", textAlign: "center" }}>
          <p style={{ color: "var(--text-secondary)", fontSize: "13px" }}>No stock transactions registered for this medicine.</p>
        </div>
      ) : (
        <div className={styles.tableContainer}>
          <table className={styles.table}>
            <thead>
              <tr>
                <th>Transaction Date</th>
                <th>Movement Type</th>
                <th>Voucher Reference</th>
                <th>Batch Number</th>
                <th>Cost/MRP Rate</th>
                <th>Qty Added (In)</th>
                <th>Qty Deducted (Out)</th>
                <th>Running Balance</th>
              </tr>
            </thead>
            <tbody>
              {transactions.map((t, idx) => (
                <tr key={idx}>
                  <td>{new Date(t.Date).toLocaleDateString()}</td>
                  <td>
                    <span style={{ display: "inline-flex", alignItems: "center", gap: "6px", fontWeight: 600 }}>
                      {t.Type === "Purchase" ? (
                        <>
                          <ArrowDownRight size={14} style={{ color: "var(--status-success)" }} />
                          <span style={{ color: "var(--status-success)" }}>Stock Inward</span>
                        </>
                      ) : (
                        <>
                          <ArrowUpRight size={14} style={{ color: "var(--accent-color)" }} />
                          <span style={{ color: "var(--accent-color)" }}>POS Sale</span>
                        </>
                      )}
                    </span>
                  </td>
                  <td style={{ fontWeight: 600 }}>#VCH-{t.VchNo}</td>
                  <td style={{ fontFamily: "monospace" }}>{t.BatchNo}</td>
                  <td>₹{t.Rate.toFixed(2)}</td>
                  <td style={{ color: "var(--status-success)", fontWeight: 600 }}>{t.QtyIn > 0 ? `+${t.QtyIn}` : "-"}</td>
                  <td style={{ color: "var(--accent-color)", fontWeight: 600 }}>{t.QtyOut > 0 ? `-${t.QtyOut}` : "-"}</td>
                  <td style={{ fontWeight: 700 }}>{t.Balance} units</td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      )}
    </div>
  );
}
