import React from 'react';
import { useQuery } from '@tanstack/react-query';
import api from '../../lib/api';
import { RefreshCw, CheckCircle, XCircle, Clock } from 'lucide-react';
import { format } from 'date-fns';

interface SyncLog {
  id: number;
  table_name: string;
  record_id: number;
  operation: string;
  synced_at: string;
  source: string;
}

interface SyncConfig {
  key: string;
  value: string;
  updated_at: string;
}

export const SyncDashboard: React.FC = () => {
  const { data: logs, isLoading: logsLoading, refetch } = useQuery({
    queryKey: ['syncLogs'],
    queryFn: async () => {
      const res = await api.get<SyncLog[]>('/sync/logs?limit=50');
      return res.data;
    }
  });

  const { data: config } = useQuery({
    queryKey: ['syncConfig'],
    queryFn: async () => {
      const res = await api.get<SyncConfig[]>('/sync/config');
      return res.data;
    }
  });

  const lastSync = config?.find(c => c.key === 'last_sync_time');

  return (
    <div className="space-y-6 h-full flex flex-col">
      <div className="flex justify-between items-center">
        <div>
          <h1 className="text-2xl font-semibold text-medical-text">Sync Dashboard</h1>
          <p className="text-sm text-gray-500">Monitor local ↔ cloud database synchronization</p>
        </div>
        <button 
          onClick={() => refetch()}
          className="flex items-center gap-2 bg-white border border-gray-300 px-4 py-2 rounded-md hover:bg-gray-50 text-sm font-medium"
        >
          <RefreshCw size={16} />
          Refresh
        </button>
      </div>

      <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
        <div className="bg-white rounded-lg border border-gray-200 p-6 flex items-center gap-4">
          <div className="p-3 bg-green-100 text-green-600 rounded-full">
            <CheckCircle size={24} />
          </div>
          <div>
            <p className="text-sm font-medium text-gray-500">Sync Status</p>
            <p className="text-xl font-bold text-gray-900">Active</p>
          </div>
        </div>

        <div className="bg-white rounded-lg border border-gray-200 p-6 flex items-center gap-4">
          <div className="p-3 bg-blue-100 text-blue-600 rounded-full">
            <Clock size={24} />
          </div>
          <div>
            <p className="text-sm font-medium text-gray-500">Last Sync Time</p>
            <p className="text-lg font-bold text-gray-900">
              {lastSync ? format(new Date(lastSync.updated_at), 'dd MMM yyyy, HH:mm:ss') : 'Never'}
            </p>
          </div>
        </div>

        <div className="bg-white rounded-lg border border-gray-200 p-6 flex items-center gap-4">
          <div className="p-3 bg-purple-100 text-purple-600 rounded-full">
            <RefreshCw size={24} />
          </div>
          <div>
            <p className="text-sm font-medium text-gray-500">Recent Operations</p>
            <p className="text-xl font-bold text-gray-900">{logs?.length || 0}</p>
          </div>
        </div>
      </div>

      <div className="bg-white rounded-lg border border-gray-200 flex-1 overflow-hidden flex flex-col">
        <div className="p-4 border-b border-gray-200 bg-gray-50">
          <h2 className="text-sm font-semibold text-gray-700">Recent Sync Logs</h2>
        </div>
        <div className="overflow-auto flex-1">
          <table className="min-w-full divide-y divide-gray-200">
            <thead className="bg-gray-50 sticky top-0">
              <tr>
                <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Time</th>
                <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Table</th>
                <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Record ID</th>
                <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Operation</th>
                <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Source</th>
              </tr>
            </thead>
            <tbody className="bg-white divide-y divide-gray-200">
              {logsLoading ? (
                <tr>
                  <td colSpan={5} className="px-6 py-4 text-center text-sm text-gray-500">Loading logs...</td>
                </tr>
              ) : logs && logs.length > 0 ? (
                logs.map((log) => (
                  <tr key={log.id} className="hover:bg-gray-50">
                    <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                      {format(new Date(log.synced_at), 'dd MMM yyyy, HH:mm:ss')}
                    </td>
                    <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">{log.table_name}</td>
                    <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">{log.record_id}</td>
                    <td className="px-6 py-4 whitespace-nowrap">
                      <span className={`px-2 inline-flex text-xs leading-5 font-semibold rounded-full 
                        ${log.operation === 'INSERT' ? 'bg-green-100 text-green-800' : 
                          log.operation === 'UPDATE' ? 'bg-blue-100 text-blue-800' : 
                          'bg-red-100 text-red-800'}`}>
                        {log.operation}
                      </span>
                    </td>
                    <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500 capitalize">{log.source}</td>
                  </tr>
                ))
              ) : (
                <tr>
                  <td colSpan={5} className="px-6 py-4 text-center text-sm text-gray-500">No sync logs found.</td>
                </tr>
              )}
            </tbody>
          </table>
        </div>
      </div>
    </div>
  );
};
