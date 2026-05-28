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

Answers in [Phase4_GitHub_Actions/exercises.md](https://github.com/mail2raji/github-copilot-handbook/blob/main/Phase4_GitHub_Actions/exercises.md).

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
