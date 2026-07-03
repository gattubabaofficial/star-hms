"use client";

import React, { useEffect, useState } from "react";
import { useRouter, usePathname } from "next/navigation";
import Link from "next/link";
import styles from "../dashboard.module.css";
import { 
  Activity, LayoutDashboard, Users, UserRound, Stethoscope, 
  Bed, LogOut, CheckCircle, AlertTriangle, Share2, Layers,
  Building, FlaskConical, Pill, Shield, Package, FileBarChart2,
  ChevronRight, Receipt
} from "lucide-react";

// Define dynamic hierarchical navigation structure
const navItems = [
  {
    name: "Dashboard",
    href: "/dashboard",
    icon: LayoutDashboard,
  },
  {
    name: "Masters",
    icon: Layers,
    subGroups: [
      {
        name: "Application Master",
        items: [
          { name: "Patient Category", href: "/dashboard/masters/patient-category" },
          { name: "Doctor Category", href: "/dashboard/masters/doctor-category" },
          { name: "Referred Category", href: "/dashboard/masters/referred-category" },
          { name: "Doctor Role", href: "/dashboard/masters/doctor-role" },
          { name: "Doctor Master", href: "/dashboard/masters/doctor" },
          { name: "Referred By Master", href: "/dashboard/masters/referral-by" },
          { name: "Referred To Master", href: "/dashboard/masters/referral-to" },
          { name: "Service Group Master", href: "/dashboard/masters/service-group" },
          { name: "Service Master", href: "/dashboard/masters/service" },
          { name: "Advance Rate Master", href: "/dashboard/masters/advance-rate" },
          { name: "Patient Master", href: "/dashboard/masters/patient" },
          { name: "Ref.Member Master", href: "/dashboard/masters/ref-member" },
          { name: "Diagnosis Master", href: "/dashboard/masters/diagnosis" },
          { name: "Procedure Master", href: "/dashboard/masters/procedure" },
          { name: "Bed Floor Master", href: "/dashboard/masters/floor" },
          { name: "Bed Ward Master", href: "/dashboard/masters/ward" },
          { name: "Bed Master", href: "/dashboard/masters/bed" },
          { name: "Package Master", href: "/dashboard/masters/package" },
          { name: "Import Data", href: "/dashboard/masters/import-data" },
        ],
      },
      {
        name: "Diagnostic Lab Master",
        items: [
          { name: "Lab Test Method", href: "/dashboard/masters/lab-test-method" },
          { name: "Lab Test Sample Type", href: "/dashboard/masters/lab-test-sample" },
          { name: "Lab Test Group", href: "/dashboard/masters/lab-test-group" },
          { name: "Lab Test Department", href: "/dashboard/masters/lab-test-dept" },
          { name: "Lab Test Parameters", href: "/dashboard/masters/lab-test-params" },
          { name: "Pathology Test Report Formats", href: "/dashboard/masters/pathology-formats" },
          { name: "X-Ray Report Formats", href: "/dashboard/masters/xray-formats" },
          { name: "Sonography Report Formats", href: "/dashboard/masters/sonography-formats" },
          { name: "Test Auto Calculation Methods", href: "/dashboard/masters/test-auto-calc" },
        ],
      },
      {
        name: "Clinical History Master",
        items: [
          { name: "Clinical Object Group Master", href: "/dashboard/masters/clinical-obj-group" },
          { name: "Clinical Object Master", href: "/dashboard/masters/clinical-obj" },
          { name: "Outdoor Clinical Formats", href: "/dashboard/masters/outdoor-formats" },
          { name: "Indoor Clinical Formats", href: "/dashboard/masters/indoor-formats" },
          { name: "Discharge Clinical Formats", href: "/dashboard/masters/discharge-formats" },
          { name: "Direct Clinical Formats", href: "/dashboard/masters/direct-formats" },
        ],
      },
      {
        name: "Medical Store Master",
        items: [
          { name: "Supplier Group Master", href: "/dashboard/masters/party-group" },
          { name: "Supplier (Party) Master", href: "/dashboard/masters/party" },
          { name: "Product Group Master", href: "/dashboard/masters/product-group" },
          { name: "Product Master", href: "/dashboard/masters/product" },
          { name: "Product Company Master", href: "/dashboard/masters/product-company" },
          { name: "Product Composition Master", href: "/dashboard/masters/product-composition" },
        ],
      },
      {
        name: "Standard Master",
        items: [
          { name: "Account Ledger", href: "/dashboard/masters/account-ledger" },
          { name: "Product Master", href: "/dashboard/masters/standard-product" },
          { name: "User Role Master", href: "/dashboard/masters/user-role" },
          { name: "User Master", href: "/dashboard/masters/user" },
          { name: "Change User Password", href: "/dashboard/masters/change-password" },
          { name: "User Right Master", href: "/dashboard/masters/user-right" },
          { name: "Station Master", href: "/dashboard/masters/station" },
          { name: "Area Master", href: "/dashboard/masters/area" },
          { name: "Voucher Type", href: "/dashboard/masters/voucher-type" },
          { name: "Account Group", href: "/dashboard/masters/account-group" },
          { name: "Banker Master", href: "/dashboard/masters/banker" },
          { name: "Nation/State Master", href: "/dashboard/masters/nation-state" },
          { name: "Print Report Master", href: "/dashboard/masters/print-report" },
        ],
      },
      {
        name: "Payroll Master",
        items: [
          { name: "Department Master", href: "/dashboard/masters/payroll/department" },
          { name: "Designation Master", href: "/dashboard/masters/payroll/designation" },
          { name: "Employee Master", href: "/dashboard/masters/payroll/employee" },
        ],
      },
    ],
  },
  {
    name: "Reception",
    icon: Users,
    items: [
      { name: "Patient Information Central Desk", href: "/dashboard/reception/patient-info" },
      { name: "Hospital Reception Central Collection Desk", href: "/dashboard/reception/collection" },
    ],
  },
  {
    name: "OPD (Outdoor)",
    icon: Stethoscope,
    items: [
      { name: "OPD Consultation / Registration", href: "/dashboard/opd/consultation" },
      { name: "OPD Consultation Due Payment", href: "/dashboard/opd/consultation-due" },
      { name: "OPD Consultation Refund", href: "/dashboard/opd/consultation-refund" },
      { name: "OPD Appointment", href: "/dashboard/opd/appointment" },
      { name: "OPD Receipt / Procedures / Diagnostic Charges", href: "/dashboard/opd/receipt-charges" },
      { name: "OPD Receipt Due Payment", href: "/dashboard/opd/receipt-due" },
      { name: "OPD Receipt Refund", href: "/dashboard/opd/receipt-refund" },
      { name: "OPD Casual Bill", href: "/dashboard/opd/casual-bill" },
      { name: "OPD Casual Bill Payment", href: "/dashboard/opd/casual-bill-payment" },
      { name: "OPD Casual Bill Refund", href: "/dashboard/opd/casual-bill-refund" },
      { name: "Outdoor Clinical History", href: "/dashboard/opd/clinical-history" },
    ],
  },
  {
    name: "IPD (Indoor)",
    icon: Bed,
    items: [
      { name: "Admission / Registration", href: "/dashboard/ipd/admission" },
      { name: "Bed / Room Status", href: "/dashboard/ipd/bed-status" },
      { name: "Indoor Charges", href: "/dashboard/ipd/charges" },
      { name: "IPD Receipt / Procedures / Diagnostic Charges", href: "/dashboard/ipd/receipt-charges" },
      { name: "IPD Receipt Due Payment", href: "/dashboard/ipd/receipt-due" },
      { name: "IPD Receipt Refund", href: "/dashboard/ipd/receipt-refund" },
      { name: "IPD Advance / Pre-Deposits", href: "/dashboard/ipd/advance" },
      { name: "IPD On A/C Refund", href: "/dashboard/ipd/on-account-refund" },
      { name: "IPD Bill / Final Bill", href: "/dashboard/ipd/bill" },
      { name: "IPD Bill Payment / Post Deposits", href: "/dashboard/ipd/bill-payment" },
      { name: "IPD Bill (Post) Refund", href: "/dashboard/ipd/bill-refund" },
      { name: "Clinical History", href: "/dashboard/ipd/clinical-history" },
      { name: "Discharge Summary", href: "/dashboard/ipd/discharge-summary" },
      { name: "IPD Discharge Status / Query", href: "/dashboard/ipd/discharge-status" },
    ],
  },
  {
    name: "Direct Receipt",
    icon: Receipt,
    items: [
      { name: "Direct Receipt", href: "/dashboard/direct-receipt/new" },
      { name: "Direct Due Payment", href: "/dashboard/direct-receipt/due" },
      { name: "Direct Refund", href: "/dashboard/direct-receipt/refund" },
    ],
  },
  {
    name: "Laboratory",
    icon: FlaskConical,
    items: [
      { name: "LAB Receipt", href: "/dashboard/laboratory/lab-receipt" },
      { name: "X-Ray Receipt", href: "/dashboard/laboratory/xray-receipt" },
      { name: "Sonography Receipt", href: "/dashboard/laboratory/sonography-receipt" },
      { name: "LAB Due Payment", href: "/dashboard/laboratory/due" },
      { name: "LAB Refund", href: "/dashboard/laboratory/refund" },
    ],
    subGroups: [
      {
        name: "Test Reports",
        items: [
          { name: "Test Report Bill Detail", href: "/dashboard/laboratory/reports/bill-detail" },
          { name: "Pathological Test Report", href: "/dashboard/laboratory/reports/pathology" },
          { name: "X-Ray Test Report", href: "/dashboard/laboratory/reports/xray" },
          { name: "Sonography Test Report", href: "/dashboard/laboratory/reports/sonography" },
        ],
      },
    ],
  },
  {
    name: "Pharmacy",
    icon: Pill,
    items: [
      { name: "Dispensing Bill", href: "/dashboard/pharmacy/dispensing-bill" },
    ],
  },
  {
    name: "Accounts",
    icon: Building,
    items: [
      { name: "Bank Payment", href: "/dashboard/accounts/bank-payment" },
      { name: "Cash Payment", href: "/dashboard/accounts/cash-payment" },
      { name: "Bank Receipt", href: "/dashboard/accounts/bank-receipt" },
      { name: "Cash Receipt", href: "/dashboard/accounts/cash-receipt" },
      { name: "Contra Entry", href: "/dashboard/accounts/contra" },
      { name: "Journal Entry", href: "/dashboard/accounts/journal" },
    ],
  },
  {
    name: "Reports",
    icon: FileBarChart2,
    items: [
      { name: "OPD Reports", href: "/dashboard/reports/opd" },
      { name: "IPD Reports", href: "/dashboard/reports/ipd" },
      { name: "Lab Reports", href: "/dashboard/reports/lab" },
      { name: "Pharmacy Reports", href: "/dashboard/reports/pharmacy" },
      { name: "Financial Reports", href: "/dashboard/reports/financial" },
      { name: "Collection Reports", href: "/dashboard/reports/collection" },
      { name: "Audit Reports", href: "/dashboard/reports/audit" },
    ],
  },
  {
    name: "Administration",
    icon: Shield,
    items: [
      { name: "User Management", href: "/dashboard/admin/user-management" },
      { name: "Role Management", href: "/dashboard/admin/role-management" },
      { name: "Rights Management", href: "/dashboard/admin/rights-management" },
      { name: "Security", href: "/dashboard/admin/security" },
      { name: "Backup", href: "/dashboard/admin/backup" },
      { name: "Restore", href: "/dashboard/admin/restore" },
    ],
  },
];

