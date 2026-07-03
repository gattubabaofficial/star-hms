'use client';
import React, { useState, useEffect, useRef } from 'react';
import { useRouter } from 'next/navigation';
import styles from '../../../dashboard.module.css';
import ActionBar from '../components/ActionBar';
import { Search, AlertCircle, Check } from 'lucide-react';

interface TestGroup {
  TgpCode: number;
  TgpName: string;
  TgpPrintName: string;
  TgpHdrNote?: string;
  TgpDtlNote?: string;
  TgpFtrNote?: string;
  TgpShowInList: boolean;
  TgpRecState: number;
  TgpIndex: number;
}

const API = process.env.NEXT_PUBLIC_API_URL || 'http://localhost:8000';
const getToken = () => typeof window !== 'undefined' ? localStorage.getItem('token') : '';
const authHdr = () => ({ 'Content-Type': 'application/json', Authorization: `Bearer ${getToken()}` });

const blankForm = {
  TgpName: '',
  TgpPrintName: '',
  TgpHdrNote: '',
  TgpDtlNote: '',
  TgpFtrNote: '',
  TgpIndex: 0,
  TgpShowInList: true,
};

export default function LabTestGroupPage() {
  const router = useRouter();

  const [items, setItems] = useState<TestGroup[]>([]);
  const [search, setSearch] = useState('');
  const [selectedId, setSelectedId] = useState<number | null>(null);
  const [entryMode, setEntryMode] = useState(false);
  const [editing, setEditing] = useState<TestGroup | null>(null);

  const [form, setForm] = useState(blankForm);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');
  const [success, setSuccess] = useState('');

  const nameInputRef = useRef<HTMLInputElement>(null);
  const searchInputRef = useRef<HTMLInputElement>(null);

  const loadData = async () => {
    try {
      const res = await fetch(`${API}/api/masters/pathology/test-groups`, {
        headers: authHdr(),
      });
      if (res.ok) {
        const data = await res.json();
        setItems(data);
        if (data.length > 0) {
          setSelectedId(prev => {
            const exists = data.some((item: TestGroup) => item.TgpCode === prev);
            return exists ? prev : data[0].TgpCode;
          });
        } else {
          setSelectedId(null);
        }
      }
    } catch (e) {
      console.error('Error loading test groups:', e);
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
        i.TgpName.toLowerCase().includes(search.toLowerCase())
      );
      if (filtered.length === 0) return;

      const currentIndex = filtered.findIndex(i => i.TgpCode === selectedId);

      if (e.key === 'ArrowDown') {
        e.preventDefault();
        const nextIndex = (currentIndex + 1) % filtered.length;
        setSelectedId(filtered[nextIndex].TgpCode);
      } else if (e.key === 'ArrowUp') {
        e.preventDefault();
        const prevIndex = (currentIndex - 1 + filtered.length) % filtered.length;
        setSelectedId(filtered[prevIndex].TgpCode);
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
    const item = items.find(i => i.TgpCode === selectedId);
    if (!item) return;
    setEditing(item);
    setForm({
      TgpName: item.TgpName,
      TgpPrintName: item.TgpPrintName || '',
      TgpHdrNote: item.TgpHdrNote || '',
      TgpDtlNote: item.TgpDtlNote || '',
      TgpFtrNote: item.TgpFtrNote || '',
      TgpIndex: item.TgpIndex,
      TgpShowInList: item.TgpShowInList,
    });
    setError('');
    setSuccess('');
    setEntryMode(true);
  };

  const handleDelete = async () => {
    if (selectedId === null) return;
    const item = items.find(i => i.TgpCode === selectedId);
    if (!item || !confirm(`Delete test group "${item.TgpName}"?`)) return;

    try {
      const res = await fetch(`${API}/api/masters/pathology/test-groups/${selectedId}`, {
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
      setError('Error deleting test group');
    }
  };

  const handleSave = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!form.TgpName.trim()) {
      setError('Group Name is required');
      return;
    }

    setLoading(true);
    setError('');
    setSuccess('');

    try {
      const payload = {
        TgpName: form.TgpName.trim(),
        TgpPrintName: form.TgpPrintName.trim() || form.TgpName.trim(),
        TgpHdrNote: form.TgpHdrNote.trim() || null,
        TgpDtlNote: form.TgpDtlNote.trim() || null,
        TgpFtrNote: form.TgpFtrNote.trim() || null,
        TgpIndex: Number(form.TgpIndex),
        TgpShowInList: Boolean(form.TgpShowInList),
        TgpRecState: 1,
      };

      const url = editing
        ? `${API}/api/masters/pathology/test-groups/${editing.TgpCode}`
        : `${API}/api/masters/pathology/test-groups`;

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
      setSelectedId(saved.TgpCode);
      setTimeout(() => setEntryMode(false), 800);
    } catch (e: any) {
      setError(e.message || 'Error saving test group');
    } finally {
      setLoading(false);
    }
  };

  const filtered = items.filter(i =>
    i.TgpName.toLowerCase().includes(search.toLowerCase())
  );

  return (
    <div className={styles.container}>
      <div className={styles.header}>
        <div>
          <h1 className={styles.title}>Lab Test Group</h1>
          <p className={styles.subtitle}>Configure clinical laboratory test grouping profiles [TestGrp.frm]</p>
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
              placeholder="Search test groups..."
              value={search}
              onChange={e => setSearch(e.target.value)}
            />
          </div>

          <div className={styles.tableContainer}>
            <table className={styles.table}>
              <thead>
                <tr>
                  <th style={{ width: '80px' }}>Code</th>
                  <th>Group Name</th>
                  <th>Print Name</th>
                  <th style={{ width: '120px' }}>Sort Index</th>
                  <th style={{ width: '150px' }}>Show in List</th>
                </tr>
              </thead>
              <tbody>
                {filtered.length === 0 ? (
                  <tr>
                    <td colSpan={5} className={styles.emptyCell}>
                      No test groups found
                    </td>
                  </tr>
                ) : (
                  filtered.map(item => (
                    <tr
                      key={item.TgpCode}
                      onClick={() => setSelectedId(item.TgpCode)}
                      onDoubleClick={handleEdit}
                      className={selectedId === item.TgpCode ? styles.selectedRow : ''}
                      style={{ cursor: 'pointer' }}
                    >
                      <td style={{ fontWeight: 600, color: 'var(--accent-color)' }}>
                        #{item.TgpCode}
                      </td>
                      <td style={{ fontWeight: 600 }}>{item.TgpName}</td>
                      <td>{item.TgpPrintName}</td>
                      <td>{item.TgpIndex}</td>
                      <td>
                        <span className={`px-2 py-0.5 rounded text-xs font-semibold ${item.TgpShowInList ? 'bg-green-100 text-green-800' : 'bg-red-100 text-red-800'}`}>
                          {item.TgpShowInList ? 'Yes' : 'No'}
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
            {editing ? `Edit Group #${editing.TgpCode}: ${editing.TgpName}` : 'New Test Group'}
          </h2>
          <form onSubmit={handleSave} className={styles.gridForm}>
            <div className={styles.formGroup}>
              <label className={styles.requiredLabel}>Group Name</label>
              <input
                ref={nameInputRef}
                type="text"
                required
                placeholder="e.g. Complete Blood Count"
                value={form.TgpName}
                onChange={e => setForm({ ...form, TgpName: e.target.value })}
              />
            </div>
            <div className={styles.formGroup}>
              <label>Print Name</label>
              <input
                type="text"
                placeholder="e.g. CBC Profile"
                value={form.TgpPrintName}
                onChange={e => setForm({ ...form, TgpPrintName: e.target.value })}
              />
            </div>

            <div className={styles.formGroup} style={{ gridColumn: 'span 2' }}>
              <label>Header Note</label>
              <textarea
                placeholder="Custom header instructions/notes..."
                style={{ height: '60px', resize: 'none' }}
                value={form.TgpHdrNote}
                onChange={e => setForm({ ...form, TgpHdrNote: e.target.value })}
              />
            </div>

            <div className={styles.formGroup}>
              <label>Detail Note</label>
              <textarea
                placeholder="Detail notes..."
                style={{ height: '60px', resize: 'none' }}
                value={form.TgpDtlNote}
                onChange={e => setForm({ ...form, TgpDtlNote: e.target.value })}
              />
            </div>
            <div className={styles.formGroup}>
              <label>Footer Note</label>
              <textarea
                placeholder="Footer signatures/notes..."
                style={{ height: '60px', resize: 'none' }}
                value={form.TgpFtrNote}
                onChange={e => setForm({ ...form, TgpFtrNote: e.target.value })}
              />
            </div>

            <div className={styles.formGroup}>
              <label>Sort Index</label>
              <input
                type="number"
                value={form.TgpIndex}
                onChange={e => setForm({ ...form, TgpIndex: parseInt(e.target.value) || 0 })}
              />
            </div>

            <div className={styles.formGroup} style={{ flexDirection: 'row', alignItems: 'center', gap: '8px', alignSelf: 'center', marginTop: '20px' }}>
              <input
                id="TgpShowInList"
                type="checkbox"
                style={{ width: 'auto' }}
                checked={form.TgpShowInList}
                onChange={e => setForm({ ...form, TgpShowInList: e.target.checked })}
              />
              <label htmlFor="TgpShowInList" style={{ cursor: 'pointer', margin: 0 }}>
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
