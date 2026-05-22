"use client";

import React, { useMemo } from 'react';
import { AgGridReact } from 'ag-grid-react';
import { ColDef, GridReadyEvent, ModuleRegistry, AllCommunityModule } from 'ag-grid-community';

// Register AG Grid modules
ModuleRegistry.registerModules([AllCommunityModule]);

interface Props {
  rowData: any[];
  columnDefs: ColDef[];
  onRowDoubleClicked?: (data: any) => void;
  height?: string | number;
}

export default function GridModule({ rowData, columnDefs, onRowDoubleClicked, height = 400 }: Props) {
  const defaultColDef = useMemo<ColDef>(() => {
    return {
      sortable: true,
      filter: true,
      resizable: true,
      flex: 1,
    };
  }, []);

  return (
    <div style={{ height, width: '100%', borderRadius: 8 }}>
      <AgGridReact
        rowData={rowData}
        columnDefs={columnDefs}
        defaultColDef={defaultColDef}
        rowSelection="single"
        onRowDoubleClicked={(e: any) => {
          if (onRowDoubleClicked) {
            onRowDoubleClicked(e.data);
          }
        }}
        animateRows={true}
      />
    </div>
  );
}
