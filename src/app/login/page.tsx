"use client";
import React, { useState, useEffect } from 'react';
import { useRouter } from 'next/navigation';
import apiClient from '@/lib/apiClient';
import { useAuthStore } from '../../store/authStore';
import styles from './Login.module.css';

interface CompanyConfig {
  CmpCode: number;
  CmpName: string;
}

export default function Login() {
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');
  const [companyCode, setCompanyCode] = useState('');
  const [companies, setCompanies] = useState<CompanyConfig[]>([]);
  const [error, setError] = useState('');
  const [loading, setLoading] = useState(false);
  
  const setAuth = useAuthStore((state) => state.setAuth);
  const router = useRouter();

  useEffect(() => {
    // Fetch companies on mount
    apiClient.get('/auth/companies')
      .then(res => {
        setCompanies(res.data);
        if (res.data.length > 0) {
          setCompanyCode(res.data[0].CmpCode.toString());
        }
      })
      .catch(err => console.error('Failed to load companies:', err));
  }, []);

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!username || !password || !companyCode) {
      setError('Please fill in all fields');
      return;
    }
    
    setLoading(true);
    setError('');

    try {
      const response = await apiClient.post('/auth/login', {
        username,
        password,
        companyCode: parseInt(companyCode, 10)
      });
      
      const { token, user, company } = response.data;
      setAuth(token, user, company);
      router.push('/');
    } catch (err: any) {
      setError(err.response?.data?.error || 'Login failed. Please verify credentials.');
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className={styles.container}>
      <div className={styles.glassCard}>
        <div className={styles.header}>
          <h1>HMS Portal</h1>
          <p>Login to Access Enterprise Hospital Server</p>
        </div>

        {error && <div className={styles.error}>{error}</div>}

        <form className={styles.form} onSubmit={handleSubmit}>
          <div className={styles.formGroup}>
            <label htmlFor="company">Company / Branch</label>
            <select 
              id="company"
              className={styles.input} 
              value={companyCode}
              onChange={(e) => setCompanyCode(e.target.value)}
              disabled={loading || companies.length === 0}
            >
              {companies.map(c => (
                <option key={c.CmpCode} value={c.CmpCode}>{c.CmpName}</option>
              ))}
            </select>
          </div>

          <div className={styles.formGroup}>
            <label htmlFor="username">User Code or Username</label>
            <input 
              id="username"
              type="text" 
              className={styles.input} 
              value={username}
              onChange={(e) => setUsername(e.target.value)}
              placeholder="e.g. 1 or admin"
              disabled={loading}
            />
          </div>

          <div className={styles.formGroup}>
            <label htmlFor="password">Password</label>
            <input 
              id="password"
              type="password" 
              className={styles.input}
              value={password}
              onChange={(e) => setPassword(e.target.value)}
              placeholder="••••••••"
              disabled={loading}
            />
          </div>

          <button type="submit" className={styles.button} disabled={loading}>
            {loading ? 'Authenticating...' : 'Sign In'}
          </button>
        </form>
      </div>
    </div>
  );
}
