import { useQuery } from '@tanstack/react-query';
import api from '../../lib/api';
import { Pill, ShoppingCart, ShoppingBag, ArrowRight } from 'lucide-react';
import { Link } from 'react-router-dom';

export function PharmacyDashboard() {
  const { data: sales, isLoading: salesLoading } = useQuery({
    queryKey: ['pharmacy-sales'],
    queryFn: async () => (await api.get<any[]>('/pharmacy/sales')).data,
    refetchInterval: 30000
  });

  const { data: purchases, isLoading: purchasesLoading } = useQuery({
    queryKey: ['pharmacy-purchases'],
    queryFn: async () => (await api.get<any[]>('/pharmacy/purchases')).data,
    refetchInterval: 30000
  });

  const todaySalesCount = sales?.length || 0;
  const todaySalesRevenue = sales?.reduce((sum, s) => sum + s.OskNetAmt, 0) || 0;
  const todayPurchasesCount = purchases?.length || 0;

  return (
    <div className="space-y-6">
      <div className="flex justify-between items-end">
        <div>
          <h1 className="text-2xl font-bold text-medical-text">Pharmacy Dashboard</h1>
          <p className="text-gray-500 text-sm mt-1">Inventory, Purchases & Sales</p>
        </div>
        <div className="flex gap-3">
          <Link to="/pharmacy/purchase" className="btn-primary flex items-center gap-2">
            <ShoppingCart size={18} /> Inward (Purchase)
          </Link>
          <Link to="/pharmacy/sales" className="btn-success flex items-center gap-2">
            <ShoppingBag size={18} /> Outward (Sales)
          </Link>
        </div>
      </div>

      <div className="grid grid-cols-1 md:grid-cols-4 gap-4">
        <div className="card flex items-center gap-4">
          <div className="p-3 bg-blue-50 text-medical-mutedblue rounded-lg"><Pill size={24} /></div>
          <div>
            <h3 className="text-sm font-medium text-gray-500">Today's Sales</h3>
            <p className="text-2xl font-bold text-gray-800">{todaySalesCount}</p>
          </div>
        </div>
        <div className="card flex items-center gap-4">
          <div className="p-3 bg-green-50 text-green-600 rounded-lg"><ArrowRight size={24} /></div>
          <div>
            <h3 className="text-sm font-medium text-gray-500">Sales Revenue</h3>
            <p className="text-2xl font-bold text-gray-800">₹{todaySalesRevenue.toFixed(2)}</p>
          </div>
        </div>
        <div className="card flex items-center gap-4">
          <div className="p-3 bg-orange-50 text-orange-600 rounded-lg"><ShoppingCart size={24} /></div>
          <div>
            <h3 className="text-sm font-medium text-gray-500">Today's Purchases</h3>
            <p className="text-2xl font-bold text-gray-800">{todayPurchasesCount}</p>
          </div>
        </div>
      </div>

      <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
        <div className="card">
          <h2 className="text-lg font-semibold text-gray-800 mb-4">Recent Sales</h2>
          <div className="overflow-x-auto">
            <table className="w-full text-left border-collapse">
              <thead>
                <tr className="border-b border-gray-200 bg-gray-50">
                  <th className="py-2 px-3 font-medium text-sm text-gray-600">Bill No</th>
                  <th className="py-2 px-3 font-medium text-sm text-gray-600">Date</th>
                  <th className="py-2 px-3 font-medium text-sm text-gray-600 text-right">Net Amount</th>
                </tr>
              </thead>
              <tbody>
                {salesLoading ? <tr><td colSpan={3} className="py-4 text-center">Loading...</td></tr> : 
                  sales?.slice(0, 5).map(s => (
                  <tr key={s.OskCode} className="border-b border-gray-50">
                    <td className="py-2 px-3 text-sm">SLS-{s.OskVchNo}</td>
                    <td className="py-2 px-3 text-sm text-gray-600">{s.OskDate}</td>
                    <td className="py-2 px-3 text-sm font-medium text-right text-green-600">₹{s.OskNetAmt.toFixed(2)}</td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </div>

        <div className="card">
          <h2 className="text-lg font-semibold text-gray-800 mb-4">Recent Purchases</h2>
          <div className="overflow-x-auto">
            <table className="w-full text-left border-collapse">
              <thead>
                <tr className="border-b border-gray-200 bg-gray-50">
                  <th className="py-2 px-3 font-medium text-sm text-gray-600">PO No</th>
                  <th className="py-2 px-3 font-medium text-sm text-gray-600">Date</th>
                  <th className="py-2 px-3 font-medium text-sm text-gray-600 text-right">Net Amount</th>
                </tr>
              </thead>
              <tbody>
                {purchasesLoading ? <tr><td colSpan={3} className="py-4 text-center">Loading...</td></tr> : 
                  purchases?.slice(0, 5).map(p => (
                  <tr key={p.IskCode} className="border-b border-gray-50">
                    <td className="py-2 px-3 text-sm">PUR-{p.IskVchNo}</td>
                    <td className="py-2 px-3 text-sm text-gray-600">{p.IskDate}</td>
                    <td className="py-2 px-3 text-sm font-medium text-right text-blue-600">₹{p.IskNetAmt.toFixed(2)}</td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  );
}
