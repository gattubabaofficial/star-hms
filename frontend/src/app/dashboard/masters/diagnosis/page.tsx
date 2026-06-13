"use client";

import React, { useState } from "react";
import styles from "../../../dashboard.module.css";
import { Plus, Search, Heart, ShieldAlert } from "lucide-react";

interface Diagnosis {
  code: string;
  name: string;
  category: string;
  severity: "low" | "medium" | "high";
}

export default function DiagnosisICDPage() {
  const [diagnoses, setDiagnoses] = useState<Diagnosis[]>([]);
  const [searchTerm, setSearchTerm] = useState("");
  const [modalOpen, setModalOpen] = useState(false);
  
  const [formData, setFormData] = useState({
    code: "",
    name: "",
    category: "Cardiology",
    severity: "medium" as "low" | "medium" | "high"
  });

  // Default seeded list
  React.useEffect(() => {
    setDiagnoses([
      { code: "I10", name: "Essential (primary) hypertension", category: "Cardiology", severity: "medium" },
      { code: "E11.9", name: "Type 2 diabetes mellitus without complications", category: "Endocrinology", severity: "medium" },
      { code: "J20.9", name: "Acute bronchitis, unspecified", category: "Pulmonology", severity: "low" },
      { code: "M54.5", name: "Low back pain", category: "Orthopedics", severity: "low" },
      { code: "K21.9", name: "Gastro-esophageal reflux disease without esophagitis", category: "Gastroenterology", severity: "low" },
      { code: "I25.10", name: "Atherosclerotic heart disease of native coronary artery", category: "Cardiology", severity: "high" },
      { code: "N39.0", name: "Urinary tract infection, site not specified", category: "Urology", severity: "medium" },
    ]);
  }, []);

  const handleAddDiagnosis = (e: React.FormEvent) => {
    e.preventDefault();
    if (!formData.code.trim() || !formData.name.trim()) return;

    setDiagnoses(prev => [
      {
        code: formData.code.toUpperCase(),
        name: formData.name,
        category: formData.category,
        severity: formData.severity
      },
      ...prev
    ]);

    setFormData({ code: "", name: "", category: "Cardiology", severity: "medium" });
    setModalOpen(false);
  };

  const filteredDiagnoses = diagnoses.filter(d =>
    d.code.toLowerCase().includes(searchTerm.toLowerCase()) ||
    d.name.toLowerCase().includes(searchTerm.toLowerCase()) ||
    d.category.toLowerCase().includes(searchTerm.toLowerCase())
  );

  return (
    <div>
      <div className={styles.toolbar}>
        <div className={styles.searchBar}>
          <Search size={18} style={{ color: "var(--text-muted)" }} />
          <input
            type="text"
            placeholder="Search diagnosis directory by ICD code or name..."
            value={searchTerm}
            onChange={(e) => setSearchTerm(e.target.value)}
          />
        </div>
        <button className={styles.primaryBtn} onClick={() => setModalOpen(true)}>
          <Plus size={18} />
          <span>Add ICD Code</span>
        </button>
      </div>

      <div className={styles.tableContainer}>
        <table className={styles.table}>
          <thead>
            <tr>
              <th>ICD-10 Code</th>
              <th>Diagnosis Description</th>
              <th>Category / Department</th>
              <th>Risk Severity</th>
            </tr>
          </thead>
          <tbody>
            {filteredDiagnoses.map((diag) => (
              <tr key={diag.code}>
                <td style={{ fontWeight: 700, color: "var(--accent-color)" }}>{diag.code}</td>
                <td style={{ fontWeight: 600 }}>{diag.name}</td>
                <td>{diag.category}</td>
                <td>
                  <span className={`${styles.badge} ${
                    diag.severity === "high" ? styles.badgeDanger :
                    diag.severity === "medium" ? styles.badgeWarning : styles.badgeSuccess
                  }`}>
                    {diag.severity}
                  </span>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>

      {modalOpen && (
        <div className={styles.modalOverlay}>
          <div className={styles.modalContent} style={{ maxWidth: "480px" }}>
            <div className={styles.modalHeader}>
              <h3 style={{ fontSize: "18px", fontWeight: 600 }}>Add Clinical ICD Code</h3>
              <button className={styles.closeBtn} onClick={() => setModalOpen(false)}>×</button>
            </div>
            <form onSubmit={handleAddDiagnosis}>
              <div className={styles.modalBody}>
                <div className={styles.formGrid}>
                  <div className={styles.formGroup}>
                    <label>ICD-10 Code *</label>
                    <input
                      type="text"
                      className={styles.formControl}
                      placeholder="e.g. I10, E11.9"
                      value={formData.code}
                      onChange={(e) => setFormData(prev => ({ ...prev, code: e.target.value }))}
                      required
                    />
                  </div>
                  <div className={styles.formGroup}>
                    <label>Risk Level</label>
                    <select
                      className={styles.formControl}
                      value={formData.severity}
                      onChange={(e) => setFormData(prev => ({ ...prev, severity: e.target.value as any }))}
                    >
                      <option value="low">Low Risk</option>
                      <option value="medium">Medium Risk</option>
                      <option value="high">High Risk</option>
                    </select>
                  </div>
                </div>

                <div className={styles.formGroup}>
                  <label>Diagnosis Name & Description *</label>
                  <input
                    type="text"
                    className={styles.formControl}
                    placeholder="e.g. Essential (primary) hypertension"
                    value={formData.name}
                    onChange={(e) => setFormData(prev => ({ ...prev, name: e.target.value }))}
                    required
                  />
                </div>

                <div className={styles.formGroup}>
                  <label>Medical Category</label>
                  <select
                    className={styles.formControl}
                    value={formData.category}
                    onChange={(e) => setFormData(prev => ({ ...prev, category: e.target.value }))}
                  >
                    <option value="Cardiology">Cardiology</option>
                    <option value="Pulmonology">Pulmonology</option>
                    <option value="Endocrinology">Endocrinology</option>
                    <option value="Gastroenterology">Gastroenterology</option>
                    <option value="Orthopedics">Orthopedics</option>
                    <option value="Urology">Urology</option>
                    <option value="General Medicine">General Medicine</option>
                  </select>
                </div>
              </div>
              <div className={styles.modalFooter}>
                <button type="button" className={styles.secondaryBtn} onClick={() => setModalOpen(false)}>Cancel</button>
                <button type="submit" className={styles.primaryBtn}>Save ICD Code</button>
              </div>
            </form>
          </div>
        </div>
      )}
    </div>
  );
}
