'use client';
import GenericMaster from '../../masters/components/GenericMaster';

export default function MedicineCompositionsPage() {
  return (
    <GenericMaster
      title="Medicine Composition Master [frmMediCpoMst]"
      apiBase="/api/drugstock/medicine-compositions"
      pk="MpoCode"
      recStateKey="MpoRecState"
      nameKey="MpoName"
      backHref="/dashboard/pharmacy"
      columns={[
        { key: 'MpoName', label: 'Composition' },
        { key: 'MpoDesc', label: 'Description' },
        { key: 'MpoIndex', label: 'Index', kind: 'number' },
        { key: 'MpoShowInList', label: 'Show List', kind: 'bool' },
      ]}
      fields={[
        { key: 'MpoName', label: 'Composition (txtMpoName)', required: true, maxLength: 100 },
        { key: 'MpoDesc', label: 'Description (txtMpoDesc)', maxLength: 200, full: true },
        { key: 'MpoScdH1', label: 'Schedule H1 (chkMpoScdH1)', type: 'checkbox' },
        { key: 'MpoIndex', label: 'Index (mskMpoIndex)', type: 'number' },
        { key: 'MpoShowInList', label: 'Show in List (chkMpoShowInList)', type: 'checkbox' },
      ]}
    />
  );
}
