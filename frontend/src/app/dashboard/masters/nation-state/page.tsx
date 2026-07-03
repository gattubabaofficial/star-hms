'use client';
import React, { useState, useEffect } from 'react';
import styles from '../../../dashboard.module.css';
import { Plus, Search, AlertCircle, Check } from 'lucide-react';

interface NationState {
  nst_code: number;
  nst_name: string | null;
  nst_ref_code: string | null;
  nst_rec_state: number;
}

const API = process.env.NEXT_PUBLIC_API_URL || 'http://localhost:8000';
const getToken = () => typeof window !== 'undefined' ? localStorage.getItem('token') : '';
const authHdr = () => ({ 'Content-Type': 'application/json', Authorization: `Bearer ${getToken()}` });

export default function NationStatePage() {
  const [items, setItems] = useState<NationState[]>([]);
  const [search, setSearch] = useState('');
  const [editing, setEditing] = useState<NationState | null>(null);
  const [form, setForm] = useState({ nst_name: '', nst_ref_code: '' });
  const [loading, setLoading] = useState(false);
  const [showForm, setShowForm] = useState(false);
  const [error, setError] = useState('');
  const [success, setSuccess] = useState('');

  const load = async () => {
    try {
      const r = await fetch(`${API}/api/accounts/nation-states`);
      setItems(await r.json());
    } catch (e) {
      console.error('Error loading nation/state data:', e);
    }
  };

  useEffect(() => {
    load();
  }, []);

  const openNew = () => {
    setEditing(null);
    setForm({ nst_name: '', nst_ref_code: '' });
    setError('');
    setSuccess('');
    setShowForm(true);
  };

  const openEdit = (i: NationState) => {
    setEditing(i);
    setForm({ nst_name: i.nst_name ?? '', nst_ref_code: i.nst_ref_code ?? '' });
    setError('');
    setSuccess('');
    setShowForm(true);
  };

  const save = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!form.nst_name.trim()) {
      setError('Name is required');
      return;
    }
    setLoading(true);
    setError('');
    setSuccess('');
    try {
      const body = { nst_name: form.nst_name, nst_ref_code: form.nst_ref_code || null, nst_rec_state: 1 };
      const url = editing ? `${API}/api/accounts/nation-states/${editing.nst_code}` : `${API}/api/accounts/nation-states`;
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
    if (!confirm('Delete this entry?')) return;
    try {
      const r = await fetch(`${API}/api/accounts/nation-states/${code}`, {
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
    (i.nst_name ?? '').toLowerCase().includes(search.toLowerCase())
  );

  return (
    <div>
      <div className={styles.toolbar}>
        <div className={styles.searchBar}>
          <Search size={18} style={{ color: 'var(--text-muted)' }} />
          <input
            value={search}
            onChange={e => setSearch(e.target.value)}
            placeholder="Search nation/state…"
          />
        </div>
        <button onClick={openNew} className={styles.primaryBtn}>
          <Plus size={18} />
          <span>Add Nation/State</span>
        </button>
      </div>

      <div className={styles.tableContainer}>
        <table className={styles.table}>
          <thead>
            <tr>
              <th style={{ width: '60px' }}>#</th>
              <th>Name</th>
              <th>Ref. Code</th>
              <th style={{ textAlign: 'right', width: '200px' }}>Actions</th>
            </tr>
          </thead>
          <tbody>
            {filtered.length === 0 && (
              <tr>
                <td colSpan={4} style={{ textAlign: 'center', padding: '40px', color: 'var(--text-secondary)' }}>No entries found</td>
              </tr>
            )}
            {filtered.map((item) => (
              <tr key={item.nst_code}>
                <td style={{ fontWeight: 600, color: 'var(--accent-color)' }}>#{item.nst_code}</td>
                <td style={{ fontWeight: 600 }}>{item.nst_name}</td>
                <td>{item.nst_ref_code ?? '—'}</td>
                <td style={{ textAlign: 'right' }}>
                  <button onClick={() => openEdit(item)} className={styles.secondaryBtn} style={{ display: 'inline-flex', padding: '6px 12px', marginRight: '8px' }}>Edit</button>
                  <button onClick={() => del(item.nst_code)} className={styles.secondaryBtn} style={{ display: 'inline-flex', padding: '6px 12px', color: 'var(--status-danger)' }}>Delete</button>
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
              <h3 style={{ fontSize: '18px', fontWeight: 600 }}>{editing ? 'Edit' : 'New'} Nation/State</h3>
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
                  <label htmlFor="nst_name">Name *</label>
                  <input
                    id="nst_name"
                    className={styles.formControl}
                    value={form.nst_name}
                    onChange={e => setForm(f => ({ ...f, nst_name: e.target.value }))}
                    maxLength={50}
                    required
                  />
                </div>
                <div className={styles.formGroup}>
                  <label htmlFor="nst_ref_code">Ref. Code</label>
                  <input
                    id="nst_ref_code"
                    className={styles.formControl}
                    value={form.nst_ref_code}
                    onChange={e => setForm(f => ({ ...f, nst_ref_code: e.target.value.toUpperCase() }))}
                    maxLength={2}
                  />
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
