# Chapter 9 — Exam Prep: 5 mock exams (150+ questions)

> **You will:** take five mock exams — one for each certification. Each mock is 30 questions, mixing multiple-choice, multi-select, and scenario. Score yourself, then use the *answer + rationale* sections to plug gaps.

> **How to use:** read each question; commit to an answer *before* scrolling to the answers section. Score ≥ 80% to be ready; ≥ 90% to be confident.

### 🧒 If you were 10 years old

Taking a certification exam is like taking a **swimming test** to get the green wristband at the pool.

- You **read about** swimming for weeks (the chapters).
- You **practice** in the shallow end (the exercises).
- You take a **mock test** with a parent watching — if you get most laps right, you're ready (these 150 questions).
- The **real test** at the pool feels easy because you've already done harder ones at home.

The mock exams in this chapter are the *parent-watching* step. Take them seriously: time yourself, no peeking, then review *every* mistake.

### 🌍 Real-world situation — when to use this

**Situation:** You scheduled the **GitHub Foundations** exam for next Saturday. You have 5 days. Here is your 5-day plan using Mock A:

```text
Mon (60 min) — Take Mock A under exam conditions (no peeking, no Google).
                Score yourself honestly. Note every wrong answer.

Tue (60 min) — Re-read ONLY the chapter sections that map to the wrong answers.
                E.g. missed Q3 about staging? Re-read §1.1 "three trees".

Wed (45 min) — Take Mock A AGAIN. Aim for +10% on yesterday's score.
                If still < 80% on any topic, do that phase's exercises.md drills.

Thu (60 min) — Run through Appendix A cheat sheets out loud.
                Practice typing the top-20 git commands from memory.

Fri ( 0 min) — REST. Do NOT cram. The brain consolidates overnight.

Sat — Exam. You'll likely score 85-95%. Walk in calm.
```

The rhythm: *test → diagnose → fix → re-test → rest → ship.*

---

## 9.A Mock A — GitHub Foundations (30 Q)

### Questions

1. Which file marks a directory as a Git repository?
   - A. `.gitconfig`  B. `.gitignore`  C. `.git/`  D. `HEAD`

2. The staging index is...
   - A. a folder under `.git/objects/`
   - B. a snapshot of what the next commit will contain
   - C. a remote branch
   - D. the same as `HEAD`

3. Which command stages all modified tracked files but ignores untracked files?
   - A. `git add .`  B. `git add -u`  C. `git add -A`  D. `git stage -p`

4. A branch in Git is best described as:
   - A. a copy of files at a point in time
   - B. a pointer to a commit
   - C. a remote URL
   - D. a directory in `.git/`

5. Which command shows the staged vs last-commit diff?
   - A. `git diff`  B. `git diff HEAD`  C. `git diff --staged`  D. `git status`

6. `git pull` is equivalent to:
   - A. `git fetch` + `git merge` (default)
   - B. `git push` + `git pull`
   - C. `git stash` + `git apply`
   - D. `git revert HEAD`

7. Squash merge:
   - A. preserves all commits in the merge
   - B. replays commits on top of base
   - C. creates one commit with all PR changes
   - D. is the same as rebase

8. Issues and PRs share a numbering sequence — true or false?
9. Which gist visibility is searchable by Google?
   - A. private  B. internal  C. secret  D. public

10. To enable "Allow auto-merge" for PRs, you must:
    - A. be a repo admin
    - B. be a Copilot Pro user
    - C. have GHAS enabled
    - D. be using GHES

11. Branch protection can require all of EXCEPT:
    - A. signed commits  B. linear history  C. PR + 1 approval  D. all repos in the org

12. Which visibility is **NOT** available on `github.com` Free?
    - A. Public  B. Private  C. Internal  D. None of the above

13. What's the modern replacement for classic branch protection?
    - A. CODEOWNERS  B. Required workflows  C. Rulesets  D. CODEQL

