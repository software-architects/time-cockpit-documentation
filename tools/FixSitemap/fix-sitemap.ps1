# Rewrites <lastmod> in _site/sitemap.xml with the last Git commit date of each page's
# source file. DocFX writes the build time for every URL, which tells search engines
# nothing. Run after "docfx build" (build.ps1 does this); requires git and the full
# history (a shallow clone yields the checkout date for every file).
#
# URL -> source mapping: doc/**.html -> doc/**.md, api/**.html -> api/**.yml,
# */toc.html -> */toc.yml. URLs without a source keep the build time.

[CmdletBinding()]
param(
    [string]$SitemapPath = (Join-Path (Resolve-Path (Join-Path $PSScriptRoot "..\..")).Path "_site\sitemap.xml"),
    [string]$BaseUrl = "https://docs.timecockpit.com"
)

$ErrorActionPreference = "Stop"
$repoRoot = (Resolve-Path (Join-Path $PSScriptRoot "..\..")).Path

if (-not (Test-Path -LiteralPath $SitemapPath)) {
    Write-Warning "sitemap.xml not found at $SitemapPath. Build the site first."
    return
}
if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Warning "git not found; sitemap lastmod values stay at build time."
    return
}

# One git call: walk commits newest first and remember the first date seen per file.
$lastCommit = @{}
Push-Location $repoRoot
try {
    $current = $null
    foreach ($line in (& git log --format='%x01%cI' --name-only -- doc api toc.yml 2>$null)) {
        if ($line.StartsWith([char]1)) { $current = $line.Substring(1); continue }
        if ($line -eq '') { continue }
        $key = $line.Replace('\', '/')
        if (-not $lastCommit.ContainsKey($key)) { $lastCommit[$key] = $current }
    }
}
finally {
    Pop-Location
}
if ($lastCommit.Count -eq 0) {
    Write-Warning "git log returned nothing (shallow clone?); sitemap lastmod values stay at build time."
    return
}

[xml]$xml = Get-Content -LiteralPath $SitemapPath -Encoding UTF8
$ns = New-Object System.Xml.XmlNamespaceManager $xml.NameTable
$ns.AddNamespace("s", "http://www.sitemaps.org/schemas/sitemap/0.9")

$siteRoot = Split-Path -Parent $SitemapPath
$updated = 0
$kept = 0
$dropped = 0
foreach ($url in @($xml.SelectNodes("//s:url", $ns))) {
    $loc = $url.SelectSingleNode("s:loc", $ns).InnerText
    if (-not $loc.StartsWith($BaseUrl)) { $kept++; continue }
    $path = $loc.Substring($BaseUrl.Length).TrimStart('/')

    # Pages that tell robots "noindex" must not be submitted via the sitemap.
    $htmlPath = Join-Path $siteRoot ($path -replace '/', '\')
    if ((Test-Path -LiteralPath $htmlPath) -and ((Get-Content -LiteralPath $htmlPath -TotalCount 80 -Encoding UTF8) -join "`n") -match 'name="robots"\s+content="noindex') {
        [void]$url.ParentNode.RemoveChild($url)
        $dropped++
        continue
    }

    $source = $null
    if ($path -match '^(.*/)?toc\.html$') { $source = ($path -replace '\.html$', '.yml') }
    elseif ($path -match '^doc/.*\.html$') { $source = ($path -replace '\.html$', '.md') }
    elseif ($path -match '^api/.*\.html$') { $source = ($path -replace '\.html$', '.yml') }

    if ($source -and $lastCommit.ContainsKey($source)) {
        $url.SelectSingleNode("s:lastmod", $ns).InnerText = $lastCommit[$source]
        $updated++
    }
    else {
        $kept++
    }
}

$settings = New-Object System.Xml.XmlWriterSettings
$settings.Indent = $true
$settings.Encoding = New-Object System.Text.UTF8Encoding $false
$writer = [System.Xml.XmlWriter]::Create($SitemapPath, $settings)
try { $xml.Save($writer) } finally { $writer.Dispose() }

Write-Host "sitemap.xml: lastmod from git for $updated URLs, $kept kept at build time, $dropped noindex URLs removed"
