'use client';
import GenericMaster from '../../masters/components/GenericMaster';

export default function TestDepartmentsPage() {
  return (
    <GenericMaster
      title="Test Department Master [frmTestDeptMast]"
      apiBase="/api/pathology/test-departments"
      pk="TdpCode"
      recStateKey="TdpRecState"
      nameKey="TdpName"
      backHref="/dashboard/laboratory"
      columns={[
        { key: 'TdpName', label: 'Department Name' },
        { key: 'TdpPrintName', label: 'Print Name' },
        { key: 'TdpIndex', label: 'Index', kind: 'number' },
        { key: 'TdpShowInList', label: 'Show List', kind: 'bool' },
      ]}
      fields={[
        { key: 'TdpName', label: 'Department Name (txtTdpName)', required: true, maxLength: 25 },
        { key: 'TdpPrintName', label: 'Print Name (txtTdpPrintName)', maxLength: 125 },
        { key: 'TdpHdrNote', label: 'Header Note (txtTdpHdrNote)', maxLength: 125, full: true },
        { key: 'TdpDtlNote', label: 'Detail Note (txtTdpDtlNote)', maxLength: 125, full: true },
        { key: 'TdpFtrNote', label: 'Footer Note (txtTdpFtrNote)', maxLength: 125, full: true },
        { key: 'TdpIndex', label: 'Index (mskTdpIndex)', type: 'number' },
        { key: 'TdpShowInList', label: 'Show in List (chkTdpShowInList)', type: 'checkbox' },
      ]}
    />
  );
}
