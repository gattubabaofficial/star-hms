import React from 'react';
import { Sidebar } from './Sidebar';
import { StatusBar } from './StatusBar';

interface AppShellProps {
  children: React.ReactNode;
}

export const AppShell: React.FC<AppShellProps> = ({ children }) => {
  // In a real app, these would come from the global Zustand session store
  const mockSession = {
    company: 'STAR HOSPITAL',
    finYear: '2026-2027',
    user: 'Admin',
    role: 'Administrator',
    workDate: new Date().toLocaleDateString(),
  };

  return (
    <div className="flex flex-col h-screen overflow-hidden bg-medical-bg">
      <div className="flex flex-1 overflow-hidden">
        <Sidebar />
        <main className="flex-1 overflow-auto p-6">
          {children}
        </main>
      </div>
      <StatusBar {...mockSession} />
    </div>
  );
};

