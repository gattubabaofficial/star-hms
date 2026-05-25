import { PaymentRefundForm } from '../../components/shared/PaymentRefundForm';

export function IPDRefund() {
  return (
    <PaymentRefundForm
      moduleName="IPD"
      actionType="Refund"
      endpoint="/ipd/refunds"
      transactionTypes={[
        { label: 'Advance Refund', value: 'registration' },
        { label: 'Bill Refund', value: 'bill' }
      ]}
    />
  );
}
