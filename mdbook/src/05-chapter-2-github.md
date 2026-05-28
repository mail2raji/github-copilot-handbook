# Chapter 2 — GitHub Basics

> **You will:** use a *GitHub* repository (not just a Git repo) like a senior engineer — issues, PRs, code review, forks, releases, projects, discussions, and the social conventions that go with them.

> **Scenario:** You collaborate with a teammate on the RAG service. You open issues, raise PRs, review them, merge with the right strategy, cut a release, and use a Project board to track everything.

## 2.1 The four GitHub object types you must know

| Object | What it is | Lives where |
|---|---|---|
| **Repository** | a Git repo + GitHub metadata (issues, PRs, releases, settings) | `github.com/owner/repo` |
| **Issue** | a tracked unit of work (bug, feature, question) | `repo/issues/N` |
| **Pull request** | a proposal to merge one branch into another, with review + checks | `repo/pull/N` |
| **Discussion** | a non-tracked conversation (Q&A, RFC, idea) | `repo/discussions/N` |

🎯 **Exam tip — Foundations:** every PR is also an issue under the hood — they share a single numbering sequence. `repo/issues/42` and `repo/pull/42` cannot both exist.

## 2.2 Create a repo (three ways)

```powershell
# 1. From an existing local folder
gh repo create my-repo --public --source=. --push

# 2. Brand new on GitHub, clone locally
gh repo create my-repo --public --clone

# 3. From a template
gh repo create my-from-template --template=mail2raji/python-genai-agentic-handbook --public --clone
```

**Repository visibility:**

- **Public** — anyone on the internet can read. Forks allowed.
- **Private** — only invited collaborators.
- **Internal** — (GHE only) anyone in the enterprise can read.

🎯 **Exam tip — Admin:** *Internal* visibility is **only** available on GitHub Enterprise Cloud or Server.

## 2.3 Branch protection — the safety rail

Repo Settings → Branches → Add rule for `main`. Recommended for any AI/ML project:

- Require a pull request before merging
- Require at least 1 approving review
- Require status checks to pass (tests, lint, security scans)
- Require branches to be up to date before merging
- Require linear history (no merge commits)
- Require signed commits (for compliance-heavy orgs)
- Restrict who can push (admins + bots only)

Modern equivalent: **Rulesets** (Settings → Rules → Rulesets). Rulesets supersede classic branch protection and can target multiple repos at the org level.

🎯 **Exam tip — Admin:** rulesets are *org-scoped* and can run in **Active** or **Evaluate** (dry-run) mode. Classic branch protection is repo-scoped only.

## 2.4 Issues — track work properly

```powershell
gh issue create --title "Add hybrid retrieval (BM25 + embeddings)" --body "Plan: BM25 in retriever.py, re-rank top-50 with embeddings."
gh issue list
gh issue view 1
gh issue comment 1 --body "Started a spike on branch feat/bm25-retrieval"
gh issue close 1 --comment "Shipped in PR #4"
```

**Real-world feature template** — save as `.github/ISSUE_TEMPLATE/feature.yml`:

```yaml
name: Feature request
description: Propose a new capability for the agent
labels: ["enhancement"]
body:
  - type: textarea
    id: context
    attributes:
      label: Context
      description: What problem does this solve?
  - type: textarea
    id: proposal
    attributes:
      label: Proposal
      description: How would you build it?
  - type: dropdown
    id: priority
    attributes:
      label: Priority
      options: ["P0", "P1", "P2"]
```

## 2.5 Forks vs branches

- **Branch** — parallel line of development inside *your* repo. Use for your own work.
- **Fork** — server-side copy of *someone else's* repo into your namespace. Use to contribute upstream.

```powershell
gh repo fork openai/openai-python --clone
cd openai-python
git switch -c fix/typo-in-readme
# ...edit...
git commit -am "docs: fix typo"
git push -u origin fix/typo-in-readme
gh pr create --repo openai/openai-python --title "docs: fix typo" --body "Single-character fix"
```

## 2.6 Pull requests — the unit of change

A PR has four parts that matter for exams *and* daily work:

1. **Title + description** — explains *what* and *why*. Link the issue with `Fixes #42`.
2. **Diff** — the proposed code change.
3. **Conversation** — review comments, suggestions, requested changes.
4. **Checks** — automated runs from GitHub Actions (CI, CodeQL, Copilot review).

### Create + review from CLI

