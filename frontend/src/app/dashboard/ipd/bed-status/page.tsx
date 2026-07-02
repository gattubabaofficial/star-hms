"use client";

import React, { useEffect, useState, useCallback, useRef, useMemo } from "react";
import { useRouter } from "next/navigation";
import {
  Search, X, Filter, RefreshCw, ChevronUp, ChevronDown,
  ChevronsUpDown, User, Bed as BedIcon, MapPin, Phone,
  Calendar, Clock, IndianRupee, ArrowRight, Loader2
} from "lucide-react";

const API = "http://127.0.0.1:8000/api/ipd";

// ─── Types ───────────────────────────────────────────────────────────────────

interface BedRow {
  BdmCode: number;
  BdmName: string;
  FlrCode: number;
  FlrName: string;
  WrdCode: number;
  WrdName: string;
  IbsCode: number | null;
  IbsDischState: number | null;
  IpgCode: number | null;
  IpgVchNo: number | null;
  IpgDate: string | null;
  IpgTime: string;
  IpgAdvAmt: number;
  PttCode: number | null;
  PttName: string;
  PttRegNo: number | null;
  PttRefName: string;
  PttAddr: string;
  PttTelNo: string;
  AraName: string;
  StnName: string;
  Referral: string;
  IsOccupied: boolean;
}

interface DetailHeader {
  IpgCode: number;
  IpgVchNo: number;
  IpgDate: string;
  IpgTime: string;
  IpgAdvAmt: number;
  IpgDischDate: string;
  IpgDischTime: string;
  PttName: string;
  PttRegNo: number;
  PttRefName: string;
  PttAddr: string;
  PttTelNo: string;
  AraName: string;
  StnName: string;
  BdmName: string;
  FlrName: string;
  WrdName: string;
  IbsDischDate: string;
  IbsDischTime: string;
  IsOccupied: boolean;
}

interface Transaction {
  TrnCode: number;
  TrnLabel: string;
  TrnVchNo: number;
  TrnDate: string;
  TrnAmtAftDisc: number;
  TrnDrAmt: number;
  TrnCrAmt: number;
  TrnDiscAmt: number;
  TrnRunBal: number;
}

interface FilterState {
  pat_name: string;
  uhid: string;
  care_of: string;
  area: string;
  station: string;
  ipd_no: string;
  bed_no: string;
  floor: string;
  ward: string;
  admitted_only: boolean;
}

const EMPTY_FILTER: FilterState = {
  pat_name: "", uhid: "", care_of: "", area: "",
  station: "", ipd_no: "", bed_no: "", floor: "",
  ward: "", admitted_only: false,
};

type SortDir = "asc" | "desc" | null;
interface SortState { col: string; dir: SortDir; }

const COLS = [
  { key: "IpgVchNo",   label: "IPD No",        width: 80  },
  { key: "IpgDate",    label: "DOA",            width: 100 },
  { key: "IpgTime",    label: "TOA",            width: 70  },
  { key: "BdmName",    label: "Bed No",         width: 80  },
  { key: "WrdName",    label: "Ward Name",      width: 130 },
  { key: "PttName",    label: "Patient Name",   width: 180 },
  { key: "PttRegNo",   label: "UHID",           width: 80  },
  { key: "PttRefName", label: "Care Of",        width: 160 },
  { key: "PttAddr",    label: "Address",        width: 200 },
  { key: "PttTelNo",   label: "Contact No",     width: 120 },
  { key: "AraName",    label: "Area",           width: 110 },
  { key: "StnName",    label: "Station",        width: 110 },
  { key: "Referral",   label: "Referral",       width: 140 },
] as const;

const PAGE_SIZE = 50;

// ─── Component ───────────────────────────────────────────────────────────────

