const fs = require('fs');

const files = [
  'src/app/(dashboard)/ipd/masters/page.tsx',
  'src/app/(dashboard)/ipd/admission/page.tsx',
  'src/app/(dashboard)/ipd/billing/page.tsx',
  'src/app/(dashboard)/lab/billing/page.tsx',
  'src/app/(dashboard)/pharmacy/sales/page.tsx',
  'src/app/(dashboard)/pharmacy/purchases/page.tsx',
  'src/app/(dashboard)/opd/billing/page.tsx',
  'src/app/(dashboard)/opd/patient-master/page.tsx',
  'src/app/(dashboard)/opd/registration/page.tsx',
  'src/app/(dashboard)/services/groups/page.tsx',
  'src/app/(dashboard)/services/master/page.tsx',
  'src/app/(dashboard)/reports/page.tsx',
  'src/app/(dashboard)/masters/doctor-category/page.tsx',
  'src/app/(dashboard)/masters/doctor-master/page.tsx',
  'src/app/(dashboard)/masters/patient-category/page.tsx',
  'src/app/(dashboard)/masters/referral-master/page.tsx'
];

files.forEach(f => {
  if (!fs.existsSync(f)) return;
  let contents = fs.readFileSync(f, 'utf8');
  // Fix grid and layout imports
  contents = contents.replace(/\.\.\/\.\.\/components\/shared/g, '../../../../components/shared');
  contents = contents.replace(/\.\.\/components\/shared/g, '../../../../components/shared');
  
  // Extra patch for icons / etc if any
  fs.writeFileSync(f, contents);
});

console.log('Fixed relative imports');
