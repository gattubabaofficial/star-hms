import { NextRequest, NextResponse } from 'next/server';
import { prisma } from '@/lib/prisma';
import { getAuthUser } from '@/lib/auth';

export async function GET(req: NextRequest) {
  const { error } = await getAuthUser(req);
  if (error) return NextResponse.json({ error }, { status: 401 });

  try {
    const q = req.nextUrl.searchParams.get('q');
    let whereClause: any = { OpgRecState: 1 };
    
    // For lookup filtering
    if (q) {
      if ('outdReg' === 'patMast') whereClause.PttName = { contains: q, mode: 'insensitive' };
    }

    const records = await prisma.outdReg.findMany({
      where: whereClause,
      include: { Patient: true, ConsultingDoctor: true, ReferredBy: true },
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
    const { OpgCode: _id, ...data } = body;
    
    if ('outdReg' === 'patMast') {
        if (data.PttDob) data.PttDob = new Date(data.PttDob);
        if (data.PttAgeAsOnDt) data.PttAgeAsOnDt = new Date(data.PttAgeAsOnDt);
        if (!data.PttRegDate) data.PttRegDate = new Date();
    }
    
    if ('outdReg' === 'outdReg') {
        if (!data.OpgDate) data.OpgDate = new Date();
        if (!data.OpgVchNo) {
          const maxVch = await prisma.outdReg.aggregate({ _max: { OpgVchNo: true } });
          data.OpgVchNo = (maxVch._max.OpgVchNo || 0) + 1;
        }
    }

    const record = await prisma.outdReg.create({ data });
    return NextResponse.json(record, { status: 201 });
  } catch (err: any) {
    return NextResponse.json({ error: err.message }, { status: 400 });
  }
}
