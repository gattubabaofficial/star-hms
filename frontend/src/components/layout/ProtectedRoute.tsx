import { useEffect } from 'react';
import { Navigate, Outlet } from 'react-router-dom';
import { useAuthStore } from '../../store/authStore';
import { AppShell } from './AppShell';

export function ProtectedRoute() {
  const token = useAuthStore(state => state.token);
  const user = useAuthStore(state => state.user);
  const fetchUser = useAuthStore(state => state.fetchUser);

  useEffect(() => {
    if (token && !user) {
      fetchUser();
    }
  }, [token, user, fetchUser]);

  if (!token) {
    return <Navigate to="/login" replace />;
  }

  // Optionally show a loading spinner while user is being fetched
  // if (token && !user) return <div>Loading...</div>;

  return (
    <AppShell>
      <Outlet />
    </AppShell>
  );
}
