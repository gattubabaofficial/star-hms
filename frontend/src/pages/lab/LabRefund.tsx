import { PaymentRefundForm } from '../../components/shared/PaymentRefundForm';

export function LabRefund() {
  return (
    <PaymentRefundForm
      moduleName="Lab"
      actionType="Refund"
      endpoint="/lab/refunds"
      transactionTypes={[
        { label: 'Lab Receipt Refund', value: 'receipt' }
      ]}
    />
  );
}
