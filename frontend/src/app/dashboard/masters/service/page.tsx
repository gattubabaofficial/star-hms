"use client";

import React, { useEffect, useState } from "react";
import styles from "../../../dashboard.module.css";
import { Plus, Layers, Search, AlertCircle, Check } from "lucide-react";

interface ServiceGroup {
  sgp_code: number;
  sgp_name: string;
}

interface Service {
  srv_code: number;
  srv_name: string;
  srv_sgp_code?: number;
  srv_rate: number;
  group?: ServiceGroup;
}

export default function ServiceMasterPage() {
  const [services, setServices] = useState<Service[]>([]);
  const [groups, setGroups] = useState<ServiceGroup[]>([]);
  const [loading, setLoading] = useState(true);
  
  const [searchTerm, setSearchTerm] = useState("");
  const [modalOpen, setModalOpen] = useState(false);
  
  const [formData, setFormData] = useState({
    srv_name: "",
    srv_sgp_code: "",
    srv_rate: "100"
  });

  const [error, setError] = useState("");
  const [success, setSuccess] = useState("");

  const fetchData = async () => {
    try {
      const srvRes = await fetch("http://127.0.0.1:8000/api/masters/services");
      const grpRes = await fetch("http://127.0.0.1:8000/api/masters/service-groups");
      
      if (srvRes.ok) setServices(await srvRes.json());
      if (grpRes.ok) {
        const grpData = await grpRes.json();
        setGroups(grpData);
        if (grpData.length > 0) {
          setFormData(prev => ({ ...prev, srv_sgp_code: String(grpData[0].sgp_code) }));
        }
      }
    } catch (e) {
      console.log("Error loading service master data:", e);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchData();
  }, []);

  const handleInputChange = (e: React.ChangeEvent<HTMLInputElement | HTMLSelectElement>) => {
    const { name, value } = e.target;
    setFormData(prev => ({ ...prev, [name]: value }));
  };

  const handleAddService = async (e: React.FormEvent) => {
    e.preventDefault();
    setError("");
    setSuccess("");

    if (!formData.srv_name.trim()) {
      setError("Service name is required");
      return;
    }

    try {
      const token = localStorage.getItem("token");
      const response = await fetch("http://127.0.0.1:8000/api/masters/services", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          "Authorization": `Bearer ${token}`
        },
        body: JSON.stringify({
          srv_name: formData.srv_name,
          srv_sgp_code: formData.srv_sgp_code ? Number(formData.srv_sgp_code) : null,
          srv_rate: Number(formData.srv_rate || 0)
        })
      });

      if (response.ok) {
        setSuccess("Service rate schedule added!");
        setFormData({
          srv_name: "",
          srv_sgp_code: groups[0]?.sgp_code ? String(groups[0].sgp_code) : "",
          srv_rate: "100"
        });
        await fetchData();
        setTimeout(() => {
          setModalOpen(false);
          setSuccess("");
        }, 1200);
      } else {
        const errData = await response.json();
        setError(errData.detail || "Failed to add service record");
      }
    } catch (err) {
      setError("Network error occurred");
    }
  };

  const filteredServices = services.filter(srv =>
    srv.srv_name.toLowerCase().includes(searchTerm.toLowerCase())
  );

  return (
    <div>
      <div className={styles.toolbar}>
        <div className={styles.searchBar}>
          <Search size={18} style={{ color: "var(--text-muted)" }} />
          <input
            type="text"
            placeholder="Search services rate list..."
            value={searchTerm}
            onChange={(e) => setSearchTerm(e.target.value)}
          />
        </div>
        <button className={styles.primaryBtn} onClick={() => setModalOpen(true)}>
          <Plus size={18} />
          <span>Add Service Code</span>
        </button>
      </div>

      {loading ? (
        <p style={{ color: "var(--text-secondary)", fontSize: "14px" }}>Loading services rate schedule...</p>
      ) : filteredServices.length === 0 ? (
        <div style={{ backgroundColor: "var(--bg-card)", border: "1px solid var(--border-light)", borderRadius: "16px", padding: "80px", textAlign: "center" }}>
          <Layers size={48} style={{ color: "var(--text-muted)", marginBottom: "16px" }} />
          <h3 style={{ fontSize: "18px", marginBottom: "8px" }}>No Services Defined</h3>
          <p style={{ color: "var(--text-secondary)", fontSize: "14px", marginBottom: "20px" }}>No service codes matching search parameters.</p>
          <button className={styles.primaryBtn} style={{ margin: "0 auto" }} onClick={() => setModalOpen(true)}>Configure Service Code</button>
        </div>
      ) : (
        <div className={styles.tableContainer}>
          <table className={styles.table}>
            <thead>
              <tr>
                <th>Service Code</th>
                <th>Service Name / description</th>
                <th>Clinical Group</th>
                <th>Standard Rate</th>
              </tr>
            </thead>
            <tbody>
              {filteredServices.map((srv) => (
                <tr key={srv.srv_code}>
                  <td style={{ fontWeight: 600, color: "var(--accent-color)" }}>#SRV-{srv.srv_code}</td>
                  <td style={{ fontWeight: 600 }}>{srv.srv_name}</td>
                  <td>{srv.group ? srv.group.sgp_name : "General"}</td>
                  <td style={{ fontWeight: 700 }}>₹{srv.srv_rate.toLocaleString("en-IN", { minimumFractionDigits: 2 })}</td>
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
              <h3 style={{ fontSize: "18px", fontWeight: 600 }}>Configure Service Billing Code</h3>
              <button className={styles.closeBtn} onClick={() => setModalOpen(false)}>×</button>
            </div>
            <form onSubmit={handleAddService}>
              <div className={styles.modalBody}>
                {error && (
                  <div style={{ color: "var(--status-danger)", display: "flex", alignItems: "center", gap: "6px", fontSize: "13px", marginBottom: "16px" }}>
                    <AlertCircle size={16} /> {error}
                  </div>
                )}
                {success && (
                  <div style={{ color: "var(--status-success)", display: "flex", alignItems: "center", gap: "6px", fontSize: "13px", marginBottom: "16px" }}>
                    <Check size={16} /> {success}
                  </div>
                )}

                <div className={styles.formGroup}>
                  <label htmlFor="srv_name">Service Billing Name *</label>
                  <input
                    id="srv_name"
                    name="srv_name"
                    type="text"
                    className={styles.formControl}
                    value={formData.srv_name}
                    onChange={handleInputChange}
                    placeholder="e.g. ECG Recording, Standard Dressing"
                    required
                  />
                </div>

                <div className={styles.formGrid}>
                  <div className={styles.formGroup}>
                    <label htmlFor="srv_sgp_code">Service Group *</label>
                    <select
                      id="srv_sgp_code"
                      name="srv_sgp_code"
                      className={styles.formControl}
                      value={formData.srv_sgp_code}
                      onChange={handleInputChange}
                    >
                      {groups.map(g => (
                        <option key={g.sgp_code} value={g.sgp_code}>{g.sgp_name}</option>
                      ))}
                    </select>
                  </div>

                  <div className={styles.formGroup}>
                    <label htmlFor="srv_rate">Base Charge (₹) *</label>
                    <input
                      id="srv_rate"
                      name="srv_rate"
                      type="number"
                      className={styles.formControl}
                      value={formData.srv_rate}
                      onChange={handleInputChange}
                      required
                    />
                  </div>
                </div>
              </div>
              <div className={styles.modalFooter}>
                <button type="button" className={styles.secondaryBtn} onClick={() => setModalOpen(false)}>Cancel</button>
                <button type="submit" className={styles.primaryBtn}>Save Service</button>
              </div>
            </form>
          </div>
        </div>
      )}
    </div>
  );
}
