# Engineering Recruiter Scoring Rubric & Professional Standards
# Sources: Harvard Mignone Center for Career Success, Google XYZ Framework (Laszlo Bock), r/EngineeringResumes Wiki, MIT CAPD

This rubric defines the rigorous, professional standards enforced by the Harsh Recruiter Subagent when evaluating technical resumes for software engineering and computing internship applications.

---

## The 4 Core Pillars of Technical Resume Excellence

### Pillar 1: Quantified Impact & The Google XYZ Formula (40 Points)
Every bullet point must adhere to Google's XYZ formula popularized by Laszlo Bock:
> **Accomplished [X] as measured by [Y] by doing [Z]**
*(or Harvard's Cause-and-Effect framework: Strong Action Verb + Technical Method + Measurable Business/System Impact).*

- **Level 4 (35–40 pts)**:
  - Every single bullet features concrete metrics: latency reduction (e.g., `-42%`, `sub-50ms p99`), concurrency scale (e.g., `10,000+ entities`), throughput (e.g., `1.5M transactions/day`), data volume (e.g., `100GB`, `10TB`), benchmark speedups with baseline context, or test coverage.
  - Metrics clearly demonstrate the engineering value of the work, not just arbitrary numbers.
- **Level 3 (25–34 pts)**:
  - Most bullets include metrics, but 1-2 lack scale or baseline context (e.g., "improved performance by 50%" without mentioning from what baseline or under what load).
- **Level 2 (15–24 pts)**:
  - Vague or generic claims: "built responsive web application", "improved query speed", "scaled backend".
- **Level 1 (0–14 pts)**:
  - Pure task-listing or passive job descriptions: "Responsible for writing code", "Assisted senior engineers", "Worked on database maintenance".

---

### Pillar 2: Technical Depth & Engineering Rigor (30 Points)
Evaluates whether the candidate demonstrates genuine software engineering principles or superficial tutorial clones.

- **High-Signal Indicators (26–30 pts)**:
  - Advanced Architecture & Scalability: Distributed consensus (Raft, Paxos), high-throughput message streaming, fault tolerance, consistent hashing, lockless concurrency, thread pooling.
  - Systems & Low-Level Depth: Low-level memory management, bare-metal kernels/drivers, custom network protocols, socket programming, hardware-software interfaces, assembly/C/Rust optimization.
  - Performance & Infrastructure: Database indexing/query optimization, caching layers (Redis/Memcached), containerization (Docker, Kubernetes), automated CI/CD pipelines, profiling (perf, GDB, Valgrind, benchmarks).
  - Applied Machine Learning & Data: Distributed training pipelines, model quantization/optimization, tensor operations, high-throughput feature extraction.
- **Medium-Signal Indicators (15–25 pts)**:
  - Standard full-stack CRUD applications, RESTful APIs with authentication, relational database schemas with standard ORM queries.
- **Red Flags & Disqualifiers (0–14 pts)**:
  - Trivial tutorial clones: To-do apps, weather apps, simple calculator, basic blog template.
  - Superficial API wrappers: Claiming "AI Engineer" after writing minimal wrapper code around a commercial API.
  - Tech buzzword soup: Listing 25 languages and frameworks without demonstrating practical implementation depth.

---

### Pillar 3: Harvard Action Verbs & Active Voice (15 Points)
Derived from the **Harvard Mignone Center for Career Success** resume guidelines:

- **Strict Rules**:
  - Every bullet must begin with a strong past-tense action verb (for completed roles/projects) or present-tense (for ongoing roles).
  - Absolutely NO first-person pronouns (*"I"*, *"my"*, *"me"*, *"we"*).
  - Absolutely NO passive or weak phrases (*"Responsible for"*, *"Assisted in"*, *"Helped with"*, *"Participated in"*, *"Duties included"*).
- **Harvard Action Verb Taxonomy**:
  - **Technical Creation & Architecture**: *Architected, Engineered, Implemented, Designed, Built, Deployed, Synthesized, Formulated*.
  - **Performance & Optimization**: *Optimized, Benchmarked, Streamlined, Accelerated, Refactored, Overhauled, Scaled, Profiled*.
  - **Analysis & Evaluation**: *Evaluated, Quantified, Analyzed, Investigated, Validated, Audited, Assessed*.
  - **Leadership & Coordination**: *Spearheaded, Directed, Orchestrated, Co-authored, Published*.

---

### Pillar 4: Formatting, Brevity & Density (15 Points)
Derived from **Jake's Resume standard** and **r/EngineeringResumes Wiki**:

- **Strict 1-Page Budget**:
  - Resumes for students and new grads MUST fit on exactly one single page. Exceeding 1 page is an immediate disqualification (0/15).
- **Orphan Line Eradication**:
  - Bullets must not wrap onto a second line for just 1–3 trailing words. Every line should be efficiently filled (80%+ line width) to maximize vertical real estate.
- **Zero Fluff & Soft Skills**:
  - Ban empty filler words: *"passionate"*, *"motivated"*, *"detail-oriented"*, *"team player"*, *"quick learner"*, *"hardworking"*, *"leveraged"*, *"synergized"*. Soft skills must be proven through technical accomplishments, not claimed.
- **No Summary / Objective**:
  - Never waste header space on an "Objective" or "Professional Summary" for undergraduates/interns. Start straight with Education or Experience.
- **Monochromatic Typography**:
  - Professional black-and-white presentation following Jake's Resume standard. No blue accents or gray rules.

---

## Quick Scoring Checklist
| Criterion | Points | Target |
| :--- | :---: | :--- |
| **Quantified Impact (Google XYZ)** | 40 | All bullets have measurable metrics, scale, or benchmarks |
| **Technical Depth & Rigor** | 30 | Distributed systems, performance, low-level, real engineering |
| **Harvard Action Verbs** | 15 | Strong verbs, zero passive voice, zero pronouns |
| **Layout Brevity & 1-Page** | 15 | Strictly 1 page, zero orphan lines, Jake's template |
| **Total Score** | **100** | **Passing Bar: $\ge 80$** |
