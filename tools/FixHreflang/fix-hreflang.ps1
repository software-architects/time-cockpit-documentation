# Post-build step for the bilingual site: links each German page (_site/de/doc/**.html)
# with its English source and vice versa.
#   - <link rel="alternate" hreflang="en|de|x-default"> on both pages (x-default = English)
#   - <meta property="og:locale:alternate"> on both pages
#   - the EN | DE language switch (a.tc-lang-link[data-lang]) points at the counterpart
# The pair comes from <meta name="docfx:en-page" content="doc/x.md"> which the template
# emits from the en_page front matter of German pages. Pages without a counterpart keep the
# template defaults (self hreflang, switch to the other language's start page).

[CmdletBinding()]
param(
    [string]$SiteRoot = "",
    [string]$EnBase = "https://docs.timecockpit.com/",
    [string]$DeBase = "https://docs.timecockpit.com/de/"
)

$ErrorActionPreference = "Stop"
if (-not $SiteRoot) {
    $scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
    $SiteRoot = Join-Path (Resolve-Path (Join-Path $scriptDir "..\..")).Path "_site"
}
$deDoc = Join-Path $SiteRoot "de\doc"
if (-not (Test-Path -LiteralPath $deDoc)) { Write-Host "fix-hreflang: no German site in $SiteRoot"; return }

$utf8 = New-Object System.Text.UTF8Encoding $false
$paired = 0
$missing = 0

# Windows PowerShell 5.1 has no count argument for -replace; use .NET Regex.Replace(input, replacement, count).
function Replace-First([string]$html, [string]$pattern, [string]$replacement) {
    return ([regex]$pattern).Replace($html, $replacement, 1)
}

function Add-AfterSelfHreflang([string]$html, [string]$lang, [string]$insert) {
    $pattern = '(<link rel="alternate" hreflang="' + $lang + '" href="[^"]*">)'
    if ($html -match $pattern) { return Replace-First $html $pattern ('$1' + "`n      " + $insert) }
    return Replace-First $html '(<link rel="canonical"[^>]*>)' ('$1' + "`n      " + $insert)
}

function Set-SwitchHref([string]$html, [string]$lang, [string]$href) {
    return Replace-First $html ('(<a class="tc-lang-link" data-lang="' + $lang + '"[^>]*?href=")[^"]*(")') ('${1}' + $href + '${2}')
}

function Add-OgLocaleAlternate([string]$html, [string]$locale) {
    if ($html -match 'og:locale:alternate') { return $html }
    return Replace-First $html '(<meta property="og:locale" content="[^"]*">)' ('$1' + "`n      " + '<meta property="og:locale:alternate" content="' + $locale + '">')
}

foreach ($deFile in Get-ChildItem -LiteralPath $deDoc -Recurse -Filter *.html -File) {
    $deHtml = [System.IO.File]::ReadAllText($deFile.FullName)
    if ($deHtml -notmatch '<meta name="docfx:en-page" content="([^"]+)">') { continue }
    $enPage = $Matches[1] -replace '\.md$', '.html'
    $enFile = Join-Path $SiteRoot ($enPage -replace '/', '\')
    if (-not (Test-Path -LiteralPath $enFile)) { Write-Warning "fix-hreflang: English page not found for $($deFile.Name): $enPage"; $missing++; continue }

    $dePath = $deFile.FullName.Substring((Join-Path $SiteRoot "de").Length).TrimStart('\', '/').Replace('\', '/')
    $enUrl = $EnBase + $enPage
    $deUrl = $DeBase + $dePath

    if ($deHtml -notmatch '<link rel="alternate" hreflang="en"') {
        $deHtml = Add-AfterSelfHreflang $deHtml 'de' ('<link rel="alternate" hreflang="en" href="' + $enUrl + '">' + "`n      " + '<link rel="alternate" hreflang="x-default" href="' + $enUrl + '">')
        $deHtml = Set-SwitchHref $deHtml 'en' ('/' + $enPage)
        $deHtml = Add-OgLocaleAlternate $deHtml 'en_US'
        [System.IO.File]::WriteAllText($deFile.FullName, $deHtml, $utf8)
    }

    $enHtml = [System.IO.File]::ReadAllText($enFile)
    if ($enHtml -notmatch '<link rel="alternate" hreflang="de"') {
        $enHtml = Add-AfterSelfHreflang $enHtml 'en' ('<link rel="alternate" hreflang="de" href="' + $deUrl + '">')
        $enHtml = Set-SwitchHref $enHtml 'de' ('/de/' + $dePath)
        $enHtml = Add-OgLocaleAlternate $enHtml 'de_AT'
        [System.IO.File]::WriteAllText($enFile, $enHtml, $utf8)
    }
    $paired++
}
Write-Host "fix-hreflang: $paired page pairs linked, $missing German pages without English counterpart"
