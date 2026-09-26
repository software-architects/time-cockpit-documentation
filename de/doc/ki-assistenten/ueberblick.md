---
title: KI-Assistenten - Claude, Codex und Copilot mit time cockpit
description: "KI-Assistenten über den MCP-Server mit time cockpit nutzen: Möglichkeiten, unterstützte Assistenten, Voraussetzungen und ein sicherer Einstieg."
en_page: doc/ai-assistants/overview.md
---
# KI-Assistenten für time cockpit

time cockpit bietet einen MCP-Server, über den KI-Assistenten wie Claude, OpenAI Codex, GitHub Copilot und Microsoft 365 Copilot Ihre Daten in time cockpit lesen und – wenn Sie es erlauben – ändern können. Sie melden sich mit Ihrem normalen Microsoft-Geschäftskonto an, und der Assistent sieht nur, was Sie auch in time cockpit sehen dürfen.

> [!NOTE]
> Der MCP-Server von time cockpit befindet sich derzeit in der Public Preview. Details finden Sie unter [MCP-Server](/doc/mcp/overview.html).

## Was Sie tun können

- Fragen zu Ihren Projekten, Tätigkeiten, Zeitbuchungen, Budgets und Abwesenheiten in natürlicher Sprache stellen.
- Ihre eigenen Stunden pro Projekt zusammenfassen, Lücken in Ihrer Zeiterfassung finden oder Ihren Resturlaub prüfen.
- Den Assistenten Berichte und Dashboards aus aggregierten Daten von time cockpit erstellen lassen.
- Datensätze anlegen oder ändern (zum Beispiel einen Urlaubseintrag) – der Assistent zeigt Ihnen die geplante Änderung immer zuerst und bittet um Bestätigung.

Einsatzbereite Prompts nach Rolle finden Sie unter [Anwendungsfälle und Prompts](~/doc/ki-assistenten/anwendungsfaelle-und-prompts.md), Beispiele für Berichte und Dashboards unter [Dashboards und Visualisierungen](~/doc/ki-assistenten/dashboards.md).

## Unterstützte Assistenten

| Assistent | Status | Einrichtungsseite |
|-----------|--------|------------|
| Claude Code (Terminal) | getestet | [Claude Code](/doc/mcp/claude-code.html) |
| Claude App, claude.ai, Cowork | getestet | [Claude App](/doc/mcp/claude-app.html) |
| OpenAI Codex (CLI, Desktop-App, IDE) | getestet | [Codex](/doc/mcp/codex.html) |
| ChatGPT (Web, Business-/Enterprise-Workspace) | getestet, wird von Ihrem Administrator eingerichtet | [ChatGPT](/doc/mcp/chatgpt.html) |
| Visual Studio Code mit GitHub Copilot | getestet | [VS Code](/doc/mcp/vscode.html) |
| GitHub Copilot CLI | derzeit nicht unterstützt | [Copilot CLI](/doc/mcp/copilot-cli.html) |
| Microsoft 365 Copilot | erfordert Ihren Administrator | [Microsoft 365 Copilot](/doc/mcp/microsoft-365-copilot.html) |

## Was Sie brauchen

- Ein Microsoft-Entra-ID-Geschäftskonto mit Zugriff auf time cockpit.
- Die Client-ID der App-Registrierung, die Ihr IT-Administrator für den MCP-Server in der Entra ID Ihrer Organisation angelegt hat. Siehe [Einrichtung in Entra ID](/doc/mcp/entra-id-setup.html).
- Einen KI-Assistenten aus der obigen Tabelle, konfiguriert gemäß seiner Einrichtungsseite.

## Sichere Standardeinstellungen

Beim Konfigurieren der Verbindung können Sie einschränken, was ein Assistent tun darf:

- **Nur lesen** (`access=readonly`) blendet alle Tools aus, die Daten ändern.
- **Nur eigene Daten** (`scope=owndata`) beschränkt die Ergebnisse auf Ihre eigenen Datensätze.
- **Sandbox** (`sandboxEnvironment=test`) arbeitet mit der Testumgebung statt mit der Produktivumgebung.

Wie diese Einstellungen übergeben werden, hängt vom Assistenten ab – siehe [Verbindungseinstellungen](/doc/mcp/overview.html#connection-settings-header-or-url-segment). Schreibende Aktionen erfordern zusätzlich eine ausdrückliche Bestätigung im Gespräch.

## Verwandte Seiten

- [Anwendungsfälle und Prompts](~/doc/ki-assistenten/anwendungsfaelle-und-prompts.md)
- [Dashboards und Visualisierungen](~/doc/ki-assistenten/dashboards.md)
- [MCP-Server (für Entwickler und Administratoren)](/doc/mcp/overview.html)
