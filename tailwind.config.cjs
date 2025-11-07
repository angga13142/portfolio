/**** Tailwind Config - Dark-First Design System ****/
module.exports = {
  darkMode: 'class',
  content: [
    './src/**/*.{astro,html,js,jsx,tsx,mdx}',
    './public/**/*.html'
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter', 'Manrope', 'sans-serif']
      },
      colors: {
        // Dark backgrounds (primary palette)
        dark: {
          900: '#0a0a0a',  // Pure black (main bg)
          800: '#121212',  // Dark cards
          700: '#1a1a1a',  // Card hover state
          600: '#242424',  // Subtle borders
        },
        // Accent colors (vibrant on dark)
        primary: {
          400: '#60a5fa',  // Light blue for text
          500: '#3b82f6',  // Main blue accent
          600: '#2563eb',  // Deep blue hover
        },
        accent: {
          purple: '#a855f7',
          pink: '#ec4899',
          cyan: '#06b6d4',
          DEFAULT: '#3b82f6'
        },
        // Text optimized for dark backgrounds
        gray: {
          50: '#fafafa',   // Headings
          100: '#f5f5f5',
          200: '#e5e5e5',
          300: '#d1d5db',  // Body text
          400: '#9ca3af',  // Muted text
          500: '#6b7280',
          600: '#4b5563',  // Very muted
          700: '#374151',
          800: '#1f2937',
          900: '#111827',
        }
      },
      boxShadow: {
        'card': '0 4px 24px rgba(0, 0, 0, 0.4)',
        'card-hover': '0 8px 32px rgba(0, 0, 0, 0.6)',
        'glow-blue': '0 0 40px rgba(59, 130, 246, 0.3)',
        'glow-purple': '0 0 40px rgba(168, 85, 247, 0.3)',
      },
      backgroundImage: {
        'gradient-primary': 'linear-gradient(135deg, #3b82f6 0%, #a855f7 100%)',
        'gradient-accent': 'linear-gradient(135deg, #06b6d4 0%, #ec4899 100%)',
      }
    }
  },
  plugins: []
};
