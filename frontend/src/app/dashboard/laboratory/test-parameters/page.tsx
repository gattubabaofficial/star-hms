'use client';
import GenericMaster from '../../masters/components/GenericMaster';

export default function TestParametersPage() {
  return (
    <GenericMaster
      title="Test Parameter Master [frmTestParaMast]"
      apiBase="/api/pathology/test-parameters"
      pk="TprCode"
      recStateKey="TprRecState"
      nameKey="TprName"
      backHref="/dashboard/laboratory"
      columns={[
        { key: 'TprName', label: 'Parameter' },
        { key: 'TprRngUnit', label: 'Unit' },
        { key: 'TprRng1', label: 'Low', kind: 'number' },
        { key: 'TprRng2', label: 'High', kind: 'number' },
        { key: 'TprShowInList', label: 'Show List', kind: 'bool' },
      ]}
      fields={[
        { key: 'TprName', label: 'Parameter Name (txtTprName)', required: true, maxLength: 25 },
        { key: 'TprPrintName', label: 'Print Name (txtTprPrintName)', maxLength: 125 },
        { key: 'TprTdpCode', label: 'Department Code (txtTprTdpCode)', type: 'number' },
        { key: 'TprTgpCode', label: 'Group Code (txtTprTgpCode)', type: 'number' },
        { key: 'TprTmhCode', label: 'Method Code (txtTprTmhCode)', type: 'number' },
        { key: 'TprTspCode', label: 'Sample Type Code (txtTprTspCode)', type: 'number' },
        { key: 'TprSrvCode', label: 'Service Code (txtTprSrvCode)', type: 'number' },
        { key: 'TprRng1', label: 'Range Low (mskTprRng1)', type: 'number', step: '0.01' },
        { key: 'TprRng2', label: 'Range High (mskTprRng2)', type: 'number', step: '0.01' },
        { key: 'TprRngUnit', label: 'Range Unit (txtTprRngUnit)', maxLength: 75 },
        { key: 'TprListValue', label: 'List Values (txtTprListValue)', maxLength: 125, full: true },
        { key: 'TprRemark', label: 'Remark (txtTprRemark)', maxLength: 125, full: true },
        { key: 'TprIndex', label: 'Index (mskTprIndex)', type: 'number' },
        { key: 'TprShowInList', label: 'Show in List (chkTprShowInList)', type: 'checkbox' },
      ]}
    />
  );
}
