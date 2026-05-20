import React from 'react';
import { Outlet } from 'react-router-dom';
import Sidebar from './Sidebar';
import StatusBar from './StatusBar';
import styles from './AppShell.module.css';

export default function AppShell() {
  return (
    <div className={styles.appShell}>
      <aside className={styles.sidebarArea}>
        <Sidebar />
      </aside>
      <main className={styles.mainArea}>
        <Outlet />
      </main>
      <footer className={styles.statusBarArea}>
        <StatusBar />
      </footer>
    </div>
  );
}
