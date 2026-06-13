"use client";

import React, { useEffect, useState } from "react";
import styles from "../../../dashboard.module.css";
import { ClipboardList, Search } from "lucide-react";

interface StockItem {
  SimCode: number;
  ItemName: string;
  GroupName: string;
  BatchNo?: string;
  ExpiryDate?: string;
  MRP: number;
  InwardQty: number;
  OutwardQty: number;
  CurrentStock: number;
}

export default function StockRegisterPage() {
  const [stock, setStock] = useState<StockItem[]>([]);
  const [loading, setLoading] = useState(true);
  const [searchTerm, setSearchTerm] = useState("");

  const fetchStock = async () => {
    try {
      const response = await fetch("http://127.0.0.1:8000/api/pharmacy/stock");
      if (response.ok) {
        setStock(await response.json());
      }
    } catch (e) {
      console.log("Error loading stock register:", e);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchStock();
  }, []);

  const filteredStock = stock.filter(item =>
    item.ItemName.toLowerCase().includes(searchTerm.toLowerCase()) ||
    (item.BatchNo && item.BatchNo.toLowerCase().includes(searchTerm.toLowerCase()))
  );

  return (
    <div>
      <div className={styles.toolbar}>
        <div className={styles.searchBar}>
          <Search size={18} style={{ color: "var(--text-muted)" }} />
          <input
            type="text"
            placeholder="Search stock register by brand or batch..."
            value={searchTerm}
            onChange={(e) => setSearchTerm(e.target.value)}
          />
        </div>
      </div>

      {loading ? (
        <p style={{ color: "var(--text-secondary)", fontSize: "14px" }}>Loading stock register...</p>
      ) : filteredStock.length === 0 ? (
        <div style={{ backgroundColor: "var(--bg-card)", border: "1px solid var(--border-light)", borderRadius: "16px", padding: "60px", textAlign: "center" }}>
          <ClipboardList size={40} style={{ color: "var(--text-muted)", marginBottom: "16px" }} />
          <h3 style={{ fontSize: "16px", marginBottom: "8px" }}>No Stock Records</h3>
          <p style={{ color: "var(--text-secondary)", fontSize: "13px" }}>No medicine inventories matched the filter criteria.</p>
        </div>
      ) : (
        <div className={styles.tableContainer}>
          <table className={styles.table}>
            <thead>
              <tr>
                <th>Item Code</th>
                <th>Brand Name</th>
                <th>Category</th>
                <th>Batch No</th>
                <th>MRP (₹)</th>
                <th>Expiry</th>
                <th>Total In</th>
                <th>Total Out</th>
                <th>Current Stock</th>
              </tr>
            </thead>
            <tbody>
              {filteredStock.map((item, idx) => (
                <tr key={idx}>
                  <td style={{ fontWeight: 600, color: "var(--accent-color)" }}>#MED-{item.SimCode}</td>
                  <td style={{ fontWeight: 600 }}>{item.ItemName}</td>
                  <td>{item.GroupName}</td>
                  <td style={{ fontFamily: "monospace" }}>{item.BatchNo || "N/A"}</td>
                  <td style={{ fontWeight: 600 }}>₹{(item.MRP || 0).toFixed(2)}</td>
                  <td>{item.ExpiryDate ? new Date(item.ExpiryDate).toLocaleDateString() : "N/A"}</td>
                  <td>{item.InwardQty}</td>
                  <td>{item.OutwardQty}</td>
                  <td>
                    <span className={`${styles.badge} ${
                      item.CurrentStock > 100 ? styles.badgeSuccess : 
                      item.CurrentStock > 0 ? styles.badgeWarning : styles.badgeDanger
                    }`}>
                      {item.CurrentStock} units
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
