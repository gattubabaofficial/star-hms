"use client";

import React, { useEffect, useState } from "react";
import styles from "../../../dashboard.module.css";
import { Plus, UserRound } from "lucide-react";

interface DoctorCategory {
  dcg_code: number;
  dcg_name: string;
}

export default function DoctorCategoryPage() {
  const [categories, setCategories] = useState<DoctorCategory[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const fetchCats = async () => {
      try {
        const response = await fetch("http://127.0.0.1:8000/api/masters/doctor-categories");
        if (response.ok) {
          setCategories(await response.json());
        }
      } catch (e) {
        console.log("Error loading doctor categories:", e);
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
          <span>Add Doctor Category</span>
        </button>
      </div>

      {loading ? (
        <p style={{ color: "var(--text-secondary)", fontSize: "14px" }}>Loading categories...</p>
      ) : (
        <div className={styles.tableContainer} style={{ maxWidth: "600px" }}>
          <table className={styles.table}>
            <thead>
              <tr>
                <th>Code</th>
                <th>Category Name</th>
              </tr>
            </thead>
            <tbody>
              {categories.map((cat) => (
                <tr key={cat.dcg_code}>
                  <td style={{ fontWeight: 600, color: "var(--accent-color)" }}>#{cat.dcg_code}</td>
                  <td style={{ fontWeight: 600 }}>{cat.dcg_name}</td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      )}
    </div>
  );
}
