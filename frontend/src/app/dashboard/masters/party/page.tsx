'use client';
import React, { useState, useEffect, useRef } from 'react';
import { useRouter } from 'next/navigation';
import styles from '../../../dashboard.module.css';
import ActionBar from '../components/ActionBar';
import { Search, AlertCircle, Check } from 'lucide-react';

interface PartyGroup { pgm_code: number; pgm_name: string; }
interface Party {
  prt_code: number;
  prt_title?: string;
  prt_name: string;
  prt_pgm_code: number;
  prt_addr?: string;
  prt_tel_no?: string;
  prt_sms_no?: string;
  prt_email?: string;
  prt_show_in_list: boolean;
  prt_remark?: string;
  prt_rec_state: number;
  group?: PartyGroup | null;
}

const API = process.env.NEXT_PUBLIC_API_URL || 'http://localhost:8000';
const getToken = () => typeof window !== 'undefined' ? localStorage.getItem('token') : '';
const authHdr = () => ({ 'Content-Type': 'application/json', Authorization: `Bearer ${getToken()}` });

const blankForm = {
  prt_title: 'Mr.',
  prt_name: '',
  prt_pgm_code: '',
  prt_addr: '',
  prt_tel_no: '',
  prt_sms_no: '',
  prt_email: '',
  prt_show_in_list: true,
  prt_remark: '',
};