14. The default branch on a new repo is:
    - A. `master`  B. `main`  C. configurable per user  D. `trunk`

15. Which file lives in `.github/` and routes review requests to teams?
    - A. CODEOWNERS  B. dependabot.yml  C. settings.yml  D. funding.yml

16. Forking a public repo:
    - A. makes the fork private
    - B. creates a server-side copy under your namespace
    - C. requires admin approval
    - D. is identical to cloning

17. The maximum size of a single file pushed to GitHub (no LFS):
    - A. 5 MB  B. 25 MB  C. 100 MB  D. 1 GB

18. Discussions are best for:
    - A. tracked work  B. CI/CD  C. async Q&A and RFCs  D. CVE disclosure

19. Which GitHub feature is best for Kanban-style project tracking across repos?
    - A. Issues  B. Projects v2  C. Milestones  D. Releases

20. Stars on a repo provide:
    - A. notifications on every push
    - B. a bookmark and a soft popularity signal
    - C. a paid sponsor relationship
    - D. write access

21. Codespaces:
    - A. runs locally only
    - B. is a cloud development environment
    - C. requires Copilot Enterprise
    - D. only works for JavaScript

22. `gh repo create` requires authentication via:
    - A. SSH key  B. PAT or `gh auth`  C. GPG  D. SAML always

23. Which is **NOT** a valid PR merge strategy?
    - A. Merge commit  B. Squash  C. Rebase  D. Cherry-pick

24. A repository template lets you:
    - A. version-control issues
    - B. create new repos with the template's files preserved
    - C. block PRs
    - D. fork without copying history

25. GitHub Sponsors lets you:
    - A. pay for compute
    - B. financially support maintainers
    - C. boost a repo in search
    - D. transfer repo ownership

26. The icon next to a username with a signed commit shows:
    - A. "Verified"  B. "GHAS"  C. "Bot"  D. "Admin"

27. To redirect contributors to a code of conduct, add:
    - A. CODEOWNERS  B. CODE_OF_CONDUCT.md  C. CONTRIBUTING.md  D. LICENSE

28. Which file in the repo root drives `pip` dep resolution for Dependabot?
    - A. `setup.py`  B. `pyproject.toml`  C. `requirements.txt`  D. all of the above

29. To pin an action to a specific commit (not a tag):
    - A. `uses: actions/checkout@v4`
    - B. `uses: actions/checkout@<full-sha>`
    - C. `uses: actions/checkout@main`
    - D. Cannot be done

30. Two-factor authentication is required for:
    - A. all GitHub.com users (as of the 2024 policy)
    - B. enterprise admins only
    - C. paid plans only
    - D. SSO users only

### Answers — Mock A

1. **C** — `.git/` is the marker directory.
2. **B** — the staging *index* is the next-commit snapshot.
3. **B** — `git add -u` stages modified tracked files; `-A` includes untracked.
4. **B** — a branch is a pointer to a commit.
5. **C** — `--staged` (alias `--cached`).
6. **A** — `pull` = `fetch` + `merge` by default.
7. **C** — squash merges all PR commits into one.
8. **True** — issues + PRs share one sequence.
9. **D** — public.
10. **A** — repo admin.
11. **D** — branch protection is per-repo (rulesets cover org-wide).
12. **C** — Internal is GHE only.
13. **C** — Rulesets.
14. **C** — `main` is the GitHub-wide default but configurable per user.
15. **A** — CODEOWNERS.
16. **B** — server-side copy under your namespace.
17. **C** — 100 MB (warn at 50 MB).
18. **C** — Discussions are async Q&A/RFC.
19. **B** — Projects v2.
20. **B** — bookmark + popularity signal.
21. **B** — cloud dev environment.
22. **B** — PAT or `gh auth`.
23. **D** — cherry-pick is not a PR merge strategy.
24. **B** — template copies files without history.
25. **B** — financial support for maintainers.
26. **A** — "Verified".
27. **B** — `CODE_OF_CONDUCT.md`.
28. **D** — Dependabot reads multiple manifests.
29. **B** — pin to full SHA.
30. **A** — 2FA is required for all GitHub.com users since 2024.

