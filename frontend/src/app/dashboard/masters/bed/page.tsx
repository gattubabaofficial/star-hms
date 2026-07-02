'use client';
import React, { useState, useEffect, useRef } from 'react';
import { useRouter } from 'next/navigation';
import styles from '../../../dashboard.module.css';
import ActionBar from '../components/ActionBar';
import { Search, AlertCircle, Check } from 'lucide-react';

interface Floor {
  flr_code: number;
  flr_name: string;
}

interface Ward {
  wrd_code: number;
  wrd_name: string;
  wrd_flr_code?: number;
  floor?: Floor;
}

interface Service {
  srv_code: number;
  srv_name: string;
  srv_rate: number;
}

interface BedRecord {
  bdm_code: number;
  bdm_name: string;
  bdm_wrd_code: number;
  is_occupied: boolean;
  bdm_flr_code?: number;
  bdm_srv_code?: number;
  bdm_index: number;
  bdm_charges: number;
  bdm_disc_allowed: boolean;
  bdm_disc_per: number;
  bdm_chk_out_time_basis?: string;
  bdm_chk_time?: string;
  bdm_free_allot: boolean;
  bdm_remark?: string;
  bdm_show_in_list: boolean;
  ward?: Ward;
}

interface BedServiceMock {
  sno: number;
  srv_name: string;
  unit: number;
  rate: number;
}

const API = process.env.NEXT_PUBLIC_API_URL || 'http://localhost:8000';
const getToken = () => typeof window !== 'undefined' ? localStorage.getItem('token') : '';
const authHdr = () => ({ 'Content-Type': 'application/json', Authorization: `Bearer ${getToken()}` });

const chkOutBasisOptions = [
  '24 Hours Basis',
  '12:00 Noon Basis',
  'Calendar Day Basis',
  'Variable Hour Basis'
];

const blankForm = {
  bdm_name: '',
  bdm_wrd_code: '',
  bdm_flr_code: '',
  bdm_srv_code: '',
  bdm_index: '0',
  bdm_charges: '0.00',
  bdm_disc_allowed: false,
  bdm_disc_per: '0',
  bdm_chk_out_time_basis: '12:00 Noon Basis',
  bdm_chk_time: '12:00',
  bdm_free_allot: false,
  bdm_remark: '',
  bdm_show_in_list: true
};

