import { useQuery } from '@tanstack/react-query';
import api from '../../lib/api';
import { Download, BedDouble, Calendar } from 'lucide-react';
import { format } from 'date-fns';

export function BedStatusReport() {
  const { data: beds, isLoading } = useQuery({
    queryKey: ['report-bed-occupancy'],
    queryFn: async () => {
      const res = await api.get<any[]>('/reports/bed-occupancy');
      return res.data;
    }
  });

  const printReport = () => {
    window.print();
  };

  return (
    <div className="max-w-6xl mx-auto space-y-6">
      <div className="flex flex-col md:flex-row md:justify-between md:items-end gap-4 print:hidden">
        <div>
          <h1 className="text-2xl font-bold text-medical-text">Current Bed Occupancy</h1>
          <p className="text-gray-500 text-sm mt-1">Live snapshot of admitted patients and bed allocations</p>
        </div>
        
        <button onClick={printReport} className="btn-primary flex items-center gap-2">
          <Download size={18} /> Print List
        </button>
      </div>

      <div className="card print:shadow-none print:border-none print:p-0">
        <div className="hidden print:block mb-6 text-center border-b pb-4">
          <h2 className="text-2xl font-bold text-gray-800">STAR HMS</h2>
          <h3 className="text-xl font-semibold mt-1">IPD Bed Occupancy Report</h3>
          <p className="text-sm text-gray-600 mt-2">
            Generated on: {format(new Date(), 'dd MMM yyyy, hh:mm a')}
          </p>
        </div>

        {isLoading ? (
          <div className="py-12 flex justify-center"><div className="w-8 h-8 border-4 border-medical-mutedblue border-t-transparent rounded-full animate-spin"></div></div>
        ) : (
          <div>
            <div className="mb-6 flex items-center gap-3 bg-blue-50 p-4 rounded-lg border border-blue-100">
              <div className="w-10 h-10 rounded-full bg-blue-100 flex items-center justify-center text-blue-600">
                <BedDouble size={20} />
              </div>
              <div>
                <p className="text-sm text-blue-600 font-medium">Currently Occupied Beds</p>
                <p className="text-2xl font-bold text-blue-900">{beds?.length || 0}</p>
              </div>
            </div>

            <table className="data-table">
              <thead>
                <tr>
                  <th>Vch No</th>
                  <th>Patient Name</th>
                  <th>Age / Sex</th>
                  <th>Mobile</th>
                  <th>Admission Date</th>
                  <th>Floor</th>
                  <th>Ward</th>
                  <th>Bed</th>
                </tr>
              </thead>
              <tbody>
                {beds?.length === 0 ? (
                  <tr>
                    <td colSpan={8} className="text-center py-8 text-gray-500">No beds are currently occupied.</td>
                  </tr>
                ) : (
                  beds?.map((item, index) => (
                    <tr key={index}>
                      <td className="font-mono text-gray-600">{item.IhdVchNo}</td>
                      <td className="font-medium text-gray-900">{item.PatientName}</td>
                      <td>{item.Age} / {item.Gender}</td>
                      <td>{item.Mobile}</td>
                      <td>{format(new Date(item.AdmissionDate), 'dd/MM/yyyy')}</td>
                      <td>{item.FloorName}</td>
                      <td>{item.WardName}</td>
                      <td className="font-bold text-medical-mutedblue">{item.BedName}</td>
                    </tr>
                  ))
                )}
              </tbody>
            </table>
          </div>
        )}
      </div>
    </div>
  );
}
