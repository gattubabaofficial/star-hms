'use client';
import React, { useState, useEffect } from 'react';
import styles from '../../../dashboard.module.css';
import { Plus, Search, AlertCircle, Check } from 'lucide-react';

interface Station { stn_code: number; stn_name: string; }
interface Area {
  ara_code: number;
  ara_name: string;
  ara_stn_code: number | null;
  ara_rec_state: number;
  station?: Station | null;
}

const API = process.env.NEXT_PUBLIC_API_URL || 'http://localhost:8000';
const getToken = () => typeof window !== 'undefined' ? localStorage.getItem('token') : '';
const authHdr = () => ({ 'Content-Type': 'application/json', Authorization: `Bearer ${getToken()}` });

export default function AreaPage() {
  const [items, setItems] = useState<Area[]>([]);
  const [stations, setStations] = useState<Station[]>([]);
  const [search, setSearch] = useState('');
  const [editing, setEditing] = useState<Area | null>(null);
  const [form, setForm] = useState({ ara_name: '', ara_stn_code: '' });
  const [loading, setLoading] = useState(false);
  const [showForm, setShowForm] = useState(false);
  const [error, setError] = useState('');
  const [success, setSuccess] = useState('');

  const load = async () => {
    try {
      const [ar, st] = await Promise.all([
        fetch(`${API}/api/masters/areas`).then(r => r.json()),
        fetch(`${API}/api/masters/stations`).then(r => r.json()),
      ]);
      setItems(ar);
      setStations(st);
    } catch (e) {
      console.error('Error loading areas data:', e);
    }
  };

  useEffect(() => {
    load();
  }, []);

  const openNew = () => {
    setEditing(null);
    setForm({ ara_name: '', ara_stn_code: '' });
    setError('');
    setSuccess('');
    setShowForm(true);
  };

  const openEdit = (i: Area) => {
    setEditing(i);
    setForm({ ara_name: i.ara_name, ara_stn_code: i.ara_stn_code?.toString() ?? '' });
    setError('');
    setSuccess('');
    setShowForm(true);
  };

  const save = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!form.ara_name.trim()) {
      setError('Area Name is required');
      return;
    }
    setLoading(true);
    setError('');
    setSuccess('');
    try {
      const body = {
        ara_name: form.ara_name,
        ara_stn_code: form.ara_stn_code ? parseInt(form.ara_stn_code) : null,
        ara_rec_state: 1
      };
      const url = editing ? `${API}/api/masters/areas/${editing.ara_code}` : `${API}/api/masters/areas`;
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
    if (!confirm('Delete this area?')) return;
    try {
      const r = await fetch(`${API}/api/masters/areas/${code}`, {
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
    i.ara_name.toLowerCase().includes(search.toLowerCase())
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
            placeholder="Search areas…"
          />
        </div>
        <button onClick={openNew} className={styles.primaryBtn}>
          <Plus size={18} />
          <span>Add Area</span>
        </button>
      </div>

      {/* Table */}
      <div className={styles.tableContainer}>
        <table className={styles.table}>
          <thead>
            <tr>
              <th style={{ width: '60px' }}>#</th>
              <th>Area Name</th>
              <th>Station</th>
              <th style={{ textAlign: 'right', width: '200px' }}>Actions</th>
            </tr>
          </thead>
          <tbody>
            {filtered.length === 0 && (
              <tr>
                <td colSpan={4} style={{ textAlign: 'center', padding: '40px', color: 'var(--text-secondary)' }}>No areas found</td>
              </tr>
            )}
            {filtered.map((item, idx) => (
              <tr key={item.ara_code}>
                <td style={{ fontWeight: 600, color: 'var(--accent-color)' }}>#{item.ara_code}</td>
                <td style={{ fontWeight: 600 }}>{item.ara_name}</td>
                <td>{item.station?.stn_name ?? '—'}</td>
                <td style={{ textAlign: 'right' }}>
                  <button onClick={() => openEdit(item)} className={styles.secondaryBtn} style={{ display: 'inline-flex', padding: '6px 12px', marginRight: '8px' }}>Edit</button>
                  <button onClick={() => del(item.ara_code)} className={styles.secondaryBtn} style={{ display: 'inline-flex', padding: '6px 12px', color: 'var(--status-danger)' }}>Delete</button>
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
              <h3 style={{ fontSize: '18px', fontWeight: 600 }}>{editing ? 'Edit' : 'New'} Area</h3>
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
                  <label htmlFor="ara_name">Area Name *</label>
                  <input
                    id="ara_name"
                    className={styles.formControl}
                    value={form.ara_name}
                    onChange={e => setForm(f => ({ ...f, ara_name: e.target.value }))}
                    maxLength={50}
                    required
                  />
                </div>
                <div className={styles.formGroup}>
                  <label htmlFor="ara_stn_code">Station</label>
                  <select
                    id="ara_stn_code"
                    className={styles.formControl}
                    value={form.ara_stn_code}
                    onChange={e => setForm(f => ({ ...f, ara_stn_code: e.target.value }))}
                  >
                    <option value="">— Select Station —</option>
                    {stations.map(s => <option key={s.stn_code} value={s.stn_code}>{s.stn_name}</option>)}
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
