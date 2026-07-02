"use client";

import React, { useEffect, useState, useCallback } from "react";
import { useRouter, useParams } from "next/navigation";
import styles from "../../../../../dashboard.module.css";
import { ArrowLeft, Printer, RefreshCw } from "lucide-react";

const API = "http://127.0.0.1:8000/api/ipd";

interface PatientInfo {
  IhdCode:  number;
  IhdVchNo: number;
  PttCode:  number | null;
  PttName:  string;
  PttRegNo: number | null;
  PttSex:   string;
  Age:      string;
  DctCode:  number | null;
  DctName:  string;
  WrdName:  string;
  BedName:  string;
  PcgName:  string;
  Scheme:   string;
}

interface BillLine {
  IbdCode:   number;
  SrvName:   string;
  SgpName:   string;
  Qty:       number;
  Rate:      number;
  DiscPer:   number;
  DiscAmt:   number;
  GrossAmt:  number;
  NetAmt:    number;
  Remark:    string;
}

function fmtDate(d: string) {
  if (!d) return "—";
  try {
    return new Date(d).toLocaleDateString("en-IN", {
      day: "2-digit", month: "short", year: "numeric",
    });
  } catch { return d; }
}

function fmtAmt(n: number) {
  return "₹" + (n || 0).toLocaleString("en-IN", { minimumFractionDigits: 2, maximumFractionDigits: 2 });
}

