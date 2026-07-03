'use client';
import React, { useState, useEffect, useRef } from 'react';
import { useRouter } from 'next/navigation';
import styles from '../../../dashboard.module.css';
import ActionBar from '../components/ActionBar';
import { Search, AlertCircle, Check } from 'lucide-react';

interface Product {
  ItmCode: number;
  ItmName: string;
  ItmDesc?: string;
  ItmDepends?: number;
  ItmRecState: number;
}

const API = process.env.NEXT_PUBLIC_API_URL || 'http://localhost:8000';
const getToken = () => typeof window !== 'undefined' ? localStorage.getItem('token') : '';
const authHdr = () => ({ 'Content-Type': 'application/json', Authorization: `Bearer ${getToken()}` });

const blankForm = {
  ItmName: '',
  ItmDesc: '',
  ItmDepends: '',
};

export default function StandardProductMasterPage() {
  const router = useRouter();

  const [items, setItems] = useState<Product[]>([]);
  const [search, setSearch] = useState('');
  const [selectedId, setSelectedId] = useState<number | null>(null);
  const [entryMode, setEntryMode] = useState(false);
  const [editing, setEditing] = useState<Product | null>(null);

  const [form, setForm] = useState(blankForm);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');
  const [success, setSuccess] = useState('');

  const nameInputRef = useRef<HTMLInputElement>(null);
  const searchInputRef = useRef<HTMLInputElement>(null);

  const loadData = async () => {
    try {
      const res = await fetch(`${API}/api/drugstock/products`, {
        headers: authHdr(),
      });
      if (res.ok) {
        const data = await res.json();
        setItems(data);
        if (data.length > 0) {
          setSelectedId(prev => {
            const exists = data.some((item: Product) => item.ItmCode === prev);
            return exists ? prev : data[0].ItmCode;
          });
        } else {
          setSelectedId(null);
        }
      }
    } catch (e) {
      console.error('Error loading standard product data:', e);
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
        i.ItmName.toLowerCase().includes(search.toLowerCase()) ||
        (i.ItmDesc ?? '').toLowerCase().includes(search.toLowerCase())
      );
      if (filtered.length === 0) return;

      const currentIndex = filtered.findIndex(i => i.ItmCode === selectedId);

      if (e.key === 'ArrowDown') {
        e.preventDefault();
        const nextIndex = (currentIndex + 1) % filtered.length;
        setSelectedId(filtered[nextIndex].ItmCode);
      } else if (e.key === 'ArrowUp') {
        e.preventDefault();
        const prevIndex = (currentIndex - 1 + filtered.length) % filtered.length;
        setSelectedId(filtered[prevIndex].ItmCode);
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
    const item = items.find(i => i.ItmCode === selectedId);
    if (!item) return;
    setEditing(item);
    setForm({
      ItmName: item.ItmName,
      ItmDesc: item.ItmDesc ?? '',
      ItmDepends: item.ItmDepends?.toString() ?? '',
    });
    setError('');
    setSuccess('');
    setEntryMode(true);
  };

  const handleDelete = async () => {
    if (selectedId === null) return;
    const item = items.find(i => i.ItmCode === selectedId);
    if (!item || !confirm(`Delete product "${item.ItmName}"?`)) return;

    try {
      const res = await fetch(`${API}/api/drugstock/products/${selectedId}`, {
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
      setError('Error deleting product');
    }
  };

  const handleSave = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!form.ItmName.trim()) {
      setError('Product Name is required');
      return;
    }

    setLoading(true);
    setError('');
    setSuccess('');

    try {
      const payload = {
        ItmName: form.ItmName.trim(),
        ItmDesc: form.ItmDesc.trim() || null,
        ItmDepends: form.ItmDepends ? parseInt(form.ItmDepends) : null,
        ItmRecState: 1,
      };

      const url = editing
        ? `${API}/api/drugstock/products/${editing.ItmCode}`
        : `${API}/api/drugstock/products`;

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
      setSelectedId(saved.ItmCode);
      setTimeout(() => setEntryMode(false), 800);
    } catch (e: any) {
      setError(e.message || 'Error saving product');
    } finally {
      setLoading(false);
    }
  };

  const filtered = items.filter(i =>
    i.ItmName.toLowerCase().includes(search.toLowerCase()) ||
    (i.ItmDesc ?? '').toLowerCase().includes(search.toLowerCase())
  );

  const selectedItem = items.find(i => i.ItmCode === selectedId);

  return (
    <div className={styles.container}>
      <div className={styles.header}>
        <div>
          <h1 className={styles.title}>Standard Product Master</h1>
          <p className={styles.subtitle}>Manage standard stock items [ProdMast.frm]</p>
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
              placeholder="Search by name or description..."
            />
          </div>

          <div className={styles.tableContainer}>
            <table className={styles.table}>
              <thead>
                <tr>
                  <th style={{ width: '80px' }}>Code</th>
                  <th>Product Name</th>
                  <th>Description</th>
                </tr>
              </thead>
              <tbody>
                {filtered.length === 0 ? (
                  <tr>
                    <td colSpan={3} className={styles.emptyCell}>
                      No standard products found
                    </td>
                  </tr>
                ) : (
                  filtered.map(item => (
                    <tr
                      key={item.ItmCode}
                      onClick={() => setSelectedId(item.ItmCode)}
                      onDoubleClick={handleEdit}
                      className={selectedId === item.ItmCode ? styles.selectedRow : ''}
                      style={{ cursor: 'pointer' }}
                    >
                      <td style={{ fontWeight: 600, color: 'var(--accent-color)' }}>
                        #{item.ItmCode}
                      </td>
                      <td style={{ fontWeight: 600 }}>{item.ItmName}</td>
                      <td>{item.ItmDesc || '-'}</td>
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
            {editing ? `Edit Product #${editing.ItmCode}` : 'New Standard Product'}
          </h2>
          <form id="standard-product-form" onSubmit={handleSave} className={styles.gridForm}>
            <div className={styles.formGroup} style={{ gridColumn: 'span 2' }}>
              <label className={styles.requiredLabel}>Product Name</label>
              <input
                ref={nameInputRef}
                value={form.ItmName}
                onChange={e => setForm({ ...form, ItmName: e.target.value })}
                maxLength={50}
                required
                placeholder="e.g., Crocin 650mg"
              />
            </div>

            <div className={styles.formGroup} style={{ gridColumn: 'span 2' }}>
              <label>Description</label>
              <input
                value={form.ItmDesc}
                onChange={e => setForm({ ...form, ItmDesc: e.target.value })}
                maxLength={50}
                placeholder="e.g., Acetaminophen / Paracetamol pain reliever"
              />
            </div>

            <div className={styles.formGroup}>
              <label>Depends On (Code)</label>
              <input
                type="number"
                value={form.ItmDepends}
                onChange={e => setForm({ ...form, ItmDepends: e.target.value })}
                placeholder="e.g., Parent product code"
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
