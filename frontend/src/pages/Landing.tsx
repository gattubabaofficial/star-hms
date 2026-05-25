import { Link } from 'react-router-dom';
import { HeartPulse, Stethoscope, Activity, ShieldCheck, ChevronRight, PhoneCall } from 'lucide-react';

export function Landing() {
  return (
    <div className="min-h-screen bg-[#F8F7F4] text-[#2F3542] font-sans selection:bg-medical-mutedblue selection:text-white">
      {/* Navigation */}
      <nav className="fixed w-full z-50 transition-all duration-300 bg-white/80 backdrop-blur-md border-b border-gray-100">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="flex justify-between items-center h-20">
            <div className="flex items-center gap-3">
              <div className="w-12 h-12 bg-gradient-to-br from-medical-mutedblue to-[#3a6bbd] rounded-2xl flex items-center justify-center shadow-lg shadow-blue-200">
                <HeartPulse className="w-7 h-7 text-white" />
              </div>
              <span className="text-2xl font-bold bg-clip-text text-transparent bg-gradient-to-r from-gray-800 to-gray-600">
                Star Hospital
              </span>
            </div>
            <div className="flex items-center gap-6">
              <div className="hidden md:flex items-center gap-2 text-gray-500 font-medium">
                <PhoneCall className="w-5 h-5 text-medical-softgreen" />
                <span>Emergency: 108</span>
              </div>
              <Link 
                to="/login"
                className="group relative inline-flex items-center justify-center px-6 py-2.5 text-sm font-semibold text-white transition-all duration-200 bg-medical-mutedblue border border-transparent rounded-full hover:bg-[#4a7ac8] focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-medical-mutedblue shadow-md hover:shadow-lg"
              >
                Staff Portal
                <ChevronRight className="w-4 h-4 ml-1 group-hover:translate-x-1 transition-transform" />
              </Link>
            </div>
          </div>
        </div>
      </nav>

      {/* Hero Section */}
      <div className="relative pt-32 pb-20 sm:pt-40 sm:pb-24 overflow-hidden">
        {/* Abstract Background Elements */}
        <div className="absolute top-0 right-0 -translate-y-12 translate-x-1/3">
          <div className="w-96 h-96 bg-blue-100/50 rounded-full blur-3xl"></div>
        </div>
        <div className="absolute bottom-0 left-0 translate-y-1/3 -translate-x-1/3">
          <div className="w-96 h-96 bg-green-100/50 rounded-full blur-3xl"></div>
        </div>

        <div className="relative max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 text-center">
          <div className="inline-flex items-center gap-2 px-4 py-2 rounded-full bg-blue-50 border border-blue-100 text-medical-mutedblue text-sm font-medium mb-8 animate-fade-in-up">
            <span className="relative flex h-2 w-2">
              <span className="animate-ping absolute inline-flex h-full w-full rounded-full bg-blue-400 opacity-75"></span>
              <span className="relative inline-flex rounded-full h-2 w-2 bg-blue-500"></span>
            </span>
            HMS System V2.0 Online
          </div>
          
          <h1 className="text-5xl md:text-7xl font-extrabold tracking-tight mb-8 text-gray-900 animate-fade-in-up" style={{ animationDelay: '0.1s' }}>
            Next-Generation <br />
            <span className="text-transparent bg-clip-text bg-gradient-to-r from-medical-mutedblue to-medical-softgreen">
              Healthcare Management
            </span>
          </h1>
          
          <p className="mt-4 max-w-2xl mx-auto text-xl text-gray-500 animate-fade-in-up" style={{ animationDelay: '0.2s' }}>
            Empowering medical professionals with seamless digital workflows, from outpatient registrations to deep master data analytics.
          </p>

          <div className="mt-10 flex justify-center gap-4 animate-fade-in-up" style={{ animationDelay: '0.3s' }}>
            <Link 
              to="/login"
              className="px-8 py-4 rounded-full bg-gray-900 text-white font-semibold hover:bg-gray-800 transition-all shadow-xl hover:shadow-2xl hover:-translate-y-1 flex items-center gap-2"
            >
              Enter System <ChevronRight className="w-5 h-5" />
            </Link>
          </div>
        </div>
      </div>

      {/* Features Grid */}
      <div className="py-24 bg-white relative">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="text-center mb-16">
            <h2 className="text-3xl font-bold text-gray-900">Integrated Modules</h2>
            <p className="mt-4 text-gray-500 max-w-2xl mx-auto">Everything you need to run a modern hospital efficiently.</p>
          </div>

          <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
            {/* Feature 1 */}
            <div className="group relative p-8 bg-white border border-gray-100 rounded-3xl shadow-sm hover:shadow-xl transition-all duration-300 hover:-translate-y-1 overflow-hidden">
              <div className="absolute top-0 right-0 p-8 opacity-5 group-hover:opacity-10 transition-opacity">
                <Stethoscope className="w-24 h-24" />
              </div>
              <div className="w-14 h-14 bg-blue-50 text-medical-mutedblue rounded-2xl flex items-center justify-center mb-6 group-hover:scale-110 transition-transform">
                <Stethoscope className="w-7 h-7" />
              </div>
              <h3 className="text-xl font-bold text-gray-900 mb-3">OPD & IPD</h3>
              <p className="text-gray-500 leading-relaxed">
                Streamlined outpatient and inpatient registrations with real-time bed status and automated billing cycles.
              </p>
            </div>

            {/* Feature 2 */}
            <div className="group relative p-8 bg-white border border-gray-100 rounded-3xl shadow-sm hover:shadow-xl transition-all duration-300 hover:-translate-y-1 overflow-hidden">
              <div className="absolute top-0 right-0 p-8 opacity-5 group-hover:opacity-10 transition-opacity">
                <Activity className="w-24 h-24" />
              </div>
              <div className="w-14 h-14 bg-green-50 text-medical-softgreen rounded-2xl flex items-center justify-center mb-6 group-hover:scale-110 transition-transform">
                <Activity className="w-7 h-7" />
              </div>
              <h3 className="text-xl font-bold text-gray-900 mb-3">Diagnostic Labs</h3>
              <p className="text-gray-500 leading-relaxed">
                Integrated laboratory management with quick receipt generation and precise sample tracking algorithms.
              </p>
            </div>

            {/* Feature 3 */}
            <div className="group relative p-8 bg-white border border-gray-100 rounded-3xl shadow-sm hover:shadow-xl transition-all duration-300 hover:-translate-y-1 overflow-hidden">
              <div className="absolute top-0 right-0 p-8 opacity-5 group-hover:opacity-10 transition-opacity">
                <ShieldCheck className="w-24 h-24" />
              </div>
              <div className="w-14 h-14 bg-purple-50 text-purple-600 rounded-2xl flex items-center justify-center mb-6 group-hover:scale-110 transition-transform">
                <ShieldCheck className="w-7 h-7" />
              </div>
              <h3 className="text-xl font-bold text-gray-900 mb-3">Master Configuration</h3>
              <p className="text-gray-500 leading-relaxed">
                Robust role-based access control and extensive master tables to customize every aspect of the hospital workflow.
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
