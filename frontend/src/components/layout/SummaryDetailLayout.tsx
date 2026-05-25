import React from 'react';

interface SummaryDetailLayoutProps {
  title: string;
  listComponent: React.ReactNode;
  detailComponent: React.ReactNode;
  isDetailActive?: boolean;
}

export function SummaryDetailLayout({ 
  title, 
  listComponent, 
  detailComponent,
  isDetailActive = false 
}: SummaryDetailLayoutProps) {
  return (
    <div className="h-full flex flex-col gap-4">
      <div className="flex justify-between items-center">
        <h1 className="text-2xl font-semibold text-medical-text">{title}</h1>
      </div>
      
      <div className="flex-1 flex gap-6 min-h-0">
        {/* Summary List Panel */}
        <div className={`w-1/3 flex flex-col bg-white border border-gray-200 rounded-lg shadow-sm overflow-hidden ${isDetailActive ? 'hidden md:flex' : 'flex'}`}>
          <div className="p-4 bg-medical-bg border-b border-gray-200">
            <h2 className="font-medium text-gray-700">Records</h2>
          </div>
          <div className="flex-1 overflow-y-auto">
            {listComponent}
          </div>
        </div>

        {/* Detail Form Panel */}
        <div className={`flex-1 flex flex-col bg-white border border-gray-200 rounded-lg shadow-sm overflow-hidden ${!isDetailActive ? 'hidden md:flex' : 'flex'}`}>
          <div className="p-4 bg-medical-bg border-b border-gray-200 flex justify-between items-center">
            <h2 className="font-medium text-gray-700">Details</h2>
          </div>
          <div className="flex-1 overflow-y-auto p-6">
            {detailComponent}
          </div>
        </div>
      </div>
    </div>
  );
}
