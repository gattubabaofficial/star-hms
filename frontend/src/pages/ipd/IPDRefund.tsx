import { useNavigate } from 'react-router-dom';
import { PaymentRefundForm } from '../../components/shared/PaymentRefundForm';

export function IPDRefund() {
  const navigate = useNavigate();

  return (
    <PaymentRefundForm
      moduleName="IPD"
      actionType="Refund"
      endpoint="/ipd/refunds"
      transactionTypes={[
        { label: 'Registration Refund', value: 'registration' },
        { label: 'Bill Refund', value: 'bill' }
      ]}
      onSuccess={(data, type) => {
        if (data.vchNo) {
          navigate('/ipd/receipt', { state: { autoSelectVchNo: data.vchNo, type: type === 'registration' ? 'reg' : type } });
        }
      }}
    />
  );
}
