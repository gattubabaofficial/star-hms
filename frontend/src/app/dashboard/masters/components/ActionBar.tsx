'use client';
import React, { useEffect } from 'react';
import styles from './ActionBar.module.css';
import { Plus, Edit2, RotateCw, Printer, FileText, FileSpreadsheet, Settings, Trash2, LogOut } from 'lucide-react';

interface ActionBarProps {
  onAdd?: () => void;
  onEdit?: () => void;
  onRefresh?: () => void;
  onPrintVoucher?: () => void;
  onPrintReport?: () => void;
  onExportExcel?: () => void;
  onConfigure?: () => void;
  onDelete?: () => void;
  onExit?: () => void;
  isEditing: boolean;
  hasSelected: boolean;
  disabledActions?: string[]; // e.g. ["print-voucher", "configure"]
}

export default function ActionBar({
  onAdd,
  onEdit,
  onRefresh,
  onPrintVoucher,
  onPrintReport,
  onExportExcel,
  onConfigure,
  onDelete,
  onExit,
  isEditing,
  hasSelected,
  disabledActions = [],
}: ActionBarProps) {
  
  useEffect(() => {
    const handleKeyDown = (e: KeyboardEvent) => {
      // Avoid hotkeys when typing in input fields, except Escape or Enter (for tab-like behavior)
      const activeEl = document.activeElement;
      const isInput = activeEl && (activeEl.tagName === 'INPUT' || activeEl.tagName === 'TEXTAREA' || activeEl.tagName === 'SELECT');
      
      // Escape key handler (unconditionally handle escape)
      if (e.key === 'Escape') {
        e.preventDefault();
        onExit?.();
        return;
      }

      if (isInput && e.key !== 'F5' && e.key !== 'F12') {
        // Let standard input event handle keys
        return;
      }

      // Add New (Ctrl + A)
      if (e.ctrlKey && e.key.toLowerCase() === 'a') {
        e.preventDefault();
        if (!isEditing) onAdd?.();
      }
      
      // Edit (Enter on table row or when hasSelected)
      if (e.key === 'Enter') {
        if (!isEditing && hasSelected) {
          e.preventDefault();
          onEdit?.();
        }
      }

      // Refresh List (F5)
      if (e.key === 'F5') {
        e.preventDefault();
        if (!isEditing) onRefresh?.();
      }

      // Print Voucher (Ctrl + P)
      if (e.ctrlKey && e.key.toLowerCase() === 'p') {
        e.preventDefault();
        if (!disabledActions.includes('print-voucher')) onPrintVoucher?.();
      }

      // Print Report (Ctrl + T)
      if (e.ctrlKey && e.key.toLowerCase() === 't') {
        e.preventDefault();
        if (!disabledActions.includes('print-report')) onPrintReport?.();
      }

      // Print to Excel (Ctrl + E)
      if (e.ctrlKey && e.key.toLowerCase() === 'e') {
        e.preventDefault();
        if (!disabledActions.includes('export-excel')) onExportExcel?.();
      }

      // Configure / Query (F12)
      if (e.key === 'F12') {
        e.preventDefault();
        if (!disabledActions.includes('configure')) onConfigure?.();
      }

      // Delete (Ctrl + D)
      if (e.ctrlKey && e.key.toLowerCase() === 'd') {
        e.preventDefault();
        if (!isEditing && hasSelected) onDelete?.();
      }
    };

    window.addEventListener('keydown', handleKeyDown);
    return () => {
      window.removeEventListener('keydown', handleKeyDown);
    };
  }, [onAdd, onEdit, onRefresh, onPrintVoucher, onPrintReport, onExportExcel, onConfigure, onDelete, onExit, isEditing, hasSelected, disabledActions]);

  return (
    <div className={styles.actionBar}>
      <button
        onClick={onAdd}
        disabled={isEditing}
        className={`${styles.actionBtn} ${styles.btnPrimary}`}
        title="Add New (Ctrl+A)"
      >
        <Plus size={16} />
        <span>Add New</span>
        <kbd className={styles.shortcut}>Ctrl+A</kbd>
      </button>

      <button
        onClick={onEdit}
        disabled={isEditing || !hasSelected}
        className={`${styles.actionBtn} ${styles.btnSecondary}`}
        title="Edit Select (Enter)"
      >
        <Edit2 size={16} />
        <span>Edit</span>
        <kbd className={styles.shortcut}>Enter</kbd>
      </button>

      <button
        onClick={onRefresh}
        disabled={isEditing}
        className={`${styles.actionBtn} ${styles.btnSecondary}`}
        title="Refresh List (F5)"
      >
        <RotateCw size={16} />
        <span>Refresh</span>
        <kbd className={styles.shortcut}>F5</kbd>
      </button>

      {!disabledActions.includes('print-voucher') && (
        <button
          onClick={onPrintVoucher}
          className={`${styles.actionBtn} ${styles.btnSecondary}`}
          title="Print Voucher (Ctrl+P)"
        >
          <Printer size={16} />
          <span>Print Voucher</span>
          <kbd className={styles.shortcut}>Ctrl+P</kbd>
        </button>
      )}

      {!disabledActions.includes('print-report') && (
        <button
          onClick={onPrintReport}
          className={`${styles.actionBtn} ${styles.btnSecondary}`}
          title="Print Report (Ctrl+T)"
        >
          <FileText size={16} />
          <span>Print Report</span>
          <kbd className={styles.shortcut}>Ctrl+T</kbd>
        </button>
      )}

      {!disabledActions.includes('export-excel') && (
        <button
          onClick={onExportExcel}
          className={`${styles.actionBtn} ${styles.btnSecondary}`}
          title="Export to Excel (Ctrl+E)"
        >
          <FileSpreadsheet size={16} />
          <span>Excel</span>
          <kbd className={styles.shortcut}>Ctrl+E</kbd>
        </button>
      )}

      {!disabledActions.includes('configure') && (
        <button
          onClick={onConfigure}
          className={`${styles.actionBtn} ${styles.btnSecondary}`}
          title="Configure / Query (F12)"
        >
          <Settings size={16} />
          <span>Config</span>
          <kbd className={styles.shortcut}>F12</kbd>
        </button>
      )}

      <button
        onClick={onDelete}
        disabled={isEditing || !hasSelected}
        className={`${styles.actionBtn} ${styles.btnDanger}`}
        title="Delete Record (Ctrl+D)"
      >
        <Trash2 size={16} />
        <span>Delete</span>
        <kbd className={styles.shortcut}>Ctrl+D</kbd>
      </button>

      <button
        onClick={onExit}
        className={`${styles.actionBtn} ${styles.btnExit}`}
        title="Exit Form (Esc)"
      >
        <LogOut size={16} />
        <span>Exit</span>
        <kbd className={styles.shortcut}>Esc</kbd>
      </button>
    </div>
  );
}
