# Rewrites links in the German pages (de/doc/**.md) so that they point at German
# pages where a translation exists and at the English page otherwise. Translators copy
# links verbatim from the English source; this script resolves them. Idempotent, runs
# before every build (build.ps1) and can be run any time by hand.
#
# Rules (see AGENTS.md, "German documentation"):
#   - Page links (.md, "~/doc/..." or relative to the English source folder):
#       translated  -> ~/doc/<de path>.md (anchor kept only if a matching DE heading exists)
#       not yet     -> /doc/<en path>.html (root-absolute, English site)
#       already DE  -> left alone
#   - Image links: a file under de/doc/<de folder>/images/ wins (German screenshot),
#     otherwise the English image root-absolute: /doc/<en folder>/images/<name>
#   - Video posters data-poster="../../images/video-posters/x.jpg" -> /images/video-posters/x.jpg

[CmdletBinding()]
param()

$ErrorActionPreference = "Stop"
. (Join-Path $PSScriptRoot "translate-common.ps1")

$map = Get-DePageMap
if ($map.Count -eq 0) { Write-Host "relink-de: no German pages yet"; return }

# Code files pulled in by [!code-...] includes are resolved relative to the page, so the
# German pages need the same files next to them. Mirror them (gitignored, never edited).
foreach ($codeDir in @('scripting/code')) {
    $src = Join-Path $script:RepoRoot ('doc/' + $codeDir)
    if (-not (Test-Path -LiteralPath $src)) { continue }
    $dst = Join-Path $script:DeRoot ('doc\' + $codeDir.Replace('/', '\'))
    if (Test-Path -LiteralPath $dst) { Remove-Item -LiteralPath $dst -Recurse -Force }
    Copy-Item -LiteralPath $src -Destination $dst -Recurse
}

$imageExt = '\.(png|jpe?g|gif|svg|webp)$'

function Resolve-EnPath([string]$enDir, [string]$target) {
    # Resolves a link target relative to the English source folder into a repo path.
    if ($target.StartsWith('~/')) { return $target.Substring(2) }
    $base = New-Object System.Uri ("http://x/$enDir/")
    $u = New-Object System.Uri ($base, $target)
    return [System.Uri]::UnescapeDataString($u.AbsolutePath).TrimStart('/')
}

function Get-Slug([string]$heading) {
    # Approximation of DocFX/Markdig auto identifiers (GitHub style).
    $s = $heading.Trim().ToLowerInvariant()
    $s = $s -replace '[^\p{L}\p{N}\s\-_]', ''
    $s = $s -replace '\s+', '-'
    return $s
}

function Get-HeadingSlugs([string]$file) {
    # Slugs of all headings outside code fences, in document order.
    $slugs = [System.Collections.Generic.List[string]]::new()
    $seen = @{}
    $inFence = $false
    foreach ($line in (Get-Content -LiteralPath $file -Encoding UTF8)) {
        if ($line -match '^\s*```') { $inFence = -not $inFence; continue }
        if (-not $inFence -and $line -match '^#{1,6}\s+(.+?)\s*$') {
            $slug = Get-Slug $Matches[1]
            # Duplicate headings get -1, -2, ... like DocFX's auto identifiers.
            if ($seen.ContainsKey($slug)) { $seen[$slug]++; $slug = "$slug-$($seen[$slug])" } else { $seen[$slug] = 0 }
            $slugs.Add($slug)
        }
    }
    return $slugs
}

# Maps an English anchor to the German one: headings are translated 1:1, so the German
# heading at the same position is the counterpart. Returns $null when it cannot be mapped.
function Convert-Anchor([string]$enPath, [string]$dePath, [string]$anchor) {
    $deFile = Join-Path $script:DeRoot ($dePath -replace '/', '\')
    $enFile = Join-Path $script:RepoRoot ($enPath -replace '/', '\')
    if (-not (Test-Path -LiteralPath $deFile)) { return $null }
    $deSlugs = Get-HeadingSlugs $deFile
    $a = $anchor.ToLowerInvariant()
    if ($deSlugs -contains $a) { return $a }                     # already a German anchor
    if (-not (Test-Path -LiteralPath $enFile)) { return $null }
    $enSlugs = Get-HeadingSlugs $enFile
    $i = $enSlugs.IndexOf($a)
    if ($i -ge 0 -and $i -lt $deSlugs.Count) { return $deSlugs[$i] }
    return $null
}

# uids declared by documentation pages (front matter "uid: x") -> English page path
$docUids = @{}
foreach ($f in Get-ChildItem -LiteralPath (Join-Path $script:RepoRoot 'doc') -Recurse -Filter *.md) {
    $uid = Get-FrontMatterValue $f.FullName 'uid'
    if ($uid) { $docUids[$uid] = $f.FullName.Substring($script:RepoRoot.Length).TrimStart('\').Replace('\', '/') }
}

function Resolve-Xref([string]$ref) {
    $anchor = ''
    $uid = $ref
    $hash = $uid.IndexOf('#')
    if ($hash -ge 0) { $anchor = $uid.Substring($hash); $uid = $uid.Substring(0, $hash) }
    $q = $uid.IndexOf('?')
    if ($q -ge 0) { $uid = $uid.Substring(0, $q) }
    if ($docUids.ContainsKey($uid)) {
        $enPath = $docUids[$uid]
        if ($map.ContainsKey($enPath)) { return "~/$($map[$enPath])$anchor" }
        return "/$($enPath -replace '\.md$', '.html')$anchor"
    }
    return "/api/$uid.html$anchor"
}

$rewritten = 0
$filesChanged = 0
foreach ($en in $map.Keys) {
    $deRel = $map[$en]
    $deFile = Join-Path $script:DeRoot ($deRel -replace '/', '\')
    $enDir = ([System.IO.Path]::GetDirectoryName($en)).Replace('\', '/')
    $deDir = ([System.IO.Path]::GetDirectoryName($deRel)).Replace('\', '/')
    $original = [System.IO.File]::ReadAllText($deFile)
    $text = $original

    # Markdown links and images: [text](target "title")
    $text = [regex]::Replace($text, '\]\(([^)\s]+)((?:\s+"[^"]*")?)\)', {
        param($m)
        $target = $m.Groups[1].Value
        $title = $m.Groups[2].Value
        if ($target -match '^#(.+)$') {
            # Same-page anchor: map the English heading anchor to the German heading.
            $mapped = Convert-Anchor $en $deRel $Matches[1]
            if ($null -eq $mapped) { Write-Warning "anchor '$target' not found in $deRel, left as is"; return $m.Value }
            if ($mapped -eq $Matches[1]) { return $m.Value }
            $script:rewritten++
            return "](#$mapped$title)"
        }
        if ($target -match '^(https?:|mailto:|xref:|/)') { return $m.Value }

        $anchor = ''
        $path = $target
        $hash = $path.IndexOf('#')
        if ($hash -ge 0) { $anchor = $path.Substring($hash + 1); $path = $path.Substring(0, $hash) }

        if ($path -match $imageExt) {
            $local = Join-Path $script:DeRoot (($deDir + '/' + $path) -replace '/', '\')
            if (Test-Path -LiteralPath $local) { return $m.Value }
            $enImage = Resolve-EnPath $enDir $path
            $script:rewritten++
            return "](/$enImage$title)"
        }
        if ($path -notmatch '\.md$') { return $m.Value }

        $enPath = Resolve-EnPath $enDir $path
        # A translated target (checked first: when the German file name equals the English one,
        # the target is both, and the anchor still has to be mapped).
        if ($map.ContainsKey($enPath)) {
            $dePath = $map[$enPath]
            $suffix = ''
            if ($anchor) {
                $mapped = Convert-Anchor $enPath $dePath $anchor
                if ($null -ne $mapped) { $suffix = "#$mapped" }
                else { Write-Warning "anchor '#$anchor' not found in $dePath (link in $deRel), dropped" }
            }
            if ("~/$dePath$suffix" -eq $target) { return $m.Value }   # already resolved
            $script:rewritten++
            return "](~/$dePath$suffix$title)"
        }
        if (Test-Path -LiteralPath (Join-Path $script:DeRoot ($enPath -replace '/', '\'))) { return $m.Value }   # already a DE page
        $script:rewritten++
        $html = ($enPath -replace '\.md$', '.html')
        return "](/$html$(if ($anchor) { "#$anchor" })$title)"
    })

    # Cross references (<xref:Uid> or [text](xref:Uid)). A uid of a documentation page
    # (front matter "uid:", e.g. tcql) resolves like a page link; everything else is the
    # API reference, which is only built in English: /api/<Uid>.html (anchor kept, query dropped).
    $text = [regex]::Replace($text, '<xref:([^>\s]+)>', {
        param($m)
        $uid = ($m.Groups[1].Value -split '[?#]')[0]
        $script:rewritten++
        return "[$uid]($(Resolve-Xref $m.Groups[1].Value))"
    })
    $text = [regex]::Replace($text, '\]\(xref:([^)\s]+)\)', {
        param($m)
        $script:rewritten++
        return "]($(Resolve-Xref $m.Groups[1].Value))"
    })

    # HTML images and video posters
    $text = [regex]::Replace($text, '(src|data-poster)="((?:\.\./)*)(images/[^"]+)"', {
        param($m)
        $attr = $m.Groups[1].Value; $up = $m.Groups[2].Value; $rel = $m.Groups[3].Value
        $local = Join-Path $script:DeRoot (($deDir + '/' + $rel) -replace '/', '\')
        if (-not $up -and (Test-Path -LiteralPath $local)) { return $m.Value }
        $enImage = if ($up) { Resolve-EnPath $enDir ($up + $rel) } else { "$enDir/$rel" }
        $script:rewritten++
        return "$attr=`"/$enImage`""
    })

    if ($text -ne $original) {
        [System.IO.File]::WriteAllText($deFile, $text, (New-Object System.Text.UTF8Encoding $false))
        $filesChanged++
    }
}
Write-Host "relink-de: $($map.Count) German pages, $rewritten links rewritten in $filesChanged files"
