import { useState, useRef, useEffect } from 'react';
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import api from '../../lib/api';
import { Plus, Trash2 } from 'lucide-react';

interface InlineMasterGridProps {
  title: string;
  endpoint: string;
  queryKey: string;
  pkField: string;
  nameField: string;
}

export function InlineMasterGrid({ title, endpoint, queryKey, pkField, nameField }: InlineMasterGridProps) {
  const queryClient = useQueryClient();
  const [editingId, setEditingId] = useState<number | 'new' | null>(null);
  const [editValue, setEditValue] = useState('');
  const inputRef = useRef<HTMLInputElement>(null);

  const { data: items, isLoading } = useQuery({
    queryKey: [queryKey],
    queryFn: async () => (await api.get<any[]>(endpoint)).data
  });

  const createMutation = useMutation({
    mutationFn: async (val: string) => (await api.post(endpoint, { [nameField]: val })).data,
    onSuccess: () => { queryClient.invalidateQueries({ queryKey: [queryKey] }); setEditingId(null); }
  });

  const updateMutation = useMutation({
    mutationFn: async ({ id, val }: { id: number, val: string }) => (await api.put(`${endpoint}/${id}`, { [nameField]: val })).data,
    onSuccess: () => { queryClient.invalidateQueries({ queryKey: [queryKey] }); setEditingId(null); }
  });

  const deleteMutation = useMutation({
    mutationFn: async (id: number) => await api.delete(`${endpoint}/${id}`),
    onSuccess: () => queryClient.invalidateQueries({ queryKey: [queryKey] })
  });

  useEffect(() => {
    if (editingId !== null && inputRef.current) {
      inputRef.current.focus();
    }
  }, [editingId]);

  const handleKeyDown = (e: React.KeyboardEvent, id: number | 'new') => {
    if (e.key === 'Enter') {
      if (!editValue.trim()) {
        setEditingId(null);
        return;
      }
      if (id === 'new') {
        createMutation.mutate(editValue);
      } else {
        updateMutation.mutate({ id, val: editValue });
      }
    } else if (e.key === 'Escape') {
      setEditingId(null);
    }
  };

  const handleBlur = (id: number | 'new') => {
    if (!editValue.trim()) {
      setEditingId(null);
      return;
    }
    if (id === 'new') {
      createMutation.mutate(editValue);
    } else {
      updateMutation.mutate({ id, val: editValue });
    }
  };

  return (
    <div className="bg-white rounded-lg shadow-sm border border-medical-border flex flex-col h-full overflow-hidden">
      <div className="p-4 border-b border-medical-border flex justify-between items-center bg-gray-50">
        <h2 className="text-lg font-semibold text-medical-text">{title}</h2>
        <button 
          onClick={() => { setEditingId('new'); setEditValue(''); }}
          className="btn-primary text-xs px-3 py-1 flex items-center gap-1"
        >
          <Plus size={14} /> Add Row
        </button>
      </div>

      <div className="flex-1 overflow-auto p-4">
        {isLoading ? (
          <div className="text-sm text-gray-500">Loading...</div>
        ) : (
          <table className="w-full text-left border-collapse">
            <thead>
              <tr className="border-b border-medical-border">
                <th className="py-2 px-3 font-semibold text-gray-600 w-16">ID</th>
                <th className="py-2 px-3 font-semibold text-gray-600">Name (Click to edit)</th>
                <th className="py-2 px-3 font-semibold text-gray-600 w-20 text-right">Actions</th>
              </tr>
            </thead>
            <tbody>
              {items?.map((item, idx) => (
                <tr key={item[pkField]} className="border-b border-medical-border hover:bg-gray-50">
                  <td className="py-2 px-3 text-sm text-gray-500">{item[pkField]}</td>
                  <td className="py-2 px-3 text-sm text-gray-800 cursor-pointer" onClick={() => { setEditingId(item[pkField]); setEditValue(item[nameField]); }}>
                    {editingId === item[pkField] ? (
                      <input
                        ref={inputRef}
                        type="text"
                        value={editValue}
                        onChange={(e) => setEditValue(e.target.value)}
                        onKeyDown={(e) => handleKeyDown(e, item[pkField])}
                        onBlur={() => handleBlur(item[pkField])}
                        className="w-full px-2 py-1 border border-medical-primary rounded focus:outline-none"
                      />
                    ) : (
                      item[nameField]
                    )}
                  </td>
                  <td className="py-2 px-3 text-right">
                    <button 
                      onClick={(e) => { e.stopPropagation(); if (confirm('Delete this item?')) deleteMutation.mutate(item[pkField]); }}
                      className="text-gray-400 hover:text-red-500"
                    >
                      <Trash2 size={16} />
                    </button>
                  </td>
                </tr>
              ))}
              {editingId === 'new' && (
                <tr className="border-b border-medical-border bg-blue-50">
                  <td className="py-2 px-3 text-sm text-gray-500">*</td>
                  <td className="py-2 px-3">
                    <input
                      ref={inputRef}
                      type="text"
                      value={editValue}
                      onChange={(e) => setEditValue(e.target.value)}
                      onKeyDown={(e) => handleKeyDown(e, 'new')}
                      onBlur={() => handleBlur('new')}
                      className="w-full px-2 py-1 border border-medical-primary rounded focus:outline-none"
                      placeholder="Type name and press Enter..."
                    />
                  </td>
                  <td className="py-2 px-3"></td>
                </tr>
              )}
            </tbody>
          </table>
        )}
      </div>
    </div>
  );
}


