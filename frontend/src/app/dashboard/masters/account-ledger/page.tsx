'use client';
import React, { useState, useEffect } from 'react';
import styles from '../../../dashboard.module.css';
import { Plus, Search, AlertCircle, Check } from 'lucide-react';

interface AccountGroup { acg_code: number; acg_name: string; }
interface AccountLedger {
  ah_code: number;
  ah_name: string;
  ah_depends: number | null;
  ah_acg_code: number | null;
  ah_rec_state: number;
  group_name: string | null;
  parent_name: string | null;
}

const API = process.env.NEXT_PUBLIC_API_URL || 'http://localhost:8000';
const getToken = () => typeof window !== 'undefined' ? localStorage.getItem('token') : '';
const authHdr = () => ({ 'Content-Type': 'application/json', Authorization: `Bearer ${getToken()}` });

export default function AccountLedgerPage() {
  const [items, setItems] = useState<AccountLedger[]>([]);
  const [groups, setGroups] = useState<AccountGroup[]>([]);
  const [search, setSearch] = useState('');
  const [editing, setEditing] = useState<AccountLedger | null>(null);
  const [form, setForm] = useState({ ah_name: '', ah_acg_code: '', ah_depends: '' });
  const [loading, setLoading] = useState(false);
  const [showForm, setShowForm] = useState(false);
  const [error, setError] = useState('');
  const [success, setSuccess] = useState('');

  const load = async () => {
    try {
      const [lg, gr] = await Promise.all([
        fetch(`${API}/api/accounts/account-ledgers`).then(r => r.json()),
        fetch(`${API}/api/accounts/account-groups`).then(r => r.json()),
      ]);
      setItems(lg);
      setGroups(gr);
    } catch (e) {
      console.error('Error loading account ledgers data:', e);
    }
  };

  useEffect(() => {
    load();
  }, []);

  const openNew = () => {
    setEditing(null);
    setForm({ ah_name: '', ah_acg_code: '', ah_depends: '' });
    setError('');
    setSuccess('');
    setShowForm(true);
  };

  const openEdit = (i: AccountLedger) => {
    setEditing(i);
    setForm({
      ah_name: i.ah_name,
      ah_acg_code: i.ah_acg_code?.toString() ?? '',
      ah_depends: i.ah_depends?.toString() ?? '',
    });
    setError('');
    setSuccess('');
    setShowForm(true);
  };

  const save = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!form.ah_name.trim()) {
      setError('Ledger Name is required');
      return;
    }
    setLoading(true);
    setError('');
    setSuccess('');
    try {
      const body = {
        ah_name: form.ah_name,
        ah_acg_code: form.ah_acg_code ? parseInt(form.ah_acg_code) : null,
        ah_depends: form.ah_depends ? parseInt(form.ah_depends) : null,
        ah_rec_state: 1
      };
      const url = editing ? `${API}/api/accounts/account-ledgers/${editing.ah_code}` : `${API}/api/accounts/account-ledgers`;
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
    if (!confirm('Delete this account ledger?')) return;
    try {
      const r = await fetch(`${API}/api/accounts/account-ledgers/${code}`, {
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
    i.ah_name.toLowerCase().includes(search.toLowerCase())
  );

  const parentOptions = items.filter(i => i.ah_code !== editing?.ah_code);

  return (
    <div>
      <div className={styles.toolbar}>
        <div className={styles.searchBar}>
          <Search size={18} style={{ color: 'var(--text-muted)' }} />
          <input
            value={search}
            onChange={e => setSearch(e.target.value)}
            placeholder="Search account ledgers…"
          />
        </div>
        <button onClick={openNew} className={styles.primaryBtn}>
          <Plus size={18} />
          <span>Add Account Ledger</span>
        </button>
      </div>

      <div className={styles.tableContainer}>
        <table className={styles.table}>
          <thead>
            <tr>
              <th style={{ width: '60px' }}>#</th>
              <th>Ledger Name</th>
              <th>Account Group</th>
              <th>Parent Ledger</th>
              <th style={{ textAlign: 'right', width: '200px' }}>Actions</th>
            </tr>
          </thead>
          <tbody>
            {filtered.length === 0 && (
              <tr>
                <td colSpan={5} style={{ textAlign: 'center', padding: '40px', color: 'var(--text-secondary)' }}>No account ledgers found</td>
              </tr>
            )}
            {filtered.map((item) => (
              <tr key={item.ah_code}>
                <td style={{ fontWeight: 600, color: 'var(--accent-color)' }}>#{item.ah_code}</td>
                <td style={{ fontWeight: 600 }}>{item.ah_name}</td>
                <td>{item.group_name ?? '—'}</td>
                <td>{item.parent_name ?? '—'}</td>
                <td style={{ textAlign: 'right' }}>
                  <button onClick={() => openEdit(item)} className={styles.secondaryBtn} style={{ display: 'inline-flex', padding: '6px 12px', marginRight: '8px' }}>Edit</button>
                  <button onClick={() => del(item.ah_code)} className={styles.secondaryBtn} style={{ display: 'inline-flex', padding: '6px 12px', color: 'var(--status-danger)' }}>Delete</button>
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
              <h3 style={{ fontSize: '18px', fontWeight: 600 }}>{editing ? 'Edit' : 'New'} Account Ledger</h3>
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
                  <label htmlFor="ah_name">Ledger Name *</label>
                  <input
                    id="ah_name"
                    className={styles.formControl}
                    value={form.ah_name}
                    onChange={e => setForm(f => ({ ...f, ah_name: e.target.value }))}
                    maxLength={60}
                    required
                  />
                </div>
                <div className={styles.formGroup}>
                  <label htmlFor="ah_acg_code">Account Group</label>
                  <select
                    id="ah_acg_code"
                    className={styles.formControl}
                    value={form.ah_acg_code}
                    onChange={e => setForm(f => ({ ...f, ah_acg_code: e.target.value }))}
                  >
                    <option value="">— Select Account Group —</option>
                    {groups.map(g => <option key={g.acg_code} value={g.acg_code}>{g.acg_name}</option>)}
                  </select>
                </div>
                <div className={styles.formGroup}>
                  <label htmlFor="ah_depends">Parent Ledger</label>
                  <select
                    id="ah_depends"
                    className={styles.formControl}
                    value={form.ah_depends}
                    onChange={e => setForm(f => ({ ...f, ah_depends: e.target.value }))}
                  >
                    <option value="">— None (Top Level) —</option>
                    {parentOptions.map(l => <option key={l.ah_code} value={l.ah_code}>{l.ah_name}</option>)}
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
