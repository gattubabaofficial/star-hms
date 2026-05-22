"use client";
import React from 'react';
import Link from 'next/link';
import Image from 'next/image';
import { ShieldCheck, Activity, Users, Building2, FlaskConical } from 'lucide-react';
import styles from './page.module.css';

export default function LandingPage() {
  return (
    <div className={styles.container}>
      <header className={styles.header}>
        <div className={styles.logo}>
          <ShieldCheck size={32} color="var(--accent-color)" />
          HMS SECURE
        </div>
        <div className={styles.navButtons}>
          <Link href="/login">
            <button className="btn">Sign In</button>
          </Link>
          <Link href="/signup">
            <button className="btn btn-primary">Book Demo</button>
          </Link>
        </div>
      </header>

      <main>
        <section className={styles.heroSection}>
          <div className={styles.heroText}>
            <div style={{ display: 'flex', alignItems: 'center', gap: '8px', color: 'var(--accent-color)', fontWeight: 600, marginBottom: '16px' }}>
              <Activity size={20} />
              <span>Next-Gen Healthcare IT</span>
            </div>
            <h1 className={styles.heroTitle}>
              Intelligent <span>Hospital Management</span> for Modern Care
            </h1>
            <p className={styles.heroSubtitle}>
              A comprehensive, unified digital solution designed to streamline Hospital Outdoor (OPD), Indoor (IPD), Pharmacy, Diagnostic Labs, and financial workflows with maximum efficiency and clarity.
            </p>
            <div className={styles.heroActions}>
              <Link href="/login">
                <button className="btn btn-primary" style={{ padding: '16px 32px', fontSize: '16px' }}>
                  Access Dashboard
                </button>
              </Link>
              <Link href="/signup">
                <button className="btn" style={{ padding: '16px 32px', fontSize: '16px' }}>
                  View Features
                </button>
              </Link>
            </div>
          </div>
          
          <div className={styles.heroImageContainer}>
            <Image 
              src="/hospital_hero_bg.png" 
              alt="Hospital Management System Dashboard Mockup" 
              width={800} 
              height={600} 
              className={styles.heroImage}
              priority
            />
          </div>
        </section>

        <section className={styles.featuresSection}>
          <div className={styles.featuresInner}>
            <div style={{ textAlign: 'center', marginBottom: '60px' }}>
              <h2 style={{ fontSize: '36px', color: 'var(--text-primary)', marginBottom: '16px' }}>Enterprise-Grade Modules</h2>
              <p style={{ color: 'var(--text-secondary)', fontSize: '18px', maxWidth: '600px', margin: '0 auto' }}>
                Seamlessly integrated modules that handle high-density, high-speed data entry without the visual fatigue.
              </p>
            </div>
            <div className={styles.featuresGrid}>
              <div className={styles.featureCard}>
                <Users size={32} className={styles.featureIcon} />
                <h3 className={styles.featureTitle}>OPD Registration</h3>
                <p className={styles.featureDesc}>Streamlined outpatient registration, appointments, and billing workflows optimized for high-volume clinics.</p>
              </div>
              <div className={styles.featureCard}>
                <Building2 size={32} className={styles.featureIcon} />
                <h3 className={styles.featureTitle}>IPD Admissions</h3>
                <p className={styles.featureDesc}>Real-time bed census, admission registries, and accrued ward billing management all in one place.</p>
              </div>
              <div className={styles.featureCard}>
                <ShieldCheck size={32} className={styles.featureIcon} />
                <h3 className={styles.featureTitle}>Pharmacy Store</h3>
                <p className={styles.featureDesc}>Integrated item master, supplier parties management, point of sale, and automated stock alerts.</p>
              </div>
              <div className={styles.featureCard}>
                <FlaskConical size={32} className={styles.featureIcon} />
                <h3 className={styles.featureTitle}>Diagnostic Lab</h3>
                <p className={styles.featureDesc}>Comprehensive lab services billing, sample tracking, and seamless financial integration.</p>
              </div>
            </div>
          </div>
        </section>
      </main>

      <footer className={styles.footer}>
        &copy; {new Date().getFullYear()} HMS Secure Enterprise Software. Designed for Healthcare Professionals. All rights reserved.
      </footer>
    </div>
  );
}
