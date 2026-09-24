---
title: MCP Server - Companion Skills and APM
description: Install the timecockpit-agents companion skills with Microsoft APM so AI assistants know how to connect to time cockpit, query with TCQL, book time, and run lists and actions.
---
# Companion Skills: Installing timecockpit-agents with APM

> [!WARNING]
> Preliminary documentation: The time cockpit MCP server and this documentation are under active development. Tool names, dialog labels and configuration steps may change without notice. Check back for updates before rolling the setup out to your users.

The public package **software-architects/timecockpit-agents** on GitHub ([github.com/software-architects/timecockpit-agents](https://github.com/software-architects/timecockpit-agents)) belongs to the MCP server. It contains the companion skills that teach an AI agent how to work with time cockpit correctly — from connecting to TCQL to booking patterns — plus three agent definitions and the MCP server declaration. Clients select skills automatically based on their description; you can also address them explicitly ("use the skill timecockpit-tcql").

| Skill | Purpose |
|-------|---------|
| `timecockpit-mcp-setup` | Set up the connection (remote/local), choose tenant/sandbox/access/scope, analyze sign-in problems and missing tools — **start here** |
| `timecockpit-time-tracking` | Book and correct your own hours (booking patterns) |
| `timecockpit-reporting` | Totals, budgets, utilization (report recipes) |
| `timecockpit-tcql` | Ad-hoc queries in TCQL (reference and cookbook) |
| `timecockpit-model-discovery` | Explore the customer-specific data model (`get_entities`, `describe_entity`) |
| `timecockpit-record-management` | Create, update, delete records — with confirmation handshake |
| `timecockpit-lists-and-actions` | Execute named lists and model actions |
| Agents (`agents/*.agent.md`) | time cockpit Time Assistant, Reporting Analyst, Tenant Admin — **not** deployed by `apm install`; use the Claude Code plugin / ChatGPT plugin or copy manually |

Skills are installed per project (repository) and end up in the client folders (`.claude/skills/`, `.agents/skills/`), so all clients see the same instructions. The recommended tool is **Microsoft APM** (Agent Package Manager), which fetches the skills from GitHub, deploys them to the right folders, versions them (`apm.lock.yaml`) and updates them. Alternatively copy `skills/` and `agents/` manually.

## Install APM

```powershell
irm https://aka.ms/apm-windows | iex                            # Windows (PowerShell)
winget install --id Microsoft.APM --exact --source winget        # alternative
brew install apm                                                 # macOS
curl -sSL https://aka.ms/apm-unix | sh                           # Linux
python3 -m pip install apm-cli                                   # cross-platform (Python >= 3.10)
apm --version
```

## Initialize the Project: apm init

In the repository root, `apm init` creates an `apm.yml`. Interactively it asks for name, version, description, author and the **targets** — the clients to deploy to (`claude`, `codex`, `copilot` (= VS Code), `cursor`, `agent-skills`, …). Without targets, APM later detects them from existing folders (`.claude/`, `.codex/`, `.vscode/`, …).

```powershell
cd C:\Repos\my-project
apm init
# or without prompts:
apm init --yes --target claude,codex
```

The interactive run looks like this (values in parentheses are the defaults; targets are pre-selected from detected folders):

```text
Project name (my-project):
Version (1.0.0):
Description (APM project for my-project):
Author (Jane Doe):

Select targets for this project:
  [x] 1. claude     (.claude/ detected)
  [x] 2. codex      (.codex/ detected)
  [ ] 3. copilot
  [ ] 4. cursor
Type a number to toggle, 'all' / 'none', Enter to confirm:

Is this OK? [Y/n] y
✔ Created apm.yml
```

Resulting `apm.yml` (targets Claude Code and Codex):

```yaml
name: my-project
version: 1.0.0
description: APM project for my-project
author: Jane Doe
targets:
  - claude
  - codex
dependencies:
  apm:
    - software-architects/timecockpit-agents
  mcp: []
includes: auto
scripts: {}
```

## Install the Skills: apm install

The package is installed via Git URL or GitHub short form. APM adds it to `apm.yml`, fetches it into `apm_modules/` (automatically added to `.gitignore`), deploys the skills into the target folders and writes `apm.lock.yaml` (commit SHA, file hashes — **commit it**, do not edit by hand):

```powershell
apm install https://github.com/software-architects/timecockpit-agents
# equivalent: short form, pin a version, single skill:
apm install software-architects/timecockpit-agents
apm install software-architects/timecockpit-agents#v0.1.7
apm install software-architects/timecockpit-agents/skills/timecockpit-mcp-setup
# without argument: install everything from apm.yml (e.g. after cloning):
apm install
```

```text
Resolving software-architects/timecockpit-agents ... v0.1.7 (cf12563)
Package type: skill_bundle · 7 skills · 1 MCP server declaration
✔ Installed to apm_modules/software-architects/timecockpit-agents
✔ Deployed 7 skills → .claude/skills/, .agents/skills/
    timecockpit-mcp-setup, timecockpit-time-tracking, timecockpit-reporting, timecockpit-tcql,
    timecockpit-model-discovery, timecockpit-record-management, timecockpit-lists-and-actions
✔ MCP server 'timecockpit' (https://mcp.timecockpit.com) written to .mcp.json, .codex/config.toml
[i] Skipped MCP config for copilot, cursor  (active targets: claude, codex)
✔ Updated apm.yml and apm.lock.yaml · added apm_modules/ to .gitignore
```

What is written where:

| Content | Target |
|---------|--------|
| Skills (`skills/<name>/SKILL.md` + `references/`) | `.claude/skills/<name>/` (target `claude`), `.agents/skills/<name>/` (`codex`, `copilot`, `cursor`, `agent-skills`) |
| MCP server declaration `timecockpit` (`https://mcp.timecockpit.com`) | per target: `.mcp.json` (Claude Code), `.codex/config.toml` (Codex, only if `.codex/` exists), `.vscode/mcp.json` (VS Code), `.github/mcp.json` (Copilot CLI), `.cursor/mcp.json` (Cursor) |
| Package cache | `apm_modules/software-architects/timecockpit-agents/` (gitignored) |
| Lock file | `apm.lock.yaml` (commit) |
| User-wide instead of per project | `apm install -g …` → `~/.apm/`, skills to `~/.claude/skills/` or `~/.agents/skills/`, MCP to `~/.claude.json` / `~/.codex/config.toml` |

> [!NOTE]
> The MCP entry written by APM contains **no client ID** (and no tenant) — the package cannot know them. After `apm install`, add the client ID to the respective client configuration ([Claude Code](claude-code.md), [Codex](codex.md), [VS Code](vscode.md)), or re-register the server once via CLI with `--client-id` / `--oauth-client-id`. Then restart the client so it picks up skills and server.

## Update and Remove

```powershell
apm update --dry-run     # shows available new versions
apm update --yes         # updates according to apm.yml constraints
apm deps list            # installed packages and primitives
apm uninstall software-architects/timecockpit-agents
```

Without a pin (`#v0.1.7`) the package follows the default branch and receives updates on the next `apm install` / `apm update`. For customer projects, pinning to a release tag is recommended.

## Other Installation Routes

- **Claude Code plugin marketplace:** The repository is also a Claude Code marketplace (`.claude-plugin/marketplace.json`). Install with `/plugin marketplace add software-architects/timecockpit-agents` and `/plugin install`. This route also installs the agents.
- **ChatGPT (Business/Enterprise):** A workspace administrator imports the repository as a marketplace (source `https://github.com/software-architects/timecockpit-agents`, release tag). The MCP server must be registered once as a custom MCP app in the workspace — see [ChatGPT](chatgpt.md).
- **Manual:** Copy the `skills/` and `agents/` folders into `.claude/`, `.agents/` or `.github/` of your project.

## Related Pages

- [MCP Server Overview](overview.md)
- [Verify the Connection](verify-connection.md)
- [Use Cases and Prompts](~/doc/ai-assistants/use-cases-and-prompts.md)
- [Microsoft APM documentation](https://microsoft.github.io/apm/)
