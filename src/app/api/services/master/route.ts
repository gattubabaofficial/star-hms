import { NextRequest, NextResponse } from 'next/server';
import { prisma } from '@/lib/prisma';
import { getAuthUser } from '@/lib/auth';

export async function GET(req: NextRequest) {
  const { error } = await getAuthUser(req);
  if (error) return NextResponse.json({ error }, { status: 401 });

  try {
    const q = req.nextUrl.searchParams.get('q');
    let whereClause: any = { SrvRecState: 1 };
    
    // For lookup filtering
    if (q) {
      if ('servMast' === 'patMast') whereClause.PttName = { contains: q, mode: 'insensitive' };
    }

    const records = await prisma.servMast.findMany({
      where: whereClause,
      include: { Group: true },
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
    const { SrvCode: _id, ...data } = body;
    
    if ('servMast' === 'patMast') {
        if (data.PttDob) data.PttDob = new Date(data.PttDob);
        if (data.PttAgeAsOnDt) data.PttAgeAsOnDt = new Date(data.PttAgeAsOnDt);
        if (!data.PttRegDate) data.PttRegDate = new Date();
    }
    
    if ('servMast' === 'outdReg') {
        if (!data.OpgDate) data.OpgDate = new Date();
        if (!data.OpgVchNo) {
          const maxVch = await prisma.outdReg.aggregate({ _max: { OpgVchNo: true } });
          data.OpgVchNo = (maxVch._max.OpgVchNo || 0) + 1;
        }
    }

    const record = await prisma.servMast.create({ data });
    return NextResponse.json(record, { status: 201 });
  } catch (err: any) {
    return NextResponse.json({ error: err.message }, { status: 400 });
  }
}
