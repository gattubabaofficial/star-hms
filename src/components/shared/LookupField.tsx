"use client";
import React, { useState, useEffect, useRef } from 'react';
import apiClient from '@/lib/apiClient';
import styles from './LookupField.module.css';

interface Props {
  endpoint: string;
  valueKey: string;
  labelKey: string;
  value: number | string | null;
  onChange: (val: any, fullRecord: any) => void;
  placeholder?: string;
  disabled?: boolean;
}

export default function LookupField({ endpoint, valueKey, labelKey, value, onChange, placeholder, disabled }: Props) {
  const [query, setQuery] = useState('');
  const [results, setResults] = useState<any[]>([]);
  const [isOpen, setIsOpen] = useState(false);
  const containerRef = useRef<HTMLDivElement>(null);

  useEffect(() => {
    // If value changes externally, we might want to fetch its label, 
    // but for simplicity, we assume the parent components feed the raw label back to 'query' if needed.
    // In a master implementation, if 'value' is set, we'd fetch that ID to populate 'query'.
  }, [value]);

  useEffect(() => {
    const handleClickOutside = (event: MouseEvent) => {
      if (containerRef.current && !containerRef.current.contains(event.target as Node)) {
        setIsOpen(false);
      }
    };
    document.addEventListener('mousedown', handleClickOutside);
    return () => document.removeEventListener('mousedown', handleClickOutside);
  }, []);

  const handleSearch = async (searchTerm: string) => {
    setQuery(searchTerm);
    if (searchTerm.length < 2) {
      setResults([]);
      setIsOpen(false);
      return;
    }

    try {
      // API endpoints should support ?q=xyz
      const res = await apiClient.get(`${endpoint}?q=${encodeURIComponent(searchTerm)}`);
      setResults(res.data);
      setIsOpen(true);
    } catch (error) {
      console.error('Lookup search error:', error);
    }
  };

  const handleSelect = (record: any) => {
    setQuery(record[labelKey]);
    setIsOpen(false);
    onChange(record[valueKey], record);
  };

  return (
    <div className={styles.lookupContainer} ref={containerRef}>
      <input 
        type="text" 
        className={styles.input} 
        value={query}
        onChange={(e) => handleSearch(e.target.value)}
        placeholder={placeholder || 'Search...'}
        disabled={disabled}
        onClick={() => { if(query.length >= 2) setIsOpen(true) }}
      />
      {isOpen && results.length > 0 && (
        <ul className={styles.dropdown}>
          {results.map((res, i) => (
            <li key={i} onClick={() => handleSelect(res)} className={styles.listItem}>
              {res[labelKey]}
            </li>
          ))}
        </ul>
      )}
    </div>
  );
}
