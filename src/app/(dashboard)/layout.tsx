"use client";
import React, { useEffect, useState } from 'react';
import { useRouter } from 'next/navigation';
import AppShell from '../../components/layout/AppShell';
import { useAuthStore } from '../../store/authStore';

export default function DashboardLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  const { token } = useAuthStore();
  const router = useRouter();
  const [mounted, setMounted] = useState(false);

  useEffect(() => {
    setMounted(true);
    if (!token) {
      router.replace('/login');
    }
  }, [token, router]);

  if (!mounted || !token) {
    return <div style={{ padding: 50, textAlign: 'center' }}>Loading System Modules...</div>;
  }

  return <AppShell>{children}</AppShell>;
}
