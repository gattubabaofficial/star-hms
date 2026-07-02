'use client';
import React, { useState, useEffect, useRef } from 'react';
import { useRouter } from 'next/navigation';
import styles from '../../../dashboard.module.css';
import ActionBar from '../components/ActionBar';
import { Search, AlertCircle, Check } from 'lucide-react';

interface RefCatg {
  rfg_code: number;
  rfg_name: string;
}

interface RefTo {
  rto_code: number;
  rto_name: string;
  rto_speci?: string;
  rto_rfg_code?: number;
  rto_addr?: string;
  rto_tel_no?: string;
  rto_email?: string;
  rto_share: number;
  rto_rec_state: number;
  category?: RefCatg | null;
}

const API = process.env.NEXT_PUBLIC_API_URL || 'http://localhost:8000';
const getToken = () => typeof window !== 'undefined' ? localStorage.getItem('token') : '';
const authHdr = () => ({ 'Content-Type': 'application/json', Authorization: `Bearer ${getToken()}` });

const blankForm = {
  rto_name: '',
  rto_speci: '',
  rto_rfg_code: '',
  rto_addr: '',
  rto_tel_no: '',
  rto_email: '',
  rto_share: '0.00',
};

export default function ReferralToPage() {
  const router = useRouter();

  // State
  const [items, setItems] = useState<RefTo[]>([]);
  const [categories, setCategories] = useState<RefCatg[]>([]);
  const [search, setSearch] = useState('');
  const [selectedId, setSelectedId] = useState<number | null>(null);
  const [entryMode, setEntryMode] = useState(false);
  const [editing, setEditing] = useState<RefTo | null>(null);

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
      const [refRes, catRes] = await Promise.all([
        fetch(`${API}/api/masters/referred-to`).then(r => r.json()),
        fetch(`${API}/api/masters/referred-categories`).then(r => r.json()),
      ]);
      setItems(refRes);
      setCategories(catRes);

      if (refRes.length > 0) {
        setSelectedId(prev => {
          const exists = refRes.some((item: RefTo) => item.rto_code === prev);
          return exists ? prev : refRes[0].rto_code;
        });
      } else {
        setSelectedId(null);
      }
    } catch (e) {
      console.error('Error loading referred-to data:', e);
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
        i.rto_name.toLowerCase().includes(search.toLowerCase()) ||
        (i.rto_speci ?? '').toLowerCase().includes(search.toLowerCase())
      );
      if (filtered.length === 0) return;

      const currentIndex = filtered.findIndex(i => i.rto_code === selectedId);

      if (e.key === 'ArrowDown') {
        e.preventDefault();
        const nextIndex = (currentIndex + 1) % filtered.length;
        setSelectedId(filtered[nextIndex].rto_code);
      } else if (e.key === 'ArrowUp') {
        e.preventDefault();
        const prevIndex = (currentIndex - 1 + filtered.length) % filtered.length;
        setSelectedId(filtered[prevIndex].rto_code);
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
      rto_rfg_code: categories[0]?.rfg_code?.toString() ?? '',
    });
    setError('');
    setSuccess('');
    setEntryMode(true);
  };

  const handleEdit = () => {
    const item = items.find(i => i.rto_code === selectedId);
    if (!item) return;

    setEditing(item);
    setForm({
      rto_name: item.rto_name,
      rto_speci: item.rto_speci || '',
      rto_rfg_code: item.rto_rfg_code?.toString() ?? '',
      rto_addr: item.rto_addr || '',
      rto_tel_no: item.rto_tel_no || '',
      rto_email: item.rto_email || '',
      rto_share: item.rto_share.toString(),
    });
    setError('');
    setSuccess('');
    setEntryMode(true);
  };

  const handleDelete = async () => {
    if (!selectedId) return;
    const item = items.find(i => i.rto_code === selectedId);
    if (!item) return;

    if (!confirm(`Delete referred-to record "${item.rto_name}"?`)) return;

    try {
      const r = await fetch(`${API}/api/masters/referred-to/${selectedId}`, {
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
    if (!form.rto_name.trim()) {
      setError('Invalid Referred To Name !!!');
      nameInputRef.current?.focus();
      return;
    }

    // Duplicate Check
    const isDuplicate = items.some(item =>
      item.rto_name.toLowerCase() === form.rto_name.trim().toLowerCase() &&
      item.rto_code !== editing?.rto_code
    );
    if (isDuplicate) {
      setError('Duplicate Input !!!');
      nameInputRef.current?.focus();
      return;
    }

    const sharePercent = parseFloat(form.rto_share);
    if (isNaN(sharePercent) || sharePercent < 0 || sharePercent > 100) {
      setError('Invalid Share Percentage !!!');
      return;
    }

    setLoading(true);
    setError('');
    setSuccess('');

    try {
      const body = {
        rto_name: form.rto_name.trim(),
        rto_speci: form.rto_speci.trim() || null,
        rto_rfg_code: form.rto_rfg_code ? parseInt(form.rto_rfg_code) : null,
        rto_addr: form.rto_addr.trim() || null,
        rto_tel_no: form.rto_tel_no.trim() || null,
        rto_email: form.rto_email.trim() || null,
        rto_share: sharePercent,
        rto_rec_state: 1
      };

      const url = editing
        ? `${API}/api/masters/referred-to/${editing.rto_code}`
        : `${API}/api/masters/referred-to`;
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
    i.rto_name.toLowerCase().includes(search.toLowerCase()) ||
    (i.rto_speci ?? '').toLowerCase().includes(search.toLowerCase())
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
          Referred To Master
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
                      i.rto_name.toLowerCase().includes(e.target.value.toLowerCase()) ||
                      (i.rto_speci ?? '').toLowerCase().includes(e.target.value.toLowerCase())
                    );
                    if (matching.length > 0 && !matching.some(m => m.rto_code === selectedId)) {
                      setSelectedId(matching[0].rto_code);
                    }
                  }}
                  placeholder="Search recipients (txtSearch1Text)..."
                />
              </div>
            </div>

            {/* Table Grid (Mfgrd1) */}
            <div className={styles.tableContainer}>
              <table className={styles.table}>
                <thead>
                  <tr>
                    <th style={{ width: '80px' }}>Code</th>
                    <th>Referred To Name</th>
                    <th>Category</th>
                    <th>Contact No</th>
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
                        No recipients found
                      </td>
                    </tr>
                  )}
                  {filtered.map((item) => (
                    <tr
                      key={item.rto_code}
                      onClick={() => setSelectedId(item.rto_code)}
                      onDoubleClick={handleEdit}
                      style={{
                        cursor: 'pointer',
                        backgroundColor: selectedId === item.rto_code ? 'var(--accent-light)' : 'transparent',
                        fontWeight: selectedId === item.rto_code ? 600 : 400
                      }}
                    >
                      <td style={{ color: selectedId === item.rto_code ? 'var(--accent-color)' : 'var(--text-secondary)' }}>
                        #{item.rto_code}
                      </td>
                      <td>{item.rto_name}</td>
                      <td>{item.category?.rfg_name || '—'}</td>
                      <td>{item.rto_tel_no || '—'}</td>
                      <td style={{ fontWeight: 700 }}>{item.rto_share}%</td>
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
                    value={editing ? editing.rto_code : '-1'}
                    disabled
                    style={{ backgroundColor: 'var(--bg-secondary)', fontWeight: 700 }}
                  />
                </div>

                {/* Referred To Name (txtRToName) */}
                <div className={styles.formGroup}>
                  <label>Referred To Name (txtRToName) *</label>
                  <input
                    ref={nameInputRef}
                    className={styles.formControl}
                    value={form.rto_name}
                    onChange={e => setForm(f => ({ ...f, rto_name: e.target.value }))}
                    maxLength={50}
                    required
                    placeholder="Enter name"
                  />
                </div>

                {/* Specialty (txtRToSpeci) */}
                <div className={styles.formGroup}>
                  <label>Specialty (txtRToSpeci)</label>
                  <input
                    className={styles.formControl}
                    value={form.rto_speci}
                    onChange={e => setForm(f => ({ ...f, rto_speci: e.target.value }))}
                    maxLength={50}
                    placeholder="e.g. Cardiology"
                  />
                </div>

                {/* Category (txtRfgName) */}
                <div className={styles.formGroup}>
                  <label>Referred Category (txtRfgName) *</label>
                  <select
                    className={styles.formControl}
                    value={form.rto_rfg_code}
                    onChange={e => setForm(f => ({ ...f, rto_rfg_code: e.target.value }))}
                    required
                  >
                    <option value="">— Select Category —</option>
                    {categories.map(c => <option key={c.rfg_code} value={c.rfg_code}>{c.rfg_name}</option>)}
                  </select>
                </div>

                {/* Share % (mskRToShare) */}
                <div className={styles.formGroup}>
                  <label>Share % (mskRToShare)</label>
                  <input
                    type="number"
                    min="0"
                    max="100"
                    step="0.01"
                    className={styles.formControl}
                    value={form.rto_share}
                    onChange={e => setForm(f => ({ ...f, rto_share: e.target.value }))}
                  />
                </div>

                {/* Telephone (txtRToTelNo) */}
                <div className={styles.formGroup}>
                  <label>Telephone (txtRToTelNo)</label>
                  <input
                    className={styles.formControl}
                    value={form.rto_tel_no}
                    onChange={e => setForm(f => ({ ...f, rto_tel_no: e.target.value }))}
                    maxLength={50}
                    placeholder="Contact number"
                  />
                </div>

                {/* Email (txtRToEmail) */}
                <div className={styles.formGroup}>
                  <label>Email (txtRToEmail)</label>
                  <input
                    type="email"
                    className={styles.formControl}
                    value={form.rto_email}
                    onChange={e => setForm(f => ({ ...f, rto_email: e.target.value }))}
                    maxLength={50}
                    placeholder="email@recipient.com"
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

                {/* Address (txtRToAddr) */}
                <div className={styles.formGroup} style={{ gridColumn: 'span 2' }}>
                  <label>Address (txtRToAddr)</label>
                  <textarea
                    className={styles.formControl}
                    style={{ resize: 'none' }}
                    value={form.rto_addr}
                    onChange={e => setForm(f => ({ ...f, rto_addr: e.target.value }))}
                    maxLength={250}
                    rows={2}
                    placeholder="Enter address"
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
