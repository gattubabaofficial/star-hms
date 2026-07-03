'use client';
import React, { useState, useEffect, useRef } from 'react';
import { useRouter } from 'next/navigation';
import styles from '../../../dashboard.module.css';
import ActionBar from '../components/ActionBar';
import { Search, AlertCircle, Check } from 'lucide-react';

interface TestValCalc {
  TvcCode: number;
  TvcName: string;
  TvcTprCode?: number;
  TvcRemark?: string;
  TvcShowInList: boolean;
  TvcRecState: number;
}

interface ParameterOption {
  id: number;
  name: string;
}

const API = process.env.NEXT_PUBLIC_API_URL || 'http://localhost:8000';
const getToken = () => typeof window !== 'undefined' ? localStorage.getItem('token') : '';
const authHdr = () => ({ 'Content-Type': 'application/json', Authorization: `Bearer ${getToken()}` });

const blankForm = {
  TvcName: '',
  TvcTprCode: '',
  TvcRemark: '',
  TvcShowInList: true,
};

export default function TestAutoCalcPage() {
  const router = useRouter();

  const [items, setItems] = useState<TestValCalc[]>([]);
  const [search, setSearch] = useState('');
  const [selectedId, setSelectedId] = useState<number | null>(null);
  const [entryMode, setEntryMode] = useState(false);
  const [editing, setEditing] = useState<TestValCalc | null>(null);

  const [parameters, setParameters] = useState<ParameterOption[]>([]);

  const [form, setForm] = useState(blankForm);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');
  const [success, setSuccess] = useState('');

  const nameInputRef = useRef<HTMLInputElement>(null);
  const searchInputRef = useRef<HTMLInputElement>(null);

  const loadParameters = async () => {
    try {
      const res = await fetch(`${API}/api/masters/pathology/test-parameters`, { headers: authHdr() });
      if (res.ok) {
        const data = await res.json();
        setParameters(data.map((x: any) => ({ id: x.TprCode, name: x.TprName })));
      }
    } catch (e) {
      console.error('Error loading parameters:', e);
    }
  };

  const loadData = async () => {
    try {
      const res = await fetch(`${API}/api/masters/pathology/test-calcs`, {
        headers: authHdr(),
      });
      if (res.ok) {
        const data = await res.json();
        setItems(data);
        if (data.length > 0) {
          setSelectedId(prev => {
            const exists = data.some((item: TestValCalc) => item.TvcCode === prev);
            return exists ? prev : data[0].TvcCode;
          });
        } else {
          setSelectedId(null);
        }
      }
    } catch (e) {
      console.error('Error loading auto-calcs:', e);
    }
  };

  useEffect(() => {
    loadData();
    loadParameters();
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
        i.TvcName.toLowerCase().includes(search.toLowerCase())
      );
      if (filtered.length === 0) return;

      const currentIndex = filtered.findIndex(i => i.TvcCode === selectedId);

      if (e.key === 'ArrowDown') {
        e.preventDefault();
        const nextIndex = (currentIndex + 1) % filtered.length;
        setSelectedId(filtered[nextIndex].TvcCode);
      } else if (e.key === 'ArrowUp') {
        e.preventDefault();
        const prevIndex = (currentIndex - 1 + filtered.length) % filtered.length;
        setSelectedId(filtered[prevIndex].TvcCode);
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
    const item = items.find(i => i.TvcCode === selectedId);
    if (!item) return;
    setEditing(item);
    setForm({
      TvcName: item.TvcName,
      TvcTprCode: item.TvcTprCode ? String(item.TvcTprCode) : '',
      TvcRemark: item.TvcRemark || '',
      TvcShowInList: item.TvcShowInList,
    });
    setError('');
    setSuccess('');
    setEntryMode(true);
  };

  const handleDelete = async () => {
    if (selectedId === null) return;
    const item = items.find(i => i.TvcCode === selectedId);
    if (!item || !confirm(`Delete auto calculation method "${item.TvcName}"?`)) return;

    try {
      const res = await fetch(`${API}/api/masters/pathology/test-calcs/${selectedId}`, {
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
      setError('Error deleting auto-calc method');
    }
  };

  const handleSave = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!form.TvcName.trim()) {
      setError('Method Name is required');
      return;
    }

    setLoading(true);
    setError('');
    setSuccess('');

    try {
      const payload = {
        TvcName: form.TvcName.trim(),
        TvcTprCode: form.TvcTprCode ? Number(form.TvcTprCode) : null,
        TvcRemark: form.TvcRemark.trim() || null,
        TvcShowInList: Boolean(form.TvcShowInList),
        TvcRecState: 1,
      };

      const url = editing
        ? `${API}/api/masters/pathology/test-calcs/${editing.TvcCode}`
        : `${API}/api/masters/pathology/test-calcs`;

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
      setSelectedId(saved.TvcCode);
      setTimeout(() => setEntryMode(false), 800);
    } catch (e: any) {
      setError(e.message || 'Error saving calculation method');
    } finally {
      setLoading(false);
    }
  };

  const getParameterName = (code?: number) => parameters.find(p => p.id === code)?.name || '-';

  const filtered = items.filter(i =>
    i.TvcName.toLowerCase().includes(search.toLowerCase())
  );

  return (
    <div className={styles.container}>
      <div className={styles.header}>
        <div>
          <h1 className={styles.title}>Test Auto Calculation Methods</h1>
          <p className={styles.subtitle}>Configure automated calculated test values based on parameters [AutoCalc.frm]</p>
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
              placeholder="Search auto calculations..."
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
                  <th>Target Parameter</th>
                  <th>Formula / Remark</th>
                  <th style={{ width: '150px' }}>Show in List</th>
                </tr>
              </thead>
              <tbody>
                {filtered.length === 0 ? (
                  <tr>
                    <td colSpan={5} className={styles.emptyCell}>
                      No auto calculations found
                    </td>
                  </tr>
                ) : (
                  filtered.map(item => (
                    <tr
                      key={item.TvcCode}
                      onClick={() => setSelectedId(item.TvcCode)}
                      onDoubleClick={handleEdit}
                      className={selectedId === item.TvcCode ? styles.selectedRow : ''}
                      style={{ cursor: 'pointer' }}
                    >
                      <td style={{ fontWeight: 600, color: 'var(--accent-color)' }}>
                        #{item.TvcCode}
                      </td>
                      <td style={{ fontWeight: 600 }}>{item.TvcName}</td>
                      <td>{getParameterName(item.TvcTprCode)}</td>
                      <td>{item.TvcRemark || '-'}</td>
                      <td>
                        <span className={`px-2 py-0.5 rounded text-xs font-semibold ${item.TvcShowInList ? 'bg-green-100 text-green-800' : 'bg-red-100 text-red-800'}`}>
                          {item.TvcShowInList ? 'Yes' : 'No'}
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
            {editing ? `Edit Auto Calc #${editing.TvcCode}: ${editing.TvcName}` : 'New Auto Calculation'}
          </h2>
          <form onSubmit={handleSave} className={styles.gridForm}>
            <div className={styles.formGroup} style={{ gridColumn: 'span 2' }}>
              <label className={styles.requiredLabel}>Method Name</label>
              <input
                ref={nameInputRef}
                type="text"
                required
                placeholder="e.g. Indirect Bilirubin Auto Calc"
                value={form.TvcName}
                onChange={e => setForm({ ...form, TvcName: e.target.value })}
              />
            </div>

            <div className={styles.formGroup}>
              <label>Target Test Parameter</label>
              <select
                value={form.TvcTprCode}
                onChange={e => setForm({ ...form, TvcTprCode: e.target.value })}
              >
                <option value="">Select Parameter</option>
                {parameters.map(p => (
                  <option key={p.id} value={p.id}>{p.name}</option>
                ))}
              </select>
            </div>

            <div className={styles.formGroup}>
              <label>Formula / Remark</label>
              <input
                type="text"
                placeholder="e.g. Total Bilirubin - Direct Bilirubin"
                value={form.TvcRemark}
                onChange={e => setForm({ ...form, TvcRemark: e.target.value })}
              />
            </div>

            <div className={styles.formGroup} style={{ flexDirection: 'row', alignItems: 'center', gap: '8px', alignSelf: 'center', marginTop: '20px', gridColumn: 'span 2' }}>
              <input
                id="TvcShowInList"
                type="checkbox"
                style={{ width: 'auto' }}
                checked={form.TvcShowInList}
                onChange={e => setForm({ ...form, TvcShowInList: e.target.checked })}
              />
              <label htmlFor="TvcShowInList" style={{ cursor: 'pointer', margin: 0 }}>
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
