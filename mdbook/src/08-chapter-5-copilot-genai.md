# Chapter 5 — GitHub Copilot for GenAI

> **You will:** master GitHub Copilot end-to-end — completions, chat, inline chat, agent mode, custom instructions, prompt files, slash commands, vision, context exclusions, and Responsible AI — specifically for **GenAI / Agentic AI** engineering.

> **Scenario:** You build a GenAI feature pipeline (RAG + tool-using agent) and let Copilot accelerate every layer — code, tests, docs, eval prompts, and Bicep/Terraform deploys.

This chapter is also the **largest** because it owns the majority of the **GitHub Copilot certification**.

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
