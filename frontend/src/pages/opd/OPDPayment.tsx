import { useNavigate } from 'react-router-dom';
import { PaymentRefundForm } from '../../components/shared/PaymentRefundForm';

export function OPDPayment() {
  const navigate = useNavigate();

  return (
    <PaymentRefundForm
      moduleName="OPD"
      actionType="Payment"
      endpoint="/opd/payments"
      transactionTypes={[
        { label: 'Receipt (General)', value: 'receipt' },
        { label: 'Bill Settlement', value: 'bill' }
      ]}
      onSuccess={(data, type) => {
        if (data.vchNo) {
          navigate('/opd/receipt', { state: { autoSelectVchNo: data.vchNo, type: type } });
        }
      }}
    />
  );
}
