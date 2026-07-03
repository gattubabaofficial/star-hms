'use client';
import React, { useState, useEffect, useRef } from 'react';
import { useRouter } from 'next/navigation';
import styles from '../../../dashboard.module.css';
import ActionBar from '../components/ActionBar';
import { Search, AlertCircle, Check } from 'lucide-react';

interface TestSample {
  TspCode: number;
  TspName: string;
  TspIndex: number;
  TspShowInList: boolean;
  TspRecState: number;
}

const API = process.env.NEXT_PUBLIC_API_URL || 'http://localhost:8000';
const getToken = () => typeof window !== 'undefined' ? localStorage.getItem('token') : '';
const authHdr = () => ({ 'Content-Type': 'application/json', Authorization: `Bearer ${getToken()}` });

const blankForm = {
  TspName: '',
  TspIndex: 0,
  TspShowInList: true,
};

export default function LabTestSamplePage() {
  const router = useRouter();

  const [items, setItems] = useState<TestSample[]>([]);
  const [search, setSearch] = useState('');
  const [selectedId, setSelectedId] = useState<number | null>(null);
  const [entryMode, setEntryMode] = useState(false);
  const [editing, setEditing] = useState<TestSample | null>(null);

  const [form, setForm] = useState(blankForm);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');
  const [success, setSuccess] = useState('');

  const nameInputRef = useRef<HTMLInputElement>(null);
  const searchInputRef = useRef<HTMLInputElement>(null);

  const loadData = async () => {
    try {
      const res = await fetch(`${API}/api/masters/pathology/test-samples`, {
        headers: authHdr(),
      });
      if (res.ok) {
        const data = await res.json();
        setItems(data);
        if (data.length > 0) {
          setSelectedId(prev => {
            const exists = data.some((item: TestSample) => item.TspCode === prev);
            return exists ? prev : data[0].TspCode;
          });
        } else {
          setSelectedId(null);
        }
      }
    } catch (e) {
      console.error('Error loading test samples:', e);
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
        i.TspName.toLowerCase().includes(search.toLowerCase())
      );
      if (filtered.length === 0) return;

      const currentIndex = filtered.findIndex(i => i.TspCode === selectedId);

      if (e.key === 'ArrowDown') {
        e.preventDefault();
        const nextIndex = (currentIndex + 1) % filtered.length;
        setSelectedId(filtered[nextIndex].TspCode);
      } else if (e.key === 'ArrowUp') {
        e.preventDefault();
        const prevIndex = (currentIndex - 1 + filtered.length) % filtered.length;
        setSelectedId(filtered[prevIndex].TspCode);
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
    const item = items.find(i => i.TspCode === selectedId);
    if (!item) return;
    setEditing(item);
    setForm({
      TspName: item.TspName,
      TspIndex: item.TspIndex,
      TspShowInList: item.TspShowInList,
    });
    setError('');
    setSuccess('');
    setEntryMode(true);
  };

  const handleDelete = async () => {
    if (selectedId === null) return;
    const item = items.find(i => i.TspCode === selectedId);
    if (!item || !confirm(`Delete test sample type "${item.TspName}"?`)) return;

    try {
      const res = await fetch(`${API}/api/masters/pathology/test-samples/${selectedId}`, {
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
      setError('Error deleting test sample type');
    }
  };

  const handleSave = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!form.TspName.trim()) {
      setError('Sample Type Name is required');
      return;
    }

    setLoading(true);
    setError('');
    setSuccess('');

    try {
      const payload = {
        TspName: form.TspName.trim(),
        TspIndex: Number(form.TspIndex),
        TspShowInList: Boolean(form.TspShowInList),
        TspRecState: 1,
      };

      const url = editing
        ? `${API}/api/masters/pathology/test-samples/${editing.TspCode}`
        : `${API}/api/masters/pathology/test-samples`;

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
      setSelectedId(saved.TspCode);
      setTimeout(() => setEntryMode(false), 800);
    } catch (e: any) {
      setError(e.message || 'Error saving test sample');
    } finally {
      setLoading(false);
    }
  };

  const filtered = items.filter(i =>
    i.TspName.toLowerCase().includes(search.toLowerCase())
  );

  return (
    <div className={styles.container}>
      <div className={styles.header}>
        <div>
          <h1 className={styles.title}>Lab Test Sample Type</h1>
          <p className={styles.subtitle}>Configure clinical test sample collection types [TestSmpl.frm]</p>
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
              placeholder="Search sample types..."
              value={search}
              onChange={e => setSearch(e.target.value)}
            />
          </div>

          <div className={styles.tableContainer}>
            <table className={styles.table}>
              <thead>
                <tr>
                  <th style={{ width: '80px' }}>Code</th>
                  <th>Sample Type Name</th>
                  <th style={{ width: '120px' }}>Sort Index</th>
                  <th style={{ width: '150px' }}>Show in List</th>
                </tr>
              </thead>
              <tbody>
                {filtered.length === 0 ? (
                  <tr>
                    <td colSpan={4} className={styles.emptyCell}>
                      No test sample types found
                    </td>
                  </tr>
                ) : (
                  filtered.map(item => (
                    <tr
                      key={item.TspCode}
                      onClick={() => setSelectedId(item.TspCode)}
                      onDoubleClick={handleEdit}
                      className={selectedId === item.TspCode ? styles.selectedRow : ''}
                      style={{ cursor: 'pointer' }}
                    >
                      <td style={{ fontWeight: 600, color: 'var(--accent-color)' }}>
                        #{item.TspCode}
                      </td>
                      <td style={{ fontWeight: 600 }}>{item.TspName}</td>
                      <td>{item.TspIndex}</td>
                      <td>
                        <span className={`px-2 py-0.5 rounded text-xs font-semibold ${item.TspShowInList ? 'bg-green-100 text-green-800' : 'bg-red-100 text-red-800'}`}>
                          {item.TspShowInList ? 'Yes' : 'No'}
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
            {editing ? `Edit Sample Type #${editing.TspCode}: ${editing.TspName}` : 'New Sample Type'}
          </h2>
          <form onSubmit={handleSave} className={styles.gridForm}>
            <div className={styles.formGroup} style={{ gridColumn: 'span 2' }}>
              <label className={styles.requiredLabel}>Sample Type Name</label>
              <input
                ref={nameInputRef}
                type="text"
                required
                placeholder="e.g. Whole Blood, Serum, Urine"
                value={form.TspName}
                onChange={e => setForm({ ...form, TspName: e.target.value })}
              />
            </div>

            <div className={styles.formGroup}>
              <label>Sort Index</label>
              <input
                type="number"
                value={form.TspIndex}
                onChange={e => setForm({ ...form, TspIndex: parseInt(e.target.value) || 0 })}
              />
            </div>

            <div className={styles.formGroup} style={{ flexDirection: 'row', alignItems: 'center', gap: '8px', alignSelf: 'center', marginTop: '20px' }}>
              <input
                id="TspShowInList"
                type="checkbox"
                style={{ width: 'auto' }}
                checked={form.TspShowInList}
                onChange={e => setForm({ ...form, TspShowInList: e.target.checked })}
              />
              <label htmlFor="TspShowInList" style={{ cursor: 'pointer', margin: 0 }}>
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
