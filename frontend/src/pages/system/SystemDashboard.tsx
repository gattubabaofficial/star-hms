import { useState, useRef, useEffect } from 'react';
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import api from '../../lib/api';
import { Building2, Users, Save, Shield, Trash2, CheckSquare } from 'lucide-react';
import { useFormValidation } from '../../lib/useFormValidation';
import { useFormKeyboard } from '../../lib/useFormKeyboard';
import { useAuthStore } from '../../store/authStore';

const MODULES = ["Dashboard", "OPD", "IPD", "Hospital Masters", "Reports", "Pharmacy", "Laboratory", "System"];

export function SystemDashboard() {
  const formRef = useRef<HTMLFormElement>(null);
  useFormKeyboard(formRef);
  useFormValidation(formRef);

  const queryClient = useQueryClient();
  const currentUser = useAuthStore(state => state.user);
  const [activeTab, setActiveTab] = useState<'profile' | 'users'>('profile');

  // Hospital Profile State
  const [company, setCompany] = useState({
    CmpName: '', CmpAddress: '', CmpCity: '', CmpState: '', 
    CmpOPhone: '', CmpEmail: '', CmpWebsite: '', CmpReg1: ''
  });

  const { data: companyData, isLoading: compLoading } = useQuery({
    queryKey: ['company'],
    queryFn: async () => (await api.get('/system/company')).data,
    refetchInterval: 30000
  });

  useEffect(() => {
    if (companyData) setCompany(companyData);
  }, [companyData]);

  const updateCompanyMut = useMutation({
    mutationFn: async (data: any) => (await api.post('/system/company', data)).data,
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['company'] });
      alert('Hospital Profile Updated Successfully!');
    }
  });

  const handleCompanySave = (e: React.FormEvent) => {
    e.preventDefault();
    updateCompanyMut.mutate(company);
  };

  // User Management State
  const { data: roles } = useQuery({ queryKey: ['roles'], queryFn: async () => (await api.get<any[]>('/auth/roles')).data,
    refetchInterval: 30000 });
  const { data: users } = useQuery({ queryKey: ['users'], queryFn: async () => (await api.get<any[]>('/auth/users')).data,
    refetchInterval: 30000 });

  const [newUser, setNewUser] = useState({ UsrName: '', UsrUrlCode: 0, UsrPwd: '' });
  
  // Role Creation State
  const [newRoleName, setNewRoleName] = useState('');
  const [roleRights, setRoleRights] = useState(
    MODULES.map(m => ({ UhtSecuOptName: m, UhtCanView: false, UhtCanAdd: false, UhtCanEdit: false, UhtCanDelete: false }))
  );

  const toggleRight = (index: number, field: keyof typeof roleRights[0]) => {
    const updated = [...roleRights];
    (updated[index] as any)[field] = !(updated[index] as any)[field];
    // Auto check 'View' if any other right is granted
    if (field !== 'UhtCanView' && (updated[index] as any)[field]) {
      updated[index].UhtCanView = true;
    }
    setRoleRights(updated);
  };

  const roleMut = useMutation({
    mutationFn: async (data: any) => (await api.post('/auth/roles', data)).data,
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['roles'] });
      setNewRoleName('');
      setRoleRights(MODULES.map(m => ({ UhtSecuOptName: m, UhtCanView: false, UhtCanAdd: false, UhtCanEdit: false, UhtCanDelete: false })));
      alert("Role created successfully");
    }
  });

  const deleteRoleMut = useMutation({
    mutationFn: async (id: number) => (await api.delete(`/auth/roles/${id}`)).data,
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['roles'] });
    }
  });

  const userMut = useMutation({
    mutationFn: async (data: any) => (await api.post('/auth/users', data)).data,
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['users'] });
      setNewUser({ UsrName: '', UsrUrlCode: 0, UsrPwd: '' });
      alert("User created successfully");
    }
  });

  const handleRoleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    if (!newRoleName) return;
    roleMut.mutate({
      UrlName: newRoleName,
      rights: roleRights
    });
  };

  const handleDeleteRole = (id: number, name: string) => {
    if (window.confirm(`Are you sure you want to delete the role '${name}'?`)) {
      deleteRoleMut.mutate(id);
    }
  };

  return (
    <div className="max-w-6xl mx-auto space-y-6">
      <div>
        <h1 className="text-2xl font-bold text-medical-text">System Administration</h1>
        <p className="text-gray-500 text-sm mt-1">Manage global settings, hospital profile, and user access.</p>
      </div>

      <div className="flex gap-2 border-b border-medical-border">
        <button onClick={() => setActiveTab('profile')} className={`px-4 py-2 flex items-center gap-2 font-medium text-sm transition-colors ${activeTab === 'profile' ? 'border-b-2 border-medical-primary text-medical-primary' : 'text-gray-500 hover:text-gray-700'}`}>
          <Building2 size={16} /> Hospital Profile
        </button>
        <button onClick={() => setActiveTab('users')} className={`px-4 py-2 flex items-center gap-2 font-medium text-sm transition-colors ${activeTab === 'users' ? 'border-b-2 border-medical-primary text-medical-primary' : 'text-gray-500 hover:text-gray-700'}`}>
          <Users size={16} /> User Management
        </button>
      </div>

      {activeTab === 'profile' && (
        <div className="card max-w-3xl">
          <h2 className="text-lg font-semibold text-gray-800 mb-6">Hospital Information</h2>
          {compLoading ? <p>Loading...</p> : (
            <form ref={formRef} onSubmit={handleCompanySave} className="space-y-4">
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Hospital Name (Company) <span className="text-red-500">*</span></label>
                <input type="text" value={company.CmpName} onChange={e => setCompany({...company, CmpName: e.target.value})} className="input-field" required />
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Address</label>
                <input type="text" value={company.CmpAddress || ''} onChange={e => setCompany({...company, CmpAddress: e.target.value})} className="input-field" />
              </div>
              <div className="grid grid-cols-2 gap-4">
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">City</label>
                  <input type="text" value={company.CmpCity || ''} onChange={e => setCompany({...company, CmpCity: e.target.value})} className="input-field" />
                </div>
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">State</label>
                  <input type="text" value={company.CmpState || ''} onChange={e => setCompany({...company, CmpState: e.target.value})} className="input-field" />
                </div>
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">Phone</label>
                  <input type="text" value={company.CmpOPhone || ''} onChange={e => setCompany({...company, CmpOPhone: e.target.value})} className="input-field" />
                </div>
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">Email</label>
                  <input type="email" value={company.CmpEmail || ''} onChange={e => setCompany({...company, CmpEmail: e.target.value})} className="input-field" />
                </div>
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">Website</label>
                  <input type="text" value={company.CmpWebsite || ''} onChange={e => setCompany({...company, CmpWebsite: e.target.value})} className="input-field" />
                </div>
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">Registration No. (Reg1)</label>
                  <input type="text" value={company.CmpReg1 || ''} onChange={e => setCompany({...company, CmpReg1: e.target.value})} className="input-field" />
                </div>
              </div>
              <div className="pt-4 flex justify-end">
                <button type="submit" disabled={updateCompanyMut.isPending} className="btn-primary flex items-center gap-2">
                  <Save size={18} /> {updateCompanyMut.isPending ? 'Saving...' : 'Save Profile'}
                </button>
              </div>
            </form>
          )}
        </div>
      )}

      {activeTab === 'users' && (
        <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
          {/* Roles & Privileges Management */}
          <div className="card">
            <h2 className="text-lg font-semibold text-gray-800 mb-4 flex items-center gap-2"><Shield size={18}/> Roles & Privileges</h2>
            
            <form ref={formRef} onSubmit={handleRoleSubmit} className="mb-6 space-y-4">
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">New Role Name <span className="text-red-500">*</span></label>
                <input type="text" placeholder="e.g. Receptionist" value={newRoleName} onChange={e => setNewRoleName(e.target.value)} className="w-full px-3 py-2 border border-medical-border rounded-md text-sm" required />
              </div>

              <div className="border border-medical-border rounded-md overflow-hidden">
                <table className="w-full text-left text-sm">
                  <thead className="bg-gray-50 border-b border-medical-border">
                    <tr>
                      <th className="p-2 font-medium text-gray-700">Module</th>
                      <th className="p-2 font-medium text-gray-700 text-center">View</th>
                      <th className="p-2 font-medium text-gray-700 text-center">Add</th>
                      <th className="p-2 font-medium text-gray-700 text-center">Edit</th>
                      <th className="p-2 font-medium text-gray-700 text-center">Delete</th>
                    </tr>
                  </thead>
                  <tbody className="divide-y divide-gray-100">
                    {roleRights.map((right, idx) => (
                      <tr key={right.UhtSecuOptName} className="hover:bg-gray-50">
                        <td className="p-2 font-medium text-gray-600">{right.UhtSecuOptName}</td>
                        <td className="p-2 text-center"><input type="checkbox" checked={right.UhtCanView} onChange={() => toggleRight(idx, 'UhtCanView')} className="w-4 h-4 text-medical-primary rounded" /></td>
                        <td className="p-2 text-center"><input type="checkbox" checked={right.UhtCanAdd} onChange={() => toggleRight(idx, 'UhtCanAdd')} className="w-4 h-4 text-medical-primary rounded" /></td>
                        <td className="p-2 text-center"><input type="checkbox" checked={right.UhtCanEdit} onChange={() => toggleRight(idx, 'UhtCanEdit')} className="w-4 h-4 text-medical-primary rounded" /></td>
                        <td className="p-2 text-center"><input type="checkbox" checked={right.UhtCanDelete} onChange={() => toggleRight(idx, 'UhtCanDelete')} className="w-4 h-4 text-medical-primary rounded" /></td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              </div>
              <div className="flex justify-end">
                <button type="submit" disabled={roleMut.isPending} className="btn-primary py-1.5 px-4 text-sm flex items-center gap-2">
                  <CheckSquare size={16} /> Create Role
                </button>
              </div>
            </form>

            <h3 className="text-sm font-semibold text-gray-700 mb-2">Existing Roles</h3>
            <div className="overflow-y-auto max-h-60 border border-medical-border rounded">
              <table className="w-full text-left text-sm">
                <thead className="bg-gray-50"><tr className="border-b"><th className="p-2 font-medium">Role Name</th><th className="p-2 w-10"></th></tr></thead>
                <tbody>
                  {roles?.map(r => (
                    <tr key={r.UrlCode} className="border-b hover:bg-gray-50">
                      <td className="p-2">{r.UrlName}</td>
                      <td className="p-2 text-center">
                        <button onClick={() => handleDeleteRole(r.UrlCode, r.UrlName)} className="text-gray-400 hover:text-red-500">
                          <Trash2 size={16} />
                        </button>
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          </div>

          {/* Users Management */}
          <div className="card">
            <h2 className="text-lg font-semibold text-gray-800 mb-4 flex items-center gap-2"><Users size={18}/> System Users</h2>
            <form ref={formRef} onSubmit={e => { e.preventDefault(); if(newUser.UsrUrlCode && newUser.UsrName && newUser.UsrPwd) userMut.mutate(newUser); else alert('All fields required'); }} className="space-y-4 mb-6 border-b pb-6">
              <div>
                <label className="block text-xs text-gray-600 mb-1">Username</label>
                <input type="text" placeholder="Username" value={newUser.UsrName} onChange={e => setNewUser({...newUser, UsrName: e.target.value})} className="w-full px-3 py-1.5 border border-medical-border rounded-md text-sm" required />
              </div>
              <div>
                <label className="block text-xs text-gray-600 mb-1">Role</label>
                <select value={newUser.UsrUrlCode} onChange={e => setNewUser({...newUser, UsrUrlCode: Number(e.target.value)})} className="w-full px-3 py-1.5 border border-medical-border rounded-md text-sm" required>
                  <option value={0}>Select Role</option>
                  {roles?.map(r => <option key={r.UrlCode} value={r.UrlCode}>{r.UrlName}</option>)}
                </select>
              </div>
              <div>
                <label className="block text-xs text-gray-600 mb-1">Password</label>
                <input type="password" placeholder="***" value={newUser.UsrPwd} onChange={e => setNewUser({...newUser, UsrPwd: e.target.value})} className="w-full px-3 py-1.5 border border-medical-border rounded-md text-sm" required />
              </div>
              <div>
                <button type="submit" disabled={userMut.isPending} className="btn-primary py-1.5 px-4 text-sm w-full">Create User</button>
              </div>
            </form>

            <h3 className="text-sm font-semibold text-gray-700 mb-2">Active Users</h3>
            <div className="overflow-y-auto max-h-60 border border-medical-border rounded">
              <table className="w-full text-left text-sm">
                <thead className="bg-gray-50"><tr className="border-b"><th className="p-2 font-medium">Username</th><th className="p-2 font-medium">Role</th></tr></thead>
                <tbody>
                  {users?.map(u => (
                    <tr key={u.UsrCode} className="border-b hover:bg-gray-50">
                      <td className="p-2 font-medium">{u.UsrName}</td>
                      <td className="p-2 text-gray-600">{roles?.find(r => r.UrlCode === u.UsrUrlCode)?.UrlName || 'Admin'}</td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}


