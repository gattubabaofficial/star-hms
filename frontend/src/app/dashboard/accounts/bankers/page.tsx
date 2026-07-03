'use client';
import GenericMaster from '../../masters/components/GenericMaster';

export default function BankersPage() {
  return (
    <GenericMaster
      title="Banker Master [frmBnkrMast]"
      apiBase="/api/acctpay/bankers"
      pk="BkrCode"
      recStateKey="BkrRecState"
      nameKey="BkrName"
      backHref="/dashboard/accounts"
      columns={[
        { key: 'BkrName', label: 'Banker Name' },
        { key: 'BkrDesc', label: 'Description' },
      ]}
      fields={[
        { key: 'BkrName', label: 'Banker Name (txtBkrName)', required: true, maxLength: 100 },
        { key: 'BkrDesc', label: 'Description (txtBkrDesc)', maxLength: 200, full: true },
      ]}
    />
  );
}
