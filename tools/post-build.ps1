# Everything that has to happen after "docfx build" and before _site is deployed:
#   1. tools\GenerateLlmsTxt\generate-llms.ps1  llms.txt, llms-full.txt, Markdown sources -> _site
#      (essential: without it every llms.txt link returns 404 on the server)
#   2. tools\FixSitemap\fix-sitemap.ps1      noindex pages dropped, lastmod from git
#      (nice to have: a failure here is reported but does not fail the build)
#
# build.ps1 calls this locally and in the pipeline (PowerShell task `.\build.ps1 -SkipMetadata`).
# Step 2 needs git on the agent and a full-depth checkout ("Shallow fetch" off), otherwise
# lastmod falls back to the build time.

[CmdletBinding()]
param()

$ErrorActionPreference = "Stop"

Write-Host "==> generate-llms.ps1 (llms.txt, llms-full.txt, Markdown sources -> _site)"
& (Join-Path $PSScriptRoot "GenerateLlmsTxt\generate-llms.ps1")

Write-Host "==> fix-sitemap.ps1 (drop noindex pages, lastmod from git)"
try {
    & (Join-Path $PSScriptRoot "FixSitemap\fix-sitemap.ps1")
}
catch {
    Write-Warning "fix-sitemap.ps1 failed, sitemap.xml is left as DocFX wrote it: $($_.Exception.Message)"
}
