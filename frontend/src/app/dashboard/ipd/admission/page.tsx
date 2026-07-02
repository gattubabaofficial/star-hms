"use client";

import React, { useEffect, useState, useCallback } from "react";
import { useSearchParams } from "next/navigation";
import styles from "../../../dashboard.module.css";
import {
  Plus, Pencil, Trash2, Printer, LogOut, ArrowLeftRight,
  Download, Link2, Search, RefreshCw, X, Check, AlertCircle,
  BedDouble, User, CalendarDays, ChevronDown
} from "lucide-react";

const API = "http://127.0.0.1:8000/api/ipd";
const MASTERS = "http://127.0.0.1:8000/api/masters";

// ─── Types ───────────────────────────────────────────────────────────────────
interface Reg {
  IhrCode: number;
  IhrVchNo: number;
  IhrDate: string;
  IhrPttCode: number;
  PttName: string;
  PttRegNo: number;
  DctName: string;
  BedName: string;
  IhrAdvAmt: number;
  IhrRemark: string;
  IhrStatus: "Admitted" | "Discharged";
  IpgDischDate: string | null;
  IpgBdmCode: number | null;
  IpgCDctCode: number | null;
  IhrCmpCode: number;
  IhrVtmCode?: number;
  IhrPrefix?: string;
  VtmName?: string;
  IhrTimeStr?: string;
  IhrDischTimeStr?: string;
  IpgDischMode?: string;
  OccupDays?: number;
  IhrClaimId?: string;
  Scheme?: string;
  IhrAdmitFee?: number;
  PttRefName?: string;
  PttAddr?: string;
  PttTelNo?: string;
  AraName?: string;
  StnName?: string;
  User1?: string;
  User2?: string;
  PCount?: number;
}

interface Patient { ptt_code: number; ptt_name: string; ptt_reg_no: number; }
interface Doctor  { dct_code: number; dct_name: string; dct_title: string; }
interface Bed     { bdm_code: number; bdm_name: string; BdmStatus?: string; }
interface Area    { ara_code: number; ara_name: string; ara_stn_code?: number | null; }
interface Station { stn_code: number; stn_name: string; }
interface PatientCategory { pcg_code: number; pcg_name: string; }

interface FormState {
  IhrPttCode: string;
  IpgCDctCode: string;
  IpgBdmCode: string;
  IhrDate: string;
  IhrAdvAmt: string;
  IhrRemark: string;
  IhrVtmCode: string;
  IhrPrefix: string;
  IhrVchNo: string;
  IhrTimeStr: string;
  IhrClaimId: string;
  // Patient demographic fields:
  ptt_name: string;
  ptt_sex: string;
  ptt_dob: string;
  ptt_address: string;
  ptt_telephone: string;
  ptt_sms_no: string;
  ptt_email: string;
  ptt_pcg_code: string;
  ptt_remark: string;
  ptt_ref_rela: string;
  ptt_ref_name: string;
  ptt_ara_code: string;
  ptt_stn_code: string;
  ptt_age: string;
}

interface LinkedTrans {
  IhrCode: number;
  advances: Array<{ code: number; date: string; vch_no: number; amount: number; remark: string }>;
  refunds:  Array<{ code: number; date: string; vch_no: number; amount: number; remark: string }>;
  bills:    Array<{ code: number; date: string; vch_no: number; type: string; total: number; balance: number; status: string }>;
  bed_logs: Array<{ code: number; date: string; bed_code: number; remark: string }>;
}

const EMPTY_FORM: FormState = {
  IhrPttCode: "", IpgCDctCode: "", IpgBdmCode: "",
  IhrDate: new Date().toISOString().slice(0, 10),
  IhrAdvAmt: "0", IhrRemark: "",
  IhrVtmCode: "1", IhrPrefix: "", IhrVchNo: "",
  IhrTimeStr: new Date().toTimeString().slice(0, 5),
  IhrClaimId: "",
  // Patient demographic fields:
  ptt_name: "",
  ptt_sex: "Male",
  ptt_dob: "",
  ptt_address: "",
  ptt_telephone: "",
  ptt_sms_no: "",
  ptt_email: "",
  ptt_pcg_code: "",
  ptt_remark: "",
  ptt_ref_rela: "",
  ptt_ref_name: "",
  ptt_ara_code: "",
  ptt_stn_code: "",
  ptt_age: "",
};

