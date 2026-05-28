# Phase 2 — Exercise & quiz answers

## Quiz answers (Chapter 2)

| Q | Answer | Why |
|---|---|---|
| 1 | Fork | Server-side copy under your namespace; preserves connection to upstream |
| 2 | PR | Proposal to merge two branches; carries review + discussion |
| 3 | Squash merge | Collapses N commits into 1; clean history |
| 4 | `CODEOWNERS` | Auto-requests reviews from path-matched teams |
| 5 | Draft PR | Communicates intent without requesting review yet |
| 6 | Discussions | Long-form Q&A, not bug tracking |
| 7 | Tags vs Releases | Tag = git ref; Release = GitHub object on top of a tag |
| 8 | Project (v2) | Cross-repo task board with custom fields |
| 9 | `.github/PULL_REQUEST_TEMPLATE.md` | Default PR body template |
| 10 | Notifications | Watch / Participating / All-activity; default per-repo |

## Tip

When you delete a branch on merge, GitHub still preserves it via the PR's *Restore branch* button for 90 days. Useful safety net.
