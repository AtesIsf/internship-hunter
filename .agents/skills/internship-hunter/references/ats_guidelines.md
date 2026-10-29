# ATS (Applicant Tracking System) Industry Standards & Parsing Guidelines

Modern Applicant Tracking Systems (e.g. Greenhouse, Lever, Workday, Taleo, iCIMS, Ashby) parse applicant resumes into plain-text streams and structured database records before human recruiters ever see them. Based on standards from technical recruiting benchmarks and the **r/EngineeringResumes** community, follow these strict rules to ensure 100% parsing fidelity:

---

## 1. Single-Column Layout & Structural Hierarchy
- **Strictly Single-Column**: Multi-column layouts, sidebars, floating text boxes, and multi-column tables are the #1 cause of ATS parsing failures. They cause parsers to read horizontally across disparate columns, merging job titles, dates, and unrelated bullet points into scrambled text.
- **No Tables for Text Paragraphs**: Use clean, native single-column text flow. Grid layouts should only be used for inline key-value pairs (e.g., Jake's Resume subheadings or skill lists).
- **Standardized Section Titles**: Only use standard, globally recognized section headings:
  - `Education`
  - `Experience` or `Work Experience`
  - `Projects` or `Technical Projects`
  - `Technical Skills`
  *(Avoid creative titles like "Where I've Been", "My Journey", or "Technical Capabilities" which confuse parser heuristics).*

## 2. Typography, Colors & Monochromatic Design
- **Monochromatic Text (Black on White)**: Never use colored headers (blue, red, teal) or low-contrast gray text. Gray text frequently fails OCR/contrast checks and colored headings look unprofessional.
- **System Standard Unicode Serif / Sans-Serif**:
  - Preferred: Jake's standard serif (`New Computer Modern`, `Computer Modern`, `Times New Roman`, `Liberation Serif`).
  - Avoid non-standard decorative fonts or custom icon glyph fonts.
- **No Icons or Images**: Do NOT embed phone, email, or GitHub icons. Icons either fail to parse or are ingested as corrupted Unicode characters (e.g., `\uE001`).
- **Standard Bullet Characters**: Use standard round bullet points (`•`, `*`, or `-`).

## 3. Contact Header Standards
- **Clean Hyperlinks**: Provide clean, direct text links (e.g., `github.com/username`, `linkedin.com/in/username`, `email@domain.com`).
- **No Prefix Labels**: Omit redundant labels like `Email:`, `Phone:`, `GitHub:`, `Website:`. The format is self-evident.
- **Physical Address**: City and State are sufficient (`City, ST`). Do not include street addresses.

## 4. Date & Degree Hygiene
- **Unambiguous Date Ranges**: Always specify month and year (e.g., `May 2024 -- Aug 2024`, `Sept 2023 -- Present`).
- **Expected Graduation**: Explicitly state graduation month and year (`Expected May 2028` or `May 2028`).
- **Standard Degree Nomenclature**: Use recognized naming conventions (e.g., `Bachelor of Science in Computer Science`, `B.S. in Computer Science`).

## 5. Dual-Location Keyword Strategy
- **Contextual + Inventory**: Core keywords and technical entities must appear in:
  1. The **Technical Skills** inventory (for high-level parser keyword tallying).
  2. The **Experience** and **Projects** bullet points (demonstrating practical, applied execution).
- **Entity Accuracy**: Use standard tech names (e.g., `PostgreSQL` not `Postgres DB`, `C++` not `CPP`, `Docker` not `Containerization tools`).
