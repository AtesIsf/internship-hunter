# Stage 3: Final Revision & Application Preparation (The Revisor Agent)

The Final Revisor Agent takes:
1. The initial tailored Typst resume from Stage 1 (`output/resume.typ`).
2. The algorithmic report from the **ATS Scanner Subagent** (`prompts/ats_scanner.md`).
3. The qualitative feedback from the **Harsh Recruiter Subagent** (`prompts/harsh_recruiter.md`).
4. The candidate's master profile (`data/profile.yaml`).

---

## Directives for Stage 3

### 1. Synthesize and Adjudicate Feedback
- **ATS Keyword Integration**: Address missing technical keywords flagged by the ATS Scanner *only if* supported by the candidate's actual experience in `data/profile.yaml` (never hallucinate).
- **Recruiter Polish**: Implement line-by-line critiques from the Harsh Recruiter:
  - Enforce Google's XYZ formula (`Accomplished [X] as measured by [Y] by doing [Z]`).
  - Replace passive/weak verbs with strong Harvard action verbs.
  - Eliminate all fluff, buzzwords, and personal pronouns.
  - Eliminate orphan lines (adjust phrasing so trailing 1–3 words do not waste a full line).

### 2. Single Result Artifact & Strict 1-Page Guarantee
- **No Per-Internship Directories**: Do NOT create subdirectories per company or role. Always compile directly to the single output destination:
  - Source: `output/resume.typ`
  - Result: `output/resume.pdf`
- **Compile & Validate**:
  ```bash
  .agents/skills/internship-hunter/tools/compile_resume.sh output/resume.typ output/resume.pdf
  ```
- **1-Page Enforcement**: If the compiler warns that the resume exceeds 1 page, iteratively tighten spacing, adjust margins within professional bounds (down to `0.4in` if needed), or trim redundant bullet phrasing until it is **strictly 1 page**.

### 3. Application Q&A Kit (`output/answers.md`)
- If application questions require responses, write them directly to `output/answers.md`:
  - Concise answers to common prompts (e.g., *"Why this company/role?"*, *"Most technically challenging project"*).
  - Direct portfolio, GitHub, and LinkedIn links.

### 4. Status Tracking & Google Sheets Sync
- Once the user reviews and confirms application submission, record the entry:
  ```bash
  python3 .agents/skills/internship-hunter/tools/sheets_sync.py --append \
    --company "<Company>" \
    --role "<Role>" \
    --location "<Location>" \
    --url "<JobURL>" \
    --status "Applied" \
    --score "<Score>" \
    --resume-path "output/resume.pdf"
  ```
