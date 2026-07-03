'use client';
import GenericMaster from '../../masters/components/GenericMaster';

export default function MedicineGroupsPage() {
  return (
    <GenericMaster
      title="Medicine Group Master [frmMediGrpMst]"
      apiBase="/api/drugstock/medicine-groups"
      pk="MgpCode"
      recStateKey="MgpRecState"
      nameKey="MgpName"
      backHref="/dashboard/pharmacy"
      columns={[
        { key: 'MgpName', label: 'Group Name' },
        { key: 'MgpDesc', label: 'Description' },
        { key: 'MgpIndex', label: 'Index', kind: 'number' },
        { key: 'MgpShowInList', label: 'Show List', kind: 'bool' },
      ]}
      fields={[
        { key: 'MgpName', label: 'Group Name (txtMgpName)', required: true, maxLength: 100 },
        { key: 'MgpDesc', label: 'Description (txtMgpDesc)', maxLength: 200, full: true },
        { key: 'MgpIndex', label: 'Index (mskMgpIndex)', type: 'number' },
        { key: 'MgpShowInList', label: 'Show in List (chkMgpShowInList)', type: 'checkbox' },
      ]}
    />
  );
}
