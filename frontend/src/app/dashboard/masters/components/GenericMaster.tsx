'use client';
import React, { useState, useEffect, useRef } from 'react';
import { useRouter } from 'next/navigation';
import styles from '../../../dashboard.module.css';
import ActionBar from './ActionBar';
import { Search, AlertCircle, Check } from 'lucide-react';

export type FieldType = 'text' | 'number' | 'checkbox' | 'select' | 'date';

export interface FieldDef {
  key: string;
  label: string;
  type?: FieldType;
  required?: boolean;
  options?: { value: string | number; label: string }[];
  maxLength?: number;
  step?: string;
  full?: boolean; // full-width in grid
}

export interface ColumnDef {
  key: string;
  label: string;
  kind?: 'text' | 'number' | 'bool';
}

interface Props {
  title: string;          // e.g. "Test Department Master [frmTestDept]"
  apiBase: string;        // e.g. "/api/pathology/test-departments"
  pk: string;             // e.g. "TdpCode"
  recStateKey?: string;   // e.g. "TdpRecState"
  nameKey: string;        // primary display/search key, e.g. "TdpName"
  columns: ColumnDef[];
  fields: FieldDef[];
  backHref?: string;
}

const API = process.env.NEXT_PUBLIC_API_URL || 'http://localhost:8000';
const getToken = () => (typeof window !== 'undefined' ? localStorage.getItem('token') : '');
const authHdr = () => ({ 'Content-Type': 'application/json', Authorization: `Bearer ${getToken()}` });

