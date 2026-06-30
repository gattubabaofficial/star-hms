'use client';
import React, { useState, useEffect, useRef } from 'react';
import { useRouter } from 'next/navigation';
import styles from '../../../../dashboard.module.css';
import ActionBar from '../../components/ActionBar';
import { Search, AlertCircle, Check } from 'lucide-react';

interface Department { pdp_code: number; pdp_name: string; }
interface Designation { pdn_code: number; pdn_name: string; }
interface Employee {
  pem_code: number;
  pem_title?: string;
  pem_name: string;
  pem_dept_code?: number;
  pem_desn_code?: number;
  pem_gender?: string;
  pem_dob?: string;
  pem_doj?: string;
  pem_phone?: string;
  pem_email?: string;
  pem_address?: string;
  pem_basic_salary?: number;
  department?: Department | null;
  designation?: Designation | null;
}

const API = process.env.NEXT_PUBLIC_API_URL || 'http://localhost:8000';
const getToken = () => typeof window !== 'undefined' ? localStorage.getItem('token') : '';
const authHdr = () => ({ 'Content-Type': 'application/json', Authorization: `Bearer ${getToken()}` });

const blankForm = {
  pem_title: 'Mr.',
  pem_name: '',
  pem_dept_code: '',
  pem_desn_code: '',
  pem_gender: 'Male',
  pem_dob: '',
  pem_doj: '',
  pem_phone: '',
  pem_email: '',
  pem_address: '',
  pem_basic_salary: '0',
};

