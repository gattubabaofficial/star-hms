import { NextRequest, NextResponse } from 'next/server';
import { prisma } from '@/lib/prisma';
import { getAuthUser } from '@/lib/auth';

export async function GET(req: NextRequest) {
  const { error } = await getAuthUser(req);
  if (error) return NextResponse.json({ error }, { status: 401 });

  try {
    const records = await prisma.outdHdr.findMany({
      where: { OhdRecState: 1 },
      include: {
        Patient: true,
        Doctor: true,
        OutdBill: {
          include: { Service: true }
        },
        OutdBlPymtHdr: true
      },
      orderBy: { OhdDate: 'desc' },
      take: 100
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
    const body = await req.json();
    const { 
      OhdCode: _id,
      OutdBill: details,
      OutdBlPymtHdr: payments,
      OutdBlDctDtl: doctorShares,
      ...headerData 
    } = body;

    const result = await prisma.$transaction(async (tx: any) => {
      // 1. Calculate Voucher No
      if (!headerData.OhdVchNo) {
        const maxVch = await tx.outdHdr.aggregate({
          _max: { OhdVchNo: true }
        });
        headerData.OhdVchNo = (maxVch._max.OhdVchNo || 0) + 1;
      }

      // 2. Parse Date
      headerData.OhdDate = new Date(headerData.OhdDate || new Date());

      // 3. Create Billing Header with related records
      const bill = await tx.outdHdr.create({
        data: {
          ...headerData,
          OutdBill: {
            create: details ? details.map((d: any) => ({
              ObdSrvCode: d.ObdSrvCode,
              ObdUnit: d.ObdUnit || 1,
              ObdRate: d.ObdRate || 0,
              ObdAmtBefDisc: d.ObdAmtBefDisc || 0,
              ObdDiscPer: d.ObdDiscPer || 0,
              ObdDiscAmt: d.ObdDiscAmt || 0,
              ObdAmtAftDisc: d.ObdAmtAftDisc || 0,
              ObdRecState: 1
            })) : []
          },
          OutdBlDctDtl: doctorShares && doctorShares.length > 0 ? {
            create: doctorShares.map((ds: any) => ({
              OddDctCode: ds.OddDctCode,
              OddSharePer: ds.OddSharePer || 0,
              OddShareAmt: ds.OddShareAmt || 0,
              OddRecState: 1
            }))
          } : undefined,
          OutdBlPymtHdr: payments && payments.length > 0 ? {
            create: payments.map((p: any) => ({
              ObpDate: new Date(p.ObpDate || new Date()),
              ObpAmt: p.ObpAmt || 0,
              ObpRecState: 1
            }))
          } : undefined
        },
        include: {
          OutdBill: true,
          OutdBlPymtHdr: true
        }
      });

      return bill;
    });

    return NextResponse.json(result, { status: 201 });
  } catch (err: any) {
    console.error('Billing Save Error:', err);
    return NextResponse.json({ error: err.message }, { status: 400 });
  }
}
