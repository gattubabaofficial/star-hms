'use client';
import React, { useState, useEffect, useRef } from 'react';
import { useRouter } from 'next/navigation';
import styles from '../../../dashboard.module.css';
import ActionBar from '../components/ActionBar';
import { Search, AlertCircle, Check } from 'lucide-react';

interface User {
  UsrCode: number;
  UsrName: string;
}

interface UserRole {
  UrlCode: number;
  UrlName: string;
}

interface UserRight {
  UhtCode: number;
  UhtUsrCode?: number;
  UhtUrlCode?: number;
  UhtSecuOptName: string;
  UhtCanAdd: boolean;
  UhtCanEdit: boolean;
  UhtCanDelete: boolean;
  UhtCanView: boolean;
  UhtRemark?: string;
  UhtRecState: number;
  user_name?: string;
  role_name?: string;
}

const API = process.env.NEXT_PUBLIC_API_URL || 'http://localhost:8000';
const getToken = () => typeof window !== 'undefined' ? localStorage.getItem('token') : '';
const authHdr = () => ({ 'Content-Type': 'application/json', Authorization: `Bearer ${getToken()}` });

const modules = [
  'Dashboard',
  'Reception',
  'OPD',
  'IPD',
  'Laboratory',
  'Pharmacy',
  'Inventory',
  'Masters',
  'Reports',
  'Security',
  'Payroll',
  'System',
];

const blankForm = {
  UhtUsrCode: '',
  UhtUrlCode: '',
  UhtSecuOptName: '',
  UhtCanAdd: false,
  UhtCanEdit: false,
  UhtCanDelete: false,
  UhtCanView: true,
  UhtRemark: '',
};

