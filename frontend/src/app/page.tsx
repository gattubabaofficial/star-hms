"use client";

import React, { useState, useEffect } from "react";
import { useRouter } from "next/navigation";
import styles from "./login.module.css";
import { Activity } from "lucide-react";

export default function LoginPage() {
  const [username, setUsername] = useState("");
  const [password, setPassword] = useState("");
  const [error, setError] = useState("");
  const [loading, setLoading] = useState(false);
  const router = useRouter();

  // Check if already logged in
  useEffect(() => {
    const token = localStorage.getItem("token");
    if (token) {
      router.push("/dashboard");
    }
  }, [router]);

  const handleLogin = async (e: React.FormEvent) => {
    e.preventDefault();
    setError("");
    setLoading(true);

    if (!username || !password) {
      setError("Please fill in all fields.");
      setLoading(false);
      return;
    }

    try {
      // 1. Trigger setup-admin just in case it is a brand new DB reset
      try {
        await fetch("http://127.0.0.1:8000/api/auth/setup-admin", {
          method: "POST",
          headers: { "Content-Type": "application/json" }
        });
      } catch (e) {
        console.log("Admin setup error or already seeded:", e);
      }

      // 2. Perform authentication login request
      const formData = new URLSearchParams();
      formData.append("username", username);
      formData.append("password", password);

      const response = await fetch("http://127.0.0.1:8000/api/auth/login", {
        method: "POST",
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
        },
        body: formData,
      });

      if (!response.ok) {
        const errorData = await response.json().catch(() => ({}));
        throw new Error(errorData.detail || "Authentication failed. Check your credentials.");
      }

      const data = await response.json();
      localStorage.setItem("token", data.access_token);
      localStorage.setItem("username", username);
      
      router.push("/dashboard");
    } catch (err: any) {
      setError(err.message || "Something went wrong. Please check that the server is online.");
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className={styles.loginWrapper}>
      <div className={styles.loginCard}>
        <div className={styles.loginHeader}>
          <div className={styles.loginLogo}>
            <Activity className={styles.logoIcon} size={28} />
            <span className={styles.logoText}>Star HMS</span>
          </div>
          <h2 className={styles.loginTitle}>Welcome Back</h2>
          <p className={styles.loginSubtitle}>
            Please sign in to access your administrative dashboard
          </p>
        </div>

        <form className={styles.loginForm} onSubmit={handleLogin}>
          {error && <div className={styles.errorBox}>{error}</div>}
          
          <div className={styles.formGroup}>
            <label className={styles.formLabel} htmlFor="username">Username</label>
            <input
              className={styles.formInput}
              id="username"
              type="text"
              placeholder="e.g. admin"
              value={username}
              onChange={(e) => setUsername(e.target.value)}
              disabled={loading}
            />
          </div>

          <div className={styles.formGroup}>
            <label className={styles.formLabel} htmlFor="password">Password</label>
            <input
              className={styles.formInput}
              id="password"
              type="password"
              placeholder="••••••••"
              value={password}
              onChange={(e) => setPassword(e.target.value)}
              disabled={loading}
            />
          </div>

          <button
            className={styles.loginButton}
            type="submit"
            disabled={loading}
          >
            {loading ? "Authenticating..." : "Sign In"}
          </button>
        </form>
      </div>
    </div>
  );
}
