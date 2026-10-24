# 🎯 AI Internship Hunter & Multi-Agent Resume Refinery

An autonomous, multi-agent skill suite designed for **Antigravity**, **Claude Code**, **OpenAI Codex / ChatGPT CLI**, **Cursor**, **Windsurf**, and any agentic coding assistant to discover, filter, critique, and tailor applications for tech internships.

---

## ⚡ Key Capabilities

- 📄 **Direct Resume PDF Ingestion**: Natively extracts your background, projects, coursework, and technical stack.
- 🧭 **Proactive Role Suggestion**: The Agent analyzes your engineering depth and pitches the highest-probability internship tracks (e.g. Systems/Low-Level, Backend/Distributed Systems, ML Infrastructure) with technical rationale.
- 📊 **Google Sheets Sync & Deduplication**: Integrates directly with your Google Sheets tracker to read past applications and ensure you **never duplicate apply**. Automatically logs newly tailored applications with match scores and PDF links.
- 🔍 **Semantic Internship Search**: Discovers and filters active internship postings based on your target roles, graduation year, target countries, and visa sponsorship requirements.
- 🎭 **Actor-Critic Tailoring Loop**:
  - **Stage 1 (Tailor Agent)**: Synthesizes a role-specific Typst resume draft using the Google XYZ formula (`Accomplished [X] as measured by [Y] by doing [Z]`).
  - **Stage 2A (ATS Scanner Subagent)**: Evaluates hard keyword coverage, entity density, and parsing hygiene.
  - **Stage 2B (Harsh Recruiter Subagent)**: Adopts a ruthless, cynical senior hiring manager persona (10-second scan mindset) to tear apart passive voice, vague metrics, and fluff.
  - **Stage 3 (Final Revisor Agent)**: Adjudicates feedback, tightens copy, and compiles a pixel-perfect **strict 1-page PDF** via **Typst**.
  - **Application Q&A Kit**: Generates tailored answers for application prompts ("Why this company?", "Challenging technical project").

---

## 🏗️ Architecture

```mermaid
flowchart TD
    A[resume.pdf] --> B[Direct Ingest & Semantic Profile]
    B --> C[Agent Role Matching & Guided Onboarding]
    C --> D[(data/config.yaml & data/profile.yaml)]
    
    E[Your Google Sheet] <--> F[tools/sheets_sync.py]
    
    G[Internship Trackers & Web Search] --> H[Semantic Filtering & Scoring]
    D & F --> H
    H --> I[Target Opportunities Queue]
    
    I --> J[Stage 1: Tailor Agent - Draft Typst Source]
    J --> K[Stage 2A: ATS Scanner Subagent]
    J --> L[Stage 2B: Harsh Recruiter Subagent]
    K & L --> M[Stage 3: Final Revisor Agent]
    M --> N[tools/compile_resume.sh]
    N --> O[output/company/resume.pdf - Strict 1 Page]
    M --> P[output/company/answers.md - Q&A Kit]
    O & P --> F
```

---

## 🚀 Quickstart

### 1. Clone & Set Up Environment
```bash
git clone https://github.com/your-username/internship-hunter.git
cd internship-hunter

# Run automated setup (creates virtual environment and downloads standalone Typst compiler)
./setup.sh
```

