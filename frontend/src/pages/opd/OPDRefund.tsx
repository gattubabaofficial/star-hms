import { PaymentRefundForm } from '../../components/shared/PaymentRefundForm';

export function OPDRefund() {
  return (
    <PaymentRefundForm
      moduleName="OPD"
      actionType="Refund"
      endpoint="/opd/refunds"
      transactionTypes={[
        { label: 'Registration Refund', value: 'registration' },
        { label: 'Receipt Refund', value: 'receipt' },
        { label: 'Bill Refund', value: 'bill' }
      ]}
    />
  );
}
