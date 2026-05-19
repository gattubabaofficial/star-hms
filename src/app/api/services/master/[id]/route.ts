import { NextRequest, NextResponse } from 'next/server';
import { prisma } from '@/lib/prisma';
import { getAuthUser } from '@/lib/auth';

export async function PUT(req: NextRequest, { params }: { params: Promise<{ id: string }> }) {
  const { error } = await getAuthUser(req);
  if (error) return NextResponse.json({ error }, { status: 401 });
  const { id: paramId } = await params;

  try {
    const body = await req.json();
    const { SrvCode: _id, ...data } = body;
    
    if ('servMast' === 'patMast') {
        if (data.PttDob) data.PttDob = new Date(data.PttDob);
        if (data.PttAgeAsOnDt) data.PttAgeAsOnDt = new Date(data.PttAgeAsOnDt);
    }
    
    const record = await prisma.servMast.update({
      where: { SrvCode: parseInt(paramId) },
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
    await prisma.servMast.update({
      where: { SrvCode: parseInt(paramId) },
      data: { SrvRecState: 0 }
    });
    return NextResponse.json({ message: 'Deleted logically' });
  } catch (err: any) {
    return NextResponse.json({ error: err.message }, { status: 400 });
  }
}
