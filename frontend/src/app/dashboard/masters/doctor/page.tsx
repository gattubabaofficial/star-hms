'use client';
import React, { useState, useEffect, useRef } from 'react';
import { useRouter } from 'next/navigation';
import styles from '../../../dashboard.module.css';
import ActionBar from '../components/ActionBar';
import { Search, AlertCircle, Check } from 'lucide-react';

interface DoctorCategory {
  dcg_code: number;
  dcg_name: string;
}

interface DoctorRole {
  drl_code: number;
  drl_name: string;
}

interface Doctor {
  dct_code: number;
  dct_title?: string;
  dct_name: string;
  dct_specialty?: string;
  dct_dcg_code?: number;
  dct_drl_code?: number;
  dct_address?: string;
  dct_telephone?: string;
  dct_email?: string;
  dct_share_percent: number;
  category?: DoctorCategory | null;
  role?: DoctorRole | null;
}

const API = process.env.NEXT_PUBLIC_API_URL || 'http://localhost:8000';
const getToken = () => typeof window !== 'undefined' ? localStorage.getItem('token') : '';
const authHdr = () => ({ 'Content-Type': 'application/json', Authorization: `Bearer ${getToken()}` });

const blankForm = {
  dct_title: 'Dr.',
  dct_name: '',
  dct_specialty: '',
  dct_dcg_code: '',
  dct_drl_code: '',
  dct_address: '',
  dct_telephone: '',
  dct_email: '',
  dct_share_percent: '0.00',
};

