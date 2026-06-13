"use client";

import React, { useState } from "react";
import styles from "../../../dashboard.module.css";
import { Plus, Search, Layers } from "lucide-react";

interface Procedure {
  code: string;
  name: string;
  department: string;
  charges: number;
  duration: number; // in minutes
}

export default function ProcedureCodesPage() {
  const [procedures, setProcedures] = useState<Procedure[]>([
    { code: "APP-01", name: "Laparoscopic Appendectomy", department: "General Surgery", charges: 45000, duration: 60 },
    { code: "CABG-02", name: "Coronary Artery Bypass Grafting", department: "Cardiothoracic Surgery", charges: 250000, duration: 240 },
    { code: "CAT-03", name: "Phacoemulsification Cataract Surgery with IOL", department: "Ophthalmology", charges: 28000, duration: 30 },
    { code: "CHOLE-04", name: "Laparoscopic Cholecystectomy", department: "General Surgery", charges: 52000, duration: 75 },
    { code: "TKR-05", name: "Total Knee Replacement (Unilateral)", department: "Orthopedics", charges: 160000, duration: 120 },
  ]);

  const [searchTerm, setSearchTerm] = useState("");
  const [modalOpen, setModalOpen] = useState(false);

  const [formData, setFormData] = useState({
    code: "",
    name: "",
    department: "General Surgery",
    charges: "25000",
    duration: "60"
  });

  const handleInputChange = (e: React.ChangeEvent<HTMLInputElement | HTMLSelectElement>) => {
    const { name, value } = e.target;
    setFormData(prev => ({ ...prev, [name]: value }));
  };

  const handleAddProcedure = (e: React.FormEvent) => {
    e.preventDefault();
    if (!formData.code.trim() || !formData.name.trim()) return;

    setProcedures(prev => [
      ...prev,
      {
        code: formData.code.toUpperCase(),
        name: formData.name,
        department: formData.department,
        charges: Number(formData.charges),
        duration: Number(formData.duration)
      }
    ]);

    setFormData({ code: "", name: "", department: "General Surgery", charges: "25000", duration: "60" });
    setModalOpen(false);
  };

  const filteredProcedures = procedures.filter(proc =>
    proc.code.toLowerCase().includes(searchTerm.toLowerCase()) ||
    proc.name.toLowerCase().includes(searchTerm.toLowerCase()) ||
    proc.department.toLowerCase().includes(searchTerm.toLowerCase())
  );

  return (
    <div>
      <div className={styles.toolbar}>
        <div className={styles.searchBar}>
          <Search size={18} style={{ color: "var(--text-muted)" }} />
          <input
            type="text"
            placeholder="Search surgical procedures by code, name or department..."
            value={searchTerm}
            onChange={(e) => setSearchTerm(e.target.value)}
          />
        </div>
        <button className={styles.primaryBtn} onClick={() => setModalOpen(true)}>
          <Plus size={18} />
          <span>Add Procedure Code</span>
        </button>
      </div>

      <div className={styles.tableContainer}>
        <table className={styles.table}>
          <thead>
            <tr>
              <th>Procedure Code</th>
              <th>Operation Name</th>
              <th>Department</th>
              <th>Est. Duration (Mins)</th>
              <th>Base Surgeon Charges</th>
            </tr>
          </thead>
          <tbody>
            {filteredProcedures.map((proc) => (
              <tr key={proc.code}>
                <td style={{ fontWeight: 700, color: "var(--accent-color)" }}>{proc.code}</td>
                <td style={{ fontWeight: 600 }}>{proc.name}</td>
                <td>{proc.department}</td>
                <td>{proc.duration} mins</td>
                <td style={{ fontWeight: 700 }}>₹{proc.charges.toLocaleString("en-IN", { minimumFractionDigits: 2 })}</td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>

      {modalOpen && (
        <div className={styles.modalOverlay}>
          <div className={styles.modalContent} style={{ maxWidth: "500px" }}>
            <div className={styles.modalHeader}>
              <h3 style={{ fontSize: "18px", fontWeight: 600 }}>Add Surgical Procedure Code</h3>
              <button className={styles.closeBtn} onClick={() => setModalOpen(false)}>×</button>
            </div>
            <form onSubmit={handleAddProcedure}>
              <div className={styles.modalBody}>
                <div className={styles.formGrid}>
                  <div className={styles.formGroup}>
                    <label>Procedure Code *</label>
                    <input
                      type="text"
                      name="code"
                      className={styles.formControl}
                      placeholder="e.g. CABG-02, APP-01"
                      value={formData.code}
                      onChange={handleInputChange}
                      required
                    />
                  </div>
                  <div className={styles.formGroup}>
                    <label>Clinical Department</label>
                    <select
                      name="department"
                      className={styles.formControl}
                      value={formData.department}
                      onChange={handleInputChange}
                    >
                      <option value="General Surgery">General Surgery</option>
                      <option value="Cardiothoracic Surgery">Cardiothoracic Surgery</option>
                      <option value="Ophthalmology">Ophthalmology</option>
                      <option value="Orthopedics">Orthopedics</option>
                      <option value="Neurology">Neurology</option>
                      <option value="ENT Surgery">ENT Surgery</option>
                    </select>
                  </div>
                </div>

                <div className={styles.formGroup}>
                  <label>Operation / Procedure Name *</label>
                  <input
                    type="text"
                    name="name"
                    className={styles.formControl}
                    placeholder="e.g. Laparoscopic Appendectomy"
                    value={formData.name}
                    onChange={handleInputChange}
                    required
                  />
                </div>

                <div className={styles.formGrid}>
                  <div className={styles.formGroup}>
                    <label>Est. Duration (Mins) *</label>
                    <input
                      type="number"
                      name="duration"
                      className={styles.formControl}
                      value={formData.duration}
                      onChange={handleInputChange}
                      required
                    />
                  </div>
                  <div className={styles.formGroup}>
                    <label>Base Charges (₹) *</label>
                    <input
                      type="number"
                      name="charges"
                      className={styles.formControl}
                      value={formData.charges}
                      onChange={handleInputChange}
                      required
                    />
                  </div>
                </div>
              </div>
              <div className={styles.modalFooter}>
                <button type="button" className={styles.secondaryBtn} onClick={() => setModalOpen(false)}>Cancel</button>
                <button type="submit" className={styles.primaryBtn}>Save Procedure</button>
              </div>
            </form>
          </div>
        </div>
      )}
    </div>
  );
}