export default function PartyMasterPage() {
  const router = useRouter();

  // State variables
  const [items, setItems] = useState<Party[]>([]);
  const [groups, setGroups] = useState<PartyGroup[]>([]);
  const [search, setSearch] = useState('');
  const [selectedId, setSelectedId] = useState<number | null>(null);
  const [entryMode, setEntryMode] = useState(false); // false = Summary view, true = Detail view
  const [editing, setEditing] = useState<Party | null>(null);

  const [form, setForm] = useState(blankForm);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');
  const [success, setSuccess] = useState('');

  // Refs
  const nameInputRef = useRef<HTMLInputElement>(null);
  const searchInputRef = useRef<HTMLInputElement>(null);

  // Load data
  const loadData = async () => {
    try {
      const [ptRes, pgRes] = await Promise.all([
        fetch(`${API}/api/masters/parties`),
        fetch(`${API}/api/masters/party-groups`)
      ]);

      if (pgRes.ok) setGroups(await pgRes.json());

      if (ptRes.ok) {
        const data = await ptRes.json();
        setItems(data);
        if (data.length > 0) {
          setSelectedId(prev => {
            const exists = data.some((item: Party) => item.prt_code === prev);
            return exists ? prev : data[0].prt_code;
          });
        } else {
          setSelectedId(null);
        }
      }
    } catch (e) {
      console.error('Error loading party data:', e);
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
        i.prt_name.toLowerCase().includes(search.toLowerCase()) ||
        (i.group?.pgm_name ?? '').toLowerCase().includes(search.toLowerCase())
      );
      if (filtered.length === 0) return;

      const currentIndex = filtered.findIndex(i => i.prt_code === selectedId);

      if (e.key === 'ArrowDown') {
        e.preventDefault();
        const nextIndex = (currentIndex + 1) % filtered.length;
        setSelectedId(filtered[nextIndex].prt_code);
      } else if (e.key === 'ArrowUp') {
        e.preventDefault();
        const prevIndex = (currentIndex - 1 + filtered.length) % filtered.length;
        setSelectedId(filtered[prevIndex].prt_code);
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
      prt_pgm_code: groups[0]?.pgm_code?.toString() ?? '',
    });
    setError('');
    setSuccess('');
    setEntryMode(true);
  };

  const handleEdit = () => {
    const item = items.find(i => i.prt_code === selectedId);
    if (!item) return;

    setEditing(item);
    setForm({
      prt_title: item.prt_title || 'Mr.',
      prt_name: item.prt_name,
      prt_pgm_code: item.prt_pgm_code.toString(),
      prt_addr: item.prt_addr || '',
      prt_tel_no: item.prt_tel_no || '',
      prt_sms_no: item.prt_sms_no || '',
      prt_email: item.prt_email || '',
      prt_show_in_list: item.prt_show_in_list,
      prt_remark: item.prt_remark || '',
    });
    setError('');
    setSuccess('');
    setEntryMode(true);
  };

  const handleDelete = async () => {
    if (!selectedId) return;
    const item = items.find(i => i.prt_code === selectedId);
    if (!item) return;

    if (!confirm(`Delete supplier "${item.prt_name}"?`)) return;

    try {
      const r = await fetch(`${API}/api/masters/parties/${selectedId}`, {
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
    if (!form.prt_name.trim()) {
      setError('Invalid Supplier Name !!!');
      nameInputRef.current?.focus();
      return;
    }

    if (!form.prt_pgm_code) {
      setError('Supplier Group is required !!!');
      return;
    }

    setLoading(true);
    setError('');
    setSuccess('');

    try {
      const body = {
        prt_title: form.prt_title,
        prt_name: form.prt_name.trim(),
        prt_pgm_code: parseInt(form.prt_pgm_code),
        prt_addr: form.prt_addr.trim() || null,
        prt_tel_no: form.prt_tel_no.trim() || null,
        prt_sms_no: form.prt_sms_no.trim() || null,
        prt_email: form.prt_email.trim() || null,
        prt_show_in_list: form.prt_show_in_list,
        prt_remark: form.prt_remark.trim() || null,
        prt_rec_state: 1,
      };

      const url = editing
        ? `${API}/api/masters/parties/${editing.prt_code}`
        : `${API}/api/masters/parties`;
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
    i.prt_name.toLowerCase().includes(search.toLowerCase()) ||
    (i.group?.pgm_name ?? '').toLowerCase().includes(search.toLowerCase())
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
          Supplier / Party Master [frmPartyMst]
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
                      i.prt_name.toLowerCase().includes(e.target.value.toLowerCase()) ||
                      (i.group?.pgm_name ?? '').toLowerCase().includes(e.target.value.toLowerCase())
                    );
                    if (matching.length > 0 && !matching.some(m => m.prt_code === selectedId)) {
                      setSelectedId(matching[0].prt_code);
                    }
                  }}
                  placeholder="Search suppliers (txtSearch)..."
                />
              </div>
            </div>

            {/* Table Grid (Mfgrd1) */}
            <div className={styles.tableContainer}>
              <table className={styles.table}>
                <thead>
                  <tr>
                    <th style={{ width: '80px' }}>Code</th>
                    <th>Supplier Name</th>
                    <th>Group</th>
                    <th>Contact No</th>
                    <th>Email</th>
                    <th>Show In List</th>
                  </tr>
                </thead>
                <tbody>
                  {filtered.length === 0 && (
                    <tr>
                      <td colSpan={6} style={{ textAlign: 'center', padding: '40px', color: 'var(--text-secondary)' }}>
                        No suppliers found
                      </td>
                    </tr>
                  )}
                  {filtered.map((item) => (
                    <tr
                      key={item.prt_code}
                      onClick={() => setSelectedId(item.prt_code)}
                      onDoubleClick={handleEdit}
                      style={{
                        cursor: 'pointer',
                        backgroundColor: selectedId === item.prt_code ? 'var(--accent-light)' : 'transparent',
                        fontWeight: selectedId === item.prt_code ? 600 : 400
                      }}
                    >
                      <td style={{ color: selectedId === item.prt_code ? 'var(--accent-color)' : 'var(--text-secondary)' }}>
                        #{item.prt_code}
                      </td>
                      <td>
                        <span style={{ color: 'var(--text-secondary)', marginRight: '4px' }}>{item.prt_title}</span>
                        {item.prt_name}
                      </td>
                      <td>{item.group?.pgm_name || '—'}</td>
                      <td>{item.prt_tel_no || '—'}</td>
                      <td>{item.prt_email || '—'}</td>
                      <td>
                        <span className={`${styles.badge} ${item.prt_show_in_list ? styles.badgeSuccess : styles.badgeDanger}`}>
                          {item.prt_show_in_list ? 'Yes' : 'No'}
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
                <div className={styles.formGroup} style={{ maxWidth: '200px' }}>
                  <label>Code (mskFormBoundField)</label>
                  <input
                    className={styles.formControl}
                    value={editing ? editing.prt_code : '-1'}
                    disabled
                    style={{ backgroundColor: 'var(--bg-secondary)', fontWeight: 700 }}
                  />
                </div>

                {/* Title */}
                <div className={styles.formGroup} style={{ maxWidth: '150px' }}>
                  <label htmlFor="prt_title">Title (cmbPrtTitle)</label>
                  <select
                    id="prt_title"
                    className={styles.formControl}
                    value={form.prt_title}
                    onChange={e => setForm(f => ({ ...f, prt_title: e.target.value }))}
                  >
                    <option value="Mr.">Mr.</option>
                    <option value="Mrs.">Mrs.</option>
                    <option value="Ms.">Ms.</option>
                    <option value="Dr.">Dr.</option>
                    <option value="M/s.">M/s.</option>
                  </select>
                </div>

                {/* Supplier Name */}
                <div className={styles.formGroup} style={{ flex: 2 }}>
                  <label htmlFor="prt_name">Supplier Name (txtPrtName) *</label>
                  <input
                    id="prt_name"
                    ref={nameInputRef}
                    className={styles.formControl}
                    value={form.prt_name}
                    onChange={e => setForm(f => ({ ...f, prt_name: e.target.value }))}
                    maxLength={50}
                    required
                    placeholder="Enter Supplier Name"
                  />
                </div>
              </div>

              <div className={styles.formGrid}>
                {/* Supplier Group */}
                <div className={styles.formGroup}>
                  <label htmlFor="prt_pgm_code">Supplier Group (txtPgmName) *</label>
                  <select
                    id="prt_pgm_code"
                    className={styles.formControl}
                    value={form.prt_pgm_code}
                    onChange={e => setForm(f => ({ ...f, prt_pgm_code: e.target.value }))}
                    required
                  >
                    <option value="">— Select Group —</option>
                    {groups.map(g => (
                      <option key={g.pgm_code} value={g.pgm_code}>{g.pgm_name}</option>
                    ))}
                  </select>
                </div>

                {/* Show in List Checkbox */}
                <div className={styles.formGroup} style={{ justifyContent: 'flex-end', paddingBottom: '10px' }}>
                  <label style={{ display: 'flex', alignItems: 'center', gap: '8px', cursor: 'pointer', fontSize: '13px', fontWeight: 600 }}>
                    <input
                      type="checkbox"
                      checked={form.prt_show_in_list}
                      onChange={e => setForm(f => ({ ...f, prt_show_in_list: e.target.checked }))}
                    />
                    Show In List (chkPrtShowInList)
                  </label>
                </div>
              </div>

              {/* Address */}
              <div className={styles.formGroup}>
                <label htmlFor="prt_addr">Address (txtPrtAddr)</label>
                <input
                  id="prt_addr"
                  className={styles.formControl}
                  value={form.prt_addr}
                  onChange={e => setForm(f => ({ ...f, prt_addr: e.target.value }))}
                  maxLength={250}
                  placeholder="Enter Address"
                />
              </div>

              <div className={styles.formGrid}>
                {/* Telephone No. */}
                <div className={styles.formGroup}>
                  <label htmlFor="prt_tel_no">Telephone No. (txtPrtTelNo)</label>
                  <input
                    id="prt_tel_no"
                    className={styles.formControl}
                    value={form.prt_tel_no}
                    onChange={e => setForm(f => ({ ...f, prt_tel_no: e.target.value }))}
                    maxLength={50}
                    placeholder="Enter phone/tel number"
                  />
                </div>

                {/* SMS Number */}
                <div className={styles.formGroup}>
                  <label htmlFor="prt_sms_no">SMS Number (txtPrtSMSNo)</label>
                  <input
                    id="prt_sms_no"
                    className={styles.formControl}
                    value={form.prt_sms_no}
                    onChange={e => setForm(f => ({ ...f, prt_sms_no: e.target.value }))}
                    maxLength={50}
                    placeholder="Enter SMS mobile number"
                  />
                </div>
              </div>

              <div className={styles.formGrid}>
                {/* Email */}
                <div className={styles.formGroup}>
                  <label htmlFor="prt_email">Email (txtPrtEmail)</label>
                  <input
                    id="prt_email"
                    type="email"
                    className={styles.formControl}
                    value={form.prt_email}
                    onChange={e => setForm(f => ({ ...f, prt_email: e.target.value }))}
                    maxLength={50}
                    placeholder="Enter email address"
                  />
                </div>

                {/* Remarks */}
                <div className={styles.formGroup}>
                  <label htmlFor="prt_remark">Remarks (txtPrtRemark)</label>
                  <input
                    id="prt_remark"
                    className={styles.formControl}
                    value={form.prt_remark}
                    onChange={e => setForm(f => ({ ...f, prt_remark: e.target.value }))}
                    maxLength={50}
                    placeholder="Enter remarks"
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
