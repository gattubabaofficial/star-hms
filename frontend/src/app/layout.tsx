import type { Metadata } from "next";
import "./globals.css";

export const metadata: Metadata = {
  title: "Star HMS - Hospital Management System",
  description: "A modern responsive Hospital Management System migration",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en">
      <body>
        {children}
      </body>
    </html>
  );
}
