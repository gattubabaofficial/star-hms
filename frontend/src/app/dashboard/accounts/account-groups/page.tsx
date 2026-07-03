'use client';
import GenericMaster from '../../masters/components/GenericMaster';

export default function AccountGroupsPage() {
  return (
    <GenericMaster
      title="Account Group Master [frmAcntGrpMst]"
      apiBase="/api/acctpay/account-groups"
      pk="AcgCode"
      recStateKey="AcgRecState"
      nameKey="AcgName"
      backHref="/dashboard/accounts"
      columns={[
        { key: 'AcgName', label: 'Group Name' },
        { key: 'AcgAbvr', label: 'Abbr' },
        { key: 'AcgIndex', label: 'Index', kind: 'number' },
      ]}
      fields={[
        { key: 'AcgName', label: 'Group Name (txtAcgName)', required: true, maxLength: 100 },
        { key: 'AcgAbvr', label: 'Abbreviation (txtAcgAbvr)', maxLength: 10 },
        { key: 'AcgBaseCode', label: 'Base Code (txtAcgBaseCode)', type: 'number' },
        { key: 'AcgDepends', label: 'Depends On (txtAcgDepends)', type: 'number' },
        { key: 'AcgIndex', label: 'Index (mskAcgIndex)', type: 'number' },
      ]}
    />
  );
}
