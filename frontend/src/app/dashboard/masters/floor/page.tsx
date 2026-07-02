'use client';
import React, { useState, useEffect, useRef } from 'react';
import { useRouter } from 'next/navigation';
import styles from '../../../dashboard.module.css';
import ActionBar from '../components/ActionBar';
import { Search, AlertCircle, Check } from 'lucide-react';

interface Floor {
  flr_code: number;
  flr_name: string;
  flr_show_in_list: boolean;
  flr_rec_state: number;
}

const API = process.env.NEXT_PUBLIC_API_URL || 'http://localhost:8000';
const getToken = () => typeof window !== 'undefined' ? localStorage.getItem('token') : '';
const authHdr = () => ({ 'Content-Type': 'application/json', Authorization: `Bearer ${getToken()}` });

const blankForm = {
  flr_name: '',
  flr_show_in_list: true
};

export default function FloorMasterPage() {
  const router = useRouter();

  // State variables
  const [items, setItems] = useState<Floor[]>([]);
  const [search, setSearch] = useState('');
  const [selectedId, setSelectedId] = useState<number | null>(null);
  const [entryMode, setEntryMode] = useState(false); // false = Summary, true = Detail
  const [editing, setEditing] = useState<Floor | null>(null);

  const [form, setForm] = useState(blankForm);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');
  const [success, setSuccess] = useState('');

  // Refs
  const nameInputRef = useRef<HTMLInputElement>(null);
  const searchInputRef = useRef<HTMLInputElement>(null);

  // Load floors
  const loadData = async () => {
    try {
      const r = await fetch(`${API}/api/masters/floors`);
      if (r.ok) {
        const data = await r.json();
        setItems(data);
        if (data.length > 0) {
          setSelectedId(prev => {
            const exists = data.some((item: Floor) => item.flr_code === prev);
            return exists ? prev : data[0].flr_code;
          });
        } else {
          setSelectedId(null);
        }
      }
    } catch (e) {
      console.error('Error loading floors:', e);
    }
  };

  useEffect(() => {
    loadData();
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
        i.flr_name.toLowerCase().includes(search.toLowerCase())
      );
      if (filtered.length === 0) return;

      const currentIndex = filtered.findIndex(i => i.flr_code === selectedId);

      if (e.key === 'ArrowDown') {
        e.preventDefault();
        const nextIndex = (currentIndex + 1) % filtered.length;
        setSelectedId(filtered[nextIndex].flr_code);
      } else if (e.key === 'ArrowUp') {
        e.preventDefault();
        const prevIndex = (currentIndex - 1 + filtered.length) % filtered.length;
        setSelectedId(filtered[prevIndex].flr_code);
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
    const item = items.find(i => i.flr_code === selectedId);
    if (!item) return;

    setEditing(item);
    setForm({
      flr_name: item.flr_name,
      flr_show_in_list: item.flr_show_in_list
    });
    setError('');
    setSuccess('');
    setEntryMode(true);
  };

  const handleDelete = async () => {
    if (!selectedId) return;
    const item = items.find(i => i.flr_code === selectedId);
    if (!item) return;

    if (!confirm(`Delete floor "${item.flr_name}"?`)) return;

    try {
      const r = await fetch(`${API}/api/masters/floors/${selectedId}`, {
        method: 'DELETE',
        headers: authHdr()
      });
      if (!r.ok) throw new Error('Failed to delete');
      loadData();
    } catch (e: any) {
      alert(e.message);
    }
  };

  const handleRefresh = () => {
    loadData();
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
    if (!form.flr_name.trim()) {
      setError('Invalid Floor Name !!!');
      nameInputRef.current?.focus();
      return;
    }

    // Duplicate Check
    const isDuplicate = items.some(item =>
      item.flr_name.toLowerCase() === form.flr_name.trim().toLowerCase() &&
      item.flr_code !== editing?.flr_code
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
        flr_name: form.flr_name.trim(),
        flr_show_in_list: form.flr_show_in_list,
        flr_rec_state: 1
      };

      const url = editing
        ? `${API}/api/masters/floors/${editing.flr_code}`
        : `${API}/api/masters/floors`;
      const method = editing ? 'PUT' : 'POST';

      const r = await fetch(url, {
        method,
        headers: authHdr(),
        body: JSON.stringify(body)
      });
      if (!r.ok) throw new Error(await r.text());

      setSuccess(editing ? 'Updated successfully' : 'Created successfully');
      loadData();
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
    i.flr_name.toLowerCase().includes(search.toLowerCase())
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
          Bed Floor Master [frmFloorMast]
        </div>

        {/* SUMMARY MODE */}
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
                    const matching = items.filter(i => i.flr_name.toLowerCase().includes(e.target.value.toLowerCase()));
                    if (matching.length > 0 && !matching.some(m => m.flr_code === selectedId)) {
                      setSelectedId(matching[0].flr_code);
                    }
                  }}
                  placeholder="Search floors (txtSearch1Text)..."
                />
              </div>
            </div>

            {/* Table Grid (Mfgrd1) */}
            <div className={styles.tableContainer}>
              <table className={styles.table}>
                <thead>
                  <tr>
                    <th style={{ width: '80px' }}>Code</th>
                    <th>Floor Name</th>
                    <th>Show List</th>
                  </tr>
                </thead>
                <tbody>
                  {filtered.length === 0 && (
                    <tr>
                      <td colSpan={3} style={{ textAlign: 'center', padding: '40px', color: 'var(--text-secondary)' }}>
                        No floors found
                      </td>
                    </tr>
                  )}
                  {filtered.map((item) => (
                    <tr
                      key={item.flr_code}
                      onClick={() => setSelectedId(item.flr_code)}
                      onDoubleClick={handleEdit}
                      style={{
                        cursor: 'pointer',
                        backgroundColor: selectedId === item.flr_code ? 'var(--accent-light)' : 'transparent',
                        fontWeight: selectedId === item.flr_code ? 600 : 400
                      }}
                    >
                      <td style={{ color: selectedId === item.flr_code ? 'var(--accent-color)' : 'var(--text-secondary)' }}>
                        #{item.flr_code}
                      </td>
                      <td>{item.flr_name}</td>
                      <td>
                        <span className={`${styles.badge} ${item.flr_show_in_list ? styles.badgeAccent : styles.badgeDanger}`}>
                          {item.flr_show_in_list ? 'Yes' : 'No'}
                        </span>
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          </div>
        )}

        {/* DETAIL MODE */}
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
                {/* Code (mskFormBoundField) */}
                <div className={styles.formGroup}>
                  <label>Code (mskFormBoundField)</label>
                  <input
                    className={styles.formControl}
                    value={editing ? editing.flr_code : '-1'}
                    disabled
                    style={{ backgroundColor: 'var(--bg-secondary)', fontWeight: 700 }}
                  />
                </div>

                {/* Floor Name (txtFlrName) */}
                <div className={styles.formGroup} style={{ flex: 2 }}>
                  <label>Floor Name (txtFlrName) *</label>
                  <input
                    ref={nameInputRef}
                    className={styles.formControl}
                    value={form.flr_name}
                    onChange={e => setForm(f => ({ ...f, flr_name: e.target.value }))}
                    maxLength={50}
                    required
                    placeholder="Enter Floor Name"
                  />
                </div>
              </div>

              {/* Show in List checkbox */}
              <div className={styles.formGroup} style={{ marginTop: '16px', marginBottom: '24px' }}>
                <label style={{ display: 'flex', alignItems: 'center', gap: '8px', cursor: 'pointer', fontSize: '13px', fontWeight: 600 }}>
                  <input
                    type="checkbox"
                    checked={form.flr_show_in_list}
                    onChange={e => setForm(f => ({ ...f, flr_show_in_list: e.target.checked }))}
                  />
                  Show in List (chkFlrShowInList)
                </label>
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
