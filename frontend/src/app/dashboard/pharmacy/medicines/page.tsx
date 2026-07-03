'use client';
import GenericMaster from '../../masters/components/GenericMaster';

export default function MedicinesPage() {
  return (
    <GenericMaster
      title="Medicine Master [frmMediMast]"
      apiBase="/api/drugstock/medicines"
      pk="MpdCode"
      recStateKey="MpdRecState"
      nameKey="MpdName"
      backHref="/dashboard/pharmacy"
      columns={[
        { key: 'MpdName', label: 'Medicine Name' },
        { key: 'MpdRefNo', label: 'Ref No' },
        { key: 'MpdPacking', label: 'Packing' },
        { key: 'MpdLooseQty', label: 'Loose Qty', kind: 'number' },
        { key: 'MpdShowInList', label: 'Show List', kind: 'bool' },
      ]}
      fields={[
        { key: 'MpdName', label: 'Medicine Name (txtMpdName)', required: true, maxLength: 100 },
        { key: 'MpdDesc', label: 'Description (txtMpdDesc)', maxLength: 200, full: true },
        { key: 'MpdRefNo', label: 'Ref No (txtMpdRefNo)', maxLength: 20 },
        { key: 'MpdMcyCode', label: 'Company Code (txtMpdMcyCode)', type: 'number' },
        { key: 'MpdMgpCode', label: 'Group Code (txtMpdMgpCode)', type: 'number' },
        { key: 'MpdMpoCode', label: 'Composition Code (txtMpdMpoCode)', type: 'number' },
        { key: 'MpdPacking', label: 'Packing (txtMpdPacking)', maxLength: 20 },
        { key: 'MpdLooseQty', label: 'Loose Qty (mskMpdLooseQty)', type: 'number' },
        { key: 'MpdIndex', label: 'Index (mskMpdIndex)', type: 'number' },
        { key: 'MpdShowInList', label: 'Show in List (chkMpdShowInList)', type: 'checkbox' },
      ]}
    />
  );
}
