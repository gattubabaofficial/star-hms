"use client";

import React, { useState } from "react";
import styles from "../../../dashboard.module.css";
import { Plus, Box, Search } from "lucide-react";

interface HealthPackage {
  id: number;
  name: string;
  price: number;
  discount: number; // percentage
  tests: string[];
  status: "active" | "inactive";
}

export default function PackageMasterPage() {
  const [packages, setPackages] = useState<HealthPackage[]>([
    { id: 1, name: "Basic Health Checkup", price: 1500, discount: 10, tests: ["Complete Blood Count (CBC)", "Urine Routine", "Fasting Blood Sugar"], status: "active" },
    { id: 2, name: "Executive Male Wellness Bundle", price: 5500, discount: 15, tests: ["CBC", "Lipid Profile", "Liver Function Test (LFT)", "Kidney Function Test (KFT)", "ECG", "Chest X-Ray"], status: "active" },
    { id: 3, name: "Cardiac Screening Package", price: 7500, discount: 20, tests: ["Lipid Profile", "ECG", "Echocardiogram (Echo)", "TMT (Treadmill Test)", "Cardiologist Consultation"], status: "active" },
    { id: 4, name: "Women Comprehensive Wellness Check", price: 6000, discount: 15, tests: ["CBC", "LFT", "KFT", "Thyroid Profile (T3, T4, TSH)", "Pap Smear", "Pelvic Ultrasound"], status: "active" },
  ]);

  const [searchTerm, setSearchTerm] = useState("");
  const [modalOpen, setModalOpen] = useState(false);

  const [formData, setFormData] = useState({
    name: "",
    price: "2000",
    discount: "10",
    testsText: ""
  });

  const handleInputChange = (e: React.ChangeEvent<HTMLInputElement | HTMLTextAreaElement>) => {
    const { name, value } = e.target;
    setFormData(prev => ({ ...prev, [name]: value }));
  };

  const handleAddPackage = (e: React.FormEvent) => {
    e.preventDefault();
    if (!formData.name.trim()) return;

    const testList = formData.testsText
      ? formData.testsText.split(",").map(t => t.trim()).filter(Boolean)
      : ["General Clinical Screening"];

    const newPkg: HealthPackage = {
      id: packages.length + 1,
      name: formData.name,
      price: Number(formData.price),
      discount: Number(formData.discount),
      tests: testList,
      status: "active"
    };

    setPackages(prev => [...prev, newPkg]);
    setFormData({ name: "", price: "2000", discount: "10", testsText: "" });
    setModalOpen(false);
  };

  const filteredPackages = packages.filter(pkg =>
    pkg.name.toLowerCase().includes(searchTerm.toLowerCase())
  );

  return (
    <div>
      <div className={styles.toolbar}>
        <div className={styles.searchBar}>
          <Search size={18} style={{ color: "var(--text-muted)" }} />
          <input
            type="text"
            placeholder="Search health checkup packages..."
            value={searchTerm}
            onChange={(e) => setSearchTerm(e.target.value)}
          />
        </div>
        <button className={styles.primaryBtn} onClick={() => setModalOpen(true)}>
          <Plus size={18} />
          <span>Add Package</span>
        </button>
      </div>

      <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fill, minmax(320px, 1fr))", gap: "24px" }}>
        {filteredPackages.map((pkg) => (
          <div 
            key={pkg.id} 
            className={styles.sectionBox}
            style={{ 
              display: "flex", 
              flexDirection: "column", 
              justifyContent: "space-between", 
              minHeight: "260px",
              boxShadow: "0 4px 6px -1px rgba(0,0,0,0.02)"
            }}
          >
            <div>
              <div style={{ display: "flex", justifyContent: "space-between", alignItems: "flex-start", marginBottom: "12px" }}>
                <strong style={{ fontSize: "16px", color: "var(--text-primary)" }}>{pkg.name}</strong>
                <span className={`${styles.badge} ${styles.badgeSuccess}`}>
                  {pkg.status}
                </span>
              </div>
              <p style={{ color: "var(--text-secondary)", fontSize: "13px", marginBottom: "16px" }}>
                Included diagnostics:
              </p>
              <ul style={{ paddingLeft: "16px", fontSize: "12px", color: "var(--text-secondary)", display: "flex", flexDirection: "column", gap: "6px" }}>
                {pkg.tests.map((test, index) => (
                  <li key={index}>{test}</li>
                ))}
              </ul>
            </div>
            
            <div style={{ borderTop: "1px solid var(--border-light)", paddingTop: "14px", marginTop: "16px", display: "flex", justifyContent: "space-between", alignItems: "center" }}>
              <div style={{ display: "flex", flexDirection: "column" }}>
                <span style={{ fontSize: "11px", color: "var(--text-secondary)" }}>Package Cost</span>
                <strong style={{ fontSize: "18px", color: "var(--accent-color)" }}>₹{pkg.price}</strong>
              </div>
              <div style={{ display: "flex", flexDirection: "column", alignItems: "flex-end" }}>
                <span style={{ fontSize: "11px", color: "var(--text-secondary)" }}>Group Discount</span>
                <strong style={{ fontSize: "14px", color: "var(--status-success)" }}>{pkg.discount}% OFF</strong>
              </div>
            </div>
          </div>
        ))}
      </div>

      {modalOpen && (
        <div className={styles.modalOverlay}>
          <div className={styles.modalContent} style={{ maxWidth: "500px" }}>
            <div className={styles.modalHeader}>
              <h3 style={{ fontSize: "18px", fontWeight: 600 }}>Create Health Checkup Package</h3>
              <button className={styles.closeBtn} onClick={() => setModalOpen(false)}>×</button>
            </div>
            <form onSubmit={handleAddPackage}>
              <div className={styles.modalBody}>
                <div className={styles.formGroup}>
                  <label>Package Name *</label>
                  <input
                    type="text"
                    name="name"
                    className={styles.formControl}
                    placeholder="e.g. Senior Citizen Complete Care"
                    value={formData.name}
                    onChange={handleInputChange}
                    required
                  />
                </div>

                <div className={styles.formGrid}>
                  <div className={styles.formGroup}>
                    <label>Standard Base Price (₹) *</label>
                    <input
                      type="number"
                      name="price"
                      className={styles.formControl}
                      value={formData.price}
                      onChange={handleInputChange}
                      required
                    />
                  </div>
                  <div className={styles.formGroup}>
                    <label>Discount Option (%)</label>
                    <input
                      type="number"
                      name="discount"
                      className={styles.formControl}
                      value={formData.discount}
                      onChange={handleInputChange}
                    />
                  </div>
                </div>

                <div className={styles.formGroup}>
                  <label>Included Labs & Services (Comma separated)</label>
                  <textarea
                    name="testsText"
                    rows={3}
                    className={styles.formControl}
                    placeholder="e.g. Fasting Glucose, ECG, Serum Creatinine"
                    value={formData.testsText}
                    onChange={handleInputChange}
                    style={{ resize: "vertical" }}
                  />
                </div>
              </div>
              <div className={styles.modalFooter}>
                <button type="button" className={styles.secondaryBtn} onClick={() => setModalOpen(false)}>Cancel</button>
                <button type="submit" className={styles.primaryBtn}>Save Package</button>
              </div>
            </form>
          </div>
        </div>
      )}
    </div>
  );
}
