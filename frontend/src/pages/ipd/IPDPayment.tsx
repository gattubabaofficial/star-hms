import { useNavigate } from 'react-router-dom';
import { PaymentRefundForm } from '../../components/shared/PaymentRefundForm';

export function IPDPayment() {
  const navigate = useNavigate();

  return (
    <PaymentRefundForm
      moduleName="IPD"
      actionType="Payment"
      endpoint="/ipd/payments"
      transactionTypes={[
        { label: 'Advance / Registration Deposit', value: 'registration' },
        { label: 'Bill Deposit', value: 'bill' }
      ]}
      onSuccess={(data, type) => {
        if (data.vchNo) {
          navigate('/ipd/receipt', { state: { autoSelectVchNo: data.vchNo, type: type === 'registration' ? 'reg' : type } });
        }
      }}
    />
  );
}
