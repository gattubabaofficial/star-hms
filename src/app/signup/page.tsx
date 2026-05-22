"use client";
import React, { useState, useEffect } from 'react';
import { useRouter } from 'next/navigation';
import apiClient from '@/lib/apiClient';
import { useAuthStore } from '../../store/authStore';
import { useHydrated } from '../../store/useHydration';

export default function Signup() {
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');
  const [companyCode, setCompanyCode] = useState('1');
  const [error, setError] = useState('');
  const [loading, setLoading] = useState(false);
  
  const { token } = useAuthStore();
  const isHydrated = useHydrated();
  const router = useRouter();

  useEffect(() => {
    if (isHydrated && token) {
      router.replace('/dashboard');
    }
  }, [isHydrated, token, router]);

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!username || !password || !companyCode) {
      setError('Please fill in all fields');
      return;
    }
    
    setLoading(true);
    setError('');

    try {
      await apiClient.post('/auth/register', {
        username,
        password,
        companyCode
      });
      alert('Registration successful! Please login.');
      router.push('/login');
    } catch (err: any) {
      setError(err.response?.data?.detail || 'Registration failed.');
    } finally {
      setLoading(false);
    }
  };

  return (
    <div style={{ display: 'flex', justifyContent: 'center', alignItems: 'center', height: '100vh', backgroundColor: 'var(--bg-primary)', fontFamily: 'var(--font-family)' }}>
      <div style={{ width: '400px', padding: '30px', backgroundColor: 'var(--bg-secondary)', border: '1px solid var(--border-color)', borderRadius: '8px', boxShadow: '0 4px 6px rgba(0,0,0,0.05)' }}>
        <h2 style={{ marginBottom: '10px', color: 'var(--text-primary)' }}>Sign Up</h2>
        <p style={{ color: 'var(--text-secondary)', marginBottom: '20px' }}>Create a new administrator account.</p>

        {error && <div style={{ padding: '10px', backgroundColor: 'rgba(229, 115, 115, 0.1)', color: 'var(--danger-color)', border: '1px solid var(--danger-color)', borderRadius: '4px', marginBottom: '15px', textAlign: 'center', fontSize: '13px' }}>{error}</div>}

        <form onSubmit={handleSubmit}>
          <div className="form-group">
            <label className="form-label">Company Code</label>
            <input 
              type="text" 
              className="form-control" 
              value={companyCode}
              onChange={(e) => setCompanyCode(e.target.value)}
              disabled={loading}
              placeholder="e.g. 1"
            />
          </div>

          <div className="form-group">
            <label className="form-label">Username</label>
            <input 
              type="text" 
              className="form-control" 
              value={username}
              onChange={(e) => setUsername(e.target.value)}
              disabled={loading}
            />
          </div>

          <div className="form-group">
            <label className="form-label">Password</label>
            <input 
              type="password" 
              className="form-control"
              value={password}
              onChange={(e) => setPassword(e.target.value)}
              disabled={loading}
            />
          </div>

          <div className="form-actions" style={{ justifyContent: 'space-between', alignItems: 'center' }}>
            <a href="/login" style={{ fontSize: '14px', color: 'var(--accent-color)' }}>Back to Login</a>
            <button type="submit" className="btn btn-primary" disabled={loading}>
              {loading ? 'Registering...' : 'Sign Up'}
            </button>
          </div>
        </form>
      </div>
    </div>
  );
}
