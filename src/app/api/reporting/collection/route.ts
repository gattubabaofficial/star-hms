import { NextRequest, NextResponse } from 'next/server';
import { prisma } from '@/lib/prisma';
import { getAuthUser } from '@/lib/auth';
import { startOfDay, endOfDay } from 'date-fns';

export async function GET(req: NextRequest) {
  const { error } = await getAuthUser(req);
  if (error) return NextResponse.json({ error }, { status: 401 });

  try {
    const { searchParams } = new URL(req.url);
    const fromStr = searchParams.get('from');
    const toStr = searchParams.get('to');
    
    const start = fromStr ? new Date(fromStr) : startOfDay(new Date());
    const end = toStr ? new Date(toStr) : endOfDay(new Date());

    // Consolidated Collection report
    const opd = await prisma.outdHdr.findMany({
      where: { OhdDate: { gte: start, lte: end }, OhdRecState: 1 },
      include: { Patient: true }
    });
    
    const lab = await prisma.labHdr.findMany({
      where: { LhdDate: { gte: start, lte: end }, LhdRecState: 1 },
      include: { Patient: true }
    });

    const ipd = await prisma.indrBlHdr.findMany({
      where: { IbhDate: { gte: start, lte: end }, IbhRecState: 1 },
      include: { Patient: true }
    });

    return NextResponse.json({ opd, lab, ipd });
  } catch (err: any) {
    return NextResponse.json({ error: err.message }, { status: 500 });
  }
}
