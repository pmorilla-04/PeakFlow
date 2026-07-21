# 🎨 PeakFlow Design System

This document defines the visual language of PeakFlow and ensures consistency across the entire application.

---

# Typography

## Font Family

```css
--font-family: "Inter", sans-serif;
```

Inter is used across the entire application for its excellent readability and clean appearance.

---

## Font Sizes

| Variable | Size | Usage |
|----------|------|-------|
| --text-xs | 12px | Badges, labels, helper text |
| --text-sm | 14px | Secondary text |
| --text-base | 16px | Default body text |
| --text-lg | 18px | Card titles |
| --text-xl | 20px | Section titles |
| --text-2xl | 24px | Page titles |
| --text-3xl | 30px | Large headings |
| --text-4xl | 36px | Hero sections |

---

## Font Weights

| Variable | Weight |
|----------|--------|
| --font-light | 300 |
| --font-regular | 400 |
| --font-medium | 500 |
| --font-semibold | 600 |
| --font-bold | 700 |

---

# Colors

## Brand Colors

These define the PeakFlow identity.

| Variable | Color | Usage |
|----------|-------|-------|
| --color-primary | Blue | Primary buttons, links, active states |
| --color-secondary | Green | Positive metrics |
| --color-accent | Orange | Highlights and premium actions |

---

## Semantic Colors

Used to communicate meaning.

| Variable | Usage |
|----------|-------|
| --color-success | Success |
| --color-warning | Warning |
| --color-danger | Errors |
| --color-info | Information |
| --color-ai | AI Features |

---

## State Colors

Used for hover and subtle backgrounds.

| Variable | Usage |
|----------|-------|
| --color-primary-soft | Very light blue background |
| --color-primary-light | Selected elements |
| --color-primary-hover | Hover state |
| --color-surface-muted | Alternate surfaces |

---

## Label Colors

Used in badges.

### Success

- Available
- Completed

### Recommended

- Recommended

### Premium

- Premium features

### AI

- AI Coach
- AI Reports

---

## Event Priorities

Three priority levels are supported.

### Priority A

Main season objective.

Color:
- Red

### Priority B

Important event.

Color:
- Blue

### Priority C

Secondary event.

Color:
- Green

---

# Themes

PeakFlow supports:

- Light Theme
- Dark Theme

Both themes use identical spacing, typography and component sizes.

Only colors change.

---

# Spacing

PeakFlow uses an 8px spacing system.

| Variable | Value |
|----------|-------|
| --space-1 | 4px |
| --space-2 | 8px |
| --space-3 | 12px |
| --space-4 | 16px |
| --space-5 | 20px |
| --space-6 | 24px |
| --space-8 | 32px |
| --space-10 | 40px |
| --space-12 | 48px |
| --space-16 | 64px |

---

# Border Radius

| Variable | Value |
|----------|-------|
| --radius-sm | 8px |
| --radius-md | 12px |
| --radius-lg | 16px |
| --radius-xl | 20px |
| --radius-full | 999px |

---

# Shadows

| Variable | Usage |
|----------|-------|
| --shadow-sm | Cards |
| --shadow-md | Hovered cards |
| --shadow-lg | Modals |

---

# Transitions

PeakFlow uses smooth transitions.

```css
--transition-fast
--transition-normal
```

---

# Layout

| Variable | Usage |
|----------|-------|
| --header-height | Main header |
| --sidebar-width | Sidebar |
| --container-padding | Page spacing |
| --card-padding | Card spacing |

---

# Z-index

| Variable | Usage |
|----------|-------|
| --z-dropdown | Dropdowns |
| --z-sticky | Sticky elements |
| --z-modal | Modals |
| --z-toast | Notifications |

---

# Component Guidelines

## Cards

- White surface
- Rounded corners
- Small shadow
- 24px padding

---

## Buttons

Primary
- Blue background

Secondary
- Transparent
- Border

Icon Button
- Square
- Rounded
- Hover background

---

## Inputs

- 1px border
- Large radius
- Focus with primary color

---

## Badges

Rounded pills.

Examples:

- Available
- Premium
- AI
- A Race
- B Race
- C Race

---

## Icons

PeakFlow uses **Lucide Icons** exclusively.

Icons should be:

- 20px by default
- 18px inside badges
- 24px for KPI cards

---

# Design Principles

PeakFlow follows these principles:

- Clean
- Modern
- Minimal
- Fast to scan
- Athlete focused
- Consistent
- Responsive
- Accessible

---

# Naming Convention

Variables

```css
--color-*
--space-*
--radius-*
--shadow-*
```

CSS Classes

```css
.card
.card-header
.card-body

.primary-btn
.secondary-btn

.kpi-card

.report-card

.event-card

.activity-card
```

---

# Future

Future additions:

- Component Library
- Responsive Breakpoints
- Animations
- Charts
- Forms
- Modals
- Notifications
- Tables
- Calendar Components