# Builds the documentation site into _site and publishes the raw Markdown sources
# plus llms.txt / llms-full.txt alongside it. This is the single command to run
# before deploying _site; do not deploy after a plain "docfx docfx.json", because
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
    if (-not (Get-Command docfx -ErrorAction SilentlyContinue)) {
        throw "docfx not found. Install it with: dotnet tool install -g docfx"
    }

    if ($SkipMetadata) {
        Write-Host "==> docfx build docfx.json"
        & docfx build docfx.json
    }
    else {
        Write-Host "==> docfx docfx.json (metadata + build)"
        & docfx docfx.json
    }
    if ($LASTEXITCODE -ne 0) { throw "docfx failed with exit code $LASTEXITCODE" }

    Write-Host "==> generate-llms.ps1 (llms.txt, llms-full.txt, Markdown sources -> _site)"
    & (Join-Path $repoRoot "tools\GenerateLlmsTxt\generate-llms.ps1")

    Write-Host "==> Done. _site is ready to deploy."

    if ($Serve) {
        Write-Host "==> docfx serve _site"
        & docfx serve _site
    }
}
finally {
    Pop-Location
}
