"use client";
import React, { useState } from 'react';
import { useRouter } from 'next/navigation';
import apiClient from '@/lib/apiClient';

export default function Signup() {
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');
  const [companyCode, setCompanyCode] = useState('1');
  const [error, setError] = useState('');
  const [loading, setLoading] = useState(false);
  
  const router = useRouter();

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
    <div style={{ display: 'flex', justifyContent: 'center', alignItems: 'center', height: '100vh', backgroundColor: '#f0f0f0' }}>
      <div style={{ width: '400px', padding: '30px', backgroundColor: '#fff', border: '1px solid #ccc' }}>
        <h2 style={{ marginBottom: '10px' }}>Sign Up</h2>
        <p style={{ color: '#666', marginBottom: '20px' }}>Create a new administrator account.</p>

        {error && <div style={{ padding: '10px', backgroundColor: '#f8d7da', color: '#721c24', marginBottom: '15px' }}>{error}</div>}

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
            <a href="/login" style={{ fontSize: '14px', color: '#0078d7' }}>Back to Login</a>
            <button type="submit" className="btn btn-primary" disabled={loading}>
              {loading ? 'Registering...' : 'Sign Up'}
            </button>
          </div>
        </form>
      </div>
    </div>
  );
}
