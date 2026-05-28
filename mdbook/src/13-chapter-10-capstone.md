# Chapter 10 — Advanced Capstone: 5 production projects, 25 architecture exercises

> **You will:** build five production-grade projects that exercise everything in this book — and answer 25 architecture interview questions you will meet on exam day and on the job.

Skip the entire chapter if you only need a pass with thin margin. Do it if you want to *defend* a design — at work and on the certification interview-style scenario questions.

### 🧒 If you were 10 years old

After you've learned a new instrument, you don't say *"I'm done"* — you give a **school concert**. That's the capstone.

This chapter has **five concerts**. Each one is a real, complete project you can show a future boss, a teacher, or a friend. By the end you can point to GitHub and say, *"I built this — go look."*

- Concert 1 = a full AI chatbot service.
- Concert 2 = a robot that triages tickets while you sleep.
- Concert 3 = a robot that reviews other people's code politely.
- Concert 4 = a scoreboard that compares 4 different AI brains every night.
- Concert 5 = a recipe book of AI tricks anyone can use.

Finishing **one** concert means more than reading the whole book a second time.

### 🌍 Real-world situation — when to use this

**Situation:** You finished Phase 9 and the exam is scheduled. But your hiring manager asks, *"Cool, you passed the exam — but can you actually **build** anything?"* The capstones are your answer.

Minimum viable plan to ship Capstone 1 (RAG service) in **one weekend**:

```powershell
# Saturday morning — scaffold (2h)
mkdir doc-rag; cd doc-rag
gh repo create mail2raji/doc-rag --public --source=. --push
code .
# In Copilot Agent mode: "scaffold a FastAPI app with /query and /healthz,
#                         Dockerfile, pyproject.toml, tests/test_api.py."

# Saturday afternoon — retrieval (3h)
# Copilot: "add a Qdrant retriever in src/retriever.py with BM25 + embeddings."
# Copilot: "add tests with mocked Qdrant."

# Saturday evening — CI (1h)
# Copilot: "add .github/workflows/ci.yml: pytest on push and PR, Python 3.12."
git add .; git commit -m "feat: scaffold + retrieval"; git push

# Sunday morning — eval + nightly (2h)
# Copilot: "add scripts/eval.py + .github/workflows/eval-nightly.yml on cron."

# Sunday afternoon — deploy (3h)
# Copilot: "add infra/main.bicep for Container Apps, and a deploy.yml workflow
#          that uses OIDC to login to Azure and runs az containerapp up."
git add .; git commit -m "feat: eval, infra, deploy"; git push
# Sunday night — tag a v0.1.0 release; share the GitHub URL with your manager.
gh release create v0.1.0 --generate-notes
```

By Monday morning you have a working RAG service, on a public repo, with green CI and a v0.1.0 release. **You are now an engineer who shipped**, not a candidate who studied.

---

## Capstone 1 — Production RAG service on GitHub

**Goal:** ship `doc-rag` as a multi-tenant RAG service deployed on Azure, with full CI/CD, evals, security, and observability — all driven from a single GitHub repo.

### Architecture

```
   Users
     |
     v
  Azure Front Door  ---->  Azure Container Apps (FastAPI + retriever)
                                  |
                                  +--> Azure AI Search / Qdrant (vectors)
                                  +--> Azure OpenAI (chat completions)
                                  +--> Azure Storage (raw docs + chunked parquet)
                                  +--> App Insights (traces, metrics)
                                  +--> Key Vault (secrets via managed identity)
```

### Repo layout

```
doc-rag/
├── .github/
│   ├── workflows/
│   │   ├── ci.yml
│   │   ├── deploy.yml
│   │   ├── eval-nightly.yml
│   │   ├── codeql.yml
│   │   └── dependency-review.yml
│   ├── copilot-instructions.md
│   ├── prompts/
│   │   ├── eval-rag.prompt.md
│   │   └── refactor-tool.prompt.md
│   ├── skills/eval-rag/SKILL.md
│   └── CODEOWNERS
├── src/
│   ├── api.py
│   ├── retriever/
│   │   ├── chunk.py
│   │   ├── bm25.py
│   │   └── hybrid.py
│   └── eval/
│       └── eval.py
├── infra/
│   ├── main.bicep
│   ├── modules/
│   └── parameters.prod.bicepparam
├── tests/
│   ├── test_retriever.py
│   └── test_api.py
├── .vscode/mcp.json
├── Dockerfile
├── pyproject.toml
└── README.md
```

### Build it (12 steps)

