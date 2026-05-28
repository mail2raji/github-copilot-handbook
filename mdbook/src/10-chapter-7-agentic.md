# Chapter 7 — Building Agentic AI with Copilot, MCP & Skills

> **You will:** turn Copilot into a planner/executor for *your* tools by writing **Model Context Protocol (MCP) servers**, **skills**, and **prompt files**. You'll also learn the patterns that show up in advanced Copilot exam scenarios.

> **Scenario:** Your team has 10 internal tools (Jira, ServiceNow, Splunk, Snyk, internal APIs). Instead of writing a custom agent from scratch, you let Copilot's agent mode call them via MCP. Copilot becomes the cockpit; your repo + MCP servers become the toolbelt.

### 🧒 If you were 10 years old

Imagine you have a robot friend who is **really smart but has no hands**. You give the robot tools:

- A **calculator** (for math).
- A **dictionary** (for word meanings).
- A **notepad** (for remembering).
- A **walkie-talkie to mom** (for asking permission before doing big things).

Now when you say, *"robot, do my math homework,"* the robot **plans** the steps, picks up the **calculator**, writes answers in the **notepad**, and if it's about to do something risky, **buzzes mom** first.

That handing-out-tools system is called **MCP — the Model Context Protocol**. It is the same plug for *every* AI tool, so the robot doesn't need to relearn each one.

- **Tool** = something the robot can *do* (e.g. "send email").
- **Resource** = something the robot can *read* (e.g. "my homework PDF").
- **Prompt** = a saved instruction (e.g. "always answer politely").
- **Skill** = an instruction the robot picks up automatically when the situation matches.

You go from a smart robot that just talks → a smart robot that **gets things done safely**.

### 🌍 Real-world situation — when to use this

**Situation:** When a new GitHub issue is opened in your team's repo, you want Copilot to: read the issue → check the codebase → suggest a label → assign to the right person — *without* you doing anything.

Step 1 — register an MCP server in `.vscode/mcp.json`:

```json
{
  "servers": {
    "github": {
      "command": "docker",
      "args": ["run","-i","--rm","-e","GITHUB_PERSONAL_ACCESS_TOKEN","ghcr.io/github/github-mcp-server"],
      "env": { "GITHUB_PERSONAL_ACCESS_TOKEN": "${input:gh_token}" }
    }
  }
}
```

Step 2 — write a skill file Copilot picks up automatically:

```markdown
---
name: triage-issue
description: Triage a newly opened GitHub issue. Reads the issue, picks 1-3 labels, suggests assignee.
---

# Triage skill

When the user asks to triage issue #N:

1. Use the `github` MCP tool to read issue #N (title, body, comments).
2. Read CODEOWNERS to find the right team.
3. Pick 1-3 labels from: bug | feature | docs | question | needs-info.
4. Post a comment summarizing your triage. **DO NOT** label or assign without my approval.
```

Step 3 — in Copilot Agent mode, just say: *"triage issue 42."* The agent plans, calls the GitHub tool, drafts the comment, and asks for your go-ahead before posting. You went from *manually triaging* to *one-line oversight*.

## 7.1 The agent loop — the only diagram you must memorize

```
  +------------------+
  |   user request   |
  +--------+---------+
           |
           v
  +------------------+     +------------------+
  |   PLAN (LLM)     |---->|   TOOL CALLS     |---+
  +--------+---------+     +------------------+   |
           ^                                       |
           |                                       v
           |             +-------------------------+--------+
           +-------------|   OBSERVATIONS (results, errors) |
                         +----------------------------------+
```

The LLM **plans** → calls a **tool** → reads the **observation** → decides next step. Loop until a stop condition.

In Copilot terms:

- **PLAN** = the model in agent mode.
- **TOOL CALLS** = MCP servers + built-in tools (`codebase`, `terminal`, `editFiles`, `runTasks`).
- **OBSERVATIONS** = what the tool returned (file contents, command output, API response).

## 7.2 What is MCP?

**Model Context Protocol** is an open standard published by Anthropic and now supported by GitHub Copilot, Claude Code, Cursor, and others. It is the *USB-C of LLM tooling*: one protocol; many servers; any compatible client can call them.

Core building blocks of an MCP server:

| Block | Like | Purpose |
|---|---|---|
| **Tools** | function calls | actions the agent can invoke |
| **Resources** | files / URIs | read-only content the agent can fetch |
| **Prompts** | re-usable prompt templates | the user can `/` invoke |
| **Sampling** | "ask the host LLM" | server requests LLM completions from the client |

🎯 **Exam tip — Copilot:** MCP is **transport-agnostic** — it runs over stdio, HTTP, or SSE. Copilot supports stdio (local) and HTTP (remote).

## 7.3 Configure MCP servers for Copilot

VS Code reads MCP server config from one of:

- Workspace: `.vscode/mcp.json`
- User: `settings.json` → `"github.copilot.chat.mcp.servers"`

Example `.vscode/mcp.json`:

