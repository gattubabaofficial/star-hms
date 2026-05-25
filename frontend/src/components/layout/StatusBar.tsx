import React from 'react';
import { Building, Calendar, User, Clock } from 'lucide-react';

interface StatusBarProps {
  company: string;
  finYear: string;
  user: string;
  role: string;
  workDate: string;
}

export const StatusBar: React.FC<StatusBarProps> = ({ company, finYear, user, role, workDate }) => {
  const [currentTime, setCurrentTime] = React.useState(new Date());

  React.useEffect(() => {
    const timer = setInterval(() => setCurrentTime(new Date()), 1000);
    return () => clearInterval(timer);
  }, []);

  return (
    <div className="h-8 bg-white border-t border-medical-lightgray flex items-center justify-between px-4 text-xs text-gray-600 shadow-sm z-10 w-full">
      <div className="flex items-center gap-6">
        <div className="flex items-center gap-1.5 font-medium text-medical-mutedblue">
          <Building size={14} />
          {company}
        </div>
        <div className="flex items-center gap-1.5">
          <Calendar size={14} />
          FY: {finYear}
        </div>
      </div>
      
      <div className="flex items-center gap-6">
        <div className="flex items-center gap-1.5">
          <User size={14} />
          {user} <span className="text-gray-400">({role})</span>
        </div>
        <div className="flex items-center gap-1.5">
          <Calendar size={14} />
          WkDt: {workDate}
        </div>
        <div className="flex items-center gap-1.5">
          <Clock size={14} />
          {currentTime.toLocaleTimeString()}
        </div>
      </div>
    </div>
  );
};