---

## 9.B Mock B — GitHub Copilot (30 Q)

### Questions

1. Which Copilot plan includes Knowledge Bases?
   - A. Pro  B. Pro+  C. Business  D. Enterprise

2. Which surface can run terminal commands?
   - A. Completions  B. Inline chat  C. Agent mode  D. Side-panel chat

3. Content exclusions are configured at:
   - A. user level  B. repo level only  C. org level  D. both repo and org

4. The public-code matching filter:
   - A. blocks completions that match public code above a length threshold
   - B. shows a license for every completion
   - C. blocks completions from public repos in the same org
   - D. is on by default for all plans

5. Business prompts are used to train base models:
   - A. always
   - B. only if the admin opts in
   - C. never
   - D. only on weekends

6. Which chat participant retrieves workspace context?
   - A. `@vscode`  B. `@github`  C. `@workspace`  D. `@terminal`

7. The path for repo-level custom instructions:
   - A. `.github/COPILOT.md`
   - B. `.github/copilot-instructions.md`
   - C. `copilot.config.json`
   - D. `.vscode/copilot.md`

8. Prompt files are invoked:
   - A. on every prompt
   - B. by the model picking them
   - C. by the user typing `/name`
   - D. via webhook

9. Skill files are selected:
   - A. by the user
   - B. by the model, based on description matching
   - C. by `mcp.json`
   - D. by VS Code settings

10. The Copilot CLI is included in:
    - A. Free  B. Pro  C. Pro+/Business/Enterprise  D. Enterprise only

11. The three `gh copilot suggest` targets:
    - A. shell, gh, git  B. shell, docker, k8s  C. shell, az, gcloud  D. shell, gh, terraform

12. `ghce` is shorthand for:
    - A. gh copilot edit  B. gh copilot explain  C. gh copilot execute  D. gh copy/echo

13. The Copilot agent loop:
    - A. plan → tool → observation → loop
    - B. tool → plan → loop
    - C. one-shot only
    - D. RAG only

14. MCP transports supported by Copilot:
    - A. stdio only  B. HTTP only  C. stdio + HTTP/SSE  D. WebRTC

15. Sampling in MCP:
    - A. is request sampling rate-limiting
    - B. is when the server asks the host LLM for a completion
    - C. is a metrics endpoint
    - D. is a Copilot-only feature

16. Which agentic pattern loops generator + evaluator?
    - A. ReAct  B. Router  C. Evaluator-optimizer  D. Plan-and-execute

17. Which model-selection feature is **Enterprise-only**?
    - A. Inline chat
    - B. Public-code filter
    - C. Custom models / fine-tunes
    - D. Slash commands

18. `/explain` slash command:
    - A. explains the open file or selection
    - B. explains the entire repo
    - C. explains chat history
    - D. explains Git history

19. Which is NOT a chat participant?
    - A. `@workspace`  B. `@github`  C. `@codebase`  D. `@terminal`

20. The Copilot CLI sends inference to:
    - A. local model  B. GitHub-hosted service on Azure  C. user's IDE  D. nowhere

21. Copilot Workspace is available in:
    - A. Free  B. Pro  C. Business  D. Enterprise (preview)

22. IP indemnity for Copilot is offered to:
    - A. all users  B. Pro+ and above  C. Business and above  D. Enterprise only

23. The model accountable for accepted code is:
    - A. the LLM  B. GitHub  C. the developer  D. the org admin

24. `.github/copilot-instructions.md`:
    - A. applies always to all chats in the repo
    - B. is invoked by `/instructions`
    - C. overrides org policy
    - D. only applies to PR review

