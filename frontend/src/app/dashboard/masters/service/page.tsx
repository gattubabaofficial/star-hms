'use client';
import React, { useState, useEffect, useRef } from 'react';
import { useRouter } from 'next/navigation';
import styles from '../../../dashboard.module.css';
import ActionBar from '../components/ActionBar';
import { Search, AlertCircle, Check } from 'lucide-react';

interface ServiceGroup {
  sgp_code: number;
  sgp_name: string;
}

interface Service {
  srv_code: number;
  srv_name: string;
  srv_sgp_code?: number;
  srv_rate: number;
  srv_rec_state: number;
  srv_index: number;
  srv_rate_editable: boolean;
  srv_amt_editable: boolean;
  srv_unit_editable: boolean;
  srv_multi_dct: boolean;
  srv_show_in_list: boolean;
  srv_auto_ins_indr: boolean;
  srv_auto_ins_once_indr: boolean;
  srv_auto_calc_indr: boolean;
  srv_inf_allowed: boolean;
  srv_def_allowed: boolean;
  srv_disc_allowed: boolean;
  srv_disc_per: number;
  group?: ServiceGroup;
}

const API = process.env.NEXT_PUBLIC_API_URL || 'http://localhost:8000';
const getToken = () => typeof window !== 'undefined' ? localStorage.getItem('token') : '';
const authHdr = () => ({ 'Content-Type': 'application/json', Authorization: `Bearer ${getToken()}` });

const blankForm = {
  srv_name: '',
  srv_sgp_code: '',
  srv_rate: '0.00',
  srv_index: '0',
  srv_rate_editable: false,
  srv_amt_editable: false,
  srv_unit_editable: false,
  srv_multi_dct: false,
  srv_show_in_list: true,
  srv_auto_ins_indr: false,
  srv_auto_ins_once_indr: false,
  srv_auto_calc_indr: false,
  srv_inf_allowed: false,
  srv_def_allowed: false,
  srv_disc_allowed: false,
  srv_disc_per: '0',
  txtAhName: 'General Revenue Account' // Mock Account Head
};

