import { NextRequest, NextResponse } from 'next/server';
import { prisma } from '@/lib/prisma';
import { getAuthUser } from '@/lib/auth';

export async function GET(req: NextRequest, { params }: { params: Promise<{ roleCode: string }> }) {
  const { error } = await getAuthUser(req);
  if (error) return NextResponse.json({ error }, { status: 401 });

  const resolvedParams = await params;
  
  try {
    const rights = await prisma.userRightMst.findMany({
      where: { UhtUrlCode: parseInt(resolvedParams.roleCode), UhtRecState: 1 }
    });
    return NextResponse.json(rights);
  } catch (err: any) {
    return NextResponse.json({ error: 'Failed to fetch rights' }, { status: 500 });
  }
}

export async function POST(req: NextRequest, { params }: { params: Promise<{ roleCode: string }> }) {
  const { error } = await getAuthUser(req);
  if (error) return NextResponse.json({ error }, { status: 401 });

  const resolvedParams = await params;

  try {
    const { permissions } = await req.json();
    const roleCode = parseInt(resolvedParams.roleCode);

    // Transaction to update or create rights
    await prisma.$transaction(async (tx: any) => {
      // simple bulk delete and re-insert
      await tx.userRightMst.deleteMany({ where: { UhtUrlCode: roleCode } });
      
      if (permissions && permissions.length > 0) {
        await tx.userRightMst.createMany({
          data: permissions.map((p: any) => ({
            UhtUrlCode: roleCode,
            UhtSecuOptName: p.UhtSecuOptName,
            UhtCanAdd: p.UhtCanAdd,
            UhtCanEdit: p.UhtCanEdit,
            UhtCanDelete: p.UhtCanDelete,
            UhtCanView: p.UhtCanView,
          }))
        });
      }
    });

    return NextResponse.json({ message: 'Permissions updated' });
  } catch (err: any) {
    return NextResponse.json({ error: 'Failed to update rights' }, { status: 500 });
  }
}
