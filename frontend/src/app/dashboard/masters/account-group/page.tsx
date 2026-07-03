'use client';
import React, { useState, useEffect } from 'react';
import styles from '../../../dashboard.module.css';
import { Plus, Search, AlertCircle, Check } from 'lucide-react';

interface AccountGroup {
  acg_code: number;
  acg_name: string;
  acg_abvr: string | null;
  acg_depends: number | null;
  acg_rec_state: number;
  parent_name: string | null;
}

const API = process.env.NEXT_PUBLIC_API_URL || 'http://localhost:8000';
const getToken = () => typeof window !== 'undefined' ? localStorage.getItem('token') : '';
const authHdr = () => ({ 'Content-Type': 'application/json', Authorization: `Bearer ${getToken()}` });

export default function AccountGroupPage() {
  const [items, setItems] = useState<AccountGroup[]>([]);
  const [search, setSearch] = useState('');
  const [editing, setEditing] = useState<AccountGroup | null>(null);
  const [form, setForm] = useState({ acg_name: '', acg_abvr: '', acg_depends: '' });
  const [loading, setLoading] = useState(false);
  const [showForm, setShowForm] = useState(false);
  const [error, setError] = useState('');
  const [success, setSuccess] = useState('');

  const load = async () => {
    try {
      const r = await fetch(`${API}/api/accounts/account-groups`);
      setItems(await r.json());
    } catch (e) {
      console.error('Error loading account groups data:', e);
    }
  };

  useEffect(() => {
    load();
  }, []);

  const openNew = () => {
    setEditing(null);
    setForm({ acg_name: '', acg_abvr: '', acg_depends: '' });
    setError('');
    setSuccess('');
    setShowForm(true);
  };

  const openEdit = (i: AccountGroup) => {
    setEditing(i);
    setForm({ acg_name: i.acg_name, acg_abvr: i.acg_abvr ?? '', acg_depends: i.acg_depends?.toString() ?? '' });
    setError('');
    setSuccess('');
    setShowForm(true);
  };

  const save = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!form.acg_name.trim()) {
      setError('Account Group Name is required');
      return;
    }
    setLoading(true);
    setError('');
    setSuccess('');
    try {
      const body = {
        acg_name: form.acg_name,
        acg_abvr: form.acg_abvr || null,
        acg_depends: form.acg_depends ? parseInt(form.acg_depends) : null,
        acg_rec_state: 1
      };
      const url = editing ? `${API}/api/accounts/account-groups/${editing.acg_code}` : `${API}/api/accounts/account-groups`;
      const r = await fetch(url, {
        method: editing ? 'PUT' : 'POST',
        headers: authHdr(),
        body: JSON.stringify(body)
      });
      if (!r.ok) throw new Error(await r.text());
      setSuccess(editing ? 'Updated successfully' : 'Created successfully');
      load();
      setTimeout(() => setShowForm(false), 1000);
    } catch (e: any) {
      setError(e.message);
    }
    setLoading(false);
  };

  const del = async (code: number) => {
    if (!confirm('Delete this account group?')) return;
    try {
      const r = await fetch(`${API}/api/accounts/account-groups/${code}`, {
        method: 'DELETE',
        headers: authHdr()
      });
      if (!r.ok) throw new Error('Failed to delete');
      load();
    } catch (e: any) {
      alert(e.message);
    }
  };

  const filtered = items.filter(i =>
    i.acg_name.toLowerCase().includes(search.toLowerCase())
  );

  const parentOptions = items.filter(i => i.acg_code !== editing?.acg_code);

  return (
    <div>
      <div className={styles.toolbar}>
        <div className={styles.searchBar}>
          <Search size={18} style={{ color: 'var(--text-muted)' }} />
          <input
            value={search}
            onChange={e => setSearch(e.target.value)}
            placeholder="Search account groups…"
          />
        </div>
        <button onClick={openNew} className={styles.primaryBtn}>
          <Plus size={18} />
          <span>Add Account Group</span>
        </button>
      </div>

      <div className={styles.tableContainer}>
        <table className={styles.table}>
          <thead>
            <tr>
              <th style={{ width: '60px' }}>#</th>
              <th>Group Name</th>
              <th>Abbr.</th>
              <th>Parent Group</th>
              <th style={{ textAlign: 'right', width: '200px' }}>Actions</th>
            </tr>
          </thead>
          <tbody>
            {filtered.length === 0 && (
              <tr>
                <td colSpan={5} style={{ textAlign: 'center', padding: '40px', color: 'var(--text-secondary)' }}>No account groups found</td>
              </tr>
            )}
            {filtered.map((item) => (
              <tr key={item.acg_code}>
                <td style={{ fontWeight: 600, color: 'var(--accent-color)' }}>#{item.acg_code}</td>
                <td style={{ fontWeight: 600 }}>{item.acg_name}</td>
                <td>{item.acg_abvr ?? '—'}</td>
                <td>{item.parent_name ?? '—'}</td>
                <td style={{ textAlign: 'right' }}>
                  <button onClick={() => openEdit(item)} className={styles.secondaryBtn} style={{ display: 'inline-flex', padding: '6px 12px', marginRight: '8px' }}>Edit</button>
                  <button onClick={() => del(item.acg_code)} className={styles.secondaryBtn} style={{ display: 'inline-flex', padding: '6px 12px', color: 'var(--status-danger)' }}>Delete</button>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>

      {showForm && (
        <div className={styles.modalOverlay}>
          <div className={styles.modalContent} style={{ maxWidth: '450px' }}>
            <div className={styles.modalHeader}>
              <h3 style={{ fontSize: '18px', fontWeight: 600 }}>{editing ? 'Edit' : 'New'} Account Group</h3>
              <button className={styles.closeBtn} onClick={() => setShowForm(false)}>×</button>
            </div>

            <form onSubmit={save}>
              <div className={styles.modalBody}>
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

                <div className={styles.formGroup}>
                  <label htmlFor="acg_name">Group Name *</label>
                  <input
                    id="acg_name"
                    className={styles.formControl}
                    value={form.acg_name}
                    onChange={e => setForm(f => ({ ...f, acg_name: e.target.value }))}
                    maxLength={60}
                    required
                  />
                </div>
                <div className={styles.formGroup}>
                  <label htmlFor="acg_abvr">Abbreviation</label>
                  <input
                    id="acg_abvr"
                    className={styles.formControl}
                    value={form.acg_abvr}
                    onChange={e => setForm(f => ({ ...f, acg_abvr: e.target.value }))}
                    maxLength={10}
                  />
                </div>
                <div className={styles.formGroup}>
                  <label htmlFor="acg_depends">Parent Group</label>
                  <select
                    id="acg_depends"
                    className={styles.formControl}
                    value={form.acg_depends}
                    onChange={e => setForm(f => ({ ...f, acg_depends: e.target.value }))}
                  >
                    <option value="">— None (Top Level) —</option>
                    {parentOptions.map(g => <option key={g.acg_code} value={g.acg_code}>{g.acg_name}</option>)}
                  </select>
                </div>
              </div>

              <div className={styles.modalFooter}>
                <button type="button" className={styles.secondaryBtn} onClick={() => setShowForm(false)}>Cancel</button>
                <button type="submit" className={styles.primaryBtn} disabled={loading}>
                  {loading ? 'Saving…' : 'Save'}
                </button>
              </div>
            </form>
          </div>
        </div>
      )}
    </div>
  );
}