export default function DoctorMasterPage() {
  const router = useRouter();

  // State
  const [items, setItems] = useState<Doctor[]>([]);
  const [categories, setCategories] = useState<DoctorCategory[]>([]);
  const [roles, setRoles] = useState<DoctorRole[]>([]);
  const [search, setSearch] = useState('');
  const [selectedId, setSelectedId] = useState<number | null>(null);
  const [entryMode, setEntryMode] = useState(false);
  const [editing, setEditing] = useState<Doctor | null>(null);

  const [form, setForm] = useState(blankForm);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');
  const [success, setSuccess] = useState('');

  // Refs
  const nameInputRef = useRef<HTMLInputElement>(null);
  const searchInputRef = useRef<HTMLInputElement>(null);

  // Load data
  const load = async () => {
    try {
      const [docRes, catRes, roleRes] = await Promise.all([
        fetch(`${API}/api/masters/doctors`).then(r => r.json()),
        fetch(`${API}/api/masters/doctor-categories`).then(r => r.json()),
        fetch(`${API}/api/masters/doctor-roles`).then(r => r.json()),
      ]);
      setItems(docRes);
      setCategories(catRes);
      setRoles(roleRes);

      if (docRes.length > 0) {
        setSelectedId(prev => {
          const exists = docRes.some((item: Doctor) => item.dct_code === prev);
          return exists ? prev : docRes[0].dct_code;
        });
      } else {
        setSelectedId(null);
      }
    } catch (e) {
      console.error('Error loading doctor master data:', e);
    }
  };

  useEffect(() => {
    load();
  }, []);

  // Autofocus
  useEffect(() => {
    if (entryMode && nameInputRef.current) {
      nameInputRef.current.focus();
    } else if (!entryMode && searchInputRef.current) {
      searchInputRef.current.focus();
    }
  }, [entryMode]);

  // Keyboard navigation
  useEffect(() => {
    const handleTableKeys = (e: KeyboardEvent) => {
      if (entryMode || items.length === 0) return;

      const filtered = items.filter(i =>
        i.dct_name.toLowerCase().includes(search.toLowerCase()) ||
        (i.dct_specialty ?? '').toLowerCase().includes(search.toLowerCase())
      );
      if (filtered.length === 0) return;

      const currentIndex = filtered.findIndex(i => i.dct_code === selectedId);

      if (e.key === 'ArrowDown') {
        e.preventDefault();
        const nextIndex = (currentIndex + 1) % filtered.length;
        setSelectedId(filtered[nextIndex].dct_code);
      } else if (e.key === 'ArrowUp') {
        e.preventDefault();
        const prevIndex = (currentIndex - 1 + filtered.length) % filtered.length;
        setSelectedId(filtered[prevIndex].dct_code);
      }
    };

    window.addEventListener('keydown', handleTableKeys);
    return () => window.removeEventListener('keydown', handleTableKeys);
  }, [entryMode, items, selectedId, search]);

  // Actions
  const handleAdd = () => {
    setEditing(null);
    setForm({
      ...blankForm,
      dct_dcg_code: categories[0]?.dcg_code?.toString() ?? '',
      dct_drl_code: roles[0]?.drl_code?.toString() ?? '',
    });
    setError('');
    setSuccess('');
    setEntryMode(true);
  };

  const handleEdit = () => {
    const item = items.find(i => i.dct_code === selectedId);
    if (!item) return;

    setEditing(item);
    setForm({
      dct_title: item.dct_title || 'Dr.',
      dct_name: item.dct_name,
      dct_specialty: item.dct_specialty || '',
      dct_dcg_code: item.dct_dcg_code?.toString() ?? '',
      dct_drl_code: item.dct_drl_code?.toString() ?? '',
      dct_address: item.dct_address || '',
      dct_telephone: item.dct_telephone || '',
      dct_email: item.dct_email || '',
      dct_share_percent: item.dct_share_percent.toString(),
    });
    setError('');
    setSuccess('');
    setEntryMode(true);
  };

  const handleDelete = async () => {
    if (!selectedId) return;
    const item = items.find(i => i.dct_code === selectedId);
    if (!item) return;

    if (!confirm(`Delete doctor record "${item.dct_name}"?`)) return;

    try {
      const r = await fetch(`${API}/api/masters/doctors/${selectedId}`, {
        method: 'DELETE',
        headers: authHdr()
      });
      if (!r.ok) throw new Error('Failed to delete');
      load();
    } catch (e: any) {
      alert(e.message);
    }
  };

  const handleRefresh = () => {
    load();
  };

  const handleExit = () => {
    if (entryMode) {
      setEntryMode(false);
      setEditing(null);
    } else {
      router.push('/dashboard/masters');
    }
  };

  const handleSave = async (e?: React.FormEvent) => {
    if (e) e.preventDefault();

    // Validation
    if (!form.dct_name.trim()) {
      setError('Invalid Doctor Name !!!');
      nameInputRef.current?.focus();
      return;
    }

    // Duplicate Check
    const isDuplicate = items.some(item =>
      item.dct_name.toLowerCase() === form.dct_name.trim().toLowerCase() &&
      item.dct_code !== editing?.dct_code
    );
    if (isDuplicate) {
      setError('Duplicate Input !!!');
      nameInputRef.current?.focus();
      return;
    }

    const sharePercent = parseFloat(form.dct_share_percent);
    if (isNaN(sharePercent) || sharePercent < 0 || sharePercent > 100) {
      setError('Invalid Share Percentage !!!');
      return;
    }

    setLoading(true);
    setError('');
    setSuccess('');

    try {
      const body = {
        dct_title: form.dct_title,
        dct_name: form.dct_name.trim(),
        dct_specialty: form.dct_specialty.trim() || null,
        dct_dcg_code: form.dct_dcg_code ? parseInt(form.dct_dcg_code) : null,
        dct_drl_code: form.dct_drl_code ? parseInt(form.dct_drl_code) : null,
        dct_address: form.dct_address.trim() || null,
        dct_telephone: form.dct_telephone.trim() || null,
        dct_email: form.dct_email.trim() || null,
        dct_share_percent: sharePercent,
        dct_rec_state: 1
      };

      const url = editing
        ? `${API}/api/masters/doctors/${editing.dct_code}`
        : `${API}/api/masters/doctors`;
      const method = editing ? 'PUT' : 'POST';

      const r = await fetch(url, {
        method,
        headers: authHdr(),
        body: JSON.stringify(body)
      });
      if (!r.ok) throw new Error(await r.text());

      setSuccess(editing ? 'Updated successfully' : 'Created successfully');
      load();
      setTimeout(() => {
        setEntryMode(false);
        setEditing(null);
      }, 800);
    } catch (e: any) {
      setError(e.message || 'Error occurred during save');
    } finally {
      setLoading(false);
    }
  };

  // PageDown hotkey to save
  useEffect(() => {
    const handleFormKeys = (e: KeyboardEvent) => {
      if (!entryMode) return;
      if (e.key === 'PageDown') {
        e.preventDefault();
        handleSave();
      }
    };
    window.addEventListener('keydown', handleFormKeys);
    return () => window.removeEventListener('keydown', handleFormKeys);
  }, [entryMode, form, editing, items]);

  const filtered = items.filter(i =>
    i.dct_name.toLowerCase().includes(search.toLowerCase()) ||
    (i.dct_specialty ?? '').toLowerCase().includes(search.toLowerCase())
  );

  return (
    <div style={{ display: 'flex', flexDirection: 'column', minHeight: 'calc(100vh - 140px)', justifyContent: 'space-between' }}>
      
      <div>
        {/* Legacy Form Title Label */}
        <div style={{
          backgroundColor: '#e0e0e0',
          padding: '10px',
          border: '1px solid #94a3b8',
          textAlign: 'center',
          fontWeight: 700,
          fontSize: '15px',
          fontFamily: 'Outfit, sans-serif',
          color: '#0f172a',
          marginBottom: '24px',
          borderRadius: '4px'
        }}>
          Doctor Master
        </div>

        {/* SUMMARY MODE (frFormSmry) */}
        {!entryMode && (
          <div className={styles.sectionBox}>
            <div className={styles.sectionHeader}>
              <h3 className={styles.sectionTitle}>Summary</h3>
            </div>

            {/* Search Frame */}
            <div className={styles.toolbar} style={{ marginBottom: '16px' }}>
              <div className={styles.searchBar}>
                <Search size={18} style={{ color: 'var(--text-muted)' }} />
                <input
                  ref={searchInputRef}
                  value={search}
                  onChange={e => {
                    setSearch(e.target.value);
                    const matching = items.filter(i =>
                      i.dct_name.toLowerCase().includes(e.target.value.toLowerCase()) ||
                      (i.dct_specialty ?? '').toLowerCase().includes(e.target.value.toLowerCase())
                    );
                    if (matching.length > 0 && !matching.some(m => m.dct_code === selectedId)) {
                      setSelectedId(matching[0].dct_code);
                    }
                  }}
                  placeholder="Search doctors (txtSearch1Text)..."
                />
              </div>
            </div>

            {/* Table Grid (Mfgrd1) */}
            <div className={styles.tableContainer}>
              <table className={styles.table}>
                <thead>
                  <tr>
                    <th style={{ width: '80px' }}>Code</th>
                    <th>Doctor Name</th>
                    <th>Category</th>
                    <th>Role</th>
                    <th>Share %</th>
                    <th>Op.Balance</th>
                    <th>Op.Dr.Bal</th>
                    <th>Op.Cr.Bal</th>
                    <th>Cur.Balance</th>
                    <th>Cur.Dr.Bal</th>
                    <th>Cur.Cr.Bal</th>
                    <th>Account Name</th>
                  </tr>
                </thead>
                <tbody>
                  {filtered.length === 0 && (
                    <tr>
                      <td colSpan={12} style={{ textAlign: 'center', padding: '40px', color: 'var(--text-secondary)' }}>
                        No doctors found
                      </td>
                    </tr>
                  )}
                  {filtered.map((item) => (
                    <tr
                      key={item.dct_code}
                      onClick={() => setSelectedId(item.dct_code)}
                      onDoubleClick={handleEdit}
                      style={{
                        cursor: 'pointer',
                        backgroundColor: selectedId === item.dct_code ? 'var(--accent-light)' : 'transparent',
                        fontWeight: selectedId === item.dct_code ? 600 : 400
                      }}
                    >
                      <td style={{ color: selectedId === item.dct_code ? 'var(--accent-color)' : 'var(--text-secondary)' }}>
                        #{item.dct_code}
                      </td>
                      <td>
                        <span style={{ color: 'var(--text-secondary)', fontWeight: 500, marginRight: '4px' }}>
                          {item.dct_title || 'Dr.'}
                        </span>
                        {item.dct_name}
                      </td>
                      <td>{item.category?.dcg_name || '—'}</td>
                      <td>{item.role?.drl_name || '—'}</td>
                      <td style={{ fontWeight: 700 }}>{item.dct_share_percent}%</td>
                      <td>0.00</td>
                      <td>0.00</td>
                      <td>0.00</td>
                      <td>0.00</td>
                      <td>0.00</td>
                      <td>0.00</td>
                      <td>—</td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          </div>
        )}

        {/* DETAIL MODE (frFormDtl) */}
        {entryMode && (
          <div className={styles.sectionBox}>
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

              <div className={styles.formGrid}>
                {/* Code (mskFormBoundField) - read-only */}
                <div className={styles.formGroup}>
                  <label>Code (mskFormBoundField)</label>
                  <input
                    className={styles.formControl}
                    value={editing ? editing.dct_code : '-1'}
                    disabled
                    style={{ backgroundColor: 'var(--bg-secondary)', fontWeight: 700 }}
                  />
                </div>

                {/* Title (txtDctTitle) */}
                <div className={styles.formGroup}>
                  <label>Title (txtDctTitle) *</label>
                  <select
                    className={styles.formControl}
                    value={form.dct_title}
                    onChange={e => setForm(f => ({ ...f, dct_title: e.target.value }))}
                  >
                    <option value="Dr.">Dr.</option>
                    <option value="Prof.">Prof.</option>
                    <option value="Mr.">Mr.</option>
                    <option value="Mrs.">Mrs.</option>
                    <option value="Ms.">Ms.</option>
                  </select>
                </div>

                {/* Doctor Name (txtDctName) */}
                <div className={styles.formGroup}>
                  <label>Doctor Name (txtDctName) *</label>
                  <input
                    ref={nameInputRef}
                    className={styles.formControl}
                    value={form.dct_name}
                    onChange={e => setForm(f => ({ ...f, dct_name: e.target.value }))}
                    maxLength={50}
                    required
                    placeholder="Enter doctor full name"
                  />
                </div>

                {/* Specialty (txtDctSpeci) */}
                <div className={styles.formGroup}>
                  <label>Speciality (txtDctSpeci)</label>
                  <input
                    className={styles.formControl}
                    value={form.dct_specialty}
                    onChange={e => setForm(f => ({ ...f, dct_specialty: e.target.value }))}
                    maxLength={50}
                    placeholder="e.g. Cardiology"
                  />
                </div>

                {/* Category (txtDcgName) */}
                <div className={styles.formGroup}>
                  <label>Doctor Category (txtDcgName) *</label>
                  <select
                    className={styles.formControl}
                    value={form.dct_dcg_code}
                    onChange={e => setForm(f => ({ ...f, dct_dcg_code: e.target.value }))}
                    required
                  >
                    <option value="">— Select Category —</option>
                    {categories.map(c => <option key={c.dcg_code} value={c.dcg_code}>{c.dcg_name}</option>)}
                  </select>
                </div>

                {/* Role (txtDrlName) */}
                <div className={styles.formGroup}>
                  <label>Doctor Role (txtDrlName) *</label>
                  <select
                    className={styles.formControl}
                    value={form.dct_drl_code}
                    onChange={e => setForm(f => ({ ...f, dct_drl_code: e.target.value }))}
                    required
                  >
                    <option value="">— Select Role —</option>
                    {roles.map(r => <option key={r.drl_code} value={r.drl_code}>{r.drl_name}</option>)}
                  </select>
                </div>

                {/* Share % (mskDctShare) */}
                <div className={styles.formGroup}>
                  <label>Share % (mskDctShare)</label>
                  <input
                    type="number"
                    min="0"
                    max="100"
                    step="0.01"
                    className={styles.formControl}
                    value={form.dct_share_percent}
                    onChange={e => setForm(f => ({ ...f, dct_share_percent: e.target.value }))}
                  />
                </div>

                {/* Telephone (txtDctTelNo) */}
                <div className={styles.formGroup}>
                  <label>Telephone (txtDctTelNo)</label>
                  <input
                    className={styles.formControl}
                    value={form.dct_telephone}
                    onChange={e => setForm(f => ({ ...f, dct_telephone: e.target.value }))}
                    maxLength={50}
                    placeholder="Contact number"
                  />
                </div>

                {/* Email (txtDctEmail) */}
                <div className={styles.formGroup}>
                  <label>Email (txtDctEmail)</label>
                  <input
                    type="email"
                    className={styles.formControl}
                    value={form.dct_email}
                    onChange={e => setForm(f => ({ ...f, dct_email: e.target.value }))}
                    maxLength={50}
                    placeholder="email@hospital.com"
                  />
                </div>

                {/* Account Head (txtAhName) - Mocked */}
                <div className={styles.formGroup}>
                  <label>Account Head Name (txtAhName)</label>
                  <input
                    className={styles.formControl}
                    value="— Not Configured —"
                    disabled
                    style={{ backgroundColor: 'var(--bg-secondary)', fontStyle: 'italic' }}
                  />
                </div>

                {/* Opening Balance (mskAhOpBal) - Mocked */}
                <div className={styles.formGroup}>
                  <label>Opening Balance (mskAhOpBal)</label>
                  <input
                    className={styles.formControl}
                    value="0.00"
                    disabled
                    style={{ backgroundColor: 'var(--bg-secondary)' }}
                  />
                </div>

                {/* DrCrFlag (txtDrCrFlag) - Mocked */}
                <div className={styles.formGroup}>
                  <label>Dr/Cr Flag (txtDrCrFlag)</label>
                  <input
                    className={styles.formControl}
                    value="Dr"
                    disabled
                    style={{ backgroundColor: 'var(--bg-secondary)', fontWeight: 700 }}
                  />
                </div>

                {/* Address (txtDctAddr) */}
                <div className={styles.formGroup} style={{ gridColumn: 'span 2' }}>
                  <label>Residential Address (txtDctAddr)</label>
                  <textarea
                    className={styles.formControl}
                    style={{ resize: 'none' }}
                    value={form.dct_address}
                    onChange={e => setForm(f => ({ ...f, dct_address: e.target.value }))}
                    maxLength={250}
                    rows={2}
                    placeholder="Enter residential address"
                  />
                </div>
              </div>

              <div style={{ fontSize: '11px', color: 'var(--text-secondary)', marginTop: '20px', fontStyle: 'italic' }}>
                Tip: Press <strong>PageDown</strong> on your keyboard to Save
              </div>

              {/* Form Buttons */}
              <div style={{ display: 'flex', justifyContent: 'flex-end', gap: '12px', marginTop: '24px' }}>
                <button type="button" className={styles.secondaryBtn} onClick={handleExit}>Cancel</button>
                <button type="submit" className={styles.primaryBtn} disabled={loading}>
                  {loading ? 'Saving…' : 'Save'}
                </button>
              </div>
            </form>
          </div>
        )}
      </div>

      {/* Action Button Bar */}
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
