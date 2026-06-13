"use client";

import React, { useEffect, useState } from "react";
import styles from "../../../dashboard.module.css";
import { Receipt, Search, Printer } from "lucide-react";

interface Patient {
  ptt_code: number;
  ptt_name: string;
  ptt_reg_no: number;
}

interface Doctor {
  dct_code: number;
  dct_name: string;
  dct_title: string;
}

interface OPDBill {
  bill_id: number;
  bill_no: string;
  total_amount: number;
  discount_amount: number;
  net_amount: number;
  paid_amount: number;
  status: string;
  created_at: string;
}

interface OPDRegistration {
  opg_code: number;
  opg_visit_date: string;
  opg_fee: number;
  patient?: Patient;
  doctor?: Doctor;
  bills: OPDBill[];
}

export default function OPDReceiptsLogPage() {
  const [registrations, setRegistrations] = useState<OPDRegistration[]>([]);
  const [loading, setLoading] = useState(true);
  const [searchTerm, setSearchTerm] = useState("");
  
  // Invoice print state
  const [selectedReg, setSelectedReg] = useState<OPDRegistration | null>(null);
  const [invoiceOpen, setInvoiceOpen] = useState(false);

  const fetchRegistrations = async () => {
    try {
      const response = await fetch("http://127.0.0.1:8000/api/opd/registrations");
      if (response.ok) {
        setRegistrations(await response.json());
      }
    } catch (e) {
      console.log("Error loading registrations list:", e);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchRegistrations();
  }, []);

  const handleShowReceipt = (reg: OPDRegistration) => {
    setSelectedReg(reg);
    setInvoiceOpen(true);
  };

  const filteredRegs = registrations.filter(reg =>
    (reg.patient?.ptt_name || "").toLowerCase().includes(searchTerm.toLowerCase()) ||
    (reg.doctor?.dct_name || "").toLowerCase().includes(searchTerm.toLowerCase())
  );

  return (
    <div>
      <div className={styles.toolbar}>
        <div className={styles.searchBar}>
          <Search size={18} style={{ color: "var(--text-muted)" }} />
          <input
            type="text"
            placeholder="Search receipts by patient or doctor..."
            value={searchTerm}
            onChange={(e) => setSearchTerm(e.target.value)}
          />
        </div>
      </div>

      {loading ? (
        <p style={{ color: "var(--text-secondary)", fontSize: "14px" }}>Loading receipts directory...</p>
      ) : filteredRegs.length === 0 ? (
        <div style={{ backgroundColor: "var(--bg-card)", border: "1px solid var(--border-light)", borderRadius: "16px", padding: "60px", textAlign: "center" }}>
          <Receipt size={44} style={{ color: "var(--text-muted)", marginBottom: "16px" }} />
          <h3 style={{ fontSize: "16px", marginBottom: "8px" }}>No Receipts Logged</h3>
          <p style={{ color: "var(--text-secondary)", fontSize: "13px" }}>No consultation visits or bills match the search parameters.</p>
        </div>
      ) : (
        <div className={styles.tableContainer}>
          <table className={styles.table}>
            <thead>
              <tr>
                <th>Visit Date</th>
                <th>Receipt / Invoice No</th>
                <th>Patient Name</th>
                <th>Consulting Doctor</th>
                <th>Net Total</th>
                <th>Paid Amount</th>
                <th>Status</th>
                <th>Action</th>
              </tr>
            </thead>
            <tbody>
              {filteredRegs.map((reg) => {
                const bill = reg.bills && reg.bills.length > 0 ? reg.bills[0] : null;
                return (
                  <tr key={reg.opg_code}>
                    <td style={{ fontWeight: 500 }}>
                      {new Date(reg.opg_visit_date).toLocaleString("en-IN", { dateStyle: "short", timeStyle: "short" })}
                    </td>
                    <td style={{ fontWeight: 600, color: "var(--accent-color)" }}>
                      {bill ? bill.bill_no : `OPD-REC-${reg.opg_code}`}
                    </td>
                    <td style={{ fontWeight: 600 }}>{reg.patient ? reg.patient.ptt_name : "Unknown"}</td>
                    <td>{reg.doctor ? `${reg.doctor.dct_title} ${reg.doctor.dct_name}` : "Unknown"}</td>
                    <td style={{ fontWeight: 600 }}>₹{bill ? bill.net_amount : reg.opg_fee}</td>
                    <td>₹{bill ? bill.paid_amount : 0}</td>
                    <td>
                      <span className={`${styles.badge} ${
                        !bill ? styles.badgeDanger :
                        bill.status === "paid" ? styles.badgeSuccess :
                        bill.status === "partial" ? styles.badgeWarning : styles.badgeDanger
                      }`}>
                        {bill ? bill.status : "unpaid"}
                      </span>
                    </td>
                    <td>
                      <button className={styles.closeBtn} onClick={() => handleShowReceipt(reg)} title="Print Receipt">
                        <Receipt size={18} style={{ color: "var(--accent-color)" }} />
                      </button>
                    </td>
                  </tr>
                );
              })}
            </tbody>
          </table>
        </div>
      )}

      {invoiceOpen && selectedReg && (
        <div className={styles.modalOverlay}>
          <div className={styles.modalContent} style={{ maxWidth: "480px" }}>
            <div className={styles.modalHeader}>
              <h3 style={{ fontSize: "18px", fontWeight: 600 }}>OPD Consultation Receipt</h3>
              <button className={styles.closeBtn} onClick={() => setInvoiceOpen(false)}>×</button>
            </div>
            
            <div className={styles.modalBody} style={{ padding: "24px 32px" }}>
              <div id="receipt-print-area" style={{ color: "#000", fontFamily: "sans-serif" }}>
                {/* Receipt Header */}
                <div style={{ textAlign: "center", marginBottom: "20px", borderBottom: "2px dashed #e2e8f0", paddingBottom: "16px" }}>
                  <h2 style={{ fontSize: "20px", fontWeight: 700, margin: "0 0 4px 0" }}>STAR HOSPITAL</h2>
                  <p style={{ fontSize: "11px", color: "#64748b", margin: 0 }}>Main Road St., Suite 101, Medical District</p>
                  <p style={{ fontSize: "11px", color: "#64748b", margin: 0 }}>Tel: 9876543210 | info@starhospital.com</p>
                </div>

                {/* Receipt details */}
                <div style={{ display: "flex", flexDirection: "column", gap: "8px", fontSize: "13px", marginBottom: "16px" }}>
                  <div style={{ display: "flex", justifyContent: "space-between" }}>
                    <span style={{ color: "#64748b" }}>Receipt No:</span>
                    <strong style={{ color: "#000" }}>{selectedReg.bills[0]?.bill_no || `OPD-REC-${selectedReg.opg_code}`}</strong>
                  </div>
                  <div style={{ display: "flex", justifyContent: "space-between" }}>
                    <span style={{ color: "#64748b" }}>Date:</span>
                    <span>{new Date(selectedReg.opg_visit_date).toLocaleString()}</span>
                  </div>
                  <div style={{ display: "flex", justifyContent: "space-between" }}>
                    <span style={{ color: "#64748b" }}>Patient Name:</span>
                    <strong>{selectedReg.patient?.ptt_name}</strong>
                  </div>
                  <div style={{ display: "flex", justifyContent: "space-between" }}>
                    <span style={{ color: "#64748b" }}>Reg Number:</span>
                    <span>#{selectedReg.patient?.ptt_reg_no || selectedReg.opg_code}</span>
                  </div>
                  <div style={{ display: "flex", justifyContent: "space-between" }}>
                    <span style={{ color: "#64748b" }}>Doctor Name:</span>
                    <span>{selectedReg.doctor ? `${selectedReg.doctor.dct_title} ${selectedReg.doctor.dct_name}` : "General Consultant"}</span>
                  </div>
                </div>

                {/* Receipt items list */}
                <div style={{ borderTop: "1px solid #e2e8f0", borderBottom: "1px solid #e2e8f0", padding: "12px 0", marginBottom: "16px" }}>
                  <div style={{ display: "flex", justifyContent: "space-between", fontWeight: 600, fontSize: "13px", marginBottom: "6px" }}>
                    <span>Description</span>
                    <span>Amount</span>
                  </div>
                  <div style={{ display: "flex", justifyContent: "space-between", fontSize: "13px" }}>
                    <span>OPD Consultation Charge</span>
                    <span>₹{selectedReg.opg_fee.toFixed(2)}</span>
                  </div>
                </div>

                {/* Total breakdowns */}
                <div style={{ display: "flex", flexDirection: "column", gap: "6px", fontSize: "13px", alignItems: "flex-end", borderBottom: "2px dashed #e2e8f0", paddingBottom: "16px", marginBottom: "16px" }}>
                  <div style={{ display: "flex", width: "200px", justifyContent: "space-between" }}>
                    <span style={{ color: "#64748b" }}>Subtotal:</span>
                    <span>₹{selectedReg.opg_fee.toFixed(2)}</span>
                  </div>
                  <div style={{ display: "flex", width: "200px", justifyContent: "space-between" }}>
                    <span style={{ color: "#64748b" }}>Discount:</span>
                    <span>-₹{(selectedReg.bills[0]?.discount_amount || 0).toFixed(2)}</span>
                  </div>
                  <div style={{ display: "flex", width: "200px", justifyContent: "space-between", fontWeight: 700, fontSize: "15px", marginTop: "4px" }}>
                    <span>Net Total:</span>
                    <span>₹{(selectedReg.bills[0]?.net_amount || selectedReg.opg_fee).toFixed(2)}</span>
                  </div>
                  <div style={{ display: "flex", width: "200px", justifyContent: "space-between", fontWeight: 600, color: "var(--accent-color)", marginTop: "4px" }}>
                    <span>Paid Amount:</span>
                    <span>₹{(selectedReg.bills[0]?.paid_amount || 0).toFixed(2)}</span>
                  </div>
                </div>

                {/* Footer notes */}
                <div style={{ textAlign: "center", fontSize: "11px", color: "#64748b" }}>
                  <p>Thank you for choosing Star Hospital</p>
                  <p>Get well soon!</p>
                </div>
              </div>
            </div>

            <div className={styles.modalFooter}>
              <button className={styles.secondaryBtn} onClick={() => setInvoiceOpen(false)}>Close</button>
              <button className={styles.primaryBtn} onClick={() => window.print()} style={{ gap: "6px" }}>
                <Printer size={16} /> Print Receipt
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}