export default function BedStatusPage() {
  const router = useRouter();

  // Data state
  const [rows, setRows] = useState<BedRow[]>([]);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState("");

  // Filter state
  const [filter, setFilter] = useState<FilterState>(EMPTY_FILTER);
  const [pendingFilter, setPendingFilter] = useState<FilterState>(EMPTY_FILTER);
  const [showFilter, setShowFilter] = useState(true);

  // Grid state
  const [sort, setSort] = useState<SortState>({ col: "", dir: null });
  const [page, setPage] = useState(1);
  const [selectedRow, setSelectedRow] = useState<BedRow | null>(null);
  const clickTimer = useRef<ReturnType<typeof setTimeout> | null>(null);

  // Detail panel state
  const [detailLoading, setDetailLoading] = useState(false);
  const [detailHeader, setDetailHeader] = useState<DetailHeader | null>(null);
  const [detailTrns, setDetailTrns] = useState<Transaction[]>([]);
  const [showDetail, setShowDetail] = useState(false);

  // ── Fetch main grid data ────────────────────────────────────────────────────
  const fetchData = useCallback(async (f: FilterState) => {
    setLoading(true);
    setError("");
    try {
      const params = new URLSearchParams();
      if (f.pat_name)     params.append("pat_name",      f.pat_name);
      if (f.uhid)         params.append("uhid",          f.uhid);
      if (f.care_of)      params.append("care_of",       f.care_of);
      if (f.area)         params.append("area",          f.area);
      if (f.station)      params.append("station",       f.station);
      if (f.ipd_no)       params.append("ipd_no",        f.ipd_no);
      if (f.bed_no)       params.append("bed_no",        f.bed_no);
      if (f.floor)        params.append("floor",         f.floor);
      if (f.ward)         params.append("ward",          f.ward);
      if (f.admitted_only) params.append("admitted_only","true");

      const res = await fetch(`${API}/bed-status?${params}`);
      if (!res.ok) throw new Error(`Server error ${res.status}`);
      const data: BedRow[] = await res.json();
      setRows(data);
      setPage(1);
      setSelectedRow(null);
      setShowDetail(false);
    } catch (e: any) {
      setError(e.message || "Failed to load data");
    } finally {
      setLoading(false);
    }
  }, []);

  // Load on mount
  useEffect(() => { fetchData(EMPTY_FILTER); }, [fetchData]);

  // ── Fetch detail panel (FillSmryList2) ──────────────────────────────────────
  const fetchDetail = useCallback(async (ipgCode: number) => {
    setDetailLoading(true);
    try {
      const res = await fetch(`${API}/bed-status/${ipgCode}/detail`);
      if (!res.ok) throw new Error("Detail not found");
      const data = await res.json();
      setDetailHeader(data.header);
      setDetailTrns(data.transactions);
      setShowDetail(true);
    } catch (e: any) {
      setDetailHeader(null);
      setDetailTrns([]);
    } finally {
      setDetailLoading(false);
    }
  }, []);

  // ── Sort ────────────────────────────────────────────────────────────────────
  const sortedRows = useMemo(() => {
    if (!sort.col || !sort.dir) return rows;
    return [...rows].sort((a, b) => {
      const av = (a as any)[sort.col] ?? "";
      const bv = (b as any)[sort.col] ?? "";
      const cmp = String(av).localeCompare(String(bv), undefined, { numeric: true });
      return sort.dir === "asc" ? cmp : -cmp;
    });
  }, [rows, sort]);

  // ── Pagination ──────────────────────────────────────────────────────────────
  const totalPages = Math.max(1, Math.ceil(sortedRows.length / PAGE_SIZE));
  const pageRows = sortedRows.slice((page - 1) * PAGE_SIZE, page * PAGE_SIZE);

  // ── Row click / double-click ─────────────────────────────────────────────────
  const handleRowClick = (row: BedRow) => {
    if (clickTimer.current) clearTimeout(clickTimer.current);
    clickTimer.current = setTimeout(() => {
      // Single click → show detail panel
      setSelectedRow(row);
      if (row.IpgCode) {
        fetchDetail(row.IpgCode);
      } else {
        setShowDetail(false);
        setDetailHeader(null);
        setDetailTrns([]);
      }
    }, 220);
  };

  const handleRowDblClick = (row: BedRow) => {
    if (clickTimer.current) clearTimeout(clickTimer.current);
    // Double click → navigate to admission form in edit mode
    if (row.IpgCode) {
      router.push(`/dashboard/ipd/admission?ipg_code=${row.IpgCode}`);
    }
  };

  // ── Filter handlers ──────────────────────────────────────────────────────────
  const handleFilterChange = (key: keyof FilterState, value: string | boolean) => {
    setPendingFilter(prev => ({ ...prev, [key]: value }));
  };

  const handleShowFilter = () => {
    setFilter(pendingFilter);
    fetchData(pendingFilter);
  };

  const handleClearFilter = () => {
    setPendingFilter(EMPTY_FILTER);
    setFilter(EMPTY_FILTER);
    fetchData(EMPTY_FILTER);
  };

  // ── Sort handler ─────────────────────────────────────────────────────────────
  const handleSort = (col: string) => {
    setSort(prev => {
      if (prev.col !== col) return { col, dir: "asc" };
      if (prev.dir === "asc") return { col, dir: "desc" };
      return { col: "", dir: null };
    });
  };

  const SortIcon = ({ col }: { col: string }) => {
    if (sort.col !== col) return <ChevronsUpDown size={12} style={{ opacity: 0.4 }} />;
    return sort.dir === "asc"
      ? <ChevronUp size={12} style={{ color: "#2563eb" }} />
      : <ChevronDown size={12} style={{ color: "#2563eb" }} />;
  };

  // ── Detail transactions total ────────────────────────────────────────────────
  const trnTotals = useMemo(() => ({
    dr: detailTrns.reduce((s, t) => s + t.TrnDrAmt, 0),
    cr: detailTrns.reduce((s, t) => s + t.TrnCrAmt, 0),
    bal: detailTrns.length ? detailTrns[detailTrns.length - 1].TrnRunBal : 0,
  }), [detailTrns]);

  // ── Render ──────────────────────────────────────────────────────────────────
  return (
    <div style={{ display: "flex", flexDirection: "column", gap: "0", height: "100%" }}>

      {/* ── Top Filter Bar ─────────────────────────────────────────────────── */}
      <div style={{
        backgroundColor: "#fff",
        borderRadius: "12px",
        border: "1px solid #e5e7eb",
        marginBottom: "12px",
        overflow: "hidden",
        boxShadow: "0 1px 3px rgba(0,0,0,0.05)"
      }}>
        {/* Filter toggle header */}
        <div style={{
          display: "flex", alignItems: "center", justifyContent: "space-between",
          padding: "12px 16px", borderBottom: showFilter ? "1px solid #e5e7eb" : "none",
          backgroundColor: "#f8fafc"
        }}>
          <div style={{ display: "flex", alignItems: "center", gap: "8px" }}>
            <Filter size={15} style={{ color: "#6b7280" }} />
            <span style={{ fontSize: "13px", fontWeight: 600, color: "#374151" }}>
              Bed / Room Status — IPD Query
            </span>
            <span style={{
              fontSize: "11px", color: "#6b7280", backgroundColor: "#f3f4f6",
              borderRadius: "20px", padding: "2px 8px", border: "1px solid #e5e7eb"
            }}>
              {loading ? "Loading…" : `${rows.length} records`}
            </span>
          </div>
          <div style={{ display: "flex", gap: "8px", alignItems: "center" }}>
            <button
              id="btn-show-filter"
              onClick={handleShowFilter}
              style={{
                display: "flex", alignItems: "center", gap: "6px",
                padding: "6px 14px", borderRadius: "7px", border: "none",
                backgroundColor: "#2563eb", color: "#fff",
                fontSize: "12px", fontWeight: 600, cursor: "pointer"
              }}
            >
              <Search size={13} /> Show Filter
            </button>
            <button
              id="btn-clear-filter"
              onClick={handleClearFilter}
              style={{
                display: "flex", alignItems: "center", gap: "6px",
                padding: "6px 14px", borderRadius: "7px",
                border: "1px solid #d1d5db", backgroundColor: "#fff",
                color: "#374151", fontSize: "12px", fontWeight: 600, cursor: "pointer"
              }}
            >
              <X size={13} /> Clear Filter
            </button>
            <button
              onClick={() => setShowFilter(v => !v)}
              style={{
                padding: "6px 10px", borderRadius: "7px",
                border: "1px solid #d1d5db", backgroundColor: "#fff",
                color: "#6b7280", fontSize: "12px", cursor: "pointer"
              }}
            >
              {showFilter ? <ChevronUp size={14} /> : <ChevronDown size={14} />}
            </button>
          </div>
        </div>

        {/* Filter fields */}
        {showFilter && (
          <div style={{ padding: "14px 16px" }}>
            <div style={{
              display: "grid",
              gridTemplateColumns: "repeat(auto-fill, minmax(180px, 1fr))",
              gap: "10px"
            }}>
              {[
                { key: "pat_name",  label: "Patient Name", ph: "Search name…" },
                { key: "uhid",      label: "UHID / Reg No", ph: "Exact match" },
                { key: "care_of",   label: "Care Of",       ph: "Search…" },
                { key: "area",      label: "Area",          ph: "Search…" },
                { key: "station",   label: "Station",       ph: "Search…" },
                { key: "ipd_no",    label: "IPD No",        ph: "Exact no." },
                { key: "bed_no",    label: "Bed No",        ph: "Search…" },
                { key: "floor",     label: "Floor",         ph: "Search…" },
                { key: "ward",      label: "Ward",          ph: "Search…" },
              ].map(({ key, label, ph }) => (
                <div key={key}>
                  <label style={{ fontSize: "10px", fontWeight: 600, color: "#6b7280", textTransform: "uppercase", letterSpacing: "0.05em" }}>
                    {label}
                  </label>
                  <input
                    id={`filter-${key}`}
                    type="text"
                    placeholder={ph}
                    value={(pendingFilter as any)[key]}
                    onChange={e => handleFilterChange(key as keyof FilterState, e.target.value)}
                    onKeyDown={e => e.key === "Enter" && handleShowFilter()}
                    suppressHydrationWarning
                    style={{
                      width: "100%", marginTop: "4px", padding: "6px 10px",
                      border: "1px solid #d1d5db", borderRadius: "6px",
                      fontSize: "12px", outline: "none", boxSizing: "border-box",
                      fontFamily: "inherit", color: "#111827",
                      backgroundColor: "#fff",
                    }}
                  />
                </div>
              ))}
              {/* Admitted Only checkbox */}
              <div style={{ display: "flex", alignItems: "flex-end", paddingBottom: "2px" }}>
                <label style={{ display: "flex", alignItems: "center", gap: "8px", cursor: "pointer", fontSize: "12px", fontWeight: 600, color: "#374151" }}>
                  <input
                    id="filter-admitted-only"
                    type="checkbox"
                    checked={pendingFilter.admitted_only}
                    onChange={e => handleFilterChange("admitted_only", e.target.checked)}
                    suppressHydrationWarning
                    style={{ width: "14px", height: "14px", accentColor: "#2563eb", cursor: "pointer" }}
                  />
                  Admitted Only
                </label>
              </div>
            </div>
          </div>
        )}
      </div>

      {/* ── Error ─────────────────────────────────────────────────────────────── */}
      {error && (
        <div style={{
          padding: "10px 14px", backgroundColor: "#fef2f2", border: "1px solid #fecaca",
          borderRadius: "8px", color: "#dc2626", fontSize: "12px", marginBottom: "12px"
        }}>
          {error}
        </div>
      )}

      {/* ── Main split layout ─────────────────────────────────────────────────── */}
      <div style={{ display: "flex", gap: "12px", flex: 1, minHeight: 0 }}>

        {/* ── Data Grid ───────────────────────────────────────────────────────── */}
        <div style={{
          flex: 1, display: "flex", flexDirection: "column", minWidth: 0,
          backgroundColor: "#fff", borderRadius: "12px",
          border: "1px solid #e5e7eb", overflow: "hidden",
          boxShadow: "0 1px 3px rgba(0,0,0,0.05)"
        }}>
          {loading && (
            <div style={{
              display: "flex", alignItems: "center", justifyContent: "center",
              gap: "10px", padding: "40px", color: "#6b7280", fontSize: "13px"
            }}>
              <Loader2 size={18} style={{ animation: "spin 1s linear infinite" }} />
              Loading data…
            </div>
          )}

          {!loading && (
            <>
              <div style={{ overflowX: "auto", overflowY: "auto", flex: 1 }}>
                <table style={{
                  width: "100%", borderCollapse: "collapse",
                  fontSize: "12px", tableLayout: "fixed",
                }}>
                  {/* Sticky header */}
                  <thead style={{ position: "sticky", top: 0, zIndex: 10 }}>
                    <tr style={{ backgroundColor: "#f8fafc" }}>
                      {COLS.map(c => (
                        <th
                          key={c.key}
                          onClick={() => handleSort(c.key)}
                          style={{
                            padding: "8px 10px",
                            textAlign: "left",
                            fontSize: "10px",
                            fontWeight: 700,
                            color: "#6b7280",
                            textTransform: "uppercase",
                            letterSpacing: "0.05em",
                            borderBottom: "2px solid #e5e7eb",
                            width: c.width,
                            minWidth: c.width,
                            cursor: "pointer",
                            userSelect: "none",
                            whiteSpace: "nowrap",
                            overflow: "hidden",
                            resize: "horizontal",
                            position: "relative",
                          }}
                        >
                          <div style={{ display: "flex", alignItems: "center", gap: "4px" }}>
                            {c.label}
                            <SortIcon col={c.key} />
                          </div>
                        </th>
                      ))}
                    </tr>
                  </thead>

                  <tbody>
                    {pageRows.length === 0 && (
                      <tr>
                        <td colSpan={COLS.length} style={{
                          textAlign: "center", padding: "40px",
                          color: "#9ca3af", fontSize: "13px"
                        }}>
                          No records found. Adjust filters and click Show Filter.
                        </td>
                      </tr>
                    )}
                    {pageRows.map((row, idx) => {
                      const isSelected = selectedRow?.BdmCode === row.BdmCode;
                      const isOdd = idx % 2 === 1;

                      return (
                        <tr
                          key={`${row.BdmCode}-${row.IbsCode ?? "v"}`}
                          id={`grid-row-${row.BdmCode}`}
                          onClick={() => handleRowClick(row)}
                          onDoubleClick={() => handleRowDblClick(row)}
                          style={{
                            backgroundColor: isSelected
                              ? "#eff6ff"
                              : row.IsOccupied
                                ? (isOdd ? "#fff7ed" : "#fffbf5")
                                : (isOdd ? "#f0fdf4" : "#f8fff8"),
                            cursor: "pointer",
                            transition: "background 0.1s",
                            borderBottom: "1px solid #f3f4f6",
                          }}
                          onMouseEnter={e => {
                            if (!isSelected) (e.currentTarget as HTMLElement).style.backgroundColor = "#f0f9ff";
                          }}
                          onMouseLeave={e => {
                            if (!isSelected) (e.currentTarget as HTMLElement).style.backgroundColor =
                              row.IsOccupied
                                ? (isOdd ? "#fff7ed" : "#fffbf5")
                                : (isOdd ? "#f0fdf4" : "#f8fff8");
                          }}
                        >
                          {/* IPD No */}
                          <td style={{ padding: "7px 10px", fontWeight: 600, color: row.IpgVchNo ? "#1d4ed8" : "#9ca3af", overflow: "hidden", textOverflow: "ellipsis", whiteSpace: "nowrap" }}>
                            {row.IpgVchNo ?? "—"}
                          </td>
                          {/* DOA */}
                          <td style={{ padding: "7px 10px", color: "#374151", overflow: "hidden", textOverflow: "ellipsis", whiteSpace: "nowrap" }}>
                            {row.IpgDate ?? ""}
                          </td>
                          {/* TOA */}
                          <td style={{ padding: "7px 10px", color: "#374151", overflow: "hidden", textOverflow: "ellipsis", whiteSpace: "nowrap" }}>
                            {row.IpgTime}
                          </td>
                          {/* Bed No */}
                          <td style={{ padding: "7px 10px", fontWeight: 600, color: "#111827", overflow: "hidden", textOverflow: "ellipsis", whiteSpace: "nowrap" }}>
                            <span style={{
                              display: "inline-block",
                              padding: "1px 7px", borderRadius: "4px",
                              fontSize: "11px", fontWeight: 700,
                              backgroundColor: row.IsOccupied ? "#fee2e2" : "#dcfce7",
                              color: row.IsOccupied ? "#dc2626" : "#16a34a",
                            }}>
                              {row.BdmName}
                            </span>
                          </td>
                          {/* Ward Name */}
                          <td style={{ padding: "7px 10px", color: "#374151", overflow: "hidden", textOverflow: "ellipsis", whiteSpace: "nowrap" }}>
                            {row.WrdName}
                          </td>
                          {/* Patient Name */}
                          <td style={{ padding: "7px 10px", fontWeight: row.PttName ? 600 : 400, color: row.PttName ? "#111827" : "#9ca3af", overflow: "hidden", textOverflow: "ellipsis", whiteSpace: "nowrap" }}>
                            {row.PttName || "Vacant"}
                          </td>
                          {/* UHID */}
                          <td style={{ padding: "7px 10px", color: "#374151", overflow: "hidden", textOverflow: "ellipsis", whiteSpace: "nowrap" }}>
                            {row.PttRegNo ?? ""}
                          </td>
                          {/* Care Of */}
                          <td style={{ padding: "7px 10px", color: "#374151", overflow: "hidden", textOverflow: "ellipsis", whiteSpace: "nowrap" }}>
                            {row.PttRefName}
                          </td>
                          {/* Address */}
                          <td style={{ padding: "7px 10px", color: "#6b7280", overflow: "hidden", textOverflow: "ellipsis", whiteSpace: "nowrap" }}>
                            {row.PttAddr}
                          </td>
                          {/* Contact No */}
                          <td style={{ padding: "7px 10px", color: "#374151", overflow: "hidden", textOverflow: "ellipsis", whiteSpace: "nowrap" }}>
                            {row.PttTelNo}
                          </td>
                          {/* Area */}
                          <td style={{ padding: "7px 10px", color: "#374151", overflow: "hidden", textOverflow: "ellipsis", whiteSpace: "nowrap" }}>
                            {row.AraName}
                          </td>
                          {/* Station */}
                          <td style={{ padding: "7px 10px", color: "#374151", overflow: "hidden", textOverflow: "ellipsis", whiteSpace: "nowrap" }}>
                            {row.StnName}
                          </td>
                          {/* Referral */}
                          <td style={{ padding: "7px 10px", color: "#374151", overflow: "hidden", textOverflow: "ellipsis", whiteSpace: "nowrap" }}>
                            {row.Referral}
                          </td>
                        </tr>
                      );
                    })}
                  </tbody>
                </table>
              </div>

              {/* ── Pagination ──────────────────────────────────────────────── */}
              <div style={{
                display: "flex", alignItems: "center", justifyContent: "space-between",
                padding: "8px 14px", borderTop: "1px solid #f3f4f6",
                backgroundColor: "#f8fafc", fontSize: "12px"
              }}>
                <span style={{ color: "#6b7280" }}>
                  Showing {Math.min((page - 1) * PAGE_SIZE + 1, rows.length)}–{Math.min(page * PAGE_SIZE, rows.length)} of {rows.length}
                  &nbsp;·&nbsp;
                  <span style={{ color: "#10b981", fontWeight: 600 }}>
                    {rows.filter(r => !r.IsOccupied).length} vacant
                  </span>
                  &nbsp;·&nbsp;
                  <span style={{ color: "#ef4444", fontWeight: 600 }}>
                    {rows.filter(r => r.IsOccupied).length} occupied
                  </span>
                </span>
                <div style={{ display: "flex", gap: "4px" }}>
                  <button
                    onClick={() => setPage(p => Math.max(1, p - 1))}
                    disabled={page === 1}
                    style={{
                      padding: "4px 10px", borderRadius: "5px",
                      border: "1px solid #d1d5db", backgroundColor: page === 1 ? "#f9fafb" : "#fff",
                      color: page === 1 ? "#9ca3af" : "#374151",
                      cursor: page === 1 ? "not-allowed" : "pointer", fontSize: "12px"
                    }}
                  >← Prev</button>
                  {Array.from({ length: Math.min(totalPages, 7) }, (_, i) => {
                    const pg = totalPages <= 7 ? i + 1 : (page <= 4 ? i + 1 : page - 3 + i);
                    if (pg < 1 || pg > totalPages) return null;
                    return (
                      <button key={pg} onClick={() => setPage(pg)} style={{
                        padding: "4px 9px", borderRadius: "5px",
                        border: "1px solid #d1d5db",
                        backgroundColor: pg === page ? "#2563eb" : "#fff",
                        color: pg === page ? "#fff" : "#374151",
                        cursor: "pointer", fontSize: "12px", fontWeight: pg === page ? 700 : 400
                      }}>{pg}</button>
                    );
                  })}
                  <button
                    onClick={() => setPage(p => Math.min(totalPages, p + 1))}
                    disabled={page === totalPages}
                    style={{
                      padding: "4px 10px", borderRadius: "5px",
                      border: "1px solid #d1d5db", backgroundColor: page === totalPages ? "#f9fafb" : "#fff",
                      color: page === totalPages ? "#9ca3af" : "#374151",
                      cursor: page === totalPages ? "not-allowed" : "pointer", fontSize: "12px"
                    }}
                  >Next →</button>
                </div>
              </div>
            </>
          )}
        </div>

        {/* ── Detail Panel (FillSmryList2) ───────────────────────────────────── */}
        {showDetail && (
          <div style={{
            width: "360px", flexShrink: 0,
            backgroundColor: "#fff",
            borderRadius: "12px",
            border: "1px solid #e5e7eb",
            overflow: "hidden",
            boxShadow: "0 1px 3px rgba(0,0,0,0.05)",
            display: "flex", flexDirection: "column"
          }}>
            {detailLoading ? (
              <div style={{ display: "flex", alignItems: "center", justifyContent: "center", padding: "40px", color: "#6b7280", fontSize: "13px", gap: "8px" }}>
                <Loader2 size={16} style={{ animation: "spin 1s linear infinite" }} /> Loading…
              </div>
            ) : detailHeader ? (
              <>
                {/* Header */}
                <div style={{ padding: "12px 14px", backgroundColor: "#1e3a5f", color: "#fff" }}>
                  <div style={{ display: "flex", justifyContent: "space-between", alignItems: "flex-start" }}>
                    <div>
                      <div style={{ fontSize: "14px", fontWeight: 700 }}>{detailHeader.PttName}</div>
                      <div style={{ fontSize: "11px", opacity: 0.8, marginTop: "2px" }}>
                        UHID: {detailHeader.PttRegNo} &nbsp;·&nbsp; IPD #{detailHeader.IpgVchNo}
                      </div>
                    </div>
                    <button onClick={() => setShowDetail(false)} style={{ background: "none", border: "none", color: "#fff", cursor: "pointer", opacity: 0.7, padding: "2px" }}>
                      <X size={16} />
                    </button>
                  </div>
                </div>

                {/* Patient info labels */}
                <div style={{ padding: "12px 14px", borderBottom: "1px solid #f3f4f6", overflowY: "auto" }}>
                  {[
                    { icon: User, label: "Care Of",   val: detailHeader.PttRefName },
                    { icon: MapPin, label: "Area",    val: detailHeader.AraName },
                    { icon: MapPin, label: "Station", val: detailHeader.StnName },
                    { icon: BedIcon, label: "Bed",    val: detailHeader.BdmName },
                    { icon: MapPin, label: "Floor",   val: detailHeader.FlrName },
                    { icon: MapPin, label: "Ward",    val: detailHeader.WrdName },
                    { icon: Calendar, label: "DOA",   val: detailHeader.IpgDate },
                    { icon: Clock, label: "TOA",      val: detailHeader.IpgTime },
                    ...(detailHeader.IbsDischDate ? [
                      { icon: Calendar, label: "D.Date",  val: detailHeader.IbsDischDate },
                      { icon: Clock,    label: "D.Time",  val: detailHeader.IbsDischTime },
                    ] : []),
                    { icon: Phone, label: "Contact",  val: detailHeader.PttTelNo },
                  ].map(({ icon: Icon, label, val }) => val ? (
                    <div key={label} style={{ display: "flex", gap: "8px", alignItems: "flex-start", marginBottom: "5px" }}>
                      <Icon size={12} style={{ color: "#6b7280", marginTop: "2px", flexShrink: 0 }} />
                      <span style={{ fontSize: "11px", color: "#6b7280", minWidth: "54px", flexShrink: 0 }}>{label}:</span>
                      <span style={{ fontSize: "11px", color: "#111827", fontWeight: 500 }}>{val}</span>
                    </div>
                  ) : null)}

                  {/* Open admission button */}
                  {detailHeader.IpgCode && (
                    <button
                      id="btn-open-admission"
                      onClick={() => router.push(`/dashboard/ipd/admission?ipg_code=${detailHeader.IpgCode}`)}
                      style={{
                        display: "flex", alignItems: "center", gap: "6px", marginTop: "10px",
                        width: "100%", padding: "7px 12px", borderRadius: "7px",
                        border: "1px solid #2563eb", backgroundColor: "#eff6ff",
                        color: "#2563eb", fontSize: "11px", fontWeight: 600, cursor: "pointer"
                      }}
                    >
                      <ArrowRight size={12} /> Open IPD Registration
                    </button>
                  )}
                </div>

                {/* Transactions grid (Mfgrd2 equivalent) */}
                <div style={{ flex: 1, overflowY: "auto" }}>
                  <div style={{ padding: "8px 14px 4px", fontSize: "10px", fontWeight: 700, color: "#6b7280", textTransform: "uppercase", letterSpacing: "0.05em" }}>
                    Billing Summary
                  </div>
                  {detailTrns.length === 0 ? (
                    <div style={{ padding: "16px 14px", fontSize: "12px", color: "#9ca3af", fontStyle: "italic" }}>
                      No transactions found.
                    </div>
                  ) : (
                    <table style={{ width: "100%", borderCollapse: "collapse", fontSize: "11px" }}>
                      <thead>
                        <tr style={{ backgroundColor: "#f8fafc" }}>
                          {["Type", "Vch#", "Date", "Dr", "Cr", "Balance"].map(h => (
                            <th key={h} style={{ padding: "5px 8px", textAlign: "right", fontSize: "9px", fontWeight: 700, color: "#6b7280", textTransform: "uppercase", borderBottom: "1px solid #e5e7eb", letterSpacing: "0.04em" }}>
                              {h === "Type" ? <span style={{ textAlign: "left", display: "block" }}>{h}</span> : h}
                            </th>
                          ))}
                        </tr>
                      </thead>
                      <tbody>
                        {detailTrns.map((t, i) => (
                          <tr key={i} style={{ borderBottom: "1px solid #f9fafb", backgroundColor: i % 2 ? "#fafafa" : "#fff" }}>
                            <td style={{ padding: "4px 8px", color: "#374151", fontWeight: 500 }}>{t.TrnLabel}</td>
                            <td style={{ padding: "4px 8px", textAlign: "right", color: "#6b7280" }}>{t.TrnVchNo}</td>
                            <td style={{ padding: "4px 8px", textAlign: "right", color: "#6b7280", whiteSpace: "nowrap" }}>{t.TrnDate}</td>
                            <td style={{ padding: "4px 8px", textAlign: "right", color: t.TrnDrAmt > 0 ? "#dc2626" : "#9ca3af" }}>
                              {t.TrnDrAmt > 0 ? t.TrnDrAmt.toLocaleString("en-IN", { minimumFractionDigits: 2 }) : ""}
                            </td>
                            <td style={{ padding: "4px 8px", textAlign: "right", color: t.TrnCrAmt > 0 ? "#16a34a" : "#9ca3af" }}>
                              {t.TrnCrAmt > 0 ? t.TrnCrAmt.toLocaleString("en-IN", { minimumFractionDigits: 2 }) : ""}
                            </td>
                            <td style={{ padding: "4px 8px", textAlign: "right", fontWeight: 600, color: t.TrnRunBal > 0 ? "#dc2626" : "#16a34a" }}>
                              {Math.abs(t.TrnRunBal).toLocaleString("en-IN", { minimumFractionDigits: 2 })}
                            </td>
                          </tr>
                        ))}
                      </tbody>
                      <tfoot>
                        <tr style={{ backgroundColor: "#f8fafc", borderTop: "2px solid #e5e7eb" }}>
                          <td colSpan={3} style={{ padding: "5px 8px", fontSize: "10px", fontWeight: 700, color: "#374151" }}>TOTAL</td>
                          <td style={{ padding: "5px 8px", textAlign: "right", fontSize: "11px", fontWeight: 700, color: "#dc2626" }}>
                            {trnTotals.dr.toLocaleString("en-IN", { minimumFractionDigits: 2 })}
                          </td>
                          <td style={{ padding: "5px 8px", textAlign: "right", fontSize: "11px", fontWeight: 700, color: "#16a34a" }}>
                            {trnTotals.cr.toLocaleString("en-IN", { minimumFractionDigits: 2 })}
                          </td>
                          <td style={{ padding: "5px 8px", textAlign: "right", fontSize: "11px", fontWeight: 700, color: trnTotals.bal > 0 ? "#dc2626" : "#16a34a" }}>
                            {Math.abs(trnTotals.bal).toLocaleString("en-IN", { minimumFractionDigits: 2 })}
                          </td>
                        </tr>
                      </tfoot>
                    </table>
                  )}
                </div>
              </>
            ) : (
              <div style={{ padding: "24px 16px", fontSize: "12px", color: "#9ca3af", textAlign: "center" }}>
                <BedIcon size={32} style={{ margin: "0 auto 10px", display: "block", opacity: 0.3 }} />
                This bed is vacant.
              </div>
            )}
          </div>
        )}
      </div>

      {/* Spinner animation */}
      <style>{`
        @keyframes spin { from { transform: rotate(0deg); } to { transform: rotate(360deg); } }
      `}</style>
    </div>
  );
}
