# Preface

## Why this book exists

If you are a developer in 2026, three forces are reshaping your daily work:

1. **Git and GitHub** are no longer optional. They are the operating system of professional software.
2. **GenAI and agents** are reshaping how code is written, reviewed, deployed, and operated.
3. **GitHub Copilot** sits at the intersection of the two — it is now the most-used AI engineering tool on the planet.

But three things make a learner stall:

1. **Scattered.** Git tutorials don't cover GitHub. GitHub docs don't cover Copilot. Copilot docs don't cover agentic workflows. Exam study guides don't show real engineering.
2. **Toy-shaped.** Most tutorials show "hello world". You are building agents that call LLMs, scan PRs, and deploy to Azure.
3. **No certification path.** You can study for five separate GitHub exams from five separate sources — or you can use this one book.

This handbook bridges that gap. It is:

- **Hands-on.** Every concept ships with commands you can run on Windows (PowerShell) and macOS/Linux (bash).
- **Real-world.** Every chapter uses scenarios from GenAI / agentic engineering: deploying a RAG service, CI for an agent, code review with Copilot, secret scanning for OpenAI keys.
- **Exam-aligned.** Mapped 1:1 to the public blueprints of five GitHub exams (see [EXAM_BLUEPRINT.md](EXAM_BLUEPRINT.md)).
- **Architect-shaped.** Every phase ends with "when do you choose this?" and "what goes wrong in production?", so you can defend a design, not just memorize one.

## Who this book is for

- You are **new to Git and GitHub**, or you only use them at "clone → commit → push" level.
- You can read basic Python and shell. You do **not** need ML or compiler background.
- You want to take and pass **GitHub Foundations**, **Copilot**, **Actions**, **GHAS**, and **Administration** certifications.
- You also want to **build** GenAI and agentic systems on GitHub with confidence.

## What you will be able to do at the end

- Run any everyday Git workflow without panicking when something breaks.
- Use GitHub repos, issues, PRs, projects, releases, and discussions like a senior engineer.
- Build CI/CD with GitHub Actions for AI/ML projects, including matrix builds, OIDC to Azure, model registry pushes, and reusable workflows.
- Use GitHub Copilot (inline, chat, agent mode, custom instructions, prompt files, MCP) to multiply your productivity on GenAI engineering tasks.
- Use GitHub Copilot CLI to accelerate terminal-heavy AI/ML workflows (training runs, evaluation, model conversion, Docker, kubectl).
- Build agentic AI systems where Copilot is the planner and your repo is the toolbelt.
- Secure your AI repositories with GHAS — secret scanning (with custom patterns for `sk-…` keys), CodeQL, Dependabot, push protection.
- Administer organizations, manage SSO/SCIM, run audit log queries, and manage Actions at enterprise scale.
- Walk into 5 GitHub certification exams calm and confident.

## Conventions

Throughout this book:

- `inline code` is a command or symbol.
- ```` ```bash ```` blocks are POSIX shell commands.
- ```` ```powershell ```` blocks are Windows PowerShell.
- ```` ```yaml ```` blocks are usually GitHub Actions or Copilot configuration.
- 🔧 **Try it** — short hands-on drills.
- ⚠️ **Production gotcha** — real-world failure modes you'll meet at work.
- 🎯 **Exam tip** — points that show up disproportionately on exams.

---
