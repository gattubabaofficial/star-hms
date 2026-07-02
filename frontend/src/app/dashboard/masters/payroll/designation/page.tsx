'use client';
import React, { useState, useEffect, useRef } from 'react';
import { useRouter } from 'next/navigation';
import styles from '../../../../dashboard.module.css';
import ActionBar from '../../components/ActionBar';
import { Search, AlertCircle, Check } from 'lucide-react';

interface Designation {
  pdn_code: number;
  pdn_name: string;
  pdn_desc?: string;
  pdn_rec_state: number;
}

const API = process.env.NEXT_PUBLIC_API_URL || 'http://localhost:8000';
const getToken = () => typeof window !== 'undefined' ? localStorage.getItem('token') : '';
const authHdr = () => ({ 'Content-Type': 'application/json', Authorization: `Bearer ${getToken()}` });

const blankForm = {
  pdn_name: '',
  pdn_desc: ''
};

export default function DesignationMasterPage() {
  const router = useRouter();

  // State variables
  const [items, setItems] = useState<Designation[]>([]);
  const [search, setSearch] = useState('');
  const [selectedId, setSelectedId] = useState<number | null>(null);
  const [entryMode, setEntryMode] = useState(false); // false = Summary view, true = Detail view
  const [editing, setEditing] = useState<Designation | null>(null);

  const [form, setForm] = useState(blankForm);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');
  const [success, setSuccess] = useState('');

  // Refs
  const nameInputRef = useRef<HTMLInputElement>(null);
  const searchInputRef = useRef<HTMLInputElement>(null);

  // Load designations
  const load = async () => {
    try {
      const r = await fetch(`${API}/api/masters/payroll/designations`);
      if (r.ok) {
        const data = await r.json();
        setItems(data);
        if (data.length > 0) {
          setSelectedId(prev => {
            const exists = data.some((item: Designation) => item.pdn_code === prev);
            return exists ? prev : data[0].pdn_code;
          });
        } else {
          setSelectedId(null);
        }
      }
    } catch (e) {
      console.error('Error loading designations:', e);
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
        i.pdn_name.toLowerCase().includes(search.toLowerCase())
      );
      if (filtered.length === 0) return;

      const currentIndex = filtered.findIndex(i => i.pdn_code === selectedId);

      if (e.key === 'ArrowDown') {
        e.preventDefault();
        const nextIndex = (currentIndex + 1) % filtered.length;
        setSelectedId(filtered[nextIndex].pdn_code);
      } else if (e.key === 'ArrowUp') {
        e.preventDefault();
        const prevIndex = (currentIndex - 1 + filtered.length) % filtered.length;
        setSelectedId(filtered[prevIndex].pdn_code);
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
    const item = items.find(i => i.pdn_code === selectedId);
    if (!item) return;

    setEditing(item);
    setForm({
      pdn_name: item.pdn_name,
      pdn_desc: item.pdn_desc || '',
    });
    setError('');
    setSuccess('');
    setEntryMode(true);
  };

  const handleDelete = async () => {
    if (!selectedId) return;
    const item = items.find(i => i.pdn_code === selectedId);
    if (!item) return;

    if (!confirm(`Delete designation "${item.pdn_name}"?`)) return;

    try {
      const r = await fetch(`${API}/api/masters/payroll/designations/${selectedId}`, {
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

    // Validations
    if (!form.pdn_name.trim()) {
      setError('Invalid Designation Name !!!');
      nameInputRef.current?.focus();
      return;
    }

    // Duplicate Check
    const isDuplicate = items.some(item =>
      item.pdn_name.toLowerCase() === form.pdn_name.trim().toLowerCase() &&
      item.pdn_code !== editing?.pdn_code
    );
    if (isDuplicate) {
      setError('Duplicate Input !!!');
      nameInputRef.current?.focus();
      return;
    }

    setLoading(true);
    setError('');
    setSuccess('');

    try {
      const body = {
        pdn_name: form.pdn_name.trim(),
        pdn_desc: form.pdn_desc.trim() || null,
        pdn_rec_state: 1
      };

      const url = editing
        ? `${API}/api/masters/payroll/designations/${editing.pdn_code}`
        : `${API}/api/masters/payroll/designations`;
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
    i.pdn_name.toLowerCase().includes(search.toLowerCase())
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
          Designation Master [PayDesnMast.frm]
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
                    const matching = items.filter(i => i.pdn_name.toLowerCase().includes(e.target.value.toLowerCase()));
                    if (matching.length > 0 && !matching.some(m => m.pdn_code === selectedId)) {
                      setSelectedId(matching[0].pdn_code);
                    }
                  }}
                  placeholder="Search designations (txtSearch)..."
                />
              </div>
            </div>

            {/* Table Grid (Mfgrd1) */}
            <div className={styles.tableContainer} style={{ maxWidth: '800px' }}>
              <table className={styles.table}>
                <thead>
                  <tr>
                    <th style={{ width: '80px' }}>Code</th>
                    <th>Designation Name</th>
                    <th>Description</th>
                  </tr>
                </thead>
                <tbody>
                  {filtered.length === 0 && (
                    <tr>
                      <td colSpan={3} style={{ textAlign: 'center', padding: '40px', color: 'var(--text-secondary)' }}>
                        No designations found
                      </td>
                    </tr>
                  )}
                  {filtered.map((item) => (
                    <tr
                      key={item.pdn_code}
                      onClick={() => setSelectedId(item.pdn_code)}
                      onDoubleClick={handleEdit}
                      style={{
                        cursor: 'pointer',
                        backgroundColor: selectedId === item.pdn_code ? 'var(--accent-light)' : 'transparent',
                        fontWeight: selectedId === item.pdn_code ? 600 : 400
                      }}
                    >
                      <td style={{ color: selectedId === item.pdn_code ? 'var(--accent-color)' : 'var(--text-secondary)' }}>
                        #{item.pdn_code}
                      </td>
                      <td>{item.pdn_name}</td>
                      <td>{item.pdn_desc || '—'}</td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          </div>
        )}

        {/* DETAIL MODE (frFormDtl) */}
        {entryMode && (
          <div className={styles.sectionBox} style={{ maxWidth: '600px' }}>
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
                  value={editing ? editing.pdn_code : '-1'}
                  disabled
                  style={{ backgroundColor: 'var(--bg-secondary)', fontWeight: 700 }}
                />
              </div>

              {/* Designation Name (txtDsgName) */}
              <div className={styles.formGroup}>
                <label>Designation Name (txtDsgName) *</label>
                <input
                  ref={nameInputRef}
                  className={styles.formControl}
                  value={form.pdn_name}
                  onChange={e => setForm(f => ({ ...f, pdn_name: e.target.value }))}
                  maxLength={50}
                  required
                  placeholder="Enter Designation Name"
                />
              </div>

              {/* Description (txtDsgDesc) */}
              <div className={styles.formGroup}>
                <label>Description (txtDsgDesc)</label>
                <input
                  className={styles.formControl}
                  value={form.pdn_desc}
                  onChange={e => setForm(f => ({ ...f, pdn_desc: e.target.value }))}
                  maxLength={100}
                  placeholder="Enter Description"
                />
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