1. **Scaffold** with Copilot agent mode: *"create a FastAPI app with `/query` returning top-5 RAG results, in `src/api.py`, with type hints and tests."*
2. **Chunking + embedding** — implement `src/retriever/chunk.py` with hybrid BM25 + embeddings.
3. **CI** — `ci.yml` runs pytest on 3 Python versions on every PR.
4. **Custom instructions** — add `.github/copilot-instructions.md` so Copilot stays in your conventions.
5. **MCP eval server** — add the `genai-eval` MCP server (Chapter 7 §7.5).
6. **CodeQL + Dependabot** — enable both with `security-extended` queries.
7. **Secret patterns** — register custom patterns for your internal Vault.
8. **Push protection** — enable, then deliberately try to commit a fake key — verify block.
9. **Bicep infra** — generate with Copilot inline chat.
10. **OIDC to Azure** — federated credential for `repo:mail2raji/doc-rag:ref:refs/heads/main` and `:environment:production`.
11. **Deploy workflow** — `deploy.yml` uses `azure/login@v2`, builds Docker, deploys to Container Apps.
12. **Nightly eval workflow** — `eval-nightly.yml` runs `python eval.py` across 3 models, posts results to `$GITHUB_STEP_SUMMARY`, opens a tracking issue if accuracy drops > 2%.

### What this proves

- Foundations: branches, PRs, issues, releases, projects.
- Actions: matrix, OIDC, environments, reusable workflows, scheduled.
- Copilot: instructions, prompt files, skills, agent mode, MCP server.
- GHAS: secrets, CodeQL, Dependabot, push protection, autofix.
- Admin: CODEOWNERS, rulesets, audit hooks.

---

## Capstone 2 — `AutoTriage` agent

**Goal:** when a new issue is opened, an agent labels, milestones, and pings the right team — using Copilot + GitHub MCP + a small Python script.

### Pipeline

```
  Issue opened
       |
       v
  GitHub Actions workflow (issues.opened)
       |
       v
  python triage.py            <-- uses gh CLI + OpenAI
       |
       +--> labels: bug | feature | question | docs
       +--> milestone: next / backlog
       +--> assigns codeowner via CODEOWNERS lookup
       +--> posts a friendly bot comment
```

### Key skills exercised

- Agent loop: plan → tool → observe.
- GitHub MCP server usage from a script.
- `gh issue edit --add-label / --milestone / --assignee`.
- Idempotency: re-running the workflow does not double-label.
- Approval mode: in dev, request approval before edits.

### Stretch goals

- **Eval mode** — generate 50 synthetic test issues; measure precision/recall of labeling vs ground truth.
- **Cost ceiling** — token budget per issue; fall back to keyword classifier if exceeded.

---

## Capstone 3 — `PR-Critic` reviewer

**Goal:** every PR gets a Copilot-style AI review *and* a security-style scoring, posted as a single PR comment with a verdict (approve / request changes / comment).

### Pipeline

```
  pull_request opened/synchronized
       |
       v
  Actions workflow (PR-Critic.yml)
       |
       +--> checkout PR (safely: `pull_request`, not `_target`)
       +--> CodeQL diff scan
       +--> Trivy scan of any new Docker / pyproject
       +--> python critic.py (calls LLM)
              --> reads diff, files changed
              --> uses skill "review-genai-pr"
              --> emits Markdown review
       +--> gh pr review --comment --body $review
```

### Security gotchas to mention in your report

- Never use `pull_request_target` with PR code checkout for forks.
- Mask all model outputs containing tokens that look like secrets.
- Cap on token use per PR to prevent abuse.

### Stretch goals

- **Self-review** — the script reviews its *own* PRs, demonstrating evaluator-optimizer loop.
- **Drift watcher** — once a week, scan all merged PRs and re-rate; flag any that score below threshold for re-review.

---

## Capstone 4 — Multi-model evaluator with cost dashboard

**Goal:** evaluate the same prompt across multiple LLM providers nightly, write results to a dashboard, alert on regressions.

### Architecture

```
  Workflow (matrix: gpt-4o-mini, gpt-4o, claude-3-5-sonnet, gemini-1.5-flash)
        |
        v
  per-model eval (json reports)
        |
        v
  summarize.py  -->  reports/dashboard.md (auto-committed via [skip ci])
        |
        v
  if regression -> open issue + slack webhook
```

### Skills exercised

- Matrix builds with shared secrets.
- Artifact upload/download between jobs.
- Commit-back-to-repo from CI with a PAT or GITHUB_TOKEN (with `contents: write`).
- Auto-publishing a Markdown dashboard to GitHub Pages.

### Stretch goals

- **Cost telemetry** — write per-run cost to `cost.parquet`; aggregate; render with Mermaid in dashboard.
- **Adaptive model selection** — pick the cheapest model that meets accuracy threshold per category.

---

## Capstone 5 — `GenAI-Skills-Marketplace` — distribute prompt files & MCP servers via GitHub

**Goal:** publish a repo that distributes your prompt files, skill files, chat modes, and MCP server configs as a reusable bundle. Other repos import them via a script.

### Repo design