```powershell
gh pr create --base main --head feat/bm25-retrieval --title "feat: hybrid retrieval" --body "Closes #1"
gh pr list
gh pr checks
gh pr checkout 4
gh pr review 4 --approve --body "LGTM"
# or
gh pr review 4 --request-changes --body "Please add a unit test for the BM25 fallback."
```

### Merge strategies — choose carefully

| Strategy | Result | When to use |
|---|---|---|
| **Merge commit** | preserves branch graph; creates a merge commit | feature-branch teams |
| **Squash and merge** | collapses all PR commits into 1 | most projects — clean history |
| **Rebase and merge** | replays PR commits on top of `main`, no merge commit | linear history purists |

🎯 **Exam tip:** know which strategies a *branch protection rule* can disable. Any combination can be disabled at repo or org level.

## 2.7 Code review with Copilot

GitHub Copilot can be added as an automatic reviewer. Repo Settings → Code review → enable "Copilot code review". On the next PR, Copilot posts review comments within seconds. Use it for *first-pass* review (style, obvious bugs). Always require a human reviewer too.

## 2.8 Releases — ship a versioned artifact

```powershell
git tag -a v1.0.0 -m "First production-ready RAG service"
git push origin v1.0.0
gh release create v1.0.0 --title "v1.0.0 — Production RAG" --notes "First production-ready RAG service."
```

Attach binaries (e.g., a quantized model file) with `--file model-v1.onnx`. Automated in Chapter 4.

## 2.9 Projects — Kanban that knows about issues + PRs

GitHub Projects v2 is a flexible spreadsheet/board view that **automatically** updates when issues and PRs change state.

```powershell
gh project create --owner mail2raji --title "RAG roadmap"
gh project item-add 1 --owner mail2raji --url https://github.com/mail2raji/doc-rag/issues/1
```

Configure custom fields (Status, Priority, Sprint). Add automation: *when issue closed → set Status = Done*.

🎯 **Exam tip — Foundations:** Projects v2 are **user- or org-owned**, not repo-owned (a single project can span many repos). Classic projects were repo-scoped and are deprecated.

## 2.10 Discussions — async RFCs and Q&A

For *"should we switch from FAISS to LanceDB?"* — open a **discussion**, not an issue. Discussions are for *converging on a decision*; issues are for *tracked work*.

Categories you'll want for an AI repo: *Announcements, Ideas (RFC), Q&A, Show & Tell*.

## 2.11 The GitHub community — the part exams ask about

- **Stars** — bookmarks; a soft popularity signal.
- **Watch** — notifications for activity.
- **Sponsor** — financial support for maintainers (GitHub Sponsors).
- **Marketplace** — distribute Actions and Apps.
- **Gist** — share a single-file snippet (public or secret).
- **Profile README** — `mail2raji/mail2raji` repo with a `README.md` becomes your profile page.

🎯 **Exam tip — Foundations:** *secret gists* are not searchable but are **not** private — anyone with the link can read them. They are not for secrets.

## 2.12 Mini-quiz (10 questions)

1. Can a single repo have a `repo/issues/5` and `repo/pull/5` at the same time?
2. Which visibility levels are available on GitHub.com Free? Pro? Enterprise Cloud?
3. What is the modern replacement for classic branch protection?
4. Squash vs Rebase merge — when do you pick each?
5. Discussion vs Issue?
6. Can a Projects v2 board span multiple repositories?
7. Fork vs branch?
8. Is a "secret gist" private?
9. What does "require linear history" prevent?
10. Where do you enable Copilot code review?

Answers in [Phase2_GitHub_Basics/exercises.md](Phase2_GitHub_Basics/exercises.md).

## 2.13 Exercises (do all 8)

1. **End-to-end PR** — fork this handbook repo, fix a typo, open a PR, request a review, merge it (squash).
2. **Issue template** — add the YAML feature-request template above to your `doc-rag` repo. Open one issue using it.
3. **Branch protection** — protect `main`: require PRs, 1 approval, status checks. Try to push directly to `main` — it must fail.
4. **Ruleset** — convert the branch protection rule above to a ruleset. Verify it still blocks direct pushes.
5. **Release with artifact** — cut `v0.2.0` on `doc-rag`, attach a dummy `model.txt`.
6. **Project board** — create a Projects v2 board, add 3 issues, set 1 to "In progress" and watch its status auto-update.
7. **Discussion** — enable Discussions, open one RFC about which vector store to use.
8. **Profile README** — create the `<your-username>/<your-username>` repo with a README that lists your skills. Verify it shows on your profile.

---
