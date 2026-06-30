'use client';
import React, { useState, useEffect } from 'react';
import styles from '../../../dashboard.module.css';
import { Plus, Search, AlertCircle, Check } from 'lucide-react';

interface PartyGroup {
  pgm_code: number;
  pgm_name: string;
  pgm_desc?: string;
  pgm_rec_state: number;
}

const API = process.env.NEXT_PUBLIC_API_URL || 'http://localhost:8000';
const getToken = () => typeof window !== 'undefined' ? localStorage.getItem('token') : '';
const authHdr = () => ({ 'Content-Type': 'application/json', Authorization: `Bearer ${getToken()}` });

export default function PartyGroupPage() {
  const [items, setItems] = useState<PartyGroup[]>([]);
  const [search, setSearch] = useState('');
  const [editing, setEditing] = useState<PartyGroup | null>(null);
  const [form, setForm] = useState({ pgm_name: '', pgm_desc: '' });
  const [loading, setLoading] = useState(false);
  const [showForm, setShowForm] = useState(false);
  const [error, setError] = useState('');
  const [success, setSuccess] = useState('');

  const load = async () => {
    try {
      const r = await fetch(`${API}/api/masters/party-groups`);
      if (r.ok) {
        setItems(await r.json());
      }
    } catch (e) {
      console.error('Error loading party groups:', e);
    }
  };

  useEffect(() => {
    load();
  }, []);

  const openNew = () => {
    setEditing(null);
    setForm({ pgm_name: '', pgm_desc: '' });
    setError('');
    setSuccess('');
    setShowForm(true);
  };

  const openEdit = (i: PartyGroup) => {
    setEditing(i);
    setForm({ pgm_name: i.pgm_name, pgm_desc: i.pgm_desc || '' });
    setError('');
    setSuccess('');
    setShowForm(true);
  };

  const save = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!form.pgm_name.trim()) {
      setError('Group Name is required');
      return;
    }
    setLoading(true);
    setError('');
    setSuccess('');
    try {
      const url = editing
        ? `${API}/api/masters/party-groups/${editing.pgm_code}`
        : `${API}/api/masters/party-groups`;
      const method = editing ? 'PUT' : 'POST';
      const r = await fetch(url, {
        method,
        headers: authHdr(),
        body: JSON.stringify({ pgm_name: form.pgm_name, pgm_desc: form.pgm_desc || null, pgm_rec_state: 1 })
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
    if (!confirm('Delete this supplier group?')) return;
    try {
      const r = await fetch(`${API}/api/masters/party-groups/${code}`, {
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
    i.pgm_name.toLowerCase().includes(search.toLowerCase())
  );

  return (
    <div>
      {/* Search Toolbar */}
      <div className={styles.toolbar}>
        <div className={styles.searchBar}>
          <Search size={18} style={{ color: 'var(--text-muted)' }} />
          <input
            value={search}
            onChange={e => setSearch(e.target.value)}
            placeholder="Search groups…"
          />
        </div>
        <button onClick={openNew} className={styles.primaryBtn}>
          <Plus size={18} />
          <span>Add Supplier Group</span>
        </button>
      </div>

      {/* Table */}
      <div className={styles.tableContainer}>
        <table className={styles.table}>
          <thead>
            <tr>
              <th style={{ width: '60px' }}>#</th>
              <th>Group Name</th>
              <th>Description</th>
              <th style={{ textAlign: 'right', width: '200px' }}>Actions</th>
            </tr>
          </thead>
          <tbody>
            {filtered.length === 0 && (
              <tr>
                <td colSpan={4} style={{ textAlign: 'center', padding: '40px', color: 'var(--text-secondary)' }}>No supplier groups found</td>
              </tr>
            )}
            {filtered.map((item, idx) => (
              <tr key={item.pgm_code}>
                <td style={{ fontWeight: 600, color: 'var(--accent-color)' }}>#{item.pgm_code}</td>
                <td style={{ fontWeight: 600 }}>{item.pgm_name}</td>
                <td>{item.pgm_desc || '—'}</td>
                <td style={{ textAlign: 'right' }}>
                  <button onClick={() => openEdit(item)} className={styles.secondaryBtn} style={{ display: 'inline-flex', padding: '6px 12px', marginRight: '8px' }}>Edit</button>
                  <button onClick={() => del(item.pgm_code)} className={styles.secondaryBtn} style={{ display: 'inline-flex', padding: '6px 12px', color: 'var(--status-danger)' }}>Delete</button>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>

      {/* Modal */}
      {showForm && (
        <div className={styles.modalOverlay}>
          <div className={styles.modalContent} style={{ maxWidth: '450px' }}>
            <div className={styles.modalHeader}>
              <h3 style={{ fontSize: '18px', fontWeight: 600 }}>{editing ? 'Edit' : 'New'} Supplier Group</h3>
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
                  <label htmlFor="pgm_name">Group Name *</label>
                  <input
                    id="pgm_name"
                    className={styles.formControl}
                    value={form.pgm_name}
                    onChange={e => setForm(f => ({ ...f, pgm_name: e.target.value }))}
                    maxLength={50}
                    required
                  />
                </div>
                <div className={styles.formGroup}>
                  <label htmlFor="pgm_desc">Description</label>
                  <input
                    id="pgm_desc"
                    className={styles.formControl}
                    value={form.pgm_desc}
                    onChange={e => setForm(f => ({ ...f, pgm_desc: e.target.value }))}
                    maxLength={50}
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
