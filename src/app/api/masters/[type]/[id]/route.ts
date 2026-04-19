import { NextRequest, NextResponse } from 'next/server';
import { prisma } from '@/lib/prisma';
import { getAuthUser } from '@/lib/auth';

const MASTER_CONFIG: Record<string, { model: any, idField: string, stateField: string, include?: any }> = {
  'patient-category': { model: 'patCatgMst', idField: 'PcgCode', stateField: 'PcgRecState' },
  'doctor-category': { model: 'doctCatgMst', idField: 'DcgCode', stateField: 'DcgRecState' },
  'doctor-master': { model: 'doctMast', idField: 'DctCode', stateField: 'DctRecState', include: { Category: true, Role: true } },
  'referral-master': { model: 'refByMast', idField: 'RByCode', stateField: 'RByRecState', include: { Category: true } },
};

// PUT update
export async function PUT(req: NextRequest, { params }: { params: Promise<{ type: string; id: string }> }) {
  const { error } = await getAuthUser(req);
  if (error) return NextResponse.json({ error }, { status: 401 });

  const resolvedParams = await params;
  const { type, id } = resolvedParams;
  const config = MASTER_CONFIG[type];
  
  if (!config) {
    return NextResponse.json({ error: 'Invalid master type' }, { status: 404 });
  }

  try {
    const body = await req.json();
    const { [config.idField]: _id, ...data } = body;
    
    const record = await (prisma as any)[config.model].update({
      where: { [config.idField]: parseInt(id) },
      data
    });
    return NextResponse.json(record);
  } catch (err: any) {
    return NextResponse.json({ error: err.message }, { status: 400 });
  }
}

// DELETE logically
export async function DELETE(req: NextRequest, { params }: { params: Promise<{ type: string; id: string }> }) {
  const { error } = await getAuthUser(req);
  if (error) return NextResponse.json({ error }, { status: 401 });

  const resolvedParams = await params;
  const { type, id } = resolvedParams;
  const config = MASTER_CONFIG[type];
  
  if (!config) {
    return NextResponse.json({ error: 'Invalid master type' }, { status: 404 });
  }

  try {
    await (prisma as any)[config.model].update({
      where: { [config.idField]: parseInt(id) },
      data: { [config.stateField]: 0 }
    });
    return NextResponse.json({ message: 'Deleted successfully' });
  } catch (err: any) {
    return NextResponse.json({ error: err.message }, { status: 400 });
  }
}
