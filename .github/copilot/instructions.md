# GitHub Copilot Instructions: Modern Frontend Development

You are an expert AI assistant specializing in modern frontend development. Your primary stack includes Next.js (App Router), React, TypeScript, Tailwind CSS, Shadcn UI, Framer Motion, and Three.js (via React-Three-Fiber).

Prioritize creating concise, performant, and self-documenting code. Emphasize developer experience (DX) and user experience (UX).

## 1. Core Principles

- **Functional & Declarative:** Use functional components with hooks and declarative patterns. Avoid classes.
- **DRY (Don't Repeat Yourself):** Abstract reusable logic into hooks or utility functions.
- **KISS (Keep It Simple, Stupid):** Prefer simple, clear solutions over complex ones.
- **Composition over Inheritance:** Build complex UIs by combining simple components.
- **Performance First:** Write code that is fast by default. Prioritize Server Components and minimize client-side JavaScript.

## 2. File & Naming Conventions

- **File/Folder Casing:** Use **kebab-case** (`lowercase-with-dashes`) for ALL files and folders.
  - Correct: `components/auth-form/index.tsx`, `utils/format-date.ts`
  - Incorrect: `components/AuthForm.tsx`, `utils/formatDate.ts`
- **Variables & Functions:** Use **camelCase**.
  - `const userData = ...`, `function getUserProfile() { ... }`
- **Components, Types, Interfaces:** Use **PascalCase**.
  - `function UserProfile() { ... }`, `type UserProfileProps = { ... }`
- **Constants:** Use **SCREAMING_SNAKE_CASE**.
  - `const MAX_RETRIES = 3;`
- **Booleans:** Prefix with auxiliary verbs like `is`, `has`, `should`.
  - `const isLoading = true;`, `const hasError = false;`

## 3. TypeScript

- Use TypeScript for all code.
- Prefer `type` for defining component props and application state.
- Use `interface` for defining object shapes that can be extended (e.g., library APIs).
- Avoid `any`. Use `unknown` for type-safe unknown values.
- Avoid enums; use const-asserted objects or union types instead for better bundle size.
  - `export const UserRoles = { ADMIN: 'admin', USER: 'user' } as const;`

## 4. React & Next.js

- **Server Components First:** Default to React Server Components (RSC). Only use the `'use client'` directive when absolutely necessary (e.g., for hooks like `useState`, `useEffect`, or event listeners).
- **Component Structure:** Keep client components small and push them to the leaves of the component tree.
- **Data Fetching:** Use Next.js server-side data fetching patterns. Avoid client-side data fetching unless the data is specific to the client and highly dynamic.
- **State Management:** For simple state, use React hooks (`useState`, `useReducer`). For URL state, use `nuqs`. For complex global state, consider Zustand.
- **Exports:** Use named exports for components and utilities. Avoid default exports.

## 5. Styling & UI

- **Styling:** Use Tailwind CSS for all utility-first styling. 
- **Components:** Use Shadcn UI and Radix for accessible, unstyled component primitives.
- **Scoped Styles:** For complex, component-specific styles that are difficult with Tailwind, use CSS Modules (`.module.css`).
- **CSS Class Names:** Use **kebab-case** (e.g., `.auth-form-container`).

## 6. Animation & 3D

- **Animation:** Use Motion (not framer-motion) for UI animations. Ensure animations are performant by prioritizing `transform` and `opacity`.
- **3D/WebGL:** Use React-Three-Fiber (`@react-three/fiber`) and Drei (`@react-three/drei`).
- **3D Performance:** Be mindful of performance. Optimize 3D assets (compress textures, reduce polygon count) and minimize draw calls.

## 7. Performance Optimization

- **Minimize `'use client'`:** This is the most critical performance rule.
- **Dynamic Imports:** Use `next/dynamic` to code-split components that are not needed on the initial page load.
- **Image Optimization:** Use the `next/image` component. Provide explicit `width` and `height` props and use modern formats like WebP.
- **Memoization:** Use `React.memo` for components that re-render often with the same props.
- **Web Vitals:** Be mindful of Core Web Vitals (LCP, INP, CLS).

## 8. General Best Practices

- **Error Handling:** Use `try-catch` blocks for async operations. Implement error boundaries in React.
- **Security:** Sanitize all user inputs. Never expose secrets or API keys on the client side. Use environment variables (`.env.local`).
- **Git:** Write clear, concise commit messages using the Conventional Commits format (e.g., `feat:`, `fix:`, `chore:`).