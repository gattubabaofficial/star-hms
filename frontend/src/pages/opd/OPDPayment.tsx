import { PaymentRefundForm } from '../../components/shared/PaymentRefundForm';

export function OPDPayment() {
  return (
    <PaymentRefundForm
      moduleName="OPD"
      actionType="Payment"
      endpoint="/opd/payments"
      transactionTypes={[
        { label: 'Receipt (General)', value: 'receipt' },
        { label: 'Bill Settlement', value: 'bill' }
      ]}
    />
  );
}
