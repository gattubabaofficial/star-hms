import { useState } from 'react';
import { InlineMasterGrid } from '../../components/ui/InlineMasterGrid';
import { DoctMaster } from './DoctMaster';
import { PatMaster } from './PatMaster';
import { BedMaster } from './BedMaster';
import { ServMaster } from './ServMaster';
import { ServGrpMaster } from './ServGrpMaster';

type MasterTab = 'Doctors' | 'Patients' | 'Beds' | 'Services' | 'ServiceGroups' | 'General';

const generalMastersList = [
  { id: 'areas', title: 'Area Master', endpoint: '/masters/areas', pk: 'AraCode', name: 'AraName' },
  { id: 'stations', title: 'Station Master', endpoint: '/masters/stations', pk: 'StnCode', name: 'StnName' },
  { id: 'floors', title: 'Floor Master', endpoint: '/masters/floors', pk: 'FlrCode', name: 'FlrName' },
  { id: 'wards', title: 'Ward Master', endpoint: '/masters/wards', pk: 'WrdCode', name: 'WrdName' },
  { id: 'diagnostics', title: 'Diagnosis Master', endpoint: '/masters/diagnostics', pk: 'DigCode', name: 'DigName' },
  { id: 'doct-categories', title: 'Doctor Categories', endpoint: '/masters/doct-categories', pk: 'DcgCode', name: 'DcgName' },
  { id: 'doct-roles', title: 'Doctor Roles', endpoint: '/masters/doct-roles', pk: 'DrlCode', name: 'DrlName' },
  { id: 'pat-categories', title: 'Patient Categories', endpoint: '/masters/pat-categories', pk: 'PcgCode', name: 'PcgName' },
  { id: 'ref-categories', title: 'Referral Categories', endpoint: '/masters/ref-categories', pk: 'RfgCode', name: 'RfgName' },
  { id: 'ref-bys', title: 'Refer-By Entities', endpoint: '/masters/ref-bys', pk: 'RByCode', name: 'RByName' },
  { id: 'ref-tos', title: 'Refer-To Entities', endpoint: '/masters/ref-tos', pk: 'RToCode', name: 'RToName' },
];

export function HospitalMasters() {
  const [activeTab, setActiveTab] = useState<MasterTab>('General');
  const [activeGeneral, setActiveGeneral] = useState(generalMastersList[0].id);

  const renderContent = () => {
    switch (activeTab) {
      case 'Doctors': return <DoctMaster />;
      case 'Patients': return <PatMaster />;
      case 'Beds': return <BedMaster />;
      case 'Services': return <ServMaster />;
      case 'ServiceGroups': return <ServGrpMaster />;
      case 'General':
        const conf = generalMastersList.find(m => m.id === activeGeneral)!;
        return (
          <div className="flex h-full gap-4">
            <div className="w-64 bg-white rounded-lg shadow-sm border border-gray-100 overflow-y-auto">
              <div className="p-3 bg-gray-50 border-b border-gray-100 font-semibold text-gray-700 text-sm">
                General Masters
              </div>
              <ul className="divide-y divide-gray-100">
                {generalMastersList.map(m => (
                  <li 
                    key={m.id}
                    onClick={() => setActiveGeneral(m.id)}
                    className={`p-3 text-sm cursor-pointer hover:bg-gray-50 ${activeGeneral === m.id ? 'bg-blue-50 text-medical-mutedblue font-medium border-l-4 border-medical-mutedblue' : 'text-gray-600 border-l-4 border-transparent'}`}
                  >
                    {m.title}
                  </li>
                ))}
              </ul>
            </div>
            <div className="flex-1">
              <InlineMasterGrid 
                key={conf.id}
                title={conf.title} 
                endpoint={conf.endpoint} 
                queryKey={conf.id} 
                pkField={conf.pk} 
                nameField={conf.name} 
              />
            </div>
          </div>
        );
      default: return null;
    }
  };

  return (
    <div className="flex flex-col h-full -m-6">
      {/* Header Tabs */}
      <div className="bg-white border-b border-gray-200 px-6 pt-4">
        <h1 className="text-xl font-bold text-medical-text mb-4">Hospital Masters</h1>
        <div className="flex space-x-6">
          {(['General', 'Doctors', 'Patients', 'Beds', 'Services', 'ServiceGroups'] as MasterTab[]).map(tab => (
            <button
              key={tab}
              onClick={() => setActiveTab(tab)}
              className={`pb-3 text-sm font-medium transition-colors border-b-2 ${activeTab === tab ? 'border-medical-mutedblue text-medical-mutedblue' : 'border-transparent text-gray-500 hover:text-gray-700'}`}
            >
              {tab.replace(/([A-Z])/g, ' $1').trim()}
            </button>
          ))}
        </div>
      </div>
      
      {/* Content Area */}
      <div className="flex-1 p-6 overflow-hidden">
        {renderContent()}
      </div>
    </div>
  );
}
