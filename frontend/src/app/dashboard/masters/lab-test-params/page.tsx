'use client';
import React, { useState, useEffect, useRef } from 'react';
import { useRouter } from 'next/navigation';
import styles from '../../../dashboard.module.css';
import ActionBar from '../components/ActionBar';
import { Search, AlertCircle, Check } from 'lucide-react';

interface TestParameter {
  TprCode: number;
  TprName: string;
  TprPrintName?: string;
  TprTmhCode?: number;
  TprTgpCode?: number;
  TprTdpCode?: number;
  TprRng1?: number;
  TprRng2?: number;
  TprRngUnit?: string;
  TprRemark?: string;
  TprIndex: number;
  TprShowInList: boolean;
  TprRecState: number;
  TprTspCode?: number;
}

interface DropdownOption {
  id: number;
  name: string;
}

const API = process.env.NEXT_PUBLIC_API_URL || 'http://localhost:8000';
const getToken = () => typeof window !== 'undefined' ? localStorage.getItem('token') : '';
const authHdr = () => ({ 'Content-Type': 'application/json', Authorization: `Bearer ${getToken()}` });

const blankForm = {
  TprName: '',
  TprPrintName: '',
  TprTmhCode: '',
  TprTgpCode: '',
  TprTdpCode: '',
  TprTspCode: '',
  TprRng1: '',
  TprRng2: '',
  TprRngUnit: '',
  TprRemark: '',
  TprIndex: 0,
  TprShowInList: true,
};

