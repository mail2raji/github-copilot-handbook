# Splits BOOK.md into per-chapter Markdown files inside mdbook/src for mdBook to render.
# Idempotent: re-running rewrites the chapter files. Does not modify BOOK.md.

[CmdletBinding()]
param(
    [string]$BookFile = (Join-Path $PSScriptRoot 'BOOK.md'),
    [string]$OutDir   = (Join-Path $PSScriptRoot 'mdbook/src')
)

$ErrorActionPreference = 'Stop'

if (-not (Test-Path $BookFile)) { throw "BOOK.md not found at $BookFile" }
New-Item -ItemType Directory -Force -Path $OutDir | Out-Null

$text = Get-Content -LiteralPath $BookFile -Raw

# Section markers in BOOK.md  ->  (filename, title)
$sections = [ordered]@{
    'title-page'        = @{ file = '00-title.md';        title = 'Title page' }
    'preface'           = @{ file = '01-preface.md';      title = 'Preface' }
    'how-to-read-this-book' = @{ file = '02-how-to-read.md'; title = 'How to read this book' }
    'chapter-0'         = @{ file = '03-chapter-0-setup.md';            title = 'Chapter 0 — Setup' }
    'chapter-1'         = @{ file = '04-chapter-1-git.md';              title = 'Chapter 1 — Git Fundamentals' }
    'chapter-2'         = @{ file = '05-chapter-2-github.md';           title = 'Chapter 2 — GitHub Basics' }
    'chapter-3'         = @{ file = '06-chapter-3-intermediate-git.md'; title = 'Chapter 3 — Intermediate Git' }
    'chapter-4'         = @{ file = '07-chapter-4-actions.md';          title = 'Chapter 4 — GitHub Actions' }
    'chapter-5'         = @{ file = '08-chapter-5-copilot-genai.md';    title = 'Chapter 5 — Copilot for GenAI' }
    'chapter-6'         = @{ file = '09-chapter-6-copilot-cli.md';      title = 'Chapter 6 — Copilot CLI' }
    'chapter-7'         = @{ file = '10-chapter-7-agentic.md';          title = 'Chapter 7 — Agentic AI with Copilot + MCP' }
    'chapter-8'         = @{ file = '11-chapter-8-ghas-admin.md';       title = 'Chapter 8 — GHAS + Administration' }
    'chapter-9'         = @{ file = '12-chapter-9-exam-prep.md';        title = 'Chapter 9 — Exam Prep (5 mock exams)' }
    'chapter-10'        = @{ file = '13-chapter-10-capstone.md';        title = 'Chapter 10 — Capstone' }
    'appendix-a'        = @{ file = '14-appendix-a.md'; title = 'Appendix A — Cheat sheets' }
    'appendix-b'        = @{ file = '15-appendix-b.md'; title = 'Appendix B — Glossary' }
    'appendix-c'        = @{ file = '16-appendix-c.md'; title = 'Appendix C — Further reading' }
}

# GitHub blob base URL used to rewrite repo-relative links (Phase folders, EXAM_BLUEPRINT, etc.)
# These files live next to BOOK.md but are NOT part of the mdBook output.
$RepoBlobBase = 'https://github.com/mail2raji/github-copilot-handbook/blob/main'

# Map BOOK.md section id (anchor) -> rendered mdBook chapter file
$anchorToFile = @{}
foreach ($id in $sections.Keys) { $anchorToFile[$id] = $sections[$id].file }

function Rewrite-Links {
    param([string]$Body)

    # 1) Intra-book anchors: [text](#chapter-4)  ->  [text](07-chapter-4-actions.md)
    foreach ($anchor in $anchorToFile.Keys) {
        $target = $anchorToFile[$anchor]
        $Body = $Body -replace ("\(#" + [regex]::Escape($anchor) + "\)"), "($target)"
    }

    # 2) Phase folder files: [text](Phase1_Git_Fundamentals/exercises.md)
    #    point them at the GitHub blob view since the phase folders are not in mdbook/src.
    $Body = [regex]::Replace($Body,
        '\((Phase\d+_[A-Za-z_]+/[A-Za-z0-9_.\-]+)\)',
        { param($m) "($RepoBlobBase/$($m.Groups[1].Value))" })

    # 3) Other repo-root files referenced from the book.
    foreach ($file in @('EXAM_BLUEPRINT.md','SETUP.md','CONTRIBUTING.md','LICENSE')) {
        $pattern = '\(' + [regex]::Escape($file) + '\)'
        $Body    = $Body -replace $pattern, "($RepoBlobBase/$file)"
    }

    return $Body
}

