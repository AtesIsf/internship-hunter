// ATS-Optimized Clean Resume Template in Typst
// Optimized for strict single-page budget, ATS parsing, and high readability.

#set document(title: "Resume - Jane Doe", author: "Jane Doe")
#set page(
  paper: "us-letter",
  margin: (x: 1.4cm, top: 1.2cm, bottom: 1.2cm)
)

#set text(
  font: ("Liberation Sans", "DejaVu Sans", "Arial"),
  size: 9.5pt,
  fill: rgb("#111827"),
  spacing: 120%
)

#set par(justify: false, leading: 0.52em)

// Custom styling helpers
#let section-title(title) = {
  v(6pt)
  text(weight: "bold", size: 11pt, fill: rgb("#1e3a8a"), upper(title))
  v(-3pt)
  line(length: 100%, stroke: 0.8pt + rgb("#cbd5e1"))
  v(3pt)
}

#let exp-header(title, organization, location, dates) = {
  grid(
    columns: (1fr, auto),
    gutter: 0pt,
    [
      #text(weight: "bold", size: 10pt)[#title]
      #if organization != "" [ | #text(style: "italic")[#organization]]
    ],
    [
      #if location != "" [#text(fill: rgb("#4b5563"))[#location] | ]
      #text(fill: rgb("#4b5563"), weight: "medium")[#dates]
    ]
  )
}

#let resume-bullet(body) = {
  list(
    marker: [•],
    body
  )
}

// ---------------- HEADER ----------------
#align(center)[
  #text(weight: "bold", size: 18pt, fill: rgb("#0f172a"))[Jane Doe] \
  #v(2pt)
  #text(size: 9pt, fill: rgb("#374151"))[
    New York, NY #h(4pt) | #h(4pt)
    jane.doe\@university.edu #h(4pt) | #h(4pt)
    (555) 123-4567 #h(4pt) | #h(4pt)
    github.com/janedoe #h(4pt) | #h(4pt)
    linkedin.com/in/janedoe
  ]
]

#v(2pt)

// ---------------- EDUCATION ----------------
#section-title("Education")

#exp-header("B.S. in Computer Science, Minor in Mathematics", "Top Tech University", "New York, NY", "Expected May 2026")
#v(1pt)
#text(size: 9pt)[
  *GPA:* 3.85 / 4.0 #h(8pt) | #h(8pt)
  *Relevant Coursework:* Data Structures & Algorithms, Distributed Systems, Operating Systems, Database Systems, Computer Networks
]

// ---------------- TECHNICAL SKILLS ----------------
#section-title("Technical Skills")

#v(1pt)
#grid(
  columns: (auto, 1fr),
  column-gutter: 8pt,
  row-gutter: 3pt,
  [*Languages:*], [Python, C++, Go, TypeScript, SQL, Bash],
  [*Frameworks & Libraries:*], [FastAPI, React, PyTorch, gRPC, Docker, Celery],
  [*Tools & Platforms:*], [Linux, Git, Kubernetes, PostgreSQL, Redis, AWS (S3, EC2, Lambda)]
)

// ---------------- EXPERIENCE ----------------
#section-title("Professional Experience")

#exp-header("Software Engineering Intern", "FinTech Innovations", "New York, NY", "June 2024 – Aug 2024")
#v(-2pt)
- Engineered high-throughput event processing pipeline using Python, Redis Streams, and PostgreSQL, processing 1.5M transactions/day with sub-50ms latency.
- Reduced database query latency by 42% by redesigning indexing strategies and implementing a Redis write-through caching layer.
- Constructed automated CI/CD pipeline with GitHub Actions and Docker, reducing team deployment cycle time from 35 minutes to 8 minutes.

// ---------------- PROJECTS ----------------
#section-title("Key Projects")

#exp-header("DistCache – Distributed In-Memory Cache", "Go, gRPC, Raft, Docker", "", "Jan 2024 – May 2024")
#v(-2pt)
- Built a distributed fault-tolerant key-value store in Go implementing the Raft consensus algorithm for node election and log replication.
- Designed consistent hashing ring with virtual nodes to balance partitions evenly across dynamic clusters with zero downtime re-sharding.
- Benchmarked with custom load generator; sustained 85,000 requests/sec across a 5-node cluster with 99.9% consistency under network partitions.

#v(2pt)
#exp-header("EdgeVision – Real-Time Edge Inference Pipeline", "Python, PyTorch, FastAPI, ONNX", "", "Sept 2023 – Dec 2023")
#v(-2pt)
- Trained and quantized computer vision models using PyTorch and ONNX Runtime, reducing model memory footprint by 65% with $<1\%$ accuracy loss.
- Deployed asynchronous REST microservice with FastAPI handling 400 concurrent video frame streams with sub-100ms inference turnaround.
