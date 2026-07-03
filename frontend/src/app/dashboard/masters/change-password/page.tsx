'use client';
import React, { useState, useEffect } from 'react';
import { useRouter } from 'next/navigation';
import styles from '../../../dashboard.module.css';
import { AlertCircle, Check, KeyRound } from 'lucide-react';

interface User {
  UsrCode: number;
  UsrName: string;
}

const API = process.env.NEXT_PUBLIC_API_URL || 'http://localhost:8000';
const getToken = () => typeof window !== 'undefined' ? localStorage.getItem('token') : '';
const authHdr = () => ({ 'Content-Type': 'application/json', Authorization: `Bearer ${getToken()}` });

export default function ChangePasswordPage() {
  const router = useRouter();
  
  const [users, setUsers] = useState<User[]>([]);
  const [form, setForm] = useState({
    UsrCode: '',
    current_password: '',
    new_password: '',
    confirm_password: '',
  });

  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');
  const [success, setSuccess] = useState('');

  useEffect(() => {
    const loadUsers = async () => {
      try {
        const res = await fetch(`${API}/api/masters/users`, { headers: authHdr() });
        if (res.ok) {
          const data = await res.json();
          setUsers(data);
          // Try to set first user as default selection
          if (data.length > 0) {
            setForm(prev => ({ ...prev, UsrCode: data[0].UsrCode.toString() }));
          }
        }
      } catch (e) {
        console.error('Error loading users:', e);
      }
    };
    loadUsers();
  }, []);

  const handleSave = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!form.UsrCode) {
      setError('Please select a user');
      return;
    }
    if (!form.current_password) {
      setError('Current password is required');
      return;
    }
    if (!form.new_password) {
      setError('New password is required');
      return;
    }
    if (form.new_password !== form.confirm_password) {
      setError('New passwords do not match');
      return;
    }

    setLoading(true);
    setError('');
    setSuccess('');

    try {
      const payload = {
        UsrCode: parseInt(form.UsrCode),
        current_password: form.current_password,
        new_password: form.new_password,
      };

      const res = await fetch(`${API}/api/masters/users/change-password`, {
        method: 'POST',
        headers: authHdr(),
        body: JSON.stringify(payload),
      });

      if (!res.ok) {
        throw new Error(await res.text());
      }

      setSuccess('Password changed successfully');
      setForm(prev => ({
        ...prev,
        current_password: '',
        new_password: '',
        confirm_password: '',
      }));
    } catch (e: any) {
      setError(e.message || 'Error changing password. Ensure current password is correct.');
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className={styles.container}>
      <div className={styles.header}>
        <div>
          <h1 className={styles.title}>Change User Password</h1>
          <p className={styles.subtitle}>Update account access credentials [UserMast.frm]</p>
        </div>
      </div>

      <div style={{ maxWidth: '600px', margin: '40px auto 0 auto' }}>
        {error && (
          <div className={styles.errorAlert} style={{ marginBottom: '20px' }}>
            <AlertCircle size={18} />
            <span>{error}</span>
          </div>
        )}

        {success && (
          <div className={styles.successAlert} style={{ marginBottom: '20px' }}>
            <Check size={18} />
            <span>{success}</span>
          </div>
        )}

        <div className={styles.formContainer}>
          <div style={{ display: 'flex', alignItems: 'center', gap: '12px', marginBottom: '24px' }}>
            <KeyRound size={24} style={{ color: 'var(--accent-color)' }} />
            <h2 className={styles.formTitle} style={{ margin: 0 }}>Reset Credentials</h2>
          </div>

          <form onSubmit={handleSave} className={styles.gridForm}>
            <div className={styles.formGroup} style={{ gridColumn: 'span 2' }}>
              <label className={styles.requiredLabel}>Select User Account</label>
              <select
                value={form.UsrCode}
                onChange={e => setForm({ ...form, UsrCode: e.target.value })}
                required
              >
                <option value="">Select a user...</option>
                {users.map(u => (
                  <option key={u.UsrCode} value={u.UsrCode}>
                    {u.UsrName}
                  </option>
                ))}
              </select>
            </div>

            <div className={styles.formGroup} style={{ gridColumn: 'span 2' }}>
              <label className={styles.requiredLabel}>Current Password</label>
              <input
                type="password"
                value={form.current_password}
                onChange={e => setForm({ ...form, current_password: e.target.value })}
                required
                placeholder="Enter current password"
              />
            </div>

            <div className={styles.formGroup}>
              <label className={styles.requiredLabel}>New Password</label>
              <input
                type="password"
                value={form.new_password}
                onChange={e => setForm({ ...form, new_password: e.target.value })}
                required
                placeholder="Enter new password"
              />
            </div>

            <div className={styles.formGroup}>
              <label className={styles.requiredLabel}>Confirm New Password</label>
              <input
                type="password"
                value={form.confirm_password}
                onChange={e => setForm({ ...form, confirm_password: e.target.value })}
                required
                placeholder="Confirm new password"
              />
            </div>

            <div style={{ gridColumn: 'span 2', display: 'flex', justifyContent: 'flex-end', marginTop: '16px' }}>
              <button
                type="submit"
                disabled={loading}
                className={styles.primaryBtn}
                style={{ padding: '10px 24px' }}
              >
                {loading ? 'Updating...' : 'Change Password'}
              </button>
            </div>
          </form>
        </div>
      </div>
    </div>
  );
}