### 2. Add Your Resume
Place your base resume PDF into the project root:
```bash
cp /path/to/my_resume.pdf ./resume.pdf
```
*(Don't worry: `*.pdf`, `credentials.json`, and personal data are strictly ignored in `.gitignore` and will never be committed to Git).*

### 3. Launch Your Preferred Agent

This project is provider-agnostic. All workflows and personas are written in standard markdown and open-source CLI tools:

- **Google Antigravity (`agy`)**:
  ```bash
  agy
  ```
  *(Antigravity automatically discovers `.agents/skills/internship-hunter` on startup).*

- **Claude Code (`claude`)**:
  ```bash
  claude
  ```
  *(Claude Code automatically loads instructions from `CLAUDE.md`).*

- **Cursor / Windsurf**:
  Open this folder in Cursor or Windsurf. The IDE automatically loads `.cursorrules`.

- **OpenAI / Codex / Custom Agents**:
  Point your agent to the runbook at `.agents/skills/internship-hunter/SKILL.md`.

---

### 4. Prompt the Agent
Once your agent is running, kick off the workflow:
> *"I placed my `resume.pdf` in the workspace. Ingest it, suggest my best-matching internship roles, and let's configure my preferences."*

The agent will read your resume, pitch matching roles, and guide you through target countries and visa sponsorship preferences.

---

## 📊 Google Sheets Setup (Optional but Recommended)

To prevent duplicate applications and automatically track tailored resumes:

1. **Obtain Service Account Credentials**: Follow the [Step-by-Step Appendix](#-appendix-step-by-step-google-sheets-setup-guide) to generate a free `credentials.json` file.
2. **Share Your Google Sheet**: Add your Service Account email as an **Editor** on your tracking spreadsheet.
3. **Configure `data/config.yaml`**:
   ```yaml
   google_sheets:
     enabled: true
     spreadsheet_id: "YOUR_SPREADSHEET_ID_FROM_URL"
     worksheet_name: "Applications"
     credentials_path: "credentials.json"
   ```
4. **Test the Connection**:
   ```bash
   ./.venv/bin/python3 .agents/skills/internship-hunter/tools/sheets_sync.py --test-connection
   ```
*(If disabled or skipped, the system automatically falls back to local tracking in `data/applications.json` with zero configuration).*

---

## 📂 Repository Structure

```
.
├── .agents/
│   ├── rules/
│   │   └── resume_integrity.md            # Anti-hallucination rules (zero false claims)
│   └── skills/
│       └── internship-hunter/
│           ├── SKILL.md                   # Master Agent Runbook
│           ├── prompts/
│           │   ├── ats_scanner.md         # Stage 2A: Algorithmic ATS Scanner persona
│           │   ├── harsh_recruiter.md     # Stage 2B: Cynical Hiring Manager persona
│           │   ├── tailor_strategy.md     # Stage 1: STAR/XYZ tailoring strategy
│           │   └── revision_strategy.md   # Stage 3: Polish and Q&A strategy
│           ├── templates/
│           │   └── resume_template.typ    # Clean ATS-optimized Typst resume template
│           ├── tools/
│           │   ├── compile_resume.sh      # Typst compiler with strict 1-page check
│           │   └── sheets_sync.py         # Google Sheets I/O & deduplication tool
│           └── references/
│               ├── ats_guidelines.md      # ATS formatting standards
│               └── recruiter_rubric.md    # Harsh recruiter scoring criteria
├── data/
│   ├── profile.example.yaml               # Reference schema for candidate profile
│   └── config.example.yaml                # Reference schema for preferences & filters
├── requirements.txt                       # Minimal Python dependencies (pyyaml, gspread, requests)
├── setup.sh                               # One-click environment installer
├── .gitignore                             # Protects private resumes, keys, and outputs
└── README.md
```

---

## 🔒 Security & Privacy

Your personal data is protected by design:
- All `*.pdf` files, `data/profile.yaml`, and `output/` folders are ignored in `.gitignore`.
- API keys, `credentials.json`, and service account tokens are ignored.
- The agent adheres to `.agents/rules/resume_integrity.md`, ensuring it never fabricates skills, dates, or experiences.

---

## 📖 Appendix: Step-by-Step Google Sheets Setup Guide

<details>
<summary><b>Click to expand: Complete Click-by-Click GCP Setup Walkthrough</b></summary>

<br>

### Part A: Generate the Service Account Key
1. Open the [Google Cloud Console](https://console.cloud.google.com/) and log in with your Google account.
2. At the top left (next to the Google Cloud logo), click the **Select a project** dropdown $\rightarrow$ click **New Project**.
   - Name it anything (e.g., `internship-tracker`) and click **Create**.
3. In the top search bar, search for **Google Sheets API** $\rightarrow$ click on it $\rightarrow$ click **Enable**.
4. In the top search bar, search for **Google Drive API** $\rightarrow$ click on it $\rightarrow$ click **Enable**.
5. In the left navigation menu, go to **IAM & Admin** $\rightarrow$ **Service Accounts** (or search "Service Accounts" in the top bar).
6. Click **+ Create Service Account** at the top:
   - **Service account name**: `sheets-bot`
   - Click **Done** (optional permission steps can be skipped).
7. In the Service Accounts list, click on the newly created service account email (it looks like `sheets-bot@your-project-id.iam.gserviceaccount.com`).
8. Go to the **Keys** tab at the top $\rightarrow$ click **Add Key** $\rightarrow$ **Create new key**.
9. Select **JSON** and click **Create**.
   - A `.json` file will automatically download to your computer.

### Part B: Place the Key in Your Project
Move and rename the downloaded key to `credentials.json` in the root of this project:
```bash
# Example (adjust if downloaded to a different folder):
mv ~/Downloads/*.json /home/ates-isf/Projects/internship-hunter/credentials.json
```
*(Protected by `.gitignore`: this file will never be committed).*

### Part C: Share Your Google Sheet with the Bot
1. Open your internship tracking Google Sheet in your browser.
2. Click the green **Share** button (top right).
3. Paste the **Service Account email** (`sheets-bot@your-project-id.iam.gserviceaccount.com`).
4. Set permission to **Editor** and click **Send** (uncheck "Notify people" if prompted).

### Part D: Configure `data/config.yaml`
1. Copy the Spreadsheet ID from your Google Sheet URL:
   `https://docs.google.com/spreadsheets/d/`**`1a2b3c4d5e6f7g8h9i0_SAMPLE_ID`**`/edit`
2. Update `data/config.yaml`:
   ```yaml
   google_sheets:
     enabled: true
     spreadsheet_id: "1a2b3c4d5e6f7g8h9i0_SAMPLE_ID"
     worksheet_name: "Sheet1" # Tab name at the bottom of your sheet
     credentials_path: "credentials.json"
   ```
3. Test your connection:
   ```bash
   ./.venv/bin/python3 .agents/skills/internship-hunter/tools/sheets_sync.py --test-connection
   ```

</details>

---

## 📜 License
GNU General Public License v3.0 (GPLv3). See [LICENSE](LICENSE) for details.
