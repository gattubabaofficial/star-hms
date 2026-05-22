"use client";
import React, { useState } from 'react';
import Sidebar from './Sidebar';
import StatusBar from './StatusBar';
import styles from './AppShell.module.css';

export default function AppShell({ children }: { children: React.ReactNode }) {
  const [isCollapsed, setIsCollapsed] = useState(false);

  return (
    <div className={`${styles.appShell} ${isCollapsed ? styles.collapsed : ''}`}>
      <aside className={styles.sidebarArea}>
        <Sidebar isCollapsed={isCollapsed} toggleCollapse={() => setIsCollapsed(!isCollapsed)} />
      </aside>
      <main className={styles.mainArea}>
        {children}
      </main>
      <footer className={styles.statusBarArea}>
        <StatusBar />
      </footer>
    </div>
  );
}
