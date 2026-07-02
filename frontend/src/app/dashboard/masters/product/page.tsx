'use client';
import React, { useState, useEffect, useRef } from 'react';
import { useRouter } from 'next/navigation';
import styles from '../../../dashboard.module.css';
import ActionBar from '../components/ActionBar';
import { Search, AlertCircle, Check } from 'lucide-react';

interface ProductGroup { sig_code: number; sig_name: string; }
interface Product {
  sim_code: number;
  sim_name: string;
  sim_desc?: string;
  sim_sig_code: number;
  sim_purch_rate: number;
  sim_mrp_rate: number;
  sim_sale_rate: number;
  sim_rec_state: number;
  group?: ProductGroup | null;
}

const API = process.env.NEXT_PUBLIC_API_URL || 'http://localhost:8000';
const getToken = () => typeof window !== 'undefined' ? localStorage.getItem('token') : '';
const authHdr = () => ({ 'Content-Type': 'application/json', Authorization: `Bearer ${getToken()}` });

const blankForm = {
  sim_name: '',
  sim_desc: '',
  sim_sig_code: '',
  sim_purch_rate: '0',
  sim_mrp_rate: '0',
  sim_sale_rate: '0',
};

export default function ProductMasterPage() {
  const router = useRouter();

  // State variables
  const [items, setItems] = useState<Product[]>([]);
  const [groups, setGroups] = useState<ProductGroup[]>([]);
  const [search, setSearch] = useState('');
  const [selectedId, setSelectedId] = useState<number | null>(null);
  const [entryMode, setEntryMode] = useState(false); // false = Summary view, true = Detail view
  const [editing, setEditing] = useState<Product | null>(null);

  const [form, setForm] = useState(blankForm);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');
  const [success, setSuccess] = useState('');

  // Refs
  const nameInputRef = useRef<HTMLInputElement>(null);
  const searchInputRef = useRef<HTMLInputElement>(null);

  // Load products and groups
  const loadData = async () => {
    try {
      const [ptRes, pgRes] = await Promise.all([
        fetch(`${API}/api/masters/products`),
        fetch(`${API}/api/masters/product-groups`)
      ]);

      if (pgRes.ok) setGroups(await pgRes.json());

      if (ptRes.ok) {
        const data = await ptRes.json();
        setItems(data);
        if (data.length > 0) {
          setSelectedId(prev => {
            const exists = data.some((item: Product) => item.sim_code === prev);
            return exists ? prev : data[0].sim_code;
          });
        } else {
          setSelectedId(null);
        }
      }
    } catch (e) {
      console.error('Error loading product data:', e);
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
        i.sim_name.toLowerCase().includes(search.toLowerCase()) ||
        (i.group?.sig_name ?? '').toLowerCase().includes(search.toLowerCase())
      );
      if (filtered.length === 0) return;

      const currentIndex = filtered.findIndex(i => i.sim_code === selectedId);

      if (e.key === 'ArrowDown') {
        e.preventDefault();
        const nextIndex = (currentIndex + 1) % filtered.length;
        setSelectedId(filtered[nextIndex].sim_code);
      } else if (e.key === 'ArrowUp') {
        e.preventDefault();
        const prevIndex = (currentIndex - 1 + filtered.length) % filtered.length;
        setSelectedId(filtered[prevIndex].sim_code);
      }
    };

    window.addEventListener('keydown', handleTableKeys);
    return () => window.removeEventListener('keydown', handleTableKeys);
  }, [entryMode, items, selectedId, search]);

  // Actions
  const handleAdd = () => {
    setEditing(null);
    setForm({
      ...blankForm,
      sim_sig_code: groups[0]?.sig_code?.toString() ?? '',
    });
    setError('');
    setSuccess('');
    setEntryMode(true);
  };

  const handleEdit = () => {
    const item = items.find(i => i.sim_code === selectedId);
    if (!item) return;

    setEditing(item);
    setForm({
      sim_name: item.sim_name,
      sim_desc: item.sim_desc || '',
      sim_sig_code: item.sim_sig_code.toString(),
      sim_purch_rate: item.sim_purch_rate.toString(),
      sim_mrp_rate: item.sim_mrp_rate.toString(),
      sim_sale_rate: item.sim_sale_rate.toString(),
    });
    setError('');
    setSuccess('');
    setEntryMode(true);
  };

  const handleDelete = async () => {
    if (!selectedId) return;
    const item = items.find(i => i.sim_code === selectedId);
    if (!item) return;

    if (!confirm(`Delete product "${item.sim_name}"?`)) return;

    try {
      const r = await fetch(`${API}/api/masters/products/${selectedId}`, {
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

  const handleSave = async (e?: React.FormEvent) => {
    if (e) e.preventDefault();

    // Validations
    if (!form.sim_name.trim()) {
      setError('Invalid Product Name !!!');
      nameInputRef.current?.focus();
      return;
    }

    if (!form.sim_sig_code) {
      setError('Product Group is required !!!');
      return;
    }

    const purchVal = parseFloat(form.sim_purch_rate);
    const mrpVal = parseFloat(form.sim_mrp_rate);
    const saleVal = parseFloat(form.sim_sale_rate);

    if (isNaN(purchVal) || purchVal < 0 || isNaN(mrpVal) || mrpVal < 0 || isNaN(saleVal) || saleVal < 0) {
      setError('Invalid Rate/MRP Value !!!');
      return;
    }

    setLoading(true);
    setError('');
    setSuccess('');

    try {
      const body = {
        sim_name: form.sim_name.trim(),
        sim_desc: form.sim_desc.trim() || null,
        sim_sig_code: parseInt(form.sim_sig_code),
        sim_purch_rate: purchVal,
        sim_mrp_rate: mrpVal,
        sim_sale_rate: saleVal,
        sim_rec_state: 1,
      };

      const url = editing
        ? `${API}/api/masters/products/${editing.sim_code}`
        : `${API}/api/masters/products`;
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
    i.sim_name.toLowerCase().includes(search.toLowerCase()) ||
    (i.group?.sig_name ?? '').toLowerCase().includes(search.toLowerCase())
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
          Product Master [frmSubItMst]
        </div>

        {/* SUMMARY MODE (frFormSmry) */}
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
                    const matching = items.filter(i =>
                      i.sim_name.toLowerCase().includes(e.target.value.toLowerCase()) ||
                      (i.group?.sig_name ?? '').toLowerCase().includes(e.target.value.toLowerCase())
                    );
                    if (matching.length > 0 && !matching.some(m => m.sim_code === selectedId)) {
                      setSelectedId(matching[0].sim_code);
                    }
                  }}
                  placeholder="Search products (txtSearch)..."
                />
              </div>
            </div>

            {/* Table Grid (Mfgrd1) */}
            <div className={styles.tableContainer}>
              <table className={styles.table}>
                <thead>
                  <tr>
                    <th style={{ width: '80px' }}>Code</th>
                    <th>Product Name</th>
                    <th>Group</th>
                    <th>Purch. Rate (₹)</th>
                    <th>MRP (₹)</th>
                    <th>Sale Rate (₹)</th>
                  </tr>
                </thead>
                <tbody>
                  {filtered.length === 0 && (
                    <tr>
                      <td colSpan={6} style={{ textAlign: 'center', padding: '40px', color: 'var(--text-secondary)' }}>
                        No products found
                      </td>
                    </tr>
                  )}
                  {filtered.map((item) => (
                    <tr
                      key={item.sim_code}
                      onClick={() => setSelectedId(item.sim_code)}
                      onDoubleClick={handleEdit}
                      style={{
                        cursor: 'pointer',
                        backgroundColor: selectedId === item.sim_code ? 'var(--accent-light)' : 'transparent',
                        fontWeight: selectedId === item.sim_code ? 600 : 400
                      }}
                    >
                      <td style={{ color: selectedId === item.sim_code ? 'var(--accent-color)' : 'var(--text-secondary)' }}>
                        #{item.sim_code}
                      </td>
                      <td>{item.sim_name}</td>
                      <td>{item.group?.sig_name || '—'}</td>
                      <td>{item.sim_purch_rate.toFixed(2)}</td>
                      <td style={{ fontWeight: 700 }}>{item.sim_mrp_rate.toFixed(2)}</td>
                      <td style={{ fontWeight: 700 }}>{item.sim_sale_rate.toFixed(2)}</td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          </div>
        )}

        {/* DETAIL MODE (frFormDtl) */}
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

              <div className={styles.formGrid}>
                {/* Code (mskFormBoundField) - read-only */}
                <div className={styles.formGroup} style={{ maxWidth: '200px' }}>
                  <label>Code (mskFormBoundField)</label>
                  <input
                    className={styles.formControl}
                    value={editing ? editing.sim_code : '-1'}
                    disabled
                    style={{ backgroundColor: 'var(--bg-secondary)', fontWeight: 700 }}
                  />
                </div>

                {/* Product Name (txtSimName) */}
                <div className={styles.formGroup} style={{ flex: 2 }}>
                  <label htmlFor="sim_name">Product Name (txtSimName) *</label>
                  <input
                    id="sim_name"
                    ref={nameInputRef}
                    className={styles.formControl}
                    value={form.sim_name}
                    onChange={e => setForm(f => ({ ...f, sim_name: e.target.value }))}
                    maxLength={50}
                    required
                    placeholder="Enter Product Name"
                  />
                </div>
              </div>

              <div className={styles.formGrid}>
                {/* Product Group */}
                <div className={styles.formGroup}>
                  <label htmlFor="sim_sig_code">Product Group (txtSigName) *</label>
                  <select
                    id="sim_sig_code"
                    className={styles.formControl}
                    value={form.sim_sig_code}
                    onChange={e => setForm(f => ({ ...f, sim_sig_code: e.target.value }))}
                    required
                  >
                    <option value="">— Select Group —</option>
                    {groups.map(g => (
                      <option key={g.sig_code} value={g.sig_code}>{g.sig_name}</option>
                    ))}
                  </select>
                </div>

                {/* Description */}
                <div className={styles.formGroup}>
                  <label htmlFor="sim_desc">Description (txtSimDesc)</label>
                  <input
                    id="sim_desc"
                    className={styles.formControl}
                    value={form.sim_desc}
                    onChange={e => setForm(f => ({ ...f, sim_desc: e.target.value }))}
                    maxLength={50}
                    placeholder="Optional Description"
                  />
                </div>
              </div>

              <div className={styles.formGrid}>
                {/* Purchase Rate */}
                <div className={styles.formGroup}>
                  <label htmlFor="sim_purch_rate">Purchase Rate (mskSimPurchRate)</label>
                  <input
                    id="sim_purch_rate"
                    type="number"
                    min="0"
                    step="0.01"
                    className={styles.formControl}
                    value={form.sim_purch_rate}
                    onChange={e => setForm(f => ({ ...f, sim_purch_rate: e.target.value }))}
                  />
                </div>

                {/* MRP Rate */}
                <div className={styles.formGroup}>
                  <label htmlFor="sim_mrp_rate">MRP Rate (mskSimMRPRate)</label>
                  <input
                    id="sim_mrp_rate"
                    type="number"
                    min="0"
                    step="0.01"
                    className={styles.formControl}
                    value={form.sim_mrp_rate}
                    onChange={e => setForm(f => ({ ...f, sim_mrp_rate: e.target.value }))}
                  />
                </div>

                {/* Sale Rate */}
                <div className={styles.formGroup}>
                  <label htmlFor="sim_sale_rate">Sale Rate (mskSimSaleRate)</label>
                  <input
                    id="sim_sale_rate"
                    type="number"
                    min="0"
                    step="0.01"
                    className={styles.formControl}
                    value={form.sim_sale_rate}
                    onChange={e => setForm(f => ({ ...f, sim_sale_rate: e.target.value }))}
                  />
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
