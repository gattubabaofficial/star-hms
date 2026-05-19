"use client";
import React, { useState } from 'react';
import Link from 'next/link';
import { useRouter, usePathname } from 'next/navigation';
import { 
  Building2, 
  Users, 
  Bed, 
  FlaskConical, 
  ShoppingCart, 
  ClipboardList, 
  ShieldCheck,
  ChevronRight, 
  ChevronDown,
  LayoutDashboard
} from 'lucide-react';
import styles from './Sidebar.module.css';

interface MenuItem {
  id: string;
  title: string;
  icon: React.FC<{ size?: number, className?: string }>;
  path?: string;
  children?: { id: string; title: string; path: string }[];
}

const MENU_DATA: MenuItem[] = [
  { id: 'dashboard', title: 'Home Dashboard', icon: LayoutDashboard, path: '/' },
  {
    id: 'opd',
    title: 'Hospital Outdoor',
    icon: Users,
    children: [
      { id: 'opd-reg', title: 'Registration', path: '/opd/registration' },
      { id: 'opd-bill', title: 'Billing & Receipt', path: '/opd/billing' },
      { id: 'opd-fin', title: 'Payments & Refunds', path: '/opd/finance' },
    ]
  },
  {
    id: 'ipd',
    title: 'Hospital Indoor',
    icon: Bed,
    children: [
      { id: 'ipd-adm', title: 'Admission Registry', path: '/ipd/registration' },
      { id: 'ipd-bill', title: 'IPD Billing', path: '/ipd/billing' },
      { id: 'ipd-fin', title: 'Payments & Refunds', path: '/ipd/finance' },
    ]
  },
  {
    id: 'lab',
    title: 'Diagnostic Lab',
    icon: FlaskConical,
    children: [
      { id: 'lab-bill', title: 'Test Receipts', path: '/lab/billing' },
      { id: 'lab-fin', title: 'Payments & Refunds', path: '/lab/finance' },
    ]
  },
  {
    id: 'pharmacy',
    title: 'Medical Store',
    icon: ShoppingCart,
    children: [
      { id: 'ph-sale', title: 'Sales Entry', path: '/pharmacy/sales' },
      { id: 'ph-pur', title: 'Purchase Entry', path: '/pharmacy/purchases' },
    ]
  },
  {
    id: 'masters',
    title: 'Standard Masters',
    icon: Building2,
    children: [
      { id: 'm-pat', title: 'Patient Master', path: '/masters/patients' },
      { id: 'm-doc', title: 'Doctor Master', path: '/masters/doctors' },
      { id: 'm-rht', title: 'User Rights', path: '/masters/rights' },
    ]
  },
  {
    id: 'reports',
    title: 'Reporting',
    icon: ClipboardList,
    path: '/reports'
  }
];

export default function Sidebar() {
  const [expanded, setExpanded] = useState<Record<string, boolean>>({});
  const router = useRouter();
  const pathname = usePathname();

  const toggleExpand = (id: string) => {
    setExpanded(prev => ({ ...prev, [id]: !prev[id] }));
  };

  return (
    <div className={styles.sidebar}>
      <div className={styles.logo}>
        <div style={{ display: 'flex', alignItems: 'center', gap: '10px' }}>
          <ShieldCheck size={24} color="#3bc9db" />
          <span style={{ fontWeight: 700, letterSpacing: '1px' }}>HMS SECURE</span>
        </div>
      </div>
      <nav className={styles.nav}>
        {MENU_DATA.map((item) => {
          const isExpanded = expanded[item.id];
          const hasChildren = item.children && item.children.length > 0;
          const Icon = item.icon;

          return (
            <div key={item.id} className={styles.menuItem}>
              <div 
                className={styles.menuHeader}
                onClick={() => {
                  if (hasChildren) {
                    toggleExpand(item.id);
                  } else if (item.path) {
                    router.push(item.path);
                  }
                }}
              >
                <div className={styles.menuTitle}>
                  <Icon size={18} className={styles.icon} />
                  <span>{item.title}</span>
                </div>
                {hasChildren && (
                  isExpanded ? <ChevronDown size={16} /> : <ChevronRight size={16} />
                )}
              </div>
              
              {hasChildren && isExpanded && (
                <div className={styles.subMenu}>
                  {item.children!.map((child) => (
                    <Link 
                      key={child.id} 
                      href={child.path}
                      className={pathname === child.path ? `${styles.subMenuLink} ${styles.active}` : styles.subMenuLink}
                    >
                      {child.title}
                    </Link>
                  ))}
                </div>
              )}
            </div>
          );
        })}
      </nav>
    </div>
  );
}
