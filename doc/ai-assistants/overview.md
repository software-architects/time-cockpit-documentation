---
title: AI Assistants - Work with Time Cockpit from Claude, Codex, and Copilot
description: Entry page for using AI assistants with time cockpit via the MCP server - what you can do, which assistants are supported, what you need, and how to get started safely.
---
# AI Assistants for Time Cockpit

time cockpit provides an MCP server that lets AI assistants such as Claude, OpenAI Codex, GitHub Copilot, and Microsoft 365 Copilot read and — when you allow it — change your time cockpit data. You sign in with your normal Microsoft work account, and the assistant only sees what you are allowed to see in time cockpit.

## What You Can Do

- Ask questions about your projects, tasks, timesheets, budgets, and absences in plain language.
- Summarize your own hours per project, find gaps in your time tracking, or check your remaining vacation.
- Let the assistant prepare reports and dashboards from aggregated time cockpit data.
- Create or change records (for example a vacation entry) — the assistant always shows you the planned change first and asks for confirmation.

Ready-to-use prompts by role are collected in [Use Cases and Prompts](use-cases-and-prompts.md); report and dashboard examples in [Dashboards and Visualizations](dashboards.md).

## Supported Assistants

| Assistant | Status | Setup page |
|-----------|--------|------------|
| Claude Code (terminal) | tested | [Claude Code](~/doc/mcp/claude-code.md) |
| Claude app, claude.ai, Cowork | not yet verified | [Claude App](~/doc/mcp/claude-app.md) |
| OpenAI Codex (CLI, desktop app, IDE) | tested | [Codex](~/doc/mcp/codex.md) |
| Visual Studio Code with GitHub Copilot | not yet tested | [VS Code](~/doc/mcp/vscode.md) |
| GitHub Copilot CLI | not supported at the moment | [Copilot CLI](~/doc/mcp/copilot-cli.md) |
| Microsoft 365 Copilot | requires your administrator | [Microsoft 365 Copilot](~/doc/mcp/microsoft-365-copilot.md) |

## What You Need

- A Microsoft Entra ID work account that has access to time cockpit.
- The client ID of the time cockpit MCP client application — your administrator or time cockpit support provides it. See [Entra ID Setup](~/doc/mcp/entra-id-setup.md).
- An AI assistant from the table above, configured by following its setup page.

## Safe Defaults

You can restrict what an assistant may do when you configure the connection:

- **Read-only** (`access=readonly`) hides all tools that change data.
- **Own data only** (`scope=owndata`) limits results to your own records.
- **Sandbox** (`sandboxEnvironment=test`) works against the test environment instead of production.

How these settings are passed depends on the assistant — see [Connection Settings](~/doc/mcp/overview.md#connection-settings-header-or-url-segment). Writing actions additionally require an explicit confirmation in the conversation.

## Related Pages

- [Use Cases and Prompts](use-cases-and-prompts.md)
- [Dashboards and Visualizations](dashboards.md)
- [MCP Server (for developers and administrators)](~/doc/mcp/overview.md)
