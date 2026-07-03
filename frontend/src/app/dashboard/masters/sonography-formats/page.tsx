'use client';
import React, { useState, useEffect, useRef } from 'react';
import { useRouter } from 'next/navigation';
import styles from '../../../dashboard.module.css';
import ActionBar from '../components/ActionBar';
import { Search, AlertCircle, Check } from 'lucide-react';

interface TestFormat {
  TfmCode: number;
  TfmName: string;
  TfmPrintName?: string;
  TfmRemark?: string;
  TfmIndex: number;
  TfmShowInList: boolean;
  TfmTspCode?: number;
  TfmRepStyle: string;
  TfmHdrNote?: string;
  TfmDtlNote?: string;
  TfmFtrNote?: string;
}

interface SampleOption {
  id: number;
  name: string;
}

const API = process.env.NEXT_PUBLIC_API_URL || 'http://localhost:8000';
const getToken = () => typeof window !== 'undefined' ? localStorage.getItem('token') : '';
const authHdr = () => ({ 'Content-Type': 'application/json', Authorization: `Bearer ${getToken()}` });

const blankForm = {
  TfmName: '',
  TfmPrintName: '',
  TfmRemark: '',
  TfmTspCode: '',
  TfmHdrNote: '',
  TfmDtlNote: '',
  TfmFtrNote: '',
  TfmIndex: 0,
  TfmShowInList: true,
};

