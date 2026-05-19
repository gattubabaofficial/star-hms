import { NextRequest, NextResponse } from 'next/server';
import { prisma } from '@/lib/prisma';
import { comparePassword, signToken } from '@/lib/auth';

export async function POST(req: NextRequest) {
  try {
    const { username, password, companyCode } = await req.json();

    if (!username || !password || !companyCode) {
      return NextResponse.json({ error: 'Please provide username, password, and company code' }, { status: 400 });
    }

    const user = await prisma.userMast.findUnique({
      where: { UsrCode: parseInt(username) || 0 }, 
    });

    // Fallback: search by UsrName if UsrCode search fails or username is string
    const userByName = !user ? await prisma.userMast.findFirst({
        where: { UsrName: username }
    }) : user;

    if (!userByName || !(await comparePassword(password, userByName.UsrPwd))) {
      return NextResponse.json({ error: 'Invalid credentials' }, { status: 401 });
    }

    const company = await prisma.company.findUnique({
      where: { CmpCode: parseInt(companyCode) }
    });

    if (!company) {
      return NextResponse.json({ error: 'Invalid or inactive company selection' }, { status: 401 });
    }

    const token = signToken({ 
        UsrCode: userByName.UsrCode, 
        UrlCode: userByName.UsrUrlCode, 
        CmpCode: company.CmpCode 
    });

    return NextResponse.json({
      token,
      user: {
        username: userByName.UsrName,
        code: userByName.UsrCode,
        role: userByName.UsrUrlCode
      },
      company: {
        code: company.CmpCode,
        name: company.CmpName
      }
    });
  } catch (error) {
    console.error('Login error:', error);
    return NextResponse.json({ error: 'Server error' }, { status: 500 });
  }
}
