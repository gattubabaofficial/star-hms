'use client';
import React, { useState, useEffect, useRef } from 'react';
import { useRouter } from 'next/navigation';
import styles from '../../../dashboard.module.css';
import ActionBar from '../components/ActionBar';
import { Search, AlertCircle, Check } from 'lucide-react';

/* ─────────────────────────────────────────────
   Interfaces  (field names match patients/page.tsx)
───────────────────────────────────────────── */
interface PatientCategory {
  pcg_code: number;
  pcg_name: string;
  pcg_disc_per?: number;
}

interface Patient {
  ptt_code: number;
  ptt_name: string;
  ptt_reg_no?: number;
  ptt_reg_date: string;
  ptt_sex?: string;
  ptt_dob?: string;
  ptt_address?: string;
  ptt_telephone?: string;
  ptt_sms_no?: string;
  ptt_email?: string;
  ptt_pcg_code?: number;
  ptt_remark?: string;
  ptt_rec_state: number;
  category?: PatientCategory;
}

/* ─────────────────────────────────────────────
   Constants
───────────────────────────────────────────── */
const API = process.env.NEXT_PUBLIC_API_URL || 'http://localhost:8000';
const getToken = () => typeof window !== 'undefined' ? localStorage.getItem('token') : '';
const authHdr = () => ({ 'Content-Type': 'application/json', Authorization: `Bearer ${getToken()}` });

/* blank form matches patients/page.tsx field set + extra PatMast.frm fields */
const blankForm = {
  ptt_name: '',
  ptt_reg_no: '',
  ptt_reg_date: new Date().toISOString().split('T')[0],
  ptt_sex: 'M',
  ptt_dob: '',
  ptt_age_yr: '0',
  ptt_age_mn: '0',
  ptt_age_dy: '0',
  ptt_age_as_on: new Date().toISOString().split('T')[0],
  // cmbPttRefRela + txtPttRefName (Care of)
  ptt_ref_rela: 'S/o',
  ptt_ref_name: '',
  // address block (PatMast.frm)
  ptt_address: '',
  ptt_ara_name: '',      // txtAraName
  ptt_stn_name: '',      // txtStnName
  // contact block (patients/page.tsx + PatMast.frm)
  ptt_telephone: '',     // txtPttTelNo
  ptt_sms_no: '',        // txtPttSMSNo
  ptt_email: '',
  // category
  ptt_pcg_code: '',      // txtPcgName (dropdown)
  // billing overrides (PatMast.frm checkboxes)
  ptt_inf_allowed: true,
  ptt_def_allowed: true,
  ptt_disc_allowed: true,
  ptt_disc_per: '0',
  ptt_show_in_list: true,
  // remark
  ptt_remark: '',
};