export default function UserRightMasterPage() {
  const router = useRouter();

  const [items, setItems] = useState<UserRight[]>([]);
  const [users, setUsers] = useState<User[]>([]);
  const [roles, setRoles] = useState<UserRole[]>([]);
  const [search, setSearch] = useState('');
  const [selectedId, setSelectedId] = useState<number | null>(null);
  const [entryMode, setEntryMode] = useState(false);
  const [editing, setEditing] = useState<UserRight | null>(null);

  const [form, setForm] = useState(blankForm);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');
  const [success, setSuccess] = useState('');

  const searchInputRef = useRef<HTMLInputElement>(null);

  const loadData = async () => {
    try {
      const [urRes, uRes, rRes] = await Promise.all([
        fetch(`${API}/api/masters/user-rights`, { headers: authHdr() }),
        fetch(`${API}/api/masters/users`, { headers: authHdr() }),
        fetch(`${API}/api/masters/user-roles`, { headers: authHdr() })
      ]);

      if (uRes.ok) setUsers(await uRes.json());
      if (rRes.ok) setRoles(await rRes.json());

      if (urRes.ok) {
        const data = await urRes.json();
        setItems(data);
        if (data.length > 0) {
          setSelectedId(prev => {
            const exists = data.some((item: UserRight) => item.UhtCode === prev);
            return exists ? prev : data[0].UhtCode;
          });
        } else {
          setSelectedId(null);
        }
      }
    } catch (e) {
      console.error('Error loading user right data:', e);
    }
  };

  useEffect(() => {
    loadData();
  }, []);

  useEffect(() => {
    if (!entryMode && searchInputRef.current) {
      searchInputRef.current.focus();
    }
  }, [entryMode]);

  useEffect(() => {
    const handleTableKeys = (e: KeyboardEvent) => {
      if (entryMode || items.length === 0) return;

      const filtered = items.filter(i =>
        i.UhtSecuOptName.toLowerCase().includes(search.toLowerCase()) ||
        (i.user_name ?? '').toLowerCase().includes(search.toLowerCase()) ||
        (i.role_name ?? '').toLowerCase().includes(search.toLowerCase())
      );
      if (filtered.length === 0) return;

      const currentIndex = filtered.findIndex(i => i.UhtCode === selectedId);

      if (e.key === 'ArrowDown') {
        e.preventDefault();
        const nextIndex = (currentIndex + 1) % filtered.length;
        setSelectedId(filtered[nextIndex].UhtCode);
      } else if (e.key === 'ArrowUp') {
        e.preventDefault();
        const prevIndex = (currentIndex - 1 + filtered.length) % filtered.length;
        setSelectedId(filtered[prevIndex].UhtCode);
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
    const item = items.find(i => i.UhtCode === selectedId);
    if (!item) return;
    setEditing(item);
    setForm({
      UhtUsrCode: item.UhtUsrCode?.toString() ?? '',
      UhtUrlCode: item.UhtUrlCode?.toString() ?? '',
      UhtSecuOptName: item.UhtSecuOptName,
      UhtCanAdd: item.UhtCanAdd,
      UhtCanEdit: item.UhtCanEdit,
      UhtCanDelete: item.UhtCanDelete,
      UhtCanView: item.UhtCanView,
      UhtRemark: item.UhtRemark ?? '',
    });
    setError('');
    setSuccess('');
    setEntryMode(true);
  };

  const handleDelete = async () => {
    if (selectedId === null) return;
    const item = items.find(i => i.UhtCode === selectedId);
    if (!item || !confirm(`Delete permission right for "${item.UhtSecuOptName}"?`)) return;

    try {
      const res = await fetch(`${API}/api/masters/user-rights/${selectedId}`, {
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
      setError('Error deleting user right');
    }
  };

  const handleSave = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!form.UhtSecuOptName) {
      setError('Security Option Name is required');
      return;
    }
    if (!form.UhtUsrCode && !form.UhtUrlCode) {
      setError('Either User or Role must be selected');
      return;
    }

    setLoading(true);
    setError('');
    setSuccess('');

    try {
      const payload = {
        UhtUsrCode: form.UhtUsrCode ? parseInt(form.UhtUsrCode) : null,
        UhtUrlCode: form.UhtUrlCode ? parseInt(form.UhtUrlCode) : null,
        UhtSecuOptName: form.UhtSecuOptName,
        UhtCanAdd: form.UhtCanAdd,
        UhtCanEdit: form.UhtCanEdit,
        UhtCanDelete: form.UhtCanDelete,
        UhtCanView: form.UhtCanView,
        UhtRemark: form.UhtRemark.trim() || null,
        UhtRecState: 1,
      };

      const url = editing
        ? `${API}/api/masters/user-rights/${editing.UhtCode}`
        : `${API}/api/masters/user-rights`;

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
      setSelectedId(saved.UhtCode);
      setTimeout(() => setEntryMode(false), 800);
    } catch (e: any) {
      setError(e.message || 'Error saving user right');
    } finally {
      setLoading(false);
    }
  };

  const filtered = items.filter(i =>
    i.UhtSecuOptName.toLowerCase().includes(search.toLowerCase()) ||
    (i.user_name ?? '').toLowerCase().includes(search.toLowerCase()) ||
    (i.role_name ?? '').toLowerCase().includes(search.toLowerCase())
  );

  const selectedItem = items.find(i => i.UhtCode === selectedId);

  return (
    <div className={styles.container}>
      <div className={styles.header}>
        <div>
          <h1 className={styles.title}>User Right Master</h1>
          <p className={styles.subtitle}>Configure user and role module authorizations [UsrRhtMs.frm]</p>
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
              placeholder="Search by module, user, or role..."
            />
          </div>

          <div className={styles.tableContainer}>
            <table className={styles.table}>
              <thead>
                <tr>
                  <th>Module / Option</th>
                  <th>User / Role Assignment</th>
                  <th style={{ width: '120px', textAlign: 'center' }}>Permissions</th>
                </tr>
              </thead>
              <tbody>
                {filtered.length === 0 ? (
                  <tr>
                    <td colSpan={3} className={styles.emptyCell}>
                      No user rights defined
                    </td>
                  </tr>
                ) : (
                  filtered.map(item => (
                    <tr
                      key={item.UhtCode}
                      onClick={() => setSelectedId(item.UhtCode)}
                      onDoubleClick={handleEdit}
                      className={selectedId === item.UhtCode ? styles.selectedRow : ''}
                      style={{ cursor: 'pointer' }}
                    >
                      <td style={{ fontWeight: 600 }}>{item.UhtSecuOptName}</td>
                      <td>
                        {item.user_name ? (
                          <span className={`${styles.badge} ${styles.badgeSuccess}`}>User: {item.user_name}</span>
                        ) : item.role_name ? (
                          <span className={`${styles.badge} ${styles.badgeDanger}`}>Role: {item.role_name}</span>
                        ) : (
                          'None'
                        )}
                      </td>
                      <td style={{ textAlign: 'center' }}>
                        <span style={{ fontSize: '0.8rem', display: 'flex', gap: '4px', justifyContent: 'center' }}>
                          {item.UhtCanView && <span style={{ color: 'var(--status-success)' }} title="View">V</span>}
                          {item.UhtCanAdd && <span style={{ color: 'var(--accent-color)' }} title="Add">A</span>}
                          {item.UhtCanEdit && <span style={{ color: 'var(--status-warning)' }} title="Edit">E</span>}
                          {item.UhtCanDelete && <span style={{ color: 'var(--status-danger)' }} title="Delete">D</span>}
                        </span>
                      </td>
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
            {editing ? `Edit Permissions #${editing.UhtCode}` : 'New Permissions Assignment'}
          </h2>
          <form id="user-right-form" onSubmit={handleSave} className={styles.gridForm}>
            <div className={styles.formGroup}>
              <label className={styles.requiredLabel}>Security Option (Module)</label>
              <select
                value={form.UhtSecuOptName}
                onChange={e => setForm({ ...form, UhtSecuOptName: e.target.value })}
                required
              >
                <option value="">Select a module...</option>
                {modules.map(mod => (
                  <option key={mod} value={mod}>
                    {mod}
                  </option>
                ))}
              </select>
            </div>

            <div className={styles.formGroup}>
              <label>Assign to User (Optional)</label>
              <select
                value={form.UhtUsrCode}
                onChange={e => setForm({ ...form, UhtUsrCode: e.target.value, UhtUrlCode: e.target.value ? '' : form.UhtUrlCode })}
              >
                <option value="">Select a user...</option>
                {users.map(u => (
                  <option key={u.UsrCode} value={u.UsrCode}>
                    {u.UsrName}
                  </option>
                ))}
              </select>
            </div>

            <div className={styles.formGroup}>
              <label>Assign to Role (Optional)</label>
              <select
                value={form.UhtUrlCode}
                onChange={e => setForm({ ...form, UhtUrlCode: e.target.value, UhtUsrCode: e.target.value ? '' : form.UhtUsrCode })}
              >
                <option value="">Select a role...</option>
                {roles.map(r => (
                  <option key={r.UrlCode} value={r.UrlCode}>
                    {r.UrlName}
                  </option>
                ))}
              </select>
            </div>

            <div className={styles.formGroup}>
              <label>Remark</label>
              <input
                value={form.UhtRemark}
                onChange={e => setForm({ ...form, UhtRemark: e.target.value })}
                placeholder="Add audit or assignment remark"
              />
            </div>

            <div className={styles.formGroup} style={{ gridColumn: 'span 2' }}>
              <label>Rights / Permissions</label>
              <div style={{ display: 'flex', gap: '24px', marginTop: '8px' }}>
                <label style={{ display: 'flex', alignItems: 'center', gap: '8px', cursor: 'pointer' }}>
                  <input
                    type="checkbox"
                    checked={form.UhtCanView}
                    onChange={e => setForm({ ...form, UhtCanView: e.target.checked })}
                    style={{ width: '18px', height: '18px', cursor: 'pointer' }}
                  />
                  <span>Can View</span>
                </label>
                <label style={{ display: 'flex', alignItems: 'center', gap: '8px', cursor: 'pointer' }}>
                  <input
                    type="checkbox"
                    checked={form.UhtCanAdd}
                    onChange={e => setForm({ ...form, UhtCanAdd: e.target.checked })}
                    style={{ width: '18px', height: '18px', cursor: 'pointer' }}
                  />
                  <span>Can Add</span>
                </label>
                <label style={{ display: 'flex', alignItems: 'center', gap: '8px', cursor: 'pointer' }}>
                  <input
                    type="checkbox"
                    checked={form.UhtCanEdit}
                    onChange={e => setForm({ ...form, UhtCanEdit: e.target.checked })}
                    style={{ width: '18px', height: '18px', cursor: 'pointer' }}
                  />
                  <span>Can Edit</span>
                </label>
                <label style={{ display: 'flex', alignItems: 'center', gap: '8px', cursor: 'pointer' }}>
                  <input
                    type="checkbox"
                    checked={form.UhtCanDelete}
                    onChange={e => setForm({ ...form, UhtCanDelete: e.target.checked })}
                    style={{ width: '18px', height: '18px', cursor: 'pointer' }}
                  />
                  <span>Can Delete</span>
                </label>
              </div>
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