export default function GenericMaster({
  title, apiBase, pk, recStateKey, nameKey, columns, fields, backHref = '/dashboard/masters',
}: Props) {
  const router = useRouter();
  const [items, setItems] = useState<any[]>([]);
  const [search, setSearch] = useState('');
  const [selectedId, setSelectedId] = useState<any>(null);
  const [entryMode, setEntryMode] = useState(false);
  const [editing, setEditing] = useState<any>(null);
  const [form, setForm] = useState<Record<string, any>>({});
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');
  const [success, setSuccess] = useState('');
  const nameRef = useRef<HTMLInputElement>(null);
  const searchRef = useRef<HTMLInputElement>(null);

  const blankForm = () => {
    const f: Record<string, any> = {};
    for (const fld of fields) f[fld.key] = fld.type === 'checkbox' ? false : '';
    return f;
  };

  const loadData = async () => {
    try {
      const r = await fetch(`${API}${apiBase}`);
      if (r.ok) {
        const data = await r.json();
        setItems(data);
        setSelectedId((prev: any) => {
          const exists = data.some((d: any) => d[pk] === prev);
          return exists ? prev : (data[0]?.[pk] ?? null);
        });
      }
    } catch (e) { console.error(e); }
  };
  useEffect(() => { loadData(); /* eslint-disable-next-line */ }, [apiBase]);

  useEffect(() => {
    if (entryMode) nameRef.current?.focus();
    else searchRef.current?.focus();
  }, [entryMode]);

  const handleAdd = () => { setEditing(null); setForm(blankForm()); setError(''); setSuccess(''); setEntryMode(true); };
  const handleEdit = () => {
    const item = items.find(i => i[pk] === selectedId);
    if (!item) return;
    const f: Record<string, any> = {};
    for (const fld of fields) {
      const v = item[fld.key];
      f[fld.key] = fld.type === 'checkbox' ? !!v : (v ?? '');
    }
    setEditing(item); setForm(f); setError(''); setSuccess(''); setEntryMode(true);
  };
  const handleDelete = async () => {
    if (selectedId == null) return;
    const item = items.find(i => i[pk] === selectedId);
    if (!item || !confirm(`Delete "${item[nameKey] ?? selectedId}"?`)) return;
    const r = await fetch(`${API}${apiBase}/${selectedId}`, { method: 'DELETE', headers: authHdr() });
    if (r.ok) loadData(); else alert(await r.text());
  };
  const handleExit = () => { if (entryMode) { setEntryMode(false); setEditing(null); } else router.push(backHref); };

  const handleSave = async (e?: React.FormEvent) => {
    if (e) e.preventDefault();
    if (nameKey && !String(form[nameKey] ?? '').trim()) {
      setError('Invalid Name !!!'); nameRef.current?.focus(); return;
    }
    setLoading(true); setError(''); setSuccess('');
    try {
      const body: Record<string, any> = {};
      for (const fld of fields) {
        let v = form[fld.key];
        if (fld.type === 'number') v = v === '' || v == null ? null : Number(v);
        else if (fld.type === 'checkbox') v = !!v;
        else if (fld.type === 'select') v = v === '' ? null : v;
        body[fld.key] = v;
      }
      if (recStateKey) body[recStateKey] = 1;
      const url = editing ? `${API}${apiBase}/${editing[pk]}` : `${API}${apiBase}`;
      const r = await fetch(url, { method: editing ? 'PUT' : 'POST', headers: authHdr(), body: JSON.stringify(body) });
      if (!r.ok) throw new Error(await r.text());
      setSuccess(editing ? 'Updated successfully' : 'Created successfully');
      loadData();
      setTimeout(() => { setEntryMode(false); setEditing(null); }, 700);
    } catch (err: any) {
      setError(err.message || 'Error occurred during save');
    } finally { setLoading(false); }
  };

  useEffect(() => {
    const onKey = (e: KeyboardEvent) => { if (entryMode && e.key === 'PageDown') { e.preventDefault(); handleSave(); } };
    window.addEventListener('keydown', onKey);
    return () => window.removeEventListener('keydown', onKey);
  }); // eslint-disable-line

  const filtered = items.filter(i => String(i[nameKey] ?? '').toLowerCase().includes(search.toLowerCase()));

  const renderCell = (item: any, col: ColumnDef) => {
    const v = item[col.key];
    if (col.kind === 'bool') return (
      <span className={`${styles.badge} ${v ? styles.badgeAccent : styles.badgeDanger}`}>{v ? 'Yes' : 'No'}</span>
    );
    if (col.kind === 'number') return typeof v === 'number' ? v : (v ?? '');
    return v ?? '';
  };

  return (
    <div style={{ display: 'flex', flexDirection: 'column', minHeight: 'calc(100vh - 140px)', justifyContent: 'space-between' }}>
      <div>
        <div style={{ backgroundColor: '#e0e0e0', padding: '10px', border: '1px solid #94a3b8', textAlign: 'center', fontWeight: 700, fontSize: '15px', color: '#0f172a', marginBottom: '24px', borderRadius: '4px' }}>
          {title}
        </div>

        {!entryMode && (
          <div className={styles.sectionBox}>
            <div className={styles.sectionHeader}><h3 className={styles.sectionTitle}>Summary</h3></div>
            <div className={styles.toolbar} style={{ marginBottom: '16px' }}>
              <div className={styles.searchBar}>
                <Search size={18} style={{ color: 'var(--text-muted)' }} />
                <input ref={searchRef} value={search} onChange={e => setSearch(e.target.value)} placeholder="Search (txtSearch)..." />
              </div>
            </div>
            <div className={styles.tableContainer}>
              <table className={styles.table}>
                <thead><tr><th style={{ width: '80px' }}>Code</th>{columns.map(c => <th key={c.key}>{c.label}</th>)}</tr></thead>
                <tbody>
                  {filtered.length === 0 && (
                    <tr><td colSpan={columns.length + 1} style={{ textAlign: 'center', padding: '40px', color: 'var(--text-secondary)' }}>No records found</td></tr>
                  )}
                  {filtered.map(item => (
                    <tr key={item[pk]} onClick={() => setSelectedId(item[pk])} onDoubleClick={handleEdit}
                      style={{ cursor: 'pointer', backgroundColor: selectedId === item[pk] ? 'var(--accent-light)' : 'transparent', fontWeight: selectedId === item[pk] ? 600 : 400 }}>
                      <td style={{ color: selectedId === item[pk] ? 'var(--accent-color)' : 'var(--text-secondary)' }}>#{item[pk]}</td>
                      {columns.map(c => <td key={c.key}>{renderCell(item, c)}</td>)}
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          </div>
        )}

        {entryMode && (
          <div className={styles.sectionBox}>
            <div className={styles.sectionHeader}><h3 className={styles.sectionTitle}>Detail [Mode: {editing ? 'Edit' : 'Add'}]</h3></div>
            <form onSubmit={handleSave}>
              {error && <div style={{ color: 'var(--status-danger)', display: 'flex', alignItems: 'center', gap: '8px', fontSize: '13px', marginBottom: '16px' }}><AlertCircle size={16} /> {error}</div>}
              {success && <div style={{ color: 'var(--status-success)', display: 'flex', alignItems: 'center', gap: '8px', fontSize: '13px', marginBottom: '16px' }}><Check size={16} /> {success}</div>}
              <div className={styles.formGrid}>
                <div className={styles.formGroup}>
                  <label>Code</label>
                  <input className={styles.formControl} value={editing ? editing[pk] : '-1'} disabled style={{ backgroundColor: 'var(--bg-secondary)', fontWeight: 700 }} />
                </div>
              </div>
              <div className={styles.formGrid}>
                {fields.map((fld, idx) => (
                  <div className={styles.formGroup} key={fld.key} style={fld.full ? { flex: '1 1 100%' } : undefined}>
                    <label>{fld.label}{fld.required ? ' *' : ''}</label>
                    {fld.type === 'checkbox' ? (
                      <label style={{ display: 'flex', alignItems: 'center', gap: '8px', cursor: 'pointer', fontSize: '13px', fontWeight: 600, paddingTop: '6px' }}>
                        <input type="checkbox" checked={!!form[fld.key]} onChange={e => setForm(f => ({ ...f, [fld.key]: e.target.checked }))} /> Enabled
                      </label>
                    ) : fld.type === 'select' ? (
                      <select className={styles.formControl} value={form[fld.key] ?? ''} required={fld.required}
                        onChange={e => setForm(f => ({ ...f, [fld.key]: e.target.value }))}>
                        <option value="">-- Select --</option>
                        {(fld.options || []).map(o => <option key={o.value} value={o.value}>{o.label}</option>)}
                      </select>
                    ) : (
                      <input
                        ref={idx === 0 ? nameRef : undefined}
                        className={styles.formControl}
                        type={fld.type === 'number' ? 'number' : fld.type === 'date' ? 'date' : 'text'}
                        step={fld.step}
                        maxLength={fld.maxLength}
                        required={fld.required}
                        value={form[fld.key] ?? ''}
                        onChange={e => setForm(f => ({ ...f, [fld.key]: e.target.value }))}
                      />
                    )}
                  </div>
                ))}
              </div>
              <div style={{ fontSize: '11px', color: 'var(--text-secondary)', marginTop: '20px', fontStyle: 'italic' }}>
                Tip: Press <strong>PageDown</strong> to Save
              </div>
              <div style={{ display: 'flex', justifyContent: 'flex-end', gap: '12px', marginTop: '24px' }}>
                <button type="button" className={styles.secondaryBtn} onClick={handleExit}>Cancel</button>
                <button type="submit" className={styles.primaryBtn} disabled={loading}>{loading ? 'Saving…' : 'Save'}</button>
              </div>
            </form>
          </div>
        )}
      </div>

      <ActionBar
        onAdd={handleAdd} onEdit={handleEdit} onRefresh={loadData} onDelete={handleDelete} onExit={handleExit}
        isEditing={entryMode} hasSelected={selectedId !== null}
        disabledActions={['print-voucher', 'print-report', 'export-excel', 'configure']}
      />
    </div>
  );
}
