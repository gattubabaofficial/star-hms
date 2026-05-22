"use client";
import React, { useEffect, useState } from 'react';
import { useRouter } from 'next/navigation';
import AppShell from '../../components/layout/AppShell';
import { useAuthStore } from '../../store/authStore';
import { useHydrated } from '../../store/useHydration';

export default function DashboardLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  const { token } = useAuthStore();
  const router = useRouter();
  const [mounted, setMounted] = useState(false);
  const isHydrated = useHydrated();

  useEffect(() => {
    setMounted(true);
  }, []);

  useEffect(() => {
    if (mounted && isHydrated && !token) {
      router.replace('/login');
    }
  }, [token, router, mounted, isHydrated]);

  if (!mounted || !isHydrated) {
    return <div style={{ padding: 50, textAlign: 'center' }}>Loading System Modules...</div>;
  }

  if (!token) {
    return null; // Will redirect in useEffect
  }

  return <AppShell>{children}</AppShell>;
}
