"use client";

import React, { useEffect, useState } from "react";
import styles from "../../dashboard.module.css";
import { ShieldAlert, UserCheck, Key, Lock, Eye, Check } from "lucide-react";

interface AdminUser {
  id: number;
  username: string;
  email: string;
  role: string;
  is_active: boolean;
}

export default function SecurityPage() {
  const [users, setUsers] = useState<AdminUser[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const fetchUsers = async () => {
      try {
        const response = await fetch("http://127.0.0.1:8000/api/auth/users");
        if (response.ok) {
          setUsers(await response.json());
        } else {
          // Mock admin fallback if no database connection (or before reset)
          setUsers([
            { id: 1, username: "admin", email: "admin@hms.com", role: "admin", is_active: true }
          ]);
        }
      } catch {
        setUsers([
          { id: 1, username: "admin", email: "admin@hms.com", role: "admin", is_active: true }
        ]);
      } finally {
        setLoading(false);
      }
    };
    fetchUsers();
  }, []);

  const rolesList = [
    { name: "Administrator", desc: "Full root access to all clinical, database and billing operations.", count: 1 },
    { name: "Medical Consultant", desc: "Access to client records, write prescriptions, and OPD scheduling.", count: 0 },
    { name: "Front Desk Cashier", desc: "Create bills, receive payments, print OPD/IPD invoices.", count: 0 }
  ];

  return (
    <div style={{ display: "flex", flexDirection: "column", gap: "32px" }}>
      {/* Overview */}
      <div style={{ display: "grid", gridTemplateColumns: "1fr 1fr", gap: "24px" }}>
        
        {/* User Account Registry */}
        <div className={styles.sectionBox}>
          <div className={styles.sectionHeader}>
            <h3 className={styles.sectionTitle}>Active User Accounts</h3>
          </div>
          
          {loading ? (
            <p style={{ color: "var(--text-secondary)", fontSize: "14px" }}>Loading credentials...</p>
          ) : (
            <div className={styles.tableContainer}>
              <table className={styles.table}>
                <thead>
                  <tr>
                    <th>Username</th>
                    <th>Role Group</th>
                    <th>Account Status</th>
                  </tr>
                </thead>
                <tbody>
                  {users.map((usr) => (
                    <tr key={usr.id}>
                      <td style={{ fontWeight: 600 }}>{usr.username}</td>
                      <td>
                        <span className={`${styles.badge} ${styles.badgeAccent}`}>{usr.role}</span>
                      </td>
                      <td>
                        <span className={`${styles.badge} ${usr.is_active ? styles.badgeSuccess : styles.badgeDanger}`}>
                          {usr.is_active ? "Active" : "Disabled"}
                        </span>
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          )}
        </div>

        {/* Security Role Definitions */}
        <div className={styles.sectionBox} style={{ display: "flex", flexDirection: "column", gap: "16px" }}>
          <div className={styles.sectionHeader} style={{ marginBottom: "0px" }}>
            <h3 className={styles.sectionTitle}>Role Privilege Groups</h3>
          </div>
          
          <div style={{ display: "flex", flexDirection: "column", gap: "12px" }}>
            {rolesList.map(role => (
              <div key={role.name} style={{ display: "flex", alignItems: "flex-start", gap: "12px", border: "1px solid var(--border-light)", padding: "16px", borderRadius: "12px" }}>
                <Key size={18} style={{ color: "var(--accent-color)", marginTop: "2px" }} />
                <div style={{ display: "flex", flexDirection: "column", gap: "4px" }}>
                  <strong style={{ fontSize: "14px" }}>{role.name}</strong>
                  <p style={{ fontSize: "12px", color: "var(--text-secondary)", lineHeight: "1.4" }}>{role.desc}</p>
                  <span style={{ fontSize: "11px", fontWeight: 600, color: "var(--text-muted)", marginTop: "4px" }}>
                    {role.count} accounts assigned
                  </span>
                </div>
              </div>
            ))}
          </div>
        </div>
      </div>
    </div>
  );
}
