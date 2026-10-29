# Stage 1: Resume Tailoring Strategy (The Tailor Agent)

The Tailor Agent takes the candidate's master profile (`data/profile.yaml`) and the target Job Description, and crafts an objective, role-specific Typst resume draft directly at `output/resume.typ`.

---

## Professional Standards & Directives

### 1. Template Standard: Jake's Resume in Typst
- Use the industry-standard **Jake's Resume** template format (`.agents/skills/internship-hunter/templates/resume_template.typ`).
- **Monochromatic & Clean**: 100% black text (`#000000`), standard 0.5pt black horizontal rules, no colored accents (no blue headers, gray lines, or colored text).
- **Typography**: Clean serif (`New Computer Modern` primary, with `Times New Roman` / `Liberation Serif` fallback).
- **Structural Layout**:
  1. **Header**: Centered Name (19pt bold) + Contact line (Phone | Email | LinkedIn | GitHub with clean hyperlinks, no icons, no redundant labels).
  2. **Education**: University, Location, Degree, Minor, GPA, Graduation Date, Honors, Relevant Coursework.
  3. **Experience** (or **Projects**, depending on role alignment): Sub-headings with Organization/Location on top line, Role/Dates on bottom line.
  4. **Projects**: Project Name | Technologies on left, Dates on right.
  5. **Technical Skills**: Categorized key-value list (Languages, Frameworks & Libraries, Developer Tools, Core Domains).

### 2. Output Destination: Single File Rule
- **NO per-internship subdirectories** (never create `output/<company>_<role>/` or similar directories).
- Always draft directly to:
  `output/resume.typ`
- The single target compiled result is:
  `output/resume.pdf`

### 3. Bullet Point Construction: Google XYZ & Harvard Action Verbs
- Structure every bullet with Google's XYZ formula:
  `Accomplished [X] as measured by [Y] by doing [Z]`
- **Harvard Action Verbs**: Start every bullet with a strong past-tense verb (*Architected, Engineered, Implemented, Benchmarked, Optimized, Profiled, Deployed, Synthesized*).
- **Banned Phrasing**:
  - NO passive verbs (*"Assisted"*, *"Responsible for"*, *"Worked on"*, *"Helped with"*).
  - NO first-person pronouns (*"I"*, *"me"*, *"my"*, *"we"*).
  - NO soft-skill filler (*"passionate"*, *"quick learner"*, *"hardworking"*, *"team player"*).

### 4. Technical Rigor & Role-Specific Alignment
- Objectively select experiences and projects that align with the specific job description:
  - *Systems / Embedded*: Prioritize low-level C/C++/Rust, memory management, concurrency, operating systems concepts, and hardware-software interfaces.
  - *Backend / Distributed*: Prioritize API architecture, microservices, databases, networking, distributed consensus, caching, and scalability.
  - *Machine Learning / Data*: Prioritize model pipelines, framework internals, numerical computing, inference optimization, and distributed data processing.
  - *General SWE / Full-Stack*: Prioritize end-to-end features, system architecture, performance profiling, testing, and CI/CD pipelines.

### 5. Strict 1-Page Budget & Orphan Line Prevention
- The resume must fit strictly on **1 single page** in Typst.
- **Orphan Line Eradication**: Ensure bullets do not wrap onto a second line for just 1–3 trailing words. Adjust word choice so lines are either 1 full line or 2 full lines.