export default function ServiceMasterPage() {
  const router = useRouter();

  // State variables
  const [items, setItems] = useState<Service[]>([]);
  const [groups, setGroups] = useState<ServiceGroup[]>([]);
  const [search, setSearch] = useState('');
  const [selectedId, setSelectedId] = useState<number | null>(null);
  const [entryMode, setEntryMode] = useState(false); // false = Summary, true = Detail
  const [editing, setEditing] = useState<Service | null>(null);

  const [form, setForm] = useState(blankForm);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');
  const [success, setSuccess] = useState('');

  // Refs
  const nameInputRef = useRef<HTMLInputElement>(null);
  const searchInputRef = useRef<HTMLInputElement>(null);

  // Load services and groups
  const loadData = async () => {
    try {
      const [srvRes, grpRes] = await Promise.all([
        fetch(`${API}/api/masters/services`),
        fetch(`${API}/api/masters/service-groups`)
      ]);

      let grps: ServiceGroup[] = [];
      if (grpRes.ok) {
        grps = await grpRes.json();
        setGroups(grps);
      }

      if (srvRes.ok) {
        const srvs: Service[] = await srvRes.json();
        setItems(srvs);
        if (srvs.length > 0) {
          setSelectedId(prev => {
            const exists = srvs.some(item => item.srv_code === prev);
            return exists ? prev : srvs[0].srv_code;
          });
        } else {
          setSelectedId(null);
        }
      }
    } catch (e) {
      console.error('Error loading data:', e);
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
        i.srv_name.toLowerCase().includes(search.toLowerCase())
      );
      if (filtered.length === 0) return;

      const currentIndex = filtered.findIndex(i => i.srv_code === selectedId);

      if (e.key === 'ArrowDown') {
        e.preventDefault();
        const nextIndex = (currentIndex + 1) % filtered.length;
        setSelectedId(filtered[nextIndex].srv_code);
      } else if (e.key === 'ArrowUp') {
        e.preventDefault();
        const prevIndex = (currentIndex - 1 + filtered.length) % filtered.length;
        setSelectedId(filtered[prevIndex].srv_code);
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
      srv_sgp_code: groups.length > 0 ? groups[0].sgp_code.toString() : ''
    });
    setError('');
    setSuccess('');
    setEntryMode(true);
  };

  const handleEdit = () => {
    const item = items.find(i => i.srv_code === selectedId);
    if (!item) return;

    setEditing(item);
    setForm({
      srv_name: item.srv_name,
      srv_sgp_code: item.srv_sgp_code ? item.srv_sgp_code.toString() : '',
      srv_rate: item.srv_rate.toString(),
      srv_index: item.srv_index.toString(),
      srv_rate_editable: item.srv_rate_editable,
      srv_amt_editable: item.srv_amt_editable,
      srv_unit_editable: item.srv_unit_editable,
      srv_multi_dct: item.srv_multi_dct,
      srv_show_in_list: item.srv_show_in_list,
      srv_auto_ins_indr: item.srv_auto_ins_indr,
      srv_auto_ins_once_indr: item.srv_auto_ins_once_indr,
      srv_auto_calc_indr: item.srv_auto_calc_indr,
      srv_inf_allowed: item.srv_inf_allowed,
      srv_def_allowed: item.srv_def_allowed,
      srv_disc_allowed: item.srv_disc_allowed,
      srv_disc_per: item.srv_disc_per.toString(),
      txtAhName: 'General Revenue Account'
    });
    setError('');
    setSuccess('');
    setEntryMode(true);
  };

  const handleDelete = async () => {
    if (!selectedId) return;
    const item = items.find(i => i.srv_code === selectedId);
    if (!item) return;

    if (!confirm(`Delete service code "${item.srv_name}"?`)) return;

    try {
      const r = await fetch(`${API}/api/masters/services/${selectedId}`, {
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
    if (!form.srv_name.trim()) {
      setError('Invalid Service Name !!!');
      nameInputRef.current?.focus();
      return;
    }

    // Duplicate Check
    const isDuplicate = items.some(item =>
      item.srv_name.toLowerCase() === form.srv_name.trim().toLowerCase() &&
      item.srv_code !== editing?.srv_code
    );
    if (isDuplicate) {
      setError('Duplicate Input !!!');
      nameInputRef.current?.focus();
      return;
    }

    const rateVal = parseFloat(form.srv_rate);
    if (isNaN(rateVal) || rateVal < 0) {
      setError('Invalid Service Rate / Charges !!!');
      return;
    }

    const indexVal = parseInt(form.srv_index);
    if (isNaN(indexVal) || indexVal < 0) {
      setError('Invalid Index Value !!!');
      return;
    }

    const discPer = parseFloat(form.srv_disc_per);
    if (isNaN(discPer) || discPer < 0 || discPer > 100) {
      setError('Invalid Discount Percentage !!!');
      return;
    }

    setLoading(true);
    setError('');
    setSuccess('');

    try {
      const body = {
        srv_name: form.srv_name.trim(),
        srv_sgp_code: form.srv_sgp_code ? parseInt(form.srv_sgp_code) : null,
        srv_rate: rateVal,
        srv_index: indexVal,
        srv_rate_editable: form.srv_rate_editable,
        srv_amt_editable: form.srv_amt_editable,
        srv_unit_editable: form.srv_unit_editable,
        srv_multi_dct: form.srv_multi_dct,
        srv_show_in_list: form.srv_show_in_list,
        srv_auto_ins_indr: form.srv_auto_ins_indr,
        srv_auto_ins_once_indr: form.srv_auto_ins_once_indr,
        srv_auto_calc_indr: form.srv_auto_calc_indr,
        srv_inf_allowed: form.srv_inf_allowed,
        srv_def_allowed: form.srv_def_allowed,
        srv_disc_allowed: form.srv_disc_allowed,
        srv_disc_per: discPer,
        srv_rec_state: 1
      };

      const url = editing
        ? `${API}/api/masters/services/${editing.srv_code}`
        : `${API}/api/masters/services`;
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
    i.srv_name.toLowerCase().includes(search.toLowerCase())
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
          Service Master [frmServiceMast]
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
                    const matching = items.filter(i => i.srv_name.toLowerCase().includes(e.target.value.toLowerCase()));
                    if (matching.length > 0 && !matching.some(m => m.srv_code === selectedId)) {
                      setSelectedId(matching[0].srv_code);
                    }
                  }}
                  placeholder="Search services (txtSearch)..."
                />
              </div>
            </div>

            {/* Table Grid (Mfgrd1) */}
            <div className={styles.tableContainer}>
              <table className={styles.table}>
                <thead>
                  <tr>
                    <th style={{ width: '80px' }}>Code</th>
                    <th>Service Name</th>
                    <th>Group Name</th>
                    <th>Account Name</th>
                    <th>Charges (₹)</th>
                    <th>Index</th>
                    <th>Show List</th>
                  </tr>
                </thead>
                <tbody>
                  {filtered.length === 0 && (
                    <tr>
                      <td colSpan={7} style={{ textAlign: 'center', padding: '40px', color: 'var(--text-secondary)' }}>
                        No service billing codes found
                      </td>
                    </tr>
                  )}
                  {filtered.map((item) => (
                    <tr
                      key={item.srv_code}
                      onClick={() => setSelectedId(item.srv_code)}
                      onDoubleClick={handleEdit}
                      style={{
                        cursor: 'pointer',
                        backgroundColor: selectedId === item.srv_code ? 'var(--accent-light)' : 'transparent',
                        fontWeight: selectedId === item.srv_code ? 600 : 400
                      }}
                    >
                      <td style={{ color: selectedId === item.srv_code ? 'var(--accent-color)' : 'var(--text-secondary)' }}>
                        #{item.srv_code}
                      </td>
                      <td>{item.srv_name}</td>
                      <td>{item.group ? item.group.sgp_name : 'General'}</td>
                      <td>{form.txtAhName}</td>
                      <td style={{ fontWeight: 700 }}>{item.srv_rate.toFixed(2)}</td>
                      <td>{item.srv_index}</td>
                      <td>
                        <span className={`${styles.badge} ${item.srv_show_in_list ? styles.badgeAccent : styles.badgeDanger}`}>
                          {item.srv_show_in_list ? 'Yes' : 'No'}
                        </span>
                      </td>
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

              {/* General Fields Frame */}
              <div className={styles.formGrid}>
                {/* Code (mskFormBoundField) */}
                <div className={styles.formGroup}>
                  <label>Code (mskFormBoundField)</label>
                  <input
                    className={styles.formControl}
                    value={editing ? editing.srv_code : '-1'}
                    disabled
                    style={{ backgroundColor: 'var(--bg-secondary)', fontWeight: 700 }}
                  />
                </div>

                {/* Service Group (txtSgpName Select) */}
                <div className={styles.formGroup}>
                  <label>Service Group (txtSgpName) *</label>
                  <select
                    className={styles.formControl}
                    value={form.srv_sgp_code}
                    onChange={e => setForm(f => ({ ...f, srv_sgp_code: e.target.value }))}
                    required
                  >
                    <option value="">-- Select Group --</option>
                    {groups.map(g => (
                      <option key={g.sgp_code} value={g.sgp_code}>{g.sgp_name}</option>
                    ))}
                  </select>
                </div>
              </div>

              <div className={styles.formGrid}>
                {/* Service Name (txtSrvName) */}
                <div className={styles.formGroup} style={{ flex: 2 }}>
                  <label>Service Name (txtSrvName) *</label>
                  <input
                    ref={nameInputRef}
                    className={styles.formControl}
                    value={form.srv_name}
                    onChange={e => setForm(f => ({ ...f, srv_name: e.target.value }))}
                    maxLength={100}
                    required
                    placeholder="Enter Service Name"
                  />
                </div>

                {/* Index (mskSrvIndex) */}
                <div className={styles.formGroup}>
                  <label>Index (mskSrvIndex)</label>
                  <input
                    type="number"
                    min="0"
                    className={styles.formControl}
                    value={form.srv_index}
                    onChange={e => setForm(f => ({ ...f, srv_index: e.target.value }))}
                  />
                </div>
              </div>

              {/* Account Head (txtAhName Mock) */}
              <div className={styles.formGroup}>
                <label>Account Name (txtAhName)</label>
                <input
                  className={styles.formControl}
                  value={form.txtAhName}
                  disabled
                  style={{ backgroundColor: 'var(--bg-secondary)' }}
                />
              </div>

              <div className={styles.formGrid}>
                {/* Base Rate / Standard Charges (mskSrvRate) */}
                <div className={styles.formGroup}>
                  <label>Standard Charges (mskSrvRate) *</label>
                  <input
                    type="number"
                    min="0"
                    step="0.01"
                    className={styles.formControl}
                    value={form.srv_rate}
                    onChange={e => setForm(f => ({ ...f, srv_rate: e.target.value }))}
                    required
                  />
                </div>

                {/* Multiple Doctors Involved Checkbox */}
                <div className={styles.formGroup} style={{ justifyContent: 'flex-end', paddingBottom: '10px' }}>
                  <label style={{ display: 'flex', alignItems: 'center', gap: '8px', cursor: 'pointer', fontSize: '13px', fontWeight: 600 }}>
                    <input
                      type="checkbox"
                      checked={form.srv_multi_dct}
                      onChange={e => setForm(f => ({ ...f, srv_multi_dct: e.target.checked }))}
                    />
                    Multiple Doctors Involved (chkSrvMultiDctIncl)
                  </label>
                </div>
              </div>

              {/* Auto Inserts Frame */}
              <div style={{ border: '1px solid var(--border-light)', padding: '16px', borderRadius: '8px', marginBottom: '20px', backgroundColor: 'rgba(0,0,0,0.02)' }}>
                <div style={{ fontWeight: 700, fontSize: '13px', marginBottom: '12px', color: 'var(--text-primary)' }}>Billing Settings</div>
                <div className={styles.formGrid}>
                  <label style={{ display: 'flex', alignItems: 'center', gap: '8px', cursor: 'pointer', fontSize: '13px' }}>
                    <input
                      type="checkbox"
                      checked={form.srv_auto_ins_indr}
                      onChange={e => setForm(f => ({ ...f, srv_auto_ins_indr: e.target.checked }))}
                    />
                    Auto Insert In Indoor Bill (chkSrvAutoInsIpdBill)
                  </label>

                  <label style={{ display: 'flex', alignItems: 'center', gap: '8px', cursor: 'pointer', fontSize: '13px' }}>
                    <input
                      type="checkbox"
                      checked={form.srv_auto_calc_indr}
                      onChange={e => setForm(f => ({ ...f, srv_auto_calc_indr: e.target.checked }))}
                    />
                    Auto Calculate In Indoor Bill (chkSrvAutoCalcIpdBill)
                  </label>

                  <label style={{ display: 'flex', alignItems: 'center', gap: '8px', cursor: 'pointer', fontSize: '13px' }}>
                    <input
                      type="checkbox"
                      checked={form.srv_auto_ins_once_indr}
                      onChange={e => setForm(f => ({ ...f, srv_auto_ins_once_indr: e.target.checked }))}
                    />
                    Auto Insert Once In Indoor Bill (chkSrvAutoInsOnceIpdBill)
                  </label>
                </div>
              </div>

              {/* Editability Settings */}
              <div className={styles.formGrid} style={{ marginBottom: '20px' }}>
                <label style={{ display: 'flex', alignItems: 'center', gap: '8px', cursor: 'pointer', fontSize: '13px', fontWeight: 600 }}>
                  <input
                    type="checkbox"
                    checked={form.srv_unit_editable}
                    onChange={e => setForm(f => ({ ...f, srv_unit_editable: e.target.checked }))}
                  />
                  Unit Editable (chkSrvUnitEditable)
                </label>

                <label style={{ display: 'flex', alignItems: 'center', gap: '8px', cursor: 'pointer', fontSize: '13px', fontWeight: 600 }}>
                  <input
                    type="checkbox"
                    checked={form.srv_rate_editable}
                    onChange={e => setForm(f => ({ ...f, srv_rate_editable: e.target.checked }))}
                  />
                  Rate Editable (chkSrvRateEditable)
                </label>

                <label style={{ display: 'flex', alignItems: 'center', gap: '8px', cursor: 'pointer', fontSize: '13px', fontWeight: 600 }}>
                  <input
                    type="checkbox"
                    checked={form.srv_amt_editable}
                    onChange={e => setForm(f => ({ ...f, srv_amt_editable: e.target.checked }))}
                  />
                  Amount Editable (chkSrvAmtEditable)
                </label>
              </div>

              {/* Inflation/Deflation Settings */}
              <div className={styles.formGrid} style={{ marginBottom: '20px' }}>
                <label style={{ display: 'flex', alignItems: 'center', gap: '8px', cursor: 'pointer', fontSize: '13px', fontWeight: 600 }}>
                  <input
                    type="checkbox"
                    checked={form.srv_inf_allowed}
                    onChange={e => setForm(f => ({ ...f, srv_inf_allowed: e.target.checked }))}
                  />
                  Increment Allowed (chkSrvInfAllowed)
                </label>

                <label style={{ display: 'flex', alignItems: 'center', gap: '8px', cursor: 'pointer', fontSize: '13px', fontWeight: 600 }}>
                  <input
                    type="checkbox"
                    checked={form.srv_def_allowed}
                    onChange={e => setForm(f => ({ ...f, srv_def_allowed: e.target.checked }))}
                  />
                  Decrement Allowed (chkSrvDefAllowed)
                </label>
              </div>

              {/* Discount settings */}
              <div className={styles.formGrid} style={{ marginBottom: '20px' }}>
                <div className={styles.formGroup}>
                  <label style={{ display: 'flex', alignItems: 'center', gap: '8px', cursor: 'pointer', fontSize: '13px', fontWeight: 600 }}>
                    <input
                      type="checkbox"
                      checked={form.srv_disc_allowed}
                      onChange={e => setForm(f => ({ ...f, srv_disc_allowed: e.target.checked }))}
                    />
                    Discount Allowed (chkSrvDiscAllowed)
                  </label>
                </div>

                <div className={styles.formGroup}>
                  <label>Discount % (mskSrvDiscPer)</label>
                  <input
                    type="number"
                    min="0"
                    max="100"
                    step="0.01"
                    className={styles.formControl}
                    value={form.srv_disc_per}
                    onChange={e => setForm(f => ({ ...f, srv_disc_per: e.target.value }))}
                  />
                </div>
              </div>

              {/* Show in List checkbox */}
              <div className={styles.formGroup} style={{ marginBottom: '24px' }}>
                <label style={{ display: 'flex', alignItems: 'center', gap: '8px', cursor: 'pointer', fontSize: '13px', fontWeight: 600 }}>
                  <input
                    type="checkbox"
                    checked={form.srv_show_in_list}
                    onChange={e => setForm(f => ({ ...f, srv_show_in_list: e.target.checked }))}
                  />
                  Show in List (chkSrvShowInList)
                </label>
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