```json
{
  "servers": {
    "filesystem": {
      "type": "stdio",
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-filesystem", "${workspaceFolder}"]
    },
    "github": {
      "type": "stdio",
      "command": "docker",
      "args": ["run", "-i", "--rm", "-e", "GITHUB_PERSONAL_ACCESS_TOKEN", "ghcr.io/github/github-mcp-server"],
      "env": { "GITHUB_PERSONAL_ACCESS_TOKEN": "${input:gh_pat}" }
    },
    "azure": {
      "type": "stdio",
      "command": "npx",
      "args": ["-y", "@azure/mcp@latest", "server", "start"]
    }
  },
  "inputs": [
    { "id": "gh_pat", "type": "promptString", "description": "GitHub PAT", "password": true }
  ]
}
```

Reload VS Code → Chat → Agent mode → you should see the new tools selectable in the tool picker.

🎯 **Exam tip — Copilot:** the `inputs[]` array is the **secure way to prompt for secrets** (won't appear in chat history). Never hard-code tokens in `mcp.json`.

## 7.4 Use an MCP server from agent mode

In Agent mode chat:

> *"Using the github MCP server, list every open issue in `mail2raji/doc-rag` labeled `bug`, group by file affected (run `gh search code` if needed), and propose a 3-PR plan to fix them."*

Agent mode will pick the tools it needs, show you the plan, request your approval for each tool call (unless you trust it), and iterate.

## 7.5 Write your own MCP server in Python — `genai-eval` server

A real-world server you'd actually use: it lets Copilot run your RAG eval and read the report.

`requirements.txt`:

```
mcp[cli]>=1.2.0
```

`server.py`:

```python
from mcp.server.fastmcp import FastMCP
import json, subprocess, pathlib

app = FastMCP("genai-eval")

@app.tool()
def run_eval(suite: str = "golden", model: str = "gpt-4o-mini") -> str:
    """Run the RAG eval suite. Returns a path to the HTML report."""
    out = f"reports/eval-{suite}-{model}.html"
    subprocess.run(["python", "eval.py", "--suite", suite, "--model", model, "--out", out], check=True)
    return out

@app.tool()
def read_eval_summary(report_path: str) -> dict:
    """Return a JSON summary of a previously generated eval report."""
    raw = pathlib.Path(report_path).with_suffix(".json").read_text()
    return json.loads(raw)

@app.resource("eval://latest/summary")
def latest() -> str:
    """The latest eval summary, as JSON."""
    return pathlib.Path("reports/latest.json").read_text()

if __name__ == "__main__":
    app.run()
```

Register it in `.vscode/mcp.json`:

```json
"genai-eval": {
  "type": "stdio",
  "command": "python",
  "args": ["server.py"],
  "cwd": "${workspaceFolder}"
}
```

In Copilot agent mode:

> *"Run `run_eval` for suite `golden` on `gpt-4o-mini` and `gpt-4o`. Compare the two summaries and write a Markdown report at `reports/compare.md`."*

Copilot will: call `run_eval` twice → call `read_eval_summary` twice → compose the report → write the file. You have effectively built an *agentic eval pipeline* in 30 lines of Python.

⚠️ **Production gotcha:** MCP server tools run on **your laptop** (for stdio) with **your user privileges**. Sandbox or rate-limit anything dangerous.

## 7.6 Skills, prompt files, and chat modes — Copilot's customization stack

| Layer | File | When loaded |
|---|---|---|
| **Custom instructions** | `.github/copilot-instructions.md` | every chat, every prompt |
| **Prompt files** | `.github/prompts/*.prompt.md` | invoked with `/<name>` |
| **Skill files** | `.github/skills/<name>/SKILL.md` | model self-selects based on description |
| **Chat modes** (subagents) | VS Code chat → "agents" config | invoked by user picking a mode |

🎯 **Exam tip — Copilot:** know that **skill files** are *model-selected* — the model decides whether the task matches a skill's description. **Prompt files** are *user-selected*. Heavily tested.

### Skill example

`.github/skills/eval-rag/SKILL.md`:

```markdown
---
description: Run the RAG eval and summarize results. Use when the user mentions "evaluate", "RAG eval", "regression", or asks to compare model versions on retrieval tasks.
---
# Eval RAG skill

When invoked:

1. Call the `genai-eval` MCP server tool `run_eval` with the user's chosen model.
2. Call `read_eval_summary` on the returned path.
3. Render a table with columns: Category, Accuracy, Latency, Cost.
4. Highlight any category below 80% accuracy in **bold**.

Never run more than 3 evals per minute (rate limit).
```

Now when a user asks *"can you evaluate the new prompt against the golden set?"*, Copilot's agent self-selects this skill and follows the steps.

## 7.7 Chat modes — your own scoped subagents

`.github/chatmodes/security-review.chatmode.md`:

```markdown
---
description: Security-focused review mode for AI repos
tools: ['codebase', 'editFiles', 'terminal']
---
You are a senior security engineer reviewing a GenAI repo.
Focus on: prompt injection vectors, leaked API key patterns, unsafe deserialization, SSRF in tool calls, unguarded eval() in agents.
Refuse general coding requests; redirect them to the default agent.
```

VS Code chat → pick `security-review` → ask *"review this PR"*. You get a scoped, opinionated subagent without writing code.

## 7.8 Five agentic patterns to know (exam-tested + real-world)

### 7.8.1 Router

LLM decides which sub-agent or sub-tool to call. Cheap models route; expensive models execute.

> *Example:* customer-support agent routes "refund" → billing tool, "ticket update" → ServiceNow tool, "unknown" → human.

### 7.8.2 ReAct (Reason + Act)

The model writes its reasoning out, picks a tool, observes the result, repeats. Default for Copilot agent mode.

### 7.8.3 Plan-and-execute

Two phases: (1) the model writes a step-by-step plan; (2) executes each step (possibly with a different / smaller model). Lower variance, easier to debug.

### 7.8.4 Orchestrator-workers

One LLM plans + delegates parallelizable sub-tasks to worker LLMs/tools. Great for *"analyze 50 PRs and summarize"*.

### 7.8.5 Evaluator-optimizer

Generator writes a draft; an evaluator critiques; loop until the evaluator says *"good enough"*. The canonical pattern for **prompt optimization** and **AI code review**.

🎯 **Exam tip — Copilot (advanced):** know all five. Be able to pick the right one for a scenario. The exam loves *"orchestrator-workers vs plan-and-execute — what's the difference?"*

## 7.9 Real-world agentic build — *AutoTriage* with Copilot + MCP

A real workflow you can ship in a day:

1. **Goal:** when a new issue is opened in `doc-rag`, an agent triages it (label, suggest milestone, ping likely owner).
2. **Trigger:** GitHub Actions workflow on `issues.opened`.
3. **Agent host:** a small Python script invoking the `mcp` SDK to call:
   - `github-mcp-server` (to read the issue, set labels, post comments)
   - `genai-eval` (to determine whether the issue references a regression in evals)
4. **Plan:** Copilot agent mode writes the script for you. You review.
5. **Deploy:** Actions workflow runs the script with `secrets.GITHUB_TOKEN` and `secrets.OPENAI_API_KEY`.

You will build exactly this in **Capstone #2** in Chapter 10.

## 7.10 Safety rails for agentic Copilot — must-knows for production

- **Tool allow-list** — in agent mode, explicitly whitelist the tools available; never trust a model to "only call safe ones".
- **Approval mode** — keep "require approval for tool calls" on in unfamiliar repos.
- **Dry-run** for destructive tools — every tool that writes should support `--dry-run`.
- **Rate limits** — your MCP tool functions should rate-limit themselves; agents *will* loop.
- **Idempotency** — agents may call the same tool twice. Make tools idempotent or surface the duplicate.
- **Audit log** — log every tool call with parameters. Required for production.

⚠️ **Production gotcha:** the #1 cause of agentic incidents is "the agent did something correct in dev, then in prod it ran against real data". Always test against a sandbox with realistic shapes, never just toy data.

## 7.11 Mini-quiz (12 questions)

1. Four building blocks of an MCP server?
2. Transports MCP supports?
3. Where do you put `mcp.json` for a workspace-level config?
4. Difference between a skill file and a prompt file?
5. Who selects a skill — user or model?
6. Where do MCP stdio servers run?
7. Which agentic pattern uses generator + evaluator looping?
8. ReAct stands for?
9. In agent mode, what should "approval mode" be in production?
10. What is sampling in MCP?
11. Where is the chat mode config file?
12. Name three real-world MCP servers you'd add to a GenAI workspace.

Answers in [Phase7_Agentic_AI_Copilot/exercises.md](https://github.com/mail2raji/github-copilot-handbook/blob/main/Phase7_Agentic_AI_Copilot/exercises.md).

## 7.12 Exercises (do all 10)

1. **Install + connect** the `filesystem` and `github` MCP servers to Copilot.
2. **Write `genai-eval`** server from §7.5; verify Copilot can call both tools.
3. **Add a resource** to `genai-eval` exposing `prompts://current/system`; have Copilot read it.
4. **Custom skill** — write `.github/skills/eval-rag/SKILL.md`. Test it triggers on relevant prompts.
5. **Chat mode** — write `security-review.chatmode.md`. Test it answers a security question correctly.
6. **Router pattern** — write a Copilot prompt that classifies issues into `bug`, `feature`, `question` and routes accordingly.
7. **Evaluator-optimizer** — write an MCP tool that scores a prompt; build a chat workflow that loops until the evaluator scores ≥ 0.9.
8. **AutoTriage** — implement the §7.9 workflow end-to-end on a test repo.
9. **Approval mode** — turn on approval; observe Copilot pausing before each tool call. Disable it in a sandbox repo only.
10. **Audit log** — wrap each MCP tool with a logger; produce a daily JSON Lines audit log.

---
