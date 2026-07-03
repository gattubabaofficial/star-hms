'use client';
import GenericMaster from '../../masters/components/GenericMaster';

export default function VoucherTypesPage() {
  return (
    <GenericMaster
      title="Voucher Type Master [frmVTypMast]"
      apiBase="/api/acctpay/voucher-types"
      pk="VtmCode"
      recStateKey="VtmRecState"
      nameKey="VtmName"
      backHref="/dashboard/accounts"
      columns={[
        { key: 'VtmName', label: 'Voucher Type' },
        { key: 'VtmAbvr', label: 'Abbr' },
        { key: 'VtmPrefix', label: 'Prefix' },
        { key: 'VtmStartNo', label: 'Start No', kind: 'number' },
        { key: 'VtmShowInList', label: 'Show List', kind: 'bool' },
      ]}
      fields={[
        { key: 'VtmName', label: 'Voucher Type (txtVtmName)', required: true, maxLength: 50 },
        { key: 'VtmAbvr', label: 'Abbreviation (txtVtmAbvr)', maxLength: 10 },
        { key: 'VtmPrefix', label: 'Prefix (txtVtmPrefix)', maxLength: 10 },
        { key: 'VtmPostfix', label: 'Postfix (txtVtmPostfix)', maxLength: 10 },
        { key: 'VtmStartNo', label: 'Start No (mskVtmStartNo)', type: 'number' },
        { key: 'VtmPrntCopies', label: 'Print Copies (mskVtmPrntCopies)', type: 'number' },
        { key: 'VtmIndex', label: 'Index (mskVtmIndex)', type: 'number' },
        { key: 'VtmEditable', label: 'Editable (chkVtmEditable)', type: 'checkbox' },
        { key: 'VtmShowInList', label: 'Show in List (chkVtmShowInList)', type: 'checkbox' },
      ]}
    />
  );
}
