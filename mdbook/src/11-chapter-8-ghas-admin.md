# Chapter 8 — GitHub Advanced Security + Administration

> **You will:** secure your AI repos with **secret scanning** (with custom patterns for `sk-…` keys), **code scanning** (CodeQL), **Dependabot**, **push protection**, and **security overview** — then **administer** an org/enterprise with SSO, SCIM, teams, audit log, rulesets, and Actions policies.

This chapter owns the **GHAS** and **Administration** certifications. It is intentionally long.

## 8.1 What is GHAS?

**GitHub Advanced Security (GHAS)** is the security suite that ships with GitHub Enterprise (and is also available standalone for some plans).

GHAS includes:

- **Secret scanning** (incl. push protection, custom patterns).
- **Code scanning** (CodeQL, third-party SARIF uploads, Copilot Autofix).
- **Dependency review** (PR-time vuln check) and **Dependabot** (alerts, security updates, version updates).
- **Security overview** (org-level dashboard).
- **AI-powered remediation** (Copilot Autofix — formerly "code scanning autofix").

🎯 **Exam tip — GHAS:** **Security overview** is **org/enterprise scoped**, not repo scoped. Memorize.

## 8.2 Code scanning with CodeQL — the 80/20

**CodeQL** is GitHub's semantic code analysis engine. It treats code as a database and runs queries against it.

Enable in two lines: Settings → Code security → enable **Code scanning** → "Default setup" — CodeQL is configured automatically with a managed workflow.

**Advanced setup** — for control:

`.github/workflows/codeql.yml`:

```yaml
name: CodeQL
on:
  push:
    branches: [main]
  pull_request:
    branches: [main]
  schedule:
    - cron: '0 5 * * 0'

permissions:
  actions: read
  contents: read
  security-events: write

jobs:
  analyze:
    runs-on: ubuntu-latest
    strategy:
      fail-fast: false
      matrix:
        language: ['python', 'javascript-typescript']
    steps:
      - uses: actions/checkout@v4
      - uses: github/codeql-action/init@v3
        with:
          languages: ${{ matrix.language }}
          queries: security-extended    # or security-and-quality
      - uses: github/codeql-action/autobuild@v3
      - uses: github/codeql-action/analyze@v3
        with:
          category: "/language:${{ matrix.language }}"
```

Languages supported (always check docs): C/C++, C#, Go, Java/Kotlin, JavaScript/TypeScript, Python, Ruby, Swift.

🎯 **Exam tip — GHAS:** CodeQL **default setup** is one click but customizes less. **Advanced setup** is a workflow file you control. Both upload SARIF to GitHub.

## 8.3 Reading and fixing code scanning alerts

Repo → **Security** → **Code scanning**. Each alert has:

- **Rule** (CWE category).
- **Severity** (critical / high / medium / low).
- **Path + line**.
- **Data flow** (where the tainted input came from).

Fix workflow:

1. Open alert.
2. Click **Generate fix with Copilot** (Copilot Autofix) to get a proposed PR.
3. Review the diff. Adjust.
4. Push → CodeQL re-scans → alert closes automatically.

You can also **dismiss** an alert with a reason: *won't fix, false positive, used in tests*. This is logged.

## 8.4 Secret scanning + push protection

**Secret scanning** detects credentials in code by matching publisher-provided regex patterns (AWS, OpenAI, Azure, Stripe, etc.). It runs on:

- **History** — scans all commits in a public repo (free) or any repo (GHAS).
- **Push protection** — blocks the push *before* the secret hits the server.

Enable: Settings → Code security → **Secret scanning** → **Push protection**.

A blocked push looks like:

```
remote: error: GH013: Repository rule violations found for refs/heads/main.
remote: - GITHUB PUSH PROTECTION
remote:   Resolve the following:
remote:     - Secret type: OpenAI API key
remote:       Locations:
remote:         - commit: a1b2c3   path: app.py:42
```

Developer options: remove the secret and re-push, or bypass with a reason (logged + alerts security team).

### Custom patterns (e.g., your internal Vault token)

Org Settings → Code security → Secret scanning → **Custom patterns** → New pattern:

- Name: `Internal Vault token`
- Regex: `vlt-[A-Z0-9]{32}`
- Test string: `vlt-AB12CD34EF56GH78IJ90KL12MN34OP56`

