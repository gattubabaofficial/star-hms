'use client';
import GenericMaster from '../../masters/components/GenericMaster';

export default function ProductsPage() {
  return (
    <GenericMaster
      title="Product (Stock Item) Master [frmProdMast]"
      apiBase="/api/drugstock/products"
      pk="ItmCode"
      recStateKey="ItmRecState"
      nameKey="ItmName"
      backHref="/dashboard/pharmacy"
      columns={[
        { key: 'ItmName', label: 'Product Name' },
        { key: 'ItmDesc', label: 'Description' },
      ]}
      fields={[
        { key: 'ItmName', label: 'Product Name (txtItmName)', required: true, maxLength: 100 },
        { key: 'ItmDesc', label: 'Description (txtItmDesc)', maxLength: 200, full: true },
        { key: 'ItmDepends', label: 'Depends On (txtItmDepends)', type: 'number' },
      ]}
    />
  );
}
