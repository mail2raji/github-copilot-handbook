# Setup — Get Ready to Learn

A 15-minute setup before Chapter 1. If anything fails, jump to the **Troubleshooting** section at the bottom.

---

## 1. Install Git (Windows)

```powershell
winget install --id Git.Git -e
git --version
```

Set your identity (used in every commit):

```powershell
git config --global user.name  "Your Name"
git config --global user.email "you@example.com"
git config --global init.defaultBranch main
git config --global pull.rebase false
git config --global core.autocrlf true
```

---

## 2. Create a GitHub account

Sign up at [github.com](https://github.com/). For the AI/agent labs in this book, the **free** plan is enough; **Copilot** requires a separate subscription (free tier with limits exists as of writing).

Enable **2FA** (Settings → Password and authentication → Two-factor authentication). Use an authenticator app. This is exam-relevant *and* a real-world security requirement.

---

## 3. Install GitHub CLI (`gh`)

```powershell
winget install --id GitHub.cli -e
gh --version
gh auth login   # follow prompts: GitHub.com → HTTPS → browser
```

---

## 4. Install VS Code + GitHub Copilot

```powershell
winget install --id Microsoft.VisualStudioCode -e
```

Open VS Code, then install:

- **GitHub Copilot** extension
- **GitHub Copilot Chat** extension
- **GitHub Pull Requests and Issues** extension

Sign in with the same GitHub account that has Copilot enabled.

---

## 5. Install GitHub Copilot CLI

The Copilot CLI gives you `gh copilot suggest` and `gh copilot explain` in the terminal.

```powershell
gh extension install github/gh-copilot
gh copilot --version
gh copilot suggest "list files modified in the last 24 hours"
```

> If your org has not yet enabled Copilot, you will see an error. Ask your admin or use a personal account with a Copilot subscription.

---

## 6. (Optional but recommended) Install mdBook to read the book locally

mdBook builds the book as a searchable static site.

```powershell
winget install --id rust-lang.Rust.MSVC -e   # rustup → cargo
cargo install mdbook
mdbook --version
cd c:\Scripts\Send-escalationEmail\GitHub_Learning
mdbook serve --open
```

The site opens at `http://localhost:3000`.

---

## 7. Verify everything works

```powershell
git --version
gh --version
gh auth status
gh copilot --version
code --version
```

All five should print a version. If any fails, see troubleshooting.

---

## 8. Troubleshooting

| Symptom | Fix |
|---|---|
| `winget` not found | Install **App Installer** from Microsoft Store. |
| `git push` asks for password | Run `gh auth setup-git` to use `gh` as the credential helper. |
| `gh copilot` prints "not entitled" | You need a Copilot subscription on the signed-in account. |
| VS Code Copilot chat says "no quota" | Check `https://github.com/settings/copilot`. |
| mdBook serve fails | Re-open the terminal so `cargo` is on `$env:PATH`. |

You are ready. Open [BOOK.md](BOOK.md) and start at **Chapter 0**.
