# GitHub, Git & Copilot for GenAI / Agentic AI — The Hands-On Handbook

> *From zero to confident on 5 GitHub certifications — and shipping real agents in production.*

A complete, hands-on book + repository to learn **Git**, **GitHub**, **GitHub Copilot**, and **GitHub Copilot CLI** through the lens of **GenAI** and **Agentic AI** engineering — structured so you can pass **five** official GitHub certifications with confidence.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
![Status](https://img.shields.io/badge/edition-1.0-blue)
![Audience](https://img.shields.io/badge/audience-beginner%20→%20advanced-green)

---

## What you'll be able to do at the end

1. Use **Git** confidently — clone, branch, merge, rebase, stash, cherry-pick, recover from mistakes.
2. Use **GitHub** like a professional — repos, issues, PRs, code review, forks, releases, projects, discussions.
3. Build, test, and deploy AI/ML/agent projects with **GitHub Actions** (CI/CD, secrets, environments, OIDC).
4. Use **GitHub Copilot** (chat, inline, agent mode, custom instructions, prompt files, MCP) to build GenAI + agentic applications faster.
5. Use **GitHub Copilot CLI** (`gh copilot suggest`, `explain`, `gh-copilot`) to accelerate terminal workflows for AI/ML engineers.
6. Secure your AI repos with **GitHub Advanced Security** — secret scanning, code scanning (CodeQL), Dependabot, push protection.
7. **Pass** the following GitHub certification exams:
   - GitHub Foundations
   - GitHub Copilot Certification
   - GitHub Actions Certification
   - GitHub Advanced Security (GHAS) Certification
   - GitHub Administration Certification

---

## Read the book

- **Single-file book**: [BOOK.md](BOOK.md) — every chapter, exercise, and mock exam in one navigable file.
- **mdBook (web)**: build locally with `mdbook serve` (see [SETUP.md](SETUP.md)) or read the published version at `https://mail2raji.github.io/github-copilot-handbook/`.
- **Phase-by-phase**: pick a phase folder from the roadmap below.
- **Just exams**: jump to [Phase9_ExamPrep/](Phase9_ExamPrep/README.md).

---

## Who this is for

- You are **new to Git and GitHub**, or you use them only at a "clone, commit, push" level.
- You want to use **GitHub Copilot** to build **GenAI and agentic AI** systems (not toy demos).
- You want to walk into **five GitHub certification exams** with calm confidence.
- You can read basic Python or shell. You do **not** need ML, data-science, or compiler background.

---

## Learning roadmap (11 phases)

| Phase | Topic | Primary exam coverage | Folder |
|---|---|---|---|
| 0 | Setup — Git, GitHub, VS Code, Copilot, Copilot CLI, `gh` | Pre-req | [Phase0_Setup/](Phase0_Setup/README.md) |
| 1 | Git Fundamentals (the 20 commands you'll use 99% of the time) | Foundations | [Phase1_Git_Fundamentals/](Phase1_Git_Fundamentals/README.md) |
| 2 | GitHub Basics — repos, branches, PRs, issues, reviews, forks | Foundations | [Phase2_GitHub_Basics/](Phase2_GitHub_Basics/README.md) |
| 3 | Intermediate Git — rebase, cherry-pick, reflog, recover, hooks | Foundations + Admin | [Phase3_Intermediate_Git/](Phase3_Intermediate_Git/README.md) |
| 4 | GitHub Actions — CI/CD for AI projects, secrets, environments, OIDC | Actions | [Phase4_GitHub_Actions/](Phase4_GitHub_Actions/README.md) |
| 5 | GitHub Copilot for GenAI — chat, inline, agent mode, custom instructions | Copilot | [Phase5_Copilot_GenAI/](Phase5_Copilot_GenAI/README.md) |
| 6 | GitHub Copilot CLI for AI/ML engineers | Copilot | [Phase6_Copilot_CLI/](Phase6_Copilot_CLI/README.md) |
| 7 | Building Agentic AI with Copilot, MCP, skills & prompt files | Copilot (advanced) | [Phase7_Agentic_AI_Copilot/](Phase7_Agentic_AI_Copilot/README.md) |
| 8 | GHAS + Administration — secret scanning, CodeQL, Dependabot, SSO, audit | GHAS + Admin | [Phase8_GHAS_Admin/](Phase8_GHAS_Admin/README.md) |
| 9 | Exam prep — 5 mock exams (150+ questions), flashcards, cheat sheets | **All 5 exams** | [Phase9_ExamPrep/](Phase9_ExamPrep/README.md) |
| 10 | Advanced Capstone — 5 production projects + 25 architecture exercises | All exams, deepened | [Phase10_Capstone/](Phase10_Capstone/README.md) |

Each phase folder contains:
- `README.md` — concepts, **real-world GenAI/Agentic AI scenario**, examples, exercises, mini quiz.
- Runnable scripts where applicable (`.ps1`, `.sh`, `.py`, `.yml`).
- `exercises.md` — try-it-yourself drills with solutions.

---

## How confident will I be on exam day?

If you finish **Phases 0–9** and score ≥ 80% on each mock exam: you are *exam-ready* and should pass with margin.

If you also finish **Phase 10** capstones: you will pass *and* be able to defend the architecture in any interview — because you will have **built** the systems the exam tests, not just memorized them.

If you score < 70% on any mock exam, this book tells you exactly which chapter to re-read and which exercise to redo. No guessing.

---

## Suggested pace

There is **no time pressure** — go at your own speed. As a guide:

- **Phases 0–2** — get comfortable with the daily Git + GitHub flow.
- **Phase 3** — the "I will never panic again when Git breaks" phase.
- **Phase 4** — CI/CD that actually deploys an AI agent.
- **Phases 5–7** — the bread-and-butter for a modern AI engineer using GitHub Copilot.
- **Phase 8** — security + admin: light reading first, deeper on the second pass.
- **Phase 9** — take Mock A under timed conditions, review, then Mock B, then Mock C+D+E.
- **Phase 10** — capstones if you want to pass with **margin** instead of by the skin of your teeth.

---

## Publish this book to GitHub Pages

This handbook ships with a ready-to-go GitHub Pages workflow.

```powershell
# from this folder
git init
git add .
git commit -m "Initial publish of GitHub + Copilot Handbook"
gh repo create mail2raji/github-copilot-handbook --public --source=. --remote=origin --push
# Enable Pages → Source: GitHub Actions in repo Settings, then trigger the workflow once.
```

The workflow at [.github/workflows/deploy-book.yml](.github/workflows/deploy-book.yml) builds the mdBook and publishes to `https://mail2raji.github.io/github-copilot-handbook/` on every push to `main`.

See [SETUP.md](SETUP.md) for full step-by-step setup, including Copilot and Copilot CLI.

### How the rendering works

[BOOK.md](BOOK.md) is the **canonical, single-file** version of the entire handbook — every chapter, exercise, and mock exam in one navigable document. mdBook needs one file per chapter, so a small PowerShell script [Split-Book.ps1](Split-Book.ps1) regenerates `mdbook/src/*.md` from `BOOK.md` before each build. The deploy workflow runs the split step automatically; if you edit `BOOK.md` locally, just run:

```powershell
./Split-Book.ps1
mdbook serve --open      # optional, requires mdBook installed locally
```

---

## License

MIT — see [LICENSE](LICENSE). You may reuse text and code in your own training materials with attribution.
