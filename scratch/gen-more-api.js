const fs = require('fs');
const path = require('path');

const writeRoute = (folder, content) => {
  const p = path.join(__dirname, '..', folder, 'route.ts');
  fs.writeFileSync(p, content);
};

const getGen = (model, id, state, include = '') => `import { NextRequest, NextResponse } from 'next/server';
import { prisma } from '../../../../../lib/prisma';
import { getAuthUser } from '../../../../../lib/auth';

export async function GET(req: NextRequest) {
  const { error } = await getAuthUser(req);
  if (error) return NextResponse.json({ error }, { status: 401 });

  try {
    const records = await prisma.${model}.findMany({
      where: { ${state}: 1 },
      ${include ? `include: ${include},` : ''}
    });
    return NextResponse.json(records);
  } catch (err: any) {
    return NextResponse.json({ error: err.message }, { status: 500 });
  }
}

export async function POST(req: NextRequest) {
  const { error } = await getAuthUser(req);
  if (error) return NextResponse.json({ error }, { status: 401 });

  try {
    let body = await req.json();
    const { ${id}: _id, ...data } = body;
    const record = await prisma.${model}.create({ data });
    return NextResponse.json(record, { status: 201 });
  } catch (err: any) {
    return NextResponse.json({ error: err.message }, { status: 400 });
  }
}
`;

writeRoute('src/app/api/ipd/floors', getGen('floorMast', 'FlrCode', 'FlrRecState'));
writeRoute('src/app/api/ipd/wards', getGen('wardMast', 'WrdCode', 'WrdRecState'));
writeRoute('src/app/api/ipd/beds', getGen('bedMast', 'BdmCode', 'BdmRecState', `{ Ward: true, Floor: true, Service: true, IndrHdr: { where: { IhdStatus: 'Admitted' }, include: { Patient: true } } }`));
writeRoute('src/app/api/pharmacy/items', getGen('subItmMast', 'SimCode', 'SimRecState', '{ Group: true }'));
writeRoute('src/app/api/pharmacy/parties', getGen('partyMast', 'PryCode', 'PryRecState', '{ Group: true }'));
console.log('done');