Once published, push protection blocks any push matching the pattern.

🎯 **Exam tip — GHAS:** custom patterns can be **dry-run** before publishing (`Save as dry run`). The dry-run reports matches without blocking.

⚠️ **Production gotcha:** even after secret scanning flags a key, you must **rotate** it. Never trust deletion alone.

## 8.5 Dependabot — three faces

| Feature | What it does |
|---|---|
| **Dependabot alerts** | tells you a dependency has a known vuln (CVE) |
| **Dependabot security updates** | opens a PR fixing the vuln |
| **Dependabot version updates** | scheduled PRs to keep deps fresh, not just security |

Enable alerts + security updates in Settings → Code security.

`.github/dependabot.yml` for version updates:

```yaml
version: 2
updates:
  - package-ecosystem: "pip"
    directory: "/"
    schedule: { interval: "weekly", day: "monday" }
    open-pull-requests-limit: 5
    groups:
      ai-libs:
        patterns: ["openai", "anthropic", "langchain*", "llama-index*"]
  - package-ecosystem: "github-actions"
    directory: "/"
    schedule: { interval: "monthly" }
  - package-ecosystem: "docker"
    directory: "/"
    schedule: { interval: "weekly" }
```

🎯 **Exam tip — GHAS:** alerts and security updates are **GHAS** (or free for public). Version updates are **free for everyone**.

## 8.6 Security overview, security advisories, GHAS metrics

- **Security overview** (org level) — dashboard of all alerts across all repos.
- **Security advisories** (repo level) — your private staging area for disclosing CVEs in *your* code.
- **GHAS metrics** — APIs and built-in reports for "how many alerts, time-to-remediate, who fixed".

🎯 **Exam tip — GHAS:** know that a **draft security advisory** can be used to request a CVE number and to privately collaborate with researchers, *then* publish.

## 8.7 Authentication & users — SSO, SCIM, PATs

### SAML SSO (Enterprise)

Org Settings → Authentication security → Configure SSO with your IdP (Okta, Azure AD/Entra ID, OneLogin). Members sign in via the IdP; PATs and SSH keys must be **authorized for SSO**.

### SCIM (Enterprise)

Automated provisioning + deprovisioning from your IdP. When you offboard an employee in HR → IdP → SCIM → GitHub revokes their org membership in minutes.

🎯 **Exam tip — Admin:** SAML alone authenticates but does not deprovision. **SCIM** does deprovision. Both together = full lifecycle.

### Personal access tokens

- **Classic PATs** — broad scopes; the *legacy* option.
- **Fine-grained PATs** — repo-scoped, time-bounded, *expiring*. The modern recommendation.
- **GitHub Apps** — preferred over PATs for any integration.

### Outside collaborators, base permissions

- **Members** — belong to the org.
- **Outside collaborators** — invited per-repo; don't count against org seats for some features.
- **Base permissions** (org level) — default repo permission for members.

## 8.8 Organizations & teams

```powershell
gh org create my-org      # not via gh in all plans; use UI
gh api orgs/my-org/teams -X POST -f name="rag-team" -f privacy=closed
gh api orgs/my-org/teams/rag-team/memberships/raji -X PUT -f role=maintainer
```

**Nested teams** — child teams inherit parent's repo access. Great for *Engineering → AI → RAG Team*.

**Team review assignment** — auto-distribute review requests in round-robin or load-balanced.

🎯 **Exam tip — Admin:** **CODEOWNERS** file (`.github/CODEOWNERS`) maps file globs to teams; combined with branch protection, you can require a code-owner review.

```
# Sample CODEOWNERS
*.py                 @mail2raji/rag-team
infra/**             @mail2raji/platform
.github/workflows/** @mail2raji/security
```

## 8.9 Policies, audit log, IP allow lists

### Audit log

Org Settings → Audit log. Every privileged action is recorded: PAT use, member added, repo deleted, secret accessed.

```powershell
gh api orgs/mail2raji/audit-log?phrase=action:repo.create
```

Stream to **Splunk, Azure Event Hubs, Datadog, or S3** for long-term retention.

🎯 **Exam tip — Admin:** the audit log retains data for **6 months** by default on Enterprise Cloud; streaming preserves it indefinitely.

### IP allow lists

Org Settings → Authentication → IP allow list. Members must connect from approved IPs. Useful for regulated environments.

