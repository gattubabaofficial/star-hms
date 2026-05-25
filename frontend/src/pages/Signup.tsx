import { useState } from 'react';
import { useNavigate, Link } from 'react-router-dom';
import api from '../lib/api';
import { Building2, ShieldCheck, ChevronRight } from 'lucide-react';

export function Signup() {
  const [formData, setFormData] = useState({
    company_name: '',
    admin_username: '',
    admin_password: '',
    confirm_password: ''
  });
  const [error, setError] = useState('');
  const [success, setSuccess] = useState(false);
  const [isLoading, setIsLoading] = useState(false);
  const navigate = useNavigate();

  const handleSignup = async (e: React.FormEvent) => {
    e.preventDefault();
    setError('');

    if (formData.admin_password !== formData.confirm_password) {
      setError("Passwords do not match");
      return;
    }

    setIsLoading(true);

    try {
      await api.post('/setup/register-hospital', {
        company_name: formData.company_name,
        admin_username: formData.admin_username,
        admin_password: formData.admin_password
      });
      setSuccess(true);
      setTimeout(() => navigate('/login'), 2000);
    } catch (err: any) {
      setError(err.response?.data?.detail || 'Registration failed');
    } finally {
      setIsLoading(false);
    }
  };

  if (success) {
    return (
      <div className="min-h-screen bg-medical-bg flex flex-col justify-center py-12 sm:px-6 lg:px-8">
        <div className="sm:mx-auto sm:w-full sm:max-w-md text-center">
          <div className="mx-auto flex items-center justify-center h-16 w-16 rounded-full bg-green-100 mb-4">
            <ShieldCheck className="h-8 w-8 text-green-600" />
          </div>
          <h2 className="text-2xl font-bold text-gray-900 mb-2">Hospital Registered!</h2>
          <p className="text-gray-500">Redirecting to login portal...</p>
        </div>
      </div>
    );
  }

  return (
    <div className="min-h-screen bg-medical-bg flex flex-col justify-center py-12 sm:px-6 lg:px-8">
      <div className="sm:mx-auto sm:w-full sm:max-w-md flex flex-col items-center">
        <div className="w-16 h-16 bg-medical-mutedblue rounded-2xl flex items-center justify-center mb-4 shadow-lg shadow-blue-200">
          <Building2 className="w-8 h-8 text-white" />
        </div>
        <h2 className="mt-2 text-center text-3xl font-extrabold text-medical-text">
          Register Hospital
        </h2>
        <p className="mt-2 text-center text-sm text-gray-500">
          Set up a new workspace for your facility
        </p>
      </div>

      <div className="mt-8 sm:mx-auto sm:w-full sm:max-w-md">
        <div className="bg-white py-8 px-6 shadow sm:rounded-2xl border border-gray-100">
          <form className="space-y-6" onSubmit={handleSignup}>
            {error && (
              <div className="bg-red-50 border border-red-200 text-red-600 px-4 py-3 rounded-md text-sm">
                {error}
              </div>
            )}
            
            <div>
              <label className="block text-sm font-medium text-gray-700">Hospital / Company Name</label>
              <div className="mt-1">
                <input
                  type="text"
                  required
                  value={formData.company_name}
                  onChange={(e) => setFormData({ ...formData, company_name: e.target.value })}
                  className="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-medical-mutedblue focus:border-medical-mutedblue sm:text-sm"
                  placeholder="e.g. Apollo Super Specialty"
                />
              </div>
            </div>

            <div>
              <label className="block text-sm font-medium text-gray-700">Admin Username</label>
              <div className="mt-1">
                <input
                  type="text"
                  required
                  value={formData.admin_username}
                  onChange={(e) => setFormData({ ...formData, admin_username: e.target.value })}
                  className="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-medical-mutedblue focus:border-medical-mutedblue sm:text-sm"
                  placeholder="e.g. admin"
                />
              </div>
            </div>

            <div>
              <label className="block text-sm font-medium text-gray-700">Admin Password</label>
              <div className="mt-1">
                <input
                  type="password"
                  required
                  value={formData.admin_password}
                  onChange={(e) => setFormData({ ...formData, admin_password: e.target.value })}
                  className="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-medical-mutedblue focus:border-medical-mutedblue sm:text-sm"
                />
              </div>
            </div>

            <div>
              <label className="block text-sm font-medium text-gray-700">Confirm Password</label>
              <div className="mt-1">
                <input
                  type="password"
                  required
                  value={formData.confirm_password}
                  onChange={(e) => setFormData({ ...formData, confirm_password: e.target.value })}
                  className="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-medical-mutedblue focus:border-medical-mutedblue sm:text-sm"
                />
              </div>
            </div>

            <div>
              <button
                type="submit"
                disabled={isLoading}
                className="w-full flex justify-center items-center py-2.5 px-4 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-medical-mutedblue hover:bg-blue-600 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-medical-mutedblue disabled:opacity-50 transition-colors"
              >
                {isLoading ? 'Creating Workspace...' : 'Register Hospital'}
              </button>
            </div>
          </form>

          <div className="mt-6 border-t border-gray-100 pt-6 text-center">
            <Link to="/login" className="text-sm text-medical-mutedblue hover:text-blue-700 font-medium">
              Already registered? Login instead
            </Link>
          </div>
        </div>
      </div>
    </div>
  );
}
