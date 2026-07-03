'use client';
import GenericMaster from '../../masters/components/GenericMaster';

export default function AccountHeadsPage() {
  return (
    <GenericMaster
      title="Account Head Master [frmAchdMast]"
      apiBase="/api/acctpay/account-heads"
      pk="AhCode"
      recStateKey="AhRecState"
      nameKey="AhName"
      backHref="/dashboard/accounts"
      columns={[
        { key: 'AhName', label: 'Account Head' },
        { key: 'AhAcgCode', label: 'Group Code', kind: 'number' },
      ]}
      fields={[
        { key: 'AhName', label: 'Account Head (txtAhName)', required: true, maxLength: 100 },
        { key: 'AhAcgCode', label: 'Account Group Code (txtAhAcgCode)', type: 'number' },
        { key: 'AhDepends', label: 'Depends On (txtAhDepends)', type: 'number' },
      ]}
    />
  );
}
