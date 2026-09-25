---
title: MCP-Server - Einrichtung in Microsoft 365 Copilot
description: "Drei Wege, den MCP-Server von time cockpit in Microsoft 365 Copilot zu nutzen: Copilot-Studio-Agents, deklarative Agents mit MCP-Plugin, Connectors."
en_page: doc/mcp/microsoft-365-copilot.md
---
# Microsoft 365 Copilot

> [!WARNING]
> Im Aufbau: Der MCP-Server von time cockpit und diese Dokumentation werden aktiv weiterentwickelt, inkompatible Änderungen sind möglich. Tools können umbenannt, geändert oder entfernt werden, und Dialogbeschriftungen sowie Konfigurationsschritte können sich ohne Ankündigung ändern. Prüfen Sie diese Seite auf Aktualisierungen, bevor Sie die Einrichtung für Ihre Benutzer ausrollen, und rechnen Sie damit, Ihre Konfiguration, Skills und Prompts nach einem Update anpassen zu müssen.

Endbenutzer können im Copilot-Chat keine MCP-URL eingeben. MCP-Server gelangen über **Agents oder Connectors** in Microsoft 365 Copilot – auf drei Wegen, an denen jeweils ein Maker oder ein Administrator beteiligt ist. Der Consumer-Copilot (copilot.microsoft.com) unterstützt keine eigenen MCP-Server.

> [!WARNING]
> Prüfung erforderlich: Keiner der drei Wege wurde bisher durchgängig mit dem MCP-Server von time cockpit verifiziert. Die Schritte folgen der Microsoft-Dokumentation; Dialogbeschriftungen können abweichen.

| Weg | Wer | Anmeldeoptionen | Header | Status |
|-------|-----|--------------|---------|--------|
| A) Copilot Studio – MCP-Tool in einem Agent, Agent in M365 Copilot veröffentlicht | Maker (Copilot-Studio-Lizenz), Administrator genehmigt die Veröffentlichung | OAuth 2.0 (DCR / Dynamic / **Manual** mit Client-ID **und Secret**), API-Schlüssel, None | nur über die Custom-Connector-Richtlinie „Set HTTP header“ – URL-Segmente sind vorzuziehen | GA |
| B) Deklarativer Agent mit MCP-Plugin (M365 Agents Toolkit) | Entwickler, Administrator veröffentlicht | Entra SSO, OAuth 2.0 Auth Code, DCR, None (kein API-Schlüssel) | nein | GA |
| C) Custom Federated Connector (M365 Admin Center → Copilot → Connectors) | Global / AI Administrator | Entra SSO, OAuth 2.0, None | nein | Preview, nur lesende Tools |

Da keiner dieser Wege eigene Header unterstützt, übergeben Sie Mandant und Modi als [URL-Segmente](/doc/mcp/overview.html#connection-settings-header-or-url-segment).

## Weg A: Copilot Studio

1. Copilot Studio → Agent → **Tools** → **Add a tool** → **New tool** → **Model Context Protocol**.
2. *Server name*, *Server description*, *Server URL* `https://mcp.timecockpit.com` (mit URL-Segmenten für Mandant/Modi, da es kein Header-Feld gibt).
3. Authentifizierung **OAuth 2.0 → Manual**: *Client ID* und *Client secret* Ihrer vertraulichen App-Registrierung (siehe unten), *Authorization URL* `https://login.microsoftonline.com/<your-entra-tenant>/oauth2/v2.0/authorize`, *Token URL template* und *Refresh URL* `https://login.microsoftonline.com/<your-entra-tenant>/oauth2/v2.0/token`, *Scopes* `https://mcp.timecockpit.com/mcp.access offline_access`. Der MCP-Assistent hat keine eigene Entra-Option.
4. **Create** → die angezeigte **Redirect URL** (`https://global.consent.azure-apim.net/redirect/<id>`) muss als Umleitungs-URI vom Plattformtyp **Web** in Ihrer App-Registrierung eingetragen werden. Das letzte Pfadsegment wird pro Tool erzeugt – kopieren Sie genau den angezeigten Wert.
5. **Create a new connection** → Entra-Anmeldung → **Add to agent**. Testen Sie den Agent, dann **Channels → Teams and Microsoft 365 Copilot → Make agent available in Microsoft 365 Copilot** und, falls erforderlich, **Submit for admin approval**.

> [!NOTE]
> Copilot Studio verlangt im manuellen Modus ein **Client Secret** und benötigt daher einen **vertraulichen Client**. Legen Sie für Copilot Studio eine eigene App-Registrierung an (Plattform *Web*, Client Secret, Berechtigung `mcp.access`), statt der Public-Client-Registrierung, die Claude Code und Codex verwenden, ein Secret hinzuzufügen – siehe [Einrichtung in Entra ID](/doc/mcp/entra-id-setup.html).

Technisch ist das MCP-Tool ein Custom Connector der Power Platform, daher gelten die Data-Loss-Prevention-Richtlinien Ihres Mandanten. Wenn ein statischer Header unvermeidbar ist, ist die Alternative **Custom connector → Import OpenAPI** (mit `x-ms-agentic-protocol: mcp-streamable-1.0`) und die Richtlinie **Set HTTP header** – deutlich aufwendiger als ein URL-Segment.

## Weg B: Deklarativer Agent mit MCP-Plugin

Mit dem Microsoft 365 Agents Toolkit (≥ 6.12) erstellen Sie einen deklarativen Agent, dessen Plugin-Manifest (v2.4) eine Runtime `"type": "RemoteMCPServer"` mit `spec.url` enthält. Anmeldung: **Entra SSO** (das Toolkit fragt nach der Entra-Client-ID), OAuth statisch/dynamisch oder None; nehmen Sie `offline_access` in die Scopes auf, um Refresh-Tokens zu erhalten. Redirect-URL für OAuth: `https://teams.microsoft.com/api/platform/v1.0/oAuthRedirect`. Verteilung per Sideload, danach Veröffentlichung durch den Administrator (Integrated apps). Header werden im Manifest nicht unterstützt – verwenden Sie URL-Segmente.

## Weg C: Custom Federated Connector (Preview)

Microsoft 365 Admin Center → **Copilot → Connectors → Gallery → Create a new connector → Custom connector → Connect to MCP server**: *Display name*, *Base URL*, Authentifizierung **Microsoft Entra SSO** (Client-ID der Entra-Anwendung) oder OAuth 2.0 (Client im Teams Developer Portal registriert, Redirect `https://teams.microsoft.com/api/platform/v1.0/oAuthRedirect`). Erfordert **Global Administrator** oder **AI Administrator**. Nur lesende Tools (Suche, Abruf, abfrageartige Tools) werden unterstützt – schreibende time cockpit Tools stehen auf diesem Weg nicht zur Verfügung. Oberflächen: Copilot Chat, Copilot in Excel, Researcher, Cowork.

## Empfehlung

- Für einen ersten Pilotversuch: Weg A (Copilot Studio), weil Maker ihn ohne Entwicklung konfigurieren können; Mandant und Modi als URL-Segmente; eine eigene vertrauliche App-Registrierung für Copilot Studio.
- Weg C nur für reine Rechercheszenarien (nur lesend), sobald er die Preview-Phase verlässt.

## Verwandte Seiten

- [Überblick über den MCP-Server](/doc/mcp/overview.html)
- [Einrichtung in Entra ID](/doc/mcp/entra-id-setup.html)
- [Microsoft Learn: Add an existing MCP server in Copilot Studio](https://learn.microsoft.com/en-us/microsoft-copilot-studio/mcp-add-existing-server-to-agent)
