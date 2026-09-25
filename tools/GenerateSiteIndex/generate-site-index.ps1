# Generates doc/site-index.md, a plain HTML-rendered index of every page in doc/toc.yml
# plus the API namespaces from api/toc.yml. The modern template renders navigation
# (TOC, navbar, breadcrumb) with JavaScript, so crawlers that do not execute scripts
# see every page as orphaned; this page gives them server-rendered links to everything.
#
# Runs before "docfx build" (build.ps1 does this). The output is committed, so the
# pipeline does not need to run it, but re-run it whenever doc/toc.yml changes.

[CmdletBinding()]
param()

$ErrorActionPreference = "Stop"
$repoRoot = (Resolve-Path (Join-Path $PSScriptRoot "..\..")).Path
$docRoot = Join-Path $repoRoot "doc"

function Remove-Quotes([string]$value) {
    $value = $value.Trim()
    if ($value.Length -ge 2 -and (($value[0] -eq '"' -and $value[-1] -eq '"') -or ($value[0] -eq "'" -and $value[-1] -eq "'"))) {
        $value = $value.Substring(1, $value.Length - 2)
    }
    return $value
}

# Same regular toc.yml structure as tools/GenerateLlmsTxt: "- name:", "href:", "items:".
function Read-Toc([string]$tocPath) {
    $root = [pscustomobject]@{ Name = ""; Href = $null; Indent = -4; Items = [System.Collections.Generic.List[object]]::new() }
    $stack = [System.Collections.Generic.Stack[object]]::new()
    $stack.Push($root)
    $current = $null
    foreach ($line in (Get-Content -LiteralPath $tocPath -Encoding UTF8)) {
        if ($line -match '^(\s*)-\s+name:\s*(.+?)\s*$') {
            $indent = $Matches[1].Length
            $node = [pscustomobject]@{ Name = (Remove-Quotes $Matches[2]); Href = $null; Indent = $indent; Items = [System.Collections.Generic.List[object]]::new() }
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
    }
    return $root
}

# Returns the Markdown link target for a TOC href, or $null when the entry should be
# plain text: folders, toc.yml references and pages that do not exist would otherwise
# become broken links on the index page.
function Resolve-Href([string]$href, [string]$baseDir, [string]$linkPrefix) {
    if (-not $href -or $href -eq 'site-index.md') { return $null }
    if ($href -match '^https?://') { return $href }
    $file = $href -replace '#.*$', ''
    if ($file -notmatch '\.(md|yml)$') {
        Write-Warning "site index: skipping '$href' (not a page)"
        return $null
    }
    if (-not (Test-Path -LiteralPath (Join-Path $baseDir ($file -replace '/', '\')))) {
        Write-Warning "site index: skipping '$href' (file not found)"
        return $null
    }
    return "$linkPrefix$href"
}

function Write-Items($node, [int]$level, [System.Text.StringBuilder]$sb, [string]$baseDir, [string]$linkPrefix) {
    foreach ($item in $node.Items) {
        $indent = '  ' * $level
        $target = Resolve-Href $item.Href $baseDir $linkPrefix
        if ($target) {
            [void]$sb.AppendLine("$indent- [$($item.Name)]($target)")
        }
        else {
            [void]$sb.AppendLine("$indent- $($item.Name)")
        }
        Write-Items $item ($level + 1) $sb $baseDir $linkPrefix
    }
}

$sb = [System.Text.StringBuilder]::new()
[void]$sb.AppendLine('---')
[void]$sb.AppendLine('title: Documentation Index - All Pages')
[void]$sb.AppendLine('description: "Complete index of the time cockpit documentation: every guide, FAQ, reference page and release note, plus the API reference namespaces."')
[void]$sb.AppendLine('---')
[void]$sb.AppendLine('# Documentation Index')
[void]$sb.AppendLine()
[void]$sb.AppendLine('Every page of the time cockpit documentation on one page, in the order of the navigation. Generated from `doc/toc.yml`; do not edit by hand.')
[void]$sb.AppendLine()

$toc = Read-Toc (Join-Path $docRoot "toc.yml")
foreach ($section in $toc.Items) {
    $target = Resolve-Href $section.Href $docRoot ''
    if ($target) {
        [void]$sb.AppendLine("## [$($section.Name)]($target)")
    }
    else {
        [void]$sb.AppendLine("## $($section.Name)")
    }
    [void]$sb.AppendLine()
    Write-Items $section 0 $sb $docRoot ''
    [void]$sb.AppendLine()
}

$apiToc = Join-Path $repoRoot "api\toc.yml"
if (Test-Path -LiteralPath $apiToc) {
    [void]$sb.AppendLine('## API Reference')
    [void]$sb.AppendLine()
    [void]$sb.AppendLine('.NET namespaces of the time cockpit data model; each namespace page lists its classes.')
    [void]$sb.AppendLine()
    $api = Read-Toc $apiToc
    foreach ($ns in $api.Items) {
        $target = Resolve-Href $ns.Href (Join-Path $repoRoot "api") '~/api/'
        if ($target) { [void]$sb.AppendLine("- [$($ns.Name)]($target)") }
    }
    [void]$sb.AppendLine()
}

$outPath = Join-Path $docRoot "site-index.md"
$content = $sb.ToString()
[System.IO.File]::WriteAllText($outPath, $content, (New-Object System.Text.UTF8Encoding $false))
$linkCount = ([regex]::Matches($content, '\]\(')).Count
Write-Host "doc/site-index.md: $linkCount links"
