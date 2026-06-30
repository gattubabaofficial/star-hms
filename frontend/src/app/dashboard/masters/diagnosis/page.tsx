'use client';
import React, { useState, useEffect, useRef } from 'react';
import { useRouter } from 'next/navigation';
import styles from '../../../dashboard.module.css';
import ActionBar from '../components/ActionBar';
import { Search, AlertCircle, Check } from 'lucide-react';

interface Diagnosis {
  dig_code: number;
  dig_name: string;
  dig_rec_state: number;
}

interface DiagnosisService {
  sno: number;
  srv_name: string;
  unit: number;
  rate: number;
}

const API = process.env.NEXT_PUBLIC_API_URL || 'http://localhost:8000';
const getToken = () => typeof window !== 'undefined' ? localStorage.getItem('token') : '';
const authHdr = () => ({ 'Content-Type': 'application/json', Authorization: `Bearer ${getToken()}` });

export default function DiagnosisMasterPage() {
  const router = useRouter();

  // State variables
  const [items, setItems] = useState<Diagnosis[]>([]);
  const [search, setSearch] = useState('');
  const [selectedId, setSelectedId] = useState<number | null>(null);
  const [entryMode, setEntryMode] = useState(false); // false = Summary, true = Detail
  const [editing, setEditing] = useState<Diagnosis | null>(null);

  const [form, setForm] = useState({ dig_name: '' });
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');
  const [success, setSuccess] = useState('');

  // Sub-services grid state (Mfgrd2 mocks)
  const [subServices, setSubServices] = useState<DiagnosisService[]>([
    { sno: 1, srv_name: 'Standard Diagnosis Consultation', unit: 1, rate: 350.00 }
  ]);
  const [rowEditor, setRowEditor] = useState({
    sno: 2,
    srv_name: '',
    unit: '1',
    rate: '0.00'
  });
  const [editingRowIndex, setEditingRowIndex] = useState<number | null>(null);

  // Refs
  const nameInputRef = useRef<HTMLInputElement>(null);
  const searchInputRef = useRef<HTMLInputElement>(null);

  // Load diagnoses
  const loadData = async () => {
    try {
      const r = await fetch(`${API}/api/masters/diagnoses`);
      if (r.ok) {
        const data = await r.json();
        setItems(data);
        if (data.length > 0) {
          setSelectedId(prev => {
            const exists = data.some((item: Diagnosis) => item.dig_code === prev);
            return exists ? prev : data[0].dig_code;
          });
        } else {
          setSelectedId(null);
        }
      }
    } catch (e) {
      console.error('Error loading diagnoses:', e);
    }
  };

  useEffect(() => {
    loadData();
  }, []);

  // Set focus automatically when entering detail mode
  useEffect(() => {
    if (entryMode && nameInputRef.current) {
      nameInputRef.current.focus();
    } else if (!entryMode && searchInputRef.current) {
      searchInputRef.current.focus();
    }
  }, [entryMode]);

  // Keyboard navigation for summary table
  useEffect(() => {
    const handleTableKeys = (e: KeyboardEvent) => {
      if (entryMode || items.length === 0) return;

      const filtered = items.filter(i =>
        i.dig_name.toLowerCase().includes(search.toLowerCase())
      );
      if (filtered.length === 0) return;

      const currentIndex = filtered.findIndex(i => i.dig_code === selectedId);

      if (e.key === 'ArrowDown') {
        e.preventDefault();
        const nextIndex = (currentIndex + 1) % filtered.length;
        setSelectedId(filtered[nextIndex].dig_code);
      } else if (e.key === 'ArrowUp') {
        e.preventDefault();
        const prevIndex = (currentIndex - 1 + filtered.length) % filtered.length;
        setSelectedId(filtered[prevIndex].dig_code);
      }
    };

    window.addEventListener('keydown', handleTableKeys);
    return () => window.removeEventListener('keydown', handleTableKeys);
  }, [entryMode, items, selectedId, search]);

  // Actions
  const handleAdd = () => {
    setEditing(null);
    setForm({ dig_name: '' });
    setSubServices([
      { sno: 1, srv_name: 'Diagnostic Blood Test Panel', unit: 1, rate: 450.00 }
    ]);
    setRowEditor({ sno: 2, srv_name: '', unit: '1', rate: '0.00' });
    setEditingRowIndex(null);
    setError('');
    setSuccess('');
    setEntryMode(true);
  };

  const handleEdit = () => {
    const item = items.find(i => i.dig_code === selectedId);
    if (!item) return;

    setEditing(item);
    setForm({ dig_name: item.dig_name });
    // Populate some mock diagnosis services depending on code
    setSubServices([
      { sno: 1, srv_name: 'Clinical Assessment', unit: 1, rate: 300.00 },
      { sno: 2, srv_name: 'Lab Report Analysis', unit: 1, rate: 150.00 }
    ]);
    setRowEditor({ sno: 3, srv_name: '', unit: '1', rate: '0.00' });
    setEditingRowIndex(null);
    setError('');
    setSuccess('');
    setEntryMode(true);
  };

  const handleDelete = async () => {
    if (!selectedId) return;
    const item = items.find(i => i.dig_code === selectedId);
    if (!item) return;

    if (!confirm(`Delete diagnosis "${item.dig_name}"?`)) return;

    try {
      const r = await fetch(`${API}/api/masters/diagnoses/${selectedId}`, {
        method: 'DELETE',
        headers: authHdr()
      });
      if (!r.ok) throw new Error('Failed to delete');
      loadData();
    } catch (e: any) {
      alert(e.message);
    }
  };

  const handleRefresh = () => {
    loadData();
  };

  const handleExit = () => {
    if (entryMode) {
      setEntryMode(false);
      setEditing(null);
    } else {
      router.push('/dashboard/masters');
    }
  };

  // Add/Update row in local Mfgrd2 sub-grid
  const handleAddSubService = (e: React.MouseEvent) => {
    e.preventDefault();
    if (!rowEditor.srv_name.trim()) return;

    const rateVal = parseFloat(rowEditor.rate) || 0;
    const unitVal = parseInt(rowEditor.unit) || 1;

    if (editingRowIndex !== null) {
      // Edit mode
      setSubServices(prev => prev.map((item, idx) =>
        idx === editingRowIndex
          ? { ...item, srv_name: rowEditor.srv_name, unit: unitVal, rate: rateVal }
          : item
      ));
      setEditingRowIndex(null);
    } else {
      // Add mode
      setSubServices(prev => [
        ...prev,
        { sno: prev.length + 1, srv_name: rowEditor.srv_name, unit: unitVal, rate: rateVal }
      ]);
    }

    // Reset row editor
    setRowEditor(prev => ({
      sno: subServices.length + (editingRowIndex !== null ? 1 : 2),
      srv_name: '',
      unit: '1',
      rate: '0.00'
    }));
  };

  const handleSelectSubRow = (idx: number) => {
    const r = subServices[idx];
    setRowEditor({
      sno: r.sno,
      srv_name: r.srv_name,
      unit: r.unit.toString(),
      rate: r.rate.toFixed(2)
    });
    setEditingRowIndex(idx);
  };

  const handleSave = async (e?: React.FormEvent) => {
    if (e) e.preventDefault();

    // Validations
    if (!form.dig_name.trim()) {
      setError('Invalid Diagnosis Description !!!');
      nameInputRef.current?.focus();
      return;
    }

    setLoading(true);
    setError('');
    setSuccess('');

    try {
      const body = {
        dig_name: form.dig_name.trim(),
        dig_rec_state: 1
      };

      const url = editing
        ? `${API}/api/masters/diagnoses/${editing.dig_code}`
        : `${API}/api/masters/diagnoses`;
      const method = editing ? 'PUT' : 'POST';

      const r = await fetch(url, {
        method,
        headers: authHdr(),
        body: JSON.stringify(body)
      });
      if (!r.ok) throw new Error(await r.text());

      setSuccess(editing ? 'Updated successfully' : 'Created successfully');
      loadData();
      setTimeout(() => {
        setEntryMode(false);
        setEditing(null);
      }, 800);
    } catch (e: any) {
      setError(e.message || 'Error occurred during save');
    } finally {
      setLoading(false);
    }
  };

  // Handle PageDown hotkey inside detail view form to save
  useEffect(() => {
    const handleFormKeys = (e: KeyboardEvent) => {
      if (!entryMode) return;
      if (e.key === 'PageDown') {
        e.preventDefault();
        handleSave();
      }
    };
    window.addEventListener('keydown', handleFormKeys);
    return () => window.removeEventListener('keydown', handleFormKeys);
  }, [entryMode, form, editing, items]);

  const filtered = items.filter(i =>
    i.dig_name.toLowerCase().includes(search.toLowerCase())
  );

  return (
    <div style={{ display: 'flex', flexDirection: 'column', minHeight: 'calc(100vh - 140px)', justifyContent: 'space-between' }}>
      
      <div>
        {/* Legacy Form Title Label */}
        <div style={{
          backgroundColor: '#e0e0e0',
          padding: '10px',
          border: '1px solid #94a3b8',
          textAlign: 'center',
          fontWeight: 700,
          fontSize: '15px',
          fontFamily: 'Outfit, sans-serif',
          color: '#0f172a',
          marginBottom: '24px',
          borderRadius: '4px'
        }}>
          Diagnostic Master [frmDiagnosticMast]
        </div>

        {/* SUMMARY MODE */}
        {!entryMode && (
          <div className={styles.sectionBox}>
            <div className={styles.sectionHeader}>
              <h3 className={styles.sectionTitle}>Summary</h3>
            </div>

            {/* Search Frame */}
            <div className={styles.toolbar} style={{ marginBottom: '16px' }}>
              <div className={styles.searchBar}>
                <Search size={18} style={{ color: 'var(--text-muted)' }} />
                <input
                  ref={searchInputRef}
                  value={search}
                  onChange={e => {
                    setSearch(e.target.value);
                    const matching = items.filter(i => i.dig_name.toLowerCase().includes(e.target.value.toLowerCase()));
                    if (matching.length > 0 && !matching.some(m => m.dig_code === selectedId)) {
                      setSelectedId(matching[0].dig_code);
                    }
                  }}
                  placeholder="Search diagnoses (txtSearch1Text)..."
                />
              </div>
            </div>

            {/* Table Grid (Mfgrd1) */}
            <div className={styles.tableContainer}>
              <table className={styles.table}>
                <thead>
                  <tr>
                    <th style={{ width: '80px' }}>Code</th>
                    <th>Diagnosis Description / Name</th>
                  </tr>
                </thead>
                <tbody>
                  {filtered.length === 0 && (
                    <tr>
                      <td colSpan={2} style={{ textAlign: 'center', padding: '40px', color: 'var(--text-secondary)' }}>
                        No diagnostic descriptions found
                      </td>
                    </tr>
                  )}
                  {filtered.map((item) => (
                    <tr
                      key={item.dig_code}
                      onClick={() => setSelectedId(item.dig_code)}
                      onDoubleClick={handleEdit}
                      style={{
                        cursor: 'pointer',
                        backgroundColor: selectedId === item.dig_code ? 'var(--accent-light)' : 'transparent',
                        fontWeight: selectedId === item.dig_code ? 600 : 400
                      }}
                    >
                      <td style={{ color: selectedId === item.dig_code ? 'var(--accent-color)' : 'var(--text-secondary)' }}>
                        #{item.dig_code}
                      </td>
                      <td>{item.dig_name}</td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          </div>
        )}

        {/* DETAIL MODE */}
        {entryMode && (
          <div className={styles.sectionBox}>
            <div className={styles.sectionHeader}>
              <h3 className={styles.sectionTitle}>Detail [Mode: {editing ? 'Edit' : 'Add'}]</h3>
            </div>

            <form onSubmit={handleSave}>
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

              {/* Code & Diagnosis Name Frame (frHeader) */}
              <div style={{ border: '1px solid var(--border-light)', padding: '16px', borderRadius: '8px', marginBottom: '24px', backgroundColor: 'rgba(0,0,0,0.01)' }}>
                <div className={styles.formGrid}>
                  {/* Code (mskFormBoundField) */}
                  <div className={styles.formGroup}>
                    <label>Code (mskFormBoundField)</label>
                    <input
                      className={styles.formControl}
                      value={editing ? editing.dig_code : '-1'}
                      disabled
                      style={{ backgroundColor: 'var(--bg-secondary)', fontWeight: 700 }}
                    />
                  </div>

                  {/* Diagnosis Name (txtDigName) */}
                  <div className={styles.formGroup} style={{ flex: 3 }}>
                    <label>Diagnosis Description / Name (txtDigName) *</label>
                    <input
                      ref={nameInputRef}
                      className={styles.formControl}
                      value={form.dig_name}
                      onChange={e => setForm({ dig_name: e.target.value })}
                      maxLength={100}
                      required
                      placeholder="Enter Diagnosis Name"
                    />
                  </div>
                </div>
              </div>

              {/* Sub-Services Table Grid & Row Editor (Mfgrd2 mocks) */}
              <div style={{ border: '1px solid var(--border-light)', padding: '16px', borderRadius: '8px', marginBottom: '24px' }}>
                <div style={{ fontWeight: 700, fontSize: '13px', marginBottom: '16px', color: 'var(--text-primary)' }}>Diagnosis Services Rate Schedule (Mfgrd2)</div>
                
                {/* Row Editor for sub-services */}
                <div style={{ display: 'flex', gap: '12px', flexWrap: 'wrap', alignItems: 'flex-end', marginBottom: '16px', backgroundColor: 'var(--bg-secondary)', padding: '12px', borderRadius: '6px', border: '1px dashed var(--border-light)' }}>
                  
                  {/* Sno */}
                  <div style={{ width: '50px' }}>
                    <label style={{ fontSize: '11px', fontWeight: 600, display: 'block', marginBottom: '4px' }}>Sno</label>
                    <input
                      className={styles.formControl}
                      value={rowEditor.sno}
                      disabled
                      style={{ height: '30px', textAlign: 'center', backgroundColor: '#e2e8f0' }}
                    />
                  </div>

                  {/* Service Name Lookup (txtSrvName) */}
                  <div style={{ flex: 2, minWidth: '200px' }}>
                    <label style={{ fontSize: '11px', fontWeight: 600, display: 'block', marginBottom: '4px' }}>Service Name (txtSrvName)</label>
                    <input
                      className={styles.formControl}
                      value={rowEditor.srv_name}
                      onChange={e => setRowEditor(prev => ({ ...prev, srv_name: e.target.value }))}
                      placeholder="e.g. Consultation / Clinical Scan"
                      style={{ height: '30px' }}
                    />
                  </div>

                  {/* Unit (mskDsmUnit) */}
                  <div style={{ width: '80px' }}>
                    <label style={{ fontSize: '11px', fontWeight: 600, display: 'block', marginBottom: '4px' }}>Unit (mskDsmUnit)</label>
                    <input
                      type="number"
                      min="1"
                      className={styles.formControl}
                      value={rowEditor.unit}
                      onChange={e => setRowEditor(prev => ({ ...prev, unit: e.target.value }))}
                      style={{ height: '30px', textAlign: 'right' }}
                    />
                  </div>

                  {/* Rate (mskDsmRate) */}
                  <div style={{ width: '120px' }}>
                    <label style={{ fontSize: '11px', fontWeight: 600, display: 'block', marginBottom: '4px' }}>Rate (mskDsmRate)</label>
                    <input
                      type="number"
                      min="0"
                      step="0.01"
                      className={styles.formControl}
                      value={rowEditor.rate}
                      onChange={e => setRowEditor(prev => ({ ...prev, rate: e.target.value }))}
                      style={{ height: '30px', textAlign: 'right' }}
                    />
                  </div>

                  {/* OK / Add button (cmdOK) */}
                  <div>
                    <button
                      type="button"
                      onClick={handleAddSubService}
                      className={styles.primaryBtn}
                      style={{ height: '30px', padding: '0 16px', display: 'flex', alignItems: 'center' }}
                    >
                      {editingRowIndex !== null ? 'OK (cmdOK)' : 'Add (cmdOK)'}
                    </button>
                  </div>
                </div>

                {/* Sub services list table */}
                <div className={styles.tableContainer} style={{ maxHeight: '200px', overflowY: 'auto' }}>
                  <table className={styles.table} style={{ fontSize: '13px' }}>
                    <thead>
                      <tr style={{ backgroundColor: 'var(--bg-secondary)' }}>
                        <th style={{ width: '50px', textAlign: 'center' }}>Sno</th>
                        <th>Service Name</th>
                        <th style={{ width: '100px', textAlign: 'right' }}>Unit</th>
                        <th style={{ width: '150px', textAlign: 'right' }}>Rate (₹)</th>
                      </tr>
                    </thead>
                    <tbody>
                      {subServices.length === 0 && (
                        <tr>
                          <td colSpan={4} style={{ textAlign: 'center', padding: '16px', color: 'var(--text-secondary)' }}>
                            No service rates assigned
                          </td>
                        </tr>
                      )}
                      {subServices.map((r, index) => (
                        <tr
                          key={index}
                          onClick={() => handleSelectSubRow(index)}
                          style={{
                            cursor: 'pointer',
                            backgroundColor: editingRowIndex === index ? 'var(--accent-light)' : 'transparent',
                            fontWeight: editingRowIndex === index ? 600 : 400
                          }}
                        >
                          <td style={{ textAlign: 'center' }}>{r.sno}</td>
                          <td>{r.srv_name}</td>
                          <td style={{ textAlign: 'right' }}>{r.unit}</td>
                          <td style={{ textAlign: 'right', fontWeight: 700 }}>{r.rate.toFixed(2)}</td>
                        </tr>
                      ))}
                    </tbody>
                  </table>
                </div>
              </div>

              <div style={{ fontSize: '11px', color: 'var(--text-secondary)', marginTop: '20px', fontStyle: 'italic' }}>
                Tip: Press <strong>PageDown</strong> on your keyboard to Save
              </div>

              {/* Form Buttons */}
              <div style={{ display: 'flex', justifyContent: 'flex-end', gap: '12px', marginTop: '24px' }}>
                <button type="button" className={styles.secondaryBtn} onClick={handleExit}>Cancel</button>
                <button type="submit" className={styles.primaryBtn} disabled={loading}>
                  {loading ? 'Saving…' : 'Save'}
                </button>
              </div>
            </form>
          </div>
        )}
      </div>

      {/* Action Button Bar */}
      <ActionBar
        onAdd={handleAdd}
        onEdit={handleEdit}
        onRefresh={handleRefresh}
        onDelete={handleDelete}
        onExit={handleExit}
        isEditing={entryMode}
        hasSelected={selectedId !== null}
        disabledActions={['print-voucher', 'print-report', 'export-excel', 'configure']}
      />

    </div>
  );
}
