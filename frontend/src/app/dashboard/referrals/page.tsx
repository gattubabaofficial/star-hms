"use client";

import React, { useEffect, useState } from "react";
import styles from "../../dashboard.module.css";
import { Plus, Search, Share2, Award, HeartHandshake } from "lucide-react";

interface ReferralChannel {
  code: number;
  name: string;
  specialty: string;
  address: string;
  phone: string;
  commission: number;
}

export default function ReferralsPage() {
  const [activeTab, setActiveTab] = useState<"by" | "to">("by");
  const [searchTerm, setSearchTerm] = useState("");
  const [loading, setLoading] = useState(true);

  // Mock initial data matching legacy database
  const [referredBy, setReferredBy] = useState<ReferralChannel[]>([
    { code: 1, name: "Dr. Alok Sharma", specialty: "General Physician", address: "Malviya Nagar, Jaipur", phone: "9829011111", commission: 10.0 },
    { code: 2, name: "Dr. K.K. Saini", specialty: "Orthopedic", address: "Sodala, Jaipur", phone: "9829022222", commission: 15.0 },
    { code: 3, name: "Dr. Sunita Gupta", specialty: "Gynaecologist", address: "Vaishali Nagar, Jaipur", phone: "9829033333", commission: 12.0 },
  ]);

  const [referredTo, setReferredTo] = useState<ReferralChannel[]>([
    { code: 1, name: "Apex Hospital", specialty: "Multi-Specialty", address: "Mansarovar, Jaipur", phone: "0141-2780650", commission: 5.0 },
    { code: 2, name: "Fortis Escorts", specialty: "Cardiac Sciences", address: "JLN Marg, Jaipur", phone: "0141-2547000", commission: 8.0 },
  ]);

  useEffect(() => {
    // Simulate API fetch delay
    const timer = setTimeout(() => setLoading(false), 300);
    return () => clearTimeout(timer);
  }, []);

  const listToSearch = activeTab === "by" ? referredBy : referredTo;
  const filteredList = listToSearch.filter(item => 
    item.name.toLowerCase().includes(searchTerm.toLowerCase()) ||
    item.specialty.toLowerCase().includes(searchTerm.toLowerCase()) ||
    item.phone.includes(searchTerm)
  );

  return (
    <div>
      {/* Sub tabs */}
      <div style={{ display: "flex", gap: "12px", marginBottom: "24px" }}>
        <button 
          className={activeTab === "by" ? styles.primaryBtn : styles.secondaryBtn} 
          onClick={() => { setActiveTab("by"); setSearchTerm(""); }}
          style={{ gap: "8px" }}
        >
          <Award size={16} /> Referred By (Inward Channels)
        </button>
        <button 
          className={activeTab === "to" ? styles.primaryBtn : styles.secondaryBtn} 
          onClick={() => { setActiveTab("to"); setSearchTerm(""); }}
          style={{ gap: "8px" }}
        >
          <HeartHandshake size={16} /> Referred To (Outward Channels)
        </button>
      </div>

      {/* Toolbar */}
      <div className={styles.toolbar}>
        <div className={styles.searchBar}>
          <Search size={18} style={{ color: "var(--text-secondary)" }} />
          <input
            type="text"
            placeholder={activeTab === "by" ? "Search doctors referred by..." : "Search clinics referred to..."}
            value={searchTerm}
            onChange={(e) => setSearchTerm(e.target.value)}
          />
        </div>
        
        <button className={styles.primaryBtn}>
          <Plus size={18} />
          <span>Add Channel</span>
        </button>
      </div>

      {/* Grid Table */}
      {loading ? (
        <p style={{ color: "var(--text-secondary)", fontSize: "14px" }}>Loading referral directories...</p>
      ) : filteredList.length === 0 ? (
        <div style={{ backgroundColor: "var(--bg-card)", border: "1px solid var(--border-light)", borderRadius: "16px", padding: "60px", textAlign: "center" }}>
          <Share2 size={48} style={{ color: "var(--text-muted)", marginBottom: "16px" }} />
          <h3 style={{ fontSize: "18px", marginBottom: "8px" }}>No Channels Found</h3>
          <p style={{ color: "var(--text-secondary)", fontSize: "14px", marginBottom: "20px" }}>No channel configurations exist for this selection.</p>
        </div>
      ) : (
        <div className={styles.tableContainer}>
          <table className={styles.table}>
            <thead>
              <tr>
                <th>Code</th>
                <th>Channel Name</th>
                <th>Specialty/Type</th>
                <th>Address</th>
                <th>Telephone</th>
                <th>Share / Comm %</th>
              </tr>
            </thead>
            <tbody>
              {filteredList.map((item) => (
                <tr key={item.code}>
                  <td style={{ fontWeight: 600, color: "var(--accent-color)" }}>#{item.code}</td>
                  <td style={{ fontWeight: 600 }}>{item.name}</td>
                  <td>
                    <span className={`${styles.badge} ${styles.badgeAccent}`}>{item.specialty}</span>
                  </td>
                  <td>{item.address || "--"}</td>
                  <td>{item.phone || "--"}</td>
                  <td style={{ fontWeight: 600 }}>{item.commission}%</td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      )}
    </div>
  );
}
