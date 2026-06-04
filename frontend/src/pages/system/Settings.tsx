import React, { useState, useEffect } from 'react';
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import { Save, AlertCircle, CheckCircle, Settings as SettingsIcon, Monitor, Activity, FlaskConical } from 'lucide-react';
import api from '../../lib/api';

type TabType = 'General' | 'OPD' | 'IPD' | 'Lab';

interface SysOptsSchema {
  SysId: number;
  
  TimewseServShareSys: boolean;
  RTowseServShareSys: boolean;
  RBywseServShareSys: boolean;
  PcgwseServShareSys: boolean;
  DctwseServShareSys: boolean;
  ExtServShareSys: boolean;
  
  TimewseServBargSys: boolean;
  RTowseServBargSys: boolean;
  RBywseServBargSys: boolean;
  PcgwseServBargSys: boolean;
  DctwseServBargSys: boolean;
  ExtServBargSys: boolean;
  
  TimewseServDiscSys: boolean;
  RTowseServDiscSys: boolean;
  RBywseServDiscSys: boolean;
  PcgwseServDiscSys: boolean;
  DctwseServDiscSys: boolean;
  ExtServDiscSys: boolean;
  
  TimewseServRateSys: boolean;
  RTowseServRateSys: boolean;
  RBywseServRateSys: boolean;
  PcgwseServRateSys: boolean;
  DctwseServRateSys: boolean;
  ExtServRateSys: boolean;
  
  OpdDefaultTaxRate: number;
  OpdDefaultDiscount: number;
  OpdReceiptPrefix: string;
  OpdPrintReceiptOnSave: boolean;
  OpdAllowCredit: boolean;
  OpdDefaultDoctorCharges: number;
  
  IpdDefaultTaxRate: number;
  IpdReceiptPrefix: string;
  IpdPrintReceiptOnSave: boolean;
  IpdAutoCalculateBedCharges: boolean;
  IpdEnforceAdvancePayment: boolean;
  IpdMinAdvanceAmount: number;
  IpdDischargeTimeLimit: number;
  
  LabDefaultTaxRate: number;
  LabReceiptPrefix: string;
  LabPrintReceiptOnSave: boolean;
  LabAutoApproveResults: boolean;
  LabAllowCredit: boolean;
}

