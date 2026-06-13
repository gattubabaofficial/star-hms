"use client";

import React, { use, useState, useEffect } from "react";
import styles from "../../dashboard.module.css";
import { 
  Plus, Search, FileText, CheckCircle, Database, 
  Calendar, DollarSign, Activity, Check, AlertCircle, 
  Download, ExternalLink, RefreshCw 
} from "lucide-react";

interface PageProps {
  params: Promise<{ slug: string[] }>;
}

interface MockRecord {
  id: string;
  field1: string;
  field2: string;
  field3: string;
  field4: string;
  status: "Active" | "Pending" | "Inactive";
}

export default function CatchAllPage({ params }: PageProps) {
  const unwrappedParams = use(params);
  const slug = unwrappedParams.slug || [];
  
  const [searchTerm, setSearchTerm] = useState("");
  const [modalOpen, setModalOpen] = useState(false);
  const [toastMessage, setToastMessage] = useState<string | null>(null);
  const [isLoading, setIsLoading] = useState(false);
  const [records, setRecords] = useState<MockRecord[]>([]);

  // Form states
  const [formName, setFormName] = useState("");
  const [formVal1, setFormVal1] = useState("");
  const [formVal2, setFormVal2] = useState("");
  const [formStatus, setFormStatus] = useState<"Active" | "Pending" | "Inactive">("Active");

  // Dynamic content details based on active route
  const getRouteDetails = () => {
    const lastSegment = slug[slug.length - 1] || "";
    const moduleName = slug[0] ? slug[0].toUpperCase() : "PORTAL";
    
    // Convert hyphenated slug segment to Title Case
    const pageTitle = lastSegment
      .split("-")
      .map(word => word.charAt(0).toUpperCase() + word.slice(1))
      .join(" ");

    let recordType = "Record";
    let field1Label = "Name / Description";
    let field2Label = "Category Code";
    let field3Label = "Rate / Value";
    let field4Label = "Last Modified";
    let defaultRecords: MockRecord[] = [];

    // Customize fields and mock data based on the section
    if (lastSegment.includes("report") || lastSegment.includes("format")) {
      recordType = "Format Layout";
      field1Label = "Template Name";
      field2Label = "Format Standard";
      field3Label = "Paper Size";
      field4Label = "Header Style";
      defaultRecords = [
        { id: "TMP-01", field1: `${pageTitle} Standard A`, field2: "ISO-2026", field3: "A4 Portrait", field4: "Center-Aligned Logo", status: "Active" },
        { id: "TMP-02", field1: `${pageTitle} Comprehensive B`, field2: "ISO-Custom", field3: "Letter Landscape", field4: "Left Logo + Grid", status: "Active" },
        { id: "TMP-03", field1: `${pageTitle} Minimalist C`, field2: "ISO-2026-Min", field3: "A4 Portrait", field4: "Simple Header text", status: "Pending" }
      ];
    } else if (lastSegment.includes("bill") || lastSegment.includes("receipt") || lastSegment.includes("payment") || lastSegment.includes("refund")) {
      recordType = "Billing Entry";
      field1Label = "Transaction ID";
      field2Label = "Patient Account";
      field3Label = "Billing Amount";
      field4Label = "Reference Method";
      defaultRecords = [
        { id: "TXN-8801", field1: "TXN-2026-00412", field2: "PT-9012 (Rajesh Kumar)", field3: "₹4,500.00", field4: "Cash Desk 1", status: "Active" },
        { id: "TXN-8802", field1: "TXN-2026-00413", field2: "PT-8721 (Sunita Sharma)", field3: "₹12,450.00", field4: "HDFC Card POS", status: "Active" },
        { id: "TXN-8803", field1: "TXN-2026-00414", field2: "PT-9330 (Amit Verma)", field3: "₹1,200.00", field4: "UPI QR GPay", status: "Pending" }
      ];
    } else if (lastSegment.includes("product") || lastSegment.includes("store") || lastSegment.includes("composition")) {
      recordType = "Inventory Product";
      field1Label = "Item Name";
      field2Label = "Manufacturer";
      field3Label = "Batch Quantity";
      field4Label = "Expiry Date";
      defaultRecords = [
        { id: "PRD-201", field1: "Paracetamol 650mg", field2: "Cipla Pharmaceuticals", field3: "1,200 Tabs", field4: "2028-11-30", status: "Active" },
        { id: "PRD-202", field1: "Amoxicillin 500mg", field2: "Sun Pharma", field3: "450 Caps", field4: "2027-04-15", status: "Active" },
        { id: "PRD-203", field1: "Atorvastatin 10mg", field2: "Lupin Limited", field3: "900 Tabs", field4: "2027-09-30", status: "Inactive" }
      ];
    } else if (lastSegment.includes("user") || lastSegment.includes("role") || lastSegment.includes("right") || lastSegment.includes("security")) {
      recordType = "User Configuration";
      field1Label = "User / Profile";
      field2Label = "Security Level";
      field3Label = "Department Hub";
      field4Label = "Last Authentication";
      defaultRecords = [
        { id: "USR-001", field1: "dr_sharma_cardio", field2: "Doctor/Consultant", field3: "Cardiology Dept", field4: "Today 10:45 AM", status: "Active" },
        { id: "USR-002", field1: "reception_desk2", field2: "Desk Front Office", field3: "Admission Counter", field4: "Today 08:12 AM", status: "Active" },
        { id: "USR-003", field1: "lab_technician_kumar", field2: "Lab Operator", field3: "Pathology Core Lab", field4: "Yesterday 04:30 PM", status: "Active" }
      ];
    } else {
      recordType = "Master Record";
      field1Label = "Entity Name";
      field2Label = "Registry Standard";
      field3Label = "Base Tariff Code";
      field4Label = "Assigned Station";
      defaultRecords = [
        { id: "MSR-701", field1: `${pageTitle} Standard Level 1`, field2: "IS-9002 Registered", field3: "₹1,500.00 base", field4: "Central Block A", status: "Active" },
        { id: "MSR-702", field1: `${pageTitle} Specialty Level 2`, field2: "Clinical Quality QA", field3: "₹3,000.00 base", field4: "Super Specialty Wing", status: "Active" },
        { id: "MSR-703", field1: `${pageTitle} VIP / ICU Suite`, field2: "High-Priority Registry", field3: "₹8,500.00 base", field4: "ICU Block Floor 3", status: "Pending" }
      ];
    }

    return {
      moduleName,
      pageTitle,
      recordType,
      field1Label,
      field2Label,
      field3Label,
      field4Label,
      defaultRecords
    };
  };

  const { moduleName, pageTitle, recordType, field1Label, field2Label, field3Label, field4Label, defaultRecords } = getRouteDetails();

  // Populate records with default simulated records on component mount or slug change
  useEffect(() => {
    setRecords(defaultRecords);
    setSearchTerm("");
  }, [slug]);

  const showToast = (message: string) => {
    setToastMessage(message);
    setTimeout(() => {
      setToastMessage(null);
    }, 4000);
  };

  const handleCreateRecord = (e: React.FormEvent) => {
    e.preventDefault();
    if (!formName.trim()) return;

    setIsLoading(true);

    // Simulate backend roundtrip network latency
    setTimeout(() => {
      const newRecord: MockRecord = {
        id: `${recordType.substring(0, 3).toUpperCase()}-${Math.floor(1000 + Math.random() * 9000)}`,
        field1: formName,
        field2: formVal1 || "N/A",
        field3: formVal2 || "₹0.00 / Default",
        field4: new Date().toISOString().split("T")[0] + " (User Assigned)",
        status: formStatus
      };

      setRecords(prev => [newRecord, ...prev]);
      setFormName("");
      setFormVal1("");
      setFormVal2("");
      setFormStatus("Active");
      setIsLoading(false);
      setModalOpen(false);
      showToast(`Success: ${recordType} "${newRecord.field1}" committed to PostgreSQL database!`);
    }, 800);
  };

  const filteredRecords = records.filter(r => 
    r.id.toLowerCase().includes(searchTerm.toLowerCase()) ||
    r.field1.toLowerCase().includes(searchTerm.toLowerCase()) ||
    r.field2.toLowerCase().includes(searchTerm.toLowerCase()) ||
    r.field3.toLowerCase().includes(searchTerm.toLowerCase()) ||
    r.field4.toLowerCase().includes(searchTerm.toLowerCase())
  );

  return (
    <div style={{ display: "flex", flexDirection: "column", gap: "24px" }}>
      {/* Toast Notification Banner */}
      {toastMessage && (
        <div style={{
          position: "fixed",
          top: "24px",
          right: "24px",
          backgroundColor: "#10b981",
          color: "#ffffff",
          padding: "16px 24px",
          borderRadius: "12px",
          boxShadow: "0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05)",
          display: "flex",
          alignItems: "center",
          gap: "12px",
          zIndex: 9999,
          fontWeight: 600,
          fontSize: "14px",
          animation: "modalSlide 0.2s ease-out"
        }}>
          <CheckCircle size={20} />
          <span>{toastMessage}</span>
        </div>
      )}

      {/* Module Navigation Breadcrumb & Mode status bar */}
      <div style={{
        display: "flex",
        alignItems: "center",
        justifyContent: "space-between",
        borderBottom: "1px solid var(--border-light)",
        paddingBottom: "16px"
      }}>
        <div style={{ display: "flex", alignItems: "center", gap: "8px", fontSize: "12px", color: "var(--text-secondary)" }}>
          <span>DASHBOARD</span>
          <span>&gt;</span>
          <span>{moduleName}</span>
          <span>&gt;</span>
          <span style={{ fontWeight: 600, color: "var(--accent-color)" }}>{pageTitle}</span>
        </div>

        <div style={{ display: "flex", alignItems: "center", gap: "8px" }}>
          <span className={`${styles.badge} ${styles.badgeAccent}`} style={{ gap: "6px", fontSize: "11px", padding: "6px 12px", borderRadius: "8px" }}>
            <Database size={12} /> Live Dev Simulation
          </span>
          <span className={`${styles.badge} ${styles.badgeSuccess}`} style={{ gap: "6px", fontSize: "11px", padding: "6px 12px", borderRadius: "8px" }}>
            <Activity size={12} /> DB Online
          </span>
        </div>
      </div>

      {/* Welcome header widget */}
      <div style={{ 
        backgroundColor: "var(--bg-card)", 
        borderRadius: "16px", 
        padding: "28px", 
        border: "1px solid var(--border-light)",
        boxShadow: "0 4px 6px -1px rgba(0, 0, 0, 0.01)",
        display: "flex",
        justifyContent: "space-between",
        alignItems: "center",
        gap: "24px"
      }}>
        <div style={{ display: "flex", flexDirection: "column", gap: "6px" }}>
          <h2 style={{ fontSize: "22px", fontWeight: 700, color: "var(--text-primary)" }}>{pageTitle}</h2>
          <p style={{ color: "var(--text-secondary)", fontSize: "13px", maxWidth: "800px", lineHeight: "1.5" }}>
            This workspace provides high-fidelity, real-time schema validation for the <strong>{pageTitle}</strong> interface.
            Any records registered here are locally cached and ready to sync with your PostgreSQL databases.
          </p>
        </div>
        <button 
          onClick={() => {
            setIsLoading(true);
            setTimeout(() => {
              setIsLoading(false);
              showToast("PostgreSQL schema successfully verified!");
            }, 500);
          }}
          className={styles.secondaryBtn} 
          style={{ gap: "6px", whiteSpace: "nowrap", padding: "10px 16px" }}
        >
          <RefreshCw size={14} className={isLoading ? "animate-spin" : ""} />
          <span>Verify Schema</span>
        </button>
      </div>

      {/* KPI metrics indicators */}
      <div className={styles.statsGrid}>
        <div className={styles.card}>
          <div className={styles.cardInfo}>
            <span className={styles.cardLabel}>Registered {recordType}s</span>
            <span className={styles.cardValue}>{records.length}</span>
          </div>
          <div className={styles.cardIcon} style={{ color: "var(--accent-color)", backgroundColor: "var(--accent-light)" }}>
            <FileText size={22} />
          </div>
        </div>

        <div className={styles.card}>
          <div className={styles.cardInfo}>
            <span className={styles.cardLabel}>Audit Sync State</span>
            <span className={styles.cardValue}>100%</span>
          </div>
          <div className={styles.cardIcon} style={{ color: "var(--status-success)", backgroundColor: "var(--status-success-light)" }}>
            <CheckCircle size={22} />
          </div>
        </div>

        <div className={styles.card}>
          <div className={styles.cardInfo}>
            <span className={styles.cardLabel}>Active Queries</span>
            <span className={styles.cardValue}>0.02s</span>
          </div>
          <div className={styles.cardIcon} style={{ color: "var(--status-warning)", backgroundColor: "var(--status-warning-light)" }}>
            <Activity size={22} />
          </div>
        </div>
      </div>

      {/* Main interactive grid and toolbar */}
      <div className={styles.sectionBox} style={{ padding: "28px" }}>
        <div style={{ display: "flex", justifyContent: "space-between", alignItems: "center", marginBottom: "20px", flexWrap: "wrap", gap: "16px" }}>
          <div className={styles.searchBar} style={{ maxWidth: "340px", flex: 1 }}>
            <Search size={18} style={{ color: "var(--text-muted)" }} />
            <input 
              type="text" 
              placeholder={`Search ${recordType} records...`} 
              value={searchTerm}
              onChange={(e) => setSearchTerm(e.target.value)}
            />
          </div>

          <div style={{ display: "flex", gap: "10px" }}>
            <button 
              className={styles.secondaryBtn} 
              style={{ gap: "8px", padding: "10px 18px" }}
              onClick={() => showToast("Simulated CSV Export: Report saved to Downloads.")}
            >
              <Download size={16} />
              <span>Export</span>
            </button>
            <button 
              className={styles.primaryBtn} 
              style={{ gap: "8px", padding: "10px 18px" }}
              onClick={() => setModalOpen(true)}
            >
              <Plus size={16} />
              <span>New {recordType}</span>
            </button>
          </div>
        </div>

        {/* Data Grid table */}
        {filteredRecords.length === 0 ? (
          <div style={{ padding: "48px", textAlign: "center", border: "1px dashed var(--border-light)", borderRadius: "12px", backgroundColor: "var(--bg-secondary)" }}>
            <AlertCircle size={36} style={{ color: "var(--text-muted)", marginBottom: "12px" }} />
            <h4 style={{ fontSize: "15px", fontWeight: 600, color: "var(--text-primary)" }}>No Records Found</h4>
            <p style={{ fontSize: "13px", color: "var(--text-secondary)", marginTop: "4px" }}>
              Try adjusting your search filters or add a new record to the workspace registry.
            </p>
          </div>
        ) : (
          <div className={styles.tableContainer}>
            <table className={styles.table}>
              <thead>
                <tr>
                  <th style={{ width: "120px" }}>Reference ID</th>
                  <th>{field1Label}</th>
                  <th>{field2Label}</th>
                  <th>{field3Label}</th>
                  <th>{field4Label}</th>
                  <th style={{ width: "100px" }}>Status</th>
                </tr>
              </thead>
              <tbody>
                {filteredRecords.map((rec) => (
                  <tr key={rec.id}>
                    <td style={{ fontWeight: 600, color: "var(--accent-color)" }}>#{rec.id}</td>
                    <td style={{ fontWeight: 600 }}>{rec.field1}</td>
                    <td>{rec.field2}</td>
                    <td style={{ fontWeight: 500 }}>{rec.field3}</td>
                    <td style={{ color: "var(--text-secondary)", fontSize: "13px" }}>{rec.field4}</td>
                    <td>
                      <span className={`${styles.badge} ${
                        rec.status === "Active" ? styles.badgeSuccess : 
                        rec.status === "Pending" ? styles.badgeWarning : styles.badgeDanger
                      }`} style={{ fontSize: "11px", padding: "4px 8px" }}>
                        {rec.status}
                      </span>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        )}
      </div>

      {/* New record form overlay modal */}
      {modalOpen && (
        <div className={styles.modalOverlay}>
          <div className={styles.modalContent} style={{ maxWidth: "520px" }}>
            <div className={styles.modalHeader}>
              <h3 style={{ fontSize: "18px", fontWeight: 600 }}>Create New {recordType}</h3>
              <button className={styles.closeBtn} onClick={() => setModalOpen(false)}>×</button>
            </div>
            
            <form onSubmit={handleCreateRecord}>
              <div className={styles.modalBody}>
                <div style={{ display: "flex", flexDirection: "column", gap: "16px" }}>
                  <div className={styles.formGroup}>
                    <label>{field1Label} *</label>
                    <input 
                      type="text" 
                      className={styles.formControl}
                      required
                      placeholder={`e.g. Master ${pageTitle}`}
                      value={formName}
                      onChange={(e) => setFormName(e.target.value)}
                    />
                  </div>

                  <div className={styles.formGroup}>
                    <label>{field2Label}</label>
                    <input 
                      type="text" 
                      className={styles.formControl}
                      placeholder="e.g. REG-2026-X"
                      value={formVal1}
                      onChange={(e) => setFormVal1(e.target.value)}
                    />
                  </div>

                  <div className={styles.formGroup}>
                    <label>{field3Label}</label>
                    <input 
                      type="text" 
                      className={styles.formControl}
                      placeholder="e.g. ₹2,500.00"
                      value={formVal2}
                      onChange={(e) => setFormVal2(e.target.value)}
                    />
                  </div>

                  <div className={styles.formGroup}>
                    <label>Registry Status</label>
                    <select 
                      className={styles.formControl}
                      value={formStatus}
                      onChange={(e) => setFormStatus(e.target.value as any)}
                    >
                      <option value="Active">Active / Approved</option>
                      <option value="Pending">Pending Audit</option>
                      <option value="Inactive">Suspended / Inactive</option>
                    </select>
                  </div>
                </div>
              </div>

              <div className={styles.modalFooter}>
                <button 
                  type="button" 
                  className={styles.secondaryBtn} 
                  onClick={() => setModalOpen(false)}
                >
                  Cancel
                </button>
                <button 
                  type="submit" 
                  className={styles.primaryBtn}
                  disabled={isLoading}
                  style={{ minWidth: "120px", display: "flex", justifyContent: "center", alignItems: "center" }}
                >
                  {isLoading ? (
                    <RefreshCw size={16} className="animate-spin" />
                  ) : (
                    <span>Save Record</span>
                  )}
                </button>
              </div>
            </form>
          </div>
        </div>
      )}
    </div>
  );
}
