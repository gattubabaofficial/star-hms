import { PaymentRefundForm } from '../../components/shared/PaymentRefundForm';

export function IPDPayment() {
  return (
    <PaymentRefundForm
      moduleName="IPD"
      actionType="Payment"
      endpoint="/ipd/payments"
      transactionTypes={[
        { label: 'Advance / Registration Deposit', value: 'registration' },
        { label: 'Bill Deposit', value: 'bill' }
      ]}
    />
  );
}
