# Generates llms.txt and llms-full.txt (see https://llmstxt.org) at the repository root
# from doc/toc.yml and the page frontmatter (title/description). Links point to the
# raw Markdown sources (.md), which are not part of the regular DocFX output, so this
# script also copies doc/**/*.md into _site after the site has been built.
#
# Usage: build the site first, then run this script:
#   docfx docfx.json
#   .\tools\GenerateLlmsTxt\generate-llms.ps1
#
# Both output files are committed and registered as resources in docfx.json, so DocFX
# also copies the committed versions verbatim to _site during the build; this script
# overwrites them there with fresh ones. Re-run whenever doc/toc.yml or pages change.
#
# NOTE: IIS serves no .md files by default. web.config must contain a MIME mapping:
#   <system.webServer><staticContent>
#     <mimeMap fileExtension=".md" mimeType="text/markdown; charset=utf-8" />
#   </staticContent></system.webServer>

[CmdletBinding()]
param(
    [string]$BaseUrl = "https://docs.timecockpit.com",
    # Release notes younger than this many months are listed individually in llms.txt
    # and included in llms-full.txt; older ones are only referenced by URL pattern.
    [int]$ReleaseNotesMonths = 24
)

$ErrorActionPreference = "Stop"
$repoRoot = (Resolve-Path (Join-Path $PSScriptRoot "..\..")).Path
$docRoot = Join-Path $repoRoot "doc"

# Keep this script ASCII-only so Windows PowerShell 5.1 parses it regardless of BOM.
$enDash = [string][char]0x2013
$emDash = [string][char]0x2014

function Remove-Quotes([string]$value) {
    $value = $value.Trim()
    if ($value.Length -ge 2 -and (($value[0] -eq '"' -and $value[-1] -eq '"') -or ($value[0] -eq "'" -and $value[-1] -eq "'"))) {
        $value = $value.Substring(1, $value.Length - 2)
    }
    return $value
}

# --- Parse doc/toc.yml (regular structure: "- name:", "href:", "items:") ---------------

function Read-Toc([string]$tocPath) {
    $root = [pscustomobject]@{ Name = ""; Href = $null; Indent = -4; Items = [System.Collections.Generic.List[object]]::new() }
    $stack = [System.Collections.Generic.Stack[object]]::new()
    $stack.Push($root)
    $current = $null

    foreach ($line in (Get-Content -LiteralPath $tocPath)) {
        if ($line -match '^(\s*)-\s+name:\s*(.+?)\s*$') {
            $indent = $Matches[1].Length
            $node = [pscustomobject]@{
                Name   = (Remove-Quotes $Matches[2])
                Href   = $null
                Indent = $indent
                Items  = [System.Collections.Generic.List[object]]::new()
            }
            while ($stack.Peek().Indent -ge $indent) { [void]$stack.Pop() }
            $stack.Peek().Items.Add($node)
            $stack.Push($node)
            $current = $node
        }
        elseif ($line -match '^(\s*)href:\s*(.+?)\s*$') {
            if ($null -ne $current -and $Matches[1].Length -eq ($current.Indent + 2)) {
                $current.Href = (Remove-Quotes $Matches[2])
            }
        }
        # "items:" lines carry no information; nesting is derived from indentation.
    }
    return $root
}

# --- Frontmatter (title/description) ---------------------------------------------------

function Read-Frontmatter([string]$filePath) {
    $result = @{ Title = $null; Description = $null }
    $lines = @(Get-Content -LiteralPath $filePath)
    $first = 0
    while ($first -lt $lines.Count -and $lines[$first].Trim() -eq '') { $first++ }
    if ($first -ge $lines.Count -or $lines[$first].Trim() -ne '---') { return $result }
    for ($i = $first + 1; $i -lt $lines.Count; $i++) {
        $line = $lines[$i]
        if ($line.Trim() -eq '---') { break }
        if ($line -match '^title:\s*(.+)$') { $result.Title = (Remove-Quotes $Matches[1]) }
        elseif ($line -match '^description:\s*(.+)$') { $result.Description = (Remove-Quotes $Matches[1]) }
    }
    return $result
}

