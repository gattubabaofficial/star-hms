import { DatabaseBackup, Download, ShieldCheck, AlertTriangle } from 'lucide-react';
import { useState } from 'react';
import api from '../../lib/api';

export function BackupUtil() {
  const [isBackingUp, setIsBackingUp] = useState(false);

  const handleBackup = async () => {
    setIsBackingUp(true);
    try {
      const response = await api.get('/system/backup', {
        responseType: 'blob'
      });
      
      // Extract filename from headers if possible, or generate a fallback
      const contentDisposition = response.headers['content-disposition'];
      let filename = `star-hms-backup.json`;
      if (contentDisposition) {
        const filenameMatch = contentDisposition.match(/filename="?([^"]+)"?/);
        if (filenameMatch && filenameMatch.length === 2) {
          filename = filenameMatch[1];
        }
      }

      // Create a download link and trigger the download
      const url = window.URL.createObjectURL(new Blob([response.data]));
      const link = document.createElement('a');
      link.href = url;
      link.setAttribute('download', filename);
      document.body.appendChild(link);
      link.click();
      
      // Clean up
      link.parentNode?.removeChild(link);
      window.URL.revokeObjectURL(url);
    } catch (error) {
      console.error('Failed to download backup:', error);
      alert('Failed to download backup. Please try again or check console logs.');
    } finally {
      setIsBackingUp(false);
    }
  };

  return (
    <div className="max-w-4xl mx-auto space-y-6">
      <div>
        <h1 className="text-2xl font-bold text-medical-text">Backup Utility</h1>
        <p className="text-gray-500 text-sm mt-1">Securely backup your hospital management data</p>
      </div>

      <div className="card space-y-8">
        <div className="flex gap-6 items-start">
          <div className="w-16 h-16 rounded-2xl bg-blue-50 flex items-center justify-center shrink-0">
            <DatabaseBackup className="text-blue-600" size={32} />
          </div>
          <div>
            <h2 className="text-lg font-semibold text-gray-800">Database JSON Dump</h2>
            <p className="text-gray-600 mt-1">
              Generate a complete structural JSON backup of all registered tables in the database. 
              This format is universally compatible and does not require Postgres command-line tools to be installed on the host machine.
            </p>
            
            <div className="mt-4 flex gap-4">
              <button 
                onClick={handleBackup} 
                disabled={isBackingUp}
                className="btn-primary flex items-center gap-2"
              >
                {isBackingUp ? (
                  <div className="w-5 h-5 border-2 border-white border-t-transparent rounded-full animate-spin"></div>
                ) : (
                  <Download size={18} />
                )}
                {isBackingUp ? 'Generating Backup...' : 'Generate & Download Backup'}
              </button>
            </div>
          </div>
        </div>

        <hr />

        <div className="grid md:grid-cols-2 gap-6">
          <div className="bg-gray-50 p-4 rounded-lg border flex gap-4">
            <ShieldCheck className="text-green-600 shrink-0 mt-1" size={24} />
            <div>
              <h3 className="font-medium text-gray-800">What is included?</h3>
              <p className="text-sm text-gray-600 mt-1">
                All patient records, billing information, master configurations, pharmacy stock details, and user accounts.
              </p>
            </div>
          </div>
          <div className="bg-orange-50 p-4 rounded-lg border border-orange-100 flex gap-4">
            <AlertTriangle className="text-orange-600 shrink-0 mt-1" size={24} />
            <div>
              <h3 className="font-medium text-gray-800">Storage Warning</h3>
              <p className="text-sm text-gray-600 mt-1">
                Keep the downloaded JSON file in a secure location. It contains sensitive PHI (Protected Health Information).
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
