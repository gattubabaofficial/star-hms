'use client';
import React, { useState, useEffect, useRef } from 'react';
import { useRouter } from 'next/navigation';
import styles from '../../../dashboard.module.css';
import ActionBar from '../components/ActionBar';
import { Search, AlertCircle, Check } from 'lucide-react';

interface UserRole {
  UrlCode: number;
  UrlName: string;
}

interface User {
  UsrCode: number;
  UsrName: string;
  UsrUrlCode: number;
  UsrRecState: number;
  role_name?: string;
}

const API = process.env.NEXT_PUBLIC_API_URL || 'http://localhost:8000';
const getToken = () => typeof window !== 'undefined' ? localStorage.getItem('token') : '';
const authHdr = () => ({ 'Content-Type': 'application/json', Authorization: `Bearer ${getToken()}` });

const blankForm = {
  UsrName: '',
  UsrUrlCode: '',
  UsrPwd: '',
};

export default function UserMasterPage() {
  const router = useRouter();

  const [items, setItems] = useState<User[]>([]);
  const [roles, setRoles] = useState<UserRole[]>([]);
  const [search, setSearch] = useState('');
  const [selectedId, setSelectedId] = useState<number | null>(null);
  const [entryMode, setEntryMode] = useState(false);
  const [editing, setEditing] = useState<User | null>(null);

  const [form, setForm] = useState(blankForm);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');
  const [success, setSuccess] = useState('');

  const nameInputRef = useRef<HTMLInputElement>(null);
  const searchInputRef = useRef<HTMLInputElement>(null);

  const loadData = async () => {
    try {
      const [uRes, rRes] = await Promise.all([
        fetch(`${API}/api/masters/users`, { headers: authHdr() }),
        fetch(`${API}/api/masters/user-roles`, { headers: authHdr() })
      ]);

      if (rRes.ok) {
        setRoles(await rRes.json());
      }

      if (uRes.ok) {
        const data = await uRes.json();
        setItems(data);
        if (data.length > 0) {
          setSelectedId(prev => {
            const exists = data.some((item: User) => item.UsrCode === prev);
            return exists ? prev : data[0].UsrCode;
          });
        } else {
          setSelectedId(null);
        }
      }
    } catch (e) {
      console.error('Error loading user data:', e);
    }
  };

  useEffect(() => {
    loadData();
  }, []);

  useEffect(() => {
    if (entryMode && nameInputRef.current) {
      nameInputRef.current.focus();
    } else if (!entryMode && searchInputRef.current) {
      searchInputRef.current.focus();
    }
  }, [entryMode]);

  useEffect(() => {
    const handleTableKeys = (e: KeyboardEvent) => {
      if (entryMode || items.length === 0) return;

      const filtered = items.filter(i =>
        i.UsrName.toLowerCase().includes(search.toLowerCase()) ||
        (i.role_name ?? '').toLowerCase().includes(search.toLowerCase())
      );
      if (filtered.length === 0) return;

      const currentIndex = filtered.findIndex(i => i.UsrCode === selectedId);

      if (e.key === 'ArrowDown') {
        e.preventDefault();
        const nextIndex = (currentIndex + 1) % filtered.length;
        setSelectedId(filtered[nextIndex].UsrCode);
      } else if (e.key === 'ArrowUp') {
        e.preventDefault();
        const prevIndex = (currentIndex - 1 + filtered.length) % filtered.length;
        setSelectedId(filtered[prevIndex].UsrCode);
      }
    };

    window.addEventListener('keydown', handleTableKeys);
    return () => window.removeEventListener('keydown', handleTableKeys);
  }, [entryMode, items, selectedId, search]);

  const handleAdd = () => {
    setEditing(null);
    setForm(blankForm);
    setError('');
    setSuccess('');
    setEntryMode(true);
  };

  const handleEdit = () => {
    const item = items.find(i => i.UsrCode === selectedId);
    if (!item) return;
    setEditing(item);
    setForm({
      UsrName: item.UsrName,
      UsrUrlCode: item.UsrUrlCode.toString(),
      UsrPwd: '', // Leave password blank on edit unless they want to reset it
    });
    setError('');
    setSuccess('');
    setEntryMode(true);
  };

  const handleDelete = async () => {
    if (selectedId === null) return;
    const item = items.find(i => i.UsrCode === selectedId);
    if (!item || !confirm(`Delete user "${item.UsrName}"?`)) return;

    try {
      const res = await fetch(`${API}/api/masters/users/${selectedId}`, {
        method: 'DELETE',
        headers: authHdr(),
      });
      if (res.ok) {
        setSuccess('Deleted successfully');
        loadData();
      } else {
        setError('Failed to delete');
      }
    } catch (e) {
      setError('Error deleting user');
    }
  };

  const handleSave = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!form.UsrName.trim()) {
      setError('User Name is required');
      return;
    }
    if (!form.UsrUrlCode) {
      setError('User Role is required');
      return;
    }
    if (!editing && !form.UsrPwd) {
      setError('Password is required for a new user');
      return;
    }

    setLoading(true);
    setError('');
    setSuccess('');

    try {
      const payload = {
        UsrName: form.UsrName.trim(),
        UsrUrlCode: parseInt(form.UsrUrlCode),
        UsrPwd: form.UsrPwd ? form.UsrPwd : null,
        UsrRecState: 1,
      };

      const url = editing
        ? `${API}/api/masters/users/${editing.UsrCode}`
        : `${API}/api/masters/users`;

      const res = await fetch(url, {
        method: editing ? 'PUT' : 'POST',
        headers: authHdr(),
        body: JSON.stringify(payload),
      });

      if (!res.ok) {
        throw new Error(await res.text());
      }

      const saved = await res.json();
      setSuccess(editing ? 'Updated successfully' : 'Created successfully');
      await loadData();
      setSelectedId(saved.UsrCode);
      setTimeout(() => setEntryMode(false), 800);
    } catch (e: any) {
      setError(e.message || 'Error saving user');
    } finally {
      setLoading(false);
    }
  };

  const filtered = items.filter(i =>
    i.UsrName.toLowerCase().includes(search.toLowerCase()) ||
    (i.role_name ?? '').toLowerCase().includes(search.toLowerCase())
  );

  const selectedItem = items.find(i => i.UsrCode === selectedId);

  return (
    <div className={styles.container}>
      <div className={styles.header}>
        <div>
          <h1 className={styles.title}>User Master</h1>
          <p className={styles.subtitle}>Manage application users [UserMast.frm]</p>
        </div>
      </div>

      <ActionBar
        onAdd={handleAdd}
        onEdit={handleEdit}
        onDelete={handleDelete}
        onRefresh={loadData}
        onExit={() => setEntryMode(false)}
        isEditing={entryMode}
        hasSelected={selectedId !== null}
        disabledActions={['print-voucher', 'print-report', 'export-excel', 'configure']}
      />

      {error && (
        <div className={styles.errorAlert}>
          <AlertCircle size={18} />
          <span>{error}</span>
        </div>
      )}

      {success && (
        <div className={styles.successAlert}>
          <Check size={18} />
          <span>{success}</span>
        </div>
      )}

      {!entryMode ? (
        <div className={styles.listPanel} style={{ width: '100%' }}>
          <div className={styles.searchBar}>
            <Search size={18} style={{ color: 'var(--text-muted)' }} />
            <input
              ref={searchInputRef}
              value={search}
              onChange={e => setSearch(e.target.value)}
              placeholder="Search by username or role..."
            />
          </div>

          <div className={styles.tableContainer}>
            <table className={styles.table}>
              <thead>
                <tr>
                  <th style={{ width: '80px' }}>Code</th>
                  <th>User Name</th>
                  <th>Role</th>
                </tr>
              </thead>
              <tbody>
                {filtered.length === 0 ? (
                  <tr>
                    <td colSpan={3} className={styles.emptyCell}>
                      No users found
                    </td>
                  </tr>
                ) : (
                  filtered.map(item => (
                    <tr
                      key={item.UsrCode}
                      onClick={() => setSelectedId(item.UsrCode)}
                      onDoubleClick={handleEdit}
                      className={selectedId === item.UsrCode ? styles.selectedRow : ''}
                      style={{ cursor: 'pointer' }}
                    >
                      <td style={{ fontWeight: 600, color: 'var(--accent-color)' }}>
                        #{item.UsrCode}
                      </td>
                      <td style={{ fontWeight: 600 }}>{item.UsrName}</td>
                      <td>{item.role_name || 'No Role'}</td>
                    </tr>
                  ))
                )}
              </tbody>
            </table>
          </div>
        </div>
      ) : (
        /* Form view */
        <div className={styles.formContainer}>
          <h2 className={styles.formTitle}>
            {editing ? `Edit User #${editing.UsrCode}` : 'New User'}
          </h2>
          <form id="user-form" onSubmit={handleSave} className={styles.gridForm}>
            <div className={styles.formGroup}>
              <label className={styles.requiredLabel}>User Name</label>
              <input
                ref={nameInputRef}
                value={form.UsrName}
                onChange={e => setForm({ ...form, UsrName: e.target.value })}
                maxLength={50}
                required
                disabled={editing !== null} // Typically usernames are not editable
                placeholder="e.g., johndoe"
              />
            </div>

            <div className={styles.formGroup}>
              <label className={styles.requiredLabel}>User Role</label>
              <select
                value={form.UsrUrlCode}
                onChange={e => setForm({ ...form, UsrUrlCode: e.target.value })}
                required
              >
                <option value="">Select a role...</option>
                {roles.map(r => (
                  <option key={r.UrlCode} value={r.UrlCode}>
                    {r.UrlName}
                  </option>
                ))}
              </select>
            </div>

            <div className={styles.formGroup} style={{ gridColumn: 'span 2' }}>
              <label className={!editing ? styles.requiredLabel : ''}>
                Password {editing && '(Leave blank to keep existing password)'}
              </label>
              <input
                type="password"
                value={form.UsrPwd}
                onChange={e => setForm({ ...form, UsrPwd: e.target.value })}
                maxLength={50}
                required={!editing}
                placeholder={editing ? '••••••••' : 'Enter user password'}
              />
            </div>

            <div style={{ display: 'flex', justifyContent: 'flex-end', gap: '12px', marginTop: '24px', gridColumn: 'span 2' }}>
              <button type="button" className={styles.secondaryBtn} onClick={() => setEntryMode(false)}>Cancel</button>
              <button type="submit" className={styles.primaryBtn} disabled={loading}>
                {loading ? 'Saving...' : 'Save'}
              </button>
            </div>
          </form>
        </div>
      )}
    </div>
  );
}
