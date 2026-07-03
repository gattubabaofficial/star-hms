'use client';
import GenericMaster from '../../masters/components/GenericMaster';

export default function TestMethodsPage() {
  return (
    <GenericMaster
      title="Test Method Master [frmTestMethodMast]"
      apiBase="/api/pathology/test-methods"
      pk="TmhCode"
      recStateKey="TmhRecState"
      nameKey="TmhName"
      backHref="/dashboard/laboratory"
      columns={[
        { key: 'TmhName', label: 'Method Name' },
        { key: 'TmhIndex', label: 'Index', kind: 'number' },
        { key: 'TmhShowInList', label: 'Show List', kind: 'bool' },
      ]}
      fields={[
        { key: 'TmhName', label: 'Method Name (txtTmhName)', required: true, maxLength: 50 },
        { key: 'TmhIndex', label: 'Index (mskTmhIndex)', type: 'number' },
        { key: 'TmhShowInList', label: 'Show in List (chkTmhShowInList)', type: 'checkbox' },
      ]}
    />
  );
}
