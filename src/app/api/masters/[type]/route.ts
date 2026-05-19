import { NextRequest, NextResponse } from 'next/server';
import { prisma } from '@/lib/prisma';
import { getAuthUser } from '@/lib/auth';

const MASTER_CONFIG: Record<string, { model: any, idField: string, stateField: string, include?: any }> = {
  'patient-category': { model: 'patCatgMst', idField: 'PcgCode', stateField: 'PcgRecState' },
  'doctor-category': { model: 'doctCatgMst', idField: 'DcgCode', stateField: 'DcgRecState' },
  'doctor-master': { model: 'doctMast', idField: 'DctCode', stateField: 'DctRecState', include: { Category: true, Role: true } },
  'referral-master': { model: 'refByMast', idField: 'RByCode', stateField: 'RByRecState', include: { Category: true } },
};

// GET all active
export async function GET(req: NextRequest, { params }: { params: Promise<{ type: string }> }) {
  const { error } = await getAuthUser(req);
  if (error) return NextResponse.json({ error }, { status: 401 });

  const resolvedParams = await params;
  const type = resolvedParams.type;

  try {
    if (type === 'doctor-role') {
      const records = await prisma.doctRoleMst.findMany({ where: { DrlRecState: 1 } });
      return NextResponse.json(records);
    }
    
    if (type === 'referral-category') {
      const records = await prisma.refCatgMst.findMany({ where: { RfgRecState: 1 } });
      return NextResponse.json(records);
    }

    if (type === 'user-roles') {
      const roles = await prisma.userRoleMst.findMany({ where: { UrlRecState: 1 } });
      return NextResponse.json(roles);
    }

    const config = MASTER_CONFIG[type];
    if (!config) {
      return NextResponse.json({ error: 'Invalid master type' }, { status: 404 });
    }

    const records = await (prisma as any)[config.model].findMany({
      where: { [config.stateField]: 1 },
      include: config.include
    });
    
    return NextResponse.json(records);
  } catch (err: any) {
    return NextResponse.json({ error: err.message }, { status: 500 });
  }
}

// POST create
export async function POST(req: NextRequest, { params }: { params: Promise<{ type: string }> }) {
  const { error } = await getAuthUser(req);
  if (error) return NextResponse.json({ error }, { status: 401 });

  const resolvedParams = await params;
  const type = resolvedParams.type;
  const config = MASTER_CONFIG[type];
  
  if (!config) {
    return NextResponse.json({ error: 'Invalid master type' }, { status: 404 });
  }

  try {
    const body = await req.json();
    const { [config.idField]: _id, ...data } = body;
    
    const record = await (prisma as any)[config.model].create({
      data,
    });
    return NextResponse.json(record, { status: 201 });
  } catch (err: any) {
    return NextResponse.json({ error: err.message }, { status: 400 });
  }
}
