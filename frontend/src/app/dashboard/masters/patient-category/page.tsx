"use client";

import React, { useEffect, useState } from "react";
import styles from "../../../dashboard.module.css";
import { Plus, Search, Users, AlertCircle, Check } from "lucide-react";

interface PatientCategory {
  pcg_code: number;
  pcg_name: string;
  pcg_inf_allowed: boolean;
  pcg_def_allowed: boolean;
  pcg_disc_allowed: boolean;
  pcg_disc_per: number;
  pcg_show_in_list: boolean;
}

export default function PatientCategoryPage() {
  const [categories, setCategories] = useState<PatientCategory[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const fetchCats = async () => {
      try {
        const response = await fetch("http://127.0.0.1:8000/api/masters/patient-categories");
        if (response.ok) {
          setCategories(await response.json());
        }
      } catch (e) {
        console.log("Error loading patient categories:", e);
      } finally {
        setLoading(false);
      }
    };
    fetchCats();
  }, []);

  return (
    <div>
      <div className={styles.toolbar} style={{ justifyContent: "flex-end" }}>
        <button className={styles.primaryBtn}>
          <Plus size={18} />
          <span>Add Patient Category</span>
        </button>
      </div>

      {loading ? (
        <p style={{ color: "var(--text-secondary)", fontSize: "14px" }}>Loading patient categories...</p>
      ) : (
        <div className={styles.tableContainer}>
          <table className={styles.table}>
            <thead>
              <tr>
                <th>Code</th>
                <th>Category Name</th>
                <th>Discount Allowed</th>
                <th>Discount %</th>
                <th>Info Allowed</th>
                <th>Show In List</th>
              </tr>
            </thead>
            <tbody>
              {categories.map((cat) => (
                <tr key={cat.pcg_code}>
                  <td style={{ fontWeight: 600, color: "var(--accent-color)" }}>#{cat.pcg_code}</td>
                  <td style={{ fontWeight: 600 }}>{cat.pcg_name}</td>
                  <td>
                    <span className={`${styles.badge} ${cat.pcg_disc_allowed ? styles.badgeSuccess : styles.badgeDanger}`}>
                      {cat.pcg_disc_allowed ? "Yes" : "No"}
                    </span>
                  </td>
                  <td style={{ fontWeight: 700 }}>{cat.pcg_disc_per}%</td>
                  <td>{cat.pcg_inf_allowed ? "Yes" : "No"}</td>
                  <td>{cat.pcg_show_in_list ? "Yes" : "No"}</td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      )}
    </div>
  );
}
