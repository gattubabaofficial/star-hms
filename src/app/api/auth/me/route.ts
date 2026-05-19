import { NextRequest, NextResponse } from 'next/server';
import { getAuthUser } from '@/lib/auth';

export async function GET(req: NextRequest) {
  const { error, user, companyCode } = await getAuthUser(req);

  if (error) {
    return NextResponse.json({ error }, { status: 401 });
  }

  return NextResponse.json({ user, companyCode });
}
