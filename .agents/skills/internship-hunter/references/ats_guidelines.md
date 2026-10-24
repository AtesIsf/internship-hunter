# ATS (Applicant Tracking System) Formatting & Parsing Guidelines

Modern Applicant Tracking Systems (e.g. Greenhouse, Lever, Workday, Taleo, iCIMS) parse candidate resumes into structured relational databases before human recruiters ever see them. Follow these strict rules to ensure 100% parsing fidelity:

---

## 1. Layout & Column Hierarchy
- **Single-Column Only**: Multi-column layouts, sidebars, and callout boxes often cause parsers to read across columns horizontally, scrambling contact details and work experiences into gibberish.
- **No Tables for Text Flow**: Use clean grids solely for key-value headers (like Skills or Job Title/Dates), never for nesting whole paragraphs.
- **Header Structure**: Standardized section titles must be used:
  - `Education`
  - `Technical Skills`
  - `Professional Experience` or `Work Experience`
  - `Key Projects` or `Technical Projects`

## 2. Text Streams & Fonts
- **Standard Unicode Fonts**: Use system-standard sans-serif or clean serif typography (Arial, Helvetica, Liberation Sans, Roboto).
- **No Text in Images or Canvases**: All text must be selectable and extractable via standard PDF text extractors (`pdftotext`, `pdfplumber`).
- **Standard Bullet Characters**: Use standard bullet points (`•`, `-`), avoid complex graphical glyphs, stars, or emojis.

## 3. Date & Degree Formats
- Always write dates with both month and year (e.g. `May 2024 – Aug 2024` or `05/2024 – 08/2024`).
- Unambiguously state graduation date (e.g., `Expected May 2026`).
- Standardize degree titles: `B.S. in Computer Science`, `M.S. in Software Engineering`.

## 4. Keyword Placement
- Primary technical keywords should appear in both the **Technical Skills** section and within the context of bullet points in **Experience** and **Projects** to demonstrate real application.
