/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {
      colors: {
        'medical-offwhite': '#F8F7F4',
        'medical-lightgray': '#E5E7EB',
        'medical-mutedblue': '#5B8DEF',
        'medical-softgreen': '#6FAF8F',
        'medical-text': '#2F3542',
      },
      fontFamily: {
        sans: ['Inter', 'Roboto', 'sans-serif'],
      },
    },
  },
  plugins: [],
}
