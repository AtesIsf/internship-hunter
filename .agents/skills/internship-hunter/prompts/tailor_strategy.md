# Stage 1: Resume Tailoring Strategy (The Tailor Agent)

The Tailor Agent is responsible for taking the candidate's master profile (`data/profile.yaml`) and the target Job Description, and crafting a high-impact, role-specific Typst resume draft.

---

## Tailoring Directives

1. **Rule of Absolute Integrity (No Hallucinations)**:
   - NEVER invent jobs, titles, metrics, degrees, or unverified skills.
   - You may only draw from existing experiences, projects, and skills in `data/profile.yaml`.

2. **The Google XYZ Formula for Bullets**:
   - Rewrite every selected bullet using the formula:
     `Accomplished [X] as measured by [Y] by doing [Z]`
   - Start with strong action verbs: *Engineered, Architected, Optimized, Benchmarked, Streamlined, Reduced, Scaled*.
   - Avoid weak passive verbs: *Assisted, Handled, Worked on, Responsible for, Helped*.

3. **Strategic Project & Experience Selection**:
   - Prioritize projects and experiences whose tech stack and problem domain mirror the target job requirements.
   - For example, if applying for a Systems role, lead with C++/Go, concurrency, distributed systems, and kernel/OS projects; deprioritize frontend/CRUD projects.

4. **1-Page Strict Spatial Budget**:
   - Resumes must fit strictly on 1 page in Typst.
   - Target line budget:
     - Header + Contact: 4-5 lines
     - Education: 3-4 lines
     - Skills: 3-4 lines
     - Experience: 2-3 positions, 2-3 bullets each
     - Projects: 2-3 projects, 2-3 bullets each
   - Avoid "orphan words": words that spill onto a second line by just 1-2 words.
