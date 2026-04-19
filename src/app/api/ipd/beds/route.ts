import { NextRequest, NextResponse } from 'next/server';
import { prisma } from '@/lib/prisma';
import { getAuthUser } from '@/lib/auth';

export async function GET(req: NextRequest) {
  const { error } = await getAuthUser(req);
  if (error) return NextResponse.json({ error }, { status: 401 });

  try {
    const records = await prisma.bedMast.findMany({
      where: { BdmRecState: 1 },
      include: { Ward: true, Floor: true, Service: true, IndrHdr: { where: { IhdStatus: 'Admitted' }, include: { Patient: true } } },
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
    const { BdmCode: _id, ...data } = body;
    const record = await prisma.bedMast.create({ data });
    return NextResponse.json(record, { status: 201 });
  } catch (err: any) {
    return NextResponse.json({ error: err.message }, { status: 400 });
  }
}
