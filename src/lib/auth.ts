import bcrypt from 'bcryptjs';
import jwt from 'jsonwebtoken';
import { NextRequest } from 'next/server';
import { prisma } from './prisma';

const JWT_SECRET = process.env.JWT_SECRET || 'hms-secret-key-change-in-production';
const JWT_EXPIRES_IN = process.env.JWT_EXPIRES_IN || '24h';

export const hashPassword = async (password: string): Promise<string> => {
  const salt = await bcrypt.genSalt(10);
  return bcrypt.hash(password, salt);
};

export const comparePassword = async (password: string, hash: string): Promise<boolean> => {
  return bcrypt.compare(password, hash);
};

export const signToken = (payload: any): string => {
  return jwt.sign(payload, JWT_SECRET, {
    expiresIn: JWT_EXPIRES_IN as jwt.SignOptions['expiresIn'],
  });
};

export const verifyToken = (token: string): any => {
  return jwt.verify(token, JWT_SECRET);
};

export const getAuthUser = async (req: NextRequest) => {
  let token;

  const authHeader = req.headers.get('authorization');
  if (authHeader && authHeader.startsWith('Bearer')) {
    token = authHeader.split(' ')[1];
  }

  if (!token) {
    return { error: 'Not authorized, no token', user: null, companyCode: null };
  }

  try {
    const decoded = verifyToken(token);
    
    const user = await prisma.userMast.findUnique({
      where: { UsrCode: decoded.UsrCode },
      include: { 
        Role: {
          include: {
            UserRightMst: true
          }
        }
      }
    });

    if (!user) {
      return { error: 'Not authorized, user not found', user: null, companyCode: null };
    }

    return { error: null, user, companyCode: decoded.CmpCode };
  } catch (error) {
    console.error('Auth error:', error);
    return { error: 'Not authorized, token failed', user: null, companyCode: null };
  }
};

export const hasRight = (user: any, optionName: string, permission: 'Add' | 'Edit' | 'Delete' | 'View') => {
  if (!user || !user.Role) {
    return false;
  }

  const right = user.Role.UserRightMst.find(
    (r: any) => r.UhtSecuOptName === optionName
  );

  if (!right) {
    return false;
  }

  const fieldMap = {
    Add: 'UhtCanAdd',
    Edit: 'UhtCanEdit',
    Delete: 'UhtCanDelete',
    View: 'UhtCanView'
  };

  return right[fieldMap[permission]] === true;
};
