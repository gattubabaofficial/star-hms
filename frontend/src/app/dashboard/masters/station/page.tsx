'use client';
import React, { useState, useEffect } from 'react';
import styles from '../../../dashboard.module.css';
import { Plus, Search, AlertCircle, Check } from 'lucide-react';

interface Station {
  stn_code: number;
  stn_name: string;
  stn_show_in_list: boolean;
  stn_rec_state: number;
}

const API = process.env.NEXT_PUBLIC_API_URL || 'http://localhost:8000';
const getToken = () => typeof window !== 'undefined' ? localStorage.getItem('token') : '';
const authHdr = () => ({ 'Content-Type': 'application/json', Authorization: `Bearer ${getToken()}` });

export default function StationPage() {
  const [items, setItems] = useState<Station[]>([]);
  const [search, setSearch] = useState('');
  const [editing, setEditing] = useState<Station | null>(null);
  const [form, setForm] = useState({ stn_name: '', stn_show_in_list: true });
  const [loading, setLoading] = useState(false);
  const [showForm, setShowForm] = useState(false);
  const [error, setError] = useState('');
  const [success, setSuccess] = useState('');

  const load = async () => {
    try {
      const r = await fetch(`${API}/api/masters/stations`);
      if (r.ok) {
        setItems(await r.json());
      }
    } catch (e) {
      console.error('Error loading stations:', e);
    }
  };

  useEffect(() => {
    load();
  }, []);

  const openNew = () => {
    setEditing(null);
    setForm({ stn_name: '', stn_show_in_list: true });
    setError('');
    setSuccess('');
    setShowForm(true);
  };

  const openEdit = (i: Station) => {
    setEditing(i);
    setForm({ stn_name: i.stn_name, stn_show_in_list: i.stn_show_in_list });
    setError('');
    setSuccess('');
    setShowForm(true);
  };

  const save = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!form.stn_name.trim()) {
      setError('Station Name is required');
      return;
    }
    setLoading(true);
    setError('');
    setSuccess('');
    try {
      const url = editing ? `${API}/api/masters/stations/${editing.stn_code}` : `${API}/api/masters/stations`;
      const r = await fetch(url, {
        method: editing ? 'PUT' : 'POST',
        headers: authHdr(),
        body: JSON.stringify({ ...form, stn_rec_state: 1 })
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
    if (!confirm('Delete this station?')) return;
    try {
      const r = await fetch(`${API}/api/masters/stations/${code}`, {
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
    i.stn_name.toLowerCase().includes(search.toLowerCase())
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
            placeholder="Search stations…"
          />
        </div>
        <button onClick={openNew} className={styles.primaryBtn}>
          <Plus size={18} />
          <span>Add Station</span>
        </button>
      </div>

      {/* Table */}
      <div className={styles.tableContainer}>
        <table className={styles.table}>
          <thead>
            <tr>
              <th style={{ width: '60px' }}>#</th>
              <th>Station Name</th>
              <th>Show In List</th>
              <th style={{ textAlign: 'right', width: '200px' }}>Actions</th>
            </tr>
          </thead>
          <tbody>
            {filtered.length === 0 && (
              <tr>
                <td colSpan={4} style={{ textAlign: 'center', padding: '40px', color: 'var(--text-secondary)' }}>No stations found</td>
              </tr>
            )}
            {filtered.map((item, idx) => (
              <tr key={item.stn_code}>
                <td style={{ fontWeight: 600, color: 'var(--accent-color)' }}>#{item.stn_code}</td>
                <td style={{ fontWeight: 600 }}>{item.stn_name}</td>
                <td>
                  <span className={`${styles.badge} ${item.stn_show_in_list ? styles.badgeSuccess : styles.badgeDanger}`}>
                    {item.stn_show_in_list ? 'Yes' : 'No'}
                  </span>
                </td>
                <td style={{ textAlign: 'right' }}>
                  <button onClick={() => openEdit(item)} className={styles.secondaryBtn} style={{ display: 'inline-flex', padding: '6px 12px', marginRight: '8px' }}>Edit</button>
                  <button onClick={() => del(item.stn_code)} className={styles.secondaryBtn} style={{ display: 'inline-flex', padding: '6px 12px', color: 'var(--status-danger)' }}>Delete</button>
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
              <h3 style={{ fontSize: '18px', fontWeight: 600 }}>{editing ? 'Edit' : 'New'} Station</h3>
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
                  <label htmlFor="stn_name">Station Name *</label>
                  <input
                    id="stn_name"
                    className={styles.formControl}
                    value={form.stn_name}
                    onChange={e => setForm(f => ({ ...f, stn_name: e.target.value }))}
                    maxLength={50}
                    required
                  />
                </div>
                <div className={styles.formGroup} style={{ marginTop: '15px' }}>
                  <label style={{ display: 'flex', alignItems: 'center', gap: '8px', cursor: 'pointer', fontSize: '13px', fontWeight: 600 }}>
                    <input
                      type="checkbox"
                      checked={form.stn_show_in_list}
                      onChange={e => setForm(f => ({ ...f, stn_show_in_list: e.target.checked }))}
                    />
                    Show In List
                  </label>
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
