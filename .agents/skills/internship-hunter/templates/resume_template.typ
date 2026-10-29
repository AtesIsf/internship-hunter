// Jake's Resume Template in Typst
// Modeled directly after Jake Gutierrez's industry-standard LaTeX resume template (jakegut/resume).
// Engineered for CS students & software engineers: strictly 1-page, high information density, ATS-friendly, monochromatic.

#set document(title: "Resume - Jane Doe", author: "Jane Doe")
#set page(
  paper: "us-letter",
  margin: (x: 0.5in, top: 0.45in, bottom: 0.45in)
)

// Primary font: New Computer Modern (LaTeX Computer Modern serif), with standard system serif fallbacks
#set text(
  font: ("New Computer Modern", "Times New Roman", "Liberation Serif"),
  size: 10pt,
  fill: rgb("#000000"),
  lang: "en",
  spacing: 100%
)

// Clean paragraph layout with tight vertical rhythm
#set par(justify: false, leading: 0.5em)

// Unobtrusive clickable links without colored underlines (replicates LaTeX [hidelinks]{hyperref})
#show link: set text(fill: rgb("#000000"))

// Standard circular bullets with tight list spacing
#set list(marker: [•], spacing: 4.5pt, tight: true)

// Jake's Section Title: Bold uppercase with a full-width 0.5pt black horizontal rule
#let section-title(title) = {
  v(4pt)
  text(weight: "bold", size: 10.5pt, upper(title))
  v(-3.5pt)
  line(length: 100%, stroke: 0.5pt + rgb("#000000"))
  v(2pt)
}

// Jake's Subheading (Education & Work Experience):
// Line 1: Organization/Company (bold, left) .................... Location (right)
// Line 2: Role/Degree (italic, left) ........................... Dates (italic, right)
#let sub-heading(title, location, subtitle, dates) = {
  block(width: 100%)[
    #grid(
      columns: (1fr, auto),
      align: (left, right),
      [*#title*], [#location]
    )
    #if subtitle != "" or dates != "" [
      #v(-3.5pt)
      #grid(
        columns: (1fr, auto),
        align: (left, right),
        [_#subtitle _], [_#dates _]
      )
    ]
  ]
}

// Jake's Project Heading:
// Project Name (bold) | Technologies (italic) .................. Dates (italic, right)
#let project-heading(name, tech, dates) = {
  block(width: 100%)[
    #grid(
      columns: (1fr, auto),
      align: (left, right),
      [
        *#name* #if tech != "" [ | _#tech _]
      ],
      [
        _#dates _
      ]
    )
  ]
}

// ---------------- HEADER ----------------
#align(center)[
  #text(weight: "bold", size: 19pt)[Jane Doe] \
  #v(1.5pt)
  #text(size: 9.5pt)[
    (555) 123-4567 #h(3pt) | #h(3pt)
    #link("mailto:jane.doe@university.edu")[jane.doe\@university.edu] #h(3pt) | #h(3pt)
    #link("https://linkedin.com/in/janedoe")[linkedin.com/in/janedoe] #h(3pt) | #h(3pt)
    #link("https://github.com/janedoe")[github.com/janedoe]
  ]
]

#v(-1pt)

// ---------------- EDUCATION ----------------
#section-title("Education")
#sub-heading("Top Tech University", "City, ST", "Bachelor of Science in Computer Science, Minor in Mathematics; GPA: 3.85/4.0", "Aug 2024 -- May 2028")
#v(-2pt)
#list(
  [Relevant Coursework: Data Structures & Algorithms, Operating Systems, Distributed Systems, Database Systems, Computer Networks]
)

// ---------------- EXPERIENCE ----------------
#section-title("Experience")
#sub-heading("FinTech Innovations", "New York, NY", "Software Engineering Intern", "June 2025 -- Aug 2025")
#v(-2pt)
#list(
  [Engineered high-throughput event processing pipeline using Go, Redis Streams, and PostgreSQL, processing 1.5M transactions/day with sub-50ms latency.],
  [Reduced database query latency by 42% by redesigning indexing strategies and implementing a Redis write-through caching layer.],
  [Constructed automated CI/CD pipeline with GitHub Actions and Docker, reducing deployment cycle time from 35 minutes to 8 minutes.]
)

// ---------------- PROJECTS ----------------
#section-title("Projects")
#project-heading("DistCache", "Go, gRPC, Raft, Docker", "Jan 2025 -- May 2025")
#v(-2pt)
#list(
  [Built a distributed fault-tolerant key-value store in Go implementing the Raft consensus algorithm for node election and log replication.],
  [Designed consistent hashing ring with virtual nodes to balance partitions evenly across dynamic clusters with zero downtime re-sharding.],
  [Benchmarked with custom load generator; sustained 85,000 requests/sec across a 5-node cluster with 99.9% consistency under network partitions.]
)

#v(2pt)
#project-heading("EdgeVision", "Python, PyTorch, FastAPI, ONNX, Docker", "Sept 2024 -- Dec 2024")
#v(-2pt)
#list(
  [Trained and quantized computer vision models using PyTorch and ONNX Runtime, reducing memory footprint by 65% with $<1\%$ accuracy degradation.],
  [Deployed asynchronous REST microservice with FastAPI handling 400 concurrent video frame streams with sub-100ms inference turnaround.]
)

// ---------------- TECHNICAL SKILLS ----------------
#section-title("Technical Skills")
#v(1pt)
#grid(
  columns: (auto, 1fr),
  column-gutter: 6pt,
  row-gutter: 3pt,
  [*Languages:*], [Python, C++, Go, TypeScript, Java, SQL, Bash],
  [*Frameworks & Libraries:*], [FastAPI, React, PyTorch, gRPC, Redis Streams, Celery],
  [*Developer Tools:*], [Git, Docker, Kubernetes, Linux, GDB, Valgrind, GitHub Actions],
  [*Core Domains:*], [Distributed Systems, Concurrency, Database Optimization, Microservices]
)
