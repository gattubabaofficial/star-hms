'use client';
import GenericMaster from '../../masters/components/GenericMaster';

export default function MedicineCompaniesPage() {
  return (
    <GenericMaster
      title="Medicine Company Master [frmMediCpyMst]"
      apiBase="/api/drugstock/medicine-companies"
      pk="McyCode"
      recStateKey="McyRecState"
      nameKey="McyName"
      backHref="/dashboard/pharmacy"
      columns={[
        { key: 'McyName', label: 'Company Name' },
        { key: 'McyDesc', label: 'Description' },
        { key: 'McyIndex', label: 'Index', kind: 'number' },
        { key: 'McyShowInList', label: 'Show List', kind: 'bool' },
      ]}
      fields={[
        { key: 'McyName', label: 'Company Name (txtMcyName)', required: true, maxLength: 100 },
        { key: 'McyDesc', label: 'Description (txtMcyDesc)', maxLength: 200, full: true },
        { key: 'McyIndex', label: 'Index (mskMcyIndex)', type: 'number' },
        { key: 'McyShowInList', label: 'Show in List (chkMcyShowInList)', type: 'checkbox' },
      ]}
    />
  );
}
