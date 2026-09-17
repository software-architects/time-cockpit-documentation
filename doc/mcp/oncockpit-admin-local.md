---
title: MCP Server - OnCockpit Admin Local MCP Server
description: Run the local time cockpit MCP server built into OnCockpit Admin over stdio, register it in Claude Code, VS Code or Codex, and use IronPython scripting for data model roundtrips, test data and automated tests.
---
# OnCockpit Admin: Local MCP Server (stdio)

Besides the [remote MCP server](overview.md), time cockpit ships a **local MCP server** inside [OnCockpit Admin](~/doc/data-model-customization/overview.md), the Windows tool for customizing time cockpit. Started with `--mcp`, OnCockpit Admin talks MCP over standard input/output (stdio) instead of showing its user interface. The AI client launches the process itself; no OAuth, no server URL.

The local server is aimed at **administrators and customizers**, not at end users booking time. Its distinguishing feature is **IronPython script execution** against the live data context: an assistant can run the same scripts you would otherwise run in the OnCockpit Admin script editor or via the command line. This enables workflows the remote server deliberately does not offer, such as changing the data model or loading test data.

> [!WARNING]
> Scripts run with the full permissions of the configuration you connect with and can change the complete model and data. Use a [sandbox](~/doc/data-model-customization/overview.md#sandboxes-test-systems-in-time-cockpit) or a dedicated test configuration for anything experimental.

## Remote or Local?

| | Remote server (`https://mcp.timecockpit.com`) | Local server (`OnCockpit.Admin.exe --mcp`) |
|---|---|---|
| Runs | In the cloud, per user via Entra ID | On your Windows PC, as a child process of the AI client |
| Sign-in | OAuth 2.1 with Microsoft Entra ID | The OnCockpit Admin **configuration** (`-c <name>`) you already use |
| Clients | Every MCP client with HTTP transport, including Claude app, Copilot, ChatGPT | Clients that can start stdio servers: Claude Code, VS Code, Codex, Claude Desktop, Cursor, Copilot CLI |
| Data access | Typed tools, TCQL queries, lists, actions, record CRUD | TCQL queries, lists, plus **arbitrary IronPython scripts** |
| Data model changes | Not possible | Possible via script (`DataModel.py` migrations) |
| Typical use | Booking time, reporting, everyday questions | Customization, migrations, test data, automated tests, complex one-off analyses |

Both servers can be registered side by side under different names.

## Prerequisites

- Windows. OnCockpit Admin is a Windows desktop application; the local MCP server is not available on macOS or Linux.
- **OnCockpit Admin from the dev feed.** The MCP mode is currently only contained in the dev channel. Download and run the installer from `https://update-admin.on-cockpit.com/dev/Setup.exe`. The application updates itself from the same feed afterwards; you can check the active feed under **Statistics** in the options (row **Update Feed**).
- A working **configuration** in OnCockpit Admin. Start OnCockpit Admin once, create a configuration via **New Configuration** in the start dialog, and sign in. For a sandbox use the user name pattern `test/your.email@example.com` (see [Accessing the Sandbox](~/doc/data-model-customization/overview.md#accessing-the-sandbox-without-microsoft-entra-aad)).
- An MCP client that supports stdio servers.

> [!NOTE]
> The installer places a version-independent launcher at `%LOCALAPPDATA%\OnCockpitAdmin\OnCockpit.Admin.exe`. It forwards all arguments to the currently installed version, so use this path in your client configuration. The versioned folders below (`app-<version>\`) change with every update.

## Start Command

```powershell
%LOCALAPPDATA%\OnCockpitAdmin\OnCockpit.Admin.exe --mcp [-c <configuration>]
```

| Option | Meaning |
|--------|---------|
| `--mcp` | Run as MCP server over stdio instead of starting the user interface. |
| `-c <configuration>` | Optional. Name of the OnCockpit Admin configuration (tenant, sandbox and user are part of the configuration). Without it, the configuration selector dialog opens when the client starts the server, and you pick the configuration there. Pass the name to start without any dialog, for example in shared team configurations. |
| `--mcp-access Default\|ReadOnly` | Optional, default `Default`. `ReadOnly` hides every tool that changes data, including the script tools. |
| `--mcp-scope Default\|OwnData` | Optional, default `Default`. `OwnData` hides every tool whose result cannot be restricted to the signed-in user. |
| `--mcp-confirmation Required\|Disabled` | Optional, default `Required`. Whether generic actions and record changes need the `confirmed=true` handshake. Only an operator setting; there is no per-request override. |

Access and scope have the same meaning as the remote server's connection settings; tenant, sandbox and profile are not separate options because they come from the configuration. See [Access, Scope, and Confirmation](access-and-confirmation.md).

`--mcp` cannot be combined with `-f`/`--file`, `--action` or `--no-data-context`. Standard output is reserved for the MCP protocol; diagnostics and errors go to standard error, which most clients show in their MCP log. If the data context cannot be opened (wrong configuration name, expired password), the process ends with an error message on standard error instead of a dialog.

You normally do not run this command by hand. The client starts the process when it needs the server and stops it when the session ends.

## Register the Server

The examples use a configuration named `test`. Replace `<you>` with your Windows user name where a full path is required; environment variables such as `%LOCALAPPDATA%` are not expanded inside JSON files.

### Claude Code

```powershell
claude mcp add timecockpit-local --scope user -- "C:\Users\<you>\AppData\Local\OnCockpitAdmin\OnCockpit.Admin.exe" -c test --mcp
```

Or in a project's `.mcp.json`, so the whole team gets the server. Use an environment variable for the path when team members have different user names:

```json
{
  "mcpServers": {
    "timecockpit-local": {
      "type": "stdio",
      "command": "${OnCockpitAdminBinary}",
      "args": ["-c", "test", "--mcp"]
    }
  }
}
```

Set `OnCockpitAdminBinary` as a user environment variable to `C:\Users\<you>\AppData\Local\OnCockpitAdmin\OnCockpit.Admin.exe`, then restart the terminal. `claude mcp list` should report the server as connected; `/mcp` inside a session shows its tools.

### Visual Studio Code (Copilot agent mode)

`.vscode/mcp.json` in the project or the user-level `mcp.json`:

```json
{
  "servers": {
    "timecockpit-local": {
      "type": "stdio",
      "command": "${env:OnCockpitAdminBinary}",
      "args": ["-c", "test", "--mcp"]
    }
  }
}
```

VS Code shows the server in the Copilot Chat **MCP Servers** pane with **Start**/**Stop**. Tools appear as `mcp_timecockpit-local_<tool>`.

### OpenAI Codex

```powershell
codex mcp add timecockpit-local -- "C:\Users\<you>\AppData\Local\OnCockpitAdmin\OnCockpit.Admin.exe" -c test --mcp
```

This writes a `[mcp_servers.timecockpit-local]` entry with `command` and `args` to `%USERPROFILE%\.codex\config.toml`.

### Claude Desktop

Claude Desktop starts stdio servers from `%APPDATA%\Claude\claude_desktop_config.json`:

```json
{
  "mcpServers": {
    "timecockpit-local": {
      "command": "C:\\Users\\<you>\\AppData\\Local\\OnCockpitAdmin\\OnCockpit.Admin.exe",
      "args": ["-c", "test", "--mcp"]
    }
  }
}
```

## Verify

Ask the assistant to call `ping` and then to read the resource `timecockpit://currentUser` (or `get_resource` with that URI). The result must show the user of the configuration you expect, in the sandbox you expect. A prompt such as *"Call ping on the local time cockpit server, then show me which user and tenant I am connected as"* works in every client.

If the server does not start:

- Check the client's MCP log for the message from standard error. `Could not get a data context` means the configuration name is wrong or its stored sign-in no longer works. Start OnCockpit Admin normally, open the configuration, sign in and try again.
- Make sure the path points to the launcher in `%LOCALAPPDATA%\OnCockpitAdmin\`, not to a removed `app-<version>` folder.
- Only one MCP session per configuration should run at a time. Model changes are not protected by optimistic locking; two scripts writing the model of the same tenant concurrently overwrite each other silently.

## Tools

The local server offers the same shared tools as the remote server, with the same names, parameters and result shapes, plus a few local-only tools. Client prefixes vary (`timecockpit-local__ping`, `mcp_timecockpit-local_ping`). Which tools you see depends on `--mcp-access` and `--mcp-scope` and on your time cockpit permissions; see [Access, Scope, and Confirmation](access-and-confirmation.md).

| Tool | Changes data | Hidden with `OwnData` | Purpose |
|------|--------------|----------------------|---------|
| `ping` | no | | Check that the server is reachable and the data context is open. |
| `get_environment` | no | | The signed-in user, the tenant's global settings and the evaluated named sets. |
| `get_named_set` | no | | One evaluated named set in full, under a larger row limit than `get_environment`. |
| `get_current_user` | no | | The signed-in user's full record. |
| `get_timesheets` | no | | Read timesheets with typed filters (date range, project or task code, description, user). |
| `create_timesheet` | **yes** | | Create one timesheet entry. |
| `create_timesheet_suggestion` | **yes** | yes | **Local only.** Propose an existing timesheet to other users as a suggestion. Needs `confirmed=true`. |
| `get_entities` | no | | List the entities of the tenant's data model. System entities are hidden. |
| `describe_entity` | no | | Full metadata for one entity: properties, types, relations. |
| `get_lists` | no | | List the named lists available to the user. |
| `describe_list` | no | | Parameters and result columns of a named list. |
| `execute_list` | no | yes | Run a named list, optionally with an additional TCQL condition. Prefer an existing list over a hand-written query when one fits. |
| `get_actions` | no | | List the actions the user may execute for an entity, or the standalone actions. |
| `execute_action` | **yes** | yes | Execute a model action. Needs `confirmed=true`. |
| `execute_tcql_query` | no | yes | Run a bounded read-only TCQL query with optional named parameters (`@Name`). |
| `create_entity`, `update_entity`, `delete_entity` | **yes** | yes | Create, update or delete a record of a visible entity. Need `confirmed=true`. |
| `get_resource` | no | | **Local only.** Read one of the resources below for clients that do not support MCP resources natively. |
| `execute_script_literal` | **yes** | yes | **Local only.** Run inline IronPython 2.7 source against the live data context. Output written with `print` is returned as the result. The script sees the data context as the global `Context` object. |
| `execute_script_file` | **yes** | yes | **Local only.** Run an existing `.py` file from the local disk. Use this for larger scripts such as `DataModel.py` migrations that read further files relative to their own location. An operator can restrict the allowed folders. |

Everything marked as changing data is hidden with `--mcp-access ReadOnly`. `entra_whoami` exists only on the remote server. The script tools are not confirmation-gated; the confirmation handshake applies to the generic action and record tools. Reads are row-capped and report `truncated`; see [Limits and Truncation](limits.md).

The server instructions tell the assistant to prefer a TCQL query or a list whenever the task can be expressed that way, and to reach for scripts only for what queries cannot do. Once a script or an action has started it cannot be interrupted from the client.

> [!NOTE]
> Older OnCockpit Admin builds on the dev feed expose a smaller, differently named tool set (`tcql_query` instead of `execute_tcql_query`, no `get_entities`, no `--mcp-*` options). Update OnCockpit Admin if the tools listed here are missing.

## Resources

The server publishes the connected tenant's model as MCP resources. Clients with native resource support show them under **Resources**; others use `get_resource`.

| URI | Content |
|-----|---------|
| `timecockpit://ServerInstructions.md` | How the assistant should work with time cockpit: tool precedence, TCQL reference. Read first. |
| `timecockpit://datamodel` | Compact index of the live data model: entities with properties and relations, lists with columns, actions with permissions, trigger and validation summaries. Source code is left out to keep it small. |
| `timecockpit://datamodel/lists/{listName}` | Full details of one list including its TCQL query or script source, columns and edit settings. |
| `timecockpit://datamodel/actions/{actionName}` | Full details of one action including its IronPython source. |
| `timecockpit://datamodel/entities/{entityName}/triggers/{triggerName}` | Full details of one trigger including its IronPython source. |
| `timecockpit://currentUser` | The signed-in user (`APP_UserDetail`). |
| `timecockpit://globalSettings` | The tenant's global settings (`APP_GlobalSettings`). |

Because the model is customer-specific, these resources are what makes generated TCQL and scripts fit your tenant: `USR_` entities, custom properties and lists are all visible there.

## What You Can Do with Scripts

The local server turns the assistant into a scripting partner for OnCockpit Admin. Typical patterns, all Windows-only and all against the tenant of the chosen configuration:

**Complex analyses beyond a single query.** Where a question needs several queries, grouping in code or access to model metadata (permissions, triggers, validation rules), the assistant writes an IronPython script, runs it with `execute_script_literal` and works with the printed output. The `Context` object offers `Select`, `SelectWithParams`, the model (`Context.Model.Entities`, `.Actions`, `.ModelEntityViews`) and the full scripting API described under [Scripting](~/doc/scripting/overview.md).

**From specification to data model.** Describe a feature in prose. With the [companion skills](companion-skills.md) for data model customization the assistant reads the live model, generates a `DataModel.py` migration (entities, properties, relations, lists, forms, triggers, actions), validates it in a transaction that is always rolled back, and only then deploys it with `execute_script_file`. Afterwards it verifies the result by reading `timecockpit://datamodel` again.

**Test data.** A second script seeds the new entities with sample records. Since the same server reads and writes, the roundtrip *deploy model, load test data, inspect, adjust, repeat* stays inside one session.

**End-to-end checks in the web client.** Combine the local server with a browser tool of your client (for example a Chrome browser controller in Codex or Claude Code). The assistant deploys a model change, loads test data through the local server, then opens the time cockpit web client in the browser, exercises the new list or form, and feeds what it sees back into the next iteration.

**Structured tests in IronPython.** Scripts can also act as tests: create records, run an action or trigger, assert with TCQL, print a pass/fail summary, and roll the transaction back. Keeping these scripts in your customization repository and running them with `execute_script_file` gives you repeatable regression checks for a tenant.

Recommended safeguards for all of these:

- Point the configuration at a **sandbox** or test tenant. Only deploy to production from a reviewed script.
- Validate migrations with a rollback-only run before committing them.
- Never run two model-writing scripts against the same tenant at the same time.
- Ask the assistant to show a script before it executes anything that writes.

## Companion Skills

The [timecockpit-agents](https://github.com/software-architects/timecockpit-agents) package described under [Companion Skills](companion-skills.md) covers the local server as well: `timecockpit-mcp-setup` helps with the stdio registration and with diagnosing a server that does not start, `timecockpit-tcql` and `timecockpit-model-discovery` apply unchanged. Skills for data model migrations, script execution loops and feature testing that build on `execute_script_literal` and `execute_script_file` are being published to the same repository.

## Related Pages

- [MCP Server Overview](overview.md) and the remote client pages
- [Companion Skills & APM](companion-skills.md)
- [Data Model Customization](~/doc/data-model-customization/overview.md) and [Sandbox](~/doc/data-model-customization/overview.md#sandboxes-test-systems-in-time-cockpit)
- [Scripting](~/doc/scripting/overview.md) and [TCQL](~/doc/tcql/overview.md)
