# Shared helpers for the German documentation scripts (dot-source this file).
# - Get-DePageMap: EN page path (doc/x.md) -> DE page path (doc/y.md, relative to de/),
#   built from the en_page front matter of every page under de/doc.
# - Read-Toc / Remove-Quotes: the same simple toc.yml reader as tools/GenerateLlmsTxt.

$script:RepoRoot = (Resolve-Path (Join-Path $PSScriptRoot "..\..")).Path
$script:DeRoot = Join-Path $script:RepoRoot "de"

function Remove-Quotes([string]$value) {
    $value = $value.Trim()
    if ($value.Length -ge 2 -and (($value[0] -eq '"' -and $value[-1] -eq '"') -or ($value[0] -eq "'" -and $value[-1] -eq "'"))) {
        $value = $value.Substring(1, $value.Length - 2)
    }
    return $value
}

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

# Reads "key: value" from the front matter of a Markdown file (first 40 lines).
function Get-FrontMatterValue([string]$filePath, [string]$key) {
    $inHeader = $false
    foreach ($line in (Get-Content -LiteralPath $filePath -TotalCount 40 -Encoding UTF8)) {
        $t = $line.TrimEnd()
        if ($t -eq '---') { if ($inHeader) { break } else { $inHeader = $true; continue } }
        if ($inHeader -and $t -match ('^' + [regex]::Escape($key) + ':\s*(.+?)\s*$')) { return (Remove-Quotes $Matches[1]) }
    }
    return $null
}

# Returns a hashtable: EN page path ("doc/getting-started/overview.md") -> DE page path
# relative to de/ ("doc/erste-schritte/ueberblick.md"). Warns about DE pages without
# en_page, unknown EN targets and file names that are not plain kebab-case.
function Get-DePageMap() {
    $map = @{}
    $deDoc = Join-Path $script:DeRoot "doc"
    if (-not (Test-Path -LiteralPath $deDoc)) { return $map }
    foreach ($f in Get-ChildItem -LiteralPath $deDoc -Recurse -Filter *.md -File) {
        $rel = $f.FullName.Substring($script:DeRoot.Length).TrimStart('\', '/').Replace('\', '/')
        if ($rel -notmatch '^[a-z0-9\-/]+\.md$') { Write-Warning "DE page name is not kebab-case ASCII: $rel" }
        $en = Get-FrontMatterValue $f.FullName 'en_page'
        if (-not $en) { Write-Warning "DE page without en_page front matter: $rel"; continue }
        $en = $en.Replace('\', '/')
        if (-not (Test-Path -LiteralPath (Join-Path $script:RepoRoot ($en -replace '/', '\')))) { Write-Warning "en_page not found: $en (in $rel)" }
        if ($map.ContainsKey($en)) { Write-Warning "en_page used twice: $en ($($map[$en]) and $rel)" }
        $map[$en] = $rel
    }
    return $map
}
