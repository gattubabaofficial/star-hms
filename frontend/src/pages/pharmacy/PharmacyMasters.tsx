import { InlineMasterGrid } from '../../components/ui/InlineMasterGrid';

export function PharmacyMasters() {
  return (
    <div className="space-y-6 max-w-5xl mx-auto">
      <div>
        <h1 className="text-2xl font-bold text-medical-text">Pharmacy Masters</h1>
        <p className="text-gray-500 text-sm mt-1">Manage medicines, items, and vendors</p>
      </div>

      <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
        <InlineMasterGrid
          title="Items / Medicines"
          endpoint="/pharmacy/items"
          queryKey="pharmacy-items"
          pkField="SimCode"
          nameField="SimName"
        />

        <InlineMasterGrid
          title="Vendors / Parties"
          endpoint="/pharmacy/parties"
          queryKey="pharmacy-parties"
          pkField="PtyCode"
          nameField="PtyName"
        />
      </div>
    </div>
  );
}
