'use client';
import GenericMaster from '../../components/GenericMaster';

export default function HolidaysPage() {
  return (
    <GenericMaster
      title="Holiday Master [frmHoliMast]"
      apiBase="/api/acctpay/holidays"
      pk="HlmCode"
      recStateKey="HlmRecState"
      nameKey="HlmName"
      backHref="/dashboard/masters"
      columns={[
        { key: 'HlmDate', label: 'Date' },
        { key: 'HlmName', label: 'Holiday' },
        { key: 'HlmRemark', label: 'Remark' },
      ]}
      fields={[
        { key: 'HlmDate', label: 'Date (dtpHlmDate)', type: 'date', required: true },
        { key: 'HlmName', label: 'Holiday Name (txtHlmName)', required: true, maxLength: 50 },
        { key: 'HlmRemark', label: 'Remark (txtHlmRemark)', maxLength: 100, full: true },
      ]}
    />
  );
}
