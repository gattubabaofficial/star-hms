import { NextResponse } from 'next/server';
import { prisma } from '@/lib/prisma';

export async function GET() {
  try {
    const companies = await prisma.company.findMany({
      select: { CmpCode: true, CmpName: true },
      //where: { CmpRecState: 1 } // Adding this back if needed, but original VB6 schema shows boolean/int depending on mapping
    });
    return NextResponse.json(companies);
  } catch (error) {
    console.error('Company fetch error:', error);
    return NextResponse.json({ error: 'Server error' }, { status: 500 });
  }
}