export default function BedMasterPage() {
  const router = useRouter();

  // State variables
  const [items, setItems] = useState<BedRecord[]>([]);
  const [wards, setWards] = useState<Ward[]>([]);
  const [floors, setFloors] = useState<Floor[]>([]);
  const [services, setServices] = useState<Service[]>([]);
  
  const [search, setSearch] = useState('');
  const [selectedId, setSelectedId] = useState<number | null>(null);
  const [entryMode, setEntryMode] = useState(false); // false = Summary, true = Detail
  const [editing, setEditing] = useState<BedRecord | null>(null);

  const [form, setForm] = useState(blankForm);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');
  const [success, setSuccess] = useState('');

  // Sub-services grid state (Mfgrd2 mocks)
  const [subServices, setSubServices] = useState<BedServiceMock[]>([
    { sno: 1, srv_name: 'Standard Nursing Charges', unit: 1, rate: 150.00 }
  ]);
  const [subSrvInput, setSubSrvInput] = useState({
    sno: 2,
    srv_name: '',
    unit: '1',
    rate: '0.00'
  });
  const [editingSubRowIndex, setEditingSubRowIndex] = useState<number | null>(null);

  // Refs
  const nameInputRef = useRef<HTMLInputElement>(null);
  const searchInputRef = useRef<HTMLInputElement>(null);

  // Load beds, wards, floors, services
  const loadData = async () => {
    try {
      const [bedRes, wardRes, floorRes, srvRes] = await Promise.all([
        fetch(`${API}/api/masters/beds`),
        fetch(`${API}/api/masters/wards`),
        fetch(`${API}/api/masters/floors`),
        fetch(`${API}/api/masters/services`)
      ]);

      if (wardRes.ok) setWards(await wardRes.json());
      if (floorRes.ok) setFloors(await floorRes.json());
      if (srvRes.ok) setServices(await srvRes.json());

      if (bedRes.ok) {
        const data = await bedRes.json();
        setItems(data);
        if (data.length > 0) {
          setSelectedId(prev => {
            const exists = data.some((item: BedRecord) => item.bdm_code === prev);
            return exists ? prev : data[0].bdm_code;
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
        i.bdm_name.toLowerCase().includes(search.toLowerCase())
      );
      if (filtered.length === 0) return;

      const currentIndex = filtered.findIndex(i => i.bdm_code === selectedId);

      if (e.key === 'ArrowDown') {
        e.preventDefault();
        const nextIndex = (currentIndex + 1) % filtered.length;
        setSelectedId(filtered[nextIndex].bdm_code);
      } else if (e.key === 'ArrowUp') {
        e.preventDefault();
        const prevIndex = (currentIndex - 1 + filtered.length) % filtered.length;
        setSelectedId(filtered[prevIndex].bdm_code);
      }
    };

    window.addEventListener('keydown', handleTableKeys);
    return () => window.removeEventListener('keydown', handleTableKeys);
  }, [entryMode, items, selectedId, search]);

  // Filter wards by floor if floor selected
  const filteredWards = form.bdm_flr_code
    ? wards.filter(w => w.wrd_flr_code === parseInt(form.bdm_flr_code))
    : wards;

  // Actions
  const handleAdd = () => {
    setEditing(null);
    setForm({
      ...blankForm,
      bdm_wrd_code: wards.length > 0 ? wards[0].wrd_code.toString() : '',
      bdm_flr_code: floors.length > 0 ? floors[0].flr_code.toString() : '',
      bdm_srv_code: services.length > 0 ? services[0].srv_code.toString() : ''
    });
    setSubServices([
      { sno: 1, srv_name: 'Standard Nursing Charges', unit: 1, rate: 150.00 }
    ]);
    setSubSrvInput({ sno: 2, srv_name: '', unit: '1', rate: '0.00' });
    setEditingSubRowIndex(null);
    setError('');
    setSuccess('');
    setEntryMode(true);
  };

  const handleEdit = () => {
    const item = items.find(i => i.bdm_code === selectedId);
    if (!item) return;

    setEditing(item);
    setForm({
      bdm_name: item.bdm_name,
      bdm_wrd_code: item.bdm_wrd_code.toString(),
      bdm_flr_code: item.bdm_flr_code ? item.bdm_flr_code.toString() : (item.ward?.wrd_flr_code ? item.ward.wrd_flr_code.toString() : ''),
      bdm_srv_code: item.bdm_srv_code ? item.bdm_srv_code.toString() : '',
      bdm_index: item.bdm_index.toString(),
      bdm_charges: item.bdm_charges.toString(),
      bdm_disc_allowed: item.bdm_disc_allowed,
      bdm_disc_per: item.bdm_disc_per.toString(),
      bdm_chk_out_time_basis: item.bdm_chk_out_time_basis || '12:00 Noon Basis',
      bdm_chk_time: item.bdm_chk_time || '12:00',
      bdm_free_allot: item.bdm_free_allot,
      bdm_remark: item.bdm_remark || '',
      bdm_show_in_list: item.bdm_show_in_list
    });

    setSubServices([
      { sno: 1, srv_name: 'Room Maintenance', unit: 1, rate: item.bdm_charges * 0.1 },
      { sno: 2, srv_name: 'Nursing Charges', unit: 1, rate: 200.00 }
    ]);
    setSubSrvInput({ sno: 3, srv_name: '', unit: '1', rate: '0.00' });
    setEditingSubRowIndex(null);
    setError('');
    setSuccess('');
    setEntryMode(true);
  };

  const handleDelete = async () => {
    if (!selectedId) return;
    const item = items.find(i => i.bdm_code === selectedId);
    if (!item) return;

    if (!confirm(`Delete bed config "${item.bdm_name}"?`)) return;

    try {
      const r = await fetch(`${API}/api/masters/beds/${selectedId}`, {
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
    if (!subSrvInput.srv_name.trim()) return;

    const rateVal = parseFloat(subSrvInput.rate) || 0;
    const unitVal = parseInt(subSrvInput.unit) || 1;

    if (editingSubRowIndex !== null) {
      setSubServices(prev => prev.map((item, idx) =>
        idx === editingSubRowIndex
          ? { ...item, srv_name: subSrvInput.srv_name, unit: unitVal, rate: rateVal }
          : item
      ));
      setEditingSubRowIndex(null);
    } else {
      setSubServices(prev => [
        ...prev,
        { sno: prev.length + 1, srv_name: subSrvInput.srv_name, unit: unitVal, rate: rateVal }
      ]);
    }

    setSubSrvInput(prev => ({
      sno: subServices.length + (editingSubRowIndex !== null ? 1 : 2),
      srv_name: '',
      unit: '1',
      rate: '0.00'
    }));
  };

  const handleSelectSubRow = (idx: number) => {
    const r = subServices[idx];
    setSubSrvInput({
      sno: r.sno,
      srv_name: r.srv_name,
      unit: r.unit.toString(),
      rate: r.rate.toFixed(2)
    });
    setEditingSubRowIndex(idx);
  };

  const handleSave = async (e?: React.FormEvent) => {
    if (e) e.preventDefault();

    // Validations
    if (!form.bdm_name.trim()) {
      setError('Invalid Bed Name !!!');
      nameInputRef.current?.focus();
      return;
    }

    if (!form.bdm_wrd_code) {
      setError('Ward Assignment is required !!!');
      return;
    }

    const chargesVal = parseFloat(form.bdm_charges);
    if (isNaN(chargesVal) || chargesVal < 0) {
      setError('Invalid Bed Charges !!!');
      return;
    }

    const indexVal = parseInt(form.bdm_index);
    if (isNaN(indexVal) || indexVal < 0) {
      setError('Invalid Index Value !!!');
      return;
    }

    const discPer = parseFloat(form.bdm_disc_per);
    if (isNaN(discPer) || discPer < 0 || discPer > 100) {
      setError('Invalid Discount Percentage !!!');
      return;
    }

    setLoading(true);
    setError('');
    setSuccess('');

    try {
      const body = {
        bdm_name: form.bdm_name.trim(),
        bdm_wrd_code: parseInt(form.bdm_wrd_code),
        bdm_flr_code: form.bdm_flr_code ? parseInt(form.bdm_flr_code) : null,
        bdm_srv_code: form.bdm_srv_code ? parseInt(form.bdm_srv_code) : null,
        bdm_index: indexVal,
        bdm_charges: chargesVal,
        bdm_disc_allowed: form.bdm_disc_allowed,
        bdm_disc_per: discPer,
        bdm_chk_out_time_basis: form.bdm_chk_out_time_basis,
        bdm_chk_time: form.bdm_chk_time,
        bdm_free_allot: form.bdm_free_allot,
        bdm_remark: form.bdm_remark.trim() || null,
        bdm_show_in_list: form.bdm_show_in_list,
        bdm_rec_state: 1,
        is_occupied: editing ? editing.is_occupied : false
      };

      const url = editing
        ? `${API}/api/masters/beds/${editing.bdm_code}`
        : `${API}/api/masters/beds`;
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
    i.bdm_name.toLowerCase().includes(search.toLowerCase())
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
          Bed Master [frmBedMast]
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
                    const matching = items.filter(i => i.bdm_name.toLowerCase().includes(e.target.value.toLowerCase()));
                    if (matching.length > 0 && !matching.some(m => m.bdm_code === selectedId)) {
                      setSelectedId(matching[0].bdm_code);
                    }
                  }}
                  placeholder="Search beds (txtSearch)..."
                />
              </div>
            </div>

            {/* Table Grid (Mfgrd1) */}
            <div className={styles.tableContainer}>
              <table className={styles.table}>
                <thead>
                  <tr>
                    <th style={{ width: '80px' }}>Code</th>
                    <th>Bed Name</th>
                    <th>Floor Location</th>
                    <th>Ward Location</th>
                    <th>Charges (₹)</th>
                    <th>Occupancy</th>
                    <th>Index</th>
                    <th>Show List</th>
                  </tr>
                </thead>
                <tbody>
                  {filtered.length === 0 && (
                    <tr>
                      <td colSpan={8} style={{ textAlign: 'center', padding: '40px', color: 'var(--text-secondary)' }}>
                        No bed configurations found
                      </td>
                    </tr>
                  )}
                  {filtered.map((item) => (
                    <tr
                      key={item.bdm_code}
                      onClick={() => setSelectedId(item.bdm_code)}
                      onDoubleClick={handleEdit}
                      style={{
                        cursor: 'pointer',
                        backgroundColor: selectedId === item.bdm_code ? 'var(--accent-light)' : 'transparent',
                        fontWeight: selectedId === item.bdm_code ? 600 : 400
                      }}
                    >
                      <td style={{ color: selectedId === item.bdm_code ? 'var(--accent-color)' : 'var(--text-secondary)' }}>
                        #{item.bdm_code}
                      </td>
                      <td>{item.bdm_name}</td>
                      <td>{item.ward?.floor ? item.ward.floor.flr_name : 'N/A'}</td>
                      <td>{item.ward ? item.ward.wrd_name : 'N/A'}</td>
                      <td style={{ fontWeight: 700 }}>{item.bdm_charges.toFixed(2)}</td>
                      <td>
                        <span className={`${styles.badge} ${item.is_occupied ? styles.badgeDanger : styles.badgeSuccess}`}>
                          {item.is_occupied ? 'Occupied' : 'Available'}
                        </span>
                      </td>
                      <td>{item.bdm_index}</td>
                      <td>
                        <span className={`${styles.badge} ${item.bdm_show_in_list ? styles.badgeAccent : styles.badgeDanger}`}>
                          {item.bdm_show_in_list ? 'Yes' : 'No'}
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
          <div className={styles.sectionBox} style={{ backgroundColor: '#e2e8f0' /* Mapped from legacy gray &H00E0E0E0& */ }}>
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

              {/* General Fields Frame (frHeader) */}
              <div style={{ border: '1px solid var(--border-light)', padding: '16px', borderRadius: '8px', marginBottom: '24px', backgroundColor: '#fff' }}>
                
                <div className={styles.formGrid}>
                  {/* Code (mskFormBoundField) */}
                  <div className={styles.formGroup}>
                    <label>Code (mskFormBoundField)</label>
                    <input
                      className={styles.formControl}
                      value={editing ? editing.bdm_code : '-1'}
                      disabled
                      style={{ backgroundColor: 'var(--bg-secondary)', fontWeight: 700 }}
                    />
                  </div>

                  {/* Bed Name (txtBdmName) */}
                  <div className={styles.formGroup} style={{ flex: 2 }}>
                    <label>Bed Identifier / Label (txtBdmName) *</label>
                    <input
                      ref={nameInputRef}
                      className={styles.formControl}
                      value={form.bdm_name}
                      onChange={e => setForm(f => ({ ...f, bdm_name: e.target.value }))}
                      maxLength={50}
                      required
                      placeholder="Enter Bed Name"
                    />
                  </div>
                </div>

                <div className={styles.formGrid}>
                  {/* Floor Location Select */}
                  <div className={styles.formGroup}>
                    <label>Floor Location (txtFlrName) *</label>
                    <select
                      className={styles.formControl}
                      value={form.bdm_flr_code}
                      onChange={e => setForm(f => ({ ...f, bdm_flr_code: e.target.value, bdm_wrd_code: '' }))}
                      required
                    >
                      <option value="">-- Select Floor --</option>
                      {floors.map(f => (
                        <option key={f.flr_code} value={f.flr_code}>{f.flr_name}</option>
                      ))}
                    </select>
                  </div>

                  {/* Ward Assignment Select */}
                  <div className={styles.formGroup}>
                    <label>Ward Assignment (txtWrdName) *</label>
                    <select
                      className={styles.formControl}
                      value={form.bdm_wrd_code}
                      onChange={e => setForm(f => ({ ...f, bdm_wrd_code: e.target.value }))}
                      required
                    >
                      <option value="">-- Select Ward --</option>
                      {filteredWards.map(w => (
                        <option key={w.wrd_code} value={w.wrd_code}>{w.wrd_name}</option>
                      ))}
                    </select>
                  </div>
                </div>

                <div className={styles.formGrid}>
                  {/* Linked Service Select */}
                  <div className={styles.formGroup} style={{ flex: 2 }}>
                    <label>Linked Service Billing Code (txtSrvName) *</label>
                    <select
                      className={styles.formControl}
                      value={form.bdm_srv_code}
                      onChange={e => {
                        const srvId = e.target.value;
                        const srv = services.find(s => s.srv_code === parseInt(srvId));
                        setForm(f => ({
                          ...f,
                          bdm_srv_code: srvId,
                          bdm_charges: srv ? srv.srv_rate.toString() : f.bdm_charges
                        }));
                      }}
                      required
                    >
                      <option value="">-- Select Billing Service --</option>
                      {services.map(s => (
                        <option key={s.srv_code} value={s.srv_code}>{s.srv_name} (₹{s.srv_rate})</option>
                      ))}
                    </select>
                  </div>

                  {/* Index Order (mskBdmIndex) */}
                  <div className={styles.formGroup}>
                    <label>Index Order (mskBdmIndex)</label>
                    <input
                      type="number"
                      min="0"
                      className={styles.formControl}
                      value={form.bdm_index}
                      onChange={e => setForm(f => ({ ...f, bdm_index: e.target.value }))}
                    />
                  </div>
                </div>

                <div className={styles.formGrid}>
                  {/* Charges (mskBdmCharges) */}
                  <div className={styles.formGroup}>
                    <label>Standard Charges / Fee (mskBdmCharges) *</label>
                    <input
                      type="number"
                      min="0"
                      step="0.01"
                      className={styles.formControl}
                      value={form.bdm_charges}
                      onChange={e => setForm(f => ({ ...f, bdm_charges: e.target.value }))}
                      required
                    />
                  </div>

                  {/* Discount Allowed checkbox */}
                  <div className={styles.formGroup} style={{ justifyContent: 'flex-end', paddingBottom: '10px' }}>
                    <label style={{ display: 'flex', alignItems: 'center', gap: '8px', cursor: 'pointer', fontSize: '13px', fontWeight: 600 }}>
                      <input
                        type="checkbox"
                        checked={form.bdm_disc_allowed}
                        onChange={e => setForm(f => ({ ...f, bdm_disc_allowed: e.target.checked }))}
                      />
                      Discount Allowed (chkBdmDiscAllowed)
                    </label>
                  </div>

                  {/* Discount % */}
                  <div className={styles.formGroup}>
                    <label>Discount % (mskBdmDiscPer)</label>
                    <input
                      type="number"
                      min="0"
                      max="100"
                      step="0.01"
                      className={styles.formControl}
                      value={form.bdm_disc_per}
                      onChange={e => setForm(f => ({ ...f, bdm_disc_per: e.target.value }))}
                    />
                  </div>
                </div>

                <div className={styles.formGrid}>
                  {/* Checkout Time Basis dropdown */}
                  <div className={styles.formGroup}>
                    <label>Check Out Time Basis (cmbBdmChkOutTimeBasis)</label>
                    <select
                      className={styles.formControl}
                      value={form.bdm_chk_out_time_basis}
                      onChange={e => setForm(f => ({ ...f, bdm_chk_out_time_basis: e.target.value }))}
                    >
                      {chkOutBasisOptions.map(o => (
                        <option key={o} value={o}>{o}</option>
                      ))}
                    </select>
                  </div>

                  {/* Check out time */}
                  <div className={styles.formGroup}>
                    <label>Check Out Time (txtBdmChkTime_str)</label>
                    <input
                      className={styles.formControl}
                      value={form.bdm_chk_time}
                      onChange={e => setForm(f => ({ ...f, bdm_chk_time: e.target.value }))}
                      placeholder="e.g. 12:00"
                    />
                  </div>
                </div>

                <div className={styles.formGrid}>
                  {/* Free Allotment */}
                  <div className={styles.formGroup}>
                    <label style={{ display: 'flex', alignItems: 'center', gap: '8px', cursor: 'pointer', fontSize: '13px', fontWeight: 600 }}>
                      <input
                        type="checkbox"
                        checked={form.bdm_free_allot}
                        onChange={e => setForm(f => ({ ...f, bdm_free_allot: e.target.checked }))}
                      />
                      Free Allotment (chkBdmFreeAllot)
                    </label>
                  </div>

                  {/* Show in List */}
                  <div className={styles.formGroup}>
                    <label style={{ display: 'flex', alignItems: 'center', gap: '8px', cursor: 'pointer', fontSize: '13px', fontWeight: 600 }}>
                      <input
                        type="checkbox"
                        checked={form.bdm_show_in_list}
                        onChange={e => setForm(f => ({ ...f, bdm_show_in_list: e.target.checked }))}
                      />
                      Show in List (chkBdmShowInList)
                    </label>
                  </div>
                </div>

                {/* Remark (txtBdmRemark) */}
                <div className={styles.formGroup}>
                  <label>Remark (txtBdmRemark)</label>
                  <input
                    className={styles.formControl}
                    value={form.bdm_remark}
                    onChange={e => setForm(f => ({ ...f, bdm_remark: e.target.value }))}
                    placeholder="Enter remark"
                  />
                </div>

              </div>

              {/* Sub-services Grid (Mfgrd2 replica) */}
              <div style={{ border: '1px solid var(--border-light)', padding: '16px', borderRadius: '8px', marginBottom: '24px', backgroundColor: '#fff' }}>
                <div style={{ fontWeight: 700, fontSize: '13px', marginBottom: '16px', color: 'var(--text-primary)' }}>Bed Auto-Charge Services (Mfgrd2)</div>
                
                {/* Sub row editor */}
                <div style={{ display: 'flex', gap: '12px', flexWrap: 'wrap', alignItems: 'flex-end', marginBottom: '16px', backgroundColor: 'var(--bg-secondary)', padding: '12px', borderRadius: '6px', border: '1px dashed var(--border-light)' }}>
                  <div style={{ width: '50px' }}>
                    <label style={{ fontSize: '11px', display: 'block', marginBottom: '4px' }}>Sno</label>
                    <input className={styles.formControl} value={subSrvInput.sno} disabled style={{ height: '30px', textAlign: 'center', backgroundColor: '#e2e8f0' }} />
                  </div>

                  <div style={{ flex: 2, minWidth: '200px' }}>
                    <label style={{ fontSize: '11px', display: 'block', marginBottom: '4px' }}>Service Name (txtBsmSrvName)</label>
                    <input
                      className={styles.formControl}
                      value={subSrvInput.srv_name}
                      onChange={e => setSubSrvInput(prev => ({ ...prev, srv_name: e.target.value }))}
                      placeholder="e.g. Regular Ward Upkeep"
                      style={{ height: '30px' }}
                    />
                  </div>

                  <div style={{ width: '80px' }}>
                    <label style={{ fontSize: '11px', display: 'block', marginBottom: '4px' }}>Unit (mskBsmUnit)</label>
                    <input
                      type="number"
                      min="1"
                      className={styles.formControl}
                      value={subSrvInput.unit}
                      onChange={e => setSubSrvInput(prev => ({ ...prev, unit: e.target.value }))}
                      style={{ height: '30px', textAlign: 'right' }}
                    />
                  </div>

                  <div style={{ width: '120px' }}>
                    <label style={{ fontSize: '11px', display: 'block', marginBottom: '4px' }}>Rate (mskBsmRate)</label>
                    <input
                      type="number"
                      min="0"
                      step="0.01"
                      className={styles.formControl}
                      value={subSrvInput.rate}
                      onChange={e => setSubSrvInput(prev => ({ ...prev, rate: e.target.value }))}
                      style={{ height: '30px', textAlign: 'right' }}
                    />
                  </div>

                  <div>
                    <button
                      type="button"
                      onClick={handleAddSubService}
                      className={styles.primaryBtn}
                      style={{ height: '30px', padding: '0 16px', display: 'flex', alignItems: 'center' }}
                    >
                      {editingSubRowIndex !== null ? 'OK (cmdOK)' : 'Add (cmdOK)'}
                    </button>
                  </div>
                </div>

                {/* Sub grid list */}
                <div className={styles.tableContainer} style={{ maxHeight: '180px', overflowY: 'auto' }}>
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
                      {subServices.map((r, index) => (
                        <tr
                          key={index}
                          onClick={() => handleSelectSubRow(index)}
                          style={{
                            cursor: 'pointer',
                            backgroundColor: editingSubRowIndex === index ? 'var(--accent-light)' : 'transparent',
                            fontWeight: editingSubRowIndex === index ? 600 : 400
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