export default function LabTestParamsPage() {
  const router = useRouter();

  const [items, setItems] = useState<TestParameter[]>([]);
  const [search, setSearch] = useState('');
  const [selectedId, setSelectedId] = useState<number | null>(null);
  const [entryMode, setEntryMode] = useState(false);
  const [editing, setEditing] = useState<TestParameter | null>(null);

  // Dropdown lists
  const [methods, setMethods] = useState<DropdownOption[]>([]);
  const [groups, setGroups] = useState<DropdownOption[]>([]);
  const [departments, setDepartments] = useState<DropdownOption[]>([]);
  const [samples, setSamples] = useState<DropdownOption[]>([]);

  const [form, setForm] = useState(blankForm);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');
  const [success, setSuccess] = useState('');

  const nameInputRef = useRef<HTMLInputElement>(null);
  const searchInputRef = useRef<HTMLInputElement>(null);

  const loadDropdowns = async () => {
    try {
      const fetchOpts = { headers: authHdr() };
      
      const [resM, resG, resD, resS] = await Promise.all([
        fetch(`${API}/api/masters/pathology/test-methods`, fetchOpts),
        fetch(`${API}/api/masters/pathology/test-groups`, fetchOpts),
        fetch(`${API}/api/masters/pathology/test-departments`, fetchOpts),
        fetch(`${API}/api/masters/pathology/test-samples`, fetchOpts),
      ]);

      if (resM.ok) {
        const data = await resM.json();
        setMethods(data.map((x: any) => ({ id: x.TmhCode, name: x.TmhName })));
      }
      if (resG.ok) {
        const data = await resG.json();
        setGroups(data.map((x: any) => ({ id: x.TgpCode, name: x.TgpName })));
      }
      if (resD.ok) {
        const data = await resD.json();
        setDepartments(data.map((x: any) => ({ id: x.TdpCode, name: x.TdpName })));
      }
      if (resS.ok) {
        const data = await resS.json();
        setSamples(data.map((x: any) => ({ id: x.TspCode, name: x.TspName })));
      }
    } catch (e) {
      console.error('Error loading dropdown lists:', e);
    }
  };

  const loadData = async () => {
    try {
      const res = await fetch(`${API}/api/masters/pathology/test-parameters`, {
        headers: authHdr(),
      });
      if (res.ok) {
        const data = await res.json();
        setItems(data);
        if (data.length > 0) {
          setSelectedId(prev => {
            const exists = data.some((item: TestParameter) => item.TprCode === prev);
            return exists ? prev : data[0].TprCode;
          });
        } else {
          setSelectedId(null);
        }
      }
    } catch (e) {
      console.error('Error loading test parameters:', e);
    }
  };

  useEffect(() => {
    loadData();
    loadDropdowns();
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
        i.TprName.toLowerCase().includes(search.toLowerCase())
      );
      if (filtered.length === 0) return;

      const currentIndex = filtered.findIndex(i => i.TprCode === selectedId);

      if (e.key === 'ArrowDown') {
        e.preventDefault();
        const nextIndex = (currentIndex + 1) % filtered.length;
        setSelectedId(filtered[nextIndex].TprCode);
      } else if (e.key === 'ArrowUp') {
        e.preventDefault();
        const prevIndex = (currentIndex - 1 + filtered.length) % filtered.length;
        setSelectedId(filtered[prevIndex].TprCode);
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
    const item = items.find(i => i.TprCode === selectedId);
    if (!item) return;
    setEditing(item);
    setForm({
      TprName: item.TprName,
      TprPrintName: item.TprPrintName || '',
      TprTmhCode: item.TprTmhCode ? String(item.TprTmhCode) : '',
      TprTgpCode: item.TprTgpCode ? String(item.TprTgpCode) : '',
      TprTdpCode: item.TprTdpCode ? String(item.TprTdpCode) : '',
      TprTspCode: item.TprTspCode ? String(item.TprTspCode) : '',
      TprRng1: item.TprRng1 !== undefined && item.TprRng1 !== null ? String(item.TprRng1) : '',
      TprRng2: item.TprRng2 !== undefined && item.TprRng2 !== null ? String(item.TprRng2) : '',
      TprRngUnit: item.TprRngUnit || '',
      TprRemark: item.TprRemark || '',
      TprIndex: item.TprIndex,
      TprShowInList: item.TprShowInList,
    });
    setError('');
    setSuccess('');
    setEntryMode(true);
  };

  const handleDelete = async () => {
    if (selectedId === null) return;
    const item = items.find(i => i.TprCode === selectedId);
    if (!item || !confirm(`Delete test parameter "${item.TprName}"?`)) return;

    try {
      const res = await fetch(`${API}/api/masters/pathology/test-parameters/${selectedId}`, {
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
      setError('Error deleting test parameter');
    }
  };

  const handleSave = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!form.TprName.trim()) {
      setError('Parameter Name is required');
      return;
    }

    setLoading(true);
    setError('');
    setSuccess('');

    try {
      const payload = {
        TprName: form.TprName.trim(),
        TprPrintName: form.TprPrintName.trim() || form.TprName.trim(),
        TprTmhCode: form.TprTmhCode ? Number(form.TprTmhCode) : null,
        TprTgpCode: form.TprTgpCode ? Number(form.TprTgpCode) : null,
        TprTdpCode: form.TprTdpCode ? Number(form.TprTdpCode) : null,
        TprTspCode: form.TprTspCode ? Number(form.TprTspCode) : null,
        TprRng1: form.TprRng1 ? Number(form.TprRng1) : null,
        TprRng2: form.TprRng2 ? Number(form.TprRng2) : null,
        TprRngUnit: form.TprRngUnit.trim() || null,
        TprRemark: form.TprRemark.trim() || null,
        TprIndex: Number(form.TprIndex),
        TprShowInList: Boolean(form.TprShowInList),
        TprRecState: 1,
      };

      const url = editing
        ? `${API}/api/masters/pathology/test-parameters/${editing.TprCode}`
        : `${API}/api/masters/pathology/test-parameters`;

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
      setSelectedId(saved.TprCode);
      setTimeout(() => setEntryMode(false), 800);
    } catch (e: any) {
      setError(e.message || 'Error saving test parameter');
    } finally {
      setLoading(false);
    }
  };

  const getMethodName = (code?: number) => methods.find(m => m.id === code)?.name || '-';
  const getGroupName = (code?: number) => groups.find(g => g.id === code)?.name || '-';
  const getDeptName = (code?: number) => departments.find(d => d.id === code)?.name || '-';

  const filtered = items.filter(i =>
    i.TprName.toLowerCase().includes(search.toLowerCase())
  );

  return (
    <div className={styles.container}>
      <div className={styles.header}>
        <div>
          <h1 className={styles.title}>Lab Test Parameters</h1>
          <p className={styles.subtitle}>Configure specific diagnostics tests, normal reference ranges, and units [TestPara.frm]</p>
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
              placeholder="Search parameters..."
              value={search}
              onChange={e => setSearch(e.target.value)}
            />
          </div>

          <div className={styles.tableContainer}>
            <table className={styles.table}>
              <thead>
                <tr>
                  <th style={{ width: '80px' }}>Code</th>
                  <th>Parameter Name</th>
                  <th>Dept</th>
                  <th>Group</th>
                  <th>Method</th>
                  <th>Min / Max Range</th>
                  <th>Unit</th>
                  <th style={{ width: '100px' }}>Show</th>
                </tr>
              </thead>
              <tbody>
                {filtered.length === 0 ? (
                  <tr>
                    <td colSpan={8} className={styles.emptyCell}>
                      No parameters found
                    </td>
                  </tr>
                ) : (
                  filtered.map(item => (
                    <tr
                      key={item.TprCode}
                      onClick={() => setSelectedId(item.TprCode)}
                      onDoubleClick={handleEdit}
                      className={selectedId === item.TprCode ? styles.selectedRow : ''}
                      style={{ cursor: 'pointer' }}
                    >
                      <td style={{ fontWeight: 600, color: 'var(--accent-color)' }}>
                        #{item.TprCode}
                      </td>
                      <td style={{ fontWeight: 600 }}>{item.TprName}</td>
                      <td>{getDeptName(item.TprTdpCode)}</td>
                      <td>{getGroupName(item.TprTgpCode)}</td>
                      <td>{getMethodName(item.TprTmhCode)}</td>
                      <td>
                        {item.TprRng1 !== null && item.TprRng1 !== undefined ? item.TprRng1 : '-'} / {item.TprRng2 !== null && item.TprRng2 !== undefined ? item.TprRng2 : '-'}
                      </td>
                      <td>{item.TprRngUnit || '-'}</td>
                      <td>
                        <span className={`px-2 py-0.5 rounded text-xs font-semibold ${item.TprShowInList ? 'bg-green-100 text-green-800' : 'bg-red-100 text-red-800'}`}>
                          {item.TprShowInList ? 'Yes' : 'No'}
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
            {editing ? `Edit Parameter #${editing.TprCode}: ${editing.TprName}` : 'New Test Parameter'}
          </h2>
          <form onSubmit={handleSave} className={styles.gridForm}>
            <div className={styles.formGroup}>
              <label className={styles.requiredLabel}>Parameter Name</label>
              <input
                ref={nameInputRef}
                type="text"
                required
                placeholder="e.g. Haemoglobin"
                value={form.TprName}
                onChange={e => setForm({ ...form, TprName: e.target.value })}
              />
            </div>
            <div className={styles.formGroup}>
              <label>Print Name</label>
              <input
                type="text"
                placeholder="e.g. Haemoglobin (Hb)"
                value={form.TprPrintName}
                onChange={e => setForm({ ...form, TprPrintName: e.target.value })}
              />
            </div>

            <div className={styles.formGroup}>
              <label>Department</label>
              <select
                value={form.TprTdpCode}
                onChange={e => setForm({ ...form, TprTdpCode: e.target.value })}
              >
                <option value="">Select Department</option>
                {departments.map(d => (
                  <option key={d.id} value={d.id}>{d.name}</option>
                ))}
              </select>
            </div>
            <div className={styles.formGroup}>
              <label>Test Group</label>
              <select
                value={form.TprTgpCode}
                onChange={e => setForm({ ...form, TprTgpCode: e.target.value })}
              >
                <option value="">Select Group</option>
                {groups.map(g => (
                  <option key={g.id} value={g.id}>{g.name}</option>
                ))}
              </select>
            </div>

            <div className={styles.formGroup}>
              <label>Sample Type</label>
              <select
                value={form.TprTspCode}
                onChange={e => setForm({ ...form, TprTspCode: e.target.value })}
              >
                <option value="">Select Sample Type</option>
                {samples.map(s => (
                  <option key={s.id} value={s.id}>{s.name}</option>
                ))}
              </select>
            </div>
            <div className={styles.formGroup}>
              <label>Test Method</label>
              <select
                value={form.TprTmhCode}
                onChange={e => setForm({ ...form, TprTmhCode: e.target.value })}
              >
                <option value="">Select Method</option>
                {methods.map(m => (
                  <option key={m.id} value={m.id}>{m.name}</option>
                ))}
              </select>
            </div>

            <div className={styles.formGroup}>
              <label>Min Reference Range</label>
              <input
                type="number"
                step="any"
                placeholder="e.g. 12.0"
                value={form.TprRng1}
                onChange={e => setForm({ ...form, TprRng1: e.target.value })}
              />
            </div>
            <div className={styles.formGroup}>
              <label>Max Reference Range</label>
              <input
                type="number"
                step="any"
                placeholder="e.g. 16.0"
                value={form.TprRng2}
                onChange={e => setForm({ ...form, TprRng2: e.target.value })}
              />
            </div>

            <div className={styles.formGroup}>
              <label>Range Unit</label>
              <input
                type="text"
                placeholder="e.g. g/dL, /cumm"
                value={form.TprRngUnit}
                onChange={e => setForm({ ...form, TprRngUnit: e.target.value })}
              />
            </div>
            <div className={styles.formGroup}>
              <label>Sort Index</label>
              <input
                type="number"
                value={form.TprIndex}
                onChange={e => setForm({ ...form, TprIndex: parseInt(e.target.value) || 0 })}
              />
            </div>

            <div className={styles.formGroup} style={{ gridColumn: 'span 2' }}>
              <label>Remarks</label>
              <input
                type="text"
                placeholder="e.g. Normal values vary with age/sex"
                value={form.TprRemark}
                onChange={e => setForm({ ...form, TprRemark: e.target.value })}
              />
            </div>

            <div className={styles.formGroup} style={{ flexDirection: 'row', alignItems: 'center', gap: '8px', alignSelf: 'center', marginTop: '20px' }}>
              <input
                id="TprShowInList"
                type="checkbox"
                style={{ width: 'auto' }}
                checked={form.TprShowInList}
                onChange={e => setForm({ ...form, TprShowInList: e.target.checked })}
              />
              <label htmlFor="TprShowInList" style={{ cursor: 'pointer', margin: 0 }}>
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
