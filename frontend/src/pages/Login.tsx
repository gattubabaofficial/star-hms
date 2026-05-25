import { useState, useEffect } from 'react';
import { useNavigate, Link } from 'react-router-dom';
import { useAuthStore } from '../store/authStore';
import api from '../lib/api';
import { HeartPulse } from 'lucide-react';

interface Company {
  CmpCode: number;
  CmpName: string;
}

export function Login() {
  const [companies, setCompanies] = useState<Company[]>([]);
  const [selectedCompany, setSelectedCompany] = useState('');
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');
  const [error, setError] = useState('');
  const [isLoading, setIsLoading] = useState(false);
  
  const navigate = useNavigate();
  const setToken = useAuthStore(state => state.setToken);
  const fetchUser = useAuthStore(state => state.fetchUser);

  useEffect(() => {
    // Fetch registered companies for the dropdown
    api.get<Company[]>('/auth/companies')
      .then(res => {
        setCompanies(res.data);
        if (res.data.length > 0) {
          setSelectedCompany(res.data[0].CmpCode.toString());
        }
      })
      .catch(err => console.error('Failed to load companies', err));
  }, []);

  const handleLogin = async (e: React.FormEvent) => {
    e.preventDefault();
    setError('');
    setIsLoading(true);

    try {
      const formData = new URLSearchParams();
      formData.append('username', username);
      formData.append('password', password);
      // In a real multi-tenant scenario, we would also validate the selected company
      // For now, the username + password resolves to the correct user who already has a CmpCode

      const response = await api.post('/auth/login', formData, {
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
      });

      setToken(response.data.access_token);
      await fetchUser();
      navigate('/dashboard');
    } catch (err: any) {
      setError(err.response?.data?.detail || 'An error occurred during login');
    } finally {
      setIsLoading(false);
    }
  };

  return (
    <div className="min-h-screen bg-medical-bg flex flex-col justify-center py-12 sm:px-6 lg:px-8">
      <div className="sm:mx-auto sm:w-full sm:max-w-md flex flex-col items-center">
        <div className="w-16 h-16 bg-medical-mutedblue rounded-full flex items-center justify-center mb-4 shadow-lg shadow-blue-200">
          <HeartPulse className="w-10 h-10 text-white" />
        </div>
        <h2 className="mt-2 text-center text-3xl font-extrabold text-medical-text">
          Star Hospital HMS
        </h2>
        <p className="mt-2 text-center text-sm text-gray-500">
          Sign in to your account
        </p>
      </div>

      <div className="mt-8 sm:mx-auto sm:w-full sm:max-w-md">
        <div className="bg-white py-8 px-6 shadow sm:rounded-2xl border border-gray-100">
          <form className="space-y-6" onSubmit={handleLogin}>
            {error && (
              <div className="bg-red-50 border border-red-200 text-red-600 px-4 py-3 rounded-md text-sm">
                {error}
              </div>
            )}
            
            <div>
              <label className="block text-sm font-medium text-gray-700">
                Hospital / Workspace
              </label>
              <div className="mt-1">
                <select
                  required
                  value={selectedCompany}
                  onChange={(e) => setSelectedCompany(e.target.value)}
                  className="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-medical-mutedblue focus:border-medical-mutedblue sm:text-sm bg-white"
                >
                  {companies.length === 0 && <option value="">Loading workspaces...</option>}
                  {companies.map(c => (
                    <option key={c.CmpCode} value={c.CmpCode}>{c.CmpName}</option>
                  ))}
                </select>
              </div>
            </div>

            <div>
              <label className="block text-sm font-medium text-gray-700">
                Username
              </label>
              <div className="mt-1">
                <input
                  type="text"
                  required
                  value={username}
                  onChange={(e) => setUsername(e.target.value)}
                  className="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-medical-mutedblue focus:border-medical-mutedblue sm:text-sm"
                />
              </div>
            </div>

            <div>
              <label className="block text-sm font-medium text-gray-700">
                Password
              </label>
              <div className="mt-1">
                <input
                  type="password"
                  required
                  value={password}
                  onChange={(e) => setPassword(e.target.value)}
                  className="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-medical-mutedblue focus:border-medical-mutedblue sm:text-sm"
                />
              </div>
            </div>

            <div>
              <button
                type="submit"
                disabled={isLoading}
                className="w-full flex justify-center py-2.5 px-4 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-medical-mutedblue hover:bg-blue-600 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-medical-mutedblue disabled:opacity-50 transition-colors"
              >
                {isLoading ? 'Signing in...' : 'Sign in'}
              </button>
            </div>
          </form>

          <div className="mt-6 border-t border-gray-100 pt-6 text-center">
            <Link to="/signup" className="text-sm text-medical-mutedblue hover:text-blue-700 font-medium">
              Register a new hospital
            </Link>
          </div>
        </div>
      </div>
    </div>
  );
}