# Map section id -> start index in the source text
$ids       = @($sections.Keys)
$positions = New-Object 'System.Collections.Generic.List[int]'
foreach ($id in $ids) {
    $needle = "<a id='$id'></a>"
    $i = $text.IndexOf($needle)
    if ($i -lt 0) { throw "Marker not found in BOOK.md: $id" }
    $positions.Add($i) | Out-Null
}
$positions.Add($text.Length) | Out-Null   # sentinel

for ($idx = 0; $idx -lt $ids.Count; $idx++) {
    $id      = $ids[$idx]
    $meta    = $sections[$id]
    $start   = $positions[$idx]
    $end     = $positions[$idx + 1]
    $chunk   = $text.Substring($start, $end - $start).TrimEnd()

    # Strip the leading anchor tag — mdBook auto-generates anchors from headings.
    $chunk = $chunk -replace "^<a id='$id'></a>\s*", ''

    # Rewrite cross-references that would 404 in the rendered site.
    $chunk = Rewrite-Links -Body $chunk

    $outPath = Join-Path $OutDir $meta.file
    Set-Content -LiteralPath $outPath -Value $chunk -Encoding UTF8
    Write-Host "wrote $($meta.file)  ($([Math]::Round($chunk.Length/1024,1)) KB)"
}

# ---------------- SUMMARY.md ----------------

$summary = @()
$summary += '# Summary'
$summary += ''
$summary += '[Title page](00-title.md)'
$summary += '[Preface](01-preface.md)'
$summary += '[How to read this book](02-how-to-read.md)'
$summary += ''
$summary += '# Foundations'
$summary += ''
$summary += '- [Chapter 0 — Setup](03-chapter-0-setup.md)'
$summary += '- [Chapter 1 — Git Fundamentals](04-chapter-1-git.md)'
$summary += '- [Chapter 2 — GitHub Basics](05-chapter-2-github.md)'
$summary += '- [Chapter 3 — Intermediate Git](06-chapter-3-intermediate-git.md)'
$summary += ''
$summary += '# AI / ML on GitHub'
$summary += ''
$summary += '- [Chapter 4 — GitHub Actions](07-chapter-4-actions.md)'
$summary += '- [Chapter 5 — Copilot for GenAI](08-chapter-5-copilot-genai.md)'
$summary += '- [Chapter 6 — Copilot CLI](09-chapter-6-copilot-cli.md)'
$summary += '- [Chapter 7 — Agentic AI with Copilot + MCP](10-chapter-7-agentic.md)'
$summary += ''
$summary += '# Security & Administration'
$summary += ''
$summary += '- [Chapter 8 — GHAS + Administration](11-chapter-8-ghas-admin.md)'
$summary += ''
$summary += '# Exams & Capstone'
$summary += ''
$summary += '- [Chapter 9 — Exam Prep (5 mock exams)](12-chapter-9-exam-prep.md)'
$summary += '- [Chapter 10 — Capstone](13-chapter-10-capstone.md)'
$summary += ''
$summary += '# Appendices'
$summary += ''
$summary += '- [Appendix A — Cheat sheets](14-appendix-a.md)'
$summary += '- [Appendix B — Glossary](15-appendix-b.md)'
$summary += '- [Appendix C — Further reading](16-appendix-c.md)'

Set-Content -LiteralPath (Join-Path $OutDir 'SUMMARY.md') -Value ($summary -join "`n") -Encoding UTF8
Write-Host 'wrote SUMMARY.md'

Write-Host ''
Write-Host 'Done. Next: mdbook build (from GitHub_Learning/)'
