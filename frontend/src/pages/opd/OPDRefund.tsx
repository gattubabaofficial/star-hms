import { useNavigate } from 'react-router-dom';
import { PaymentRefundForm } from '../../components/shared/PaymentRefundForm';

export function OPDRefund() {
  const navigate = useNavigate();

  return (
    <PaymentRefundForm
      moduleName="OPD"
      actionType="Refund"
      endpoint="/opd/refunds"
      transactionTypes={[
        { label: 'Receipt (General)', value: 'receipt' },
        { label: 'Bill Settlement', value: 'bill' },
        { label: 'Registration', value: 'registration' }
      ]}
      onSuccess={(data, type) => {
        if (data.vchNo) {
          navigate('/opd/receipt', { state: { autoSelectVchNo: data.vchNo, type: type === 'registration' ? 'reg' : type } });
        }
      }}
    />
  );
}