### Restrict 3rd-party app access

Org Settings → Third-party Access → toggle off. Then approve apps individually.

## 8.10 Rulesets — org-scoped policy

A **ruleset** can target many repos and many branches with a single policy. Replaces classic branch protection at scale.

```json
{
  "name": "Protect main everywhere",
  "target": "branch",
  "enforcement": "active",
  "conditions": {
    "ref_name": { "include": ["~DEFAULT_BRANCH"] }
  },
  "rules": [
    { "type": "pull_request", "parameters": { "required_approving_review_count": 1, "require_code_owner_review": true } },
    { "type": "required_signatures" },
    { "type": "required_status_checks", "parameters": { "required_status_checks": [{ "context": "CodeQL" }] } },
    { "type": "non_fast_forward" }
  ]
}
```

🎯 **Exam tip — Admin:** ruleset **enforcement** can be `active`, `evaluate` (dry-run), or `disabled`. Memorize.

## 8.11 GHES, migrations, Actions for the enterprise

### GitHub Enterprise Server (GHES) — self-hosted

- Runs on your VM / cloud account.
- Mirrors features of GitHub.com Enterprise (with some delay).
- Manages its own upgrades; you control the data.

🎯 **Exam tip — Admin:** GHES has **major upgrades quarterly**, **patch releases monthly**. Each release has a defined support window.

### Migrations

- **Importer** (Importer / `ghe-migrator`) — repo-by-repo or org-level.
- **GitHub Enterprise Importer (GEI)** — modern, supports GitLab, Bitbucket, ADO sources to github.com.
- **Audit migration mode** — temporarily archive repos during cutover.

### Actions at enterprise scale

- **Org-level allowed actions list** — restrict to verified creators only, or specific allow list.
- **Runner groups** — control which repos can use which self-hosted runners.
- **Limit OIDC subject claims** — customize the OIDC subject to be more specific.
- **Required workflows** — enterprise policy: this workflow must run on every repo.

🎯 **Exam tip — Admin:** required workflows are **enterprise-level** and inject a workflow into every selected repo. Repo admins can't disable them.

## 8.12 Mini-quiz (15 questions)

1. Which security feature ships free for public repos but is GHAS-only for private?
2. CodeQL default vs advanced setup — what's the difference?
3. What does push protection do that history scanning doesn't?
4. After secret scanning flags a key, what's the mandatory next step?
5. Dependabot security updates vs version updates — which is free?
6. Where is the org security overview?
7. SAML vs SCIM — which deprovisions?
8. Classic PAT vs fine-grained PAT — which expires?
9. Where do you set base permissions for the org?
10. What does a CODEOWNERS file do?
11. Audit log default retention on Enterprise Cloud?
12. Where do you require Signed commits at scale?
13. Three enforcement modes of a ruleset?
14. What's a runner group used for?
15. What is GEI?

Answers in [Phase8_GHAS_Admin/exercises.md](Phase8_GHAS_Admin/exercises.md).

## 8.13 Exercises (do all 12)

1. **Enable code scanning (default)** on `doc-rag`. Push intentionally vulnerable code (`eval(user_input)`) and verify the alert.
2. **Migrate to advanced setup** — convert the default workflow into a customized one with `security-extended`.
3. **Copilot Autofix** — accept Copilot's autofix on one alert; verify the alert closes after merge.
4. **Push protection** — push a file containing a real-looking OpenAI key. Verify the push is blocked.
5. **Custom pattern** — register the `vlt-…` pattern in dry-run, observe matches, then publish.
6. **Dependabot config** — add the §8.5 `dependabot.yml`. Merge the first 3 PRs.
7. **SARIF upload** — write a Bandit run that uploads SARIF to GitHub via `github/codeql-action/upload-sarif@v3`.
8. **CODEOWNERS** — require code-owner review for `prompts/**`. Verify a PR touching that path is blocked without owner review.
9. **Ruleset** — write the §8.10 JSON, push via API, observe enforcement.
10. **Audit log stream** — set up streaming to Azure Event Hubs (sandbox). Send one test event.
11. **IP allow list** — enable for a test org; verify you can/can't push from off-list IPs.
12. **OIDC subject customization** — limit OIDC subject claims for a sandbox org; verify federated workflows still work.

---
