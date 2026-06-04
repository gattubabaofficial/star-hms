import React, { useState } from 'react';
import { NavLink } from 'react-router-dom';
import { LayoutDashboard, Users, UserPlus, Stethoscope, FileText, Pill, Settings, Database, ChevronDown, ChevronRight, Microscope, Menu } from 'lucide-react';
import { useAuthStore } from '../../store/authStore';

export const Sidebar: React.FC = () => {
  const [isCollapsed, setIsCollapsed] = useState(false);
  const [isOpdOpen, setIsOpdOpen] = useState(false);
  const [isIpdOpen, setIsIpdOpen] = useState(false);
  const [isPharmacyOpen, setIsPharmacyOpen] = useState(false);
  const [isLabOpen, setIsLabOpen] = useState(false);
  const [isSystemOpen, setIsSystemOpen] = useState(false);
  const [isReportsOpen, setIsReportsOpen] = useState(false);
  
  const [hoveredItem, setHoveredItem] = useState<string | null>(null);

  const currentUser = useAuthStore(state => state.user);

  // Helper to check access
  const hasAccess = (moduleName: string) => {
    // Admin always has access to everything by design of the backend returning True for everything
    if (!currentUser) return false;
    // We get the specific right from user profile
    const right = currentUser.rights.find(r => r.opt_name === moduleName);
    return right ? right.can_view : false;
  };

  const navItemsRaw = [
    { name: 'Dashboard', icon: <LayoutDashboard size={20} />, path: '/dashboard', requiredModule: 'Dashboard' },
    { 
      name: 'OPD', 
      icon: <UserPlus size={20} />, 
      path: '/opd',
      requiredModule: 'OPD',
      subItems: [
        { name: 'Dashboard', path: '/opd' },
        { name: 'Registration', path: '/opd/registration' },
        { name: 'Billing', path: '/opd/billing' },
        { name: 'Payment', path: '/opd/payment' },
        { name: 'Refund', path: '/opd/refund' },
        { name: 'Receipt Viewer', path: '/opd/receipt' },
      ]
    },
    { 
      name: 'IPD', 
      icon: <Stethoscope size={20} />, 
      path: '/ipd',
      requiredModule: 'IPD',
      subItems: [
        { name: 'Dashboard', path: '/ipd' },
        { name: 'Bed Status', path: '/ipd/bed-status' },
        { name: 'Admission', path: '/ipd/admission' },
        { name: 'Billing', path: '/ipd/billing' },
        { name: 'Payment', path: '/ipd/payment' },
        { name: 'Refund', path: '/ipd/refund' },
        { name: 'Receipt Viewer', path: '/ipd/receipt' },
      ]
    },
    { name: 'Hospital Masters', icon: <Database size={20} />, path: '/masters', requiredModule: 'Hospital Masters' },
    { 
      name: 'Reports', 
      icon: <FileText size={20} />, 
      path: '/reports',
      requiredModule: 'Reports',
      subItems: [
        { name: 'Overview', path: '/reports' },
        { name: 'Collection Report', path: '/reports/collection' },
        { name: 'Service Revenue', path: '/reports/services' },
        { name: 'Bed Occupancy', path: '/reports/bed-status' },
      ]
    },
    { 
      name: 'Pharmacy', 
      icon: <Pill size={20} />, 
      path: '/pharmacy',
      requiredModule: 'Pharmacy',
      subItems: [
        { name: 'Dashboard', path: '/pharmacy' },
        { name: 'Purchase Entry', path: '/pharmacy/purchase' },
        { name: 'Sales & Dispense', path: '/pharmacy/sales' },
        { name: 'Stock Register', path: '/pharmacy/stock' },
        { name: 'Masters', path: '/pharmacy/masters' },
      ]
    },
    {
      name: 'Laboratory',
      icon: <Microscope size={20} />,
      path: '/lab',
      requiredModule: 'Laboratory',
      subItems: [
        { name: 'Dashboard', path: '/lab' },
        { name: 'Lab Billing', path: '/lab/billing' },
        { name: 'Lab Payment', path: '/lab/payment' },
        { name: 'Lab Refund', path: '/lab/refund' },
        { name: 'Receipt Viewer', path: '/lab/receipt' },
      ]
    },
    { 
      name: 'System', 
      icon: <Settings size={20} />, 
      path: '/system', 
      requiredModule: 'System',
      subItems: [
        { name: 'Dashboard', path: '/system' },
        { name: 'Sync Dashboard', path: '/system/sync-dashboard' },
        { name: 'Backup & Restore', path: '/system/backup' },
      ]
    },
  ];

  // Filter items based on user rights
  const navItems = navItemsRaw.filter(item => hasAccess(item.requiredModule));

  return (
    <aside className={`${isCollapsed ? 'w-20' : 'w-64'} transition-all duration-300 ease-in-out bg-white border-r border-medical-border h-full flex flex-col shadow-sm z-10`}>
      <div className={`p-4 border-b border-medical-border flex items-center ${isCollapsed ? 'justify-center' : 'justify-between'} gap-3`}>
        {!isCollapsed && (
          <div className="flex items-center gap-3">
            <div className="w-8 h-8 bg-medical-primary rounded-md flex items-center justify-center text-white font-bold text-lg">
              S
            </div>
            <div>
              <h1 className="text-lg font-semibold text-medical-text leading-tight truncate">STAR HMS</h1>
            </div>
          </div>
        )}
        <button 
          onClick={() => setIsCollapsed(!isCollapsed)}
          className="p-1.5 rounded-md text-gray-500 hover:bg-gray-100 transition-colors"
          title="Toggle Sidebar"
        >
          <Menu size={20} />
        </button>
      </div>
      
      <nav className={`flex-1 py-4 ${isCollapsed ? 'overflow-visible' : 'overflow-y-auto'}`}>
        <ul className="space-y-1 px-2">
          {navItems.map((item) => (
            <li 
              key={item.name} 
              className="relative group"
              onMouseEnter={() => isCollapsed && setHoveredItem(item.name)}
              onMouseLeave={() => isCollapsed && setHoveredItem(null)}
            >
              {item.subItems ? (
                <div>
                    <div
                      onClick={() => {
                        if (!isCollapsed) {
                          if (item.name === 'OPD') setIsOpdOpen(!isOpdOpen);
                          if (item.name === 'IPD') setIsIpdOpen(!isIpdOpen);
                          if (item.name === 'Pharmacy') setIsPharmacyOpen(!isPharmacyOpen);
                          if (item.name === 'Laboratory') setIsLabOpen(!isLabOpen);
                          if (item.name === 'Reports') setIsReportsOpen(!isReportsOpen);
                          if (item.name === 'System') setIsSystemOpen(!isSystemOpen);
                        }
                      }}
                      title={isCollapsed ? item.name : undefined}
                      className={`flex items-center ${isCollapsed ? 'justify-center' : 'justify-between'} px-3 py-2 rounded-md transition-colors text-gray-600 hover:bg-gray-50 hover:text-medical-text cursor-pointer`}
                    >
                      <div className="flex items-center gap-3">
                        {item.icon}
                        {!isCollapsed && <span>{item.name}</span>}
                      </div>
                      {!isCollapsed && (
                        (item.name === 'OPD' && isOpdOpen) || (item.name === 'IPD' && isIpdOpen) || (item.name === 'Pharmacy' && isPharmacyOpen) || (item.name === 'Laboratory' && isLabOpen) || (item.name === 'Reports' && isReportsOpen) || (item.name === 'System' && isSystemOpen) ? <ChevronDown size={16} /> : <ChevronRight size={16} />
                      )}
                    </div>
                    {!isCollapsed && ((item.name === 'OPD' && isOpdOpen) || (item.name === 'IPD' && isIpdOpen) || (item.name === 'Pharmacy' && isPharmacyOpen) || (item.name === 'Laboratory' && isLabOpen) || (item.name === 'Reports' && isReportsOpen) || (item.name === 'System' && isSystemOpen)) && (
                    <ul className="mt-1 space-y-1 pl-9 pr-2">
                      {item.subItems.map((sub) => (
                        <li key={sub.name}>
                          <NavLink
                            to={sub.path}
                            className={({ isActive }) =>
                              `flex items-center gap-3 px-3 py-1.5 text-sm rounded-md transition-colors ${
                                isActive 
                                  ? 'bg-blue-50 text-medical-primary font-medium' 
                                  : 'text-gray-500 hover:bg-gray-50 hover:text-medical-text'
                              }`
                            }
                          >
                            <div className="w-1.5 h-1.5 rounded-full bg-gray-300"></div>
                            <span>{(item.name === 'OPD' || item.name === 'IPD' || item.name === 'Pharmacy' || item.name === 'Laboratory' || item.name === 'System' || item.name === 'Reports') && sub.name === 'Dashboard' ? 'Overview' : sub.name}</span>
                          </NavLink>
                        </li>
                      ))}
                    </ul>
                  )}
                  {/* Collapsed Popout Menu */}
                  {isCollapsed && hoveredItem === item.name && (
                    <div className="absolute left-full top-0 ml-2 w-48 bg-white rounded-md shadow-lg border border-gray-200 z-[100] py-2 overflow-hidden">
                      <div className="px-4 py-2 font-semibold text-medical-text border-b border-gray-100 bg-gray-50 mb-1">
                        {item.name}
                      </div>
                      <ul className="flex flex-col">
                        {item.subItems.map((sub) => (
                          <li key={sub.name}>
                            <NavLink
                              to={sub.path}
                              className={({ isActive }) =>
                                `flex items-center gap-2 px-4 py-2 text-sm transition-colors ${
                                  isActive 
                                    ? 'bg-blue-50 text-medical-primary font-medium' 
                                    : 'text-gray-600 hover:bg-gray-50 hover:text-medical-text'
                                }`
                              }
                            >
                              <span>{(item.name === 'OPD' || item.name === 'IPD' || item.name === 'Pharmacy' || item.name === 'Laboratory' || item.name === 'System' || item.name === 'Reports') && sub.name === 'Dashboard' ? 'Overview' : sub.name}</span>
                            </NavLink>
                          </li>
                        ))}
                      </ul>
                    </div>
                  )}
                </div>
              ) : (
                <div className="relative">
                  <NavLink
                    to={item.path}
                    title={isCollapsed ? item.name : undefined}
                    className={({ isActive }) =>
                      `flex items-center gap-3 ${isCollapsed ? 'justify-center px-0' : 'px-3'} py-2 rounded-md transition-colors ${
                        isActive 
                          ? 'bg-medical-primary text-white font-medium shadow-sm' 
                          : 'text-gray-600 hover:bg-gray-50 hover:text-medical-text'
                      }`
                    }
                  >
                    {item.icon}
                    {!isCollapsed && <span>{item.name}</span>}
                  </NavLink>
                  {/* Collapsed Tooltip/Popout for single items */}
                  {isCollapsed && hoveredItem === item.name && (
                    <div className="absolute left-full top-0 ml-2 bg-gray-800 text-white text-sm px-3 py-2 rounded-md shadow-lg z-[100] whitespace-nowrap">
                      {item.name}
                    </div>
                  )}
                </div>
              )}
            </li>
          ))}
        </ul>
      </nav>
    </aside>
  );
};

