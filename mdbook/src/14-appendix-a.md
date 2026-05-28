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
