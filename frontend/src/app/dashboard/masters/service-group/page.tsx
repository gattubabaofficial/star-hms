'use client';
import React, { useState, useEffect, useRef } from 'react';
import { useRouter } from 'next/navigation';
import styles from '../../../dashboard.module.css';
import ActionBar from '../components/ActionBar';
import { Search, AlertCircle, Check } from 'lucide-react';

interface ServiceGroup {
  sgp_code: number;
  sgp_name: string;
  sgp_index: number;
  sgp_expanded: boolean;
  sgp_editable: boolean;
  sgp_inf_allowed: boolean;
  sgp_def_allowed: boolean;
  sgp_disc_allowed: boolean;
  sgp_disc_per: number;
  sgp_show_in_list: boolean;
  sgp_rec_state: number;
}

const API = process.env.NEXT_PUBLIC_API_URL || 'http://localhost:8000';
const getToken = () => typeof window !== 'undefined' ? localStorage.getItem('token') : '';
const authHdr = () => ({ 'Content-Type': 'application/json', Authorization: `Bearer ${getToken()}` });

const blankForm = {
  sgp_name: '',
  sgp_index: '0',
  sgp_expanded: false,
  sgp_editable: false,
  sgp_inf_allowed: false,
  sgp_def_allowed: false,
  sgp_disc_allowed: false,
  sgp_disc_per: '0',
  sgp_show_in_list: true,
};

