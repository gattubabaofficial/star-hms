"use client";

import React, { useState } from "react";
import styles from "../../../dashboard.module.css";
import { Plus, Share2, Search, ArrowDownRight, ArrowUpRight } from "lucide-react";

interface Referral {
  id: number;
  name: string;
  type: "inward" | "outward";
  specialty: string;
  hospital: string;
  telephone: string;
  share_percent: number;
}

export default function ReferralMasterPage() {
  const [referrals, setReferrals] = useState<Referral[]>([
    { id: 1, name: "Dr. A. K. Sharma", type: "inward", specialty: "Cardiology", hospital: "City Heart Center", telephone: "9812345678", share_percent: 10 },
    { id: 2, name: "Dr. Priya Patel", type: "inward", specialty: "Pediatrics", hospital: "Shishu Hospital", telephone: "9823456789", share_percent: 15 },
    { id: 3, name: "Metro Diagnostic Labs", type: "outward", specialty: "Radiology/MRI", hospital: "Metro Diagnostics", telephone: "9876543210", share_percent: 5 },
    { id: 4, name: "Apex Multi-Specialty Clinic", type: "outward", specialty: "Neurology", hospital: "Apex Hospital", telephone: "9898989898", share_percent: 12 },
  ]);

  const [activeTab, setActiveTab] = useState<"inward" | "outward">("inward");
  const [searchTerm, setSearchTerm] = useState("");
  const [modalOpen, setModalOpen] = useState(false);

  const [formData, setFormData] = useState({
    name: "",
    specialty: "",
    hospital: "",
    telephone: "",
    share_percent: "10"
  });

  const handleInputChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    const { name, value } = e.target;
    setFormData(prev => ({ ...prev, [name]: value }));
  };

  const handleAddReferral = (e: React.FormEvent) => {
    e.preventDefault();
    if (!formData.name.trim()) return;

    const newRef: Referral = {
      id: referrals.length + 1,
      name: formData.name,
      type: activeTab,
      specialty: formData.specialty || "General Practitioner",
      hospital: formData.hospital || "Independent Clinic",
      telephone: formData.telephone || "-",
      share_percent: Number(formData.share_percent)
    };

    setReferrals(prev => [...prev, newRef]);
    setFormData({ name: "", specialty: "", hospital: "", telephone: "", share_percent: "10" });
    setModalOpen(false);
  };

  const filteredReferrals = referrals.filter(ref => 
    ref.type === activeTab &&
    (ref.name.toLowerCase().includes(searchTerm.toLowerCase()) ||
     ref.specialty.toLowerCase().includes(searchTerm.toLowerCase()) ||
     ref.hospital.toLowerCase().includes(searchTerm.toLowerCase()))
  );

  return (
    <div>
      {/* Category Tabs */}
      <div style={{ display: "flex", gap: "12px", borderBottom: "1px solid var(--border-light)", paddingBottom: "12px", marginBottom: "20px" }}>
        <button 
          onClick={() => setActiveTab("inward")}
          style={{
            padding: "8px 16px",
            borderRadius: "8px",
            border: "none",
            cursor: "pointer",
            fontWeight: 600,
            fontSize: "14px",
            display: "flex",
            alignItems: "center",
            gap: "8px",
            backgroundColor: activeTab === "inward" ? "var(--accent-light)" : "transparent",
            color: activeTab === "inward" ? "var(--accent-color)" : "var(--text-secondary)"
          }}
        >
          <ArrowDownRight size={16} />
          Inward Referrals (Referred By)
        </button>
        <button 
          onClick={() => setActiveTab("outward")}
          style={{
            padding: "8px 16px",
            borderRadius: "8px",
            border: "none",
            cursor: "pointer",
            fontWeight: 600,
            fontSize: "14px",
            display: "flex",
            alignItems: "center",
            gap: "8px",
            backgroundColor: activeTab === "outward" ? "var(--accent-light)" : "transparent",
            color: activeTab === "outward" ? "var(--accent-color)" : "var(--text-secondary)"
          }}
        >
          <ArrowUpRight size={16} />
          Outward Referrals (Referred To)
        </button>
      </div>

      <div className={styles.toolbar}>
        <div className={styles.searchBar}>
          <Search size={18} style={{ color: "var(--text-muted)" }} />
          <input
            type="text"
            placeholder={`Search ${activeTab} referrers...`}
            value={searchTerm}
            onChange={(e) => setSearchTerm(e.target.value)}
          />
        </div>
        <button className={styles.primaryBtn} onClick={() => setModalOpen(true)}>
          <Plus size={18} />
          <span>Add Referrer</span>
        </button>
      </div>

      {filteredReferrals.length === 0 ? (
        <div style={{ backgroundColor: "var(--bg-card)", border: "1px solid var(--border-light)", borderRadius: "16px", padding: "60px", textAlign: "center" }}>
          <Share2 size={40} style={{ color: "var(--text-muted)", marginBottom: "16px" }} />
          <h3 style={{ fontSize: "16px", marginBottom: "8px" }}>No Referrals Found</h3>
          <p style={{ color: "var(--text-secondary)", fontSize: "13px" }}>No referral sources listed under this category.</p>
        </div>
      ) : (
        <div className={styles.tableContainer}>
          <table className={styles.table}>
            <thead>
              <tr>
                <th>Name</th>
                <th>Specialty</th>
                <th>Hospital/Clinic</th>
                <th>Telephone</th>
                <th>Share %</th>
              </tr>
            </thead>
            <tbody>
              {filteredReferrals.map((ref) => (
                <tr key={ref.id}>
                  <td style={{ fontWeight: 600, color: "var(--text-primary)" }}>{ref.name}</td>
                  <td>{ref.specialty}</td>
                  <td>{ref.hospital}</td>
                  <td>{ref.telephone}</td>
                  <td style={{ fontWeight: 600, color: "var(--accent-color)" }}>{ref.share_percent}%</td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      )}

      {modalOpen && (
        <div className={styles.modalOverlay}>
          <div className={styles.modalContent} style={{ maxWidth: "500px" }}>
            <div className={styles.modalHeader}>
              <h3 style={{ fontSize: "18px", fontWeight: 600 }}>
                Add {activeTab === "inward" ? "Inward Referrer" : "Outward Referrer"}
              </h3>
              <button className={styles.closeBtn} onClick={() => setModalOpen(false)}>×</button>
            </div>
            <form onSubmit={handleAddReferral}>
              <div className={styles.modalBody}>
                <div className={styles.formGroup}>
                  <label>Referrer Name *</label>
                  <input
                    type="text"
                    name="name"
                    className={styles.formControl}
                    value={formData.name}
                    onChange={handleInputChange}
                    placeholder="e.g. Dr. Jane Doe"
                    required
                  />
                </div>

                <div className={styles.formGrid}>
                  <div className={styles.formGroup}>
                    <label>Specialty</label>
                    <input
                      type="text"
                      name="specialty"
                      className={styles.formControl}
                      value={formData.specialty}
                      onChange={handleInputChange}
                      placeholder="e.g. Pediatrics"
                    />
                  </div>
                  <div className={styles.formGroup}>
                    <label>Discount / Share (%)</label>
                    <input
                      type="number"
                      name="share_percent"
                      className={styles.formControl}
                      value={formData.share_percent}
                      onChange={handleInputChange}
                    />
                  </div>
                </div>

                <div className={styles.formGrid}>
                  <div className={styles.formGroup}>
                    <label>Affiliated Hospital</label>
                    <input
                      type="text"
                      name="hospital"
                      className={styles.formControl}
                      value={formData.hospital}
                      onChange={handleInputChange}
                      placeholder="e.g. General Clinic"
                    />
                  </div>
                  <div className={styles.formGroup}>
                    <label>Telephone</label>
                    <input
                      type="text"
                      name="telephone"
                      className={styles.formControl}
                      value={formData.telephone}
                      onChange={handleInputChange}
                    />
                  </div>
                </div>
              </div>
              <div className={styles.modalFooter}>
                <button type="button" className={styles.secondaryBtn} onClick={() => setModalOpen(false)}>Cancel</button>
                <button type="submit" className={styles.primaryBtn}>Save Referrer</button>
              </div>
            </form>
          </div>
        </div>
      )}
    </div>
  );
}
