# File Reference - Portfolio Project

Quick lookup guide for portfolio files and their purposes.

---

## 📁 Core Files

### Configuration Files

**package.json** - Project dependencies & scripts
- Astro 4.0, React 18.2, Tailwind 3.4, Framer Motion 11.0
- Vitest 4.0, Testing Library 16.3
- Scripts: dev, build, preview, test

**astro.config.mjs** - Astro configuration
- React integration
- Tailwind integration
- Output: static (SSG)

**tailwind.config.cjs** - Tailwind customization
- Dark-first color palette
- Custom shadows & gradients
- Typography settings

**vitest.config.js** - Test configuration
- JSDOM environment
- Test globals enabled
- React Testing Library setup

---

## 🧩 Components (`src/components/`)

### React Components (.jsx)

**ContactForm.jsx** - Contact form with validation
- Client-side validation
- Honeypot spam protection
- Formspree integration ready

**CustomCursor.jsx** - Custom cursor + trail effect
- Blue outline cursor (20px)
- Trail effect (6px dot)
- Mobile detection (disabled on touch)
- Hover expansion (1.5x scale)

**ProjectCard.jsx** - Project card with hover effects
- Image handling
- Tag display
- Hover scale + image zoom
- Link to project detail

**ProjectFilter.jsx** - Category filtering
- All/Premium/VCC filters
- Active state styling
- Smooth transitions

**StatsCounter.jsx** (NEW!) - Animated statistics
- IntersectionObserver trigger
- Count-up animation
- Glassmorphism styling
- Gradient glow on hover

**ThemeToggle.jsx** - Dark/light toggle (legacy, not used)

### Astro Components (.astro)

**Header.astro** - Navigation header
- Dark backdrop with blur
- Responsive menu
- Active page indicator

---

## 📄 Pages (`src/pages/`)

### Main Pages

**index.astro** - Homepage
- Hero with typewriter effect
- Animated stats counter
- Featured projects grid
- CTA section

**about.astro** - About page
- Biography section
- Tech stack grid
- Achievement highlights
- Currently learning section

**contact.astro** - Contact page
- Contact form integration
- Contact info cards
- Social links

**projects.astro** - Projects listing
- Category filtering
- Project grid
- Search/filter functionality

**projects/[slug].astro** - Project detail
- Dynamic routing
- Full project details
- Tech stack
- Challenges & impact sections

---

## 🎨 Styles (`src/styles/`)

**global.css** (872 lines) - All global styles
- Tailwind imports
- CSS custom properties
- Base styles
- Component styles (.stat-card, .dark-card, etc.)
- Animation keyframes
- Micro-interactions
- Phase 8 features (cursor, parallax)
- Homepage dynamic (typewriter, stats)
- Media queries
- Reduced motion overrides

**Key Classes:**
- `.hero-gradient-bg` - Animated gradient background
- `.stat-card` - Glassmorphism stats card
- `.glow-on-hover` - Gradient glow effect
- `.gradient-text` - Animated gradient text
- `.magnetic-button` - Magnetic hover effect
- `.pulse-glow` - Pulsing glow animation

---

## 📊 Data (`src/data/`)

**projects.json** - Project data
- 2 sample projects (WhatsApp chatbot, CryptoStock)
- Structure: id, title, description, image, tags, features, tech, challenges, impact

---

## 🧪 Tests (`tests/`)

**Component Tests:**
- ContactForm.test.jsx
- ProjectCard.test.jsx
- (Add more as needed)

**Test Framework:** Vitest + React Testing Library
- Total: 34 tests
- Passing: 100%

---

## 📐 Layouts (`src/layouts/`)

**BaseLayout.astro** - Main layout template
- Global gradient background
- Noise texture overlay
- Meta tags (SEO)
- JSON-LD schema
- View Transitions
- Custom cursor integration

---

## 🌐 Public Assets (`public/`)

**Images:**
- favicon.svg - Site favicon
- og-default.png - Default OG image

**Documents:**
- resume.pdf - Downloadable resume

---

## 📚 Documentation (`docs/`)

- PORTFOLIO_COMPLETE_GUIDE.md - User-facing documentation
- DEV_ROADMAP.md - Development roadmap
- (Other planning docs)

---

## 🎯 Quick Lookup

**Need to modify:**

- **Homepage hero** → `src/pages/index.astro`
- **Navigation** → `src/components/Header.astro`
- **Stats section** → `src/components/StatsCounter.jsx`
- **Project list** → `src/data/projects.json`
- **Styles** → `src/styles/global.css`
- **SEO** → `src/layouts/BaseLayout.astro`
- **Contact form** → `src/components/ContactForm.jsx`

**Common files:**

- **Colors** → `tailwind.config.cjs` + `src/styles/global.css` (CSS variables)
- **Fonts** → `src/layouts/BaseLayout.astro` (Google Fonts)
- **Tests** → `tests/components/`

---

**Last Updated:** November 7, 2025, 19:40  
**Total Files:** ~50 files (src + tests + docs)
