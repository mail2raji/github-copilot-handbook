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

Answers in [Phase6_Copilot_CLI/exercises.md](https://github.com/mail2raji/github-copilot-handbook/blob/main/Phase6_Copilot_CLI/exercises.md).

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
