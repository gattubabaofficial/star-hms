'use client';
import React, { useState, useEffect, useRef } from 'react';
import { useRouter } from 'next/navigation';
import styles from '../../../dashboard.module.css';
import ActionBar from '../components/ActionBar';
import { Search, AlertCircle, Check } from 'lucide-react';

interface PatientCategory {
  pcg_code: number;
  pcg_name: string;
  pcg_inf_allowed: boolean;
  pcg_def_allowed: boolean;
  pcg_disc_allowed: boolean;
  pcg_disc_per: number;
  pcg_show_in_list: boolean;
  pcg_rec_state: number;
}

const API = process.env.NEXT_PUBLIC_API_URL || 'http://localhost:8000';
const getToken = () => typeof window !== 'undefined' ? localStorage.getItem('token') : '';
const authHdr = () => ({ 'Content-Type': 'application/json', Authorization: `Bearer ${getToken()}` });

const blankForm = {
  pcg_name: '',
  pcg_inf_allowed: true,
  pcg_def_allowed: true,
  pcg_disc_allowed: true,
  pcg_disc_per: '0',
  pcg_show_in_list: true,
};

export default function PatientCategoryPage() {
  const router = useRouter();
  
  // State variables
  const [items, setItems] = useState<PatientCategory[]>([]);
  const [search, setSearch] = useState('');
  const [selectedId, setSelectedId] = useState<number | null>(null);
  const [entryMode, setEntryMode] = useState(false); // false = Summary view, true = Detail view
  const [editing, setEditing] = useState<PatientCategory | null>(null);
  
  const [form, setForm] = useState(blankForm);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');
  const [success, setSuccess] = useState('');
  
  // Refs
  const nameInputRef = useRef<HTMLInputElement>(null);
  const searchInputRef = useRef<HTMLInputElement>(null);

  // Load patient categories
  const load = async () => {
    try {
      const r = await fetch(`${API}/api/masters/patient-categories`);
      if (r.ok) {
        const data = await r.json();
        setItems(data);
        if (data.length > 0) {
          // If the previously selected item is still in the list, keep it selected. Otherwise select the first.
          setSelectedId(prev => {
            const exists = data.some((item: PatientCategory) => item.pcg_code === prev);
            return exists ? prev : data[0].pcg_code;
          });
        } else {
          setSelectedId(null);
        }
      }
    } catch (e) {
      console.error('Error loading patient categories:', e);
    }
  };

  useEffect(() => {
    load();
  }, []);

  // Set focus automatically when entering detail mode
  useEffect(() => {
    if (entryMode && nameInputRef.current) {
      nameInputRef.current.focus();
    } else if (!entryMode && searchInputRef.current) {
      searchInputRef.current.focus();
    }
  }, [entryMode]);

  // Keyboard navigation for summary table
  useEffect(() => {
    const handleTableKeys = (e: KeyboardEvent) => {
      if (entryMode || items.length === 0) return;
      
      const filtered = items.filter(i =>
        i.pcg_name.toLowerCase().includes(search.toLowerCase())
      );
      if (filtered.length === 0) return;

      const currentIndex = filtered.findIndex(i => i.pcg_code === selectedId);

      if (e.key === 'ArrowDown') {
        e.preventDefault();
        const nextIndex = (currentIndex + 1) % filtered.length;
        setSelectedId(filtered[nextIndex].pcg_code);
      } else if (e.key === 'ArrowUp') {
        e.preventDefault();
        const prevIndex = (currentIndex - 1 + filtered.length) % filtered.length;
        setSelectedId(filtered[prevIndex].pcg_code);
      }
    };

    window.addEventListener('keydown', handleTableKeys);
    return () => window.removeEventListener('keydown', handleTableKeys);
  }, [entryMode, items, selectedId, search]);

  // Actions
  const handleAdd = () => {
    setEditing(null);
    setForm(blankForm);
    setError('');
    setSuccess('');
    setEntryMode(true);
  };

  const handleEdit = () => {
    const item = items.find(i => i.pcg_code === selectedId);
    if (!item) return;
    
    setEditing(item);
    setForm({
      pcg_name: item.pcg_name,
      pcg_inf_allowed: item.pcg_inf_allowed,
      pcg_def_allowed: item.pcg_def_allowed,
      pcg_disc_allowed: item.pcg_disc_allowed,
      pcg_disc_per: item.pcg_disc_per.toString(),
      pcg_show_in_list: item.pcg_show_in_list,
    });
    setError('');
    setSuccess('');
    setEntryMode(true);
  };

  const handleDelete = async () => {
    if (!selectedId) return;
    const item = items.find(i => i.pcg_code === selectedId);
    if (!item) return;

    if (!confirm(`Delete patient category "${item.pcg_name}"?`)) return;
    
    try {
      const r = await fetch(`${API}/api/masters/patient-categories/${selectedId}`, {
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
      // Abort/Cancel editing and go back to summary mode
      setEntryMode(false);
      setEditing(null);
    } else {
      // Go back to the masters directory
      router.push('/dashboard/masters');
    }
  };

  const handleSave = async (e?: React.FormEvent) => {
    if (e) e.preventDefault();
    
    // Validations
    if (!form.pcg_name.trim()) {
      setError('Invalid Operator Name !!!');
      nameInputRef.current?.focus();
      return;
    }

    // Duplicate Check
    const isDuplicate = items.some(item => 
      item.pcg_name.toLowerCase() === form.pcg_name.trim().toLowerCase() && 
      item.pcg_code !== editing?.pcg_code
    );
    if (isDuplicate) {
      setError('Duplicate Input !!!');
      nameInputRef.current?.focus();
      return;
    }

    // Discount percentage validation
    const discPer = parseFloat(form.pcg_disc_per);
    if (isNaN(discPer) || discPer < 0) {
      setError('Invalid Discount Percentage !!!');
      return;
    }

    setLoading(true);
    setError('');
    setSuccess('');

    try {
      const body = {
        pcg_name: form.pcg_name.trim(),
        pcg_inf_allowed: form.pcg_inf_allowed,
        pcg_def_allowed: form.pcg_def_allowed,
        pcg_disc_allowed: form.pcg_disc_allowed,
        pcg_disc_per: discPer,
        pcg_show_in_list: form.pcg_show_in_list,
        pcg_rec_state: 1
      };

      const url = editing
        ? `${API}/api/masters/patient-categories/${editing.pcg_code}`
        : `${API}/api/masters/patient-categories`;
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

  // Handle PageDown hotkey inside detail view form to save
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
    i.pcg_name.toLowerCase().includes(search.toLowerCase())
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
          Patient Category Master
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
                    // Reset selectedId if the list changes and the current select is gone
                    const matching = items.filter(i => i.pcg_name.toLowerCase().includes(e.target.value.toLowerCase()));
                    if (matching.length > 0 && !matching.some(m => m.pcg_code === selectedId)) {
                      setSelectedId(matching[0].pcg_code);
                    }
                  }}
                  placeholder="Search categories (txtSearch1Text)..."
                />
              </div>
            </div>

            {/* Table Grid (Mfgrd1) */}
            <div className={styles.tableContainer}>
              <table className={styles.table}>
                <thead>
                  <tr>
                    <th style={{ width: '80px' }}>Code</th>
                    <th>Category Name</th>
                  </tr>
                </thead>
                <tbody>
                  {filtered.length === 0 && (
                    <tr>
                      <td colSpan={2} style={{ textAlign: 'center', padding: '40px', color: 'var(--text-secondary)' }}>
                        No categories found
                      </td>
                    </tr>
                  )}
                  {filtered.map((item) => (
                    <tr
                      key={item.pcg_code}
                      onClick={() => setSelectedId(item.pcg_code)}
                      onDoubleClick={handleEdit}
                      style={{
                        cursor: 'pointer',
                        backgroundColor: selectedId === item.pcg_code ? 'var(--accent-light)' : 'transparent',
                        fontWeight: selectedId === item.pcg_code ? 600 : 400
                      }}
                    >
                      <td style={{ color: selectedId === item.pcg_code ? 'var(--accent-color)' : 'var(--text-secondary)' }}>
                        #{item.pcg_code}
                      </td>
                      <td>{item.pcg_name}</td>
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

              {/* Code (mskFormBoundField) - read-only */}
              <div className={styles.formGroup} style={{ maxWidth: '200px' }}>
                <label>Code (mskFormBoundField)</label>
                <input
                  className={styles.formControl}
                  value={editing ? editing.pcg_code : '-1'}
                  disabled
                  style={{ backgroundColor: 'var(--bg-secondary)', fontWeight: 700 }}
                />
              </div>

              {/* Category Name (txtPcgName) */}
              <div className={styles.formGroup}>
                <label>Category Name (txtPcgName) *</label>
                <input
                  ref={nameInputRef}
                  className={styles.formControl}
                  value={form.pcg_name}
                  onChange={e => setForm(f => ({ ...f, pcg_name: e.target.value }))}
                  maxLength={50}
                  required
                  placeholder="Enter Category Name"
                />
              </div>

              <div className={styles.formGrid}>
                {/* Discount % (mskPcgDiscPer) */}
                <div className={styles.formGroup}>
                  <label>Discount % (mskPcgDiscPer)</label>
                  <input
                    type="number"
                    min="0"
                    max="100"
                    step="0.01"
                    className={styles.formControl}
                    value={form.pcg_disc_per}
                    onChange={e => setForm(f => ({ ...f, pcg_disc_per: e.target.value }))}
                  />
                </div>

                {/* Discount Allowed (chkPcgDiscAllowed) */}
                <div className={styles.formGroup} style={{ justifyContent: 'flex-end', paddingBottom: '10px' }}>
                  <label style={{ display: 'flex', alignItems: 'center', gap: '8px', cursor: 'pointer', fontSize: '13px', fontWeight: 600 }}>
                    <input
                      type="checkbox"
                      checked={form.pcg_disc_allowed}
                      onChange={e => setForm(f => ({ ...f, pcg_disc_allowed: e.target.checked }))}
                    />
                    Discount Allowed (chkPcgDiscAllowed)
                  </label>
                </div>
              </div>

              {/* Inflation Allowed (chkPcgInfAllowed) */}
              <div className={styles.formGroup} style={{ marginTop: '10px' }}>
                <label style={{ display: 'flex', alignItems: 'center', gap: '8px', cursor: 'pointer', fontSize: '13px', fontWeight: 600 }}>
                  <input
                    type="checkbox"
                    checked={form.pcg_inf_allowed}
                    onChange={e => setForm(f => ({ ...f, pcg_inf_allowed: e.target.checked }))}
                  />
                  Inflation Allowed / Rate Increment (chkPcgInfAllowed)
                </label>
              </div>

              {/* Deflation Allowed (chkPcgDefAllowed) */}
              <div className={styles.formGroup}>
                <label style={{ display: 'flex', alignItems: 'center', gap: '8px', cursor: 'pointer', fontSize: '13px', fontWeight: 600 }}>
                  <input
                    type="checkbox"
                    checked={form.pcg_def_allowed}
                    onChange={e => setForm(f => ({ ...f, pcg_def_allowed: e.target.checked }))}
                  />
                  Deflation Allowed / Rate Decrement (chkPcgDefAllowed)
                </label>
              </div>

              {/* Show in List (chkPcgShowInList) */}
              <div className={styles.formGroup}>
                <label style={{ display: 'flex', alignItems: 'center', gap: '8px', cursor: 'pointer', fontSize: '13px', fontWeight: 600 }}>
                  <input
                    type="checkbox"
                    checked={form.pcg_show_in_list}
                    onChange={e => setForm(f => ({ ...f, pcg_show_in_list: e.target.checked }))}
                  />
                  Show in List (chkPcgShowInList)
                </label>
              </div>

              {/* PageDown helper info */}
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