25. The `/tests` slash command:
    - A. runs tests in the editor
    - B. generates tests for the selection
    - C. enables Test Explorer
    - D. is org-only

26. In agent mode, "approval mode" should be:
    - A. always off
    - B. on in unfamiliar repos
    - C. off in production
    - D. on only for Linux

27. Vision input in Copilot Chat lets you:
    - A. paste images for context
    - B. capture screen video
    - C. recognize handwriting only
    - D. nothing — not supported

28. To exclude a folder from Copilot context across the org:
    - A. add it to `.gitignore`
    - B. add it to a content exclusion rule
    - C. add a `nocopilot` file
    - D. nothing — Copilot reads everything

29. Telemetry can be disabled by:
    - A. only the org admin
    - B. the user via VS Code setting
    - C. only on Business/Enterprise
    - D. never

30. The Copilot completion latency requirement target is:
    - A. < 10 ms  B. < 200 ms typical  C. < 1 s typical  D. unspecified

### Answers — Mock B

1. **D** Enterprise  2. **C** Agent mode  3. **D** Both  4. **A**  5. **C** never  6. **C** `@workspace`  7. **B**  8. **C**  9. **B**  10. **C**
11. **A**  12. **B**  13. **A**  14. **C**  15. **B**  16. **C**  17. **C**  18. **A**  19. **C** (`@codebase` is not a chat participant; it's a chat variable like `#codebase`)  20. **B**
21. **D**  22. **C**  23. **C**  24. **A**  25. **B**  26. **B**  27. **A**  28. **B**  29. **B**  30. **C** (typical sub-second)

---

## 9.C Mock C — GitHub Actions (30 Q)

### Questions

1. `pull_request` vs `pull_request_target` — which has access to repo secrets on a fork PR?
   - A. `pull_request`  B. `pull_request_target`  C. both  D. neither

2. Which permission is needed for OIDC?
   - A. `contents: write`  B. `id-token: write`  C. `actions: write`  D. `pages: write`

3. Steps within a job run:
   - A. in parallel
   - B. sequentially
   - C. depends on `needs:`
   - D. depends on `strategy:`

4. Jobs within a workflow run by default:
   - A. in parallel
   - B. sequentially
   - C. only one at a time
   - D. with random order

5. `fail-fast: false`:
   - A. cancels all matrix combos on first failure
   - B. allows all matrix combos to run regardless of failures
   - C. retries the failed matrix combo
   - D. ignores all failures

6. Reusable workflow is invoked via:
   - A. `uses: ./.github/workflows/_x.yml`
   - B. `uses: org/repo/.github/workflows/x.yml@ref`
   - C. both
   - D. `run: gh workflow run`

7. Composite actions can:
   - A. run on any OS
   - B. only on Linux
   - C. only on Windows
   - D. only in containers

8. Docker container actions run on:
   - A. Linux only
   - B. Windows only
   - C. macOS only
   - D. all OS

9. `GITHUB_TOKEN`:
   - A. is org-owned and persistent
   - B. is workflow-scoped and short-lived
   - C. has full admin always
   - D. is user-impersonating

10. Org workflow permissions override repo permissions:
    - A. true  B. false  C. only for public repos  D. only for fork PRs

11. To deploy only after a manual approval:
    - A. use `if: github.event_name == 'workflow_dispatch'`
    - B. use an `environment:` with required reviewers
    - C. use `needs: approve`
    - D. use repository_dispatch

12. Self-hosted runners on public repos:
    - A. recommended
    - B. discouraged (security)
    - C. required for fork PRs
    - D. only on enterprise

13. Concurrency `cancel-in-progress: true` on production:
    - A. is best practice
    - B. is dangerous (partial deploys)
    - C. is forbidden
    - D. only works on self-hosted

14. Cache key changes are:
    - A. ignored — cache is overwritten
    - B. respected — new key creates a new cache; old cache is unchanged
    - C. concatenated
    - D. require manual eviction

15. `actions/upload-artifact@v4` is:
    - A. deprecated  B. the current major  C. only for releases  D. self-hosted only

16. `schedule:` cron timezone:
    - A. repo owner local time
    - B. UTC
    - C. configurable
    - D. runner local time

17. Required workflows are:
    - A. repo-level  B. org/enterprise-level  C. only for security scans  D. obsolete

18. The default `GITHUB_TOKEN` permissions can be set to:
    - A. read or write — at repo and org level
    - B. read only globally — cannot change
    - C. unrestricted
    - D. depends on workflow file

19. A reusable workflow can call another reusable workflow:
    - A. yes (up to a depth limit)
    - B. no
    - C. only same-repo
    - D. only with PAT

20. Outputs of one job can be consumed by another using:
    - A. `needs.<job>.outputs.<name>`
    - B. `env.<name>`
    - C. `vars.<name>`
    - D. `secrets.<name>`

21. To skip a workflow run:
    - A. include `[skip ci]` in the commit message
    - B. include `[skip actions]`
    - C. include `[ci skip]` or `[skip ci]`
    - D. there is no way

22. A matrix can be **dynamically** generated by:
    - A. `setup-matrix` action
    - B. a previous job's output piped via `fromJSON`
    - C. workflow_dispatch inputs only
    - D. cannot

23. Container jobs use:
    - A. `container:` key  B. `services:` key only  C. `runs-on:` with container image  D. composite action

24. Service containers are:
    - A. background containers attached to a job (e.g., postgres)
    - B. always shared across jobs
    - C. paid feature
    - D. self-hosted only

25. To prevent secret leakage in logs:
    - A. mask with `::add-mask::` and prefer env vars over command args
    - B. nothing — they are always masked
    - C. only enterprise can mask
    - D. avoid using secrets

26. Action authors should pin actions in workflows to:
    - A. branch
    - B. tag
    - C. commit SHA (most secure)
    - D. branch + tag

27. The Marketplace verified-creator badge means:
    - A. the action was audited by GitHub
    - B. the publisher is a verified org/user
    - C. all dependencies are pinned
    - D. it's a paid action

28. To restrict which actions a repo can use:
    - A. org / enterprise → Actions → "Allowed actions" policy
    - B. branch protection
    - C. `.github/actions-allowlist.yml`
    - D. cannot

29. Workflow run retention default:
    - A. 30 days  B. 60 days  C. 90 days (configurable)  D. 365 days

30. `$GITHUB_STEP_SUMMARY`:
    - A. Markdown that appears on the workflow run page  B. JSON log  C. SARIF file  D. nothing — deprecated

### Answers — Mock C

1. **B**  2. **B**  3. **B**  4. **A**  5. **B**  6. **C**  7. **A**  8. **A**  9. **B**  10. **A**
11. **B**  12. **B**  13. **B**  14. **B**  15. **B**  16. **B**  17. **B**  18. **A**  19. **A** (4-level depth limit)  20. **A**
21. **C**  22. **B**  23. **A**  24. **A**  25. **A**  26. **C**  27. **B**  28. **A**  29. **C**  30. **A**

---

## 9.D Mock D — GitHub Advanced Security (30 Q)

### Questions

1. Secret scanning + push protection blocks:
   - A. on push, before the secret hits the server
   - B. only at the next CI run
   - C. only if a webhook exists
   - D. nothing — it just alerts

2. CodeQL default setup:
   - A. is fully customizable
   - B. is one-click with sensible defaults
   - C. only runs on `main`
   - D. uploads no SARIF

3. CodeQL supports:
   - A. only JavaScript  B. only compiled languages  C. multiple including Python, Java, Go, Ruby, Swift  D. only enterprise repos

4. Copilot Autofix is:
   - A. an LLM-based remediation suggestion on code scanning alerts
   - B. a Dependabot feature
   - C. enterprise-only
   - D. open-source

5. Dependabot security updates open:
   - A. an alert only
   - B. a PR fixing a vuln dependency
   - C. an enterprise-only ticket
   - D. nothing — manual

6. Dependabot version updates are:
   - A. GHAS-only  B. free for all users  C. paid add-on  D. self-hosted only

7. Custom secret-scanning patterns:
   - A. can be dry-run before going live
   - B. cannot be tested
   - C. apply only to private repos
   - D. require a PAT

8. After a secret is detected, you must:
   - A. delete the commit
   - B. force-push history rewrite
   - C. rotate the secret (always)
   - D. nothing

9. Code scanning alerts can be dismissed with reasons:
   - A. won't fix, false positive, used in tests
   - B. only "fixed"
   - C. only by admins
   - D. permanently — cannot reopen

10. SARIF stands for:
    - A. Static Analysis Results Interchange Format
    - B. Security Audit Results In File
    - C. Secure Action Runtime Information Format
    - D. none

11. Security overview is scoped to:
    - A. repo only  B. user only  C. org/enterprise  D. all of the above

12. A draft security advisory:
    - A. is public immediately
    - B. is private until published; can request CVE
    - C. only for open-source repos
    - D. requires a PAT

13. Push protection bypass:
    - A. is impossible
    - B. requires a reason and is logged
    - C. is admin-only with no logging
    - D. needs a PAT

14. `github/codeql-action/upload-sarif@v3`:
    - A. uploads third-party scanner output as code scanning alerts
    - B. is deprecated
    - C. only for CodeQL
    - D. is for runtime tracing

15. CodeQL queries `security-extended` vs `security-and-quality`:
    - A. extended is broader; quality adds maintainability/code-quality queries
    - B. they are aliases
    - C. quality is for QA repos only
    - D. extended runs in parallel

16. Dependency graph is enabled:
    - A. by default for public repos
    - B. never automatically
    - C. only for Enterprise
    - D. requires a Dependabot config

17. Dependency review action:
    - A. blocks PR if it introduces a vulnerable dep
    - B. runs only after merge
    - C. is GHAS-only on private repos
    - D. both A and C

18. Secret scanning historical scan covers:
    - A. only current `main`
    - B. all branches and full history (configurable)
    - C. only the last 90 days
    - D. only the user's commits

19. Push protection supports patterns from:
    - A. only GitHub's partner list
    - B. partner list + custom patterns
    - C. CodeQL only
    - D. PATs only

20. Code scanning re-runs:
    - A. always on every push
    - B. on configured triggers (push, PR, schedule)
    - C. only weekly
    - D. only manually

21. GHAS metrics expose:
    - A. PR review times
    - B. open vs closed alerts, time-to-remediate
    - C. user commit counts
    - D. cost

22. CodeQL languages requiring autobuild include:
    - A. only Java
    - B. compiled languages like Java, C/C++, Swift
    - C. all languages
    - D. none

23. A custom pattern matching `vlt-[A-Z0-9]{32}` is:
    - A. invalid regex
    - B. valid; needs a test string and (optional) publishing
    - C. requires CodeQL
    - D. enterprise-only

24. Code scanning alert severity comes from:
    - A. CVE only
    - B. the rule definition (CodeQL property)
    - C. number of paths
    - D. the user

25. To require CodeQL to pass before merge:
    - A. require status check `CodeQL` in branch protection or ruleset
    - B. nothing — automatic
    - C. write a webhook
    - D. use a label

26. Container security scanning on GitHub:
    - A. supports Trivy/Anchore via SARIF upload
    - B. is built into Dependabot
    - C. only for `dockerfile` syntax errors
    - D. unavailable

27. Code scanning autofix PR creation:
    - A. is always automatic
    - B. is suggested by Copilot Autofix; user reviews
    - C. only for Python
    - D. requires Pro+

28. Secret scanning false positives:
    - A. can be marked as such (per-secret)
    - B. cannot be marked
    - C. only org admin can
    - D. close automatically

29. To audit who bypassed push protection:
    - A. read the audit log; bypass events are recorded
    - B. there is no log
    - C. only via webhook
    - D. only via SIEM

30. CodeQL pack:
    - A. a reusable bundle of queries
    - B. a Docker image
    - C. a SARIF profile
    - D. a CVE feed

### Answers — Mock D

1. **A**  2. **B**  3. **C**  4. **A**  5. **B**  6. **B**  7. **A**  8. **C**  9. **A**  10. **A**
11. **C**  12. **B**  13. **B**  14. **A**  15. **A**  16. **A**  17. **D**  18. **B**  19. **B**  20. **B**
21. **B**  22. **B**  23. **B**  24. **B**  25. **A**  26. **A**  27. **B**  28. **A**  29. **A**  30. **A**

---

## 9.E Mock E — GitHub Administration (30 Q)

### Questions

1. SAML alone:
   - A. provisions and deprovisions users
   - B. authenticates only
   - C. both
   - D. neither

2. SCIM:
   - A. authentication only
   - B. automated provisioning + deprovisioning
   - C. only logging
   - D. only for GHES

3. Classic PATs:
   - A. expire by default
   - B. never expire by default; broad scopes
   - C. are tied to a single repo
   - D. are deprecated

4. Fine-grained PATs:
   - A. expire and are repo-scoped
   - B. cannot access actions
   - C. only for read
   - D. require GHES

5. Enterprise audit log default retention:
   - A. 30 days  B. 90 days  C. 6 months  D. forever

6. Org-level base permission for repos defaults to:
   - A. none (no access)  B. read  C. write  D. admin

7. CODEOWNERS file location:
   - A. `/.github/CODEOWNERS`  B. `/CODEOWNERS`  C. `/docs/CODEOWNERS`  D. all of the above

8. Required reviewers for an environment:
   - A. up to 6 users/teams
   - B. unlimited
   - C. exactly 1
   - D. zero allowed

9. Required workflows:
   - A. repo-level
   - B. enterprise-level injected into selected repos
   - C. user-level
   - D. obsolete

10. Audit log streaming:
    - A. supports Splunk, Azure Event Hubs, Datadog, S3 (and similar)
    - B. is enterprise-only
    - C. is enabled by default
    - D. both A and B

11. Outside collaborator:
    - A. is org member
    - B. is invited per-repo only
    - C. has admin everywhere
    - D. is the same as a bot

12. To enforce 2FA for the org:
    - A. Org → Authentication security → require 2FA
    - B. via PAT
    - C. via SAML metadata only
    - D. it cannot be enforced

13. Rulesets target:
    - A. branches only
    - B. tags only
    - C. branches *and* tags
    - D. files

14. Ruleset enforcement modes:
    - A. active, evaluate, disabled
    - B. on / off
    - C. strict / lax
    - D. learn / enforce

15. Migration tool of choice from ADO / GitLab to GitHub Cloud:
    - A. GitHub Enterprise Importer (GEI)
    - B. ghe-migrator
    - C. git-svn
    - D. none

16. GHES upgrade cadence:
    - A. weekly  B. monthly patches, quarterly major  C. annually  D. ad hoc

17. To block a non-verified action publisher org-wide:
    - A. Org → Actions → "Allow GitHub Actions and verified creators only"
    - B. branch protection
    - C. dependabot
    - D. CodeQL

18. Runner groups:
    - A. org/enterprise feature to scope self-hosted runners to repos
    - B. classify GitHub-hosted runners
    - C. labels only
    - D. obsolete

19. OIDC subject claim customization:
    - A. allows narrowing the federated trust (e.g., per env)
    - B. is for SAML only
    - C. removes id-token entirely
    - D. is unrelated

20. IP allow list:
    - A. blocks pushes from outside approved IPs
    - B. blocks reads
    - C. only for SSO
    - D. unavailable

21. Personal-account repos can have:
    - A. teams  B. organizations  C. neither  D. both

22. To prevent forks of internal repos:
    - A. set repo forking policy at org level
    - B. cannot
    - C. only with GHAS
    - D. with a webhook

23. Suspended user:
    - A. can still push  B. cannot sign in  C. is deleted  D. only on GHES

24. Org-level secrets:
    - A. shared with all repos in the org
    - B. only available to selected repos
    - C. both A and B (configurable)
    - D. none

25. SSO-enforced PAT:
    - A. must be authorized for SSO to access SSO-protected resources
    - B. can never be used
    - C. is automatic
    - D. only for GHES

26. Required signed commits:
    - A. set via branch protection / rulesets
    - B. set per-user
    - C. unavailable
    - D. only on `main`

27. Service accounts on GitHub:
    - A. cost full per-seat
    - B. cost half a seat
    - C. are free
    - D. unsupported (use GitHub Apps)

28. Audit log includes:
    - A. user impersonation actions
    - B. failed pushes
    - C. branch protection changes
    - D. all of the above

29. Enterprise managed users (EMU):
    - A. accounts that exist only in the enterprise, not on github.com public
    - B. accounts shared across enterprises
    - C. obsolete
    - D. dev-only

30. To enforce a code scanning workflow across 100 repos:
    - A. use a required workflow at enterprise level
    - B. add the workflow file to each repo manually
    - C. branch protection
    - D. webhook

### Answers — Mock E

1. **B**  2. **B**  3. **B**  4. **A**  5. **C**  6. **B** (default is *Read*)  7. **D**  8. **A**  9. **B**  10. **D**
11. **B**  12. **A**  13. **C**  14. **A**  15. **A**  16. **B**  17. **A**  18. **A**  19. **A**  20. **A**
21. **C**  22. **A**  23. **B**  24. **C**  25. **A**  26. **A**  27. **D**  28. **D**  29. **A**  30. **A**

---

## 9.F Scoring + how to interpret your results

For each mock:

| Score | What to do |
|---|---|
| 0–60% | Re-read the corresponding chapter. Redo exercises. Take the mock again next week. |
| 60–80% | Find the topics you missed. Re-read just those sections. Take a single retry. |
| 80–90% | You can pass — but margin is thin. Read flagged Phase 10 capstones for confidence. |
| 90–100% | You are exam-ready. Schedule the exam. |

🎯 **The fastest path to confidence:** when you miss a question, write *the rationale of the right answer* in your own words. Studies show this lifts retention more than reading the answer twice.

## 9.G Cheat sheets (memorize the day before)

### Git
```
init    clone   add   commit   status   log
diff    diff --staged   restore   reset   revert
branch  switch -c   merge   rebase   cherry-pick
stash   push   pull   fetch   tag   blame
```

### GitHub Actions
```
on:       push | pull_request | pull_request_target | schedule | workflow_dispatch | workflow_call
permissions:  contents | id-token | packages | pages | security-events
matrix:   strategy.matrix.* + include / exclude + fail-fast: false
secrets:  ${{ secrets.X }}     vars: ${{ vars.X }}     env: ${{ env.X }}
env vars: GITHUB_TOKEN GITHUB_SHA GITHUB_REF GITHUB_RUN_ID GITHUB_STEP_SUMMARY
```

### Copilot
```
surfaces: completions | inline chat | side chat | agent | github.com | CLI
config:   .github/copilot-instructions.md   .github/prompts/*.prompt.md   .github/skills/<n>/SKILL.md
MCP:      .vscode/mcp.json   transports: stdio + http/sse
```

### Security
```
secret scanning   push protection   custom patterns
CodeQL: default vs advanced; queries: security-extended / security-and-quality
Dependabot: alerts | security updates | version updates
ruleset enforcement: active | evaluate | disabled
```

---