/* ─────────────────────────────────────────────
   Component
───────────────────────────────────────────── */
export default function PatientMasterPage() {
  const router = useRouter();

  const [items, setItems] = useState<Patient[]>([]);
  const [categories, setCategories] = useState<PatientCategory[]>([]);
  const [search, setSearch] = useState('');
  const [selectedId, setSelectedId] = useState<number | null>(null);
  const [entryMode, setEntryMode] = useState(false);
  const [editing, setEditing] = useState<Patient | null>(null);
  const [form, setForm] = useState({ ...blankForm });
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');
  const [success, setSuccess] = useState('');

  const nameInputRef = useRef<HTMLInputElement>(null);
  const searchInputRef = useRef<HTMLInputElement>(null);

  /* ── load ── */
  const loadData = async () => {
    try {
      const [patRes, catRes] = await Promise.all([
        fetch(`${API}/api/masters/patients`),
        fetch(`${API}/api/masters/patient-categories`),
      ]);
      if (catRes.ok) setCategories(await catRes.json());
      if (patRes.ok) {
        const data: Patient[] = await patRes.json();
        setItems(data);
        setSelectedId(prev => {
          const exists = data.some(d => d.ptt_code === prev);
          return exists ? prev : (data[0]?.ptt_code ?? null);
        });
      }
    } catch (e) {
      console.error('Error loading patients:', e);
    }
  };

  useEffect(() => { loadData(); }, []);

  useEffect(() => {
    if (entryMode && nameInputRef.current) nameInputRef.current.focus();
    else if (!entryMode && searchInputRef.current) searchInputRef.current.focus();
  }, [entryMode]);

  /* ── arrow-key navigation ── */
  useEffect(() => {
    const handler = (e: KeyboardEvent) => {
      if (entryMode) return;
      const f = filtered();
      if (!f.length) return;
      const idx = f.findIndex(i => i.ptt_code === selectedId);
      if (e.key === 'ArrowDown') { e.preventDefault(); setSelectedId(f[(idx + 1) % f.length].ptt_code); }
      if (e.key === 'ArrowUp')   { e.preventDefault(); setSelectedId(f[(idx - 1 + f.length) % f.length].ptt_code); }
    };
    window.addEventListener('keydown', handler);
    return () => window.removeEventListener('keydown', handler);
  }, [entryMode, items, selectedId, search]);

  /* ── PageDown to save ── */
  useEffect(() => {
    const handler = (e: KeyboardEvent) => {
      if (entryMode && e.key === 'PageDown') { e.preventDefault(); handleSave(); }
    };
    window.addEventListener('keydown', handler);
    return () => window.removeEventListener('keydown', handler);
  }, [entryMode, form, editing]);

  /* ── Age ↔ DOB sync (PatMast.frm: mskPttAgeYr/Mn/Dy ↔ dtpPttDob) ── */
  const handleAgeChange = (field: 'yr' | 'mn' | 'dy', val: string) => {
    setForm(f => {
      const updated = { ...f, [`ptt_age_${field}`]: val };
      const yrs = parseInt(updated.ptt_age_yr) || 0;
      const mns = parseInt(updated.ptt_age_mn) || 0;
      const dys = parseInt(updated.ptt_age_dy) || 0;
      if (yrs > 0 || mns > 0 || dys > 0) {
        const d = new Date();
        d.setFullYear(d.getFullYear() - yrs);
        d.setMonth(d.getMonth() - mns);
        d.setDate(d.getDate() - dys);
        updated.ptt_dob = d.toISOString().split('T')[0];
      }
      return updated;
    });
  };

  const handleDobChange = (val: string) => {
    setForm(f => {
      const updated = { ...f, ptt_dob: val };
      if (!val) return updated;
      const birth = new Date(val);
      const today = new Date();
      let yr = today.getFullYear() - birth.getFullYear();
      let mn = today.getMonth() - birth.getMonth();
      let dy = today.getDate() - birth.getDate();
      if (dy < 0) { mn--; dy += 30; }
      if (mn < 0) { yr--; mn += 12; }
      updated.ptt_age_yr = Math.max(0, yr).toString();
      updated.ptt_age_mn = Math.max(0, mn).toString();
      updated.ptt_age_dy = Math.max(0, dy).toString();
      return updated;
    });
  };

  /* ── helpers ── */
  const filtered = () =>
    items.filter(i => i.ptt_name.toLowerCase().includes(search.toLowerCase()));

  const fmtDate = (d?: string) =>
    d ? new Date(d).toLocaleDateString('en-GB') : 'N/A';

  /* ── actions ── */
  const handleAdd = () => {
    setEditing(null);
    setForm({
      ...blankForm,
      ptt_pcg_code: categories[0]?.pcg_code.toString() ?? '',
    });
    setError(''); setSuccess('');
    setEntryMode(true);
  };

  const handleEdit = () => {
    const item = items.find(i => i.ptt_code === selectedId);
    if (!item) return;
    setEditing(item);
    const regDate = item.ptt_reg_date
      ? new Date(item.ptt_reg_date).toISOString().split('T')[0]
      : new Date().toISOString().split('T')[0];
    const dob = item.ptt_dob ? new Date(item.ptt_dob).toISOString().split('T')[0] : '';
    setForm({
      ...blankForm,
      ptt_name: item.ptt_name,
      ptt_reg_no: item.ptt_reg_no?.toString() ?? '',
      ptt_reg_date: regDate,
      ptt_sex: item.ptt_sex || 'M',
      ptt_dob: dob,
      ptt_address: item.ptt_address || '',
      ptt_telephone: item.ptt_telephone || '',
      ptt_sms_no: item.ptt_sms_no || '',
      ptt_email: item.ptt_email || '',
      ptt_pcg_code: item.ptt_pcg_code?.toString() ?? '',
      ptt_remark: item.ptt_remark || '',
    });
    setError(''); setSuccess('');
    setEntryMode(true);
  };

  const handleDelete = async () => {
    const item = items.find(i => i.ptt_code === selectedId);
    if (!item || !confirm(`Delete patient "${item.ptt_name}"?`)) return;
    try {
      const r = await fetch(`${API}/api/masters/patients/${selectedId}`, { method: 'DELETE', headers: authHdr() });
      if (!r.ok) throw new Error('Delete failed');
      loadData();
    } catch (e: any) { alert(e.message); }
  };

  const handleRefresh = () => loadData();

  const handleExit = () => {
    if (entryMode) { setEntryMode(false); setEditing(null); }
    else router.push('/dashboard/masters');
  };

  /* ── save (matches patients/page.tsx POST body) ── */
  const handleSave = async (e?: React.FormEvent) => {
    if (e) e.preventDefault();
    if (!form.ptt_name.trim()) {
      setError('Invalid Patient Name !!!');
      nameInputRef.current?.focus();
      return;
    }
    setLoading(true); setError(''); setSuccess('');
    try {
      const body = {
        ptt_name: form.ptt_name.trim(),
        ptt_reg_no: form.ptt_reg_no ? parseInt(form.ptt_reg_no) : null,
        ptt_reg_date: new Date(form.ptt_reg_date).toISOString(),
        ptt_sex: form.ptt_sex,
        ptt_dob: form.ptt_dob || null,
        ptt_address: form.ptt_address.trim() || null,
        ptt_telephone: form.ptt_telephone.trim() || null,
        ptt_sms_no: form.ptt_sms_no.trim() || null,
        ptt_email: form.ptt_email.trim() || null,
        ptt_pcg_code: form.ptt_pcg_code ? parseInt(form.ptt_pcg_code) : null,
        ptt_remark: form.ptt_remark.trim() || null,
        ptt_rec_state: 1,
      };
      const url    = editing ? `${API}/api/masters/patients/${editing.ptt_code}` : `${API}/api/masters/patients`;
      const method = editing ? 'PUT' : 'POST';
      const r = await fetch(url, { method, headers: authHdr(), body: JSON.stringify(body) });
      if (!r.ok) throw new Error(await r.text());
      setSuccess(editing ? 'Updated successfully' : 'Created successfully');
      loadData();
      setTimeout(() => { setEntryMode(false); setEditing(null); }, 800);
    } catch (e: any) {
      setError(e.message || 'Error during save');
    } finally {
      setLoading(false);
    }
  };

  const rows = filtered();

  /* ─────────────────────────────────────────────
     Render
  ───────────────────────────────────────────── */
  return (
    <div style={{ display: 'flex', flexDirection: 'column', minHeight: 'calc(100vh - 140px)', justifyContent: 'space-between' }}>

      <div>
        {/* Legacy Form Title (PatMast.frm) */}
        <div style={{
          backgroundColor: '#e0e0e0', padding: '10px',
          border: '1px solid #94a3b8', textAlign: 'center',
          fontWeight: 700, fontSize: '15px', fontFamily: 'Outfit, sans-serif',
          color: '#0f172a', marginBottom: '24px', borderRadius: '4px'
        }}>
          Patient Master [PatMast.frm]
        </div>

        {/* ══════════════ SUMMARY MODE (frFormSmry) ══════════════ */}
        {!entryMode && (
          <div className={styles.sectionBox}>
            <div className={styles.sectionHeader}>
              <h3 className={styles.sectionTitle}>Summary</h3>
            </div>

            {/* Search — txtSearch1Text + txtSearchPttContNo */}
            <div className={styles.toolbar} style={{ marginBottom: '16px' }}>
              <div className={styles.searchBar}>
                <Search size={18} style={{ color: 'var(--text-muted)' }} />
                <input
                  ref={searchInputRef}
                  value={search}
                  onChange={e => {
                    setSearch(e.target.value);
                    const m = items.filter(i => i.ptt_name.toLowerCase().includes(e.target.value.toLowerCase()));
                    if (m.length && !m.some(x => x.ptt_code === selectedId)) setSelectedId(m[0].ptt_code);
                  }}
                  placeholder="Search patients (txtSearch1Text)..."
                />
              </div>
            </div>

            {/* Grid — Mfgrd1 columns from PatMast.frm AddFields */}
            <div className={styles.tableContainer}>
              <table className={styles.table}>
                <thead>
                  <tr>
                    <th style={{ width: '70px' }}>Code</th>
                    <th>Patient Name</th>
                    <th style={{ width: '80px' }}>Reg.No</th>
                    <th style={{ width: '100px' }}>Reg.Date</th>
                    <th>Care of</th>
                    <th>Contact No.</th>
                    <th>Address</th>
                    <th>Area</th>
                    <th>Station</th>
                    <th>Category</th>
                  </tr>
                </thead>
                <tbody>
                  {rows.length === 0 && (
                    <tr>
                      <td colSpan={10} style={{ textAlign: 'center', padding: '40px', color: 'var(--text-secondary)' }}>
                        No patients registered
                      </td>
                    </tr>
                  )}
                  {rows.map(item => (
                    <tr
                      key={item.ptt_code}
                      onClick={() => setSelectedId(item.ptt_code)}
                      onDoubleClick={handleEdit}
                      style={{
                        cursor: 'pointer',
                        backgroundColor: selectedId === item.ptt_code ? 'var(--accent-light)' : 'transparent',
                        fontWeight: selectedId === item.ptt_code ? 600 : 400,
                      }}
                    >
                      <td style={{ color: selectedId === item.ptt_code ? 'var(--accent-color)' : 'var(--text-secondary)' }}>
                        #{item.ptt_code}
                      </td>
                      <td>{item.ptt_name}</td>
                      <td>{item.ptt_reg_no ?? 'N/A'}</td>
                      <td>{fmtDate(item.ptt_reg_date)}</td>
                      <td>{'—'}</td>
                      <td>{item.ptt_telephone || 'N/A'}</td>
                      <td>{item.ptt_address || 'N/A'}</td>
                      <td>{'—'}</td>
                      <td>{'—'}</td>
                      <td>{item.category?.pcg_name || 'N/A'}</td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          </div>
        )}

        {/* ══════════════ DETAIL MODE (frFormDtl) ══════════════ */}
        {entryMode && (
          <div className={styles.sectionBox} style={{ backgroundColor: '#fff5ec' }}>
            <div className={styles.sectionHeader}>
              <h3 className={styles.sectionTitle}>Detail [Mode: {editing ? 'Edit' : 'Add'}]</h3>
            </div>

            <form onSubmit={handleSave}>
              {error && (
                <div style={{ color: 'var(--status-danger)', display: 'flex', alignItems: 'center', gap: '8px', fontSize: '13px', marginBottom: '16px' }}>
                  <AlertCircle size={16} /> {error}
                </div>
              )}
              {success && (
                <div style={{ color: 'var(--status-success)', display: 'flex', alignItems: 'center', gap: '8px', fontSize: '13px', marginBottom: '16px' }}>
                  <Check size={16} /> {success}
                </div>
              )}

              {/* Row 1: Code | Reg.No | Reg.Date */}
              <div className={styles.formGrid}>
                <div className={styles.formGroup} style={{ flex: 0.6 }}>
                  <label>Code (mskFormBoundField)</label>
                  <input className={styles.formControl} value={editing ? editing.ptt_code : '(Auto)'} disabled
                    style={{ backgroundColor: 'var(--bg-secondary)', fontWeight: 700 }} />
                </div>
                <div className={styles.formGroup} style={{ flex: 0.8 }}>
                  <label>Reg. No (mskPttRegNo)</label>
                  <input type="number" className={styles.formControl}
                    value={form.ptt_reg_no}
                    onChange={e => setForm(f => ({ ...f, ptt_reg_no: e.target.value }))}
                    placeholder="Auto if blank" />
                </div>
                <div className={styles.formGroup}>
                  <label>Reg. Date (dtpPttRegDate) *</label>
                  <input type="date" className={styles.formControl}
                    value={form.ptt_reg_date}
                    onChange={e => setForm(f => ({ ...f, ptt_reg_date: e.target.value }))}
                    required />
                </div>
              </div>

              {/* Row 2: Patient Name | Sex */}
              <div className={styles.formGrid}>
                <div className={styles.formGroup} style={{ flex: 2 }}>
                  <label>Patient Name (txtPttName) *</label>
                  <input ref={nameInputRef} className={styles.formControl}
                    value={form.ptt_name}
                    onChange={e => setForm(f => ({ ...f, ptt_name: e.target.value }))}
                    maxLength={60} required placeholder="Enter patient full name" />
                </div>
                <div className={styles.formGroup}>
                  <label>Sex (cmbPttSex) *</label>
                  <select className={styles.formControl}
                    value={form.ptt_sex}
                    onChange={e => setForm(f => ({ ...f, ptt_sex: e.target.value }))}>
                    <option value="M">Male</option>
                    <option value="F">Female</option>
                    <option value="O">Other</option>
                  </select>
                </div>
              </div>

              {/* Row 3: Age (Yrs/Mn/Dy) | As On | DOB */}
              <div className={styles.formGrid}>
                <div className={styles.formGroup} style={{ flex: 1.5 }}>
                  <label>Age – Yrs / Mn / Dy (mskPttAgeYr / Mn / Dy)</label>
                  <div style={{ display: 'flex', gap: '8px' }}>
                    <input type="number" min="0" className={styles.formControl}
                      value={form.ptt_age_yr} onChange={e => handleAgeChange('yr', e.target.value)}
                      placeholder="Yrs" style={{ textAlign: 'right' }} />
                    <input type="number" min="0" max="11" className={styles.formControl}
                      value={form.ptt_age_mn} onChange={e => handleAgeChange('mn', e.target.value)}
                      placeholder="Mn" style={{ textAlign: 'right' }} />
                    <input type="number" min="0" max="30" className={styles.formControl}
                      value={form.ptt_age_dy} onChange={e => handleAgeChange('dy', e.target.value)}
                      placeholder="Dy" style={{ textAlign: 'right' }} />
                  </div>
                </div>
                <div className={styles.formGroup}>
                  <label>As On (dtpPttAgeAsOnDt)</label>
                  <input type="date" className={styles.formControl}
                    value={form.ptt_age_as_on}
                    onChange={e => setForm(f => ({ ...f, ptt_age_as_on: e.target.value }))} />
                </div>
                <div className={styles.formGroup}>
                  <label>DOB (dtpPttDob)</label>
                  <input type="date" className={styles.formControl}
                    value={form.ptt_dob}
                    onChange={e => handleDobChange(e.target.value)} />
                </div>
              </div>

              {/* Row 4: Relation | Care of Name */}
              <div className={styles.formGrid}>
                <div className={styles.formGroup} style={{ flex: 0.5 }}>
                  <label>Relation (cmbPttRefRela)</label>
                  <select className={styles.formControl}
                    value={form.ptt_ref_rela}
                    onChange={e => setForm(f => ({ ...f, ptt_ref_rela: e.target.value }))}>
                    <option value="S/o">S/o</option>
                    <option value="D/o">D/o</option>
                    <option value="W/o">W/o</option>
                    <option value="H/o">H/o</option>
                    <option value="C/o">C/o</option>
                  </select>
                </div>
                <div className={styles.formGroup} style={{ flex: 2 }}>
                  <label>Care of / Guardian Name (txtPttRefName)</label>
                  <input className={styles.formControl}
                    value={form.ptt_ref_name}
                    onChange={e => setForm(f => ({ ...f, ptt_ref_name: e.target.value }))}
                    maxLength={60} placeholder="Enter guardian / relative name" />
                </div>
              </div>

              {/* Row 5: Address */}
              <div className={styles.formGroup}>
                <label>Address (txtPttAddr)</label>
                <textarea className={styles.formControl}
                  value={form.ptt_address}
                  onChange={e => setForm(f => ({ ...f, ptt_address: e.target.value }))}
                  maxLength={250} rows={2} placeholder="Full residential address" />
              </div>

              {/* Row 6: Area | Station */}
              <div className={styles.formGrid}>
                <div className={styles.formGroup}>
                  <label>Area (txtAraName)</label>
                  <input className={styles.formControl}
                    value={form.ptt_ara_name}
                    onChange={e => setForm(f => ({ ...f, ptt_ara_name: e.target.value }))}
                    placeholder="Area name" />
                </div>
                <div className={styles.formGroup}>
                  <label>Station (txtStnName)</label>
                  <input className={styles.formControl}
                    value={form.ptt_stn_name}
                    onChange={e => setForm(f => ({ ...f, ptt_stn_name: e.target.value }))}
                    placeholder="Station name" />
                </div>
              </div>

              {/* Row 7: Telephone | SMS Mobile | Email */}
              <div className={styles.formGrid}>
                <div className={styles.formGroup}>
                  <label>Contact No. (txtPttTelNo)</label>
                  <input className={styles.formControl}
                    value={form.ptt_telephone}
                    onChange={e => setForm(f => ({ ...f, ptt_telephone: e.target.value }))}
                    maxLength={50} placeholder="Landline / Mobile" />
                </div>
                <div className={styles.formGroup}>
                  <label>SMS Mobile No (txtPttSMSNo)</label>
                  <input className={styles.formControl}
                    value={form.ptt_sms_no}
                    onChange={e => setForm(f => ({ ...f, ptt_sms_no: e.target.value }))}
                    maxLength={50} placeholder="SMS number" />
                </div>
                <div className={styles.formGroup}>
                  <label>Email (txtPttEmail)</label>
                  <input type="email" className={styles.formControl}
                    value={form.ptt_email}
                    onChange={e => setForm(f => ({ ...f, ptt_email: e.target.value }))}
                    maxLength={100} placeholder="Email address" />
                </div>
              </div>

              {/* Row 8: Category */}
              <div className={styles.formGroup}>
                <label>Patient Category (txtPcgName)</label>
                <select className={styles.formControl}
                  value={form.ptt_pcg_code}
                  onChange={e => setForm(f => ({ ...f, ptt_pcg_code: e.target.value }))}>
                  <option value="">-- Select Category --</option>
                  {categories.map(c => (
                    <option key={c.pcg_code} value={c.pcg_code}>
                      {c.pcg_name}{c.pcg_disc_per ? ` (${c.pcg_disc_per}% Disc)` : ''}
                    </option>
                  ))}
                </select>
              </div>

              {/* Row 9: Billing overrides (PatMast.frm checkboxes) */}
              <div style={{ border: '1px solid var(--border-light)', padding: '14px 16px', borderRadius: '8px', marginBottom: '18px', backgroundColor: 'rgba(0,0,0,0.02)' }}>
                <div style={{ fontWeight: 700, fontSize: '12px', marginBottom: '10px', color: 'var(--text-secondary)', textTransform: 'uppercase', letterSpacing: '0.5px' }}>
                  Billing Overrides
                </div>
                <div className={styles.formGrid}>
                  <label style={{ display: 'flex', alignItems: 'center', gap: '8px', fontSize: '13px', cursor: 'pointer' }}>
                    <input type="checkbox" checked={form.ptt_inf_allowed}
                      onChange={e => setForm(f => ({ ...f, ptt_inf_allowed: e.target.checked }))} />
                    Increment Allowed (chkPttInfAllowed)
                  </label>
                  <label style={{ display: 'flex', alignItems: 'center', gap: '8px', fontSize: '13px', cursor: 'pointer' }}>
                    <input type="checkbox" checked={form.ptt_def_allowed}
                      onChange={e => setForm(f => ({ ...f, ptt_def_allowed: e.target.checked }))} />
                    Decrement Allowed (chkPttDefAllowed)
                  </label>
                  <label style={{ display: 'flex', alignItems: 'center', gap: '8px', fontSize: '13px', cursor: 'pointer' }}>
                    <input type="checkbox" checked={form.ptt_disc_allowed}
                      onChange={e => setForm(f => ({ ...f, ptt_disc_allowed: e.target.checked }))} />
                    Discount Allowed (chkPttDiscAllowed)
                  </label>
                  <div className={styles.formGroup} style={{ marginBottom: 0 }}>
                    <label style={{ fontSize: '12px', fontWeight: 600 }}>Discount % (mskPttDiscPer)</label>
                    <input type="number" min="0" max="100" step="0.01"
                      className={styles.formControl}
                      value={form.ptt_disc_per}
                      onChange={e => setForm(f => ({ ...f, ptt_disc_per: e.target.value }))}
                      style={{ height: '30px' }} />
                  </div>
                </div>
              </div>

              {/* Row 10: Remark | Show in List */}
              <div className={styles.formGrid}>
                <div className={styles.formGroup} style={{ flex: 2 }}>
                  <label>Remark (txtPttRemark)</label>
                  <input className={styles.formControl}
                    value={form.ptt_remark}
                    onChange={e => setForm(f => ({ ...f, ptt_remark: e.target.value }))}
                    maxLength={250} placeholder="Notes / remark" />
                </div>
                <div className={styles.formGroup} style={{ justifyContent: 'center', paddingBottom: '8px' }}>
                  <label style={{ display: 'flex', alignItems: 'center', gap: '8px', fontSize: '13px', fontWeight: 600, cursor: 'pointer' }}>
                    <input type="checkbox" checked={form.ptt_show_in_list}
                      onChange={e => setForm(f => ({ ...f, ptt_show_in_list: e.target.checked }))} />
                    Show in List (chkPttShowInList)
                  </label>
                </div>
              </div>

              <div style={{ fontSize: '11px', color: 'var(--text-secondary)', marginTop: '12px', fontStyle: 'italic' }}>
                Tip: Press <strong>PageDown</strong> to Save
              </div>

              {/* Form action buttons */}
              <div style={{ display: 'flex', justifyContent: 'flex-end', gap: '12px', marginTop: '20px' }}>
                <button type="button" className={styles.secondaryBtn} onClick={handleExit}>Cancel</button>
                <button type="submit" className={styles.primaryBtn} disabled={loading}>
                  {loading ? 'Saving…' : 'Save'}
                </button>
              </div>
            </form>
          </div>
        )}
      </div>

      {/* Action Bar */}
      <ActionBar
        onAdd={handleAdd}
        onEdit={handleEdit}
        onRefresh={handleRefresh}
        onDelete={handleDelete}
        onExit={handleExit}
        isEditing={entryMode}
        hasSelected={selectedId !== null}
        disabledActions={['print-voucher', 'print-report', 'export-excel', 'configure']}
      />
    </div>
  );
}
