'use client';
import GenericMaster from '../../components/GenericMaster';

export default function EmployeeLegacyPage() {
  return (
    <GenericMaster
      title="Employee Master [frmEmpMast]"
      apiBase="/api/acctpay/employees"
      pk="EmpCode"
      recStateKey="EmpRecState"
      nameKey="EmpName"
      backHref="/dashboard/masters"
      columns={[
        { key: 'EmpName', label: 'Employee Name' },
        { key: 'EmpDptCode', label: 'Dept', kind: 'number' },
        { key: 'EmpDsgCode', label: 'Desig', kind: 'number' },
        { key: 'EmpBSalary', label: 'Basic Salary', kind: 'number' },
      ]}
      fields={[
        { key: 'EmpName', label: 'Employee Name (txtEmpName)', required: true, maxLength: 100 },
        { key: 'EmpDptCode', label: 'Department Code (txtEmpDptCode)', type: 'number' },
        { key: 'EmpDsgCode', label: 'Designation Code (txtEmpDsgCode)', type: 'number' },
        { key: 'EmpJoinDate', label: 'Join Date (dtpEmpJoinDate)', type: 'date' },
        { key: 'EmpBSalary', label: 'Basic Salary (mskEmpBSalary)', type: 'number', step: '0.01' },
        { key: 'EmpHRAPer', label: 'HRA % (mskEmpHRAPer)', type: 'number', step: '0.01' },
        { key: 'EmpDAPer', label: 'DA % (mskEmpDAPer)', type: 'number', step: '0.01' },
        { key: 'EmpNSalary', label: 'Net Salary (mskEmpNSalary)', type: 'number', step: '0.01' },
      ]}
    />
  );
}
