'use client';
import React, { useState, useEffect } from 'react';
import styles from '../../../dashboard.module.css';
import { Plus, Search, AlertCircle, Check } from 'lucide-react';

interface VoucherType {
  vtm_code: number;
  vtm_name: string | null;
  vtm_abvr: string | null;
  vtm_prefix: string | null;
  vtm_postfix: string | null;
  vtm_editable: boolean;
  vtm_show_in_list: boolean;
  vtm_rec_state: number;
}

const API = process.env.NEXT_PUBLIC_API_URL || 'http://localhost:8000';
const getToken = () => typeof window !== 'undefined' ? localStorage.getItem('token') : '';
const authHdr = () => ({ 'Content-Type': 'application/json', Authorization: `Bearer ${getToken()}` });

const emptyForm = { vtm_name: '', vtm_abvr: '', vtm_prefix: '', vtm_postfix: '', vtm_editable: true, vtm_show_in_list: true };

export default function VoucherTypePage() {
  const [items, setItems] = useState<VoucherType[]>([]);
  const [search, setSearch] = useState('');
  const [editing, setEditing] = useState<VoucherType | null>(null);
  const [form, setForm] = useState(emptyForm);
  const [loading, setLoading] = useState(false);
  const [showForm, setShowForm] = useState(false);
  const [error, setError] = useState('');
  const [success, setSuccess] = useState('');

  const load = async () => {
    try {
      const r = await fetch(`${API}/api/accounts/voucher-types`);
      setItems(await r.json());
    } catch (e) {
      console.error('Error loading voucher types data:', e);
    }
  };

  useEffect(() => {
    load();
  }, []);

  const openNew = () => {
    setEditing(null);
    setForm(emptyForm);
    setError('');
    setSuccess('');
    setShowForm(true);
  };

  const openEdit = (i: VoucherType) => {
    setEditing(i);
    setForm({
      vtm_name: i.vtm_name ?? '',
      vtm_abvr: i.vtm_abvr ?? '',
      vtm_prefix: i.vtm_prefix ?? '',
      vtm_postfix: i.vtm_postfix ?? '',
      vtm_editable: i.vtm_editable,
      vtm_show_in_list: i.vtm_show_in_list,
    });
    setError('');
    setSuccess('');
    setShowForm(true);
  };

  const save = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!form.vtm_name.trim()) {
      setError('Voucher Type Name is required');
      return;
    }
    setLoading(true);
    setError('');
    setSuccess('');
    try {
      const body = { ...form, vtm_rec_state: 1 };
      const url = editing ? `${API}/api/accounts/voucher-types/${editing.vtm_code}` : `${API}/api/accounts/voucher-types`;
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
    if (!confirm('Delete this voucher type?')) return;
    try {
      const r = await fetch(`${API}/api/accounts/voucher-types/${code}`, {
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
    (i.vtm_name ?? '').toLowerCase().includes(search.toLowerCase())
  );

  return (
    <div>
      <div className={styles.toolbar}>
        <div className={styles.searchBar}>
          <Search size={18} style={{ color: 'var(--text-muted)' }} />
          <input
            value={search}
            onChange={e => setSearch(e.target.value)}
            placeholder="Search voucher types…"
          />
        </div>
        <button onClick={openNew} className={styles.primaryBtn}>
          <Plus size={18} />
          <span>Add Voucher Type</span>
        </button>
      </div>

      <div className={styles.tableContainer}>
        <table className={styles.table}>
          <thead>
            <tr>
              <th style={{ width: '60px' }}>#</th>
              <th>Name</th>
              <th>Abbr.</th>
              <th>Prefix</th>
              <th>Postfix</th>
              <th>Show In List</th>
              <th style={{ textAlign: 'right', width: '200px' }}>Actions</th>
            </tr>
          </thead>
          <tbody>
            {filtered.length === 0 && (
              <tr>
                <td colSpan={7} style={{ textAlign: 'center', padding: '40px', color: 'var(--text-secondary)' }}>No voucher types found</td>
              </tr>
            )}
            {filtered.map((item) => (
              <tr key={item.vtm_code}>
                <td style={{ fontWeight: 600, color: 'var(--accent-color)' }}>#{item.vtm_code}</td>
                <td style={{ fontWeight: 600 }}>{item.vtm_name}</td>
                <td>{item.vtm_abvr ?? '—'}</td>
                <td>{item.vtm_prefix ?? '—'}</td>
                <td>{item.vtm_postfix ?? '—'}</td>
                <td>{item.vtm_show_in_list ? 'Yes' : 'No'}</td>
                <td style={{ textAlign: 'right' }}>
                  <button onClick={() => openEdit(item)} className={styles.secondaryBtn} style={{ display: 'inline-flex', padding: '6px 12px', marginRight: '8px' }}>Edit</button>
                  <button onClick={() => del(item.vtm_code)} className={styles.secondaryBtn} style={{ display: 'inline-flex', padding: '6px 12px', color: 'var(--status-danger)' }}>Delete</button>
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
              <h3 style={{ fontSize: '18px', fontWeight: 600 }}>{editing ? 'Edit' : 'New'} Voucher Type</h3>
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
                  <label htmlFor="vtm_name">Voucher Type Name *</label>
                  <input
                    id="vtm_name"
                    className={styles.formControl}
                    value={form.vtm_name}
                    onChange={e => setForm(f => ({ ...f, vtm_name: e.target.value }))}
                    maxLength={50}
                    required
                  />
                </div>
                <div className={styles.formGroup}>
                  <label htmlFor="vtm_abvr">Abbreviation</label>
                  <input
                    id="vtm_abvr"
                    className={styles.formControl}
                    value={form.vtm_abvr}
                    onChange={e => setForm(f => ({ ...f, vtm_abvr: e.target.value }))}
                    maxLength={10}
                  />
                </div>
                <div style={{ display: 'flex', gap: '12px' }}>
                  <div className={styles.formGroup} style={{ flex: 1 }}>
                    <label htmlFor="vtm_prefix">Prefix</label>
                    <input
                      id="vtm_prefix"
                      className={styles.formControl}
                      value={form.vtm_prefix}
                      onChange={e => setForm(f => ({ ...f, vtm_prefix: e.target.value }))}
                      maxLength={10}
                    />
                  </div>
                  <div className={styles.formGroup} style={{ flex: 1 }}>
                    <label htmlFor="vtm_postfix">Postfix</label>
                    <input
                      id="vtm_postfix"
                      className={styles.formControl}
                      value={form.vtm_postfix}
                      onChange={e => setForm(f => ({ ...f, vtm_postfix: e.target.value }))}
                      maxLength={10}
                    />
                  </div>
                </div>
                <div className={styles.formGroup} style={{ display: 'flex', alignItems: 'center', gap: '8px' }}>
                  <input
                    id="vtm_editable"
                    type="checkbox"
                    checked={form.vtm_editable}
                    onChange={e => setForm(f => ({ ...f, vtm_editable: e.target.checked }))}
                  />
                  <label htmlFor="vtm_editable" style={{ margin: 0 }}>Editable</label>
                </div>
                <div className={styles.formGroup} style={{ display: 'flex', alignItems: 'center', gap: '8px' }}>
                  <input
                    id="vtm_show_in_list"
                    type="checkbox"
                    checked={form.vtm_show_in_list}
                    onChange={e => setForm(f => ({ ...f, vtm_show_in_list: e.target.checked }))}
                  />
                  <label htmlFor="vtm_show_in_list" style={{ margin: 0 }}>Show In List</label>
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
