"use client";
import React, { useState, useEffect } from 'react';
import { format } from 'date-fns';
import { useAuthStore } from '../../store/authStore';
import styles from './StatusBar.module.css';

export default function StatusBar() {
  const { company, user } = useAuthStore();
  const [time, setTime] = useState(new Date());

  useEffect(() => {
    const timer = setInterval(() => setTime(new Date()), 1000);
    return () => clearInterval(timer);
  }, []);

  return (
    <div className={styles.statusBar}>
      <div className={styles.section}>
        <span className={styles.label}>Company:</span>
        <span className={styles.value}>{company?.name || 'None Selected'}</span>
      </div>
      <div className={styles.divider} />
      <div className={styles.section}>
        <span className={styles.label}>User:</span>
        <span className={styles.value}>{user?.username || 'Guest'}</span>
      </div>
      <div className={styles.divider} />
      <div className={styles.section}>
        <span className={styles.label}>Role ID:</span>
        <span className={styles.value}>{user?.role || 'N/A'}</span>
      </div>
      <div className={styles.divider} />
      
      {/* Push clock to the right */}
      <div className={styles.clock}>
        {format(time, 'dd-MMM-yyyy | hh:mm:ss a')}
      </div>
    </div>
  );
}
