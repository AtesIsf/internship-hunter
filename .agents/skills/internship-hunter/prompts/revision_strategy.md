# Stage 3: Final Revision & Application Preparation (The Revisor Agent)

The Final Revisor Agent takes:
1. The initial tailored Typst resume from Stage 1.
2. The algorithmic report from the **ATS Scanner Subagent** (`prompts/ats_scanner.md`).
3. The brutal qualitative feedback from the **Harsh Recruiter Subagent** (`prompts/harsh_recruiter.md`).
4. The candidate's master profile (`data/profile.yaml`).

---

## Directives for Stage 3

1. **Synthesize and Adjudicate Feedback**:
   - Address every missing ATS keyword identified by the ATS Scanner *if and only if* the candidate actually has that background in `data/profile.yaml`.
   - Implement the Harsh Recruiter's line-by-line critiques: eliminate weak verbs, replace vague statements with concrete metrics/scale, and delete fluff.

2. **Strict Layout Polish & 1-Page Guarantee**:
   - Inspect the compiled Typst code.
   - Run the compiler: `.agents/skills/internship-hunter/tools/compile_resume.sh output/<company>/resume.typ output/<company>/resume.pdf`.
   - If the output exceeds 1 page, adjust vertical gaps (`v(-1pt)`), reduce margins slightly, or edit bullets to eliminate orphan lines until it is **exactly 1 page**.

3. **Produce Application Q&A Package (`answers.md`)**:
   - Answer common company application questions:
     - *"Why are you interested in this role and company?"*
     - *"Describe a technically challenging project you built."*
     - Direct portfolio/GitHub/LinkedIn links.

4. **Synchronize Status**:
   - Run the Google Sheets sync tool:
     `.agents/skills/internship-hunter/tools/sheets_sync.py --append --company "<Company>" --role "<Role>" --status "Tailored" --score "<Score>" --resume-path "output/<company>/resume.pdf" --url "<JobURL>"`
