import { create } from 'zustand';
import { persist } from 'zustand/middleware';

interface User {
  username: string;
  code: number;
  role: number | null;
}

interface Company {
  code: number;
  name: string;
}

interface AuthState {
  token: string | null;
  user: User | null;
  company: Company | null;
  setAuth: (token: string, user: User, company: Company) => void;
  logout: () => void;
}

export const useAuthStore = create<AuthState>()(
  persist(
    (set) => ({
      token: null,
      user: null,
      company: null,
      setAuth: (token, user, company) => set({ token, user, company }),
      logout: () => set({ token: null, user: null, company: null }),
    }),
    {
      name: 'hms-auth-storage', // Key in local storage
    }
  )
);
