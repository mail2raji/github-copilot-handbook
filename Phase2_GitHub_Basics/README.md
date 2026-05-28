# Phase 2 — GitHub Basics

> **Goal:** be fluent in repos, issues, PRs, forks, releases, projects, discussions.

Companion to Chapter 2 in [BOOK.md](../BOOK.md#chapter-2).

## What you build

A `rag-notes` GitHub repo with:

- A public README + LICENSE.
- A `feature/embedding` branch + PR + review + merge.
- 3 labels (`bug`, `feature`, `docs`) + 2 milestones.
- An open issue, a closed issue, a release `v0.1.0`.
- A discussions tab with one welcome thread.
- A Project (table view) tracking the issues.

## 6 exercises

1. **Repo bootstrap** — `gh repo create mail2raji/rag-notes --public --add-readme --license MIT --gitignore Python`.
2. **First PR via CLI** — `gh pr create --fill --base main`.
3. **Review** — `gh pr review --comment -b "looks great"` then `gh pr merge --squash --delete-branch`.
4. **Issue templates** — add `.github/ISSUE_TEMPLATE/bug.yml` and `feature.yml`.
5. **Release** — `gh release create v0.1.0 --notes "initial"`.
6. **Project** — `gh project create --owner mail2raji --title "RAG Notes Roadmap"`.

## Quiz answers

See [exercises.md](exercises.md).

## Next

[Phase 3 — Intermediate Git](../Phase3_Intermediate_Git/README.md).
