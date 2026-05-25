import { PaymentRefundForm } from '../../components/shared/PaymentRefundForm';

export function LabPayment() {
  return (
    <PaymentRefundForm
      moduleName="Lab"
      actionType="Payment"
      endpoint="/lab/payments"
      transactionTypes={[
        { label: 'Lab Receipt Settlement', value: 'receipt' }
      ]}
    />
  );
}
