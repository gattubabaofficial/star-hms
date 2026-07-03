'use client';
import GenericMaster from '../../masters/components/GenericMaster';

export default function TestSampleTypesPage() {
  return (
    <GenericMaster
      title="Test Sample Type Master [frmTestSampTypMast]"
      apiBase="/api/pathology/test-sample-types"
      pk="TspCode"
      recStateKey="TspRecState"
      nameKey="TspName"
      backHref="/dashboard/laboratory"
      columns={[
        { key: 'TspName', label: 'Sample Type' },
        { key: 'TspIndex', label: 'Index', kind: 'number' },
        { key: 'TspShowInList', label: 'Show List', kind: 'bool' },
      ]}
      fields={[
        { key: 'TspName', label: 'Sample Type (txtTspName)', required: true, maxLength: 50 },
        { key: 'TspIndex', label: 'Index (mskTspIndex)', type: 'number' },
        { key: 'TspShowInList', label: 'Show in List (chkTspShowInList)', type: 'checkbox' },
      ]}
    />
  );
}
