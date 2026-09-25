---
title: MCP-Server - Einrichtung in Claude App, claude.ai und Cowork
description: "Den MCP-Server von time cockpit als Custom Connector in claude.ai, Claude Desktop, Claude Mobile und Cowork mit eigener OAuth-Client-ID hinzufügen."
en_page: doc/mcp/claude-app.md
---
# Claude App, claude.ai und Cowork

> [!WARNING]
> Im Aufbau: Der MCP-Server von time cockpit und diese Dokumentation werden aktiv weiterentwickelt, inkompatible Änderungen sind möglich. Tools können umbenannt, geändert oder entfernt werden, und Dialogbeschriftungen sowie Konfigurationsschritte können sich ohne Ankündigung ändern. Prüfen Sie diese Seite auf Aktualisierungen, bevor Sie die Einrichtung für Ihre Benutzer ausrollen, und rechnen Sie damit, Ihre Konfiguration, Skills und Prompts nach einem Update anpassen zu müssen.

Die gehosteten Oberflächen von Claude (claude.ai, Claude Desktop, Claude Mobile, Cowork) verwenden **nicht** die Konfigurationsdateien von Claude Code. Remote-MCP-Server werden als **Custom Connector** hinzugefügt. Custom Connectors sind in allen Plänen verfügbar (Free: ein Connector). In den Plänen Team und Enterprise legt ein Owner den Connector an, und die Mitglieder verbinden sich damit.

> [!WARNING]
> Prüfung erforderlich: Dieser Client wurde noch nicht durchgängig gegen den MCP-Server von time cockpit verifiziert. Die Schritte folgen der Connector-Dokumentation von Anthropic; Dialogbeschriftungen können je nach Version abweichen.

## Custom Connector hinzufügen

**Pro / Max (persönlich):**

1. Öffnen Sie **Customize → Connectors** und wählen Sie **Add custom connector**.
2. Name: `Time Cockpit`. MCP server URL: `https://mcp.timecockpit.com` – bei Bedarf mit URL-Segmenten, z. B. `https://mcp.timecockpit.com/tcTenantId/<tenant-id>` oder `…/access/readonly/scope/owndata`. Claude prüft die URL und füllt erkannte Einstellungen vorab aus.
3. Authentifizierung: **Sign in now**.
4. OAuth-Client: **Use your own OAuth client**, Client-ID `<client-id>` Ihrer App-Registrierung, **das Client Secret leer lassen** (Public Client). In älteren Dialogen: **Advanced settings → OAuth Client ID**.
5. **Add**, dann **Connect**. Melden Sie sich mit Entra ID an; Sie werden zu `https://claude.ai/api/mcp/auth_callback` weitergeleitet – diese URI muss in Ihrer App-Registrierung als Plattform **Web** eingetragen sein (siehe [Einrichtung in Entra ID](~/doc/mcp/entra-id-einrichtung.md)).
6. Aktivieren Sie den Connector in einem Chat für die Unterhaltung über **+ → Connectors**.

**Team / Enterprise:** Nur ein **Owner** oder **Primary Owner** kann Custom Connectors hinzufügen – die Rolle **Admin** kann das nicht (sie umfasst nur die Mitgliederverwaltung) –, und zwar nur in den Organisationseinstellungen, nicht unter *Customize → Connectors*. Owner: Profilmenü → **Settings → Organization settings → Connectors → Add custom connector**, die MCP-Server-URL eingeben und unter **Advanced settings** die Client-ID. Mitglieder finden den Connector dann unter **Customize → Connectors → Your custom connectors** und wählen **Connect**.

> [!NOTE]
> Zeigt *Customize → Connectors* vorhandene Custom Connectors, aber keine Schaltfläche **Add custom connector**, ist Ihr Konto Mitglied (oder Admin) einer Team- oder Enterprise-Organisation. Bitten Sie einen Owner der Organisation, den time cockpit Connector hinzuzufügen oder Sie zum Owner zu machen.

> [!NOTE]
> Authentifizierungseinstellungen (OAuth-Client, Request-Header) lassen sich nach dem Anlegen eines Connectors nicht mehr ändern. Um sie zu ändern, entfernen Sie den Connector und fügen ihn erneut hinzu; die Mitglieder müssen sich neu verbinden.

## Mandant und Modi ohne Header

Der Connector-Dialog hat einen Abschnitt **Request headers** (Beta, nicht überall aktiviert), eigene Header-Namen wie `X-tc-tenant-id` müssen jedoch von Anthropic freigegeben werden. Das ist **nicht nötig**: Alle Einstellungen lassen sich als [URL-Segmente](~/doc/mcp/ueberblick.md#verbindungseinstellungen-header-oder-url-segment) übergeben. Im häufigen Fall, dass ein Entra-Mandant genau einem time cockpit Mandanten zugeordnet ist, genügt die reine URL, weil der Mandant aus Ihrer Entra-Anmeldung ermittelt wird.

## Alternative für Claude Desktop: lokale Bridge mit mcp-remote

Claude Desktop startet zusätzlich lokale stdio-Server aus `%APPDATA%\Claude\claude_desktop_config.json`; diese stehen auch in Cowork-Sitzungen zur Verfügung. Mit `mcp-remote` als Bridge können Sie wie bei Codex Header, Ihre Client-ID und einen festen Callback-Port verwenden. Das erfordert Node.js und richtet sich an erfahrene Benutzer.

> [!WARNING]
> Prüfung erforderlich: Die mcp-remote-Bridge wurde nicht gegen den MCP-Server von time cockpit getestet.

```json
{
  "mcpServers": {
    "timecockpit": {
      "command": "npx",
      "args": [
        "-y", "mcp-remote", "https://mcp.timecockpit.com",
        "--header", "X-tc-tenant-id:<tenant-id>",
        "--static-oauth-client-info", "{\"client_id\":\"<client-id>\"}",
        "64485"
      ]
    }
  }
}
```

## Verwandte Seiten

- [Überblick über den MCP-Server](~/doc/mcp/ueberblick.md)
- [Claude Code (CLI)](~/doc/mcp/claude-code.md)
- [Verbindung prüfen](~/doc/mcp/verbindung-pruefen.md)
- [Anthropic: Connectors von Drittanbietern mit Remote-MCP](https://claude.com/docs/connectors/custom/remote-mcp)
- [Anthropic: Authentifizierung für Connectors](https://claude.com/docs/connectors/building/authentication)
