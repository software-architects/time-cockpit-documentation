# Builds the documentation site into _site and publishes the raw Markdown sources
# plus llms.txt / llms-full.txt alongside it. This is the single command to run
# before deploying _site; do not deploy after a plain "dotnet docfx", because
# the .md files linked from llms.txt would be missing on the server (404).
#
# Usage:
#   .\build.ps1                 # docfx metadata + build, then llms/markdown publish
#   .\build.ps1 -SkipMetadata   # skip API metadata generation (no ../Binaries needed)
#   .\build.ps1 -Serve          # additionally start a local preview server

[CmdletBinding()]
param(
    [switch]$SkipMetadata,
    [switch]$Serve
)

$ErrorActionPreference = "Stop"
$repoRoot = $PSScriptRoot
Push-Location $repoRoot
try {
    if (-not (Get-Command dotnet -ErrorAction SilentlyContinue)) {
        throw ".NET SDK not found. Install it from https://dot.net; docfx itself is restored from .config/dotnet-tools.json."
    }

    # docfx never deletes output, so pages that were renamed or removed would survive in
    # _site (and fix-hreflang/fix-sitemap would pick them up). Always start clean.
    $site = Join-Path $repoRoot "_site"
    if (Test-Path -LiteralPath $site) {
        Write-Host "==> removing previous _site"
        Remove-Item -LiteralPath $site -Recurse -Force
    }
    Write-Host "==> dotnet tool restore (docfx version pinned in .config/dotnet-tools.json)"
    & dotnet tool restore
    if ($LASTEXITCODE -ne 0) { throw "dotnet tool restore failed with exit code $LASTEXITCODE" }

    Write-Host "==> generate-site-index.ps1 (doc/all-pages.md from toc.yml)"
    & (Join-Path $repoRoot "tools\GenerateSiteIndex\generate-site-index.ps1")

    Write-Host "==> relink-de.ps1 / build-de-toc.ps1 (German pages: links and navigation)"
    & (Join-Path $repoRoot "tools\Translate\relink-de.ps1")
    & (Join-Path $repoRoot "tools\Translate\build-de-toc.ps1")
    & (Join-Path $repoRoot "tools\GenerateSiteIndex\generate-site-index.ps1") -Language de

    if ($SkipMetadata) {
        Write-Host "==> dotnet docfx build docfx.json"
        & dotnet docfx build docfx.json
    }
    else {
        Write-Host "==> dotnet docfx docfx.json (metadata + build)"
        & dotnet docfx docfx.json
    }
    if ($LASTEXITCODE -ne 0) { throw "docfx failed with exit code $LASTEXITCODE" }

    Write-Host "==> dotnet docfx build de/docfx.json (German site -> _site/de)"
    & dotnet docfx build de/docfx.json
    if ($LASTEXITCODE -ne 0) { throw "docfx (de) failed with exit code $LASTEXITCODE" }

    & (Join-Path $repoRoot "tools\post-build.ps1")

    Write-Host "==> Done. _site is ready to deploy."

    if ($Serve) {
        Write-Host "==> dotnet docfx serve _site --port 8087"
        & dotnet docfx serve _site --port 8087
    }
}
finally {
    Pop-Location
}
