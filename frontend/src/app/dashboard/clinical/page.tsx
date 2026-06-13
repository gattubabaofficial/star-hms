"use client";

import React, { useEffect, useState } from "react";
import styles from "../../dashboard.module.css";
import { Plus, Search, Layers, ShieldCheck, HeartPulse } from "lucide-react";

interface ServiceItem {
  srv_code: number;
  srv_name: string;
  group_name: string;
  rate: number;
}

interface DiagnosisItem {
  dig_code: number;
  dig_name: string;
  dig_rec_state: number;
}

export default function ClinicalPage() {
  const [activeTab, setActiveTab] = useState<"services" | "diagnoses">("services");
  const [searchTerm, setSearchTerm] = useState("");
  const [loading, setLoading] = useState(true);
  const [services, setServices] = useState<ServiceItem[]>([]);
  const [diagnoses, setDiagnoses] = useState<DiagnosisItem[]>([
    { dig_code: 1, dig_name: "Essential Hypertension", dig_rec_state: 5 },
    { dig_code: 2, dig_name: "Type 2 Diabetes Mellitus", dig_rec_state: 5 },
    { dig_code: 3, dig_name: "Acute Appendicitis", dig_rec_state: 5 },
    { dig_code: 4, dig_name: "Viral Fever / Influenza", dig_rec_state: 5 },
  ]);

  useEffect(() => {
    const fetchServices = async () => {
      try {
        const response = await fetch("http://127.0.0.1:8000/api/masters/services");
        if (response.ok) {
          const data = await response.json();
          const mapped = data.map((item: any) => ({
            srv_code: item.srv_code,
            srv_name: item.srv_name,
            group_name: item.group?.sgp_name || "General",
            rate: item.srv_rate
          }));
          setServices(mapped);
        }
      } catch (e) {
        console.log("Error loading services:", e);
      } finally {
        setLoading(false);
      }
    };
    fetchServices();
  }, []);

  const filteredServices = services.filter(srv => 
    srv.srv_name.toLowerCase().includes(searchTerm.toLowerCase()) ||
    srv.group_name.toLowerCase().includes(searchTerm.toLowerCase())
  );

  const filteredDiagnoses = diagnoses.filter(d => 
    d.dig_name.toLowerCase().includes(searchTerm.toLowerCase())
  );

  return (
    <div>
      {/* Sub tabs */}
      <div style={{ display: "flex", gap: "12px", marginBottom: "24px" }}>
        <button 
          className={activeTab === "services" ? styles.primaryBtn : styles.secondaryBtn} 
          onClick={() => { setActiveTab("services"); setSearchTerm(""); }}
          style={{ gap: "8px" }}
        >
          <HeartPulse size={16} /> Services Master (Consultation & Lab Rates)
        </button>
        <button 
          className={activeTab === "diagnoses" ? styles.primaryBtn : styles.secondaryBtn} 
          onClick={() => { setActiveTab("diagnoses"); setSearchTerm(""); }}
          style={{ gap: "8px" }}
        >
          <Layers size={16} /> Diagnosis Directory (ICD Codes)
        </button>
      </div>

      {/* Toolbar */}
      <div className={styles.toolbar}>
        <div className={styles.searchBar}>
          <Search size={18} style={{ color: "var(--text-secondary)" }} />
          <input
            type="text"
            placeholder={activeTab === "services" ? "Search services and consultation items..." : "Search diagnosis codes..."}
            value={searchTerm}
            onChange={(e) => setSearchTerm(e.target.value)}
          />
        </div>
        
        <button className={styles.primaryBtn}>
          <Plus size={18} />
          <span>Add New Record</span>
        </button>
      </div>

      {/* Tables list */}
      {loading ? (
        <p style={{ color: "var(--text-secondary)", fontSize: "14px" }}>Loading clinical masters...</p>
      ) : activeTab === "services" ? (
        filteredServices.length === 0 ? (
          <p style={{ color: "var(--text-secondary)" }}>No services registered.</p>
        ) : (
          <div className={styles.tableContainer}>
            <table className={styles.table}>
              <thead>
                <tr>
                  <th>Code</th>
                  <th>Service Description</th>
                  <th>Service Group</th>
                  <th>Base Charge (₹)</th>
                </tr>
              </thead>
              <tbody>
                {filteredServices.map((srv) => (
                  <tr key={srv.srv_code}>
                    <td style={{ fontWeight: 600, color: "var(--accent-color)" }}>#{srv.srv_code}</td>
                    <td style={{ fontWeight: 600 }}>{srv.srv_name}</td>
                    <td>
                      <span className={`${styles.badge} ${styles.badgeAccent}`}>{srv.group_name}</span>
                    </td>
                    <td style={{ fontWeight: 700 }}>₹{srv.rate.toFixed(2)}</td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        )
      ) : (
        filteredDiagnoses.length === 0 ? (
          <p style={{ color: "var(--text-secondary)" }}>No diagnoses registered.</p>
        ) : (
          <div className={styles.tableContainer} style={{ maxWidth: "800px" }}>
            <table className={styles.table}>
              <thead>
                <tr>
                  <th>ICD Code</th>
                  <th>Diagnosis Name</th>
                  <th>Audit State</th>
                </tr>
              </thead>
              <tbody>
                {filteredDiagnoses.map((d) => (
                  <tr key={d.dig_code}>
                    <td style={{ fontWeight: 600, color: "var(--accent-color)" }}>#DIG-{d.dig_code}</td>
                    <td style={{ fontWeight: 600 }}>{d.dig_name}</td>
                    <td>
                      <span className={`${styles.badge} ${styles.badgeSuccess}`}>
                        Active ({d.dig_rec_state})
                      </span>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        )
      )}
    </div>
  );
}
