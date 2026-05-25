import { create } from 'zustand';
import { persist } from 'zustand/middleware';
import api from '../lib/api';

export interface UserRight {
  opt_name: string;
  can_add: boolean;
  can_edit: boolean;
  can_delete: boolean;
  can_view: boolean;
}

export interface UserProfile {
  usr_code: number;
  username: string;
  role: string;
  rights: UserRight[];
}

interface AuthState {
  token: string | null;
  user: UserProfile | null;
  setToken: (token: string) => void;
  setUser: (user: UserProfile) => void;
  logout: () => void;
  fetchUser: () => Promise<void>;
}

export const useAuthStore = create<AuthState>()(
  persist(
    (set, get) => ({
      token: null,
      user: null,
      setToken: (token) => set({ token }),
      setUser: (user) => set({ user }),
      logout: () => set({ token: null, user: null }),
      fetchUser: async () => {
        const token = get().token;
        if (!token) return;
        try {
          const res = await api.get<UserProfile>('/auth/me');
          set({ user: res.data });
        } catch (error) {
          console.error("Failed to fetch user", error);
          set({ token: null, user: null });
        }
      },
    }),
    {
      name: 'hms-auth-storage',
      partialize: (state) => ({ token: state.token }), // Only persist token
    }
  )
);
