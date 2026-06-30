"use client";

import React, { useEffect, useState, use } from "react";
import { useRouter } from "next/navigation";
import styles from "../../../../../dashboard.module.css";
import { ArrowLeft, Printer, RefreshCw } from "lucide-react";

const API = "http://127.0.0.1:8000/api/ipd";

export default function PrintChargePage({ params }: { params: Promise<{ id: string }> }) {
  const { id } = use(params);
  const router = useRouter();

  const [data, setData]     = useState<any>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError]   = useState("");

  useEffect(() => {
    fetch(`${API}/charges/${id}`)
      .then(r => { if (!r.ok) throw new Error("Not found"); return r.json(); })
      .then(d => { setData(d); setLoading(false); })
      .catch(() => { setError("Could not load charge data."); setLoading(false); });
  }, [id]);

  function doPrint() {
    if (!data) return;
    const { header: hdr, lines } = data;

    const totalGross = lines.reduce((s: number, l: any) => s + (l.GrossAmt || 0), 0);
    const totalDisc  = lines.reduce((s: number, l: any) => s + (l.DiscAmt  || 0), 0);
    const totalNet   = lines.reduce((s: number, l: any) => s + (l.NetAmt   || 0), 0);

    const fmtDate = (d: string) => d ? new Date(d).toLocaleDateString("en-IN", { day: "2-digit", month: "long", year: "numeric" }) : "—";
    const fmtAmt  = (n: number) => n.toLocaleString("en-IN", { minimumFractionDigits: 2 });

    const html = `<!DOCTYPE html>
<html><head>
<meta charset="utf-8"/>
<title>Indoor Charge Receipt — #${hdr.ChargeNo}</title>
<style>
  * { margin:0; padding:0; box-sizing:border-box; }
  body { font-family: Arial, sans-serif; font-size: 12px; color: #111; padding: 20px 28px; }
  .hosp-name { text-align: center; font-size: 20px; font-weight: bold; letter-spacing: 1px; }
  .title { text-align: center; font-size: 14px; font-weight: 600; margin: 4px 0 10px; color: #333; }
  .divider { border-top: 1.5px solid #111; margin: 8px 0; }
  .thin { border-top: 1px dashed #999; margin: 6px 0; }
  .grid2 { display: grid; grid-template-columns: 1fr 1fr; gap: 4px 24px; margin: 8px 0 12px; }
  .field { display: flex; gap: 6px; line-height: 1.6; }
  .flab { font-weight: bold; min-width: 110px; color: #555; font-size: 11px; }
  .fval { font-size: 12px; font-weight: 600; }
  table { width: 100%; border-collapse: collapse; margin: 8px 0; }
  thead th { background: #1e3a5f; color: #fff; padding: 7px 8px; text-align: left; font-size: 11px; }
  tbody td { padding: 5px 8px; border-bottom: 1px solid #e5e7eb; font-size: 11px; }
  tbody tr:nth-child(even) td { background: #f9fafb; }
  .ar { text-align: right; }
  .ac { text-align: center; }
  .trow td { font-weight: bold; border-top: 2px solid #111; background: #f0f4ff !important; font-size: 12px; }
  .sigs { margin-top: 40px; display: flex; justify-content: space-between; }
  .sig { text-align: center; font-size: 11px; }
  .sig-line { border-top: 1px solid #333; padding-top: 4px; margin-top: 36px; min-width: 160px; }
  @media print { .no-print { display: none; } body { padding: 12px; } }
</style>
</head>
<body>
<div class="hosp-name">STAR HOSPITAL MANAGEMENT SYSTEM</div>
<div class="title">INDOOR CHARGE RECEIPT</div>
<div class="divider"></div>

<div class="grid2">
  <div class="field"><span class="flab">Charge No:</span><span class="fval">#${hdr.ChargeNo}</span></div>
  <div class="field"><span class="flab">Date:</span><span class="fval">${fmtDate(hdr.Date)}</span></div>
  <div class="field"><span class="flab">Voucher:</span><span class="fval">${hdr.Voucher || "—"}</span></div>
  <div class="field"><span class="flab">IPD No:</span><span class="fval">${hdr.IpdNo ?? "—"}</span></div>
  <div class="field"><span class="flab">Patient Name:</span><span class="fval">${hdr.PttName}</span></div>
  <div class="field"><span class="flab">UHID:</span><span class="fval">${hdr.PttRegNo ?? "—"}</span></div>
  <div class="field"><span class="flab">Doctor:</span><span class="fval">${hdr.DctName || "—"}</span></div>
  <div class="field"><span class="flab">Charge Group:</span><span class="fval">${hdr.ChargeGroup || "—"}</span></div>
  <div class="field"><span class="flab">Status:</span><span class="fval">${hdr.Status}</span></div>
</div>

<div class="divider"></div>

<table>
  <thead>
    <tr>
      <th style="width:36px">#</th>
      <th>Charge Group</th>
      <th>Charge Item</th>
      <th class="ac" style="width:50px">Qty</th>
      <th class="ar" style="width:90px">Rate (₹)</th>
      <th class="ac" style="width:70px">Disc %</th>
      <th class="ar" style="width:90px">Gross (₹)</th>
      <th class="ar" style="width:90px">Disc (₹)</th>
      <th class="ar" style="width:90px">Net (₹)</th>
    </tr>
  </thead>
  <tbody>
    ${lines.map((ln: any, i: number) => `
    <tr>
      <td class="ac">${i + 1}</td>
      <td>${ln.SgpName || "—"}</td>
      <td>${ln.SrvName || "—"}</td>
      <td class="ac">${ln.Qty}</td>
      <td class="ar">${fmtAmt(ln.Rate)}</td>
      <td class="ac">${(ln.DiscPer || 0).toFixed(2)}%</td>
      <td class="ar">${fmtAmt(ln.GrossAmt)}</td>
      <td class="ar">${fmtAmt(ln.DiscAmt)}</td>
      <td class="ar">${fmtAmt(ln.NetAmt)}</td>
    </tr>`).join("")}
    <tr class="trow">
      <td colspan="6" style="text-align:right; padding-right:12px">TOTAL</td>
      <td class="ar">₹${fmtAmt(totalGross)}</td>
      <td class="ar">₹${fmtAmt(totalDisc)}</td>
      <td class="ar">₹${fmtAmt(totalNet)}</td>
    </tr>
  </tbody>
</table>

${hdr.Remark ? `<p style="margin-top:10px;font-size:11px;"><strong>Remarks:</strong> ${hdr.Remark}</p>` : ""}

<div class="thin" style="margin-top:20px"></div>
<p style="text-align:center;font-size:10px;color:#666;">Generated on ${new Date().toLocaleString("en-IN")} — Star HMS</p>

<div class="sigs">
  <div class="sig"><div class="sig-line">Patient / Attendant</div></div>
  <div class="sig"><div class="sig-line">Cashier</div></div>
  <div class="sig"><div class="sig-line">Authorised Signatory</div></div>
</div>
</body></html>`;

    const win = window.open("", "_blank", "width=820,height=700");
    if (!win) { alert("Pop-up blocked. Please allow pop-ups for this site."); return; }
    win.document.write(html);
    win.document.close();
    win.focus();
    setTimeout(() => win.print(), 500);
  }

  if (loading) return (
    <div style={{ padding: 60, textAlign: "center" }}>
      <RefreshCw size={28} style={{ color: "var(--text-muted)", animation: "spin 1s linear infinite" }} />
      <p style={{ marginTop: 12, color: "var(--text-secondary)", fontSize: 14 }}>Loading charge data…</p>
    </div>
  );

  if (error || !data) return (
    <div style={{ padding: 60, textAlign: "center" }}>
      <p style={{ color: "var(--status-danger)", fontSize: 14 }}>{error || "Failed to load."}</p>
      <button className={styles.secondaryBtn} style={{ marginTop: 16 }} onClick={() => router.back()}>← Go Back</button>
    </div>
  );

  const { header: hdr, lines } = data;
  const totalNet = lines.reduce((s: number, l: any) => s + (l.NetAmt || 0), 0);
  const fmtAmt = (n: number) => "₹" + n.toLocaleString("en-IN", { minimumFractionDigits: 2 });
  const fmtDate = (d: string) => d ? new Date(d).toLocaleDateString("en-IN", { day: "2-digit", month: "short", year: "numeric" }) : "—";

  return (
    <div style={{ display: "flex", flexDirection: "column", gap: 20 }}>
      <div style={{ display: "flex", alignItems: "center", gap: 12, paddingBottom: 16, borderBottom: "1px solid var(--border-light)" }}>
        <button className={styles.secondaryBtn} style={{ padding: "8px 14px", gap: 6, fontSize: 13 }} onClick={() => router.push("/dashboard/ipd/charges")}>
          <ArrowLeft size={15} /> Back
        </button>
        <h2 style={{ fontSize: 20, fontWeight: 700, flex: 1, margin: 0 }}>
          Print — Charge #{hdr.ChargeNo}
        </h2>
        <button id="btn-do-print" className={styles.primaryBtn} style={{ gap: 6, padding: "10px 22px" }} onClick={doPrint}>
          <Printer size={16} /> Print Receipt
        </button>
      </div>

      {/* Preview card */}
      <div className={styles.sectionBox}>
        <div className={styles.sectionHeader}>
          <h3 className={styles.sectionTitle} style={{ fontSize: 15 }}>Charge Summary — #{hdr.ChargeNo}</h3>
          <span style={{ fontSize: 12, color: "var(--text-secondary)" }}>{fmtDate(hdr.Date)}</span>
        </div>

        <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fill, minmax(180px, 1fr))", gap: "10px 20px", marginBottom: 20 }}>
          {[
            { label: "Patient", value: hdr.PttName },
            { label: "UHID",    value: hdr.PttRegNo ?? "—" },
            { label: "IPD No",  value: hdr.IpdNo ?? "—" },
            { label: "Doctor",  value: hdr.DctName || "—" },
            { label: "Status",  value: hdr.Status },
            { label: "Net Amount", value: fmtAmt(totalNet) },
          ].map(f => (
            <div key={f.label}>
              <div style={{ fontSize: 11, fontWeight: 700, color: "var(--text-secondary)", textTransform: "uppercase", marginBottom: 3 }}>{f.label}</div>
              <div style={{ fontSize: 14, fontWeight: 600, color: "var(--text-primary)" }}>{f.value}</div>
            </div>
          ))}
        </div>

        <div className={styles.tableContainer}>
          <table className={styles.table} style={{ fontSize: 13 }}>
            <thead>
              <tr>
                <th>#</th>
                <th>Charge Group</th>
                <th>Charge Item</th>
                <th style={{ textAlign: "center" }}>Qty</th>
                <th style={{ textAlign: "right" }}>Rate</th>
                <th style={{ textAlign: "right" }}>Gross</th>
                <th style={{ textAlign: "right" }}>Discount</th>
                <th style={{ textAlign: "right" }}>Net Amount</th>
              </tr>
            </thead>
            <tbody>
              {lines.map((ln: any, i: number) => (
                <tr key={ln.IbdCode || i}>
                  <td style={{ color: "var(--text-secondary)", fontWeight: 600 }}>{i + 1}</td>
                  <td>{ln.SgpName || "—"}</td>
                  <td style={{ fontWeight: 600 }}>{ln.SrvName || "—"}</td>
                  <td style={{ textAlign: "center" }}>{ln.Qty}</td>
                  <td style={{ textAlign: "right" }}>{fmtAmt(ln.Rate)}</td>
                  <td style={{ textAlign: "right" }}>{fmtAmt(ln.GrossAmt)}</td>
                  <td style={{ textAlign: "right", color: "var(--status-danger)" }}>
                    {ln.DiscAmt > 0 ? `−${fmtAmt(ln.DiscAmt)}` : "—"}
                  </td>
                  <td style={{ textAlign: "right", fontWeight: 700, color: "var(--status-success)" }}>
                    {fmtAmt(ln.NetAmt)}
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>

        <div style={{ padding: "12px 0 0", display: "flex", justifyContent: "flex-end", gap: 32, fontSize: 14, fontWeight: 700 }}>
          <span>Net Total: <span style={{ color: "var(--status-success)", fontSize: 18 }}>{fmtAmt(totalNet)}</span></span>
        </div>
      </div>
    </div>
  );
}
