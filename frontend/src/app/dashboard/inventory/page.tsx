"use client";

import React, { useEffect, useState } from "react";
import styles from "../../dashboard.module.css";
import { Plus, Search, Package, Users, Truck } from "lucide-react";

interface SupplierParty {
  code: number;
  name: string;
  contact_person: string;
  phone: string;
  balance: number;
}

export default function InventoryPage() {
  const [activeTab, setActiveTab] = useState<"suppliers" | "items">("suppliers");
  const [searchTerm, setSearchTerm] = useState("");
  const [loading, setLoading] = useState(true);

  const [suppliers, setSuppliers] = useState<SupplierParty[]>([
    { code: 1, name: "Jaipur Surgicals & Chemicals", contact_person: "Mr. Rajendra Prasad", phone: "9414012345", balance: 12500.0 },
    { code: 2, name: "Meditech Systems", contact_person: "Mr. Satish Verma", phone: "9829098765", balance: 0.0 },
    { code: 3, name: "Ambika Distributors", contact_person: "Mr. Anil Sharma", phone: "9314055443", balance: 5400.0 },
  ]);

  useEffect(() => {
    const timer = setTimeout(() => setLoading(false), 300);
    return () => clearTimeout(timer);
  }, []);

  const filteredSuppliers = suppliers.filter(sup => 
    sup.name.toLowerCase().includes(searchTerm.toLowerCase()) ||
    sup.contact_person.toLowerCase().includes(searchTerm.toLowerCase())
  );

  return (
    <div>
      {/* Sub tabs */}
      <div style={{ display: "flex", gap: "12px", marginBottom: "24px" }}>
        <button 
          className={activeTab === "suppliers" ? styles.primaryBtn : styles.secondaryBtn} 
          onClick={() => setActiveTab("suppliers")}
          style={{ gap: "8px" }}
        >
          <Truck size={16} /> Supplier Party Directory
        </button>
        <button 
          className={activeTab === "items" ? styles.primaryBtn : styles.secondaryBtn} 
          onClick={() => setActiveTab("items")}
          style={{ gap: "8px" }}
        >
          <Package size={16} /> Hospital Stock items
        </button>
      </div>

      {/* Toolbar */}
      <div className={styles.toolbar}>
        <div className={styles.searchBar}>
          <Search size={18} style={{ color: "var(--text-secondary)" }} />
          <input
            type="text"
            placeholder={activeTab === "suppliers" ? "Search suppliers..." : "Search items catalog..."}
            value={searchTerm}
            onChange={(e) => setSearchTerm(e.target.value)}
          />
        </div>
        
        <button className={styles.primaryBtn}>
          <Plus size={18} />
          <span>Add New</span>
        </button>
      </div>

      {/* Grid Layout */}
      {loading ? (
        <p style={{ color: "var(--text-secondary)", fontSize: "14px" }}>Loading inventory logs...</p>
      ) : activeTab === "suppliers" ? (
        <div className={styles.tableContainer}>
          <table className={styles.table}>
            <thead>
              <tr>
                <th>Code</th>
                <th>Supplier Name</th>
                <th>Contact Representative</th>
                <th>Phone Number</th>
                <th>Current Ledger Balance</th>
                <th>Status</th>
              </tr>
            </thead>
            <tbody>
              {filteredSuppliers.map((sup) => (
                <tr key={sup.code}>
                  <td style={{ fontWeight: 600, color: "var(--accent-color)" }}>#SUP-{sup.code}</td>
                  <td style={{ fontWeight: 600 }}>{sup.name}</td>
                  <td>{sup.contact_person}</td>
                  <td>{sup.phone || "--"}</td>
                  <td style={{ fontWeight: 700 }}>₹{sup.balance.toFixed(2)}</td>
                  <td>
                    <span className={`${styles.badge} ${sup.balance > 0 ? styles.badgeWarning : styles.badgeSuccess}`}>
                      {sup.balance > 0 ? "Pending Dues" : "Settled"}
                    </span>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      ) : (
        <div style={{ backgroundColor: "var(--bg-card)", border: "1px solid var(--border-light)", borderRadius: "16px", padding: "80px", textAlign: "center" }}>
          <Package size={48} style={{ color: "var(--text-muted)", marginBottom: "16px" }} />
          <h3 style={{ fontSize: "18px", marginBottom: "8px" }}>No Stock Records</h3>
          <p style={{ color: "var(--text-secondary)", fontSize: "14px", marginBottom: "20px" }}>No hospital items cataloged in inventory.</p>
          <button className={styles.primaryBtn} style={{ margin: "0 auto" }}>Add Inventory Item</button>
        </div>
      )}
    </div>
  );
}