# --- Helpers ---------------------------------------------------------------------------

function Get-PageUrl([string]$href) {
    # Raw Markdown URL; the rendered HTML page lives at the same URL with .html.
    return "$BaseUrl/doc/$href"
}

function Get-Leaves($node, [string[]]$groupPath, [bool]$isRoot = $true) {
    # Emits all descendants that reference a page, remembering intermediate group names.
    # The root node's own name is not part of the path (it appears in the section heading).
    if ($node.Href) {
        [pscustomobject]@{ Name = $node.Name; Href = $node.Href; GroupPath = $groupPath }
    }
    $childPath = if ($isRoot) { $groupPath } else { $groupPath + $node.Name }
    foreach ($child in $node.Items) {
        Get-Leaves $child $childPath $false
    }
}

function Format-Link($leaf, [hashtable]$frontmatterCache) {
    $file = Join-Path $docRoot ($leaf.Href -replace '/', '\')
    if (-not (Test-Path -LiteralPath $file)) {
        Write-Warning "TOC references missing file: $($leaf.Href)"
        return $null
    }
    if (-not $frontmatterCache.ContainsKey($leaf.Href)) {
        $frontmatterCache[$leaf.Href] = Read-Frontmatter $file
    }
    $fm = $frontmatterCache[$leaf.Href]
    $name = if ($leaf.GroupPath.Count -gt 0) { ($leaf.GroupPath + $leaf.Name) -join " $enDash " } else { $leaf.Name }
    $link = "- [$name]($(Get-PageUrl $leaf.Href))"
    if ($fm.Description) { $link += ": $($fm.Description)" }
    return $link
}

# --- Build ----------------------------------------------------------------------------

$toc = Read-Toc (Join-Path $docRoot "toc.yml")
$frontmatterCache = @{}
$releaseNotesCutoff = (Get-Date).AddMonths(-$ReleaseNotesMonths)

$llms = [System.Text.StringBuilder]::new()
[void]$llms.AppendLine("# time cockpit")
[void]$llms.AppendLine()
[void]$llms.AppendLine("> time cockpit is a flexible, customizable time tracking and project management solution by software architects gmbh. It combines a graphical time sheet calendar, project-based time tracking, attendance and leave management, invoicing, and reporting with deep customization options: a customizable data model, the Time Cockpit Query Language (TCQL), Python scripting, and an OData/REST Web API.")
[void]$llms.AppendLine()
[void]$llms.AppendLine("This is the official product documentation at $BaseUrl. Links point to the raw Markdown sources; the rendered HTML version of every page is available at the same URL with .html instead of .md. A concatenated plain-text version of the complete documentation is available at $BaseUrl/llms-full.txt.")

$fullPages = [System.Collections.Generic.List[object]]::new()
$seenHrefs = [System.Collections.Generic.HashSet[string]]::new()
$linkCount = 0

foreach ($topSection in $toc.Items) {
    if ($topSection.Name -eq 'Release Notes') {
        # Individual links for recent release notes only; older ones via URL pattern.
        $notes = @(Get-Leaves $topSection @()) |
            Where-Object { $_.Href -match '(\d{4})-(\d{2})\.md$' } |
            ForEach-Object {
                $date = [datetime]::ParseExact(($_.Href -replace '.*?(\d{4}-\d{2})\.md$', '$1'), 'yyyy-MM', [System.Globalization.CultureInfo]::InvariantCulture)
                [pscustomobject]@{ Name = $date.ToString('MMMM yyyy', [System.Globalization.CultureInfo]::InvariantCulture); Href = $_.Href; GroupPath = @(); Date = $date }
            } |
            Sort-Object Date -Descending
        $oldest = ($notes | Select-Object -Last 1).Date
        $recent = @($notes | Where-Object { $_.Date -ge $releaseNotesCutoff })

        [void]$llms.AppendLine()
        [void]$llms.AppendLine("## Release Notes")
        [void]$llms.AppendLine()
        foreach ($note in $recent) {
            $link = Format-Link $note $frontmatterCache
            if ($link) {
                [void]$llms.AppendLine($link)
                $linkCount++
                if ($seenHrefs.Add($note.Href)) { $fullPages.Add($note) }
            }
        }
        [void]$llms.AppendLine()
        [void]$llms.AppendLine("Older release notes (back to $($oldest.ToString('MMMM yyyy', [System.Globalization.CultureInfo]::InvariantCulture))) follow the URL pattern $BaseUrl/doc/release-notes/YYYY-MM.md.")
        continue
    }

    # Landing page and direct child pages of the top-level section (e.g. Developer FAQ).
    $directLeaves = [System.Collections.Generic.List[object]]::new()
    if ($topSection.Href) {
        $directLeaves.Add([pscustomobject]@{ Name = "$($topSection.Name) $enDash Overview"; Href = $topSection.Href; GroupPath = @() })
    }
    foreach ($child in $topSection.Items) {
        if ($child.Href -and $child.Items.Count -eq 0) {
            $directLeaves.Add([pscustomobject]@{ Name = $child.Name; Href = $child.Href; GroupPath = @() })
        }
    }
    if ($directLeaves.Count -gt 0) {
        [void]$llms.AppendLine()
        [void]$llms.AppendLine("## $($topSection.Name)")
        [void]$llms.AppendLine()
        foreach ($leaf in $directLeaves) {
            $link = Format-Link $leaf $frontmatterCache
            if ($link) {
                [void]$llms.AppendLine($link)
                $linkCount++
                if ($seenHrefs.Add($leaf.Href)) { $fullPages.Add($leaf) }
            }
        }
    }

    # One section per second-level TOC group, deeper nesting flattened into link names.
    foreach ($group in $topSection.Items) {
        if ($group.Items.Count -eq 0) { continue }
        $leaves = @(Get-Leaves $group @())
        if ($leaves.Count -eq 0) { continue }
        [void]$llms.AppendLine()
        [void]$llms.AppendLine("## $($topSection.Name): $($group.Name)")
        [void]$llms.AppendLine()
        foreach ($leaf in $leaves) {
            $link = Format-Link $leaf $frontmatterCache
            if ($link) {
                [void]$llms.AppendLine($link)
                $linkCount++
                if ($seenHrefs.Add($leaf.Href)) { $fullPages.Add($leaf) }
            }
        }
    }
}

[void]$llms.AppendLine()
[void]$llms.AppendLine("## Optional")
[void]$llms.AppendLine()
[void]$llms.AppendLine("- [API Reference]($BaseUrl/api/overview.html): Auto-generated .NET API reference for the time cockpit assemblies (TimeCockpit.Data and related namespaces).")
[void]$llms.AppendLine("- [time cockpit website](https://www.timecockpit.com): Product website with pricing and sign-up.")

# --- llms-full.txt ---------------------------------------------------------------------

function Convert-PageBody([string]$href, [string[]]$lines) {
    # Strip frontmatter (tolerating leading blank lines).
    $start = 0
    $first = 0
    while ($first -lt $lines.Count -and $lines[$first].Trim() -eq '') { $first++ }
    if ($first -lt $lines.Count -and $lines[$first].Trim() -eq '---') {
        for ($i = $first + 1; $i -lt $lines.Count; $i++) {
            if ($lines[$i].Trim() -eq '---') { $start = $i + 1; break }
        }
    }
    $body = ($lines | Select-Object -Skip $start) -join "`n"

    # DocFX cross-links (~/doc/x.md, ~/doc/x.html, ~/doc/x), optionally with #anchor
    # and "title" -> absolute URLs. Pages under doc/ link to their published Markdown
    # source; everything else (e.g. api/) only exists as HTML.
    $body = [regex]::Replace($body, '\(~/(?<path>[^)#\s]+)(?<anchor>#[^)\s]*)?(?<title>\s+"[^"]*")?\)', {
        param($m)
        $path = $m.Groups['path'].Value
        if ($path -match '^doc/') {
            if ($path -match '\.html$') { $path = $path -replace '\.html$', '.md' }
            elseif ($path -notmatch '\.[A-Za-z0-9]+$') { $path += '.md' }
        }
        else {
            if ($path -match '\.md$') { $path = $path -replace '\.md$', '.html' }
            elseif ($path -notmatch '\.[A-Za-z0-9]+$') { $path += '.html' }
        }
        "($BaseUrl/$path$($m.Groups['anchor'].Value)$($m.Groups['title'].Value))"
    })

    # Relative links and images -> absolute URLs (resolved against the page directory).
    $pageDirUri = [System.Uri]::new("$BaseUrl/doc/$href")
    $body = [regex]::Replace($body, '\]\((?<target>[^)\s]+)(?<title>\s+"[^"]*")?\)', {
        param($m)
        $target = $m.Groups['target'].Value
        $title = $m.Groups['title'].Value
        if ($target -match '^(https?:|mailto:|#|~)') { return $m.Value }
        $anchor = ''
        if ($target -match '^(?<p>[^#]+)(?<a>#.*)$') { $target = $Matches['p']; $anchor = $Matches['a'] }
        $resolved = [System.Uri]::new($pageDirUri, $target).AbsoluteUri
        return "]($resolved$anchor$title)"
    })
    return $body.Trim()
}

$full = [System.Text.StringBuilder]::new()
[void]$full.AppendLine("# time cockpit $emDash full documentation")
[void]$full.AppendLine()
[void]$full.AppendLine("> Concatenated plain-text version of the time cockpit product documentation ($BaseUrl). Each page starts with its title and canonical URL. Release notes older than $ReleaseNotesMonths months are omitted; they are available at $BaseUrl/doc/release-notes/YYYY-MM.md. See $BaseUrl/llms.txt for a structured index.")

foreach ($page in $fullPages) {
    $file = Join-Path $docRoot ($page.Href -replace '/', '\')
    $fm = $frontmatterCache[$page.Href]
    $title = if ($fm -and $fm.Title) { $fm.Title } else { $page.Name }
    [void]$full.AppendLine()
    [void]$full.AppendLine("---")
    [void]$full.AppendLine()
    [void]$full.AppendLine("# $title")
    [void]$full.AppendLine()
    [void]$full.AppendLine("Source: $(Get-PageUrl $page.Href)")
    [void]$full.AppendLine()
    [void]$full.AppendLine((Convert-PageBody $page.Href (Get-Content -LiteralPath $file)))
}

# --- Write output (UTF-8 without BOM) --------------------------------------------------

$utf8NoBom = [System.Text.UTF8Encoding]::new($false)
[System.IO.File]::WriteAllText((Join-Path $repoRoot "llms.txt"), $llms.ToString(), $utf8NoBom)
[System.IO.File]::WriteAllText((Join-Path $repoRoot "llms-full.txt"), $full.ToString(), $utf8NoBom)

Write-Host "llms.txt: $linkCount links"
Write-Host "llms-full.txt: $($fullPages.Count) pages"

# --- Publish Markdown sources and llms files into _site (post-build step) --------------

$sitePath = Join-Path $repoRoot "_site"
if (Test-Path -LiteralPath $sitePath) {
    $copied = 0
    foreach ($file in Get-ChildItem -LiteralPath $docRoot -Filter *.md -Recurse) {
        $relative = $file.FullName.Substring($docRoot.Length).TrimStart('\')
        $target = Join-Path (Join-Path $sitePath "doc") $relative
        $targetDir = Split-Path $target -Parent
        if (-not (Test-Path -LiteralPath $targetDir)) {
            [void](New-Item -ItemType Directory -Path $targetDir -Force)
        }
        Copy-Item -LiteralPath $file.FullName -Destination $target -Force
        $copied++
    }
    Copy-Item -LiteralPath (Join-Path $repoRoot "llms.txt") -Destination $sitePath -Force
    Copy-Item -LiteralPath (Join-Path $repoRoot "llms-full.txt") -Destination $sitePath -Force
    Write-Host "Copied $copied Markdown source files and the llms files to _site"
}
else {
    Write-Warning "_site not found. Build the site first (docfx docfx.json), then re-run this script so the linked Markdown sources are published."
}
