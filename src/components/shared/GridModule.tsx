"use client";

import React, { useMemo } from 'react';
import { AgGridReact } from 'ag-grid-react';
import { ColDef, GridReadyEvent } from 'ag-grid-community';

// AG Grid Core Styles
import 'ag-grid-community/styles/ag-grid.css';
import 'ag-grid-community/styles/ag-theme-alpine.css';

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
    <div className="ag-theme-alpine-dark" style={{ height, width: '100%', borderRadius: 8 }}>
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
