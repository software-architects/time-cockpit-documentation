# Everything that has to happen after "docfx build" and before _site is deployed:
#   1. tools\FixSitemap\fix-sitemap.ps1      lastmod from git, noindex pages dropped
#   2. tools\GenerateLlmsTxt\generate-llms.ps1  llms.txt, llms-full.txt, Markdown sources -> _site
#
# build.ps1 calls this locally. In the pipeline TimeCockpit.Documentation-CI point the
# PowerShell task that runs after "Create DocFx Documentation" at this file (instead of
# generate-llms.ps1). It needs git on the agent and a full-depth checkout ("Shallow
# fetch" off), otherwise lastmod falls back to the build time.

[CmdletBinding()]
param()

$ErrorActionPreference = "Stop"

Write-Host "==> fix-sitemap.ps1 (lastmod from git, drop noindex pages)"
& (Join-Path $PSScriptRoot "FixSitemap\fix-sitemap.ps1")

Write-Host "==> generate-llms.ps1 (llms.txt, llms-full.txt, Markdown sources -> _site)"
& (Join-Path $PSScriptRoot "GenerateLlmsTxt\generate-llms.ps1")
