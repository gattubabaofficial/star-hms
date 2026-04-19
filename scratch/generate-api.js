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
    const q = req.nextUrl.searchParams.get('q');
    let whereClause: any = { ${state}: 1 };
    
    // For lookup filtering
    if (q) {
      if ('${model}' === 'patMast') whereClause.PttName = { contains: q, mode: 'insensitive' };
    }

    const records = await prisma.${model}.findMany({
      where: whereClause,
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
    
    if ('${model}' === 'patMast') {
        if (data.PttDob) data.PttDob = new Date(data.PttDob);
        if (data.PttAgeAsOnDt) data.PttAgeAsOnDt = new Date(data.PttAgeAsOnDt);
        if (!data.PttRegDate) data.PttRegDate = new Date();
    }
    
    if ('${model}' === 'outdReg') {
        if (!data.OpgDate) data.OpgDate = new Date();
        if (!data.OpgVchNo) {
          const maxVch = await prisma.outdReg.aggregate({ _max: { OpgVchNo: true } });
          data.OpgVchNo = (maxVch._max.OpgVchNo || 0) + 1;
        }
    }

    const record = await prisma.${model}.create({ data });
    return NextResponse.json(record, { status: 201 });
  } catch (err: any) {
    return NextResponse.json({ error: err.message }, { status: 400 });
  }
}
`;

const getIdGen = (model, id, state) => `import { NextRequest, NextResponse } from 'next/server';
import { prisma } from '../../../../../../lib/prisma';
import { getAuthUser } from '../../../../../../lib/auth';

export async function PUT(req: NextRequest, { params }: { params: Promise<{ id: string }> }) {
  const { error } = await getAuthUser(req);
  if (error) return NextResponse.json({ error }, { status: 401 });
  const { id: paramId } = await params;

  try {
    const body = await req.json();
    const { ${id}: _id, ...data } = body;
    
    if ('${model}' === 'patMast') {
        if (data.PttDob) data.PttDob = new Date(data.PttDob);
        if (data.PttAgeAsOnDt) data.PttAgeAsOnDt = new Date(data.PttAgeAsOnDt);
    }
    
    const record = await prisma.${model}.update({
      where: { ${id}: parseInt(paramId) },
      data
    });
    return NextResponse.json(record);
  } catch (err: any) {
    return NextResponse.json({ error: err.message }, { status: 400 });
  }
}

export async function DELETE(req: NextRequest, { params }: { params: Promise<{ id: string }> }) {
  const { error } = await getAuthUser(req);
  if (error) return NextResponse.json({ error }, { status: 401 });
  const { id: paramId } = await params;

  try {
    await prisma.${model}.update({
      where: { ${id}: parseInt(paramId) },
      data: { ${state}: 0 }
    });
    return NextResponse.json({ message: 'Deleted logically' });
  } catch (err: any) {
    return NextResponse.json({ error: err.message }, { status: 400 });
  }
}
`;

writeRoute('src/app/api/services/groups', getGen('servGrpMst', 'SgpCode', 'SgpRecState'));
writeRoute('src/app/api/services/groups/[id]', getIdGen('servGrpMst', 'SgpCode', 'SgpRecState'));

writeRoute('src/app/api/services/master', getGen('servMast', 'SrvCode', 'SrvRecState', '{ Group: true }'));
writeRoute('src/app/api/services/master/[id]', getIdGen('servMast', 'SrvCode', 'SrvRecState'));

writeRoute('src/app/api/opd/patient-master', getGen('patMast', 'PttCode', 'PttRecState', '{ Category: true, Area: true, Station: true }'));
writeRoute('src/app/api/opd/patient-master/[id]', getIdGen('patMast', 'PttCode', 'PttRecState'));

writeRoute('src/app/api/opd/registration', getGen('outdReg', 'OpgCode', 'OpgRecState', '{ Patient: true, ConsultingDoctor: true, ReferredBy: true }'));
writeRoute('src/app/api/opd/registration/[id]', getIdGen('outdReg', 'OpgCode', 'OpgRecState'));

// The geo masters are simpler
const getBasicLookup = (model, state) => `import { NextResponse } from 'next/server';
import { prisma } from '../../../../lib/prisma';
export async function GET() {
  try {
    const records = await prisma.${model}.findMany({ where: { ${state}: 1 } });
    return NextResponse.json(records);
  } catch (err: any) {
    return NextResponse.json({ error: err.message }, { status: 500 });
  }
}`;

writeRoute('src/app/api/opd/area-master', getBasicLookup('areaMast', 'AraRecState'));
writeRoute('src/app/api/opd/station-master', getBasicLookup('stsnMast', 'StnRecState'));

console.log('Successfully generated generic files');
