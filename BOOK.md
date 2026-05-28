<a id='title-page'></a>

# GitHub, Git & Copilot for GenAI / Agentic AI

## The Hands-On Handbook

### From Zero to Five GitHub Certifications — and Production Agents

A complete, hands-on, real-world book that takes you from "I have never used Git" to passing **GitHub Foundations**, **GitHub Copilot**, **GitHub Actions**, **GitHub Advanced Security**, and **GitHub Administration** — and being able to ship the GenAI / agentic systems they test.

---

**Author:** mail2raji
**Edition:** 1.0
**Date:** 2026
**License:** MIT (text) / MIT (code)

---

> *"The best way to predict your code's future is to commit it."* — every senior engineer, ever.

---

## Table of Contents

- [Preface](#preface)
- [How to read this book](#how-to-read-this-book)
- [Chapter 0 — Setup](#chapter-0)
- [Chapter 1 — Git Fundamentals](#chapter-1)
- [Chapter 2 — GitHub Basics](#chapter-2)
- [Chapter 3 — Intermediate Git](#chapter-3)
- [Chapter 4 — GitHub Actions for AI/ML projects](#chapter-4)
- [Chapter 5 — GitHub Copilot for GenAI](#chapter-5)
- [Chapter 6 — GitHub Copilot CLI](#chapter-6)
- [Chapter 7 — Building Agentic AI with Copilot, MCP & Skills](#chapter-7)
- [Chapter 8 — GitHub Advanced Security + Administration](#chapter-8)
- [Chapter 9 — Exam Prep: 5 mock exams, 150+ questions](#chapter-9)
- [Chapter 10 — Advanced Capstone: 5 production projects, 25 architecture exercises](#chapter-10)
- [Appendix A — Cheat sheets](#appendix-a)
- [Appendix B — Glossary](#appendix-b)
- [Appendix C — Further reading](#appendix-c)

---

<a id='preface'></a>

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

<a id='how-to-read-this-book'></a>

# How to read this book

There are four sensible reading paths:

### Path A — "I'm brand new"
Read Chapters 0 → 10 in order. Do every 🔧 *Try it*. Take Mock A after Chapter 9.

### Path B — "I know basic Git but want Copilot mastery"
Skim Chapters 1–3. Go deep on 5, 6, 7. Then circle back for the exam mocks.

### Path C — "I'm here only for an exam"
- **Foundations** → Ch 1, 2, 3, 4 §4.1–4.2, 8 §8.1, then Mock A.
- **Copilot** → Ch 5, 6, 7, then Mock B.
- **Actions** → Ch 4 in full, then Mock C.
- **GHAS** → Ch 8 §8.1–8.6, then Mock D.
- **Administration** → Ch 8 §8.7–8.11, then Mock E.

### Path D — "I want to architect production AI systems on GitHub"
Read Chapter 10 first, identify which capstone matches your problem, then read the chapters it references.

Estimated effort: 40–80 hours of focused practice across all five certifications. There is no fixed schedule — **stop reading and start running commands** as soon as you finish a section.

---

<a id='chapter-0'></a>

# Chapter 0 — Setup

> **You will:** install Git, GitHub CLI, VS Code, GitHub Copilot, and GitHub Copilot CLI, then prove they work by making your first commit and asking Copilot a question.

### 🧒 If you were 10 years old

Imagine you are building a giant Lego castle. Every time you finish a part, you take a photo of it. If you knock it over, you can rebuild it from the photo. **Git is the camera.** **GitHub is the cloud album** where the photos live, so you and your friends can both see them.

- **Git** = the camera on your desk.
- **GitHub** = the photo album online.
- **GitHub Copilot** = a smart helper sitting next to you, suggesting which Lego brick to use next.
- **GitHub Copilot CLI** = the same helper, but in the terminal — like a magic typewriter that knows commands.

Once all four are installed, you can build, save, share, and get help — never alone.

### 🌍 Real-world situation — when to use this

**Situation:** You just joined a new team building a chatbot. The senior engineer says *"clone the repo, make your branch, push your first PR by end of week."* You panic — none of those words are in your vocabulary yet.

**What this chapter does:** by the end of Setup, you can run all of these and they just work:

```powershell
git clone https://github.com/the-team/chatbot.git
cd chatbot
git switch -c feat/improve-greeting
code .                            # opens the project; Copilot starts suggesting
gh copilot suggest "create a Python venv and install requirements"
```

You are now ready to type, save, and ship code on day 1.

## 0.1 Install Git

Git is the version-control engine. It is **local-first**: every commit happens on your laptop, before anything reaches GitHub.

**Windows (PowerShell):**

```powershell
winget install --id Git.Git -e
git --version
```

**macOS:** `brew install git` — **Linux:** `sudo apt install -y git`.

### Tell Git who you are

```powershell
git config --global user.name  "Your Name"
git config --global user.email "you@example.com"
git config --global init.defaultBranch main
git config --global pull.rebase false
git config --global core.autocrlf true
git config --global core.editor "code --wait"
```

🎯 **Exam tip — Foundations:** `git config --global` writes to `~/.gitconfig`; `--system` writes machine-wide; `--local` writes to `.git/config`. Local overrides global overrides system.

## 0.2 Install GitHub CLI (`gh`)

```powershell
winget install --id GitHub.cli -e
gh --version
gh auth login
```

`gh` is the bridge between your terminal and `github.com` and also installs the credential helper so `git push` stops asking for passwords.

## 0.3 Install VS Code + Copilot

Install VS Code, then add three extensions:

1. **GitHub Copilot** — inline completions.
2. **GitHub Copilot Chat** — chat panel, inline chat, agent mode.
3. **GitHub Pull Requests and Issues** — PR review inside the editor.

Sign in with the GitHub account that has Copilot enabled.

## 0.4 Install GitHub Copilot CLI

```powershell
gh extension install github/gh-copilot
gh copilot --version
gh copilot suggest "find all files larger than 100 MB"
```

If you see "not entitled", the account does not have a Copilot license. Sign up at `github.com/features/copilot`.

## 0.5 Your first commit

```powershell
mkdir hello-genai ; cd hello-genai
git init
"# Hello GenAI" | Out-File README.md
git add README.md
git commit -m "chore: initial commit"
git log --oneline
```

Push it to GitHub:

```powershell
gh repo create hello-genai --public --source=. --remote=origin --push
```

You just published your first repo.

## 0.6 Your first Copilot question

In VS Code: `Ctrl+Alt+I` → open Copilot Chat → ask:

> *"What is the difference between `git merge` and `git rebase`? One-paragraph plain-English answer."*

In the terminal:

```powershell
gh copilot suggest "create a python virtual environment and install openai"
```

🔧 **Try it — Chapter 0 drills**

1. Run `git config --list --show-origin` and find which file holds your name and email.
2. Run `gh auth status` — verify the right account.
3. Run `gh copilot explain "git push --force-with-lease origin main"` and read the explanation.
4. In Copilot Chat, ask for a `.gitignore` for a Python + PyTorch + Hugging Face datasets project. Save it.

---

<a id='chapter-1'></a>

# Chapter 1 — Git Fundamentals

> **You will:** learn the 20 Git commands that cover 99% of daily work, the mental model that makes them click, and the real-world GenAI workflows where each one shines.

> **Scenario:** You are building a small RAG (Retrieval Augmented Generation) service that answers internal documentation questions. You version-control the code, isolate experiments on branches, and recover from a bad commit — all without leaving the terminal.

### 🧒 If you were 10 years old

Think of Git as your homework notebook with **magical save-points**.

- Every time you finish a sentence you want to keep, you say **`git add`** — that's putting the page on your teacher's desk.
- When the teacher stamps the page, you say **`git commit`** — now it is officially saved.
- If your dog scribbles on the page later, you say **`git checkout`** — the magical eraser brings the stamped version back.
- If you want to try a different ending to your story without ruining the original, you say **`git switch -c alt-ending`** — that's a parallel notebook, just for the experiment.
- When the experiment works, you **merge** it back. When it doesn't, you delete that notebook and the original is untouched.

Git is *time travel + parallel universes* for your homework.

### 🌍 Real-world situation — when to use this

**Situation:** You are tweaking the RAG retrieval prompt. Version 1 returns 60% accuracy. You try version 2 (with HyDE). It dips to 55%. Without Git, you'd have to re-type version 1 from memory. With Git, you do:

```powershell
# I'm happy with the current code — stamp it.
git add src/retriever.py
git commit -m "baseline retriever — 60% accuracy on eval set"

# Try a risky experiment on a side branch.
git switch -c experiment/hyde-retrieval
# ...edit, run eval...
git add -A; git commit -m "HyDE retrieval — drops to 55%"

# Experiment failed. Throw it away and return to the good version.
git switch main
git branch -D experiment/hyde-retrieval
```

You kept the working code, tried something bold, and recovered in 3 seconds. **Git is your safety net for every experiment.**

## 1.1 The Git mental model — three trees and one graph

Every Git operation moves data between four locations:

```
Working tree  --git add-->  Staging index  --git commit-->  Local HEAD  --git push-->  Remote (GitHub)
```

- **Working tree** — files on disk you are editing.
- **Staging index** — a snapshot of *what will be in the next commit*. The single most-misunderstood concept in Git.
- **Local HEAD** — your most recent commit on the current branch (a node in the local commit graph).
- **Remote** — GitHub's copy of the commit graph.

Commits form a **directed acyclic graph (DAG)** of snapshots; a *branch* is just a movable pointer to a node in that graph; `HEAD` points to *where you are right now*.

🎯 **Exam tip:** Foundations and Admin exams love "branch is a movable pointer". If you remember nothing else, remember that.

## 1.2 The first 10 commands you need

| # | Command | What it does | Typical use |
|---|---|---|---|
| 1 | `git init` | create a `.git/` in current folder | start a new project |
| 2 | `git clone <url>` | copy a remote repo | start work on an existing project |
| 3 | `git status` | what is staged, modified, untracked | run before *every* commit |
| 4 | `git add <path>` | stage changes | choose what to commit |
| 5 | `git commit -m "msg"` | record a snapshot | save your work |
| 6 | `git log --oneline --graph --all` | show history | "how did we get here?" |
| 7 | `git diff` | unstaged vs working | review before staging |
| 8 | `git diff --staged` | staged vs last commit | review before committing |
| 9 | `git push` | upload commits | share with team |
| 10 | `git pull` | download + integrate | catch up before working |

Memorize numbers **3, 4, 5, 9, 10**. They are 80% of daily Git.

## 1.3 The GenAI scenario, step by step

```powershell
mkdir doc-rag ; cd doc-rag
git init
"openai==1.30.*" | Out-File requirements.txt
"print('hello rag')" | Out-File app.py
git status
git add requirements.txt app.py
git commit -m "feat: minimal OpenAI chat client"
git log --oneline
```

⚠️ **Production gotcha:** notice we did *not* commit a `.env` with the API key. The single most common GitHub secret leak is an `.env` committed by accident. Fix in §1.6.

## 1.4 Branching — your safety net for experiments

```powershell
git switch -c feat/bm25-retrieval    # create and switch
# ...edit files...
git add . ; git commit -m "feat: add BM25 retrieval"
git switch main                      # back to main
git log --oneline --all --graph
```

If your experiment fails: `git branch -D feat/bm25-retrieval`.

🎯 **Exam tip:** `git switch` is the modern verb (Git 2.23+). `git checkout` still works and exams may show either. Know both.

### Merge the branch back

```powershell
git switch main
git merge feat/bm25-retrieval
git branch -d feat/bm25-retrieval
```

If `main` has moved, Git creates a **merge commit** with two parents. That is how the DAG branches.

## 1.5 Pull, push, fetch — and the difference

```powershell
git fetch origin           # safe: only updates remote-tracking branches
git pull origin main       # fetch + merge (or rebase, per config)
git push origin main       # upload local commits
```

⚠️ **Gotcha:** `pull.rebase=true` rewrites commits — never use on a branch others pull from.

## 1.6 Ignoring files — `.gitignore`

For our RAG project, a `.gitignore` should cover:

```
# Python
__pycache__/
*.pyc
.venv/

# Secrets — never commit
.env
*.key
*.pem

# Data + models — too big for Git
data/
*.parquet
models/
*.onnx
*.gguf

# IDE
.vscode/
.idea/
```

If a file is already tracked, adding it to `.gitignore` does *not* remove it:

```powershell
git rm --cached .env
git commit -m "chore: untrack accidentally committed .env"
```

🎯 **Exam tip — GHAS:** if you committed a secret then deleted it, **rotating the secret is mandatory**. Git history retains it. Proper history rewrite in Chapter 3 §3.7.

## 1.7 Tags — mark a model version

```powershell
git tag -a v0.1.0 -m "First evaluable RAG model"
git push origin v0.1.0
```

Tags are immutable pointers — perfect for *"this is the exact commit that produced model-v0.1.0.onnx"*.

## 1.8 Undoing — the seven rescues

| Mistake | Rescue |
|---|---|
| Wrote rubbish in a file | `git restore <file>` |
| Staged something by accident | `git restore --staged <file>` |
| Bad last commit message | `git commit --amend -m "new msg"` |
| Forgot a file in last commit | `git add file ; git commit --amend --no-edit` |
| Undo last commit but keep changes | `git reset --soft HEAD~1` |
| Undo last commit *and* discard changes | `git reset --hard HEAD~1` (destructive) |
| Pushed a bad commit to a shared branch | `git revert <sha>` (safe inverse commit) |

⚠️ **Gotcha:** `git reset --hard` after `git push` rewrites history. Use `revert` on shared branches. Always.

## 1.9 Reading the log like a senior engineer

```powershell
git log --oneline --graph --decorate --all
git log -p app.py
git log --since="1 week ago" --author="you@example.com"
git blame app.py
```

`git blame` is not blame — it is **archaeology**. When debugging weird agent behavior, `git blame` answers *"when did this prompt change?"* in two seconds.

## 1.10 Common conflicts and how to resolve them

When two branches edit the same lines, `git merge` stops with conflict markers like:

```
<<<<<<< HEAD
top_k = 5
=======
top_k = 8
>>>>>>> feat/tune-retrieval
```

Workflow: open the file, edit to the version you want, delete the markers, `git add <file>`, `git commit`. VS Code's merge editor and `gh copilot suggest "resolve this conflict"` both help.

## 1.11 Mini-quiz (10 questions)

1. Where does `git config --global` write?
2. Staging index vs working tree — what's the difference?
3. When does `git pull` rewrite history?
4. Command to undo the last commit but keep changes staged?
5. Why is `git revert` safer than `git reset --hard` on a shared branch?
6. Is a branch a copy of files, or a pointer?
7. Command to show the patch for a single file across history?
8. How do you stop tracking a file that is already committed but should be ignored?
9. What is `HEAD`?
10. Difference between `git fetch` and `git pull`?

Answers in [Phase1_Git_Fundamentals/exercises.md](Phase1_Git_Fundamentals/exercises.md).

## 1.12 Exercises (do all 8)

1. **Repo from scratch** — make a `genai-cookbook` with a Python file, `.gitignore`, two commits, annotated tag `v0.1.0`. Push to GitHub.
2. **Branching drill** — on `feat/prompt-v2`, change a prompt string, commit, switch back to main, then back to the branch. Verify two branches in `git log --all --graph`.
3. **Recover** — make a bad commit, then a good commit, then realize the bad one shouldn't be there. Use `git revert` (not `reset`) to undo it.
4. **Stage subset** — modify three files. Commit two in one commit, the third in a separate commit.
5. **Conflict practice** — on two branches change the same line, then merge. Resolve manually.
6. **Restore** — delete `app.py`. Use `git restore` to bring it back.
7. **Audit** — pick any file, `git blame`, identify the date of the most recent change to line 1.
8. **Tag and push** — annotated tag `v0.2.0`, push it, verify on GitHub.

---

<a id='chapter-2'></a>

# Chapter 2 — GitHub Basics

> **You will:** use a *GitHub* repository (not just a Git repo) like a senior engineer — issues, PRs, code review, forks, releases, projects, discussions, and the social conventions that go with them.

> **Scenario:** You collaborate with a teammate on the RAG service. You open issues, raise PRs, review them, merge with the right strategy, cut a release, and use a Project board to track everything.

### 🧒 If you were 10 years old

Think of GitHub as **Google Docs for code**, but with extra superpowers:

- A **repository** is one Google Doc — the project.
- An **issue** is a sticky note on the doc: *"please fix the typo on page 3."*
- A **pull request** is when you write the fix on a copy of the doc and ask, *"can my fix replace the original page 3?"* — a friend reviews it before saying yes.
- A **fork** is when you take the whole doc home, change it however you like, and only show the changes you want to share.
- A **release** is when you stamp a version: *"This is the storybook we read at the school play. Don't touch it."*
- A **project board** is the To-Do / Doing / Done columns on the classroom whiteboard.

You and your friends can work on the same project at the same time *without* sending zip files back and forth.

### 🌍 Real-world situation — when to use this

**Situation:** Your teammate added a new evaluation script but it broke the CI. You file an issue, fix it on a branch, open a PR, request your teammate's review, merge it, and tag a release — all from the terminal:

```powershell
# 1. File the bug as an issue
gh issue create --title "eval.py crashes on empty results" \
                --body  "Stack trace shows IndexError when retrieval returns 0 docs." \
                --label bug

# 2. Branch + fix
git switch -c fix/eval-empty-results
# ...edit eval.py...
git commit -am "fix(eval): guard against empty result list"
git push -u origin fix/eval-empty-results

# 3. Open the PR, request review, watch checks
gh pr create --fill --reviewer teammate-handle
gh pr checks --watch

# 4. Once approved + green, merge with a clean history
gh pr merge --squash --delete-branch

# 5. Cut a release
gh release create v0.2.1 --notes "Fixes empty-results crash in eval.py"
```

That's the full **collaborative loop** — and you never left the terminal.

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

<a id='chapter-3'></a>

# Chapter 3 — Intermediate Git

> **You will:** master rebase, cherry-pick, stash, reflog, bisect, submodules, worktrees, hooks, and history-rewrite — the commands that separate a *junior* from a *senior* engineer.

> **Scenario:** Your RAG service is now a team project. You will keep history clean across many parallel feature branches, recover deleted commits, bisect a regression in retrieval accuracy, and pre-commit-block accidentally committed OpenAI keys.

### 🧒 If you were 10 years old

Imagine you and a friend are both writing chapters of the same comic book at the same time.

- **`git merge`** is like glueing both of your chapters into one comic in order: *"Here is mine, here is yours, then a glue page that says we joined them."*
- **`git rebase`** is like asking, *"Hey, what if I redrew my chapter so it pretends I drew it AFTER yours, with no glue page?"* Cleaner — but you must redraw carefully.
- **`git cherry-pick`** is *"I love just this one panel of your chapter — let me copy it into mine."*
- **`git stash`** is *"My mom called dinner — let me toss these half-finished panels into a drawer for later."*
- **`git reflog`** is the **secret diary of every move you made**, so you can always rewind, even if you tore the page out.
- **`git bisect`** is *"Somewhere between page 1 and page 50, the comic stopped being funny. Let me jump to page 25, check, then page 12, then page 6..."* — a smart binary search.

These tools let you **never panic** when team comics get messy.

### 🌍 Real-world situation — when to use this

**Situation:** A nightly evaluation just dropped accuracy from 92% to 78%. You don't know which of the last 40 commits broke it. With `git bisect`, you find the culprit in 6 tries:

```powershell
# Tell Git: this commit is bad, that one was good.
git bisect start
git bisect bad  HEAD
git bisect good v0.5.0

# Git now checks out a commit halfway between them.
# Run the eval. If accuracy <90%, mark bad; else good.
python eval.py --quick
git bisect bad     # or: git bisect good

# Repeat 5 more times — Git narrows it down logarithmically.
# Final output: "abc1234 is the first bad commit"
git bisect reset
```

Without `bisect`, you'd be checking commits one at a time for hours. With it, you find the broken commit in **log₂(40) ≈ 6 steps**.

## 3.1 Rebase vs merge — when to choose which

Both bring two branches together. They produce *different history*.

```
Before (you are on feat/x):

main:         A---B---C
                       \
feat/x:                 D---E

git merge main:
main:         A---B---C
                       \   \
feat/x:                 D---E---M    (M is a merge commit with parents C and E)

git rebase main:
main:         A---B---C
                       \
feat/x:                 D'--E'        (D' and E' are *new* commits replayed on C)
```

| Choose | When |
|---|---|
| **merge** | shared, public branches; preserves the literal history of who did what |
| **rebase** | personal feature branches before you push; keeps history linear and easy to read |

**The Golden Rule of rebase:** *Never rebase a branch that other people have pulled.* You will rewrite their history out from under them.

🎯 **Exam tip:** if a question shows a *linear* history with no merge commits, the workflow is rebase. If it shows *diamond* commits with multiple parents, it's merge.

## 3.2 Interactive rebase — the swiss army knife

`git rebase -i` lets you reorder, squash, drop, and reword the last *N* commits before they're shared.

```powershell
git rebase -i HEAD~5
```

You get an editor:

```
pick   a1b2c3 feat: skeleton retriever
pick   b2c3d4 feat: BM25
pick   c3d4e5 fix: typo
pick   d4e5f6 feat: hybrid scoring
pick   e5f6g7 wip: debug print
```

Replace `pick` with:

- `squash` (or `s`) — fold into previous commit, keep both messages.
- `fixup` (or `f`) — fold into previous commit, drop this message.
- `reword` (or `r`) — keep commit but change message.
- `drop` (or `d`) — remove commit entirely.
- `edit` (or `e`) — pause to amend the commit's contents.

Result of squashing the typo + wip into the BM25 commit: 3 clean commits instead of 5.

⚠️ **Production gotcha:** if you've already pushed, force-push with `--force-with-lease` (not `--force`). The lease checks no one else has pushed since you last fetched.

```powershell
git push --force-with-lease origin feat/bm25-retrieval
```

## 3.3 Cherry-pick — copy a commit from one branch to another

Your colleague pushed an important fix to `hotfix/embedding-bug`. You need it in your `feat/bm25-retrieval` branch *now*, but their full branch isn't ready to merge.

```powershell
git fetch origin
git switch feat/bm25-retrieval
git cherry-pick origin/hotfix/embedding-bug
```

Cherry-pick re-creates the change as a *new* commit on your branch. Conflicts? Resolve, then `git cherry-pick --continue`.

🎯 **Exam tip:** cherry-pick creates a commit with a *new* SHA. Same patch, different identity.

## 3.4 Stash — park your work safely

You're mid-feature, a P0 ticket comes in. You need a clean working tree to switch branches.

```powershell
git stash push -m "WIP: experimenting with reranker"
git switch main
# ...fix the P0...
git switch feat/bm25-retrieval
git stash list
git stash pop      # apply most recent stash, drop from stash list
# or
git stash apply stash@{1}   # apply, but keep in list
git stash drop  stash@{1}   # delete a specific stash
```

⚠️ **Gotcha:** untracked files (new files you've never `add`'d) are NOT stashed by default. Use `git stash -u` to include them, `-a` to include even `.gitignore`'d files.

## 3.5 Reflog — Git's undo history

`git reflog` records *every* movement of `HEAD` on your laptop for ~90 days. It is your safety net for almost any disaster — even after `git reset --hard`.

```powershell
git reflog
# ef34ab2 HEAD@{0}: reset: moving to HEAD~3
# 1a2b3c4 HEAD@{1}: commit: feat: hybrid retrieval
# ...
git reset --hard 1a2b3c4    # recover the lost commit
```

🎯 **Exam tip:** reflog is **local-only**. It does NOT push to GitHub. Lose the laptop → lose the reflog.

## 3.6 Bisect — find the commit that broke retrieval accuracy

Your RAG eval suite dropped from 87% → 71% somewhere in the last 50 commits. Bisect finds the bad commit in `log2(50) ≈ 6` steps.

```powershell
git bisect start
git bisect bad                  # current HEAD is broken
git bisect good v0.2.0          # this old tag was fine
# git checks out the middle commit
python evaluate.py              # run your tests
git bisect good                 # or "bad", depending on result
# ...repeat until git names the first bad commit...
git bisect reset
```

**Auto-bisect** with a test script:

```powershell
git bisect run python evaluate.py --threshold 0.85
```

When `evaluate.py` exits 0 → good; non-zero → bad. Walk away, come back, Git names the culprit.

## 3.7 Rewriting history — `filter-repo` for committed secrets

You committed an OpenAI key. ⚠️ **You must rotate the key first.** Then remove from history:

```powershell
pip install git-filter-repo
git filter-repo --replace-text <(echo "sk-prod-***==>REMOVED")
git push --force --all
git push --force --tags
```

🎯 **Exam tip — GHAS:** the recommended replacement for the deprecated `git filter-branch` is `git filter-repo`. Foundations/GHAS may show it.

⚠️ **Production gotcha:** even after history rewrite, the secret may live in GitHub's network of forks and the global event log. **Always rotate the secret.** GHAS push-protection (Chapter 8) prevents the leak in the first place.

## 3.8 Hooks — automation that runs at commit/push time

Git hooks are shell scripts in `.git/hooks/`. Modern projects use **pre-commit** (a framework) to manage them in version control.

`.pre-commit-config.yaml` for an AI repo:

```yaml
repos:
  - repo: https://github.com/pre-commit/pre-commit-hooks
    rev: v4.6.0
    hooks:
      - id: trailing-whitespace
      - id: end-of-file-fixer
      - id: check-added-large-files
        args: ['--maxkb=5000']     # block >5MB files (models go to LFS)
      - id: detect-private-key
  - repo: https://github.com/astral-sh/ruff-pre-commit
    rev: v0.5.0
    hooks:
      - id: ruff
      - id: ruff-format
  - repo: https://github.com/gitleaks/gitleaks
    rev: v8.18.0
    hooks:
      - id: gitleaks
```

Install:

```powershell
pip install pre-commit
pre-commit install
```

Now every `git commit` runs the checks. Gitleaks catches `sk-…`-shaped strings before they leave your laptop.

## 3.9 Submodules vs subtrees vs sparse-checkout

| Need | Use |
|---|---|
| Embed another repo at a fixed commit | **submodule** |
| Embed another repo *and absorb its history* into yours | **subtree** |
| Clone only part of a giant monorepo | **sparse-checkout** |

```powershell
# Submodule: pin an external eval suite
git submodule add https://github.com/openai/evals external/evals
git submodule update --init --recursive

# Sparse checkout (monorepo)
git clone --filter=blob:none --no-checkout https://github.com/big-org/monorepo
cd monorepo
git sparse-checkout init --cone
git sparse-checkout set agents/rag-service
git checkout main
```

🎯 **Exam tip — Admin:** submodules are an **independent commit pointer**, not a copy. Updating the submodule requires committing the *new pointer* in the parent repo.

## 3.10 Worktrees — multiple checkouts of the same repo

Reviewing two PRs at once without stashing? Use worktrees.

```powershell
git worktree add ../doc-rag-pr-42 origin/feat/pr-42
cd ../doc-rag-pr-42
# ...run tests on PR 42...
cd ../doc-rag
git worktree remove ../doc-rag-pr-42
```

Each worktree is its own working tree, sharing one `.git/` storage. No clone overhead.

## 3.11 Large file storage — Git LFS for models

Models, datasets, ONNX/GGUF blobs do not belong in Git. Use **Git LFS** — they live as pointer files in the repo and the binaries live in LFS storage.

```powershell
git lfs install
git lfs track "*.onnx" "*.gguf" "*.parquet"
git add .gitattributes
git add model-v1.onnx
git commit -m "feat: ship quantized model"
git push
```

🎯 **Exam tip — Foundations:** Git LFS has separate **storage and bandwidth quotas** from regular Git. Free accounts get 1 GB storage + 1 GB/month bandwidth.

## 3.12 Mini-quiz (10 questions)

1. Golden rule of rebase?
2. What does `git rebase -i` `fixup` do that `squash` doesn't?
3. Why `--force-with-lease` instead of `--force`?
4. What new SHA does `cherry-pick` produce on a clean apply?
5. Are untracked files included in `git stash` by default?
6. How long does the local reflog retain entries?
7. What is the worst-case number of steps `git bisect` needs to find a bad commit in 1024 history?
8. Should `filter-repo` be your *first* response to a leaked secret?
9. Submodule vs subtree — which one absorbs the foreign history?
10. Where do LFS binaries actually live?

Answers in [Phase3_Intermediate_Git/exercises.md](Phase3_Intermediate_Git/exercises.md).

## 3.13 Exercises (do all 8)

1. **Interactive rebase** — make 5 commits with messy messages, `rebase -i HEAD~5`, squash to 2 clean commits, push with `--force-with-lease`.
2. **Cherry-pick** — make a fix on `hotfix/x`, cherry-pick it onto `feat/y`. Verify a *new* SHA.
3. **Reflog recovery** — `git reset --hard HEAD~3` (lose 3 commits), recover them using only `git reflog`.
4. **Bisect drill** — write a 20-commit history where commit 12 is "bad". Use `bisect run` with a one-line test to find it automatically.
5. **Pre-commit secret block** — install `gitleaks` via pre-commit. Try to commit a file containing `sk-test-1234567890abcdef`. Verify the commit is blocked.
6. **Submodule** — add `openai/evals` as a submodule at a *specific tag*. Update to a newer tag and commit the pointer bump.
7. **Worktree** — review two PRs simultaneously using worktrees. Remove cleanly when done.
8. **LFS** — convert an existing `.onnx` file in your repo to LFS retroactively (search the docs for `git lfs migrate import`). Push.

---

<a id='chapter-4'></a>

# Chapter 4 — GitHub Actions for AI/ML projects

> **You will:** master GitHub Actions — workflows, jobs, steps, runners, matrix builds, secrets, environments, reusable workflows, composite actions, OIDC federation to Azure, and how to ship an AI agent on every push.

> **Scenario:** Your `doc-rag` service runs unit tests on every PR, evaluates retrieval quality nightly, builds a Docker image on every release, and deploys to Azure Container Apps via OIDC — no long-lived secrets anywhere.

### 🧒 If you were 10 years old

Imagine you have **a robot in your school locker**. Every time you put a finished essay in the locker, the robot:

1. Spell-checks it.
2. Prints out 3 copies.
3. Mails one to the teacher.
4. Pins one on the classroom wall.
5. Emails your parents *"essay submitted!"*

You never asked it to do all that *this time* — you set it up once, and now it happens **every single time** you drop something in the locker.

**GitHub Actions is that robot**, but for code. You write one YAML file describing the chores, and GitHub does them automatically on every push, every pull request, every night at 2 AM — whatever you ask.

### 🌍 Real-world situation — when to use this

**Situation:** Every time someone pushes code to your RAG repo, you want to (1) run tests, (2) build a Docker image, (3) evaluate the model, and (4) deploy to Azure — but only if main is green and a human approves production. This is the *core* CI/CD workflow:

```yaml
# .github/workflows/ship.yml
name: Ship
on:
  push: { branches: [main] }
  pull_request:
  workflow_dispatch:

permissions:
  contents: read
  id-token: write          # for passwordless Azure login (OIDC)

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-python@v5
        with: { python-version: '3.12', cache: pip }
      - run: pip install -r requirements.txt
      - run: pytest -q

  eval:
    needs: test
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - run: python eval.py --quick > eval.json
      - run: echo "### Eval results" >> $GITHUB_STEP_SUMMARY
      - run: cat eval.json >> $GITHUB_STEP_SUMMARY

  deploy:
    needs: [test, eval]
    if: github.ref == 'refs/heads/main'
    runs-on: ubuntu-latest
    environment: production      # requires reviewer approval
    steps:
      - uses: azure/login@v2
        with:
          client-id:       ${{ vars.AZURE_CLIENT_ID }}
          tenant-id:       ${{ vars.AZURE_TENANT_ID }}
          subscription-id: ${{ vars.AZURE_SUBSCRIPTION_ID }}
      - run: az containerapp up -g rag-rg -n doc-rag
              --image ghcr.io/${{ github.repository }}:${{ github.sha }}
```

The robot now runs **every push, in the same way, forever** — no more *"works on my machine."*

## 4.1 The anatomy of a workflow

A workflow is a YAML file in `.github/workflows/`. It contains:

```yaml
name: CI                        # display name
on:                             # triggers
  push:
    branches: [main]
  pull_request:
    branches: [main]
  schedule:
    - cron: '0 2 * * *'         # nightly at 02:00 UTC
  workflow_dispatch:            # manual run

permissions:                    # least privilege at workflow level
  contents: read

jobs:                           # one or more jobs, run in parallel by default
  test:
    runs-on: ubuntu-latest      # the runner
    steps:                      # ordered list, run sequentially
      - uses: actions/checkout@v4
      - uses: actions/setup-python@v5
        with: { python-version: '3.12' }
      - run: pip install -r requirements.txt
      - run: pytest -q
```

🎯 **Exam tip — Actions:** *workflow → job → step* is the hierarchy. Jobs run in parallel unless `needs:` is set; steps within a job run sequentially.

## 4.2 Triggers — `on:` cheat sheet

| Trigger | When | Notes |
|---|---|---|
| `push` | code pushed to repo | filter by `branches`, `paths`, `tags` |
| `pull_request` | PR opened/synchronized | uses *PR's* code; secrets are restricted from forks |
| `pull_request_target` | PR events | uses *base* code + has access to secrets — security-sensitive! |
| `schedule` | cron | UTC only; can be delayed under load |
| `workflow_dispatch` | manual UI / API | can take typed `inputs` |
| `workflow_call` | another workflow calls it | reusable workflow |
| `repository_dispatch` | external HTTP webhook | custom integrations |
| `release` | release created/published | great for "deploy on release" |
| `issue_comment` | someone comments | `/deploy` slash-commands |

⚠️ **Production gotcha — `pull_request_target`:** if you check out the PR's code in a `pull_request_target` workflow, you give an attacker your secrets. Only use `pull_request_target` for read-only metadata jobs like labeling.

🎯 **Exam tip — Actions:** know the difference between `pull_request` and `pull_request_target`. Heavily tested.

## 4.3 Runners — GitHub-hosted vs self-hosted

- **GitHub-hosted** (`ubuntu-latest`, `windows-latest`, `macos-latest`, `ubuntu-22.04`, etc.) — ephemeral, free for public repos, minute-metered for private.
- **Self-hosted** — your own machine. Required for GPU runners, isolated networks, custom images. **Never use self-hosted on public repos** unless you understand the security implications — a malicious PR can run arbitrary code on your hardware.
- **Larger runners** — paid GitHub-hosted runners with more vCPU, RAM, and GPU options. Configure at org level.

🎯 **Exam tip — Admin:** **self-hosted runners on public repos** are explicitly discouraged in GitHub docs. Memorize that.

## 4.4 Matrix builds — train/test across configurations

```yaml
jobs:
  test:
    strategy:
      fail-fast: false
      matrix:
        python: ['3.10', '3.11', '3.12']
        os: [ubuntu-latest, windows-latest, macos-latest]
        include:
          - python: '3.12'
            os: ubuntu-latest
            extras: 'gpu'
        exclude:
          - python: '3.10'
            os: macos-latest
    runs-on: ${{ matrix.os }}
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-python@v5
        with: { python-version: ${{ matrix.python }} }
      - run: pip install -r requirements.txt ${{ matrix.extras && format('--extras {0}', matrix.extras) || '' }}
      - run: pytest -q
```

`fail-fast: false` ensures *all* matrix combinations run even if one fails — vital for *"which combo broke?"* debugging.

## 4.5 Secrets, variables, environments

Three storage tiers:

| Tier | Where | Used for |
|---|---|---|
| Repo / Org secrets | Settings → Secrets and variables → Actions | API keys, tokens — encrypted at rest, masked in logs |
| Environment secrets | Settings → Environments → `production` etc. | Per-environment with approval rules |
| Variables | same UI, "Variables" tab | non-sensitive config (region names, model IDs) |

```yaml
jobs:
  deploy-prod:
    runs-on: ubuntu-latest
    environment:
      name: production
      url: https://doc-rag.example.com
    steps:
      - run: echo "Deploying with $OPENAI_API_KEY"
        env:
          OPENAI_API_KEY: ${{ secrets.OPENAI_API_KEY }}
          MODEL_ID:       ${{ vars.MODEL_ID }}
```

**Environment protection rules:**

- Required reviewers (1–6 humans must approve before the job runs).
- Wait timer (delay before run starts).
- Deployment branch policy (only `main` can deploy to `production`).

🎯 **Exam tip — Actions/Admin:** environment approvals gate the **job**, not the workflow. Other jobs in the same workflow continue.

## 4.6 OIDC — passwordless Azure deployment

OpenID Connect lets your workflow exchange a short-lived GitHub token for a short-lived Azure credential. **No long-lived secret in GitHub.**

Setup (Azure side, one-time):

```bash
az ad app create --display-name doc-rag-github
APP_ID=$(az ad app list --display-name doc-rag-github --query "[0].appId" -o tsv)
az ad sp create --id $APP_ID
az role assignment create --role contributor --subscription $SUB --assignee $APP_ID
# Add federated credential
az ad app federated-credential create --id $APP_ID --parameters '{
  "name":"github-main",
  "issuer":"https://token.actions.githubusercontent.com",
  "subject":"repo:mail2raji/doc-rag:ref:refs/heads/main",
  "audiences":["api://AzureADTokenExchange"]
}'
```

Workflow:

```yaml
permissions:
  id-token: write       # required for OIDC
  contents: read

jobs:
  deploy:
    runs-on: ubuntu-latest
    environment: production
    steps:
      - uses: actions/checkout@v4
      - uses: azure/login@v2
        with:
          client-id:       ${{ vars.AZURE_CLIENT_ID }}
          tenant-id:       ${{ vars.AZURE_TENANT_ID }}
          subscription-id: ${{ vars.AZURE_SUBSCRIPTION_ID }}
      - run: az containerapp up -g rag-rg -n doc-rag --image ghcr.io/mail2raji/doc-rag:${{ github.sha }}
```

🎯 **Exam tip — Actions/Admin:** OIDC requires `permissions: id-token: write`. Federated credential `subject` claim is the most common config error.

## 4.7 Reusable workflows and composite actions

### Reusable workflow (workflow-level)

`.github/workflows/_python-ci.yml`:

```yaml
on:
  workflow_call:
    inputs:
      python-version: { required: true, type: string }
    secrets:
      OPENAI_API_KEY: { required: false }
jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-python@v5
        with: { python-version: ${{ inputs.python-version }} }
      - run: pip install -r requirements.txt
      - run: pytest -q
        env: { OPENAI_API_KEY: ${{ secrets.OPENAI_API_KEY }} }
```

Consume it:

```yaml
jobs:
  ci:
    uses: ./.github/workflows/_python-ci.yml
    with: { python-version: '3.12' }
    secrets: inherit
```

### Composite action (step-level)

`.github/actions/setup-rag/action.yml`:

```yaml
name: Setup RAG env
runs:
  using: composite
  steps:
    - uses: actions/setup-python@v5
      with: { python-version: '3.12' }
    - run: pip install -r requirements.txt
      shell: bash
```

Consume it:

```yaml
- uses: ./.github/actions/setup-rag
```

🎯 **Exam tip — Actions:** know the three action types — **JavaScript action**, **Docker container action**, **composite action**. JavaScript actions are most common on the Marketplace; Docker actions only work on Linux.

## 4.8 Concurrency control

Stop two deploys racing:

```yaml
concurrency:
  group: deploy-${{ github.ref }}
  cancel-in-progress: false
```

For PR test cancellations:

```yaml
concurrency:
  group: pr-${{ github.head_ref }}
  cancel-in-progress: true
```

## 4.9 Caching — speed up AI dependency installs

```yaml
- uses: actions/setup-python@v5
  with:
    python-version: '3.12'
    cache: 'pip'                  # built-in pip cache
- uses: actions/cache@v4          # custom cache for huggingface models
  with:
    path: ~/.cache/huggingface
    key: hf-${{ hashFiles('eval/models.txt') }}
```

⚠️ **Gotcha:** cache keys are immutable. If a cache entry is wrong, change the *key* — `actions/cache` does not overwrite.

## 4.10 Artifacts and Releases

Upload built artifacts (eval reports, ONNX models):

```yaml
- uses: actions/upload-artifact@v4
  with: { name: eval-report, path: reports/eval-${{ github.run_id }}.html }
```

Auto-release on tag push:

```yaml
on:
  push:
    tags: ['v*']
jobs:
  release:
    permissions: { contents: write }
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: softprops/action-gh-release@v2
        with:
          files: |
            dist/*
            models/*.onnx
```

## 4.11 GITHUB_TOKEN — the auto-created identity

Every workflow run gets a short-lived `GITHUB_TOKEN`. Its permissions are controlled by:

1. Repo Settings → Actions → Workflow permissions (default: read).
2. The `permissions:` block at workflow or job level.
3. Org Settings → Actions → Workflow permissions (can lock down all repos).

🎯 **Exam tip — Actions/Admin:** the org setting **overrides** the repo default. A common admin question.

## 4.12 Self-hosted runners — security best practices

- **Ephemeral runners** — provisioned per job, destroyed after. Prevents state poisoning.
- **Runner groups** — restrict which repos can use which runners (org/enterprise).
- **No public repo access** by default.
- **Runner labels** — `gpu`, `linux`, `windows-prod` etc.
- Use `runs-on: [self-hosted, linux, gpu]` to select by labels.

🎯 **Exam tip — Admin:** runner groups are an **enterprise feature**, but a free org has *the default group* only.

## 4.13 Real-world workflow — eval an LLM agent nightly

```yaml
name: Nightly eval

on:
  schedule: [{ cron: '0 2 * * *' }]
  workflow_dispatch:

permissions:
  contents: read
  id-token: write     # OIDC into Azure for model access

jobs:
  eval:
    runs-on: ubuntu-latest
    strategy:
      matrix:
        model: [gpt-4o-mini, gpt-4o, claude-3-5-sonnet]
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-python@v5
        with: { python-version: '3.12', cache: 'pip' }
      - run: pip install -r requirements.txt
      - uses: azure/login@v2
        with:
          client-id:       ${{ vars.AZURE_CLIENT_ID }}
          tenant-id:       ${{ vars.AZURE_TENANT_ID }}
          subscription-id: ${{ vars.AZURE_SUBSCRIPTION_ID }}
      - run: python eval.py --model ${{ matrix.model }} --out report-${{ matrix.model }}.json
        env:
          OPENAI_API_KEY:    ${{ secrets.OPENAI_API_KEY }}
          ANTHROPIC_API_KEY: ${{ secrets.ANTHROPIC_API_KEY }}
      - uses: actions/upload-artifact@v4
        with:
          name: eval-${{ matrix.model }}-${{ github.run_id }}
          path: report-${{ matrix.model }}.json

  summarize:
    needs: eval
    runs-on: ubuntu-latest
    steps:
      - uses: actions/download-artifact@v4
        with: { path: reports }
      - run: python summarize.py reports/ > $GITHUB_STEP_SUMMARY
```

`$GITHUB_STEP_SUMMARY` writes Markdown to the workflow run page — perfect for AI eval dashboards.

## 4.14 Mini-quiz (10 questions)

1. What is the only difference between `pull_request` and `pull_request_target`?
2. Where do you declare a workflow's required `id-token: write` permission for OIDC?
3. What are the three action types?
4. Can a job in environment `production` start while the manual approver is asleep?
5. What does `fail-fast: false` do in a matrix?
6. Is `schedule:` cron in UTC or repo-owner timezone?
7. Org workflow permissions vs repo workflow permissions — which wins?
8. Why is `concurrency: cancel-in-progress: true` dangerous for production deploys?
9. What's the GitHub-recommended replacement for storing long-lived Azure creds in secrets?
10. Where can you NOT run a Docker container action?

Answers in [Phase4_GitHub_Actions/exercises.md](Phase4_GitHub_Actions/exercises.md).

## 4.15 Exercises (do all 10)

1. **First workflow** — add a `pytest` workflow to your `doc-rag` repo that runs on every PR.
2. **Matrix** — add a 3 × 2 matrix (Python 3.10/3.11/3.12 × Ubuntu/Windows) with `fail-fast: false`.
3. **Secrets** — add `OPENAI_API_KEY` as a repo secret, consume it in a `pytest` step.
4. **Environment** — create a `production` environment with 1 required reviewer. Add a `deploy-prod` job requiring it.
5. **OIDC** — configure an Azure federated credential for your repo, deploy a Hello World Container App via `azure/login@v2` (no client secret).
6. **Reusable workflow** — extract the test job into `_python-ci.yml`, consume it from two other workflows.
7. **Composite action** — write `setup-rag` and use it across all your jobs.
8. **Concurrency** — protect `deploy-prod` so two pushes to `main` queue rather than run concurrently.
9. **Auto-release** — tag `v0.3.0`, watch the release auto-create and upload artifacts.
10. **Nightly eval** — implement the §4.13 workflow against your real RAG, write the eval results to `$GITHUB_STEP_SUMMARY`.

---

<a id='chapter-5'></a>

# Chapter 5 — GitHub Copilot for GenAI

> **You will:** master GitHub Copilot end-to-end — completions, chat, inline chat, agent mode, custom instructions, prompt files, slash commands, vision, context exclusions, and Responsible AI — specifically for **GenAI / Agentic AI** engineering.

> **Scenario:** You build a GenAI feature pipeline (RAG + tool-using agent) and let Copilot accelerate every layer — code, tests, docs, eval prompts, and Bicep/Terraform deploys.

This chapter is also the **largest** because it owns the majority of the **GitHub Copilot certification**.

### 🧒 If you were 10 years old

Picture a **super-smart parrot sitting on your shoulder** while you draw and write.

- When you start drawing a cat, the parrot whispers *"add whiskers like this!"* — that's **inline completion** (gray ghost text).
- When you stop and ask *"hey parrot, what's a cool name for my cat?"*, the parrot answers — that's **Copilot Chat**.
- When you say *"parrot, draw the whole cat by yourself, then bring it back for me to look at"*, the parrot flies off, does the work, and shows you the result — that's **Agent mode**.
- When you say *"parrot, every time I draw, always use crayons not pencils"*, the parrot remembers — that's a **custom instructions file**.
- When you keep a list of favorite drawings, the parrot can copy that exact style — that's a **prompt file**.

The parrot is helpful, but **you are still the artist**: you decide what to keep.

### 🌍 Real-world situation — when to use this

**Situation:** You need to write a Python function that retrieves docs, asks an LLM to answer, and *also* writes a unit test. Three Copilot surfaces solve this in three minutes:

```python
# 1. INLINE COMPLETION — type the docstring; Copilot writes the body.
def answer_question(query: str, top_k: int = 5) -> str:
    """Retrieve top-k docs from Qdrant and ask GPT-4o-mini to answer the query.
    Returns a citation-grounded answer.
    """
    # <Tab to accept Copilot's suggestion>
    docs = qdrant.search(query, limit=top_k)
    context = "\n\n".join(d.payload["text"] for d in docs)
    prompt = f"Use ONLY this context:\n{context}\n\nQuestion: {query}"
    return openai.chat.completions.create(
        model="gpt-4o-mini",
        messages=[{"role": "user", "content": prompt}],
    ).choices[0].message.content
```

Then:

- **Inline chat (`Ctrl+I`)** on the function → *"add citation numbers to every paragraph in the answer."* Copilot edits in-place.
- **Side chat (`Ctrl+Alt+I`)** → *"write a pytest that mocks both Qdrant and OpenAI and asserts the citation count."* Copilot writes the test file.
- **Agent mode** → *"add this feature end-to-end: update the API, write tests, update README, open a PR."* It plans, edits multiple files, and stops for your approval.

The parrot doesn't *replace* you — it makes you 5× faster.

## 5.1 Plans and features — what you get

| Plan | Audience | Includes |
|---|---|---|
| **Copilot Free** | individuals | limited chat, completions, code-review preview |
| **Copilot Pro** | individuals (paid) | unlimited completions + chat, more model choice, code-review, Copilot in CLI |
| **Copilot Pro+** | individuals (paid) | + larger context, premium models (e.g. GPT-5, Claude, Gemini), more agent runs |
| **Copilot Business** | small/medium orgs | + admin policies, content exclusions, audit logs, IP indemnity, no training on data |
| **Copilot Enterprise** | enterprises | + Copilot in github.com, knowledge bases (org-curated), custom models, Copilot Workspace |

🎯 **Exam tip — Copilot:** memorize *which* features are *only* in Business+ vs Enterprise. Common test items:

- Content exclusions → Business+
- Audit logging → Business+
- Knowledge bases → Enterprise
- Copilot Workspace → Enterprise (preview)
- IP indemnity → Business+

## 5.2 The five surfaces of Copilot

| Surface | Where | Best for |
|---|---|---|
| **Completions** (ghost text) | inline in editor | autocomplete a line/function |
| **Chat panel** | side panel in IDE | multi-turn Q&A; explain selected code |
| **Inline chat** | `Ctrl+I` in file | quick localized edits without leaving the line |
| **Agent mode** | Chat → Agent | multi-step tasks: read files, run terminal, edit, test, iterate |
| **Copilot on github.com** | PR pages, issues, mobile | review PRs, summarize, draft replies, generate from issues |
| **Copilot CLI** | terminal `gh copilot` | terminal-native suggestions (Chapter 6) |

🎯 **Exam tip — Copilot:** **Agent mode** is the surface that *runs commands*; Inline Chat does *not* execute code. This distinction is heavily tested.

## 5.3 How Copilot works under the hood

Simplified pipeline for a single completion:

```
[your code] + [open files] + [custom instructions]
        |
        v
[prompt assembled by IDE plugin]   <-- includes filename, language, neighboring text
        |
        v
[sent to GitHub proxy]             <-- TLS, then proxied to Azure-hosted model
        |
        v
[LLM (e.g. GPT-4o, Claude 3.5)]    <-- choice depends on surface + plan
        |
        v
[response streamed back]           <-- ghost text or chat reply
```

Important properties for the exam:

- **Plan-dependent model selection** — Free gets fewer choices; Pro+/Enterprise get premium models.
- **No training on Business/Enterprise prompts or completions** — guarantee in terms.
- **Public code matching filter** — if enabled, Copilot blocks completions that match public code ≥ ~150 chars.
- **Content exclusions** — at org/repo level, exclude files/paths from Copilot context (e.g., `secrets/`, `customer-data/`).

🎯 **Exam tip — Copilot:** the "public code matching" toggle is **org-level** (Business+) — individuals on Pro can also toggle it for themselves.

## 5.4 Data handling — what is sent, retained, used

| Plan | Prompt retained? | Completion retained? | Used to train base model? |
|---|---|---|---|
| Free / Pro / Pro+ | configurable; default = retained for abuse monitoring | configurable | only if user opts in |
| Business / Enterprise | not retained beyond session | not retained | **never** |

Code that is *excluded by content exclusion* is **not sent** to the model at all.

⚠️ **Production gotcha:** even with Business, a *prompt* in chat can leak data. Treat the chat history as logged at your org. Use the *redact* button or restart conversations for sensitive scopes.

🎯 **Exam tip — Copilot:** the question "where is my code sent?" answer is *"to GitHub-hosted services on Azure infrastructure, in the region nearest the user"*. There is **no on-prem Copilot** for free/pro/business; Enterprise has **GHE Copilot** but the inference still runs in Microsoft's cloud.

## 5.5 Prompt crafting — the one skill that beats every other Copilot trick

The Copilot exam dedicates a domain to prompt engineering. The patterns below show up in real tasks.

### 5.5.1 The five-part recipe for a great Copilot prompt

```
[role/goal] + [context] + [exemplars] + [constraints] + [output format]
```

Example, for RAG retrieval code:

> *"Act as a Python engineer (role). I have a FAISS index of 500k document chunks (context). Below is an example query function (exemplar): `def query(...): ...`. Write a function that does hybrid retrieval — BM25 over `docs.parquet` then re-rank top 50 with the existing embedding-based retriever (constraints). Output: one Python file, fully typed, with a 5-line docstring (output format)."*

### 5.5.2 Chain-of-thought / "think step by step"

For complex agent design tasks:

> *"Before writing code, list 5 design choices we must make (vector store, chunk size, reranker model, tool schema, eval metric). Then write the code for the choice I confirm."*

### 5.5.3 "Pin the right files" — make context explicit

In Chat: `#file:retriever.py #file:eval.py` adds those files to the context. `#codebase` searches the whole repo. `#selection` uses the selected lines.

⚠️ **Gotcha:** pinning *too many* files dilutes signal. 2–4 files is a sweet spot for most tasks.

### 5.5.4 Output-shape locks

> *"Reply only with a JSON object matching schema X. No prose."*

The most reliable way to get structured output from Copilot Chat. Always reject the response if it isn't valid JSON.

### 5.5.5 Iterative refinement

Copilot is not a one-shot oracle. Ask, evaluate, ask again with the specific complaint:

> *"That's close — but in the `retrieve` function I want the BM25 score normalized to 0–1 with `MinMaxScaler` before re-ranking."*

## 5.6 Real-world GenAI workflows with Copilot

### 5.6.1 Generate a tool for an agent

Selection: `def make_calendar_event(...) -> ...:`

Inline chat (`Ctrl+I`):

> *"Implement this as a function-calling tool. Add a JSON Schema for OpenAI's `tools` parameter. Use `pydantic` for validation. Errors should return a structured error object the model can read."*

### 5.6.2 Generate eval cases for a prompt

Chat (with prompt file open):

> *"Generate 25 eval cases for this customer-support prompt. Cover: happy path, ambiguous question, missing entity, off-topic, refusal, bilingual. Output as `pytest` parametrize."*

### 5.6.3 Convert a notebook to a production script

Agent mode:

> *"Take `notebooks/rag.ipynb` and produce `src/rag.py` + tests. Strip exploratory cells. Wrap into a `Retriever` class. Add type hints. Update `requirements.txt`."*

### 5.6.4 Generate Bicep to deploy the agent

Inline chat in `main.bicep`:

> *"Add an Azure Container App + Container Registry + Log Analytics + Application Insights. Use system-assigned managed identity. Output only the new resources, not the whole file."*

### 5.6.5 Explain a tricky retrieval bug

Select the broken function → Chat → `/explain`. Or:

> *"Walk through `hybrid_retrieve` line by line and explain how a tied BM25 score would affect ranking."*

### 5.6.6 Generate unit tests

Open the file → Chat → `/tests`. Copilot generates `pytest` cases. Always run them; Copilot often hallucinates fixtures.

## 5.7 Slash commands — the cheat sheet

| Slash | What it does |
|---|---|
| `/explain` | explain the selected code |
| `/fix` | propose a fix for an error |
| `/tests` | generate tests for the file/selection |
| `/doc` | generate docstrings / comments |
| `/optimize` | suggest perf improvements |
| `/new` | scaffold a new project |
| `/clear` | reset the chat context |
| `/help` | list all slash commands and chat participants |

Chat participants (mention with `@`):

- `@workspace` — answers using the open workspace.
- `@vscode` — answers about VS Code itself.
- `@terminal` — explains a terminal command/output.
- `@github` — runs against the GitHub API for org/repo questions.

🎯 **Exam tip — Copilot:** `@workspace` adds **workspace-wide retrieval** to the prompt. It is not a separate "agent"; it's a chat participant.

## 5.8 Custom instructions & prompt files

### 5.8.1 Repo-level custom instructions

Save as `.github/copilot-instructions.md`:

```markdown
# Project conventions for Copilot

- We use Python 3.12 with strict typing.
- All retrieval code lives under `src/retriever/`.
- Use `openai` SDK ≥ 1.30 (not `azure.ai.inference`).
- Tests use `pytest` and `httpx.AsyncClient`.
- Prefer Pydantic v2 models for all tool I/O.
- Never commit logs containing `OPENAI_API_KEY`-shaped strings.
```

Copilot loads this on every prompt in this repo. Lower-friction than custom prompts on every request.

### 5.8.2 Prompt files

Save as `.github/prompts/eval-rag.prompt.md`:

```markdown
---
mode: agent
tools: ['codebase', 'terminal']
description: Run the RAG eval against the current branch.
---
You are a senior eval engineer.
Run `python eval.py --suite golden --out reports/eval.html`.
If accuracy drops below 0.85, summarize the worst-performing query categories with examples.
Return a Markdown table.
```

Invoke from Chat: `/eval-rag`.

🎯 **Exam tip — Copilot:** `.github/copilot-instructions.md` applies *always*; prompt files are *invoked* on demand. Know the path conventions.

## 5.9 Content exclusions

Org Settings → Copilot → Content exclusion. You can exclude by **path** in repos. Use cases:

- `secrets/**` — never read by Copilot
- `prompts/system/**` — keep proprietary prompts out of telemetry
- `data/customers/**` — privacy / GDPR

Once excluded, Copilot:

- Will not send those files as context.
- Will not provide completions while editing them.

⚠️ **Production gotcha:** content exclusions are **server-side enforced**, but rely on path matching. A symlink can bypass. Audit periodically.

## 5.10 Responsible AI — what the exam expects you to know

GitHub's RAI commitments for Copilot, summarized:

- **Fairness** — train across diverse public code; periodic audits.
- **Reliability + safety** — filter for insecure patterns; flag low-confidence completions.
- **Privacy + security** — TLS in transit; no Business/Enterprise data used in training.
- **Inclusiveness** — multilingual support; accessibility features in IDEs.
- **Transparency** — model card published; surface citations for matched public code (with the filter on).
- **Accountability** — human-in-the-loop required; you accept responsibility for what you commit.

🎯 **Exam tip — Copilot:** *"Copilot is your pair, not your replacement."* The exam frequently tests that **the developer is accountable** for accepted code.

## 5.11 Testing with Copilot — the right way

1. **Write the test first** with `/tests`, then have Copilot implement to pass it (red → green).
2. **Property-based** — *"Generate Hypothesis property tests for `tokenize`."*
3. **Fuzz tools** — for agent tool schemas, ask Copilot for malformed inputs.
4. **Eval harness** — for prompts, get Copilot to author the eval suite, *then you* curate the golden answers.
5. **Never accept generated tests without running them** — they often pass because they assert nothing.

⚠️ **Gotcha:** Copilot loves to invent mocks. Inspect every `@patch` it writes — sometimes it patches *the wrong import path* and the test passes trivially.

## 5.12 Privacy fundamentals (exam-tested)

- Copilot does **not** read your file unless it's open or `@workspace` retrieves it.
- Copilot does **not** retain Business/Enterprise telemetry after the request.
- The user's GitHub identity is used for entitlement but not embedded in the prompt.
- Telemetry can be turned off via VS Code setting `github.copilot.advanced.telemetry`.

## 5.13 Mini-quiz (15 questions)

1. Which Copilot plan includes Knowledge Bases?
2. Which surface can execute terminal commands?
3. Where do content exclusions apply — completions only, chat only, or both?
4. What's the difference between custom instructions and prompt files?
5. Is the public-code matching filter on or off by default for new orgs?
6. Are Business prompts used to train the base model?
7. What chat participant pulls workspace context?
8. Which slash command resets the conversation?
9. What is the default chat model on a Free plan?
10. Can a user opt out of telemetry on a Business plan?
11. Where is `.github/copilot-instructions.md` loaded from?
12. Are prompt files invoked manually or automatically?
13. Where does inference for Copilot completions run?
14. Who is accountable for code accepted from Copilot?
15. Can Copilot Workspace generate, run, and commit code?

Answers in [Phase5_Copilot_GenAI/exercises.md](Phase5_Copilot_GenAI/exercises.md).

## 5.14 Exercises (do all 12)

1. **Plan check** — open `github.com/settings/copilot` and identify your plan.
2. **First completion** — open `app.py`, type a comment `# function that returns top-k chunks from a list of (text, score) tuples`, accept Copilot's completion, run it.
3. **Inline chat** — select a function, `Ctrl+I`, ask to "add type hints and a docstring".
4. **Slash `/tests`** — generate tests for `retriever.py`, run them, fix what doesn't pass.
5. **Agent mode** — ask agent mode to "scaffold a new FastAPI app that exposes `/query` returning the top-5 RAG results".
6. **Custom instructions** — add the §5.8.1 file to `doc-rag`, then ask Copilot for a new function and verify it follows conventions (typing, paths).
7. **Prompt file** — create `.github/prompts/refactor-tools.prompt.md` that refactors a directory's tool files to a single schema. Invoke with `/refactor-tools`.
8. **Content exclusion** — exclude `prompts/system/**` at org level, verify Copilot does not auto-complete in those files.
9. **Eval generation** — use Copilot Chat to generate 25 eval cases for a customer-support prompt as `pytest` parametrize. Run them.
10. **Public-code filter** — write a famous algorithm (e.g., LeetCode two-sum). Toggle the public-code filter; observe whether the suggestion changes.
11. **Vision** — drop a screenshot of an error stack trace into chat. Ask "explain and propose a fix".
12. **Copilot review** — enable Copilot code review in `doc-rag`. Open a PR with an intentional bug. See if Copilot catches it.

---

<a id='chapter-6'></a>

# Chapter 6 — GitHub Copilot CLI

> **You will:** use `gh copilot` and the newer `gh copilot suggest` / `explain` workflows to accelerate the *terminal* side of AI/ML engineering — training runs, model conversion, Docker, kubectl, `az`, `gcloud`, `kubectl`, `terraform`, `helm`, and shell pipelines.

> **Scenario:** You are spending too much time in the terminal building, evaluating, and deploying agents. The Copilot CLI gives you natural-language → shell on every command.

### 🧒 If you were 10 years old

You know that scary black window with white text where grown-ups type weird spells like `ls -la | grep "*.py"`?

**Copilot CLI is a translator** between English and those spells.

- You type, *"show me every Python file in this folder."* It writes the spell.
- You read a scary spell someone else wrote and ask, *"what does this do?"* It explains in plain English.
- If a spell looks dangerous (like *"delete everything"*), it pauses and asks, *"are you SURE?"* before running it.

It's like having a wizard friend whispering, *"this spell is safe — say it like this."*

### 🌍 Real-world situation — when to use this

**Situation:** You're SSH'd into a Linux box to debug a stuck training job. You need to find which Docker container is using the most GPU memory. You don't remember the command. You have 30 seconds before the call starts.

```powershell
# Ask in plain English
gh copilot suggest "list docker containers using GPU, sorted by GPU memory descending"
```

Copilot suggests:

```bash
nvidia-smi --query-compute-apps=pid,used_memory --format=csv \
  | sort -k2 -h -r
```

Not satisfied? Ask for an explanation before running:

```powershell
gh copilot explain "nvidia-smi --query-compute-apps=pid,used_memory --format=csv"
```

Now you understand it AND you ran it. You also save it as a permanent alias so you never forget:

```powershell
gh copilot alias --shell pwsh -- "gpustats" "nvidia-smi --query-compute-apps=pid,used_memory --format=csv | sort -k2 -h -r"
# now just type:  gpustats
```

You turned a *"how do I…?"* moment into a 30-second answer and a permanent shortcut.

## 6.1 Install + smoke test

```powershell
gh extension install github/gh-copilot
gh copilot --version
gh copilot suggest "show docker images sorted by size descending"
gh copilot explain "kubectl rollout status deploy/rag --timeout=120s"
```

`gh copilot` has three subcommands:

- `suggest` — natural-language request → shell command.
- `explain` — shell command → plain-English explanation.
- `alias` — install shell aliases (`ghcs`, `ghce`) for faster invocation.

```powershell
gh copilot alias -- pwsh | Out-String | Invoke-Expression  # install aliases for current session
ghcs "list pods in namespace rag that have crashed"
ghce "az containerapp up -g rag-rg -n doc-rag --image ghcr.io/me/x:1.0"
```

🎯 **Exam tip — Copilot:** the CLI runs locally; suggestions go via the same Copilot service. Same data-handling rules as the IDE apply.

## 6.2 Suggest — the natural-language → command flow

When you run `ghcs "task"`, Copilot offers a command, then asks:

- **Run** (execute now)
- **Revise** (refine with another instruction)
- **Explain** (show what the command does)
- **Copy** (to clipboard)
- **Quit**

Best practice: pick **Explain** before **Run** for anything you don't recognize.

⚠️ **Production gotcha:** never *blindly* run a Copilot CLI suggestion in production. The model is great at common tasks but can confidently invent flags.

## 6.3 Targeted command surfaces

`gh copilot suggest -t <target>` constrains the type of suggestion:

- `-t shell` (default) — POSIX/PowerShell command.
- `-t gh` — a `gh` CLI invocation.
- `-t git` — a `git` invocation.

Examples:

```powershell
ghcs -t git    "rebase last 3 commits as squash"
ghcs -t gh     "list PRs awaiting my review across all my repos"
ghcs -t shell  "tail logs of every docker container starting with rag-"
```

🎯 **Exam tip — Copilot:** know all three target types and what each constrains.

## 6.4 The 30 AI/ML terminal tasks Copilot CLI is great at

Use the following as your **practice cookbook**. Run them, observe the suggestions, accept or revise.

```
1.  "create a python venv and install transformers, torch, datasets"
2.  "download huggingface model meta-llama/Llama-3-8B-Instruct to ./models"
3.  "convert a pytorch model to onnx with opset 18"
4.  "quantize an onnx model to int8 with onnxruntime"
5.  "split a parquet of 1M rows into 100 shards"
6.  "deduplicate a jsonl file by the 'id' field"
7.  "compute sha256 of all files in ./models"
8.  "diff two openapi specs"
9.  "count tokens in a folder of .md files with tiktoken"
10. "watch GPU utilization every 1s and write to a CSV"
11. "build and tag a docker image as ghcr.io/me/rag:0.2"
12. "log in to ghcr with my gh PAT and push the image"
13. "scan the local image with trivy and fail on HIGH+"
14. "deploy that image to azure container apps in rag-rg"
15. "tail logs of the container app rag"
16. "stream a langfuse trace export to a parquet file"
17. "generate a kubernetes deployment manifest for the rag image with 2 replicas and resource requests"
18. "render a helm chart with values for prod and diff against the current cluster"
19. "spin up a temporary postgres + qdrant in docker compose"
20. "shell into the qdrant container and list collections"
21. "back up a qdrant collection to s3"
22. "generate a terraform module for an azure openai resource"
23. "write a gha workflow that runs nightly evals on a matrix of models"
24. "show me all secrets in repo doc-rag using gh"
25. "set a repo secret OPENAI_API_KEY from an env var"
26. "list all open PRs in org mail2raji touching files matching retriever*"
27. "create a draft release v0.3.0 with notes generated from PRs since last tag"
28. "convert a jupyter notebook to a deployable script"
29. "watch the response time of a local /query endpoint every 2s"
30. "produce a one-page Markdown report of yesterday's eval results from langfuse"
```

Run at least 15 of these. After each, ask `ghce` to explain the suggestion. You will build muscle memory for both Copilot *and* the underlying tools.

## 6.5 Explain — for the commands your colleague pasted

```powershell
ghce "find . -type f -name '*.parquet' -mtime -1 -exec mv {} ./latest/ \;"
ghce "kubectl run gpu-debug --image=nvidia/cuda:12.4-base --restart=Never --rm -it -- nvidia-smi"
```

`ghce` is the secret weapon for code review: paste any cryptic shell line from a PR and get an English explanation in two seconds.

## 6.6 Configuration

```powershell
gh copilot config         # interactive config (optional analytics, default target, etc.)
```

Org admins can enable/disable the CLI via the same Copilot policy panel as the IDE.

🎯 **Exam tip — Copilot:** the Copilot CLI is included with **Pro+** and above (and with Business/Enterprise org seats). Pro and Free do not get it.

## 6.7 Combining Copilot CLI with `gh` for GenAI ops

```powershell
# Open every PR that touches the prompts/ folder
ghcs -t gh "list PRs in doc-rag whose files match prompts/"
# Then with the IDs:
gh pr view 12 --json title,files | jq

# Diff a model card between two release tags
ghcs -t git "show diff of model-card.md between v0.2.0 and v0.3.0"

# Audit who approved last week's prod deploys
ghcs -t gh "list workflow runs for environment 'production' in the last 7 days with conclusion success"
```

## 6.8 Risks and limits

- **Shell-specific syntax** — Windows vs Linux matters. The CLI mostly picks the right shell from `$SHELL` / `$PSModulePath`, but verify.
- **Long pipelines** — sometimes the model breaks composition. Run incrementally.
- **Privileged commands** — `rm -rf`, `kubectl delete`, `az group delete` — *always* Explain first.
- **No filesystem context** — the CLI does not read your files. Don't ask it to "fix the bug in app.py" — that's IDE work.

## 6.9 Mini-quiz (10 questions)

1. Which Copilot plans include the CLI?
2. Three target types of `gh copilot suggest`?
3. Does the CLI read files in the current directory by default?
4. What does `ghce` stand for?
5. How do you install the CLI?
6. Same data-handling rules as IDE — true or false?
7. Where does the CLI run inference?
8. Can the CLI execute the suggested command in one step?
9. How do you install the `ghcs` / `ghce` aliases?
10. Should you blindly run a CLI suggestion in production?

Answers in [Phase6_Copilot_CLI/exercises.md](Phase6_Copilot_CLI/exercises.md).

## 6.10 Exercises (do all 8)

1. **Install + alias** — install the CLI and the aliases. Verify `ghcs --help` works.
2. **Suggest** — run any 5 prompts from §6.4. Compare the suggestion to what you would have typed.
3. **Explain** — paste a real `kubectl` command from your job's runbook. Verify the explanation matches your understanding.
4. **`gh` target** — use `-t gh` to find every PR in your org that touches `prompts/`. Verify with the GitHub UI.
5. **`git` target** — use `-t git` to interactively rebase the last 3 commits, then squash them.
6. **Failure mode** — purposely ask a vague question (e.g. "fix my code") and observe what the CLI does. Refine the question 3 times.
7. **Pipeline** — chain `ghcs` output into another command by copying. Build a small Dockerfile workflow using only CLI suggestions.
8. **Audit** — write a one-liner with `ghcs -t gh` to list everyone who approved a production deployment last week.

---

<a id='chapter-7'></a>

# Chapter 7 — Building Agentic AI with Copilot, MCP & Skills

> **You will:** turn Copilot into a planner/executor for *your* tools by writing **Model Context Protocol (MCP) servers**, **skills**, and **prompt files**. You'll also learn the patterns that show up in advanced Copilot exam scenarios.

> **Scenario:** Your team has 10 internal tools (Jira, ServiceNow, Splunk, Snyk, internal APIs). Instead of writing a custom agent from scratch, you let Copilot's agent mode call them via MCP. Copilot becomes the cockpit; your repo + MCP servers become the toolbelt.

### 🧒 If you were 10 years old

Imagine you have a robot friend who is **really smart but has no hands**. You give the robot tools:

- A **calculator** (for math).
- A **dictionary** (for word meanings).
- A **notepad** (for remembering).
- A **walkie-talkie to mom** (for asking permission before doing big things).

Now when you say, *"robot, do my math homework,"* the robot **plans** the steps, picks up the **calculator**, writes answers in the **notepad**, and if it's about to do something risky, **buzzes mom** first.

That handing-out-tools system is called **MCP — the Model Context Protocol**. It is the same plug for *every* AI tool, so the robot doesn't need to relearn each one.

- **Tool** = something the robot can *do* (e.g. "send email").
- **Resource** = something the robot can *read* (e.g. "my homework PDF").
- **Prompt** = a saved instruction (e.g. "always answer politely").
- **Skill** = an instruction the robot picks up automatically when the situation matches.

You go from a smart robot that just talks → a smart robot that **gets things done safely**.

### 🌍 Real-world situation — when to use this

**Situation:** When a new GitHub issue is opened in your team's repo, you want Copilot to: read the issue → check the codebase → suggest a label → assign to the right person — *without* you doing anything.

Step 1 — register an MCP server in `.vscode/mcp.json`:

```json
{
  "servers": {
    "github": {
      "command": "docker",
      "args": ["run","-i","--rm","-e","GITHUB_PERSONAL_ACCESS_TOKEN","ghcr.io/github/github-mcp-server"],
      "env": { "GITHUB_PERSONAL_ACCESS_TOKEN": "${input:gh_token}" }
    }
  }
}
```

Step 2 — write a skill file Copilot picks up automatically:

```markdown
---
name: triage-issue
description: Triage a newly opened GitHub issue. Reads the issue, picks 1-3 labels, suggests assignee.
---

# Triage skill

When the user asks to triage issue #N:

1. Use the `github` MCP tool to read issue #N (title, body, comments).
2. Read CODEOWNERS to find the right team.
3. Pick 1-3 labels from: bug | feature | docs | question | needs-info.
4. Post a comment summarizing your triage. **DO NOT** label or assign without my approval.
```

Step 3 — in Copilot Agent mode, just say: *"triage issue 42."* The agent plans, calls the GitHub tool, drafts the comment, and asks for your go-ahead before posting. You went from *manually triaging* to *one-line oversight*.

## 7.1 The agent loop — the only diagram you must memorize

```
  +------------------+
  |   user request   |
  +--------+---------+
           |
           v
  +------------------+     +------------------+
  |   PLAN (LLM)     |---->|   TOOL CALLS     |---+
  +--------+---------+     +------------------+   |
           ^                                       |
           |                                       v
           |             +-------------------------+--------+
           +-------------|   OBSERVATIONS (results, errors) |
                         +----------------------------------+
```

The LLM **plans** → calls a **tool** → reads the **observation** → decides next step. Loop until a stop condition.

In Copilot terms:

- **PLAN** = the model in agent mode.
- **TOOL CALLS** = MCP servers + built-in tools (`codebase`, `terminal`, `editFiles`, `runTasks`).
- **OBSERVATIONS** = what the tool returned (file contents, command output, API response).

## 7.2 What is MCP?

**Model Context Protocol** is an open standard published by Anthropic and now supported by GitHub Copilot, Claude Code, Cursor, and others. It is the *USB-C of LLM tooling*: one protocol; many servers; any compatible client can call them.

Core building blocks of an MCP server:

| Block | Like | Purpose |
|---|---|---|
| **Tools** | function calls | actions the agent can invoke |
| **Resources** | files / URIs | read-only content the agent can fetch |
| **Prompts** | re-usable prompt templates | the user can `/` invoke |
| **Sampling** | "ask the host LLM" | server requests LLM completions from the client |

🎯 **Exam tip — Copilot:** MCP is **transport-agnostic** — it runs over stdio, HTTP, or SSE. Copilot supports stdio (local) and HTTP (remote).

## 7.3 Configure MCP servers for Copilot

VS Code reads MCP server config from one of:

- Workspace: `.vscode/mcp.json`
- User: `settings.json` → `"github.copilot.chat.mcp.servers"`

Example `.vscode/mcp.json`:

```json
{
  "servers": {
    "filesystem": {
      "type": "stdio",
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-filesystem", "${workspaceFolder}"]
    },
    "github": {
      "type": "stdio",
      "command": "docker",
      "args": ["run", "-i", "--rm", "-e", "GITHUB_PERSONAL_ACCESS_TOKEN", "ghcr.io/github/github-mcp-server"],
      "env": { "GITHUB_PERSONAL_ACCESS_TOKEN": "${input:gh_pat}" }
    },
    "azure": {
      "type": "stdio",
      "command": "npx",
      "args": ["-y", "@azure/mcp@latest", "server", "start"]
    }
  },
  "inputs": [
    { "id": "gh_pat", "type": "promptString", "description": "GitHub PAT", "password": true }
  ]
}
```

Reload VS Code → Chat → Agent mode → you should see the new tools selectable in the tool picker.

🎯 **Exam tip — Copilot:** the `inputs[]` array is the **secure way to prompt for secrets** (won't appear in chat history). Never hard-code tokens in `mcp.json`.

## 7.4 Use an MCP server from agent mode

In Agent mode chat:

> *"Using the github MCP server, list every open issue in `mail2raji/doc-rag` labeled `bug`, group by file affected (run `gh search code` if needed), and propose a 3-PR plan to fix them."*

Agent mode will pick the tools it needs, show you the plan, request your approval for each tool call (unless you trust it), and iterate.

## 7.5 Write your own MCP server in Python — `genai-eval` server

A real-world server you'd actually use: it lets Copilot run your RAG eval and read the report.

`requirements.txt`:

```
mcp[cli]>=1.2.0
```

`server.py`:

```python
from mcp.server.fastmcp import FastMCP
import json, subprocess, pathlib

app = FastMCP("genai-eval")

@app.tool()
def run_eval(suite: str = "golden", model: str = "gpt-4o-mini") -> str:
    """Run the RAG eval suite. Returns a path to the HTML report."""
    out = f"reports/eval-{suite}-{model}.html"
    subprocess.run(["python", "eval.py", "--suite", suite, "--model", model, "--out", out], check=True)
    return out

@app.tool()
def read_eval_summary(report_path: str) -> dict:
    """Return a JSON summary of a previously generated eval report."""
    raw = pathlib.Path(report_path).with_suffix(".json").read_text()
    return json.loads(raw)

@app.resource("eval://latest/summary")
def latest() -> str:
    """The latest eval summary, as JSON."""
    return pathlib.Path("reports/latest.json").read_text()

if __name__ == "__main__":
    app.run()
```

Register it in `.vscode/mcp.json`:

```json
"genai-eval": {
  "type": "stdio",
  "command": "python",
  "args": ["server.py"],
  "cwd": "${workspaceFolder}"
}
```

In Copilot agent mode:

> *"Run `run_eval` for suite `golden` on `gpt-4o-mini` and `gpt-4o`. Compare the two summaries and write a Markdown report at `reports/compare.md`."*

Copilot will: call `run_eval` twice → call `read_eval_summary` twice → compose the report → write the file. You have effectively built an *agentic eval pipeline* in 30 lines of Python.

⚠️ **Production gotcha:** MCP server tools run on **your laptop** (for stdio) with **your user privileges**. Sandbox or rate-limit anything dangerous.

## 7.6 Skills, prompt files, and chat modes — Copilot's customization stack

| Layer | File | When loaded |
|---|---|---|
| **Custom instructions** | `.github/copilot-instructions.md` | every chat, every prompt |
| **Prompt files** | `.github/prompts/*.prompt.md` | invoked with `/<name>` |
| **Skill files** | `.github/skills/<name>/SKILL.md` | model self-selects based on description |
| **Chat modes** (subagents) | VS Code chat → "agents" config | invoked by user picking a mode |

🎯 **Exam tip — Copilot:** know that **skill files** are *model-selected* — the model decides whether the task matches a skill's description. **Prompt files** are *user-selected*. Heavily tested.

### Skill example

`.github/skills/eval-rag/SKILL.md`:

```markdown
---
description: Run the RAG eval and summarize results. Use when the user mentions "evaluate", "RAG eval", "regression", or asks to compare model versions on retrieval tasks.
---
# Eval RAG skill

When invoked:

1. Call the `genai-eval` MCP server tool `run_eval` with the user's chosen model.
2. Call `read_eval_summary` on the returned path.
3. Render a table with columns: Category, Accuracy, Latency, Cost.
4. Highlight any category below 80% accuracy in **bold**.

Never run more than 3 evals per minute (rate limit).
```

Now when a user asks *"can you evaluate the new prompt against the golden set?"*, Copilot's agent self-selects this skill and follows the steps.

## 7.7 Chat modes — your own scoped subagents

`.github/chatmodes/security-review.chatmode.md`:

```markdown
---
description: Security-focused review mode for AI repos
tools: ['codebase', 'editFiles', 'terminal']
---
You are a senior security engineer reviewing a GenAI repo.
Focus on: prompt injection vectors, leaked API key patterns, unsafe deserialization, SSRF in tool calls, unguarded eval() in agents.
Refuse general coding requests; redirect them to the default agent.
```

VS Code chat → pick `security-review` → ask *"review this PR"*. You get a scoped, opinionated subagent without writing code.

## 7.8 Five agentic patterns to know (exam-tested + real-world)

### 7.8.1 Router

LLM decides which sub-agent or sub-tool to call. Cheap models route; expensive models execute.

> *Example:* customer-support agent routes "refund" → billing tool, "ticket update" → ServiceNow tool, "unknown" → human.

### 7.8.2 ReAct (Reason + Act)

The model writes its reasoning out, picks a tool, observes the result, repeats. Default for Copilot agent mode.

### 7.8.3 Plan-and-execute

Two phases: (1) the model writes a step-by-step plan; (2) executes each step (possibly with a different / smaller model). Lower variance, easier to debug.

### 7.8.4 Orchestrator-workers

One LLM plans + delegates parallelizable sub-tasks to worker LLMs/tools. Great for *"analyze 50 PRs and summarize"*.

### 7.8.5 Evaluator-optimizer

Generator writes a draft; an evaluator critiques; loop until the evaluator says *"good enough"*. The canonical pattern for **prompt optimization** and **AI code review**.

🎯 **Exam tip — Copilot (advanced):** know all five. Be able to pick the right one for a scenario. The exam loves *"orchestrator-workers vs plan-and-execute — what's the difference?"*

## 7.9 Real-world agentic build — *AutoTriage* with Copilot + MCP

A real workflow you can ship in a day:

1. **Goal:** when a new issue is opened in `doc-rag`, an agent triages it (label, suggest milestone, ping likely owner).
2. **Trigger:** GitHub Actions workflow on `issues.opened`.
3. **Agent host:** a small Python script invoking the `mcp` SDK to call:
   - `github-mcp-server` (to read the issue, set labels, post comments)
   - `genai-eval` (to determine whether the issue references a regression in evals)
4. **Plan:** Copilot agent mode writes the script for you. You review.
5. **Deploy:** Actions workflow runs the script with `secrets.GITHUB_TOKEN` and `secrets.OPENAI_API_KEY`.

You will build exactly this in **Capstone #2** in Chapter 10.

## 7.10 Safety rails for agentic Copilot — must-knows for production

- **Tool allow-list** — in agent mode, explicitly whitelist the tools available; never trust a model to "only call safe ones".
- **Approval mode** — keep "require approval for tool calls" on in unfamiliar repos.
- **Dry-run** for destructive tools — every tool that writes should support `--dry-run`.
- **Rate limits** — your MCP tool functions should rate-limit themselves; agents *will* loop.
- **Idempotency** — agents may call the same tool twice. Make tools idempotent or surface the duplicate.
- **Audit log** — log every tool call with parameters. Required for production.

⚠️ **Production gotcha:** the #1 cause of agentic incidents is "the agent did something correct in dev, then in prod it ran against real data". Always test against a sandbox with realistic shapes, never just toy data.

## 7.11 Mini-quiz (12 questions)

1. Four building blocks of an MCP server?
2. Transports MCP supports?
3. Where do you put `mcp.json` for a workspace-level config?
4. Difference between a skill file and a prompt file?
5. Who selects a skill — user or model?
6. Where do MCP stdio servers run?
7. Which agentic pattern uses generator + evaluator looping?
8. ReAct stands for?
9. In agent mode, what should "approval mode" be in production?
10. What is sampling in MCP?
11. Where is the chat mode config file?
12. Name three real-world MCP servers you'd add to a GenAI workspace.

Answers in [Phase7_Agentic_AI_Copilot/exercises.md](Phase7_Agentic_AI_Copilot/exercises.md).

## 7.12 Exercises (do all 10)

1. **Install + connect** the `filesystem` and `github` MCP servers to Copilot.
2. **Write `genai-eval`** server from §7.5; verify Copilot can call both tools.
3. **Add a resource** to `genai-eval` exposing `prompts://current/system`; have Copilot read it.
4. **Custom skill** — write `.github/skills/eval-rag/SKILL.md`. Test it triggers on relevant prompts.
5. **Chat mode** — write `security-review.chatmode.md`. Test it answers a security question correctly.
6. **Router pattern** — write a Copilot prompt that classifies issues into `bug`, `feature`, `question` and routes accordingly.
7. **Evaluator-optimizer** — write an MCP tool that scores a prompt; build a chat workflow that loops until the evaluator scores ≥ 0.9.
8. **AutoTriage** — implement the §7.9 workflow end-to-end on a test repo.
9. **Approval mode** — turn on approval; observe Copilot pausing before each tool call. Disable it in a sandbox repo only.
10. **Audit log** — wrap each MCP tool with a logger; produce a daily JSON Lines audit log.

---

<a id='chapter-8'></a>

# Chapter 8 — GitHub Advanced Security + Administration

> **You will:** secure your AI repos with **secret scanning** (with custom patterns for `sk-…` keys), **code scanning** (CodeQL), **Dependabot**, **push protection**, and **security overview** — then **administer** an org/enterprise with SSO, SCIM, teams, audit log, rulesets, and Actions policies.

This chapter owns the **GHAS** and **Administration** certifications. It is intentionally long.

### 🧒 If you were 10 years old

Think of GHAS + Admin as the **safety system in your school**:

- **Secret scanning** = the metal detector at the door. If anyone tries to bring something dangerous (an API key), it beeps.
- **Push protection** = the door **just won't open** until you put the dangerous thing away. Better than beeping after the fact.
- **CodeQL (code scanning)** = the X-ray machine that looks for hidden bugs inside your bag (your code), not just on the outside.
- **Dependabot** = the parent who checks every toy you bring home for recalls and tells you, *"that one was found unsafe last week — here's a replacement."*
- **SSO** = the school ID badge. One badge opens every door — no more remembering 10 passwords.
- **SCIM** = the office that **adds your badge when you join** and **deletes it the day you leave**, automatically.
- **Audit log** = the security camera footage of every door anyone opened today.
- **Rulesets** = the school rules posted on every classroom: *"no running, no candy, no merging to main without review."*

The goal: **make safe behavior the default**, not something you have to remember.

### 🌍 Real-world situation — when to use this

**Situation:** A new engineer joins the team, accidentally commits an `OPENAI_API_KEY` in a `.env` file, and pushes. Without GHAS, the key is now visible in your git history forever. *With* push protection enabled:

```text
remote: error: GH009: Found secret of type "OpenAI API Key" at commit a1b2c3 in src/.env
remote: To unblock, remove the secret, or visit:
remote:   https://github.com/org/repo/security/secret-scanning/unblock-secret/...
remote: Push rejected.
```

The push is **rejected before it ever lands on GitHub**. The key never enters history. Crisis averted.

Enable it once for the whole org:

```powershell
# Org-level via API — turn on secret scanning + push protection by default for every repo.
gh api -X PATCH /orgs/your-org `
  -F secret_scanning_enabled_for_new_repositories=true `
  -F secret_scanning_push_protection_enabled_for_new_repositories=true

# Optional: register a custom pattern for your internal vault.
# Settings -> Code security -> New custom pattern
# Name:        Internal Vault Token
# Regex:       \bvlt-[A-Za-z0-9]{32}\b
# Test string: vlt-AbCdEfGhIjKlMnOpQrStUvWxYz012345
```

One policy, *every* repo, *every* push. **That** is GHAS doing its job.

## 8.1 What is GHAS?

**GitHub Advanced Security (GHAS)** is the security suite that ships with GitHub Enterprise (and is also available standalone for some plans).

GHAS includes:

- **Secret scanning** (incl. push protection, custom patterns).
- **Code scanning** (CodeQL, third-party SARIF uploads, Copilot Autofix).
- **Dependency review** (PR-time vuln check) and **Dependabot** (alerts, security updates, version updates).
- **Security overview** (org-level dashboard).
- **AI-powered remediation** (Copilot Autofix — formerly "code scanning autofix").

🎯 **Exam tip — GHAS:** **Security overview** is **org/enterprise scoped**, not repo scoped. Memorize.

## 8.2 Code scanning with CodeQL — the 80/20

**CodeQL** is GitHub's semantic code analysis engine. It treats code as a database and runs queries against it.

Enable in two lines: Settings → Code security → enable **Code scanning** → "Default setup" — CodeQL is configured automatically with a managed workflow.

**Advanced setup** — for control:

`.github/workflows/codeql.yml`:

```yaml
name: CodeQL
on:
  push:
    branches: [main]
  pull_request:
    branches: [main]
  schedule:
    - cron: '0 5 * * 0'

permissions:
  actions: read
  contents: read
  security-events: write

jobs:
  analyze:
    runs-on: ubuntu-latest
    strategy:
      fail-fast: false
      matrix:
        language: ['python', 'javascript-typescript']
    steps:
      - uses: actions/checkout@v4
      - uses: github/codeql-action/init@v3
        with:
          languages: ${{ matrix.language }}
          queries: security-extended    # or security-and-quality
      - uses: github/codeql-action/autobuild@v3
      - uses: github/codeql-action/analyze@v3
        with:
          category: "/language:${{ matrix.language }}"
```

Languages supported (always check docs): C/C++, C#, Go, Java/Kotlin, JavaScript/TypeScript, Python, Ruby, Swift.

🎯 **Exam tip — GHAS:** CodeQL **default setup** is one click but customizes less. **Advanced setup** is a workflow file you control. Both upload SARIF to GitHub.

## 8.3 Reading and fixing code scanning alerts

Repo → **Security** → **Code scanning**. Each alert has:

- **Rule** (CWE category).
- **Severity** (critical / high / medium / low).
- **Path + line**.
- **Data flow** (where the tainted input came from).

Fix workflow:

1. Open alert.
2. Click **Generate fix with Copilot** (Copilot Autofix) to get a proposed PR.
3. Review the diff. Adjust.
4. Push → CodeQL re-scans → alert closes automatically.

You can also **dismiss** an alert with a reason: *won't fix, false positive, used in tests*. This is logged.

## 8.4 Secret scanning + push protection

**Secret scanning** detects credentials in code by matching publisher-provided regex patterns (AWS, OpenAI, Azure, Stripe, etc.). It runs on:

- **History** — scans all commits in a public repo (free) or any repo (GHAS).
- **Push protection** — blocks the push *before* the secret hits the server.

Enable: Settings → Code security → **Secret scanning** → **Push protection**.

A blocked push looks like:

```
remote: error: GH013: Repository rule violations found for refs/heads/main.
remote: - GITHUB PUSH PROTECTION
remote:   Resolve the following:
remote:     - Secret type: OpenAI API key
remote:       Locations:
remote:         - commit: a1b2c3   path: app.py:42
```

Developer options: remove the secret and re-push, or bypass with a reason (logged + alerts security team).

### Custom patterns (e.g., your internal Vault token)

Org Settings → Code security → Secret scanning → **Custom patterns** → New pattern:

- Name: `Internal Vault token`
- Regex: `vlt-[A-Z0-9]{32}`
- Test string: `vlt-AB12CD34EF56GH78IJ90KL12MN34OP56`

Once published, push protection blocks any push matching the pattern.

🎯 **Exam tip — GHAS:** custom patterns can be **dry-run** before publishing (`Save as dry run`). The dry-run reports matches without blocking.

⚠️ **Production gotcha:** even after secret scanning flags a key, you must **rotate** it. Never trust deletion alone.

## 8.5 Dependabot — three faces

| Feature | What it does |
|---|---|
| **Dependabot alerts** | tells you a dependency has a known vuln (CVE) |
| **Dependabot security updates** | opens a PR fixing the vuln |
| **Dependabot version updates** | scheduled PRs to keep deps fresh, not just security |

Enable alerts + security updates in Settings → Code security.

`.github/dependabot.yml` for version updates:

```yaml
version: 2
updates:
  - package-ecosystem: "pip"
    directory: "/"
    schedule: { interval: "weekly", day: "monday" }
    open-pull-requests-limit: 5
    groups:
      ai-libs:
        patterns: ["openai", "anthropic", "langchain*", "llama-index*"]
  - package-ecosystem: "github-actions"
    directory: "/"
    schedule: { interval: "monthly" }
  - package-ecosystem: "docker"
    directory: "/"
    schedule: { interval: "weekly" }
```

🎯 **Exam tip — GHAS:** alerts and security updates are **GHAS** (or free for public). Version updates are **free for everyone**.

## 8.6 Security overview, security advisories, GHAS metrics

- **Security overview** (org level) — dashboard of all alerts across all repos.
- **Security advisories** (repo level) — your private staging area for disclosing CVEs in *your* code.
- **GHAS metrics** — APIs and built-in reports for "how many alerts, time-to-remediate, who fixed".

🎯 **Exam tip — GHAS:** know that a **draft security advisory** can be used to request a CVE number and to privately collaborate with researchers, *then* publish.

## 8.7 Authentication & users — SSO, SCIM, PATs

### SAML SSO (Enterprise)

Org Settings → Authentication security → Configure SSO with your IdP (Okta, Azure AD/Entra ID, OneLogin). Members sign in via the IdP; PATs and SSH keys must be **authorized for SSO**.

### SCIM (Enterprise)

Automated provisioning + deprovisioning from your IdP. When you offboard an employee in HR → IdP → SCIM → GitHub revokes their org membership in minutes.

🎯 **Exam tip — Admin:** SAML alone authenticates but does not deprovision. **SCIM** does deprovision. Both together = full lifecycle.

### Personal access tokens

- **Classic PATs** — broad scopes; the *legacy* option.
- **Fine-grained PATs** — repo-scoped, time-bounded, *expiring*. The modern recommendation.
- **GitHub Apps** — preferred over PATs for any integration.

### Outside collaborators, base permissions

- **Members** — belong to the org.
- **Outside collaborators** — invited per-repo; don't count against org seats for some features.
- **Base permissions** (org level) — default repo permission for members.

## 8.8 Organizations & teams

```powershell
gh org create my-org      # not via gh in all plans; use UI
gh api orgs/my-org/teams -X POST -f name="rag-team" -f privacy=closed
gh api orgs/my-org/teams/rag-team/memberships/raji -X PUT -f role=maintainer
```

**Nested teams** — child teams inherit parent's repo access. Great for *Engineering → AI → RAG Team*.

**Team review assignment** — auto-distribute review requests in round-robin or load-balanced.

🎯 **Exam tip — Admin:** **CODEOWNERS** file (`.github/CODEOWNERS`) maps file globs to teams; combined with branch protection, you can require a code-owner review.

```
# Sample CODEOWNERS
*.py                 @mail2raji/rag-team
infra/**             @mail2raji/platform
.github/workflows/** @mail2raji/security
```

## 8.9 Policies, audit log, IP allow lists

### Audit log

Org Settings → Audit log. Every privileged action is recorded: PAT use, member added, repo deleted, secret accessed.

```powershell
gh api orgs/mail2raji/audit-log?phrase=action:repo.create
```

Stream to **Splunk, Azure Event Hubs, Datadog, or S3** for long-term retention.

🎯 **Exam tip — Admin:** the audit log retains data for **6 months** by default on Enterprise Cloud; streaming preserves it indefinitely.

### IP allow lists

Org Settings → Authentication → IP allow list. Members must connect from approved IPs. Useful for regulated environments.

### Restrict 3rd-party app access

Org Settings → Third-party Access → toggle off. Then approve apps individually.

## 8.10 Rulesets — org-scoped policy

A **ruleset** can target many repos and many branches with a single policy. Replaces classic branch protection at scale.

```json
{
  "name": "Protect main everywhere",
  "target": "branch",
  "enforcement": "active",
  "conditions": {
    "ref_name": { "include": ["~DEFAULT_BRANCH"] }
  },
  "rules": [
    { "type": "pull_request", "parameters": { "required_approving_review_count": 1, "require_code_owner_review": true } },
    { "type": "required_signatures" },
    { "type": "required_status_checks", "parameters": { "required_status_checks": [{ "context": "CodeQL" }] } },
    { "type": "non_fast_forward" }
  ]
}
```

🎯 **Exam tip — Admin:** ruleset **enforcement** can be `active`, `evaluate` (dry-run), or `disabled`. Memorize.

## 8.11 GHES, migrations, Actions for the enterprise

### GitHub Enterprise Server (GHES) — self-hosted

- Runs on your VM / cloud account.
- Mirrors features of GitHub.com Enterprise (with some delay).
- Manages its own upgrades; you control the data.

🎯 **Exam tip — Admin:** GHES has **major upgrades quarterly**, **patch releases monthly**. Each release has a defined support window.

### Migrations

- **Importer** (Importer / `ghe-migrator`) — repo-by-repo or org-level.
- **GitHub Enterprise Importer (GEI)** — modern, supports GitLab, Bitbucket, ADO sources to github.com.
- **Audit migration mode** — temporarily archive repos during cutover.

### Actions at enterprise scale

- **Org-level allowed actions list** — restrict to verified creators only, or specific allow list.
- **Runner groups** — control which repos can use which self-hosted runners.
- **Limit OIDC subject claims** — customize the OIDC subject to be more specific.
- **Required workflows** — enterprise policy: this workflow must run on every repo.

🎯 **Exam tip — Admin:** required workflows are **enterprise-level** and inject a workflow into every selected repo. Repo admins can't disable them.

## 8.12 Mini-quiz (15 questions)

1. Which security feature ships free for public repos but is GHAS-only for private?
2. CodeQL default vs advanced setup — what's the difference?
3. What does push protection do that history scanning doesn't?
4. After secret scanning flags a key, what's the mandatory next step?
5. Dependabot security updates vs version updates — which is free?
6. Where is the org security overview?
7. SAML vs SCIM — which deprovisions?
8. Classic PAT vs fine-grained PAT — which expires?
9. Where do you set base permissions for the org?
10. What does a CODEOWNERS file do?
11. Audit log default retention on Enterprise Cloud?
12. Where do you require Signed commits at scale?
13. Three enforcement modes of a ruleset?
14. What's a runner group used for?
15. What is GEI?

Answers in [Phase8_GHAS_Admin/exercises.md](Phase8_GHAS_Admin/exercises.md).

## 8.13 Exercises (do all 12)

1. **Enable code scanning (default)** on `doc-rag`. Push intentionally vulnerable code (`eval(user_input)`) and verify the alert.
2. **Migrate to advanced setup** — convert the default workflow into a customized one with `security-extended`.
3. **Copilot Autofix** — accept Copilot's autofix on one alert; verify the alert closes after merge.
4. **Push protection** — push a file containing a real-looking OpenAI key. Verify the push is blocked.
5. **Custom pattern** — register the `vlt-…` pattern in dry-run, observe matches, then publish.
6. **Dependabot config** — add the §8.5 `dependabot.yml`. Merge the first 3 PRs.
7. **SARIF upload** — write a Bandit run that uploads SARIF to GitHub via `github/codeql-action/upload-sarif@v3`.
8. **CODEOWNERS** — require code-owner review for `prompts/**`. Verify a PR touching that path is blocked without owner review.
9. **Ruleset** — write the §8.10 JSON, push via API, observe enforcement.
10. **Audit log stream** — set up streaming to Azure Event Hubs (sandbox). Send one test event.
11. **IP allow list** — enable for a test org; verify you can/can't push from off-list IPs.
12. **OIDC subject customization** — limit OIDC subject claims for a sandbox org; verify federated workflows still work.

---

<a id='chapter-9'></a>

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

<a id='chapter-10'></a>

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

<a id='appendix-a'></a>

# Appendix A — Cheat sheets

## A.1 The Git command cheatsheet

```
# Setup
git init                                   start a repo
git clone <url>                            copy a repo
git config --global user.name "Name"
git config --global user.email "e@m"

# Status / inspect
git status                                 working / staging diff
git diff                                   unstaged vs working
git diff --staged                          staged vs last commit
git log --oneline --graph --all
git blame <file>
git show <sha>

# Stage / commit
git add <file> | -p | -u | -A
git commit -m "..."
git commit --amend -m "..."

# Branch / switch
git branch
git switch -c feat/x
git switch main
git branch -d feat/x      (-D for force)

# Sync
git fetch [origin]
git pull
git push [-u origin <branch>]
git push --force-with-lease

# Merge / rebase / pick
git merge feat/x
git rebase main
git rebase -i HEAD~5
git cherry-pick <sha>

# Save / restore
git stash push -m "wip"
git stash list
git stash pop
git restore <file>
git restore --staged <file>
git reset --soft HEAD~1
git reset --hard HEAD~1
git revert <sha>
git reflog

# Tags / releases
git tag -a v1.0.0 -m "..."
git push origin v1.0.0

# History
git log -p <file>
git bisect start
git bisect bad / good <ref>
git filter-repo --replace-text rules.txt
```

## A.2 `gh` cheatsheet (top 30)

```
gh auth login / status / refresh -s <scope>
gh repo create / clone / view / fork / delete
gh repo edit --visibility private
gh issue list / view / create / close / reopen / comment / edit
gh pr list / view / create / checkout / review / merge --squash
gh pr checks
gh workflow list / run / view
gh run list / view / watch / cancel
gh release create / list / view / delete / upload
gh secret list / set / delete (-R / -O for repo / org)
gh variable list / set / delete
gh project create / item-add / item-edit
gh extension install / list / upgrade --all
gh copilot suggest / explain / config / alias
gh api <endpoint> -X POST -f key=value
gh search code "term" --repo=owner/repo
gh ssh-key add / list
```

## A.3 Actions YAML one-pager

```yaml
name: CI
on:
  push: { branches: [main] }
  pull_request:
  schedule: [{ cron: '0 2 * * *' }]
  workflow_dispatch:
permissions:
  contents: read
  id-token: write
concurrency:
  group: ${{ github.workflow }}-${{ github.ref }}
  cancel-in-progress: true
jobs:
  test:
    runs-on: ubuntu-latest
    strategy:
      fail-fast: false
      matrix: { python: ['3.11','3.12'] }
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-python@v5
        with: { python-version: ${{ matrix.python }}, cache: 'pip' }
      - run: pip install -r requirements.txt
      - run: pytest -q
      - uses: actions/upload-artifact@v4
        with: { name: junit-${{ matrix.python }}, path: report.xml }
  deploy:
    needs: test
    if: github.ref == 'refs/heads/main'
    runs-on: ubuntu-latest
    environment: production
    steps:
      - uses: azure/login@v2
        with:
          client-id:       ${{ vars.AZURE_CLIENT_ID }}
          tenant-id:       ${{ vars.AZURE_TENANT_ID }}
          subscription-id: ${{ vars.AZURE_SUBSCRIPTION_ID }}
      - run: az containerapp up -g rag-rg -n doc-rag --image ghcr.io/me/x:${{ github.sha }}
```

## A.4 Copilot keyboard shortcuts (VS Code)

| Shortcut | Action |
|---|---|
| `Ctrl+I` | Inline chat in the editor |
| `Ctrl+Alt+I` | Open Chat side panel |
| `Tab` | Accept the completion |
| `Esc` | Dismiss completion |
| `Alt+]` / `Alt+[` | Next / previous suggestion |
| `Ctrl+Enter` | Open suggestions panel (multiple variants) |
| `Ctrl+Shift+I` (macOS: `Cmd+Shift+I`) | Open Copilot Chat → Agent |

---

<a id='appendix-b'></a>

# Appendix B — Glossary

| Term | Meaning |
|---|---|
| **Branch** | a movable pointer to a commit |
| **HEAD** | the pointer to the current commit |
| **Staging index** | snapshot of the next commit |
| **Fork** | server-side copy of a repo under another namespace |
| **PR (Pull Request)** | proposal to merge two branches |
| **Rebase** | replay commits on a new base |
| **Cherry-pick** | copy a commit to another branch |
| **OIDC** | OpenID Connect; passwordless federated identity |
| **Ruleset** | org-scoped policy applied to branches/tags |
| **GHAS** | GitHub Advanced Security suite |
| **CodeQL** | semantic code analysis engine |
| **SARIF** | Static Analysis Results Interchange Format |
| **Dependabot** | dependency alert + update bot |
| **MCP** | Model Context Protocol — tool/resource standard for LLM agents |
| **Skill file** | `SKILL.md` Copilot auto-invokes by description |
| **Prompt file** | `*.prompt.md` invoked by user with `/name` |
| **Chat mode** | scoped Copilot subagent with its own system prompt + tools |
| **Composite action** | reusable bundle of steps |
| **Reusable workflow** | a workflow callable via `workflow_call` |
| **`pull_request_target`** | trigger with base-branch code + secrets; high-risk if PR code is checked out |
| **Required workflow** | enterprise policy that injects a workflow into selected repos |
| **GEI** | GitHub Enterprise Importer |
| **SCIM** | System for Cross-domain Identity Management — automated provisioning |
| **PAT** | Personal Access Token (classic or fine-grained) |
| **`$GITHUB_TOKEN`** | workflow-scoped short-lived token created by Actions |

---

<a id='appendix-c'></a>

# Appendix C — Further reading

1. *Pro Git* — Chacon & Straub, 2nd ed (free online). Definitive Git reference.
2. **GitHub Docs** → start at `docs.github.com`, especially Actions, Copilot, Code security.
3. **The Copilot Trust Center** → `github.com/security/advanced-security` (architecture and threat-model details).
4. **MCP spec** → `modelcontextprotocol.io`. Read the *Tools*, *Resources*, *Sampling* sections.
5. **Anthropic — "Building Effective Agents"** essay. Best primer on the five agent patterns.
6. **OWASP LLM Top 10** — `genai.owasp.org`. Covers prompt injection, tool abuse, data poisoning.
7. **GitHub Skills** — `skills.github.com`. Free, interactive labs by GitHub.
8. **Exam registration** — `examregistration.github.com`. Always check the current outline before scheduling.
9. **GitHub Changelog** — `github.blog/changelog`. Subscribe; new features appear here first.
10. **GitHub Engineering Blog** — `github.blog/engineering`. Deep dives on internals.

---

## End of book

You have:

- A mental model that survives any Git breakage.
- Five GitHub certifications within reach.
- Five production capstones you have built — or at least sketched in enough detail to defend.
- A workflow that uses Copilot as a multiplier across plan, code, test, deploy, secure, document.

The next thing to do is *not* to read more — it is to ship something. Open a new repo, point Copilot at it, and build the smallest thing that's useful. The exam will then be a paperwork formality.

🎉 Good luck.

— mail2raji, 2026