export default function DashboardLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  const router = useRouter();
  const pathname = usePathname();
  const [authenticated, setAuthenticated] = useState(false);
  const [serverOnline, setServerOnline] = useState<boolean | null>(null);

  // Accordion Expand States
  const [expandedCategories, setExpandedCategories] = useState<Record<string, boolean>>({});
  const [expandedSubGroups, setExpandedSubGroups] = useState<Record<string, boolean>>({});

  const toggleCategory = (catName: string) => {
    setExpandedCategories(prev => ({
      ...prev,
      [catName]: !prev[catName]
    }));
  };

  const toggleSubGroup = (sgName: string) => {
    setExpandedSubGroups(prev => ({
      ...prev,
      [sgName]: !prev[sgName]
    }));
  };

  // Auto-expand category and sub-group on route changes
  useEffect(() => {
    if (!pathname) return;
    
    const activeCategory = navItems.find(cat => {
      if (cat.href === pathname) return true;
      if (cat.items?.some(item => pathname === item.href || pathname.startsWith(item.href + "/"))) return true;
      if (cat.subGroups?.some(sg => sg.items.some(item => pathname === item.href || pathname.startsWith(item.href + "/")))) return true;
      return false;
    });

    if (activeCategory) {
      setExpandedCategories(prev => ({ ...prev, [activeCategory.name]: true }));
      
      const activeSubGroup = activeCategory.subGroups?.find(sg => 
        sg.items.some(item => pathname === item.href || pathname.startsWith(item.href + "/"))
      );
      if (activeSubGroup) {
        setExpandedSubGroups(prev => ({ ...prev, [activeSubGroup.name]: true }));
      }
    }
  }, [pathname]);

  // Authentication check
  useEffect(() => {
    const token = localStorage.getItem("token");
    if (!token) {
      router.push("/");
    } else {
      setAuthenticated(true);
    }
  }, [router]);

  // Ping backend to check health
  useEffect(() => {
    const checkHealth = async () => {
      try {
        const response = await fetch("http://127.0.0.1:8000/health");
        if (response.ok) {
          setServerOnline(true);
        } else {
          setServerOnline(false);
        }
      } catch {
        setServerOnline(false);
      }
    };
    checkHealth();
  }, []);

  const handleLogout = () => {
    localStorage.removeItem("token");
    localStorage.removeItem("username");
    router.push("/");
  };

  if (!authenticated) {
    return (
      <div style={{ display: "flex", height: "100vh", alignItems: "center", justifyItems: "center", justifyContent: "center", backgroundColor: "#f8fafc", fontFamily: "sans-serif" }}>
        <p style={{ color: "#475569", fontWeight: 600 }}>Checking authentication session...</p>
      </div>
    );
  }

  // Resolve dynamic header page title
  const getPageTitle = () => {
    if (pathname === "/dashboard") return "Dashboard Overview";
    
    for (const category of navItems) {
      if (category.href === pathname) return category.name;
      if (category.items) {
        const item = category.items.find(i => i.href === pathname);
        if (item) return item.name;
      }
      if (category.subGroups) {
        for (const sg of category.subGroups) {
          const item = sg.items.find(i => i.href === pathname);
          if (item) return `${sg.name} - ${item.name}`;
        }
      }
    }
    
    if (pathname.startsWith("/dashboard/masters")) return "Hospital Master Registries";
    if (pathname.startsWith("/dashboard/opd")) return "Out-Patient Department (OPD)";
    if (pathname.startsWith("/dashboard/ipd")) return "In-Patient Department (IPD)";
    if (pathname.startsWith("/dashboard/laboratory")) return "Laboratory & Diagnostics";
    if (pathname.startsWith("/dashboard/pharmacy")) return "Pharmacy Ledger";
    if (pathname.startsWith("/dashboard/accounts")) return "General Ledger Accounting";
    if (pathname.startsWith("/dashboard/reports")) return "Management Reports";
    if (pathname.startsWith("/dashboard/admin")) return "System Administration";
    
    return "HMS Portal";
  };

  return (
    <div className={styles.layout}>
      {/* Sidebar Navigation */}
      <aside className={styles.sidebar} style={{ overflowY: "auto" }}>
        <div className={styles.sidebarLogo}>
          <Activity className={styles.logoIcon} size={24} />
          <span className={styles.logoText}>Star HMS</span>
        </div>

        <nav className={styles.sidebarNav}>
          {navItems.map((category) => {
            const Icon = category.icon;
            const hasSubmenu = !!(category.items || category.subGroups);
            
            const isCategoryActive = category.href 
              ? pathname === category.href 
              : (
                category.items?.some(item => pathname === item.href || pathname.startsWith(item.href + "/")) ||
                category.subGroups?.some(sg => sg.items.some(item => pathname === item.href || pathname.startsWith(item.href + "/")))
              );

            const isExpanded = expandedCategories[category.name];

            if (!hasSubmenu && category.href) {
              return (
                <Link 
                  key={category.name} 
                  href={category.href} 
                  className={`${styles.navItem} ${isCategoryActive ? styles.navItemActive : ""}`}
                >
                  <Icon size={18} />
                  <span>{category.name}</span>
                </Link>
              );
            }

            return (
              <div key={category.name} style={{ display: "flex", flexDirection: "column" }}>
                <button
                  onClick={() => toggleCategory(category.name)}
                  className={`${styles.navToggleBtn} ${isCategoryActive ? styles.navToggleActive : ""}`}
                >
                  <div style={{ display: "flex", alignItems: "center", gap: "12px" }}>
                    <Icon size={18} />
                    <span>{category.name}</span>
                  </div>
                  <ChevronRight 
                    size={14} 
                    className={`${styles.chevronIcon} ${isExpanded ? styles.chevronIconRotated : ""}`} 
                  />
                </button>

                {isExpanded && (
                  <div className={styles.nestedItemsContainer}>
                    {/* Render Flat Items */}
                    {category.items?.map((item) => {
                      const isItemActive = pathname === item.href || pathname.startsWith(item.href + "/");
                      return (
                        <Link
                          key={item.name}
                          href={item.href}
                          className={`${styles.nestedNavLink} ${isItemActive ? styles.nestedNavLinkActive : ""}`}
                        >
                          <span>{item.name}</span>
                        </Link>
                      );
                    })}

                    {/* Render Subgroups (like Application Master in Masters) */}
                    {category.subGroups?.map((subGroup) => {
                      const isSubGroupActive = subGroup.items.some(item => pathname === item.href || pathname.startsWith(item.href + "/"));
                      const isSubExpanded = expandedSubGroups[subGroup.name];

                      return (
                        <div key={subGroup.name} style={{ display: "flex", flexDirection: "column", gap: "2px" }}>
                          <button
                            onClick={() => toggleSubGroup(subGroup.name)}
                            className={`${styles.subGroupToggleBtn} ${isSubGroupActive ? styles.subGroupToggleActive : ""}`}
                          >
                            <span style={{ fontSize: "12px", fontWeight: 600 }}>{subGroup.name}</span>
                            <ChevronRight 
                              size={12} 
                              className={`${styles.chevronIcon} ${isSubExpanded ? styles.chevronIconRotated : ""}`} 
                            />
                          </button>

                          {isSubExpanded && (
                            <div className={styles.subNestedItemsContainer}>
                              {subGroup.items.map((subItem) => {
                                const isSubItemActive = pathname === subItem.href || pathname.startsWith(subItem.href + "/");
                                return (
                                  <Link
                                    key={subItem.name}
                                    href={subItem.href}
                                    className={`${styles.nestedNavLink} ${isSubItemActive ? styles.nestedNavLinkActive : ""}`}
                                    style={{ fontSize: "11.5px", padding: "5px 10px" }}
                                  >
                                    <span>{subItem.name}</span>
                                  </Link>
                                );
                              })}
                            </div>
                          )}
                        </div>
                      );
                    })}
                  </div>
                )}
              </div>
            );
          })}
        </nav>

        <div className={styles.sidebarFooter}>
          <button className={styles.logoutBtn} onClick={handleLogout}>
            <LogOut size={16} />
            <span>Sign Out</span>
          </button>
        </div>
      </aside>

      {/* Main Workspace */}
      <div className={styles.mainContainer}>
        {/* Header */}
        <header className={styles.header}>
          <div className={styles.pageTitle}>
            {getPageTitle()}
          </div>

          <div style={{ display: "flex", alignItems: "center", gap: "24px" }}>
            {/* System Health Check Badge */}
            <div style={{ display: "flex", alignItems: "center", gap: "6px", fontSize: "12px", fontWeight: 600 }}>
              {serverOnline === true && (
                <>
                  <CheckCircle size={14} style={{ color: "var(--status-success)" }} />
                  <span style={{ color: "var(--text-secondary)" }}>Cloud DB Connected</span>
                </>
              )}
              {serverOnline === false && (
                <>
                  <AlertTriangle size={14} style={{ color: "var(--status-danger)" }} />
                  <span style={{ color: "var(--status-danger)" }}>Cloud DB Offline</span>
                </>
              )}
            </div>

            <div className={styles.userProfile}>
              <div className={styles.avatar}>A</div>
              <div className={styles.userInfo}>
                <span className={styles.userName}>Administrator</span>
                <span className={styles.userRole}>System Admin</span>
              </div>
            </div>
          </div>
        </header>

        {/* Dynamic page content */}
        <main className={styles.content}>
          {children}
        </main>
      </div>
    </div>
  );
}
