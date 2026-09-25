---
title: MCP Server - GitHub Copilot CLI
description: Status of the time cockpit MCP server with the GitHub Copilot CLI and the Copilot coding agent: configuration locations and known authentication limits.
---
# GitHub Copilot CLI

> [!WARNING]
> Under construction: The time cockpit MCP server and this documentation are under active development, and breaking changes are possible. Tools may be renamed, changed or removed, and dialog labels and configuration steps may change without notice. Check back for updates before rolling the setup out to your users, and expect to adapt your configuration, skills and prompts after an update.

The terminal agent `copilot` stores MCP servers in `%USERPROFILE%\.copilot\mcp-config.json`; per project additionally in `.mcp.json` or `.github\mcp.json` (the file closest to the working directory wins). `apm install` can write the `timecockpit` entry to `.github/mcp.json` — see [Companion Skills](companion-skills.md).

> [!WARNING]
> Review required: Authentication with the Copilot CLI against Microsoft Entra ID is currently **not verified**. The Copilot CLI uses Dynamic Client Registration by default, and a configured `oauth.clientId` is reportedly ignored, which fails with Entra ID. Until a test with a current version succeeds, treat this client as *not supported / under evaluation* and use [Visual Studio Code](vscode.md) instead.

## Add the Server

Interactively in a session with `/mcp add`: fields *Server Name*, *Server Type* (HTTP/SSE), *URL*, *HTTP Headers* (format `Key: value`), *Tools* (`*` for all); save with **Ctrl+S**.

```text
Add MCP Server

Server Name:   timecockpit
Server Type:   ○ Local/STDIO   ● HTTP/SSE
URL:           https://mcp.timecockpit.com
HTTP Headers:  X-tc-tenant-id: <tenant-id>
Tools:         *

Ctrl+S to save · Esc to cancel
```

The resulting entry in `%USERPROFILE%\.copilot\mcp-config.json`:

```json
{
  "mcpServers": {
    "timecockpit": {
      "type": "http",
      "url": "https://mcp.timecockpit.com",
      "headers": {
        "X-tc-tenant-id": "<tenant-id>"
      },
      "oauth": {
        "clientId": "<client-id>",
        "callbackPort": 64485
      },
      "tools": ["*"]
    }
  }
}
```

## Authentication Status

The Copilot CLI supports OAuth for remote servers but uses **Dynamic Client Registration** by default, which Entra ID does not support. Newer versions (1.0.68, 1.0.81) contain Entra-specific improvements (vanity domains, WAM broker on Windows), but confirmation for static client IDs is still missing.

## Related: GitHub Copilot Coding Agent

The cloud agent on github.com (**Repository settings → Copilot → MCP servers**) supports HTTP servers with headers and `COPILOT_MCP_*` secrets, but according to the GitHub documentation **no OAuth** for remote servers. Without a static token on the time cockpit server it cannot be used at the moment.

## Related Pages

- [MCP Server Overview](overview.md)
- [Visual Studio Code (Copilot agent mode)](vscode.md)
- [GitHub: Add MCP servers to Copilot CLI](https://docs.github.com/en/copilot/how-tos/copilot-cli/customize-copilot/add-mcp-servers)
