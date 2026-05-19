import React from 'react';
import Sidebar from './Sidebar';
import StatusBar from './StatusBar';
import styles from './AppShell.module.css';

export default function AppShell({ children }: { children: React.ReactNode }) {
  return (
    <div className={styles.appShell}>
      <aside className={styles.sidebarArea}>
        <Sidebar />
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