export function Settings() {
  const queryClient = useQueryClient();
  const [activeTab, setActiveTab] = useState<TabType>('General');
  const [formData, setFormData] = useState<SysOptsSchema | null>(null);
  const [saveSuccess, setSaveSuccess] = useState(false);

  const { data: config, isLoading } = useQuery({
    queryKey: ['system-config'],
    queryFn: async () => {
      const res = await api.get<SysOptsSchema>('/system/config');
      return res.data;
    }
  });

  useEffect(() => {
    if (config) {
      setFormData(config);
    }
  }, [config]);

  const updateMutation = useMutation({
    mutationFn: async (data: SysOptsSchema) => {
      const res = await api.put<SysOptsSchema>('/system/config', data);
      return res.data;
    },
    onSuccess: (data) => {
      queryClient.setQueryData(['system-config'], data);
      setSaveSuccess(true);
      setTimeout(() => setSaveSuccess(false), 3000);
    }
  });

  if (isLoading || !formData) {
    return <div className="p-8 flex justify-center"><div className="w-8 h-8 border-4 border-medical-primary border-t-transparent rounded-full animate-spin"></div></div>;
  }

  const handleChange = (field: keyof SysOptsSchema, value: boolean | string | number) => {
    setFormData(prev => prev ? { ...prev, [field]: value } : prev);
  };

  const handleSave = () => {
    if (formData) {
      updateMutation.mutate(formData);
    }
  };

  const renderCheckbox = (field: keyof SysOptsSchema, label: string) => (
    <label className="flex items-center gap-2 text-sm text-gray-700 cursor-pointer">
      <input 
        type="checkbox" 
        checked={formData[field] as boolean}
        onChange={e => handleChange(field, e.target.checked)}
        className="rounded text-medical-primary focus:ring-medical-primary border-gray-300"
      />
      {label}
    </label>
  );

  const renderInput = (field: keyof SysOptsSchema, label: string, type: 'text' | 'number') => (
    <div className="flex flex-col gap-1">
      <label className="text-sm font-medium text-gray-700">{label}</label>
      <input 
        type={type} 
        value={formData[field] as string | number}
        onChange={e => handleChange(field, type === 'number' ? Number(e.target.value) : e.target.value)}
        className="input-field"
      />
    </div>
  );

  return (
    <div className="max-w-6xl mx-auto space-y-6">
      <div className="flex justify-between items-center">
        <div>
          <h1 className="text-2xl font-bold text-gray-900">Advanced Settings & Configurations</h1>
          <p className="text-gray-500 text-sm mt-1">Global application parameters and defaults</p>
        </div>
        <button 
          onClick={handleSave}
          disabled={updateMutation.isPending}
          className="btn-primary flex items-center gap-2"
        >
          <Save size={18} /> {updateMutation.isPending ? 'Saving...' : 'Save Configuration'}
        </button>
      </div>

      {saveSuccess && (
        <div className="bg-green-50 text-green-800 p-4 rounded-lg flex items-center gap-3 border border-green-200">
          <CheckCircle className="text-green-600" size={20} />
          <p className="font-medium">System configuration updated successfully.</p>
        </div>
      )}

      <div className="bg-white rounded-lg shadow-sm border border-gray-200 overflow-hidden">
        <div className="flex border-b border-gray-200">
          {[
            { id: 'General', icon: SettingsIcon, label: 'General Options' },
            { id: 'OPD', icon: Monitor, label: 'OPD Defaults' },
            { id: 'IPD', icon: Activity, label: 'IPD Rules' },
            { id: 'Lab', icon: FlaskConical, label: 'Laboratory Config' },
          ].map(tab => (
            <button
              key={tab.id}
              onClick={() => setActiveTab(tab.id as TabType)}
              className={`flex items-center gap-2 px-6 py-4 font-medium text-sm transition-colors ${
                activeTab === tab.id 
                  ? 'border-b-2 border-medical-primary text-medical-primary bg-blue-50/30' 
                  : 'text-gray-600 hover:text-gray-900 hover:bg-gray-50'
              }`}
            >
              <tab.icon size={18} />
              {tab.label}
            </button>
          ))}
        </div>

        <div className="p-6">
          {activeTab === 'General' && (
            <div className="space-y-8">
              <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8">
                {/* Share System */}
                <div className="space-y-3">
                  <h3 className="font-semibold text-gray-900 border-b pb-2">Service Share System</h3>
                  {renderCheckbox('TimewseServShareSys', 'Time-wise Share System')}
                  {renderCheckbox('RTowseServShareSys', 'Ref.To-wise Share System')}
                  {renderCheckbox('RBywseServShareSys', 'Ref.By-wise Share System')}
                  {renderCheckbox('PcgwseServShareSys', 'Patient Category-wise')}
                  {renderCheckbox('DctwseServShareSys', 'Doctor-wise Share System')}
                  {renderCheckbox('ExtServShareSys', 'Extended Share System')}
                </div>

                {/* Bargain System */}
                <div className="space-y-3">
                  <h3 className="font-semibold text-gray-900 border-b pb-2">Service Bargain System</h3>
                  {renderCheckbox('TimewseServBargSys', 'Time-wise Bargain System')}
                  {renderCheckbox('RTowseServBargSys', 'Ref.To-wise Bargain System')}
                  {renderCheckbox('RBywseServBargSys', 'Ref.By-wise Bargain System')}
                  {renderCheckbox('PcgwseServBargSys', 'Patient Category-wise')}
                  {renderCheckbox('DctwseServBargSys', 'Doctor-wise Bargain System')}
                  {renderCheckbox('ExtServBargSys', 'Extended Bargain System')}
                </div>

                {/* Discount System */}
                <div className="space-y-3">
                  <h3 className="font-semibold text-gray-900 border-b pb-2">Service Discount System</h3>
                  {renderCheckbox('TimewseServDiscSys', 'Time-wise Discount System')}
                  {renderCheckbox('RTowseServDiscSys', 'Ref.To-wise Discount System')}
                  {renderCheckbox('RBywseServDiscSys', 'Ref.By-wise Discount System')}
                  {renderCheckbox('PcgwseServDiscSys', 'Patient Category-wise')}
                  {renderCheckbox('DctwseServDiscSys', 'Doctor-wise Discount System')}
                  {renderCheckbox('ExtServDiscSys', 'Extended Discount System')}
                </div>

                {/* Rate System */}
                <div className="space-y-3">
                  <h3 className="font-semibold text-gray-900 border-b pb-2">Service Rate System</h3>
                  {renderCheckbox('TimewseServRateSys', 'Time-wise Rate System')}
                  {renderCheckbox('RTowseServRateSys', 'Ref.To-wise Rate System')}
                  {renderCheckbox('RBywseServRateSys', 'Ref.By-wise Rate System')}
                  {renderCheckbox('PcgwseServRateSys', 'Patient Category-wise')}
                  {renderCheckbox('DctwseServRateSys', 'Doctor-wise Rate System')}
                  {renderCheckbox('ExtServRateSys', 'Extended Rate System')}
                </div>
              </div>
            </div>
          )}

          {activeTab === 'OPD' && (
            <div className="grid grid-cols-1 md:grid-cols-2 gap-8 max-w-4xl">
              <div className="space-y-4">
                <h3 className="font-semibold text-gray-900 border-b pb-2">Billing Defaults</h3>
                {renderInput('OpdDefaultTaxRate', 'Default Tax Rate (%)', 'number')}
                {renderInput('OpdDefaultDiscount', 'Default Discount (%)', 'number')}
                {renderInput('OpdDefaultDoctorCharges', 'Default Doctor Charges (₹)', 'number')}
              </div>
              <div className="space-y-4">
                <h3 className="font-semibold text-gray-900 border-b pb-2">Receipt & Behavior</h3>
                {renderInput('OpdReceiptPrefix', 'Receipt Prefix Format', 'text')}
                <div className="pt-2 space-y-3">
                  {renderCheckbox('OpdPrintReceiptOnSave', 'Auto-print Receipt on Save')}
                  {renderCheckbox('OpdAllowCredit', 'Allow Credit Billing (Unpaid)')}
                </div>
              </div>
            </div>
          )}

          {activeTab === 'IPD' && (
            <div className="grid grid-cols-1 md:grid-cols-2 gap-8 max-w-4xl">
              <div className="space-y-4">
                <h3 className="font-semibold text-gray-900 border-b pb-2">Admission & Charges</h3>
                {renderInput('IpdDefaultTaxRate', 'Default Tax Rate (%)', 'number')}
                {renderInput('IpdMinAdvanceAmount', 'Minimum Advance Amount (₹)', 'number')}
                {renderInput('IpdDischargeTimeLimit', 'Standard Discharge Time (24h format)', 'number')}
              </div>
              <div className="space-y-4">
                <h3 className="font-semibold text-gray-900 border-b pb-2">Rules & Behavior</h3>
                {renderInput('IpdReceiptPrefix', 'Receipt Prefix Format', 'text')}
                <div className="pt-2 space-y-3">
                  {renderCheckbox('IpdPrintReceiptOnSave', 'Auto-print Receipt on Save')}
                  {renderCheckbox('IpdAutoCalculateBedCharges', 'Auto-calculate Daily Bed Charges')}
                  {renderCheckbox('IpdEnforceAdvancePayment', 'Enforce Advance Payment at Admission')}
                </div>
              </div>
            </div>
          )}

          {activeTab === 'Lab' && (
            <div className="grid grid-cols-1 md:grid-cols-2 gap-8 max-w-4xl">
              <div className="space-y-4">
                <h3 className="font-semibold text-gray-900 border-b pb-2">Laboratory Defaults</h3>
                {renderInput('LabDefaultTaxRate', 'Default Tax Rate (%)', 'number')}
                {renderInput('LabReceiptPrefix', 'Receipt Prefix Format', 'text')}
              </div>
              <div className="space-y-4">
                <h3 className="font-semibold text-gray-900 border-b pb-2">Operational Rules</h3>
                <div className="pt-2 space-y-3">
                  {renderCheckbox('LabPrintReceiptOnSave', 'Auto-print Receipt on Save')}
                  {renderCheckbox('LabAutoApproveResults', 'Auto-Approve Final Results')}
                  {renderCheckbox('LabAllowCredit', 'Allow Credit Billing')}
                </div>
              </div>
            </div>
          )}
        </div>
      </div>
    </div>
  );
}
