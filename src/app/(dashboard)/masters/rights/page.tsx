"use client";
import React, { useState, useEffect } from 'react';
import { Shield, Save, Check, X, ShieldAlert } from 'lucide-react';
import apiClient from '@/lib/apiClient';

interface Role {
  UrlCode: number;
  UrlName: string;
}

interface Permission {
  UhtSecuOptName: string;
  UhtCanAdd: boolean;
  UhtCanEdit: boolean;
  UhtCanDelete: boolean;
  UhtCanView: boolean;
}

const MODULES = [
  'General Transactions',
  'Hospital Outdoor',
  'Hospital Indoor',
  'Diagnostic Lab',
  'Medical Store',
  'Payroll Master',
  'Standard Masters',
  'System Maintenance'
];

export default function UserRights() {
  const [roles, setRoles] = useState<Role[]>([]);
  const [selectedRoleCode, setSelectedRoleCode] = useState<number | null>(null);
  const [permissions, setPermissions] = useState<Permission[]>([]);
  const [saving, setSaving] = useState(false);

  useEffect(() => {
    apiClient.get('/masters/user-roles')
      .then(res => {
        setRoles(res.data);
        if (res.data.length > 0) handleRoleSelect(res.data[0].UrlCode);
      });
  }, []);

  const handleRoleSelect = (roleCode: number) => {
    setSelectedRoleCode(roleCode);
    // Fetch permissions for this role
    apiClient.get(`/masters/user-rights/${roleCode}`)
      .then(res => {
        // If no permissions exist, initialize with defaults
        if (res.data.length === 0) {
          setPermissions(MODULES.map(m => ({
            UhtSecuOptName: m,
            UhtCanAdd: false,
            UhtCanEdit: false,
            UhtCanDelete: false,
            UhtCanView: false
          })));
        } else {
          setPermissions(res.data);
        }
      });
  };

  const togglePermission = (idx: number, field: keyof Permission) => {
    const newPerms = [...permissions];
    (newPerms[idx] as any)[field] = !newPerms[idx][field];
    setPermissions(newPerms);
  };

  const handleSave = async () => {
    if (!selectedRoleCode) return;
    setSaving(true);
    try {
      await apiClient.post(`/masters/user-rights/${selectedRoleCode}`, { permissions });
      alert('Permissions updated successfully!');
    } catch (e) {
      alert('Failed to save permissions');
    } finally {
      setSaving(false);
    }
  };

  return (
    <div style={{ padding: '40px', color: '#fff' }}>
      <header style={{ marginBottom: '30px', display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
        <div>
          <h1 style={{ fontSize: '24px', display: 'flex', alignItems: 'center', gap: '10px' }}>
            <Shield size={28} color="#fd7e14" /> User Rights Matrix (UsrRhtMs)
          </h1>
          <p style={{ color: '#868e96', margin: '5px 0 0' }}>Strict Functional Replica: System Security & Form Level Access.</p>
        </div>
        <button 
          onClick={handleSave}
          disabled={saving || !selectedRoleCode}
          style={{
            padding: '12px 24px',
            background: '#fd7e14',
            border: 'none',
            borderRadius: '12px',
            color: '#fff',
            fontWeight: 600,
            cursor: 'pointer',
            display: 'flex',
            alignItems: 'center',
            gap: '8px',
            opacity: saving ? 0.5 : 1
          }}
        >
          <Save size={18} /> {saving ? 'Saving...' : 'Save Permissions'}
        </button>
      </header>

      <div style={{ display: 'grid', gridTemplateColumns: '300px 1fr', gap: '30px' }}>
        {/* Role Selection */}
        <div style={{ 
          background: 'rgba(255,255,255,0.03)', 
          padding: '24px', 
          borderRadius: '20px',
          border: '1px solid rgba(255,255,255,0.1)',
          alignSelf: 'start'
        }}>
          <h3 style={{ marginBottom: '20px', fontSize: '18px', display: 'flex', alignItems: 'center', gap: '10px' }}>
            <ShieldAlert size={18} color="#adb5bd" /> User Roles
          </h3>
          <div style={{ display: 'flex', flexDirection: 'column', gap: '10px' }}>
            {roles.map(role => (
              <button
                key={role.UrlCode}
                onClick={() => handleRoleSelect(role.UrlCode)}
                style={{
                  padding: '12px 16px',
                  background: selectedRoleCode === role.UrlCode ? '#fd7e1420' : 'rgba(255,255,255,0.03)',
                  border: `1px solid ${selectedRoleCode === role.UrlCode ? '#fd7e14' : 'rgba(255,255,255,0.05)'}`,
                  borderRadius: '12px',
                  color: selectedRoleCode === role.UrlCode ? '#fd7e14' : '#adb5bd',
                  textAlign: 'left',
                  cursor: 'pointer',
                  fontWeight: selectedRoleCode === role.UrlCode ? 600 : 400,
                  transition: 'all 0.2s'
                }}
              >
                {role.UrlName}
              </button>
            ))}
          </div>
        </div>

        {/* Rights Matrix */}
        <div style={{ 
          background: 'rgba(255,255,255,0.03)', 
          borderRadius: '20px',
          border: '1px solid rgba(255,255,255,0.1)',
          overflow: 'hidden'
        }}>
          <table style={{ width: '100%', borderCollapse: 'collapse' }}>
            <thead style={{ background: 'rgba(255,255,255,0.05)' }}>
              <tr>
                <th style={{ padding: '15px', textAlign: 'left', fontSize: '14px', borderBottom: '1px solid #333' }}>Security Option / Module</th>
                <th style={{ padding: '15px', textAlign: 'center', fontSize: '14px', borderBottom: '1px solid #333' }}>View</th>
                <th style={{ padding: '15px', textAlign: 'center', fontSize: '14px', borderBottom: '1px solid #333' }}>Add</th>
                <th style={{ padding: '15px', textAlign: 'center', fontSize: '14px', borderBottom: '1px solid #333' }}>Edit</th>
                <th style={{ padding: '15px', textAlign: 'center', fontSize: '14px', borderBottom: '1px solid #333' }}>Delete</th>
              </tr>
            </thead>
            <tbody>
              {permissions.map((perm, idx) => (
                <tr key={idx} style={{ borderBottom: '1px solid rgba(255,255,255,0.05)' }}>
                  <td style={{ padding: '15px', fontWeight: 500 }}>{perm.UhtSecuOptName}</td>
                  {['UhtCanView', 'UhtCanAdd', 'UhtCanEdit', 'UhtCanDelete'].map((field) => (
                    <td key={field} style={{ padding: '15px', textAlign: 'center' }}>
                      <button 
                        onClick={() => togglePermission(idx, field as keyof Permission)}
                        style={{
                          width: '28px',
                          height: '28px',
                          background: (perm as any)[field] ? '#fd7e14' : 'rgba(255,255,255,0.05)',
                          border: 'none',
                          borderRadius: '8px',
                          color: (perm as any)[field] ? '#fff' : 'transparent',
                          cursor: 'pointer',
                          display: 'inline-flex',
                          alignItems: 'center',
                          justifyContent: 'center',
                          transition: 'all 0.2s'
                        }}
                      >
                        <Check size={16} />
                      </button>
                    </td>
                  ))}
                </tr>
              ))}
            </tbody>
          </table>
          {permissions.length === 0 && (
            <div style={{ padding: '40px', textAlign: 'center', color: '#5c5f66' }}>
              Select a role to visualize permissions.
            </div>
          )}
        </div>
      </div>
    </div>
  );
}
