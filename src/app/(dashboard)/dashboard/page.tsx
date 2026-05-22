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
}

function MenuCard({ title, icon, links }: MenuCardProps) {
  const router = useRouter();
  return (
    <div style={{ 
      padding: '20px', 
      borderRadius: '8px', 
      border: `1px solid #d1d5db`,
      backgroundColor: '#ffffff',
      boxShadow: '0 2px 4px rgba(0,0,0,0.05)',
      display: 'flex',
      flexDirection: 'column',
      gap: '16px' }}>
      <div style={{ display: 'flex', alignItems: 'center', gap: '12px', paddingBottom: '10px', borderBottom: '1px solid #e5e7eb' }}>
        <div style={{ padding: '8px', backgroundColor: '#eff6ff', color: '#2563eb', borderRadius: '6px' }}>
          {React.cloneElement(icon as React.ReactElement<any>, { size: 20 })}
        </div>
        <h3 style={{ margin: 0, fontSize: '16px', fontWeight: 600, color: '#1f2937' }}>{title}</h3>
      </div>
      <div style={{ display: 'flex', flexDirection: 'column', gap: '4px' }}>
        {links.map((link, idx) => (
          <button
            key={idx}
            onClick={() => router.push(link.path)}
            style={{
              padding: '8px 12px',
              borderRadius: '6px',
              textAlign: 'left',
              color: '#4b5563',
              fontSize: '14px',
              transition: 'all 0.2s',
              display: 'flex',
              justifyContent: 'space-between',
              alignItems: 'center'
            }}
            onMouseEnter={(e) => {
              (e.currentTarget as HTMLButtonElement).style.background = '#f3f4f6';
              (e.currentTarget as HTMLButtonElement).style.color = '#111827';
            }}
            onMouseLeave={(e) => {
              (e.currentTarget as HTMLButtonElement).style.background = 'transparent';
              (e.currentTarget as HTMLButtonElement).style.color = '#4b5563';
            }}
          >
            {link.label}
            <span style={{ fontSize: '14px', color: '#9ca3af' }}>&rarr;</span>
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
      links: [
        { label: 'Registration', path: '/opd/registration' },
        { label: 'Billing & Receipt', path: '/opd/billing' },
        { label: 'Payments & Refunds', path: '/opd/finance' }
      ]
    },
    {
      title: 'Hospital Indoor (IPD)',
      icon: <Bed />,
      links: [
        { label: 'Admission Registry', path: '/ipd/admission' },
        { label: 'IPD Billing', path: '/ipd/billing' },
        { label: 'Payments & Refunds', path: '/ipd/finance' }
      ]
    },
    {
      title: 'Diagnostic Lab',
      icon: <FlaskConical />,
      links: [
        { label: 'Test Receipts', path: '/lab/billing' },
        { label: 'Payments & Refunds', path: '/lab/finance' }
      ]
    },
    {
      title: 'Medical Store (Pharmacy)',
      icon: <ShoppingCart />,
      links: [
        { label: 'Sales Entry', path: '/pharmacy/sales' },
        { label: 'Purchase Entry', path: '/pharmacy/purchases' },
        { label: 'Item Master', path: '/pharmacy/items' },
        { label: 'Party Master', path: '/pharmacy/parties' }
      ]
    },
    {
      title: 'Standard Masters',
      icon: <Settings />,
      links: [
        { label: 'Patient Master', path: '/opd/patient-master' },
        { label: 'Doctor Master', path: '/masters/doctor-master' },
        { label: 'Service Master', path: '/services/master' },
        { label: 'User Rights', path: '/masters/rights' }
      ]
    },
    {
      title: 'Reporting',
      icon: <ClipboardList />,
      links: [
        { label: 'Collection Audit', path: '/reports' },
        { label: 'Stay Census', path: '/ipd/census' }
      ]
    }
  ];

  return (
    <div style={{ padding: '32px', backgroundColor: '#f9fafb', minHeight: '100vh', display: 'flex', flexDirection: 'column', gap: '32px' }}>
      <header style={{ paddingBottom: '24px', borderBottom: '1px solid #e5e7eb' }}>
        <h1 style={{ fontSize: '24px', fontWeight: 600, color: '#111827', margin: '0 0 8px 0', display: 'flex', alignItems: 'center', gap: '12px' }}>
          <LayoutDashboard color="#2563eb" size={28} /> HMS Control Center
        </h1>
        <p style={{ color: '#6b7280', margin: 0, fontSize: '15px' }}>
          Primary Navigation Dashboard & Modules
        </p>
      </header>

      <div style={{ 
        display: 'grid', 
        gridTemplateColumns: 'repeat(auto-fill, minmax(300px, 1fr))', 
        gap: '24px' 
      }}>
        {menuGroups.map((group, idx) => (
          <MenuCard 
            key={idx}
            title={group.title}
            icon={group.icon}
            links={group.links}
          />
        ))}
      </div>
    </div>
  );
}