export default function EmployeeMasterPage() {
  const router = useRouter();

  // State variables
  const [items, setItems] = useState<Employee[]>([]);
  const [departments, setDepartments] = useState<Department[]>([]);
  const [designations, setDesignations] = useState<Designation[]>([]);
  const [search, setSearch] = useState('');
  const [selectedId, setSelectedId] = useState<number | null>(null);
  const [entryMode, setEntryMode] = useState(false); // false = Summary view, true = Detail view
  const [editing, setEditing] = useState<Employee | null>(null);

  const [form, setForm] = useState(blankForm);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');
  const [success, setSuccess] = useState('');

  // Refs
  const nameInputRef = useRef<HTMLInputElement>(null);
  const searchInputRef = useRef<HTMLInputElement>(null);

  // Load employee master data
  const loadData = async () => {
    try {
      const [empRes, deptRes, desnRes] = await Promise.all([
        fetch(`${API}/api/masters/payroll/employees`),
        fetch(`${API}/api/masters/payroll/departments`),
        fetch(`${API}/api/masters/payroll/designations`)
      ]);

      if (deptRes.ok) setDepartments(await deptRes.json());
      if (desnRes.ok) setDesignations(await desnRes.json());

      if (empRes.ok) {
        const data = await empRes.json();
        setItems(data);
        if (data.length > 0) {
          setSelectedId(prev => {
            const exists = data.some((item: Employee) => item.pem_code === prev);
            return exists ? prev : data[0].pem_code;
          });
        } else {
          setSelectedId(null);
        }
      }
    } catch (e) {
      console.error('Error loading employee master data:', e);
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
        i.pem_name.toLowerCase().includes(search.toLowerCase()) ||
        (i.department?.pdp_name ?? '').toLowerCase().includes(search.toLowerCase()) ||
        (i.designation?.pdn_name ?? '').toLowerCase().includes(search.toLowerCase())
      );
      if (filtered.length === 0) return;

      const currentIndex = filtered.findIndex(i => i.pem_code === selectedId);

      if (e.key === 'ArrowDown') {
        e.preventDefault();
        const nextIndex = (currentIndex + 1) % filtered.length;
        setSelectedId(filtered[nextIndex].pem_code);
      } else if (e.key === 'ArrowUp') {
        e.preventDefault();
        const prevIndex = (currentIndex - 1 + filtered.length) % filtered.length;
        setSelectedId(filtered[prevIndex].pem_code);
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
      pem_dept_code: departments[0]?.pdp_code?.toString() ?? '',
      pem_desn_code: designations[0]?.pdn_code?.toString() ?? '',
    });
    setError('');
    setSuccess('');
    setEntryMode(true);
  };

  const handleEdit = () => {
    const item = items.find(i => i.pem_code === selectedId);
    if (!item) return;

    setEditing(item);
    setForm({
      pem_title: item.pem_title || 'Mr.',
      pem_name: item.pem_name,
      pem_dept_code: item.pem_dept_code?.toString() ?? '',
      pem_desn_code: item.pem_desn_code?.toString() ?? '',
      pem_gender: item.pem_gender || 'Male',
      pem_dob: item.pem_dob ? item.pem_dob.split('T')[0] : '',
      pem_doj: item.pem_doj ? item.pem_doj.split('T')[0] : '',
      pem_phone: item.pem_phone || '',
      pem_email: item.pem_email || '',
      pem_address: item.pem_address || '',
      pem_basic_salary: item.pem_basic_salary?.toString() ?? '0',
    });
    setError('');
    setSuccess('');
    setEntryMode(true);
  };

  const handleDelete = async () => {
    if (!selectedId) return;
    const item = items.find(i => i.pem_code === selectedId);
    if (!item) return;

    if (!confirm(`Delete employee "${item.pem_name}"?`)) return;

    try {
      const r = await fetch(`${API}/api/masters/payroll/employees/${selectedId}`, {
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
    if (!form.pem_name.trim()) {
      setError('Invalid Employee Name !!!');
      nameInputRef.current?.focus();
      return;
    }

    const salaryVal = parseFloat(form.pem_basic_salary);
    if (isNaN(salaryVal) || salaryVal < 0) {
      setError('Invalid Basic Salary !!!');
      return;
    }

    setLoading(true);
    setError('');
    setSuccess('');

    try {
      const body = {
        pem_title: form.pem_title,
        pem_name: form.pem_name.trim(),
        pem_dept_code: form.pem_dept_code ? parseInt(form.pem_dept_code) : null,
        pem_desn_code: form.pem_desn_code ? parseInt(form.pem_desn_code) : null,
        pem_gender: form.pem_gender,
        pem_dob: form.pem_dob || null,
        pem_doj: form.pem_doj || null,
        pem_phone: form.pem_phone.trim() || null,
        pem_email: form.pem_email.trim() || null,
        pem_address: form.pem_address.trim() || null,
        pem_basic_salary: salaryVal,
        pem_rec_state: 1
      };

      const url = editing
        ? `${API}/api/masters/payroll/employees/${editing.pem_code}`
        : `${API}/api/masters/payroll/employees`;
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
    i.pem_name.toLowerCase().includes(search.toLowerCase()) ||
    (i.department?.pdp_name ?? '').toLowerCase().includes(search.toLowerCase()) ||
    (i.designation?.pdn_name ?? '').toLowerCase().includes(search.toLowerCase())
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
          Employee Master [PayEmpMast.frm]
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
                      i.pem_name.toLowerCase().includes(e.target.value.toLowerCase()) ||
                      (i.department?.pdp_name ?? '').toLowerCase().includes(e.target.value.toLowerCase()) ||
                      (i.designation?.pdn_name ?? '').toLowerCase().includes(e.target.value.toLowerCase())
                    );
                    if (matching.length > 0 && !matching.some(m => m.pem_code === selectedId)) {
                      setSelectedId(matching[0].pem_code);
                    }
                  }}
                  placeholder="Search staff (txtSearch)..."
                />
              </div>
            </div>

            {/* Table Grid (Mfgrd1) */}
            <div className={styles.tableContainer}>
              <table className={styles.table}>
                <thead>
                  <tr>
                    <th style={{ width: '80px' }}>Code</th>
                    <th>Employee Name</th>
                    <th>Department</th>
                    <th>Designation</th>
                    <th>Gender</th>
                    <th>Joined Date</th>
                    <th>Salary</th>
                  </tr>
                </thead>
                <tbody>
                  {filtered.length === 0 && (
                    <tr>
                      <td colSpan={7} style={{ textAlign: 'center', padding: '40px', color: 'var(--text-secondary)' }}>
                        No employee records found
                      </td>
                    </tr>
                  )}
                  {filtered.map((item) => (
                    <tr
                      key={item.pem_code}
                      onClick={() => setSelectedId(item.pem_code)}
                      onDoubleClick={handleEdit}
                      style={{
                        cursor: 'pointer',
                        backgroundColor: selectedId === item.pem_code ? 'var(--accent-light)' : 'transparent',
                        fontWeight: selectedId === item.pem_code ? 600 : 400
                      }}
                    >
                      <td style={{ color: selectedId === item.pem_code ? 'var(--accent-color)' : 'var(--text-secondary)' }}>
                        #{item.pem_code}
                      </td>
                      <td>
                        <span style={{ color: 'var(--text-secondary)', marginRight: '4px' }}>{item.pem_title}</span>
                        {item.pem_name}
                      </td>
                      <td>{item.department?.pdp_name || '—'}</td>
                      <td>{item.designation?.pdn_name || '—'}</td>
                      <td>{item.pem_gender}</td>
                      <td>{item.pem_doj ? new Date(item.pem_doj).toLocaleDateString() : '—'}</td>
                      <td style={{ fontWeight: 700 }}>₹{(item.pem_basic_salary ?? 0).toFixed(2)}</td>
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
                    value={editing ? editing.pem_code : '-1'}
                    disabled
                    style={{ backgroundColor: 'var(--bg-secondary)', fontWeight: 700 }}
                  />
                </div>

                {/* Title */}
                <div className={styles.formGroup} style={{ maxWidth: '150px' }}>
                  <label htmlFor="pem_title">Title (cmbPemTitle)</label>
                  <select
                    id="pem_title"
                    className={styles.formControl}
                    value={form.pem_title}
                    onChange={e => setForm(f => ({ ...f, pem_title: e.target.value }))}
                  >
                    <option value="Mr.">Mr.</option>
                    <option value="Mrs.">Mrs.</option>
                    <option value="Ms.">Ms.</option>
                    <option value="Dr.">Dr.</option>
                    <option value="Prof.">Prof.</option>
                  </select>
                </div>

                {/* Full Name */}
                <div className={styles.formGroup} style={{ flex: 2 }}>
                  <label htmlFor="pem_name">Full Name (txtPemName) *</label>
                  <input
                    id="pem_name"
                    ref={nameInputRef}
                    className={styles.formControl}
                    value={form.pem_name}
                    onChange={e => setForm(f => ({ ...f, pem_name: e.target.value }))}
                    maxLength={50}
                    required
                    placeholder="Enter Employee Name"
                  />
                </div>
              </div>

              <div className={styles.formGrid}>
                {/* Department Selection */}
                <div className={styles.formGroup}>
                  <label htmlFor="pem_dept_code">Department (txtDptName) *</label>
                  <select
                    id="pem_dept_code"
                    className={styles.formControl}
                    value={form.pem_dept_code}
                    onChange={e => setForm(f => ({ ...f, pem_dept_code: e.target.value }))}
                    required
                  >
                    <option value="">— Select Department —</option>
                    {departments.map(d => (
                      <option key={d.pdp_code} value={d.pdp_code}>{d.pdp_name}</option>
                    ))}
                  </select>
                </div>

                {/* Designation Selection */}
                <div className={styles.formGroup}>
                  <label htmlFor="pem_desn_code">Designation (txtDsgName) *</label>
                  <select
                    id="pem_desn_code"
                    className={styles.formControl}
                    value={form.pem_desn_code}
                    onChange={e => setForm(f => ({ ...f, pem_desn_code: e.target.value }))}
                    required
                  >
                    <option value="">— Select Designation —</option>
                    {designations.map(d => (
                      <option key={d.pdn_code} value={d.pdn_code}>{d.pdn_name}</option>
                    ))}
                  </select>
                </div>
              </div>

              <div className={styles.formGrid}>
                {/* Gender */}
                <div className={styles.formGroup}>
                  <label htmlFor="pem_gender">Gender (cmbPemGender)</label>
                  <select
                    id="pem_gender"
                    className={styles.formControl}
                    value={form.pem_gender}
                    onChange={e => setForm(f => ({ ...f, pem_gender: e.target.value }))}
                  >
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                    <option value="Other">Other</option>
                  </select>
                </div>

                {/* Basic Salary */}
                <div className={styles.formGroup}>
                  <label htmlFor="pem_basic_salary">Basic Salary (mskEmpBSalary)</label>
                  <input
                    id="pem_basic_salary"
                    type="number"
                    min="0"
                    step="0.01"
                    className={styles.formControl}
                    value={form.pem_basic_salary}
                    onChange={e => setForm(f => ({ ...f, pem_basic_salary: e.target.value }))}
                  />
                </div>
              </div>

              <div className={styles.formGrid}>
                {/* Date of Birth */}
                <div className={styles.formGroup}>
                  <label htmlFor="pem_dob">Date of Birth (dtpPemDob)</label>
                  <input
                    id="pem_dob"
                    type="date"
                    className={styles.formControl}
                    value={form.pem_dob}
                    onChange={e => setForm(f => ({ ...f, pem_dob: e.target.value }))}
                  />
                </div>

                {/* Date of Joining */}
                <div className={styles.formGroup}>
                  <label htmlFor="pem_doj">Date of Joining (dtpEmpJoinDate)</label>
                  <input
                    id="pem_doj"
                    type="date"
                    className={styles.formControl}
                    value={form.pem_doj}
                    onChange={e => setForm(f => ({ ...f, pem_doj: e.target.value }))}
                  />
                </div>
              </div>

              <div className={styles.formGrid}>
                {/* Phone Number */}
                <div className={styles.formGroup}>
                  <label htmlFor="pem_phone">Phone Number (txtPemPhone)</label>
                  <input
                    id="pem_phone"
                    className={styles.formControl}
                    value={form.pem_phone}
                    onChange={e => setForm(f => ({ ...f, pem_phone: e.target.value }))}
                    maxLength={50}
                    placeholder="Enter phone number"
                  />
                </div>

                {/* Email Address */}
                <div className={styles.formGroup}>
                  <label htmlFor="pem_email">Email Address (txtPemEmail)</label>
                  <input
                    id="pem_email"
                    type="email"
                    className={styles.formControl}
                    value={form.pem_email}
                    onChange={e => setForm(f => ({ ...f, pem_email: e.target.value }))}
                    maxLength={50}
                    placeholder="Enter email address"
                  />
                </div>
              </div>

              {/* Address */}
              <div className={styles.formGroup}>
                <label htmlFor="pem_address">Residential Address (txtPemAddress)</label>
                <textarea
                  id="pem_address"
                  className={styles.formControl}
                  style={{ resize: 'none' }}
                  value={form.pem_address}
                  onChange={e => setForm(f => ({ ...f, pem_address: e.target.value }))}
                  maxLength={250}
                  rows={2}
                  placeholder="Enter residential address"
                />
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
