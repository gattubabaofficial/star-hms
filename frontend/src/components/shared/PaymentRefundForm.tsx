import { useState, useRef } from 'react';
import api from '../../lib/api';
import { CheckCircle2, AlertCircle } from 'lucide-react';
import { useFormValidation } from '../../lib/useFormValidation';
import { useFormKeyboard } from '../../lib/useFormKeyboard';

interface PaymentRefundFormProps {
  moduleName: 'OPD' | 'IPD' | 'Lab';
  actionType: 'Payment' | 'Refund';
  endpoint: string;
  transactionTypes: { label: string; value: string }[];
  onSuccess?: (data: any, type: string) => void;
}

export function PaymentRefundForm({ moduleName, actionType, endpoint, transactionTypes, onSuccess }: PaymentRefundFormProps) {
  const formRef = useRef<HTMLFormElement>(null);
  useFormKeyboard(formRef);
  useFormValidation(formRef);

  const [loading, setLoading] = useState(false);
  const [success, setSuccess] = useState(false);
  const [error, setError] = useState<string | null>(null);

  const [formData, setFormData] = useState({
    transaction_type: transactionTypes[0]?.value || '',
    ref_id: '',
    amount: '',
    date: new Date().toISOString().split('T')[0]
  });

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setLoading(true);
    setError(null);
    setSuccess(false);

    try {
      const res = await api.post(endpoint, {
        ...formData,
        ref_id: parseInt(formData.ref_id),
        amount: parseFloat(formData.amount)
      });
      setSuccess(true);
      setFormData({ ...formData, ref_id: '', amount: '' }); // reset fields
      if (onSuccess) {
        onSuccess(res.data, formData.transaction_type);
      }
    } catch (err: any) {
      setError(err.response?.data?.detail || 'An error occurred during the transaction.');
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="max-w-2xl mx-auto space-y-6">
      <div>
        <h1 className="text-2xl font-bold text-medical-text">
          {moduleName} {actionType}
        </h1>
        <p className="text-gray-500 text-sm mt-1">
          Record a new {actionType.toLowerCase()} against an existing {moduleName} transaction.
        </p>
      </div>

      <div className="card p-6">
        <form ref={formRef} onSubmit={handleSubmit} className="space-y-4">
          
          {success && (
            <div className="p-3 bg-green-50 text-green-700 rounded-md flex items-center gap-2">
              <CheckCircle2 size={18} /> {actionType} recorded successfully.
            </div>
          )}
          
          {error && (
            <div className="p-3 bg-red-50 text-red-700 rounded-md flex items-center gap-2">
              <AlertCircle size={18} /> {error}
            </div>
          )}

          <div className="grid grid-cols-2 gap-4">
            <div className="space-y-1">
              <label className="text-sm font-medium text-gray-700">Transaction Type</label>
              <select 
                className="input-field" 
                value={formData.transaction_type}
                onChange={e => setFormData({...formData, transaction_type: e.target.value})}
                required
              >
                {transactionTypes.map(t => (
                  <option key={t.value} value={t.value}>{t.label}</option>
                ))}
              </select>
            </div>

            <div className="space-y-1">
              <label className="text-sm font-medium text-gray-700">Reference ID (Voucher/Bill/Reg No)</label>
              <input 
                type="number" 
                className="input-field" 
                value={formData.ref_id}
                onChange={e => setFormData({...formData, ref_id: e.target.value})}
                required
              />
            </div>

            <div className="space-y-1">
              <label className="text-sm font-medium text-gray-700">Amount (₹)</label>
              <input 
                type="number" 
                step="0.01"
                min="0"
                className="input-field" 
                value={formData.amount}
                onChange={e => setFormData({...formData, amount: e.target.value})}
                required
              />
            </div>

            <div className="space-y-1">
              <label className="text-sm font-medium text-gray-700">Date</label>
              <input 
                type="date" 
                className="input-field" 
                value={formData.date}
                onChange={e => setFormData({...formData, date: e.target.value})}
                required
              />
            </div>
          </div>

          <div className="flex justify-end pt-4 border-t border-medical-border">
            <button 
              type="submit" 
              disabled={loading}
              className="btn-primary"
            >
              {loading ? 'Processing...' : `Record ${actionType}`}
            </button>
          </div>
        </form>
      </div>
    </div>
  );
}

