import { NextRequest, NextResponse } from 'next/server';
import { prisma } from '@/lib/prisma';
import { getAuthUser } from '@/lib/auth';
import { startOfDay, endOfDay } from 'date-fns';

export async function GET(req: NextRequest) {
  const { error } = await getAuthUser(req);
  if (error) return NextResponse.json({ error }, { status: 401 });

  try {
    const today = new Date();
    const start = startOfDay(today);
    const end = endOfDay(today);

    // 1. OPD Revenue Today
    const opdRev = await prisma.outdHdr.aggregate({
      where: { 
        OhdDate: { gte: start, lte: end },
        OhdRecState: 1,
        // OhdVoidFlag is mapped dynamically in schema or ignored if not present. Fallback to schema structure.
      },
      _sum: { OhdTotalAmt: true }
    });

    // 2. Lab Revenue Today
    const labRev = await prisma.labHdr.aggregate({
      where: { 
        LhdDate: { gte: start, lte: end },
        LhdRecState: 1,
      },
      _sum: { LhdTotalAmt: true }
    });

    // 3. IPD Revenue Today (Final Bills posted today)
    const ipdRev = await prisma.indrBlHdr.aggregate({
      where: { 
        IbhDate: { gte: start, lte: end },
        IbhRecState: 1,
      },
      _sum: { IbhTotalAmt: true }
    });

    // 4. Inpatient Census (Currently Admitted)
    const census = await prisma.indrHdr.count({
      where: { IhdStatus: 'Admitted', IhdRecState: 1 }
    });

    const totalAdmissionsToday = await prisma.indrHdr.count({ where: { IhdDate: { gte: start, lte: end } } });

    return NextResponse.json({
      todayRevenue: (opdRev._sum.OhdTotalAmt || 0) + (labRev._sum.LhdTotalAmt || 0) + (ipdRev._sum.IbhTotalAmt || 0),
      opdRevenue: opdRev._sum.OhdTotalAmt || 0,
      labRevenue: labRev._sum.LhdTotalAmt || 0,
      ipdRevenue: ipdRev._sum.IbhTotalAmt || 0,
      activeCensus: census,
      totalAdmissionsToday
    });
  } catch (err: any) {
    return NextResponse.json({ error: err.message }, { status: 500 });
  }
}
