"use client";

import React, { useState } from "react";
import styles from "../../../dashboard.module.css";
import { Shield, ShieldAlert, KeyRound } from "lucide-react";

export default function AdminSecuritySettingsPage() {
  const [securityData, setSecurityData] = useState({
    sessionTimeout: "60",
    maxLoginAttempts: "5",
    passwordComplexity: "high",
    jwtExpiryHours: "24",
    requireMFA: false
  });

  const handleSelectChange = (e: React.ChangeEvent<HTMLSelectElement>) => {
    const { name, value } = e.target;
    setSecurityData(prev => ({ ...prev, [name]: value }));
  };

  const handleToggle = () => {
    setSecurityData(prev => ({ ...prev, requireMFA: !prev.requireMFA }));
  };

  return (
    <div style={{ maxWidth: "680px" }}>
      <div className={styles.sectionBox}>
        <div className={styles.sectionHeader}>
          <div style={{ display: "flex", alignItems: "center", gap: "10px" }}>
            <Shield size={22} style={{ color: "var(--accent-color)" }} />
            <h3 className={styles.sectionTitle}>System Authentication & Password Security</h3>
          </div>
        </div>

        <form onSubmit={(e) => { e.preventDefault(); alert("Security configuration updated!"); }}>
          <div className={styles.formGroup}>
            <label htmlFor="sessionTimeout">Operator Session Timeout (Minutes)</label>
            <select
              id="sessionTimeout"
              name="sessionTimeout"
              className={styles.formControl}
              value={securityData.sessionTimeout}
              onChange={handleSelectChange}
            >
              <option value="15">15 Minutes</option>
              <option value="30">30 Minutes</option>
              <option value="60">60 Minutes (Standard)</option>
              <option value="120">120 Minutes</option>
            </select>
          </div>

          <div className={styles.formGroup}>
            <label htmlFor="maxLoginAttempts">Maximum Failed Login Attempts (Before lockout)</label>
            <select
              id="maxLoginAttempts"
              name="maxLoginAttempts"
              className={styles.formControl}
              value={securityData.maxLoginAttempts}
              onChange={handleSelectChange}
            >
              <option value="3">3 Attempts</option>
              <option value="5">5 Attempts</option>
              <option value="10">10 Attempts</option>
            </select>
          </div>

          <div className={styles.formGrid}>
            <div className={styles.formGroup}>
              <label htmlFor="passwordComplexity">Password Strength Policy</label>
              <select
                id="passwordComplexity"
                name="passwordComplexity"
                className={styles.formControl}
                value={securityData.passwordComplexity}
                onChange={handleSelectChange}
              >
                <option value="low">Basic (AlphaNumeric)</option>
                <option value="medium">Medium (At least 1 Number & Special character)</option>
                <option value="high">High (Min 8 chars, Upper, Lower, Numbers, Specials)</option>
              </select>
            </div>
            
            <div className={styles.formGroup}>
              <label htmlFor="jwtExpiryHours">JWT Access Token Validity (Hours)</label>
              <select
                id="jwtExpiryHours"
                name="jwtExpiryHours"
                className={styles.formControl}
                value={securityData.jwtExpiryHours}
                onChange={handleSelectChange}
              >
                <option value="8">8 Hours</option>
                <option value="24">24 Hours</option>
                <option value="72">72 Hours</option>
              </select>
            </div>
          </div>

          <div className={styles.formGroup} style={{ borderTop: "1px solid var(--border-light)", paddingTop: "20px", marginTop: "20px" }}>
            <div style={{ display: "flex", justifyContent: "space-between", alignItems: "center" }}>
              <div style={{ display: "flex", flexDirection: "column", gap: "2px" }}>
                <strong style={{ fontSize: "14px", color: "var(--text-primary)" }}>Enforce Multi-Factor Authentication (MFA)</strong>
                <span style={{ fontSize: "12px", color: "var(--text-secondary)" }}>Requires Google Authenticator or SMS verification on login.</span>
              </div>
              <input
                type="checkbox"
                checked={securityData.requireMFA}
                onChange={handleToggle}
                style={{ transform: "scale(1.3)", cursor: "pointer" }}
              />
            </div>
          </div>

          <div style={{ marginTop: "24px" }}>
            <button type="submit" className={styles.primaryBtn} style={{ width: "100%", justifyContent: "center" }}>
              Apply Security Settings
            </button>
          </div>
        </form>
      </div>
    </div>
  );
}
