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

interface RefBy {
  rby_code: number;
  rby_name: string;
  rby_speci?: string;
  rby_rfg_code?: number;
  rby_addr?: string;
  rby_tel_no?: string;
  rby_email?: string;
  rby_share: number;
  rby_rec_state: number;
  category?: RefCatg | null;
}

const API = process.env.NEXT_PUBLIC_API_URL || 'http://localhost:8000';
const getToken = () => typeof window !== 'undefined' ? localStorage.getItem('token') : '';
const authHdr = () => ({ 'Content-Type': 'application/json', Authorization: `Bearer ${getToken()}` });

const blankForm = {
  rby_name: '',
  rby_speci: '',
  rby_rfg_code: '',
  rby_addr: '',
  rby_tel_no: '',
  rby_email: '',
  rby_share: '0.00',
};

export default function ReferralByPage() {
  const router = useRouter();

  // State
  const [items, setItems] = useState<RefBy[]>([]);
  const [categories, setCategories] = useState<RefCatg[]>([]);
  const [search, setSearch] = useState('');
  const [selectedId, setSelectedId] = useState<number | null>(null);
  const [entryMode, setEntryMode] = useState(false);
  const [editing, setEditing] = useState<RefBy | null>(null);

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
        fetch(`${API}/api/masters/referred-by`).then(r => r.json()),
        fetch(`${API}/api/masters/referred-categories`).then(r => r.json()),
      ]);
      setItems(refRes);
      setCategories(catRes);

      if (refRes.length > 0) {
        setSelectedId(prev => {
          const exists = refRes.some((item: RefBy) => item.rby_code === prev);
          return exists ? prev : refRes[0].rby_code;
        });
      } else {
        setSelectedId(null);
      }
    } catch (e) {
      console.error('Error loading referred-by data:', e);
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
        i.rby_name.toLowerCase().includes(search.toLowerCase()) ||
        (i.rby_speci ?? '').toLowerCase().includes(search.toLowerCase())
      );
      if (filtered.length === 0) return;

      const currentIndex = filtered.findIndex(i => i.rby_code === selectedId);

      if (e.key === 'ArrowDown') {
        e.preventDefault();
        const nextIndex = (currentIndex + 1) % filtered.length;
        setSelectedId(filtered[nextIndex].rby_code);
      } else if (e.key === 'ArrowUp') {
        e.preventDefault();
        const prevIndex = (currentIndex - 1 + filtered.length) % filtered.length;
        setSelectedId(filtered[prevIndex].rby_code);
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
      rby_rfg_code: categories[0]?.rfg_code?.toString() ?? '',
    });
    setError('');
    setSuccess('');
    setEntryMode(true);
  };

  const handleEdit = () => {
    const item = items.find(i => i.rby_code === selectedId);
    if (!item) return;

    setEditing(item);
    setForm({
      rby_name: item.rby_name,
      rby_speci: item.rby_speci || '',
      rby_rfg_code: item.rby_rfg_code?.toString() ?? '',
      rby_addr: item.rby_addr || '',
      rby_tel_no: item.rby_tel_no || '',
      rby_email: item.rby_email || '',
      rby_share: item.rby_share.toString(),
    });
    setError('');
    setSuccess('');
    setEntryMode(true);
  };

  const handleDelete = async () => {
    if (!selectedId) return;
    const item = items.find(i => i.rby_code === selectedId);
    if (!item) return;

    if (!confirm(`Delete referred-by record "${item.rby_name}"?`)) return;

    try {
      const r = await fetch(`${API}/api/masters/referred-by/${selectedId}`, {
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
    if (!form.rby_name.trim()) {
      setError('Invalid Referred By Name !!!');
      nameInputRef.current?.focus();
      return;
    }

    // Duplicate Check
    const isDuplicate = items.some(item =>
      item.rby_name.toLowerCase() === form.rby_name.trim().toLowerCase() &&
      item.rby_code !== editing?.rby_code
    );
    if (isDuplicate) {
      setError('Duplicate Input !!!');
      nameInputRef.current?.focus();
      return;
    }

    const sharePercent = parseFloat(form.rby_share);
    if (isNaN(sharePercent) || sharePercent < 0 || sharePercent > 100) {
      setError('Invalid Share Percentage !!!');
      return;
    }

    setLoading(true);
    setError('');
    setSuccess('');

    try {
      const body = {
        rby_name: form.rby_name.trim(),
        rby_speci: form.rby_speci.trim() || null,
        rby_rfg_code: form.rby_rfg_code ? parseInt(form.rby_rfg_code) : null,
        rby_addr: form.rby_addr.trim() || null,
        rby_tel_no: form.rby_tel_no.trim() || null,
        rby_email: form.rby_email.trim() || null,
        rby_share: sharePercent,
        rby_rec_state: 1
      };

      const url = editing
        ? `${API}/api/masters/referred-by/${editing.rby_code}`
        : `${API}/api/masters/referred-by`;
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
    i.rby_name.toLowerCase().includes(search.toLowerCase()) ||
    (i.rby_speci ?? '').toLowerCase().includes(search.toLowerCase())
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
          Referred By Master
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
                      i.rby_name.toLowerCase().includes(e.target.value.toLowerCase()) ||
                      (i.rby_speci ?? '').toLowerCase().includes(e.target.value.toLowerCase())
                    );
                    if (matching.length > 0 && !matching.some(m => m.rby_code === selectedId)) {
                      setSelectedId(matching[0].rby_code);
                    }
                  }}
                  placeholder="Search referrers (txtSearch1Text)..."
                />
              </div>
            </div>

            {/* Table Grid (Mfgrd1) */}
            <div className={styles.tableContainer}>
              <table className={styles.table}>
                <thead>
                  <tr>
                    <th style={{ width: '80px' }}>Code</th>
                    <th>Referred By Name</th>
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
                        No referrers found
                      </td>
                    </tr>
                  )}
                  {filtered.map((item) => (
                    <tr
                      key={item.rby_code}
                      onClick={() => setSelectedId(item.rby_code)}
                      onDoubleClick={handleEdit}
                      style={{
                        cursor: 'pointer',
                        backgroundColor: selectedId === item.rby_code ? 'var(--accent-light)' : 'transparent',
                        fontWeight: selectedId === item.rby_code ? 600 : 400
                      }}
                    >
                      <td style={{ color: selectedId === item.rby_code ? 'var(--accent-color)' : 'var(--text-secondary)' }}>
                        #{item.rby_code}
                      </td>
                      <td>{item.rby_name}</td>
                      <td>{item.category?.rfg_name || '—'}</td>
                      <td>{item.rby_tel_no || '—'}</td>
                      <td style={{ fontWeight: 700 }}>{item.rby_share}%</td>
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
                    value={editing ? editing.rby_code : '-1'}
                    disabled
                    style={{ backgroundColor: 'var(--bg-secondary)', fontWeight: 700 }}
                  />
                </div>

                {/* Referred By Name (txtRByName) */}
                <div className={styles.formGroup}>
                  <label>Referred By Name (txtRByName) *</label>
                  <input
                    ref={nameInputRef}
                    className={styles.formControl}
                    value={form.rby_name}
                    onChange={e => setForm(f => ({ ...f, rby_name: e.target.value }))}
                    maxLength={50}
                    required
                    placeholder="Enter name"
                  />
                </div>

                {/* Specialty (txtRBySpeci) */}
                <div className={styles.formGroup}>
                  <label>Specialty (txtRBySpeci)</label>
                  <input
                    className={styles.formControl}
                    value={form.rby_speci}
                    onChange={e => setForm(f => ({ ...f, rby_speci: e.target.value }))}
                    maxLength={50}
                    placeholder="e.g. Pediatrics"
                  />
                </div>

                {/* Category (txtRfgName) */}
                <div className={styles.formGroup}>
                  <label>Referred Category (txtRfgName) *</label>
                  <select
                    className={styles.formControl}
                    value={form.rby_rfg_code}
                    onChange={e => setForm(f => ({ ...f, rby_rfg_code: e.target.value }))}
                    required
                  >
                    <option value="">— Select Category —</option>
                    {categories.map(c => <option key={c.rfg_code} value={c.rfg_code}>{c.rfg_name}</option>)}
                  </select>
                </div>

                {/* Share % (mskRByShare) */}
                <div className={styles.formGroup}>
                  <label>Share % (mskRByShare)</label>
                  <input
                    type="number"
                    min="0"
                    max="100"
                    step="0.01"
                    className={styles.formControl}
                    value={form.rby_share}
                    onChange={e => setForm(f => ({ ...f, rby_share: e.target.value }))}
                  />
                </div>

                {/* Telephone (txtRByTelNo) */}
                <div className={styles.formGroup}>
                  <label>Telephone (txtRByTelNo)</label>
                  <input
                    className={styles.formControl}
                    value={form.rby_tel_no}
                    onChange={e => setForm(f => ({ ...f, rby_tel_no: e.target.value }))}
                    maxLength={50}
                    placeholder="Contact number"
                  />
                </div>

                {/* Email (txtRByEmail) */}
                <div className={styles.formGroup}>
                  <label>Email (txtRByEmail)</label>
                  <input
                    type="email"
                    className={styles.formControl}
                    value={form.rby_email}
                    onChange={e => setForm(f => ({ ...f, rby_email: e.target.value }))}
                    maxLength={50}
                    placeholder="email@referrer.com"
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

                {/* Address (txtRByAddr) */}
                <div className={styles.formGroup} style={{ gridColumn: 'span 2' }}>
                  <label>Address (txtRByAddr)</label>
                  <textarea
                    className={styles.formControl}
                    style={{ resize: 'none' }}
                    value={form.rby_addr}
                    onChange={e => setForm(f => ({ ...f, rby_addr: e.target.value }))}
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