export default function PrintIPDBillPage() {
  const router = useRouter();
  const params = useParams();
  const id = params?.id;

  const [invoice, setInvoice] = useState<any>(null);
  const [patient, setPatient] = useState<PatientInfo | null>(null);
  const [lines, setLines]     = useState<BillLine[]>([]);
  const [loading, setLoading] = useState(true);

  const loadData = useCallback(async () => {
    if (!id) return;
    try {
      const res = await fetch(`${API}/charges/${id}`);
      if (!res.ok) throw new Error("Invoice load failed");
      const data = await res.json();
      setInvoice(data.header);
      setLines(data.lines);

      // Load patient details
      const patRes = await fetch(`${API}/charges/patient-info/${data.header.IhdCode}`);
      if (patRes.ok) {
        setPatient(await patRes.json());
      }
    } catch (e) {
      console.log(e);
    } finally {
      setLoading(false);
    }
  }, [id]);

  useEffect(() => {
    loadData();
  }, [loadData]);

  // Auto trigger printer once loaded
  useEffect(() => {
    if (!loading && invoice) {
      const timer = setTimeout(() => {
        window.print();
      }, 800);
      return () => clearTimeout(timer);
    }
  }, [loading, invoice]);

  if (loading) {
    return (
      <div style={{ padding: 60, textAlign: "center" }}>
        <RefreshCw size={28} style={{ color: "var(--text-muted)", animation: "spin 1s linear infinite" }} />
        <p style={{ marginTop: 12, color: "var(--text-secondary)", fontSize: 14 }}>Preparing printable layout…</p>
      </div>
    );
  }

  if (!invoice) {
    return (
      <div style={{ padding: 40, textAlign: "center" }}>
        <p style={{ color: "var(--status-danger)" }}>Invoice not found.</p>
        <button className={styles.secondaryBtn} onClick={() => router.push("/dashboard/ipd/bill")}>
          Back to List
        </button>
      </div>
    );
  }

  const grossTotal = lines.reduce((a, r) => a + r.GrossAmt, 0);
  const discountPer = invoice.IbhDiscPer || 0;
  const discountAmt = Math.round((grossTotal * discountPer / 100) * 100) / 100;
  const netTotal = grossTotal - discountAmt;
  const balDue = netTotal - (invoice.IbhDepAmt || 0) + (invoice.IbhRfugAmt || 0);

  return (
    <div style={{ background: "#fff", color: "#000", padding: "10px", minHeight: "100vh", fontFamily: "Outfit, Inter, sans-serif" }}>
      
      {/* Hide toolbar during print */}
      <div className="no-print" style={{ display: "flex", justifyContent: "space-between", marginBottom: 20, padding: 10, background: "var(--bg-secondary)", borderRadius: 8 }}>
        <button className={styles.secondaryBtn} style={{ gap: 6 }} onClick={() => router.push("/dashboard/ipd/bill")}>
          <ArrowLeft size={15} /> Back to List
        </button>
        <button className={styles.primaryBtn} style={{ gap: 6 }} onClick={() => window.print()}>
          <Printer size={15} /> Reprint Page
        </button>
      </div>

      <style dangerouslySetInnerHTML={{__html: `
        @media print {
          .no-print { display: none !important; }
          body { background: #fff !important; color: #000 !important; margin: 0 !important; padding: 0 !important; }
        }
      `}} />

      {/* Hospital Letterhead */}
      <div style={{ textAlign: "center", borderBottom: "2px double #000", paddingBottom: 12, marginBottom: 16 }}>
        <h1 style={{ fontSize: 24, fontWeight: 800, textTransform: "uppercase", letterSpacing: "1px", margin: "0 0 4px" }}>
          STAR HOSPITAL & RESEARCH CENTRE
        </h1>
        <p style={{ fontSize: 12, color: "#444", margin: "0 0 2px" }}>
          12/A Ring Road, Near Medical Square, Nagpur - 440012
        </p>
        <p style={{ fontSize: 11, color: "#444", margin: 0 }}>
          Phone: +91 712 2548810 / Email: billing@starhospital.com
        </p>
        <h2 style={{ fontSize: 15, fontWeight: 700, textTransform: "uppercase", margin: "12px 0 0", letterSpacing: "0.5px", textDecoration: "underline" }}>
          FINAL STAY SETTLEMENT INVOICE
        </h2>
      </div>

      {/* Patient demographics metadata table */}
      <div style={{ display: "grid", gridTemplateColumns: "1fr 1fr", gap: 20, fontSize: 12, borderBottom: "1px solid #000", paddingBottom: 12, marginBottom: 16 }}>
        <div style={{ display: "flex", flexDirection: "column", gap: 4 }}>
          <div><strong>Patient Name:</strong> {patient?.PttName || "—"}</div>
          <div><strong>UHID / Reg No:</strong> {patient?.PttRegNo || "—"}</div>
          <div><strong>Age / Sex:</strong> {patient?.Age || "—"} / {patient?.PttSex || "—"}</div>
          <div><strong>Scheme Name:</strong> {patient?.PcgName || "General Payee"} ({patient?.Scheme || "Cash"})</div>
        </div>
        <div style={{ display: "flex", flexDirection: "column", gap: 4 }}>
          <div><strong>Invoice No:</strong> #{invoice.ChargeNo}</div>
          <div><strong>Invoice Date:</strong> {fmtDate(invoice.Date)}</div>
          <div><strong>Admission Date:</strong> {patient?.IhdVchNo ? "Admitted Stay" : "—"}</div>
          <div><strong>Discharged Bed:</strong> {patient?.BedName ? `${patient.WrdName} - ${patient.BedName}` : "—"}</div>
          <div><strong>Consulting Specialist:</strong> {patient?.DctName || "—"}</div>
        </div>
      </div>

      {/* Bill line items grid */}
      <table style={{ width: "100%", borderCollapse: "collapse", fontSize: 12, marginBottom: 20 }}>
        <thead>
          <tr style={{ borderBottom: "1px solid #000", borderTop: "1px solid #000" }}>
            <th style={{ textAlign: "left", padding: "6px 0", width: 50 }}>S.No</th>
            <th style={{ textAlign: "left", padding: "6px 0" }}>stay segment / Service Description</th>
            <th style={{ textAlign: "right", padding: "6px 0", width: 60 }}>Qty</th>
            <th style={{ textAlign: "right", padding: "6px 0", width: 90 }}>Rate</th>
            <th style={{ textAlign: "right", padding: "6px 0", width: 80 }}>Gross</th>
            <th style={{ textAlign: "right", padding: "6px 0", width: 80 }}>Disc %</th>
            <th style={{ textAlign: "right", padding: "6px 0", width: 100 }}>Total Charge</th>
          </tr>
        </thead>
        <tbody>
          {lines.map((l, idx) => (
            <tr key={l.IbdCode} style={{ borderBottom: "1px dashed #ddd" }}>
              <td style={{ padding: "8px 0" }}>{idx + 1}</td>
              <td style={{ padding: "8px 0" }}>
                <strong>{l.SrvName}</strong>
                {l.Remark && <div style={{ fontSize: 10, color: "#555", marginTop: 2 }}>{l.Remark}</div>}
              </td>
              <td style={{ textAlign: "right", padding: "8px 0" }}>{l.Qty}</td>
              <td style={{ textAlign: "right", padding: "8px 0" }}>{fmtAmt(l.Rate)}</td>
              <td style={{ textAlign: "right", padding: "8px 0" }}>{fmtAmt(l.GrossAmt)}</td>
              <td style={{ textAlign: "right", padding: "8px 0" }}>{l.DiscPer > 0 ? `${l.DiscPer}%` : "—"}</td>
              <td style={{ textAlign: "right", padding: "8px 0", fontWeight: 700 }}>{fmtAmt(l.NetAmt)}</td>
            </tr>
          ))}
        </tbody>
      </table>

      {/* Bill summary breakdown */}
      <div style={{ display: "grid", gridTemplateColumns: "1.2fr 1fr", gap: 40, alignItems: "start", fontSize: 12 }}>
        <div>
          <p style={{ margin: "0 0 6px" }}><strong>Ledger Remarks:</strong></p>
          <p style={{ margin: 0, padding: 8, background: "#f9f9f9", borderRadius: 4, border: "1px solid #eee", fontSize: 11, fontStyle: "italic" }}>
            {invoice.Remark || "No comments posted."}
          </p>
        </div>

        <div style={{ display: "flex", flexDirection: "column", gap: 6 }}>
          <div style={{ display: "flex", justifyContent: "space-between" }}>
            <span>Gross Total:</span>
            <span>{fmtAmt(grossTotal)}</span>
          </div>
          {discountAmt > 0 && (
            <div style={{ display: "flex", justifyContent: "space-between", color: "#555" }}>
              <span>Bill Discount ({discountPer}%):</span>
              <span>-{fmtAmt(discountAmt)}</span>
            </div>
          )}
          <div style={{ display: "flex", justifyContent: "space-between", fontWeight: 700, borderTop: "1px solid #000", paddingTop: 4 }}>
            <span>Net Amount:</span>
            <span>{fmtAmt(netTotal)}</span>
          </div>
          <div style={{ display: "flex", justifyContent: "space-between", color: "green" }}>
            <span>Less: Advance deposits:</span>
            <span>-{fmtAmt(invoice.IbhDepAmt)}</span>
          </div>
          {invoice.IbhRfugAmt > 0 && (
            <div style={{ display: "flex", justifyContent: "space-between", color: "red" }}>
              <span>Add: Excess refund:</span>
              <span>+{fmtAmt(invoice.IbhRfugAmt)}</span>
            </div>
          )}
          <div style={{ display: "flex", justifyContent: "space-between", fontSize: 14, fontWeight: 800, borderTop: "2px double #000", borderBottom: "2px double #000", padding: "4px 0" }}>
            <span>{balDue >= 0 ? "OUTSTANDING DUE:" : "REFUND SURPLUS:"}</span>
            <span>{fmtAmt(Math.abs(balDue))}</span>
          </div>
        </div>
      </div>

      {/* Signatures block */}
      <div style={{ display: "grid", gridTemplateColumns: "1fr 1fr", gap: 80, marginTop: 80, fontSize: 12, textAlign: "center" }}>
        <div>
          <div style={{ width: 160, borderBottom: "1px solid #000", margin: "0 auto 8px" }} />
          <strong>PATIENT / RECEIVER SIGNATURE</strong>
        </div>
        <div>
          <div style={{ width: 160, borderBottom: "1px solid #000", margin: "0 auto 8px" }} />
          <strong>BILLING CLERK / ACCOUNTANT</strong>
        </div>
      </div>

    </div>
  );
}
