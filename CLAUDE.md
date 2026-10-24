# AI Internship Hunter & Multi-Agent Resume Refinery

This repository contains an autonomous skill suite for tech internship discovery, Google Sheets tracking/deduplication, and a 3-stage actor-critic resume tailoring pipeline.

## Primary Instructions & Workflows
When asked to onboard the candidate, find internships, or tailor a resume, follow the detailed operational runbook:
👉 `.agents/skills/internship-hunter/SKILL.md`

## Key Tools & Conventions
- **Typst Compiler (Strict 1-Page Check)**:
  `.agents/skills/internship-hunter/tools/compile_resume.sh <input.typ> <output.pdf>`
- **Google Sheets Deduplication & Sync**:
  `.venv/bin/python3 .agents/skills/internship-hunter/tools/sheets_sync.py [--check-duplicate | --append | --fetch-applied]`
- **Subagent Personas**:
  - Stage 2A (ATS Scanner): `.agents/skills/internship-hunter/prompts/ats_scanner.md`
  - Stage 2B (Harsh Recruiter): `.agents/skills/internship-hunter/prompts/harsh_recruiter.md`
  - Stage 1 (Tailor Strategy): `.agents/skills/internship-hunter/prompts/tailor_strategy.md`
  - Stage 3 (Final Revisor): `.agents/skills/internship-hunter/prompts/revision_strategy.md`
- **Resume Integrity**:
  Strict adherence to `.agents/rules/resume_integrity.md` (never hallucinate skills, metrics, or experiences).
