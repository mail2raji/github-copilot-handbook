# Chapter 0 — Setup

> **You will:** install Git, GitHub CLI, VS Code, GitHub Copilot, and GitHub Copilot CLI, then prove they work by making your first commit and asking Copilot a question.

## 0.1 Install Git

Git is the version-control engine. It is **local-first**: every commit happens on your laptop, before anything reaches GitHub.

**Windows (PowerShell):**

```powershell
winget install --id Git.Git -e
git --version
```

**macOS:** `brew install git` — **Linux:** `sudo apt install -y git`.

### Tell Git who you are

```powershell
git config --global user.name  "Your Name"
git config --global user.email "you@example.com"
git config --global init.defaultBranch main
git config --global pull.rebase false
git config --global core.autocrlf true
git config --global core.editor "code --wait"
```

🎯 **Exam tip — Foundations:** `git config --global` writes to `~/.gitconfig`; `--system` writes machine-wide; `--local` writes to `.git/config`. Local overrides global overrides system.

## 0.2 Install GitHub CLI (`gh`)

```powershell
winget install --id GitHub.cli -e
gh --version
gh auth login
```

`gh` is the bridge between your terminal and `github.com` and also installs the credential helper so `git push` stops asking for passwords.

## 0.3 Install VS Code + Copilot

Install VS Code, then add three extensions:

1. **GitHub Copilot** — inline completions.
2. **GitHub Copilot Chat** — chat panel, inline chat, agent mode.
3. **GitHub Pull Requests and Issues** — PR review inside the editor.

Sign in with the GitHub account that has Copilot enabled.

## 0.4 Install GitHub Copilot CLI

```powershell
gh extension install github/gh-copilot
gh copilot --version
gh copilot suggest "find all files larger than 100 MB"
```

If you see "not entitled", the account does not have a Copilot license. Sign up at `github.com/features/copilot`.

## 0.5 Your first commit

```powershell
mkdir hello-genai ; cd hello-genai
git init
"# Hello GenAI" | Out-File README.md
git add README.md
git commit -m "chore: initial commit"
git log --oneline
```

Push it to GitHub:

```powershell
gh repo create hello-genai --public --source=. --remote=origin --push
```

You just published your first repo.

## 0.6 Your first Copilot question

In VS Code: `Ctrl+Alt+I` → open Copilot Chat → ask:

> *"What is the difference between `git merge` and `git rebase`? One-paragraph plain-English answer."*

In the terminal:

```powershell
gh copilot suggest "create a python virtual environment and install openai"
```

🔧 **Try it — Chapter 0 drills**

1. Run `git config --list --show-origin` and find which file holds your name and email.
2. Run `gh auth status` — verify the right account.
3. Run `gh copilot explain "git push --force-with-lease origin main"` and read the explanation.
4. In Copilot Chat, ask for a `.gitignore` for a Python + PyTorch + Hugging Face datasets project. Save it.

---
