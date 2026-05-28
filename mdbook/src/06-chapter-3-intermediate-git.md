# Chapter 3 — Intermediate Git

> **You will:** master rebase, cherry-pick, stash, reflog, bisect, submodules, worktrees, hooks, and history-rewrite — the commands that separate a *junior* from a *senior* engineer.

> **Scenario:** Your RAG service is now a team project. You will keep history clean across many parallel feature branches, recover deleted commits, bisect a regression in retrieval accuracy, and pre-commit-block accidentally committed OpenAI keys.

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