export default function SonographyFormatsPage() {
  const router = useRouter();

  const [items, setItems] = useState<TestFormat[]>([]);
  const [search, setSearch] = useState('');
  const [selectedId, setSelectedId] = useState<number | null>(null);
  const [entryMode, setEntryMode] = useState(false);
  const [editing, setEditing] = useState<TestFormat | null>(null);

  const [samples, setSamples] = useState<SampleOption[]>([]);

  const [form, setForm] = useState(blankForm);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');
  const [success, setSuccess] = useState('');

  const nameInputRef = useRef<HTMLInputElement>(null);
  const searchInputRef = useRef<HTMLInputElement>(null);

  const loadSamples = async () => {
    try {
      const res = await fetch(`${API}/api/masters/pathology/test-samples`, { headers: authHdr() });
      if (res.ok) {
        const data = await res.json();
        setSamples(data.map((x: any) => ({ id: x.TspCode, name: x.TspName })));
      }
    } catch (e) {
      console.error('Error loading samples:', e);
    }
  };

  const loadData = async () => {
    try {
      const res = await fetch(`${API}/api/masters/pathology/test-formats?style=Sonography`, {
        headers: authHdr(),
      });
      if (res.ok) {
        const data = await res.json();
        setItems(data);
        if (data.length > 0) {
          setSelectedId(prev => {
            const exists = data.some((item: TestFormat) => item.TfmCode === prev);
            return exists ? prev : data[0].TfmCode;
          });
        } else {
          setSelectedId(null);
        }
      }
    } catch (e) {
      console.error('Error loading test formats:', e);
    }
  };

  useEffect(() => {
    loadData();
    loadSamples();
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
        i.TfmName.toLowerCase().includes(search.toLowerCase())
      );
      if (filtered.length === 0) return;

      const currentIndex = filtered.findIndex(i => i.TfmCode === selectedId);

      if (e.key === 'ArrowDown') {
        e.preventDefault();
        const nextIndex = (currentIndex + 1) % filtered.length;
        setSelectedId(filtered[nextIndex].TfmCode);
      } else if (e.key === 'ArrowUp') {
        e.preventDefault();
        const prevIndex = (currentIndex - 1 + filtered.length) % filtered.length;
        setSelectedId(filtered[prevIndex].TfmCode);
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
    const item = items.find(i => i.TfmCode === selectedId);
    if (!item) return;
    setEditing(item);
    setForm({
      TfmName: item.TfmName,
      TfmPrintName: item.TfmPrintName || '',
      TfmRemark: item.TfmRemark || '',
      TfmTspCode: item.TfmTspCode ? String(item.TfmTspCode) : '',
      TfmHdrNote: item.TfmHdrNote || '',
      TfmDtlNote: item.TfmDtlNote || '',
      TfmFtrNote: item.TfmFtrNote || '',
      TfmIndex: item.TfmIndex,
      TfmShowInList: item.TfmShowInList,
    });
    setError('');
    setSuccess('');
    setEntryMode(true);
  };

  const handleDelete = async () => {
    if (selectedId === null) return;
    const item = items.find(i => i.TfmCode === selectedId);
    if (!item || !confirm(`Delete report format "${item.TfmName}"?`)) return;

    try {
      const res = await fetch(`${API}/api/masters/pathology/test-formats/${selectedId}`, {
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
      setError('Error deleting format');
    }
  };

  const handleSave = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!form.TfmName.trim()) {
      setError('Format Name is required');
      return;
    }

    setLoading(true);
    setError('');
    setSuccess('');

    try {
      const payload = {
        TfmName: form.TfmName.trim(),
        TfmPrintName: form.TfmPrintName.trim() || form.TfmName.trim(),
        TfmRemark: form.TfmRemark.trim() || null,
        TfmTspCode: form.TfmTspCode ? Number(form.TfmTspCode) : null,
        TfmHdrNote: form.TfmHdrNote.trim() || null,
        TfmDtlNote: form.TfmDtlNote.trim() || null,
        TfmFtrNote: form.TfmFtrNote.trim() || null,
        TfmIndex: Number(form.TfmIndex),
        TfmShowInList: Boolean(form.TfmShowInList),
        TfmRepStyle: 'Sonography',
        TfmRecState: 1,
      };

      const url = editing
        ? `${API}/api/masters/pathology/test-formats/${editing.TfmCode}`
        : `${API}/api/masters/pathology/test-formats`;

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
      setSelectedId(saved.TfmCode);
      setTimeout(() => setEntryMode(false), 800);
    } catch (e: any) {
      setError(e.message || 'Error saving report format');
    } finally {
      setLoading(false);
    }
  };

  const getSampleName = (code?: number) => samples.find(s => s.id === code)?.name || '-';

  const filtered = items.filter(i =>
    i.TfmName.toLowerCase().includes(search.toLowerCase())
  );

  return (
    <div className={styles.container}>
      <div className={styles.header}>
        <div>
          <h1 className={styles.title}>Sonography Report Formats</h1>
          <p className={styles.subtitle}>Configure templates and formatting layout style for USG/Sonography diagnostics [SonoRptFmt.frm]</p>
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
              placeholder="Search sonography formats..."
              value={search}
              onChange={e => setSearch(e.target.value)}
            />
          </div>

          <div className={styles.tableContainer}>
            <table className={styles.table}>
              <thead>
                <tr>
                  <th style={{ width: '80px' }}>Code</th>
                  <th>Format Name</th>
                  <th>Print Name</th>
                  <th>Sample Type</th>
                  <th style={{ width: '120px' }}>Sort Index</th>
                  <th style={{ width: '150px' }}>Show in List</th>
                </tr>
              </thead>
              <tbody>
                {filtered.length === 0 ? (
                  <tr>
                    <td colSpan={6} className={styles.emptyCell}>
                      No report formats found
                    </td>
                  </tr>
                ) : (
                  filtered.map(item => (
                    <tr
                      key={item.TfmCode}
                      onClick={() => setSelectedId(item.TfmCode)}
                      onDoubleClick={handleEdit}
                      className={selectedId === item.TfmCode ? styles.selectedRow : ''}
                      style={{ cursor: 'pointer' }}
                    >
                      <td style={{ fontWeight: 600, color: 'var(--accent-color)' }}>
                        #{item.TfmCode}
                      </td>
                      <td style={{ fontWeight: 600 }}>{item.TfmName}</td>
                      <td>{item.TfmPrintName}</td>
                      <td>{getSampleName(item.TfmTspCode)}</td>
                      <td>{item.TfmIndex}</td>
                      <td>
                        <span className={`px-2 py-0.5 rounded text-xs font-semibold ${item.TfmShowInList ? 'bg-green-100 text-green-800' : 'bg-red-100 text-red-800'}`}>
                          {item.TfmShowInList ? 'Yes' : 'No'}
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
            {editing ? `Edit Format #${editing.TfmCode}: ${editing.TfmName}` : 'New Sonography Format'}
          </h2>
          <form onSubmit={handleSave} className={styles.gridForm}>
            <div className={styles.formGroup}>
              <label className={styles.requiredLabel}>Format Name</label>
              <input
                ref={nameInputRef}
                type="text"
                required
                placeholder="e.g. Ob/Gyn USG Format"
                value={form.TfmName}
                onChange={e => setForm({ ...form, TfmName: e.target.value })}
              />
            </div>
            <div className={styles.formGroup}>
              <label>Print Name</label>
              <input
                type="text"
                placeholder="e.g. Ob/Gyn Sonography Report"
                value={form.TfmPrintName}
                onChange={e => setForm({ ...form, TfmPrintName: e.target.value })}
              />
            </div>

            <div className={styles.formGroup}>
              <label>Sample Type</label>
              <select
                value={form.TfmTspCode}
                onChange={e => setForm({ ...form, TfmTspCode: e.target.value })}
              >
                <option value="">Select Sample Type</option>
                {samples.map(s => (
                  <option key={s.id} value={s.id}>{s.name}</option>
                ))}
              </select>
            </div>
            <div className={styles.formGroup}>
              <label>Remark</label>
              <input
                type="text"
                placeholder="Format descriptions..."
                value={form.TfmRemark}
                onChange={e => setForm({ ...form, TfmRemark: e.target.value })}
              />
            </div>

            <div className={styles.formGroup} style={{ gridColumn: 'span 2' }}>
              <label>Header Note</label>
              <textarea
                placeholder="Custom report header instructions..."
                style={{ height: '60px', resize: 'none' }}
                value={form.TfmHdrNote}
                onChange={e => setForm({ ...form, TfmHdrNote: e.target.value })}
              />
            </div>

            <div className={styles.formGroup}>
              <label>Detail Note</label>
              <textarea
                placeholder="Detail notes..."
                style={{ height: '60px', resize: 'none' }}
                value={form.TfmDtlNote}
                onChange={e => setForm({ ...form, TfmDtlNote: e.target.value })}
              />
            </div>
            <div className={styles.formGroup}>
              <label>Footer Note</label>
              <textarea
                placeholder="Footer signatures/notes..."
                style={{ height: '60px', resize: 'none' }}
                value={form.TfmFtrNote}
                onChange={e => setForm({ ...form, TfmFtrNote: e.target.value })}
              />
            </div>

            <div className={styles.formGroup}>
              <label>Sort Index</label>
              <input
                type="number"
                value={form.TfmIndex}
                onChange={e => setForm({ ...form, TfmIndex: parseInt(e.target.value) || 0 })}
              />
            </div>

            <div className={styles.formGroup} style={{ flexDirection: 'row', alignItems: 'center', gap: '8px', alignSelf: 'center', marginTop: '20px' }}>
              <input
                id="TfmShowInList"
                type="checkbox"
                style={{ width: 'auto' }}
                checked={form.TfmShowInList}
                onChange={e => setForm({ ...form, TfmShowInList: e.target.checked })}
              />
              <label htmlFor="TfmShowInList" style={{ cursor: 'pointer', margin: 0 }}>
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