// ─── Component ───────────────────────────────────────────────────────────────
export default function IPDAdmissionRegistrationPage() {
  const searchParams = useSearchParams();
  const ipgCodeParam = searchParams ? searchParams.get("ipg_code") : null;

  const [rows,      setRows]      = useState<Reg[]>([]);
  const [patients,  setPatients]  = useState<Patient[]>([]);
  const [doctors,   setDoctors]   = useState<Doctor[]>([]);
  const [beds,      setBeds]      = useState<Bed[]>([]);
  const [areas,     setAreas]     = useState<Area[]>([]);
  const [stations,  setStations]  = useState<Station[]>([]);
  const [categories, setCategories] = useState<PatientCategory[]>([]);
  
  const [loading,   setLoading]   = useState(true);
  const [search,    setSearch]    = useState("");
  const [statusFilter, setStatusFilter] = useState<"all"|"admitted"|"discharged">("all");
  const [selected,  setSelected]  = useState<Reg | null>(null);

  // Date range and view mode states
  const [fromDate,   setFromDate]   = useState("");
  const [toDate,     setToDate]     = useState("");
  const [viewMode,   setViewMode]   = useState<"detailed" | "date-wise" | "patient-wise" | "month-wise">("detailed");

  // Modal state
  const [showForm,          setShowForm]          = useState(false);
  const [editMode,          setEditMode]          = useState(false);
  const [form,              setForm]              = useState<FormState>(EMPTY_FORM);
  const [isPatientDisabled, setIsPatientDisabled] = useState(false);

  const [showDischarge, setShowDischarge] = useState(false);
  const [showBedShift,  setShowBedShift]  = useState(false);
  const [newBedCode,    setNewBedCode]    = useState("");
  const [bedShiftRemark,setBedShiftRemark]= useState("");
  const [showLinked,    setShowLinked]    = useState(false);
  const [linkedTrans,   setLinkedTrans]   = useState<LinkedTrans | null>(null);
  const [linkedLoading, setLinkedLoading] = useState(false);

  const [toast, setToast] = useState<{ msg: string; type: "ok"|"err" } | null>(null);

  const showToast = (msg: string, type: "ok"|"err" = "ok") => {
    setToast({ msg, type });
    setTimeout(() => setToast(null), 3500);
  };

  const token = () => typeof window !== "undefined" ? localStorage.getItem("token") || "" : "";
  const authHdr = () => ({ "Content-Type": "application/json", Authorization: `Bearer ${token()}` });

  // ── Load data ───────────────────────────────────────────────────────────────
  const load = useCallback(async () => {
    setLoading(true);
    try {
      const queryParams = new URLSearchParams();
      if (fromDate) queryParams.append("start_date", fromDate);
      if (toDate) queryParams.append("end_date", toDate);
      const qStr = queryParams.toString();
      const rUrl = qStr ? `${API}/registrations?${qStr}` : `${API}/registrations`;

      const [rRes, pRes, dRes, bRes, araRes, stnRes, catRes] = await Promise.all([
        fetch(rUrl),
        fetch(`${MASTERS}/patients`),
        fetch(`${MASTERS}/doctors`),
        fetch(`${MASTERS}/beds`),
        fetch(`${MASTERS}/areas`),
        fetch(`${MASTERS}/stations`),
        fetch(`${MASTERS}/patient-categories`),
      ]);
      if (rRes.ok) setRows(await rRes.json());
      if (pRes.ok) setPatients(await pRes.json());
      if (dRes.ok) setDoctors(await dRes.json());
      if (bRes.ok) setBeds(await bRes.json());
      if (araRes.ok) setAreas(await araRes.json());
      if (stnRes.ok) setStations(await stnRes.json());
      if (catRes.ok) setCategories(await catRes.json());
    } catch {
      showToast("Failed to load data", "err");
    } finally {
      setLoading(false);
    }
  }, [fromDate, toDate]);

  useEffect(() => { load(); }, [load]);

  // ── Auto-open from bed-status double-click (?ipg_code=) ─────────────────────
  useEffect(() => {
    if (!ipgCodeParam || rows.length === 0) return;
    const ipgCode = parseInt(ipgCodeParam, 10);
    if (isNaN(ipgCode)) return;
    const reg = rows.find(r => r.IhrCode === ipgCode);
    if (reg) {
      setSelected(reg);
      setEditMode(true);
      setShowForm(true);
      setIsPatientDisabled(true);
      setForm({
        IhrPttCode:  String(reg.IhrPttCode),
        IpgCDctCode: String(reg.IpgCDctCode || ""),
        IpgBdmCode:  String(reg.IpgBdmCode || ""),
        IhrDate:     reg.IhrDate || new Date().toISOString().slice(0, 10),
        IhrAdvAmt:   String(reg.IhrAdvAmt || 0),
        IhrRemark:   reg.IhrRemark || "",
        IhrVtmCode:  String(reg.IhrVtmCode || 1),
        IhrPrefix:   reg.IhrPrefix || "",
        IhrVchNo:    String(reg.IhrVchNo || ""),
        IhrTimeStr:  reg.IhrTimeStr || "",
        IhrClaimId:  reg.IhrClaimId || "",
        ptt_name:    reg.PttName || "",
        ptt_sex:     "Male",
        ptt_dob:     "",
        ptt_address: reg.PttAddr || "",
        ptt_telephone: reg.PttTelNo || "",
        ptt_sms_no:  "",
        ptt_email:   "",
        ptt_pcg_code: "",
        ptt_remark:  "",
        ptt_ref_rela: "",
        ptt_ref_name: reg.PttRefName || "",
        ptt_ara_code: "",
        ptt_stn_code: "",
        ptt_age:     "",
      });
    }
  // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [ipgCodeParam, rows]);

  // ── Filter rows ─────────────────────────────────────────────────────────────
  const filtered = rows.filter(r => {
    const s = search.toLowerCase();
    const matchSearch = !s || r.PttName.toLowerCase().includes(s)
      || String(r.PttRegNo).includes(s)
      || String(r.IhrVchNo).includes(s);
    const matchStatus = statusFilter === "all" || r.IhrStatus.toLowerCase() === statusFilter;
    return matchSearch && matchStatus;
  });

  const groupedData = React.useMemo(() => {
    if (viewMode === "detailed") return [];
    
    const map: Record<string, { key: string; name?: string; regNo?: number; careOf?: string; count: number; totalAdvance: number }> = {};
    
    filtered.forEach(r => {
      let key = "";
      if (viewMode === "date-wise") {
        key = r.IhrDate || "No Date";
      } else if (viewMode === "month-wise") {
        key = (r.IhrDate && r.IhrDate.slice(0, 7)) || "No Month";
      } else if (viewMode === "patient-wise") {
        key = String(r.IhrPttCode);
      }
      
      if (!map[key]) {
        map[key] = {
          key,
          name: r.PttName,
          regNo: r.PttRegNo,
          careOf: r.PttRefName || "",
          count: 0,
          totalAdvance: 0,
        };
      }
      map[key].count += 1;
      map[key].totalAdvance += Number(r.IhrAdvAmt || 0);
    });
    
    return Object.values(map);
  }, [filtered, viewMode]);

  // ── CRUD ─────────────────────────────────────────────────────────────────────
  // ── Patient master helpers ──────────────────────────────────────────────────
  const handleAgeChange = (ageVal: string) => {
    const age = parseInt(ageVal);
    if (!isNaN(age) && age >= 0) {
      const year = new Date().getFullYear() - age;
      const dobStr = `${year}-01-01`;
      setForm(p => ({ ...p, ptt_age: ageVal, ptt_dob: dobStr }));
    } else {
      setForm(p => ({ ...p, ptt_age: ageVal }));
    }
  };

  const handleDobChange = (dobVal: string) => {
    if (dobVal) {
      const birthDate = new Date(dobVal);
      const today = new Date();
      let calculatedAge = today.getFullYear() - birthDate.getFullYear();
      const m = today.getMonth() - birthDate.getMonth();
      if (m < 0 || (m === 0 && today.getDate() < birthDate.getDate())) {
        calculatedAge--;
      }
      setForm(p => ({ ...p, ptt_dob: dobVal, ptt_age: String(calculatedAge) }));
    } else {
      setForm(p => ({ ...p, ptt_dob: dobVal, ptt_age: "" }));
    }
  };

  const handlePatientChange = async (val: string) => {
    if (val === "__NEW__") {
      setForm(p => ({
        ...p,
        IhrPttCode: val,
        ptt_name: "",
        ptt_sex: "Male",
        ptt_dob: "",
        ptt_address: "",
        ptt_telephone: "",
        ptt_sms_no: "",
        ptt_email: "",
        ptt_pcg_code: "",
        ptt_remark: "",
        ptt_ref_rela: "",
        ptt_ref_name: "",
        ptt_ara_code: "",
        ptt_stn_code: "",
        ptt_age: "",
      }));
      setIsPatientDisabled(false);
    } else if (val) {
      setForm(p => ({ ...p, IhrPttCode: val }));
      setIsPatientDisabled(true);
      try {
        const res = await fetch(`${MASTERS}/patients/${val}`);
        if (res.ok) {
          const data = await res.json();
          let age = "";
          if (data.ptt_dob) {
            const birthDate = new Date(data.ptt_dob);
            const today = new Date();
            let calculatedAge = today.getFullYear() - birthDate.getFullYear();
            const m = today.getMonth() - birthDate.getMonth();
            if (m < 0 || (m === 0 && today.getDate() < birthDate.getDate())) {
              calculatedAge--;
            }
            age = String(calculatedAge);
          }
          setForm(p => ({
            ...p,
            IhrPttCode: val,
            ptt_name: data.ptt_name || "",
            ptt_sex: data.ptt_sex || "Male",
            ptt_dob: data.ptt_dob || "",
            ptt_address: data.ptt_address || "",
            ptt_telephone: data.ptt_telephone || "",
            ptt_sms_no: data.ptt_sms_no || "",
            ptt_email: data.ptt_email || "",
            ptt_pcg_code: data.ptt_pcg_code ? String(data.ptt_pcg_code) : "",
            ptt_remark: data.ptt_remark || "",
            ptt_ref_rela: data.ptt_ref_rela || "",
            ptt_ref_name: data.ptt_ref_name || "",
            ptt_ara_code: data.ptt_ara_code ? String(data.ptt_ara_code) : "",
            ptt_stn_code: data.ptt_stn_code ? String(data.ptt_stn_code) : "",
            ptt_age: age,
          }));
        }
      } catch {
        showToast("Failed to fetch patient details", "err");
      }
    } else {
      setForm(p => ({
        ...p,
        IhrPttCode: "",
        ptt_name: "",
        ptt_sex: "Male",
        ptt_dob: "",
        ptt_address: "",
        ptt_telephone: "",
        ptt_sms_no: "",
        ptt_email: "",
        ptt_pcg_code: "",
        ptt_remark: "",
        ptt_ref_rela: "",
        ptt_ref_name: "",
        ptt_ara_code: "",
        ptt_stn_code: "",
        ptt_age: "",
      }));
      setIsPatientDisabled(false);
    }
  };

  // ── CRUD ─────────────────────────────────────────────────────────────────────
  const openAdd = () => {
    setEditMode(false);
    setForm({ 
      ...EMPTY_FORM, 
      IhrDate: new Date().toISOString().slice(0, 10),
      IhrTimeStr: new Date().toTimeString().slice(0, 5)
    });
    setIsPatientDisabled(false);
    setSelected(null);
    setShowForm(true);
  };

  const openEdit = async () => {
    if (!selected) return showToast("Select a record first", "err");
    setEditMode(true);
    
    let patData = null;
    try {
      const res = await fetch(`${MASTERS}/patients/${selected.IhrPttCode}`);
      if (res.ok) patData = await res.json();
    } catch {
      showToast("Failed to fetch patient details", "err");
    }

    let age = "";
    if (patData?.ptt_dob) {
      const birthDate = new Date(patData.ptt_dob);
      const today = new Date();
      let calculatedAge = today.getFullYear() - birthDate.getFullYear();
      const m = today.getMonth() - birthDate.getMonth();
      if (m < 0 || (m === 0 && today.getDate() < birthDate.getDate())) {
        calculatedAge--;
      }
      age = String(calculatedAge);
    }

    setForm({
      IhrPttCode:   String(selected.IhrPttCode),
      IpgCDctCode:  String(selected.IpgCDctCode || ""),
      IpgBdmCode:   String(selected.IpgBdmCode || ""),
      IhrDate:      selected.IhrDate || new Date().toISOString().slice(0, 10),
      IhrAdvAmt:    String(selected.IhrAdvAmt || 0),
      IhrRemark:    selected.IhrRemark || "",
      IhrVtmCode:   String(selected.IhrVtmCode || "1"),
      IhrPrefix:    selected.IhrPrefix || "",
      IhrVchNo:     String(selected.IhrVchNo || ""),
      IhrTimeStr:   selected.IhrTimeStr || "",
      IhrClaimId:   selected.IhrClaimId || "",
      // Patient fields:
      ptt_name:     patData?.ptt_name || selected.PttName || "",
      ptt_sex:      patData?.ptt_sex || "Male",
      ptt_dob:      patData?.ptt_dob || "",
      ptt_address:  patData?.ptt_address || selected.PttAddr || "",
      ptt_telephone: patData?.ptt_telephone || selected.PttTelNo || "",
      ptt_sms_no:   patData?.ptt_sms_no || "",
      ptt_email:    patData?.ptt_email || "",
      ptt_pcg_code: patData?.ptt_pcg_code ? String(patData.ptt_pcg_code) : "",
      ptt_remark:   patData?.ptt_remark || "",
      ptt_ref_rela: patData?.ptt_ref_rela || "",
      ptt_ref_name: patData?.ptt_ref_name || selected.PttRefName || "",
      ptt_ara_code: patData?.ptt_ara_code ? String(patData.ptt_ara_code) : "",
      ptt_stn_code: patData?.ptt_stn_code ? String(patData.ptt_stn_code) : "",
      ptt_age:      age,
    });
    setIsPatientDisabled(true);
    setShowForm(true);
  };

  const handleSave = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!form.IhrPttCode) return showToast("Patient is required", "err");

    const timeToMin = (tStr: string): number => {
      if (!tStr) return 0;
      const [h, m] = tStr.split(":").map(Number);
      return (h || 0) * 60 + (m || 0);
    };

    let pttCode = form.IhrPttCode;
    // Inline create patient if __NEW__
    if (pttCode === "__NEW__") {
      const patientPayload = {
        ptt_name: form.ptt_name,
        ptt_sex: form.ptt_sex,
        ptt_dob: form.ptt_dob || null,
        ptt_address: form.ptt_address || null,
        ptt_telephone: form.ptt_telephone || null,
        ptt_sms_no: form.ptt_sms_no || null,
        ptt_email: form.ptt_email || null,
        ptt_pcg_code: form.ptt_pcg_code ? Number(form.ptt_pcg_code) : null,
        ptt_remark: form.ptt_remark || null,
        ptt_ref_rela: form.ptt_ref_rela || null,
        ptt_ref_name: form.ptt_ref_name || null,
        ptt_ara_code: form.ptt_ara_code ? Number(form.ptt_ara_code) : null,
        ptt_stn_code: form.ptt_stn_code ? Number(form.ptt_stn_code) : null,
      };

      try {
        const patRes = await fetch(`${MASTERS}/patients`, {
          method: "POST",
          headers: authHdr(),
          body: JSON.stringify(patientPayload),
        });
        if (patRes.ok) {
          const patData = await patRes.json();
          pttCode = String(patData.ptt_code);
          // Add newly created patient to local state list
          setPatients(prev => [...prev, { ptt_code: patData.ptt_code, ptt_name: patData.ptt_name, ptt_reg_no: patData.ptt_reg_no }]);
        } else {
          const patErr = await patRes.json();
          showToast(patErr.detail || "Patient registration failed", "err");
          return;
        }
      } catch {
        showToast("Network error registering patient", "err");
        return;
      }
    }

    const payload = {
      IhrPttCode:   Number(pttCode),
      IpgCDctCode:  form.IpgCDctCode ? Number(form.IpgCDctCode) : null,
      IpgBdmCode:   form.IpgBdmCode  ? Number(form.IpgBdmCode)  : null,
      IhrDate:      form.IhrDate,
      IhrTime:      timeToMin(form.IhrTimeStr),
      IhrAdvAmt:    Number(form.IhrAdvAmt || 0),
      IhrRemark:    form.IhrRemark,
      IhrVtmCode:   Number(form.IhrVtmCode || 1),
      IhrPrefix:    form.IhrPrefix,
      IhrVchNo:     form.IhrVchNo ? Number(form.IhrVchNo) : undefined,
      IhrClaimId:   form.IhrClaimId,
    };
    try {
      const url = editMode ? `${API}/registrations/${selected!.IhrCode}` : `${API}/registrations`;
      const res = await fetch(url, { method: editMode ? "PUT" : "POST", headers: authHdr(), body: JSON.stringify(payload) });
      if (res.ok) {
        showToast(editMode ? "Record updated" : "Admission created");
        setShowForm(false);
        await load();
      } else {
        const e = await res.json();
        showToast(e.detail || "Save failed", "err");
      }
    } catch { showToast("Network error", "err"); }
  };

  const handleDelete = async () => {
    if (!selected) return showToast("Select a record first", "err");
    if (!confirm(`Delete admission #${selected.IhrVchNo} for ${selected.PttName}?`)) return;
    try {
      const res = await fetch(`${API}/registrations/${selected.IhrCode}`, { method: "DELETE", headers: authHdr() });
      if (res.ok) { showToast("Record deleted"); setSelected(null); await load(); }
      else showToast("Delete failed", "err");
    } catch { showToast("Network error", "err"); }
  };

  const handleDischarge = async () => {
    if (!selected) return;
    try {
      const res = await fetch(`${API}/registrations/${selected.IhrCode}/discharge`, {
        method: "POST", headers: authHdr(), body: JSON.stringify({})
      });
      if (res.ok) {
        showToast("Patient discharged successfully");
        setShowDischarge(false);
        setSelected(null);
        await load();
      } else {
        const e = await res.json();
        showToast(e.detail || "Discharge failed", "err");
      }
    } catch { showToast("Network error", "err"); }
  };

  const handleBedShift = async () => {
    if (!selected || !newBedCode) return showToast("Select new bed", "err");
    try {
      const res = await fetch(`${API}/registrations/${selected.IhrCode}/bedshift`, {
        method: "POST", headers: authHdr(),
        body: JSON.stringify({ new_bed_code: Number(newBedCode), remark: bedShiftRemark }),
      });
      if (res.ok) {
        showToast("Bed shifted successfully");
        setShowBedShift(false); setNewBedCode(""); setBedShiftRemark("");
        setSelected(null); await load();
      } else {
        const e = await res.json();
        showToast(e.detail || "Bed shift failed", "err");
      }
    } catch { showToast("Network error", "err"); }
  };

  const handleLinkedTrans = async () => {
    if (!selected) return showToast("Select a record first", "err");
    setLinkedLoading(true); setShowLinked(true); setLinkedTrans(null);
    try {
      const res = await fetch(`${API}/registrations/${selected.IhrCode}/linked-trans`);
      if (res.ok) setLinkedTrans(await res.json());
      else showToast("Failed to load transactions", "err");
    } catch { showToast("Network error", "err"); }
    setLinkedLoading(false);
  };

  const handleExport = () => {
    const param = statusFilter !== "all" ? `?status=${statusFilter}` : "";
    window.open(`${API}/registrations/export/csv${param}`, "_blank");
  };

  const handlePrint = () => {
    if (!selected) return showToast("Select a record first", "err");
    const w = window.open("", "_blank", "width=800,height=600");
    if (!w) return;
    w.document.write(`
      <html><head><title>IPD Admission — ${selected.IhrVchNo}</title>
      <style>
        body{font-family:Arial,sans-serif;padding:30px;color:#1e293b}
        h2{color:#0f4c81;border-bottom:2px solid #0f4c81;padding-bottom:8px}
        table{width:100%;border-collapse:collapse;margin-top:20px}
        td,th{border:1px solid #cbd5e1;padding:8px 12px;text-align:left}
        th{background:#f1f5f9;font-weight:600}
        .badge{display:inline-block;padding:3px 10px;border-radius:20px;font-size:12px;font-weight:700}
        .admitted{background:#dcfce7;color:#166534}
        .discharged{background:#fee2e2;color:#991b1b}
      </style></head><body>
      <h2>⚕ IPD Admission Registration</h2>
      <p><strong>Printed:</strong> ${new Date().toLocaleString()}</p>
      <table>
        <tr><th>Field</th><th>Value</th></tr>
        <tr><td>Admission No</td><td>${selected.IhrVchNo}</td></tr>
        <tr><td>Admission Date</td><td>${selected.IhrDate}</td></tr>
        <tr><td>Patient Name</td><td>${selected.PttName}</td></tr>
        <tr><td>Patient Reg #</td><td>${selected.PttRegNo}</td></tr>
        <tr><td>Doctor</td><td>${selected.DctName}</td></tr>
        <tr><td>Bed</td><td>${selected.BedName || selected.IpgBdmCode || "—"}</td></tr>
        <tr><td>Advance Amount</td><td>₹ ${Number(selected.IhrAdvAmt || 0).toFixed(2)}</td></tr>
        <tr><td>Status</td><td><span class="badge ${selected.IhrStatus.toLowerCase()}">${selected.IhrStatus}</span></td></tr>
        <tr><td>Discharge Date</td><td>${selected.IpgDischDate || "—"}</td></tr>
        <tr><td>Remark</td><td>${selected.IhrRemark || "—"}</td></tr>
      </table>
      <br/><p style="color:#64748b;font-size:12px">Star HMS — Confidential Medical Record</p>
      <script>window.onload=()=>{window.print();window.close()}</script>
      </body></html>
    `);
    w.document.close();
  };

  // ── Render ───────────────────────────────────────────────────────────────────
  return (
    <div style={{ display: "flex", flexDirection: "column", gap: "16px" }}>

      {/* Toast */}
      {toast && (
        <div style={{
          position: "fixed", top: "20px", right: "20px", zIndex: 9999,
          background: toast.type === "ok" ? "var(--status-success)" : "var(--status-danger)",
          color: "#fff", padding: "12px 20px", borderRadius: "10px",
          display: "flex", alignItems: "center", gap: "8px", fontSize: "13px",
          fontWeight: 600, boxShadow: "0 8px 32px rgba(0,0,0,0.2)", animation: "slideIn .3s ease"
        }}>
          {toast.type === "ok" ? <Check size={16} /> : <AlertCircle size={16} />}
          {toast.msg}
        </div>
      )}

      {/* ── Action Toolbar ── */}
      <div className={styles.sectionBox} style={{ padding: "12px 16px" }}>
        <div style={{ display: "flex", flexWrap: "wrap", gap: "8px", alignItems: "center" }}>

          {/* Primary actions */}
          <button className={styles.primaryBtn} onClick={openAdd} style={{ gap: "6px" }}>
            <Plus size={15} /> Add
          </button>
          <button
            onClick={openEdit}
            disabled={!selected}
            style={{
              display: "flex", alignItems: "center", gap: "6px",
              padding: "8px 14px", borderRadius: "8px", border: "none",
              background: selected ? "var(--accent-color)" : "var(--border-color)",
              color: selected ? "#fff" : "var(--text-muted)", cursor: selected ? "pointer" : "not-allowed",
              fontSize: "13px", fontWeight: 600
            }}
          >
            <Pencil size={14} /> Edit
          </button>
          <button
            onClick={handleDelete}
            disabled={!selected}
            style={{
              display: "flex", alignItems: "center", gap: "6px",
              padding: "8px 14px", borderRadius: "8px", border: "none",
              background: selected ? "#ef4444" : "var(--border-color)",
              color: selected ? "#fff" : "var(--text-muted)", cursor: selected ? "pointer" : "not-allowed",
              fontSize: "13px", fontWeight: 600
            }}
          >
            <Trash2 size={14} /> Delete
          </button>
          <button
            onClick={handlePrint}
            disabled={!selected}
            style={{
              display: "flex", alignItems: "center", gap: "6px",
              padding: "8px 14px", borderRadius: "8px", border: "1px solid var(--border-color)",
              background: "var(--card-bg)", color: selected ? "var(--text-primary)" : "var(--text-muted)",
              cursor: selected ? "pointer" : "not-allowed", fontSize: "13px", fontWeight: 600
            }}
          >
            <Printer size={14} /> Print
          </button>

          <div style={{ width: "1px", height: "28px", background: "var(--border-color)" }} />

          {/* IPD-specific actions */}
          <button
            onClick={() => { if (!selected) { showToast("Select a record first", "err"); return; } if (selected.IhrStatus === "Discharged") { showToast("Already discharged", "err"); return; } setShowDischarge(true); }}
            disabled={!selected}
            style={{
              display: "flex", alignItems: "center", gap: "6px",
              padding: "8px 14px", borderRadius: "8px", border: "none",
              background: selected && selected.IhrStatus === "Admitted" ? "#0f4c81" : "var(--border-color)",
              color: selected && selected.IhrStatus === "Admitted" ? "#fff" : "var(--text-muted)",
              cursor: selected ? "pointer" : "not-allowed", fontSize: "13px", fontWeight: 600
            }}
          >
            <LogOut size={14} /> Discharge
          </button>
          <button
            onClick={() => { if (!selected) { showToast("Select a record first", "err"); return; } setShowBedShift(true); }}
            disabled={!selected}
            style={{
              display: "flex", alignItems: "center", gap: "6px",
              padding: "8px 14px", borderRadius: "8px", border: "none",
              background: selected ? "#7c3aed" : "var(--border-color)",
              color: selected ? "#fff" : "var(--text-muted)",
              cursor: selected ? "pointer" : "not-allowed", fontSize: "13px", fontWeight: 600
            }}
          >
            <ArrowLeftRight size={14} /> Bed Shift
          </button>
          <button
            onClick={handleLinkedTrans}
            disabled={!selected}
            style={{
              display: "flex", alignItems: "center", gap: "6px",
              padding: "8px 14px", borderRadius: "8px", border: "none",
              background: selected ? "#0891b2" : "var(--border-color)",
              color: selected ? "#fff" : "var(--text-muted)",
              cursor: selected ? "pointer" : "not-allowed", fontSize: "13px", fontWeight: 600
            }}
          >
            <Link2 size={14} /> Linked Trans
          </button>

          <div style={{ width: "1px", height: "28px", background: "var(--border-color)" }} />

          <button
            onClick={handleExport}
            style={{
              display: "flex", alignItems: "center", gap: "6px",
              padding: "8px 14px", borderRadius: "8px", border: "1px solid #16a34a",
              background: "transparent", color: "#16a34a",
              cursor: "pointer", fontSize: "13px", fontWeight: 600
            }}
          >
            <Download size={14} /> Export CSV
          </button>
          <button onClick={load} style={{
            display: "flex", alignItems: "center", gap: "6px",
            padding: "8px 14px", borderRadius: "8px", border: "1px solid var(--border-color)",
            background: "transparent", color: "var(--text-secondary)",
            cursor: "pointer", fontSize: "13px", fontWeight: 600
          }}>
            <RefreshCw size={14} /> Refresh
          </button>

          {/* Spacer + search */}
          <div style={{ flex: 1, minWidth: "160px" }} />
          <div style={{ position: "relative" }}>
            <Search size={14} style={{ position: "absolute", left: "10px", top: "50%", transform: "translateY(-50%)", color: "var(--text-muted)" }} />
            <input
              value={search}
              onChange={e => setSearch(e.target.value)}
              placeholder="Search patient / reg / vch…"
              style={{
                paddingLeft: "32px", paddingRight: "12px", height: "34px",
                border: "1px solid var(--border-color)", borderRadius: "8px",
                background: "var(--card-bg)", color: "var(--text-primary)", fontSize: "13px", width: "220px"
              }}
            />
          </div>
          <select
            value={statusFilter}
            onChange={e => setStatusFilter(e.target.value as any)}
            style={{
              height: "34px", border: "1px solid var(--border-color)", borderRadius: "8px",
              background: "var(--card-bg)", color: "var(--text-primary)", fontSize: "13px",
              paddingLeft: "10px", paddingRight: "28px"
            }}
          >
            <option value="all">All Status</option>
            <option value="admitted">Admitted</option>
            <option value="discharged">Discharged</option>
          </select>
        </div>

        {/* Date filters and view mode */}
        <div style={{ display: "flex", flexWrap: "wrap", gap: "12px", alignItems: "center", borderTop: "1px solid var(--border-color)", paddingTop: "12px", marginTop: "12px" }}>
          <div style={{ display: "flex", alignItems: "center", gap: "6px" }}>
            <span style={{ fontSize: "12px", fontWeight: 600, color: "var(--text-secondary)" }}>From Date:</span>
            <input
              type="date"
              value={fromDate}
              onChange={e => setFromDate(e.target.value)}
              style={{
                height: "34px", border: "1px solid var(--border-color)", borderRadius: "8px",
                background: "var(--card-bg)", color: "var(--text-primary)", fontSize: "13px",
                padding: "0 10px"
              }}
            />
          </div>
          <div style={{ display: "flex", alignItems: "center", gap: "6px" }}>
            <span style={{ fontSize: "12px", fontWeight: 600, color: "var(--text-secondary)" }}>To Date:</span>
            <input
              type="date"
              value={toDate}
              onChange={e => setToDate(e.target.value)}
              style={{
                height: "34px", border: "1px solid var(--border-color)", borderRadius: "8px",
                background: "var(--card-bg)", color: "var(--text-primary)", fontSize: "13px",
                padding: "0 10px"
              }}
            />
          </div>
          <button
            onClick={() => { setFromDate(""); setToDate(""); }}
            style={{
              height: "34px", padding: "0 12px", borderRadius: "8px", border: "1px solid var(--border-color)",
              background: "transparent", color: "var(--text-secondary)", cursor: "pointer", fontSize: "12px", fontWeight: 600
            }}
          >
            Clear Dates
          </button>
          <div style={{ width: "1px", height: "24px", background: "var(--border-color)" }} />
          <div style={{ display: "flex", alignItems: "center", gap: "6px" }}>
            <span style={{ fontSize: "12px", fontWeight: 600, color: "var(--text-secondary)" }}>View Mode:</span>
            <div style={{ display: "flex", border: "1px solid var(--border-color)", borderRadius: "8px", overflow: "hidden" }}>
              {(["detailed", "date-wise", "patient-wise", "month-wise"] as const).map(mode => (
                <button
                  key={mode}
                  type="button"
                  onClick={() => setViewMode(mode)}
                  style={{
                    height: "32px", padding: "0 12px", border: "none",
                    background: viewMode === mode ? "var(--accent-color)" : "var(--card-bg)",
                    color: viewMode === mode ? "#fff" : "var(--text-secondary)",
                    cursor: "pointer", fontSize: "12px", fontWeight: 600,
                    textTransform: "capitalize"
                  }}
                >
                  {mode.replace("-", " ")}
                </button>
              ))}
            </div>
          </div>
        </div>
      </div>

      {/* ── Data Table ── */}
      <div className={styles.sectionBox} style={{ padding: 0, overflow: "hidden" }}>
        <div style={{ overflowX: "auto" }}>
          <table style={{ width: "100%", borderCollapse: "collapse", fontSize: "13px" }}>
            <thead>
              <tr style={{ background: "var(--sidebar-bg)", borderBottom: "2px solid var(--border-color)" }}>
                {viewMode === "detailed" ? (
                  ["IPD.No.", "Voucher", "Adm.Date", "Adm.Tm", "Disch.Dt", "Disch.Tm", "Disch.Mode", "Occup.Days", "Claim-ID", "Patient Name", "UHID", "Doctor Name", "Scheme", "Admit.Fee", "Care of", "Address", "Contact No.", "Area", "Station", "User1", "User2", "P.Count"].map(h => (
                    <th key={h} style={{ padding: "10px 14px", textAlign: "left", fontWeight: 700, color: "var(--text-secondary)", whiteSpace: "nowrap", fontSize: "12px" }}>{h}</th>
                  ))
                ) : viewMode === "date-wise" || viewMode === "month-wise" ? (
                  ["Group Value", "Admissions Count", "Total Advance"].map(h => (
                    <th key={h} style={{ padding: "10px 14px", textAlign: "left", fontWeight: 700, color: "var(--text-secondary)", whiteSpace: "nowrap", fontSize: "12px" }}>{h}</th>
                  ))
                ) : (
                  ["Patient Name", "UHID / Reg.No", "Care of", "Admissions Count", "Total Advance"].map(h => (
                    <th key={h} style={{ padding: "10px 14px", textAlign: "left", fontWeight: 700, color: "var(--text-secondary)", whiteSpace: "nowrap", fontSize: "12px" }}>{h}</th>
                  ))
                )}
              </tr>
            </thead>
            <tbody>
              {loading ? (
                <tr><td colSpan={viewMode === "detailed" ? 22 : 5} style={{ padding: "40px", textAlign: "center", color: "var(--text-muted)" }}>Loading admissions…</td></tr>
              ) : viewMode === "detailed" ? (
                filtered.length === 0 ? (
                  <tr><td colSpan={22} style={{ padding: "40px", textAlign: "center", color: "var(--text-muted)" }}>No records found. Click <strong>Add</strong> to create a new admission.</td></tr>
                ) : filtered.map(r => {
                  const isSelected = selected?.IhrCode === r.IhrCode;
                  return (
                    <tr
                      key={r.IhrCode}
                      onClick={() => setSelected(isSelected ? null : r)}
                      style={{
                        background: isSelected ? "var(--accent-color)15" : "transparent",
                        borderBottom: "1px solid var(--border-color)",
                        cursor: "pointer",
                        outline: isSelected ? "2px solid var(--accent-color)" : "none",
                        outlineOffset: "-2px",
                      }}
                    >
                      <td style={{ padding: "10px 14px", fontWeight: 700, color: "var(--accent-color)" }}>{r.IhrVchNo || r.IhrCode}</td>
                      <td style={{ padding: "10px 14px", whiteSpace: "nowrap" }}>{r.VtmName || "IPD Admission"}</td>
                      <td style={{ padding: "10px 14px", whiteSpace: "nowrap" }}>{r.IhrDate}</td>
                      <td style={{ padding: "10px 14px" }}>{r.IhrTimeStr || "—"}</td>
                      <td style={{ padding: "10px 14px", whiteSpace: "nowrap" }}>{r.IpgDischDate || "—"}</td>
                      <td style={{ padding: "10px 14px" }}>{r.IhrDischTimeStr || "—"}</td>
                      <td style={{ padding: "10px 14px" }}>{r.IpgDischMode || "—"}</td>
                      <td style={{ padding: "10px 14px", textAlign: "right" }}>{r.OccupDays ?? 0}</td>
                      <td style={{ padding: "10px 14px" }}>{r.IhrClaimId || "—"}</td>
                      <td style={{ padding: "10px 14px", fontWeight: 600 }}>{r.PttName}</td>
                      <td style={{ padding: "10px 14px" }}>{r.PttRegNo}</td>
                      <td style={{ padding: "10px 14px" }}>{r.DctName || "—"}</td>
                      <td style={{ padding: "10px 14px" }}>{r.Scheme || "—"}</td>
                      <td style={{ padding: "10px 14px", textAlign: "right" }}>₹{Number(r.IhrAdmitFee || 0).toFixed(2)}</td>
                      <td style={{ padding: "10px 14px" }}>{r.PttRefName || "—"}</td>
                      <td style={{ padding: "10px 14px", whiteSpace: "nowrap", overflow: "hidden", textOverflow: "ellipsis", maxWidth: "200px" }}>{r.PttAddr || "—"}</td>
                      <td style={{ padding: "10px 14px" }}>{r.PttTelNo || "—"}</td>
                      <td style={{ padding: "10px 14px" }}>{r.AraName || "—"}</td>
                      <td style={{ padding: "10px 14px" }}>{r.StnName || "—"}</td>
                      <td style={{ padding: "10px 14px" }}>{r.User1 || "Admin"}</td>
                      <td style={{ padding: "10px 14px" }}>{r.User2 || "—"}</td>
                      <td style={{ padding: "10px 14px", textAlign: "right" }}>{r.PCount ?? 0}</td>
                    </tr>
                  );
                })
              ) : (
                groupedData.length === 0 ? (
                  <tr><td colSpan={viewMode === "patient-wise" ? 5 : 3} style={{ padding: "40px", textAlign: "center", color: "var(--text-muted)" }}>No records found.</td></tr>
                ) : groupedData.map(g => (
                  <tr
                    key={g.key}
                    style={{
                      borderBottom: "1px solid var(--border-color)",
                    }}
                  >
                    {viewMode === "date-wise" || viewMode === "month-wise" ? (
                      <>
                        <td style={{ padding: "10px 14px", fontWeight: 600 }}>{g.key}</td>
                        <td style={{ padding: "10px 14px" }}>{g.count}</td>
                        <td style={{ padding: "10px 14px", fontWeight: 700 }}>₹{g.totalAdvance.toFixed(2)}</td>
                      </>
                    ) : (
                      <>
                        <td style={{ padding: "10px 14px", fontWeight: 600 }}>{g.name}</td>
                        <td style={{ padding: "10px 14px" }}>{g.regNo || "—"}</td>
                        <td style={{ padding: "10px 14px" }}>{g.careOf || "—"}</td>
                        <td style={{ padding: "10px 14px" }}>{g.count}</td>
                        <td style={{ padding: "10px 14px", fontWeight: 700 }}>₹{g.totalAdvance.toFixed(2)}</td>
                      </>
                    )}
                  </tr>
                ))
              )}
            </tbody>
          </table>
        </div>
        <div style={{ padding: "10px 16px", borderTop: "1px solid var(--border-color)", fontSize: "12px", color: "var(--text-muted)", display: "flex", gap: "16px" }}>
          <span>Total Rows: <strong>{viewMode === "detailed" ? filtered.length : groupedData.length}</strong></span>
          {viewMode === "detailed" && (
            <>
              <span>Admitted: <strong style={{ color: "#166534" }}>{filtered.filter(r => r.IhrStatus === "Admitted").length}</strong></span>
              <span>Discharged: <strong style={{ color: "#991b1b" }}>{filtered.filter(r => r.IhrStatus === "Discharged").length}</strong></span>
            </>
          )}
          {selected && <span style={{ marginLeft: "auto" }}>Selected: <strong>{selected.PttName}</strong></span>}
        </div>
      </div>

      {/* ═══════════════════════════════════════════════════════════════════════
          ADD / EDIT MODAL
      ═══════════════════════════════════════════════════════════════════════ */}
      {/* ═══════════════════════════════════════════════════════════════════════
          ADD / EDIT MODAL
      ═══════════════════════════════════════════════════════════════════════ */}
      {showForm && (
        <div style={{ position: "fixed", inset: 0, background: "rgba(0,0,0,.45)", zIndex: 1000, display: "flex", alignItems: "center", justifyContent: "center" }}>
          <div className="ipd-modal-container" style={{
            background: "#ffffff", borderRadius: "16px", padding: "28px",
            width: "min(950px,95vw)", maxHeight: "90vh", overflowY: "auto",
            boxShadow: "0 24px 64px rgba(0,0,0,.4)",
            color: "#000000"
          }}>
            <div style={{ display: "flex", alignItems: "center", justifyContent: "space-between", marginBottom: "20px" }}>
              <h3 style={{ margin: 0, fontSize: "17px", fontWeight: 700, color: "var(--text-primary)" }}>
                <BedDouble size={18} style={{ marginRight: "8px", color: "var(--accent-color)", verticalAlign: "middle" }} />
                {editMode ? "Edit IPD Admission" : "New IPD Admission"}
              </h3>
              <button onClick={() => setShowForm(false)} style={{ background: "none", border: "none", cursor: "pointer", color: "var(--text-muted)" }}><X size={20} /></button>
            </div>

            <form onSubmit={handleSave}>
              <div style={{ display: "grid", gridTemplateColumns: "1fr 1fr", gap: "24px" }}>
                
                {/* Left Column: Patient Information */}
                <div style={{ display: "flex", flexDirection: "column", gap: "12px", borderRight: "1px solid var(--border-color)", paddingRight: "24px" }}>
                  <h4 style={{ margin: "0 0 8px", fontSize: "13px", fontWeight: 700, color: "var(--accent-color)", borderBottom: "1px solid var(--border-color)", paddingBottom: "4px", letterSpacing: "0.5px" }}>PATIENT INFORMATION</h4>
                  
                  {/* Select Patient */}
                  <div className={styles.formGroup}>
                    <label style={{ display: "flex", alignItems: "center", gap: "6px" }}><User size={13} /> Select Patient *</label>
                    <select 
                      className={styles.formControl} 
                      value={form.IhrPttCode} 
                      onChange={e => handlePatientChange(e.target.value)} 
                      disabled={editMode}
                      required
                    >
                      <option value="">— Select Patient —</option>
                      <option value="__NEW__" style={{ fontWeight: "bold", color: "var(--accent-color)" }}>[NEW] Register New Patient</option>
                      {patients.map(p => <option key={p.ptt_code} value={p.ptt_code}>{p.ptt_name} (Reg #{p.ptt_reg_no || p.ptt_code})</option>)}
                    </select>
                  </div>

                  {/* Patient Name */}
                  <div className={styles.formGroup}>
                    <label>Patient Name *</label>
                    <input 
                      type="text" 
                      className={styles.formControl} 
                      value={form.ptt_name} 
                      onChange={e => setForm(p => ({ ...p, ptt_name: e.target.value }))} 
                      disabled={isPatientDisabled} 
                      required 
                    />
                  </div>

                  {/* Sex & Age */}
                  <div style={{ display: "grid", gridTemplateColumns: "1fr 1fr", gap: "10px" }}>
                    <div className={styles.formGroup}>
                      <label>Sex *</label>
                      <select 
                        className={styles.formControl} 
                        value={form.ptt_sex} 
                        onChange={e => setForm(p => ({ ...p, ptt_sex: e.target.value }))} 
                        disabled={isPatientDisabled} 
                        required
                      >
                        <option value="Male">Male</option>
                        <option value="Female">Female</option>
                        <option value="Other">Other</option>
                      </select>
                    </div>
                    <div className={styles.formGroup}>
                      <label>Age (Years)</label>
                      <input 
                        type="number" 
                        min="0"
                        max="150"
                        className={styles.formControl} 
                        value={form.ptt_age} 
                        onChange={e => handleAgeChange(e.target.value)} 
                        disabled={isPatientDisabled} 
                      />
                    </div>
                  </div>

                  {/* DOB */}
                  <div className={styles.formGroup}>
                    <label>Date of Birth</label>
                    <input 
                      type="date" 
                      className={styles.formControl} 
                      value={form.ptt_dob} 
                      onChange={e => handleDobChange(e.target.value)} 
                      disabled={isPatientDisabled} 
                    />
                  </div>

                  {/* Relation & Guardian */}
                  <div style={{ display: "grid", gridTemplateColumns: "1fr 2fr", gap: "10px" }}>
                    <div className={styles.formGroup}>
                      <label>Relation</label>
                      <select 
                        className={styles.formControl} 
                        value={form.ptt_ref_rela} 
                        onChange={e => setForm(p => ({ ...p, ptt_ref_rela: e.target.value }))} 
                        disabled={isPatientDisabled}
                      >
                        <option value="">None</option>
                        <option value="S/O">S/O</option>
                        <option value="D/O">D/O</option>
                        <option value="W/O">W/O</option>
                        <option value="C/O">C/O</option>
                        <option value="H/O">H/O</option>
                        <option value="G/O">G/O</option>
                      </select>
                    </div>
                    <div className={styles.formGroup}>
                      <label>Care Of / Guardian Name</label>
                      <input 
                        type="text" 
                        className={styles.formControl} 
                        value={form.ptt_ref_name} 
                        onChange={e => setForm(p => ({ ...p, ptt_ref_name: e.target.value }))} 
                        disabled={isPatientDisabled} 
                      />
                    </div>
                  </div>

                  {/* Area & Station */}
                  <div style={{ display: "grid", gridTemplateColumns: "1fr 1fr", gap: "10px" }}>
                    <div className={styles.formGroup}>
                      <label>Area</label>
                      <select 
                        className={styles.formControl} 
                        value={form.ptt_ara_code} 
                        onChange={e => setForm(p => ({ ...p, ptt_ara_code: e.target.value }))} 
                        disabled={isPatientDisabled}
                      >
                        <option value="">— Select Area —</option>
                        {areas.map(a => <option key={a.ara_code} value={a.ara_code}>{a.ara_name}</option>)}
                      </select>
                    </div>
                    <div className={styles.formGroup}>
                      <label>Station</label>
                      <select 
                        className={styles.formControl} 
                        value={form.ptt_stn_code} 
                        onChange={e => setForm(p => ({ ...p, ptt_stn_code: e.target.value }))} 
                        disabled={isPatientDisabled}
                      >
                        <option value="">— Select Station —</option>
                        {stations.map(s => <option key={s.stn_code} value={s.stn_code}>{s.stn_name}</option>)}
                      </select>
                    </div>
                  </div>

                  {/* Category */}
                  <div className={styles.formGroup}>
                    <label>Patient Category</label>
                    <select 
                      className={styles.formControl} 
                      value={form.ptt_pcg_code} 
                      onChange={e => setForm(p => ({ ...p, ptt_pcg_code: e.target.value }))} 
                      disabled={isPatientDisabled}
                    >
                      <option value="">— Select Category —</option>
                      {categories.map(c => <option key={c.pcg_code} value={c.pcg_code}>{c.pcg_name}</option>)}
                    </select>
                  </div>

                  {/* Contacts */}
                  <div style={{ display: "grid", gridTemplateColumns: "1fr 1fr", gap: "10px" }}>
                    <div className={styles.formGroup}>
                      <label>Contact No. (Tel)</label>
                      <input 
                        type="text" 
                        className={styles.formControl} 
                        value={form.ptt_telephone} 
                        onChange={e => setForm(p => ({ ...p, ptt_telephone: e.target.value }))} 
                        disabled={isPatientDisabled} 
                      />
                    </div>
                    <div className={styles.formGroup}>
                      <label>SMS No</label>
                      <input 
                        type="text" 
                        className={styles.formControl} 
                        value={form.ptt_sms_no} 
                        onChange={e => setForm(p => ({ ...p, ptt_sms_no: e.target.value }))} 
                        disabled={isPatientDisabled} 
                      />
                    </div>
                  </div>

                  {/* Address */}
                  <div className={styles.formGroup}>
                    <label>Address</label>
                    <input 
                      type="text" 
                      className={styles.formControl} 
                      value={form.ptt_address} 
                      onChange={e => setForm(p => ({ ...p, ptt_address: e.target.value }))} 
                      disabled={isPatientDisabled} 
                    />
                  </div>

                  {/* Email */}
                  <div className={styles.formGroup}>
                    <label>Email</label>
                    <input 
                      type="email" 
                      className={styles.formControl} 
                      value={form.ptt_email} 
                      onChange={e => setForm(p => ({ ...p, ptt_email: e.target.value }))} 
                      disabled={isPatientDisabled} 
                    />
                  </div>

                  {/* Remarks */}
                  <div className={styles.formGroup}>
                    <label>Remarks</label>
                    <input 
                      type="text" 
                      className={styles.formControl} 
                      value={form.ptt_remark} 
                      onChange={e => setForm(p => ({ ...p, ptt_remark: e.target.value }))} 
                      disabled={isPatientDisabled} 
                    />
                  </div>
                </div>

                {/* Right Column: Admission Information */}
                <div style={{ display: "flex", flexDirection: "column", gap: "12px" }}>
                  <h4 style={{ margin: "0 0 8px", fontSize: "13px", fontWeight: 700, color: "var(--accent-color)", borderBottom: "1px solid var(--border-color)", paddingBottom: "4px", letterSpacing: "0.5px" }}>ADMISSION INFORMATION</h4>
                  
                  {/* Doctor */}
                  <div className={styles.formGroup}>
                    <label>Consulting Doctor *</label>
                    <select 
                      className={styles.formControl} 
                      value={form.IpgCDctCode} 
                      onChange={e => setForm(p => ({ ...p, IpgCDctCode: e.target.value }))} 
                      required
                    >
                      <option value="">— Select Doctor —</option>
                      {doctors.map(d => <option key={d.dct_code} value={d.dct_code}>{d.dct_title} {d.dct_name}</option>)}
                    </select>
                  </div>

                  {/* Bed */}
                  <div className={styles.formGroup}>
                    <label>Bed / Room *</label>
                    <select 
                      className={styles.formControl} 
                      value={form.IpgBdmCode} 
                      onChange={e => setForm(p => ({ ...p, IpgBdmCode: e.target.value }))} 
                      required
                    >
                      <option value="">— Select Bed —</option>
                      {beds.map(b => <option key={b.bdm_code} value={b.bdm_code}>{b.bdm_name} {b.BdmStatus ? `(${b.BdmStatus})` : ""}</option>)}
                    </select>
                  </div>

                  {/* Admission Date & Time */}
                  <div style={{ display: "grid", gridTemplateColumns: "1fr 1fr", gap: "10px" }}>
                    <div className={styles.formGroup}>
                      <label style={{ display: "flex", alignItems: "center", gap: "6px" }}><CalendarDays size={13} /> Admission Date *</label>
                      <input type="date" className={styles.formControl} value={form.IhrDate} onChange={e => setForm(p => ({ ...p, IhrDate: e.target.value }))} required />
                    </div>
                    <div className={styles.formGroup}>
                      <label>Admission Time</label>
                      <input type="time" className={styles.formControl} value={form.IhrTimeStr} onChange={e => setForm(p => ({ ...p, IhrTimeStr: e.target.value }))} />
                    </div>
                  </div>

                  {/* Voucher Type & Prefix */}
                  <div style={{ display: "grid", gridTemplateColumns: "1fr 1fr", gap: "10px" }}>
                    <div className={styles.formGroup}>
                      <label>Voucher Type</label>
                      <select 
                        className={styles.formControl} 
                        value={form.IhrVtmCode} 
                        onChange={e => setForm(p => ({ ...p, IhrVtmCode: e.target.value }))}
                      >
                        <option value="1">IPD Admission</option>
                      </select>
                    </div>
                    <div className={styles.formGroup}>
                      <label>Prefix</label>
                      <input type="text" maxLength={10} className={styles.formControl} value={form.IhrPrefix} onChange={e => setForm(p => ({ ...p, IhrPrefix: e.target.value }))} placeholder="e.g. IPD" />
                    </div>
                  </div>

                  {/* Admission No & Claim ID */}
                  <div style={{ display: "grid", gridTemplateColumns: "1fr 1fr", gap: "10px" }}>
                    <div className={styles.formGroup}>
                      <label>Voucher / Admission No</label>
                      <input type="number" className={styles.formControl} value={form.IhrVchNo} onChange={e => setForm(p => ({ ...p, IhrVchNo: e.target.value }))} placeholder="Auto if blank" />
                    </div>
                    <div className={styles.formGroup}>
                      <label>Claim-ID</label>
                      <input type="text" className={styles.formControl} value={form.IhrClaimId} onChange={e => setForm(p => ({ ...p, IhrClaimId: e.target.value }))} placeholder="Insurance Claim No" />
                    </div>
                  </div>

                  {/* Advance Amount */}
                  <div className={styles.formGroup}>
                    <label>Advance Amount (₹)</label>
                    <input type="number" min="0" step="0.01" className={styles.formControl} value={form.IhrAdvAmt} onChange={e => setForm(p => ({ ...p, IhrAdvAmt: e.target.value }))} />
                  </div>

                  {/* Admission Remark */}
                  <div className={styles.formGroup}>
                    <label>Admission Remarks</label>
                    <input type="text" maxLength={50} className={styles.formControl} value={form.IhrRemark} onChange={e => setForm(p => ({ ...p, IhrRemark: e.target.value }))} />
                  </div>
                </div>

              </div>

              <div style={{ display: "flex", gap: "10px", marginTop: "24px", justifyContent: "flex-end", borderTop: "1px solid var(--border-color)", paddingTop: "16px" }}>
                <button type="button" onClick={() => setShowForm(false)} style={{ padding: "9px 20px", borderRadius: "8px", border: "1px solid var(--border-color)", background: "transparent", color: "var(--text-secondary)", cursor: "pointer", fontWeight: 600 }}>Cancel</button>
                <button type="submit" className={styles.primaryBtn}><Check size={14} /> {editMode ? "Update" : "Admit Patient"}</button>
              </div>
            </form>
          </div>
        </div>
      )}

      {/* ═══════════════════════════════════════════════════════════════════════
          DISCHARGE CONFIRM MODAL
      ═══════════════════════════════════════════════════════════════════════ */}
      {showDischarge && selected && (
        <div style={{ position: "fixed", inset: 0, background: "rgba(0,0,0,.45)", zIndex: 1000, display: "flex", alignItems: "center", justifyContent: "center" }}>
          <div className="ipd-modal-container" style={{ background: "#ffffff", borderRadius: "16px", padding: "32px", width: "420px", boxShadow: "0 24px 64px rgba(0,0,0,.4)", textAlign: "center", color: "#000000" }}>
            <LogOut size={40} style={{ color: "#0f4c81", marginBottom: "12px" }} />
            <h3 style={{ margin: "0 0 8px", fontSize: "18px" }}>Confirm Discharge</h3>
            <p style={{ color: "var(--text-secondary)", fontSize: "14px", margin: "0 0 20px" }}>
              Discharge <strong>{selected.PttName}</strong> from Bed {selected.BedName || selected.IpgBdmCode || "—"}?<br />
              Admission #{selected.IhrVchNo} • {selected.IhrDate}
            </p>
            <p style={{ fontSize: "12px", color: "#b45309", background: "#fef3c7", padding: "8px 14px", borderRadius: "8px", marginBottom: "20px" }}>
              ⚠ This will free the bed and mark the patient as discharged.
            </p>
            <div style={{ display: "flex", gap: "10px", justifyContent: "center" }}>
              <button onClick={() => setShowDischarge(false)} style={{ padding: "9px 20px", borderRadius: "8px", border: "1px solid var(--border-color)", background: "transparent", cursor: "pointer", fontWeight: 600 }}>Cancel</button>
              <button onClick={handleDischarge} style={{ padding: "9px 24px", borderRadius: "8px", border: "none", background: "#0f4c81", color: "#fff", cursor: "pointer", fontWeight: 700 }}>✓ Discharge Now</button>
            </div>
          </div>
        </div>
      )}

      {/* ═══════════════════════════════════════════════════════════════════════
          BED SHIFT MODAL
      ═══════════════════════════════════════════════════════════════════════ */}
      {showBedShift && selected && (
        <div style={{ position: "fixed", inset: 0, background: "rgba(0,0,0,.45)", zIndex: 1000, display: "flex", alignItems: "center", justifyContent: "center" }}>
          <div className="ipd-modal-container" style={{ background: "#ffffff", borderRadius: "16px", padding: "28px", width: "420px", boxShadow: "0 24px 64px rgba(0,0,0,.4)", color: "#000000" }}>
            <div style={{ display: "flex", justifyContent: "space-between", marginBottom: "16px" }}>
              <h3 style={{ margin: 0, fontSize: "16px", fontWeight: 700 }}>
                <ArrowLeftRight size={16} style={{ marginRight: "8px", color: "#7c3aed", verticalAlign: "middle" }} />
                Bed Shift
              </h3>
              <button onClick={() => setShowBedShift(false)} style={{ background: "none", border: "none", cursor: "pointer" }}><X size={18} /></button>
            </div>
            <p style={{ color: "var(--text-secondary)", fontSize: "13px", margin: "0 0 16px" }}>
              Patient: <strong>{selected.PttName}</strong><br />
              Current Bed: <strong>{selected.BedName || selected.IpgBdmCode || "—"}</strong>
            </p>
            <div className={styles.formGroup}>
              <label>Select New Bed *</label>
              <select className={styles.formControl} value={newBedCode} onChange={e => setNewBedCode(e.target.value)}>
                <option value="">— Select Bed —</option>
                {beds.filter(b => b.bdm_code !== selected.IpgBdmCode).map(b => <option key={b.bdm_code} value={b.bdm_code}>{b.bdm_name}</option>)}
              </select>
            </div>
            <div className={styles.formGroup}>
              <label>Remark</label>
              <input type="text" className={styles.formControl} value={bedShiftRemark} onChange={e => setBedShiftRemark(e.target.value)} placeholder="Reason for bed shift" />
            </div>
            <div style={{ display: "flex", gap: "10px", marginTop: "16px", justifyContent: "flex-end" }}>
              <button onClick={() => setShowBedShift(false)} style={{ padding: "9px 20px", borderRadius: "8px", border: "1px solid var(--border-color)", background: "transparent", cursor: "pointer", fontWeight: 600 }}>Cancel</button>
              <button onClick={handleBedShift} disabled={!newBedCode} style={{ padding: "9px 20px", borderRadius: "8px", border: "none", background: newBedCode ? "#7c3aed" : "var(--border-color)", color: newBedCode ? "#fff" : "var(--text-muted)", cursor: newBedCode ? "pointer" : "not-allowed", fontWeight: 700 }}>
                <ArrowLeftRight size={14} style={{ marginRight: "4px", verticalAlign: "middle" }} /> Shift Bed
              </button>
            </div>
          </div>
        </div>
      )}

      {/* ═══════════════════════════════════════════════════════════════════════
          LINKED TRANSACTIONS MODAL
      ═══════════════════════════════════════════════════════════════════════ */}
      {showLinked && (
        <div style={{ position: "fixed", inset: 0, background: "rgba(0,0,0,.45)", zIndex: 1000, display: "flex", alignItems: "center", justifyContent: "center" }}>
          <div className="ipd-modal-container" style={{ background: "#ffffff", borderRadius: "16px", padding: "24px", width: "min(700px,96vw)", maxHeight: "85vh", overflowY: "auto", boxShadow: "0 24px 64px rgba(0,0,0,.4)", color: "#000000" }}>
            <div style={{ display: "flex", justifyContent: "space-between", alignItems: "center", marginBottom: "16px" }}>
              <h3 style={{ margin: 0, fontSize: "16px", fontWeight: 700 }}>
                <Link2 size={16} style={{ marginRight: "8px", color: "#0891b2", verticalAlign: "middle" }} />
                Linked Transactions — {selected?.PttName}
              </h3>
              <button onClick={() => setShowLinked(false)} style={{ background: "none", border: "none", cursor: "pointer" }}><X size={20} /></button>
            </div>

            {linkedLoading ? (
              <p style={{ textAlign: "center", color: "var(--text-muted)", padding: "40px 0" }}>Loading transactions…</p>
            ) : linkedTrans ? (
              <div style={{ display: "flex", flexDirection: "column", gap: "20px" }}>
                {/* Advances */}
                <TransSection title="💰 Advance Payments" rows={linkedTrans.advances} cols={["Date", "Vch#", "Amount", "Remark"]} render={a => [a.date, a.vch_no, `₹${Number(a.amount).toFixed(2)}`, a.remark || "—"]} />
                {/* Refunds */}
                <TransSection title="↩ Refunds" rows={linkedTrans.refunds} cols={["Date", "Vch#", "Amount", "Remark"]} render={r => [r.date, r.vch_no, `₹${Number(r.amount).toFixed(2)}`, r.remark || "—"]} />
                {/* Bills */}
                <TransSection title="📄 Bills" rows={linkedTrans.bills} cols={["Date", "Vch#", "Type", "Total", "Balance", "Status"]} render={b => [b.date, b.vch_no, b.type || "—", `₹${Number(b.total).toFixed(2)}`, `₹${Number(b.balance).toFixed(2)}`, b.status || "—"]} />
                {/* Bed Logs */}
                <TransSection title="🛏 Bed History" rows={linkedTrans.bed_logs} cols={["Date", "Bed Code", "Remark"]} render={s => [s.date, `#${s.bed_code}`, s.remark || "—"]} />
              </div>
            ) : null}
          </div>
        </div>
      )}

      <style jsx>{`
        @keyframes slideIn { from { transform: translateX(60px); opacity: 0 } to { transform: translateX(0); opacity: 1 } }
        
        .ipd-modal-container {
          background-color: #ffffff !important;
          color: #000000 !important;
        }
        .ipd-modal-container label {
          color: #334155 !important;
          font-weight: 600 !important;
        }
        .ipd-modal-container input,
        .ipd-modal-container select,
        .ipd-modal-container textarea {
          background-color: #ffffff !important;
          color: #000000 !important;
          border: 1px solid #cbd5e1 !important;
        }
        .ipd-modal-container input:disabled,
        .ipd-modal-container select:disabled {
          background-color: #f1f5f9 !important;
          color: #64748b !important;
          cursor: not-allowed;
        }
        .ipd-modal-container h3,
        .ipd-modal-container h4 {
          color: #0f4c81 !important;
        }
        .ipd-modal-container p {
          color: #1e293b !important;
        }
      `}</style>
    </div>
  );
}

// ─── TransSection helper ─────────────────────────────────────────────────────
function TransSection<T>({ title, rows, cols, render }: { title: string; rows: T[]; cols: string[]; render: (r: T) => (string | number)[] }) {
  return (
    <div>
      <div style={{ fontWeight: 700, fontSize: "13px", marginBottom: "8px", color: "var(--text-primary)" }}>{title}</div>
      {rows.length === 0 ? (
        <p style={{ color: "var(--text-muted)", fontSize: "12px", margin: 0 }}>No records</p>
      ) : (
        <table style={{ width: "100%", borderCollapse: "collapse", fontSize: "12px" }}>
          <thead>
            <tr style={{ background: "var(--sidebar-bg)" }}>
              {cols.map(c => <th key={c} style={{ padding: "6px 10px", textAlign: "left", fontWeight: 600, color: "var(--text-secondary)" }}>{c}</th>)}
            </tr>
          </thead>
          <tbody>
            {rows.map((r, i) => (
              <tr key={i} style={{ borderBottom: "1px solid var(--border-color)" }}>
                {render(r).map((v, j) => <td key={j} style={{ padding: "6px 10px" }}>{v}</td>)}
              </tr>
            ))}
          </tbody>
        </table>
      )}
    </div>
  );
}
