# Contributing

This is a personal handbook by mail2raji, but improvements are welcome.

## Ways to help

1. **Spotted a typo or unclear sentence?** Open a PR — single-line fixes are great.
2. **A command broke on your platform?** Open an issue with: OS, command, error output.
3. **Have a better real-world example for a chapter?** Open an issue first to discuss before writing.
4. **A new mock exam question?** Submit it under `Phase9_ExamPrep/contributions.md` in your fork.

## Style guide

- Keep examples runnable. If we can't paste it into a fresh shell, it doesn't belong in the book.
- Real-world > toy. Prefer "GenAI deployment pipeline" over "hello world" for examples.
- Cite official GitHub docs by link, not by paraphrase.
- One concept per heading. Keep paragraphs short.
- Use PowerShell on Windows, bash on Linux/macOS — show both when commands differ.

## Local build

```powershell
cd c:\Scripts\Send-escalationEmail\GitHub_Learning
mdbook serve --open
```

Make changes, save, the page hot-reloads.

## License of contributions

By submitting a PR you agree to license your contribution under the MIT license of this repo.
