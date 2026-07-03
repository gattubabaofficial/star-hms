'use client';
import React, { useState, useEffect, useRef } from 'react';
import { useRouter } from 'next/navigation';
import styles from '../../../dashboard.module.css';
import ActionBar from '../components/ActionBar';
import { Search, AlertCircle, Check } from 'lucide-react';

interface TestMethod {
  TmhCode: number;
  TmhName: string;
  TmhShowInList: boolean;
  TmhRecState: number;
  TmhIndex: number;
}

const API = process.env.NEXT_PUBLIC_API_URL || 'http://localhost:8000';
const getToken = () => typeof window !== 'undefined' ? localStorage.getItem('token') : '';
const authHdr = () => ({ 'Content-Type': 'application/json', Authorization: `Bearer ${getToken()}` });

const blankForm = {
  TmhName: '',
  TmhIndex: 0,
  TmhShowInList: true,
};

export default function LabTestMethodPage() {
  const router = useRouter();

  const [items, setItems] = useState<TestMethod[]>([]);
  const [search, setSearch] = useState('');
  const [selectedId, setSelectedId] = useState<number | null>(null);
  const [entryMode, setEntryMode] = useState(false);
  const [editing, setEditing] = useState<TestMethod | null>(null);

  const [form, setForm] = useState(blankForm);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');
  const [success, setSuccess] = useState('');

  const nameInputRef = useRef<HTMLInputElement>(null);
  const searchInputRef = useRef<HTMLInputElement>(null);

  const loadData = async () => {
    try {
      const res = await fetch(`${API}/api/masters/pathology/test-methods`, {
        headers: authHdr(),
      });
      if (res.ok) {
        const data = await res.json();
        setItems(data);
        if (data.length > 0) {
          setSelectedId(prev => {
            const exists = data.some((item: TestMethod) => item.TmhCode === prev);
            return exists ? prev : data[0].TmhCode;
          });
        } else {
          setSelectedId(null);
        }
      }
    } catch (e) {
      console.error('Error loading test methods:', e);
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
        i.TmhName.toLowerCase().includes(search.toLowerCase())
      );
      if (filtered.length === 0) return;

      const currentIndex = filtered.findIndex(i => i.TmhCode === selectedId);

      if (e.key === 'ArrowDown') {
        e.preventDefault();
        const nextIndex = (currentIndex + 1) % filtered.length;
        setSelectedId(filtered[nextIndex].TmhCode);
      } else if (e.key === 'ArrowUp') {
        e.preventDefault();
        const prevIndex = (currentIndex - 1 + filtered.length) % filtered.length;
        setSelectedId(filtered[prevIndex].TmhCode);
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
    const item = items.find(i => i.TmhCode === selectedId);
    if (!item) return;
    setEditing(item);
    setForm({
      TmhName: item.TmhName,
      TmhIndex: item.TmhIndex,
      TmhShowInList: item.TmhShowInList,
    });
    setError('');
    setSuccess('');
    setEntryMode(true);
  };

  const handleDelete = async () => {
    if (selectedId === null) return;
    const item = items.find(i => i.TmhCode === selectedId);
    if (!item || !confirm(`Delete test method "${item.TmhName}"?`)) return;

    try {
      const res = await fetch(`${API}/api/masters/pathology/test-methods/${selectedId}`, {
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
      setError('Error deleting test method');
    }
  };

  const handleSave = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!form.TmhName.trim()) {
      setError('Method Name is required');
      return;
    }

    setLoading(true);
    setError('');
    setSuccess('');

    try {
      const payload = {
        TmhName: form.TmhName.trim(),
        TmhIndex: Number(form.TmhIndex),
        TmhShowInList: Boolean(form.TmhShowInList),
        TmhRecState: 1,
      };

      const url = editing
        ? `${API}/api/masters/pathology/test-methods/${editing.TmhCode}`
        : `${API}/api/masters/pathology/test-methods`;

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
      setSelectedId(saved.TmhCode);
      setTimeout(() => setEntryMode(false), 800);
    } catch (e: any) {
      setError(e.message || 'Error saving test method');
    } finally {
      setLoading(false);
    }
  };

  const filtered = items.filter(i =>
    i.TmhName.toLowerCase().includes(search.toLowerCase())
  );

  return (
    <div className={styles.container}>
      <div className={styles.header}>
        <div>
          <h1 className={styles.title}>Lab Test Method</h1>
          <p className={styles.subtitle}>Configure clinical testing methodologies [TestMeth.frm]</p>
        </div>
      </div>

      <ActionBar
        onAdd={handleAdd}
        onEdit={handleEdit}
        onDelete={handleDelete}
        onRefresh={loadData}
        onExit={() => {
          if (entryMode) {
            setEntryMode(false);
          } else {
            router.push('/dashboard');
          }
        }}
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
              type="text"
              placeholder="Search methods..."
              value={search}
              onChange={e => setSearch(e.target.value)}
            />
          </div>

          <div className={styles.tableContainer}>
            <table className={styles.table}>
              <thead>
                <tr>
                  <th style={{ width: '80px' }}>Code</th>
                  <th>Method Name</th>
                  <th style={{ width: '120px' }}>Sort Index</th>
                  <th style={{ width: '150px' }}>Show in List</th>
                </tr>
              </thead>
              <tbody>
                {filtered.length === 0 ? (
                  <tr>
                    <td colSpan={4} className={styles.emptyCell}>
                      No test methods found
                    </td>
                  </tr>
                ) : (
                  filtered.map(item => (
                    <tr
                      key={item.TmhCode}
                      onClick={() => setSelectedId(item.TmhCode)}
                      onDoubleClick={handleEdit}
                      className={selectedId === item.TmhCode ? styles.selectedRow : ''}
                      style={{ cursor: 'pointer' }}
                    >
                      <td style={{ fontWeight: 600, color: 'var(--accent-color)' }}>
                        #{item.TmhCode}
                      </td>
                      <td style={{ fontWeight: 600 }}>{item.TmhName}</td>
                      <td>{item.TmhIndex}</td>
                      <td>
                        <span className={`px-2 py-0.5 rounded text-xs font-semibold ${item.TmhShowInList ? 'bg-green-100 text-green-800' : 'bg-red-100 text-red-800'}`}>
                          {item.TmhShowInList ? 'Yes' : 'No'}
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
        <div className={styles.formContainer}>
          <h2 className={styles.formTitle}>
            {editing ? `Edit Method #${editing.TmhCode}: ${editing.TmhName}` : 'New Test Method'}
          </h2>
          <form onSubmit={handleSave} className={styles.gridForm}>
            <div className={styles.formGroup} style={{ gridColumn: 'span 2' }}>
              <label className={styles.requiredLabel}>Method Name</label>
              <input
                ref={nameInputRef}
                type="text"
                required
                placeholder="e.g. ELISA, Automated Analyzer"
                value={form.TmhName}
                onChange={e => setForm({ ...form, TmhName: e.target.value })}
              />
            </div>

            <div className={styles.formGroup}>
              <label>Sort Index</label>
              <input
                type="number"
                value={form.TmhIndex}
                onChange={e => setForm({ ...form, TmhIndex: parseInt(e.target.value) || 0 })}
              />
            </div>

            <div className={styles.formGroup} style={{ flexDirection: 'row', alignItems: 'center', gap: '8px', alignSelf: 'center', marginTop: '20px' }}>
              <input
                id="TmhShowInList"
                type="checkbox"
                style={{ width: 'auto' }}
                checked={form.TmhShowInList}
                onChange={e => setForm({ ...form, TmhShowInList: e.target.checked })}
              />
              <label htmlFor="TmhShowInList" style={{ cursor: 'pointer', margin: 0 }}>
                Show in lookup lists
              </label>
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
