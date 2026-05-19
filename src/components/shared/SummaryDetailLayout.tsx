"use client";

import React, { useState } from 'react';
import styles from './SummaryDetailLayout.module.css';

interface Props {
  summaryNode: React.ReactNode;
  detailNode: React.ReactNode;
  activeTab?: 'summary' | 'detail';
  onTabChange?: (tab: 'summary' | 'detail') => void;
}

export default function SummaryDetailLayout({ summaryNode, detailNode, activeTab: externalTab, onTabChange }: Props) {
  const [internalTab, setInternalTab] = useState<'summary' | 'detail'>('summary');
  const active = externalTab || internalTab;

  const handleTabChange = (tab: 'summary' | 'detail') => {
    if (onTabChange) onTabChange(tab);
    else setInternalTab(tab);
  };

  return (
    <div className={styles.container}>
      <div className={styles.tabs}>
        <button 
          className={`${styles.tab} ${active === 'summary' ? styles.active : ''}`}
          onClick={() => handleTabChange('summary')}
        >
          Summary List
        </button>
        <button 
          className={`${styles.tab} ${active === 'detail' ? styles.active : ''}`}
          onClick={() => handleTabChange('detail')}
        >
          Data Entry
        </button>
      </div>
      <div className={styles.content}>
        {active === 'summary' ? summaryNode : detailNode}
      </div>
    </div>
  );
}