```
genai-skills/
├── prompts/eval-rag.prompt.md
├── prompts/refactor-tool.prompt.md
├── skills/security-review/SKILL.md
├── skills/incident-rca/SKILL.md
├── chatmodes/architect.chatmode.md
├── mcp-servers/genai-eval/         # publishable as @org/genai-eval-mcp
├── mcp-servers/audit/
├── install.ps1
├── install.sh
├── README.md
└── .github/workflows/release.yml
```

`install.ps1` (sketch):

```powershell
param([string]$Repo = (Get-Location))
$dest = Join-Path $Repo '.github'
New-Item -ItemType Directory -Force -Path "$dest/prompts","$dest/skills","$dest/chatmodes" | Out-Null
Copy-Item prompts/* "$dest/prompts/" -Force
Copy-Item skills/* "$dest/skills/" -Recurse -Force
Copy-Item chatmodes/* "$dest/chatmodes/" -Force
Write-Host "Installed skills into $dest"
```

`release.yml` cuts a release on every tag and packages each MCP server as an npm/PyPI artifact.

### Skills exercised

- Release automation (`softprops/action-gh-release`).
- Reusable workflow patterns for multiple consumer repos.
- Provenance attestations (`actions/attest-build-provenance`) for supply-chain security.
- Publishing to GitHub Container Registry + npm with OIDC.

---

## 25 Architecture exercises

For each: sketch a 1-page answer (architecture diagram, trade-offs, decision). These are interview-grade scenarios that span all five certifications.

1. Design CI that runs a 4-hour LLM eval *only* on PRs touching `prompts/**`, not on README typos.
2. Your repo has a leaked `OPENAI_API_KEY` in history. Walk through the rotate-and-rewrite plan, plus the post-incident audit.
3. Choose: GitHub-hosted vs self-hosted runners for GPU training jobs that need an A100. Cost, security, autoscaling.
4. Design a Copilot-based code review workflow that respects content exclusions for `data/customers/**` but still reviews infra changes.
5. You need a Codespace template optimized for `langchain` + `qdrant`. What images, prebuilds, secret strategy?
6. Your org has 200 repos. Roll out CodeQL enterprise-wide. What's the rollout plan? How do you handle false positives at scale?
7. Architect a *push-protection-first* secret strategy where rotating any secret triggers a Dependabot-style PR cascade across consumers.
8. You receive an external PR from a fork that introduces a new GitHub Action. List the security checks before allowing it to run.
9. Design an MCP server that wraps your internal API gateway, exposes 4 tools (search, get, create-ticket, escalate) and is consumable by both Copilot and Claude.
10. Pick: SAML only vs SAML + SCIM for a 1000-person org. List the costs and incident scenarios.
11. Compare Required workflows vs Required status checks vs Rulesets for enforcing "CodeQL must pass". Pick one with rationale.
12. Your `eval.py` reads `.env` for keys. Refactor to use OIDC-issued tokens for Azure OpenAI without breaking local dev.
13. Design a release workflow that produces SBOMs, signs artifacts with cosign, and attests build provenance. Consumer verifies on pull.
14. A junior dev keeps merging directly to `main`. Design org-wide policy with rulesets that prevents this in *every* repo. How do you exempt the bot repo?
15. The model regresses overnight. Bisect strategy when changes span code *and* prompts *and* eval data.
16. Compare: vendor a prompt in the repo vs fetch from a remote prompt registry. Caching, audit, blast radius.
17. Your Actions bill exploded 5×. List the top 6 cost-reduction levers; how would you measure each?
18. Build a "dry-run" mode for an agentic GitHub bot that posts what it *would* do, without doing it.
19. Design a tenant-isolated RAG: 50 customers, each with their own document set. Repo layout, deployment model, secret isolation.
20. Compare GHAS Copilot Autofix vs Snyk Autofix vs DIY: cost, integration, blast radius, false-positive rate.
21. Your Copilot prompt sometimes hallucinates Python imports. Design a guardrail: post-process the output, run a `ruff check`, retry once with the lint error injected.
22. PR description is auto-generated by Copilot. Design the security review for that workflow: who runs it, what are the secrets, what's the audit?
23. Plan a migration of 20 ADO repos with build pipelines into GitHub with GitHub Actions. Phase 0–4, owners, rollback plan.
24. Compose a strategy for "GitHub Pages + mdBook + Actions + Copilot" so this book auto-publishes on every push, with a preview deploy for every PR.
25. Defend the architecture of Capstone 1 (RAG service) in an interview. 8 minutes, whiteboard. Hit: scaling, security, cost, observability, evals.

---

## What's next

After Chapter 10, you have built five real systems and answered 25 architecture questions. You are not "exam-prep ready" — you are *engineer ready*. Schedule the certifications with confidence; treat them as a paperwork formality compared to what you just built.

If you find a chapter that didn't stick, the answer is **not** to re-read it — it's to re-do its capstone exercises with Copilot at your side. Recall beats re-reading every time.

---
