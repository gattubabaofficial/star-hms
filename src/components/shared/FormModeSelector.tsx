"use client";
import React from 'react';
import styles from './FormModeSelector.module.css';

export type FormMode = 'New' | 'Edit' | 'View' | 'Delete' | null;

interface Props {
  mode: FormMode;
  onModeChange: (mode: FormMode) => void;
  disabled?: boolean;
}

export default function FormModeSelector({ mode, onModeChange, disabled }: Props) {
  return (
    <div className={styles.container}>
      {['New', 'Edit', 'View', 'Delete'].map((m) => {
        const isActive = mode === m;
        return (
          <button 
            key={m}
            type="button"
            disabled={disabled}
            className={`${styles.button} ${isActive ? styles.active : ''}`}
            onClick={() => onModeChange(m as FormMode)}
          >
            {m}
          </button>
        );
      })}
    </div>
  );
}
