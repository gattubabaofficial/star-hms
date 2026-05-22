"use client";
import React from 'react';
import Link from 'next/link';

export default function LandingPage() {
  return (
    <div style={{ display: 'flex', flexDirection: 'column', minHeight: '100vh', fontFamily: 'Arial, sans-serif', backgroundColor: '#f0f0f0', color: '#333' }}>
      <header style={{ padding: '20px', borderBottom: '1px solid #ccc', backgroundColor: '#fff', display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
        <h1 style={{ margin: 0, fontSize: '24px' }}>Hospital Management System</h1>
        <div style={{ display: 'flex', gap: '10px' }}>
          <Link href="/login">
            <button className="btn">Login</button>
          </Link>
          <Link href="/signup">
            <button className="btn btn-primary">Sign Up</button>
          </Link>
        </div>
      </header>

      <main style={{ flex: 1, padding: '40px', maxWidth: '800px', margin: '0 auto', textAlign: 'center' }}>
        <h2 style={{ fontSize: '32px', marginBottom: '20px' }}>Enterprise Medical Software</h2>
        <p style={{ fontSize: '18px', color: '#666', marginBottom: '40px', lineHeight: '1.6' }}>
          A complete, unified solution for Hospital Outdoor (OPD), Indoor (IPD), Pharmacy, Diagnostic Lab, and full financial reporting. Designed for high-density, high-speed data entry.
        </p>

        <div style={{ display: 'grid', gridTemplateColumns: 'repeat(2, 1fr)', gap: '20px', textAlign: 'left' }}>
          <div style={{ padding: '20px', border: '1px solid #ccc', backgroundColor: '#fff' }}>
            <h3 style={{ margin: '0 0 10px 0' }}>OPD Registration</h3>
            <p style={{ margin: 0, color: '#666' }}>Streamlined patient registration and billing workflows.</p>
          </div>
          <div style={{ padding: '20px', border: '1px solid #ccc', backgroundColor: '#fff' }}>
            <h3 style={{ margin: '0 0 10px 0' }}>IPD Admissions</h3>
            <p style={{ margin: 0, color: '#666' }}>Bed census and accrued ward billing management.</p>
          </div>
          <div style={{ padding: '20px', border: '1px solid #ccc', backgroundColor: '#fff' }}>
            <h3 style={{ margin: '0 0 10px 0' }}>Pharmacy Store</h3>
            <p style={{ margin: 0, color: '#666' }}>Integrated item master, supplier parties, and point of sale.</p>
          </div>
          <div style={{ padding: '20px', border: '1px solid #ccc', backgroundColor: '#fff' }}>
            <h3 style={{ margin: '0 0 10px 0' }}>Diagnostic Lab</h3>
            <p style={{ margin: 0, color: '#666' }}>Comprehensive lab services billing and integration.</p>
          </div>
        </div>

        <div style={{ marginTop: '40px' }}>
          <Link href="/login">
            <button className="btn btn-primary" style={{ padding: '15px 30px', fontSize: '16px' }}>Access Dashboard</button>
          </Link>
        </div>
      </main>

      <footer style={{ padding: '20px', textAlign: 'center', borderTop: '1px solid #ccc', backgroundColor: '#e0e0e0', fontSize: '12px' }}>
        &copy; {new Date().getFullYear()} Star HMS Enterprise. All rights reserved.
      </footer>
    </div>
  );
}
