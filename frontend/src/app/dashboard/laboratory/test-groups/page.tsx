'use client';
import GenericMaster from '../../masters/components/GenericMaster';

export default function TestGroupsPage() {
  return (
    <GenericMaster
      title="Test Group Master [frmTestGrpMast]"
      apiBase="/api/pathology/test-groups"
      pk="TgpCode"
      recStateKey="TgpRecState"
      nameKey="TgpName"
      backHref="/dashboard/laboratory"
      columns={[
        { key: 'TgpName', label: 'Group Name' },
        { key: 'TgpPrintName', label: 'Print Name' },
        { key: 'TgpIndex', label: 'Index', kind: 'number' },
        { key: 'TgpShowInList', label: 'Show List', kind: 'bool' },
      ]}
      fields={[
        { key: 'TgpName', label: 'Group Name (txtTgpName)', required: true, maxLength: 25 },
        { key: 'TgpPrintName', label: 'Print Name (txtTgpPrintName)', maxLength: 125 },
        { key: 'TgpHdrNote', label: 'Header Note (txtTgpHdrNote)', maxLength: 125, full: true },
        { key: 'TgpDtlNote', label: 'Detail Note (txtTgpDtlNote)', maxLength: 125, full: true },
        { key: 'TgpFtrNote', label: 'Footer Note (txtTgpFtrNote)', maxLength: 125, full: true },
        { key: 'TgpIndex', label: 'Index (mskTgpIndex)', type: 'number' },
        { key: 'TgpShowInList', label: 'Show in List (chkTgpShowInList)', type: 'checkbox' },
      ]}
    />
  );
}
