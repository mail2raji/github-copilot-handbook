# Phase 1 — Git Fundamentals

> **Goal:** be unbreakable at solo Git workflows — init, commit, branch, merge, undo — using the "three trees" model.

Companion to Chapter 1 in [BOOK.md](../BOOK.md#chapter-1). Do every drill here before moving to GitHub multi-person workflows.

## Mental model

```
working dir   <--  git checkout/restore  --  staging  <-- git reset --  HEAD (last commit)
working dir   --  git add  -->  staging   --  git commit  -->  HEAD
```

Memorize these three states. Every Git command moves a file between them.

## 8 hands-on exercises

| # | Exercise | What it teaches |
|---|---|---|
| 1 | `git init` a `rag-notes` repo, commit a README | Bootstrap |
| 2 | Stage selective hunks with `git add -p` | Staging granularity |
| 3 | Rename `notes.md` → `chapter1.md` with `git mv` | History preservation |
| 4 | Create `feat/embedding`, commit, merge into `main` | Branching |
| 5 | Force a conflict by editing the same line on both branches; resolve | Merge conflicts |
| 6 | Use `git stash` to park a half-done feature; restore | Context switching |
| 7 | Amend the last commit message with `git commit --amend` | History rewrite (safe) |
| 8 | Use `git reflog` to recover a commit you "lost" with `git reset --hard` | Safety net |

## Mini quiz answers

Answers to the 10-question Chapter 1 quiz are in [exercises.md](exercises.md).

## Next

[Phase 2 — GitHub Basics](../Phase2_GitHub_Basics/README.md).
