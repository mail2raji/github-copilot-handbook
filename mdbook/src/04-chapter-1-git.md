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

Answers in [Phase1_Git_Fundamentals/exercises.md](https://github.com/mail2raji/github-copilot-handbook/blob/main/Phase1_Git_Fundamentals/exercises.md).

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
