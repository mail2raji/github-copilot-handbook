# Phase 1 — Exercise & quiz answers

## Quiz answers (Chapter 1)

| Q | Answer | Why |
|---|---|---|
| 1 | `git init` | Creates `.git/` to make a folder a repo |
| 2 | working dir → staging → HEAD | Three trees |
| 3 | `git restore --staged file` | Unstage without losing edits |
| 4 | `git switch -c feat/x` | Modern branch creation |
| 5 | `git commit --amend` | Rewrite the last commit |
| 6 | `git stash` | Park dirty changes safely |
| 7 | `git revert <sha>` | Safe inverse commit; never rewrite shared history |
| 8 | `git reflog` | Time machine of HEAD movements; recovery |
| 9 | fast-forward | Linear catch-up; no merge commit |
| 10 | `HEAD` | The pointer to your current commit (often via a branch) |

## Common mistakes

- **`git reset --hard` without a backup branch** — make a habit of `git branch backup-$(date +%s)` before risky resets.
- **Committing secrets** — never. We will fix this with push protection in Phase 8.
- **Merging into `main` directly without a PR** — fine when learning solo, but Phase 2 will enforce PR-based flow.