export default function ServiceGroupPage() {
  const router = useRouter();

  // State variables
  const [items, setItems] = useState<ServiceGroup[]>([]);
  const [search, setSearch] = useState('');
  const [selectedId, setSelectedId] = useState<number | null>(null);
  const [entryMode, setEntryMode] = useState(false); // false = Summary view, true = Detail view
  const [editing, setEditing] = useState<ServiceGroup | null>(null);

  const [form, setForm] = useState(blankForm);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');
  const [success, setSuccess] = useState('');

  // Refs
  const nameInputRef = useRef<HTMLInputElement>(null);
  const searchInputRef = useRef<HTMLInputElement>(null);

  // Load service groups
  const load = async () => {
    try {
      const r = await fetch(`${API}/api/masters/service-groups`);
      if (r.ok) {
        const data = await r.json();
        setItems(data);
        if (data.length > 0) {
          setSelectedId(prev => {
            const exists = data.some((item: ServiceGroup) => item.sgp_code === prev);
            return exists ? prev : data[0].sgp_code;
          });
        } else {
          setSelectedId(null);
        }
      }
    } catch (e) {
      console.error('Error loading service groups:', e);
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
        i.sgp_name.toLowerCase().includes(search.toLowerCase())
      );
      if (filtered.length === 0) return;

      const currentIndex = filtered.findIndex(i => i.sgp_code === selectedId);

      if (e.key === 'ArrowDown') {
        e.preventDefault();
        const nextIndex = (currentIndex + 1) % filtered.length;
        setSelectedId(filtered[nextIndex].sgp_code);
      } else if (e.key === 'ArrowUp') {
        e.preventDefault();
        const prevIndex = (currentIndex - 1 + filtered.length) % filtered.length;
        setSelectedId(filtered[prevIndex].sgp_code);
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
    const item = items.find(i => i.sgp_code === selectedId);
    if (!item) return;

    setEditing(item);
    setForm({
      sgp_name: item.sgp_name,
      sgp_index: item.sgp_index.toString(),
      sgp_expanded: item.sgp_expanded,
      sgp_editable: item.sgp_editable,
      sgp_inf_allowed: item.sgp_inf_allowed,
      sgp_def_allowed: item.sgp_def_allowed,
      sgp_disc_allowed: item.sgp_disc_allowed,
      sgp_disc_per: item.sgp_disc_per.toString(),
      sgp_show_in_list: item.sgp_show_in_list,
    });
    setError('');
    setSuccess('');
    setEntryMode(true);
  };

  const handleDelete = async () => {
    if (!selectedId) return;
    const item = items.find(i => i.sgp_code === selectedId);
    if (!item) return;

    if (!confirm(`Delete service group "${item.sgp_name}"?`)) return;

    try {
      const r = await fetch(`${API}/api/masters/service-groups/${selectedId}`, {
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
    if (!form.sgp_name.trim()) {
      setError('Invalid Group Name !!!');
      nameInputRef.current?.focus();
      return;
    }

    // Duplicate Check
    const isDuplicate = items.some(item =>
      item.sgp_name.toLowerCase() === form.sgp_name.trim().toLowerCase() &&
      item.sgp_code !== editing?.sgp_code
    );
    if (isDuplicate) {
      setError('Duplicate Input !!!');
      nameInputRef.current?.focus();
      return;
    }

    const indexVal = parseInt(form.sgp_index);
    if (isNaN(indexVal) || indexVal < 0) {
      setError('Invalid Index Value !!!');
      return;
    }

    const discPer = parseFloat(form.sgp_disc_per);
    if (isNaN(discPer) || discPer < 0) {
      setError('Invalid Discount Percentage !!!');
      return;
    }

    setLoading(true);
    setError('');
    setSuccess('');

    try {
      const body = {
        sgp_name: form.sgp_name.trim(),
        sgp_index: indexVal,
        sgp_expanded: form.sgp_expanded,
        sgp_editable: form.sgp_editable,
        sgp_inf_allowed: form.sgp_inf_allowed,
        sgp_def_allowed: form.sgp_def_allowed,
        sgp_disc_allowed: form.sgp_disc_allowed,
        sgp_disc_per: discPer,
        sgp_show_in_list: form.sgp_show_in_list,
        sgp_rec_state: 1
      };

      const url = editing
        ? `${API}/api/masters/service-groups/${editing.sgp_code}`
        : `${API}/api/masters/service-groups`;
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
    i.sgp_name.toLowerCase().includes(search.toLowerCase())
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
          Service Group Master
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
                    const matching = items.filter(i => i.sgp_name.toLowerCase().includes(e.target.value.toLowerCase()));
                    if (matching.length > 0 && !matching.some(m => m.sgp_code === selectedId)) {
                      setSelectedId(matching[0].sgp_code);
                    }
                  }}
                  placeholder="Search groups (txtSearch1Text)..."
                />
              </div>
            </div>

            {/* Table Grid (Mfgrd1) */}
            <div className={styles.tableContainer}>
              <table className={styles.table}>
                <thead>
                  <tr>
                    <th style={{ width: '80px' }}>Code</th>
                    <th>Group Name</th>
                    <th>Index</th>
                    <th>Show List</th>
                  </tr>
                </thead>
                <tbody>
                  {filtered.length === 0 && (
                    <tr>
                      <td colSpan={4} style={{ textAlign: 'center', padding: '40px', color: 'var(--text-secondary)' }}>
                        No service groups found
                      </td>
                    </tr>
                  )}
                  {filtered.map((item) => (
                    <tr
                      key={item.sgp_code}
                      onClick={() => setSelectedId(item.sgp_code)}
                      onDoubleClick={handleEdit}
                      style={{
                        cursor: 'pointer',
                        backgroundColor: selectedId === item.sgp_code ? 'var(--accent-light)' : 'transparent',
                        fontWeight: selectedId === item.sgp_code ? 600 : 400
                      }}
                    >
                      <td style={{ color: selectedId === item.sgp_code ? 'var(--accent-color)' : 'var(--text-secondary)' }}>
                        #{item.sgp_code}
                      </td>
                      <td>{item.sgp_name}</td>
                      <td>{item.sgp_index}</td>
                      <td>
                        <span className={`${styles.badge} ${item.sgp_show_in_list ? styles.badgeAccent : styles.badgeDanger}`}>
                          {item.sgp_show_in_list ? 'Yes' : 'No'}
                        </span>
                      </td>
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
                    value={editing ? editing.sgp_code : '-1'}
                    disabled
                    style={{ backgroundColor: 'var(--bg-secondary)', fontWeight: 700 }}
                  />
                </div>

                {/* Index (mskSgpIndex) */}
                <div className={styles.formGroup}>
                  <label>Index (mskSgpIndex) *</label>
                  <input
                    type="number"
                    min="0"
                    className={styles.formControl}
                    value={form.sgp_index}
                    onChange={e => setForm(f => ({ ...f, sgp_index: e.target.value }))}
                    required
                  />
                </div>
              </div>

              {/* Group Name (txtSgpName) */}
              <div className={styles.formGroup}>
                <label>Group Name (txtSgpName) *</label>
                <input
                  ref={nameInputRef}
                  className={styles.formControl}
                  value={form.sgp_name}
                  onChange={e => setForm(f => ({ ...f, sgp_name: e.target.value }))}
                  maxLength={50}
                  required
                  placeholder="Enter Group Name"
                />
              </div>

              <div className={styles.formGrid}>
                {/* Discount % (mskSgpDiscPer) */}
                <div className={styles.formGroup}>
                  <label>Discount % (mskSgpDiscPer)</label>
                  <input
                    type="number"
                    min="0"
                    max="100"
                    step="0.01"
                    className={styles.formControl}
                    value={form.sgp_disc_per}
                    onChange={e => setForm(f => ({ ...f, sgp_disc_per: e.target.value }))}
                  />
                </div>

                {/* Discount Allowed (chkSgpDiscAllowed) */}
                <div className={styles.formGroup} style={{ justifyContent: 'flex-end', paddingBottom: '10px' }}>
                  <label style={{ display: 'flex', alignItems: 'center', gap: '8px', cursor: 'pointer', fontSize: '13px', fontWeight: 600 }}>
                    <input
                      type="checkbox"
                      checked={form.sgp_disc_allowed}
                      onChange={e => setForm(f => ({ ...f, sgp_disc_allowed: e.target.checked }))}
                    />
                    Discount Allowed (chkSgpDiscAllowed)
                  </label>
                </div>
              </div>

              <div className={styles.formGrid} style={{ marginTop: '10px' }}>
                {/* Inflation Allowed (chkSgpInfAllowed) */}
                <div className={styles.formGroup}>
                  <label style={{ display: 'flex', alignItems: 'center', gap: '8px', cursor: 'pointer', fontSize: '13px', fontWeight: 600 }}>
                    <input
                      type="checkbox"
                      checked={form.sgp_inf_allowed}
                      onChange={e => setForm(f => ({ ...f, sgp_inf_allowed: e.target.checked }))}
                    />
                    Inflation Allowed (chkSgpInfAllowed)
                  </label>
                </div>

                {/* Deflation Allowed (chkSgpDefAllowed) */}
                <div className={styles.formGroup}>
                  <label style={{ display: 'flex', alignItems: 'center', gap: '8px', cursor: 'pointer', fontSize: '13px', fontWeight: 600 }}>
                    <input
                      type="checkbox"
                      checked={form.sgp_def_allowed}
                      onChange={e => setForm(f => ({ ...f, sgp_def_allowed: e.target.checked }))}
                    />
                    Deflation Allowed (chkSgpDefAllowed)
                  </label>
                </div>
              </div>

              <div className={styles.formGrid}>
                {/* Expanded (chkSgpExpanded) */}
                <div className={styles.formGroup}>
                  <label style={{ display: 'flex', alignItems: 'center', gap: '8px', cursor: 'pointer', fontSize: '13px', fontWeight: 600 }}>
                    <input
                      type="checkbox"
                      checked={form.sgp_expanded}
                      onChange={e => setForm(f => ({ ...f, sgp_expanded: e.target.checked }))}
                    />
                    Expanded Print (chkSgpExpanded)
                  </label>
                </div>

                {/* Editable (chkSgpEditable) */}
                <div className={styles.formGroup}>
                  <label style={{ display: 'flex', alignItems: 'center', gap: '8px', cursor: 'pointer', fontSize: '13px', fontWeight: 600 }}>
                    <input
                      type="checkbox"
                      checked={form.sgp_editable}
                      onChange={e => setForm(f => ({ ...f, sgp_editable: e.target.checked }))}
                    />
                    Editable (chkSgpEditable)
                  </label>
                </div>
              </div>

              {/* Show in List (chkSgpShowInList) */}
              <div className={styles.formGroup}>
                <label style={{ display: 'flex', alignItems: 'center', gap: '8px', cursor: 'pointer', fontSize: '13px', fontWeight: 600 }}>
                  <input
                    type="checkbox"
                    checked={form.sgp_show_in_list}
                    onChange={e => setForm(f => ({ ...f, sgp_show_in_list: e.target.checked }))}
                  />
                  Show in List (chkSgpShowInList)
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
