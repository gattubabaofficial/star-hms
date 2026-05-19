"use client";
import React from 'react';
import { useRouter } from 'next/navigation';
import { 
  Settings, 
  Users, 
  Bed, 
  FlaskConical, 
  ShoppingCart, 
  LayoutDashboard,
  ClipboardList
} from 'lucide-react';

interface MenuCardProps {
  title: string;
  icon: React.ReactNode;
  links: { label: string; path: string }[];
  color: string;
}

function MenuCard({ title, icon, links, color }: MenuCardProps) {
  const router = useRouter();
  return (
    <div style={{ 
      padding: '24px', 
      background: 'rgba(255,255,255,0.02)', 
      borderRadius: '20px', 
      border: `1px solid ${color}33`,
      display: 'flex',
      flexDirection: 'column',
      gap: '16px',
      transition: 'all 0.2s ease',
    }}>
      <div style={{ display: 'flex', alignItems: 'center', gap: '12px' }}>
        <div style={{ padding: '10px', background: `${color}15`, borderRadius: '12px' }}>
          {React.cloneElement(icon as React.ReactElement<any>, { color, size: 24 })}
        </div>
        <h3 style={{ margin: 0, fontSize: '18px', fontWeight: 600 }}>{title}</h3>
      </div>
      <div style={{ display: 'flex', flexDirection: 'column', gap: '8px' }}>
        {links.map((link, idx) => (
          <button
            key={idx}
            onClick={() => router.push(link.path)}
            style={{
              padding: '10px 14px',
              background: 'rgba(255,255,255,0.03)',
              border: '1px solid rgba(255,255,255,0.05)',
              borderRadius: '10px',
              textAlign: 'left',
              color: '#adb5bd',
              fontSize: '14px',
              cursor: 'pointer',
              transition: 'all 0.2s',
              display: 'flex',
              justifyContent: 'space-between',
              alignItems: 'center'
            }}
            onMouseEnter={(e) => {
              (e.currentTarget as HTMLButtonElement).style.background = 'rgba(255,255,255,0.1)';
              (e.currentTarget as HTMLButtonElement).style.color = '#fff';
            }}
            onMouseLeave={(e) => {
              (e.currentTarget as HTMLButtonElement).style.background = 'rgba(255,255,255,0.03)';
              (e.currentTarget as HTMLButtonElement).style.color = '#adb5bd';
            }}
          >
            {link.label}
            <span style={{ fontSize: '12px', opacity: 0.5 }}>→</span>
          </button>
        ))}
      </div>
    </div>
  );
}

export default function Dashboard() {
  const menuGroups = [
    {
      title: 'Hospital Outdoor (OPD)',
      icon: <Users />,
      color: '#40c057',
      links: [
        { label: 'Registration', path: '/opd/registration' },
        { label: 'Billing & Receipt', path: '/opd/billing' },
        { label: 'Payments & Refunds', path: '/opd/finance' }
      ]
    },
    {
      title: 'Hospital Indoor (IPD)',
      icon: <Bed />,
      color: '#fab005',
      links: [
        { label: 'Admission Registry', path: '/ipd/registration' },
        { label: 'IPD Billing', path: '/ipd/billing' },
        { label: 'Payments & Refunds', path: '/ipd/finance' }
      ]
    },
    {
      title: 'Diagnostic Lab',
      icon: <FlaskConical />,
      color: '#7950f2',
      links: [
        { label: 'Test Receipts', path: '/lab/billing' },
        { label: 'Payments & Refunds', path: '/lab/finance' }
      ]
    },
    {
      title: 'Medical Store (Pharmacy)',
      icon: <ShoppingCart />,
      color: '#3bc9db',
      links: [
        { label: 'Sales Entry', path: '/pharmacy/sales' },
        { label: 'Purchase Entry', path: '/pharmacy/purchases' },
        { label: 'Item Master', path: '/masters/pharmacy/items' }
      ]
    },
    {
      title: 'Standard Masters',
      icon: <Settings />,
      color: '#fd7e14',
      links: [
        { label: 'Patient Master', path: '/masters/patients' },
        { label: 'Doctor Master', path: '/masters/doctors' },
        { label: 'Service Master', path: '/masters/services' },
        { label: 'User Rights', path: '/masters/rights' }
      ]
    },
    {
      title: 'Reporting',
      icon: <ClipboardList />,
      color: '#f06595',
      links: [
        { label: 'Collection Audit', path: '/reports' },
        { label: 'Stay Census', path: '/ipd/census' }
      ]
    }
  ];

  return (
    <div style={{ padding: '40px', display: 'flex', flexDirection: 'column', gap: '40px' }}>
      <header>
        <h1 style={{ fontSize: '28px', marginBottom: '8px', display: 'flex', alignItems: 'center', gap: '15px' }}>
          <LayoutDashboard color="#3bc9db" size={32} /> HMS Control Center
        </h1>
        <p style={{ color: '#adb5bd' }}>
          Strict Functional Replica Mode: Primary Navigation based on your Offline Software.
        </p>
      </header>

      <div style={{ 
        display: 'grid', 
        gridTemplateColumns: 'repeat(auto-fill, minmax(320px, 1fr))', 
        gap: '30px' 
      }}>
        {menuGroups.map((group, idx) => (
          <MenuCard 
            key={idx}
            title={group.title}
            icon={group.icon}
            links={group.links}
            color={group.color}
          />
        ))}
      </div>
    </div>
  );
}
