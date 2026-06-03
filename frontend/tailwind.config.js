/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {
      colors: {
        'medical-bg': '#F4F6F8',       /* Soft professional gray background */
        'medical-surface': '#FFFFFF',  /* Pure white cards/panels */
        'medical-primary': '#2563EB',  /* Crisp standard blue, not neon */
        'medical-secondary': '#475569',/* Professional slate */
        'medical-success': '#059669',  /* Crisp standard green */
        'medical-border': '#CBD5E1',   /* Visible slate border */
        'medical-text': '#1E293B',     /* Dark slate for text */
      },
      fontFamily: {
        sans: ['Inter', 'Roboto', 'sans-serif'],
      },
    },
  },
  plugins: [],
}
