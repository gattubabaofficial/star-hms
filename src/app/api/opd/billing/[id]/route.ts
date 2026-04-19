import { NextRequest, NextResponse } from 'next/server';
import { prisma } from '@/lib/prisma';
import { getAuthUser } from '@/lib/auth';

export async function DELETE(req: NextRequest, { params }: { params: Promise<{ id: string }> }) {
  const { error } = await getAuthUser(req);
  if (error) return NextResponse.json({ error }, { status: 401 });
  const { id: paramId } = await params;

  try {
    await prisma.outdHdr.update({
      where: { OhdCode: parseInt(paramId) },
      data: { OhdRecState: 0 }
    });
    return NextResponse.json({ message: 'Bill voided successfully' });
  } catch (err: any) {
    return NextResponse.json({ error: err.message }, { status: 400 });
  }
}
