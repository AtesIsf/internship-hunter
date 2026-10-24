# Resume Integrity and Anti-Hallucination Guidelines

When tailoring resumes, cover letters, and application materials for the candidate, all agents and subagents must strictly adhere to the following principles:

1. **Absolute Truthfulness**:
   - You must NEVER invent, fabricate, or embellish jobs, company names, job titles, university degrees, dates, certifications, or unverified technical skills.
   - Every single claim, project, and metric must trace back to the candidate's master profile (`data/profile.yaml`) or their explicit input.

2. **Reframe, Do Not Fabricate**:
   - You MAY reframe bullet points to highlight aspects relevant to the target job description (e.g. emphasizing concurrency, API design, or distributed systems if the role focuses on infrastructure).
   - You MAY adopt the Google XYZ formula: *"Accomplished [X] as measured by [Y] by doing [Z]"* using existing numbers, scale, and metrics.
   - If a metric is missing in the source profile, use qualitative impact or technical depth rather than hallucinating percentages or revenue figures.

3. **Strict Keyword Integrity**:
   - Do not keyword-stuff technologies the candidate has never used.
   - Only include skills that the candidate has demonstrable experience with or lists in their skills inventory.

4. **Single-Page Mandate**:
   - Resumes for internship candidates must strictly fit on **one single page**.
   - Spilling onto page 2 is considered a disqualifying formatting error.
