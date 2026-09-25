---
title: MCP-Server - Begleitende Skills und APM
description: "Die begleitenden Skills von timecockpit-agents mit Microsoft APM installieren, damit KI-Assistenten time cockpit nutzen, TCQL abfragen und Zeit buchen."
en_page: doc/mcp/companion-skills.md
---
# Begleitende Skills: timecockpit-agents mit APM installieren

> [!WARNING]
> Im Aufbau: Der MCP-Server von time cockpit und diese Dokumentation werden aktiv weiterentwickelt, inkompatible Änderungen sind möglich. Tools können umbenannt, geändert oder entfernt werden, und Dialogbeschriftungen sowie Konfigurationsschritte können sich ohne Ankündigung ändern. Prüfen Sie diese Seite auf Aktualisierungen, bevor Sie die Einrichtung für Ihre Benutzer ausrollen, und rechnen Sie damit, Ihre Konfiguration, Skills und Prompts nach einem Update anpassen zu müssen.

Das öffentliche Paket **software-architects/timecockpit-agents** auf GitHub ([github.com/software-architects/timecockpit-agents](https://github.com/software-architects/timecockpit-agents)) gehört zum MCP-Server. Es enthält die begleitenden Skills, die einem KI-Agent beibringen, richtig mit time cockpit zu arbeiten – vom Verbinden über TCQL bis zu Buchungsmustern –, dazu drei Agent-Definitionen und die Deklaration des MCP-Servers. Clients wählen Skills anhand ihrer Beschreibung automatisch aus; Sie können sie auch ausdrücklich ansprechen („verwende den Skill timecockpit-tcql“).

| Skill | Zweck |
|-------|---------|
| `timecockpit-mcp-setup` | Verbindung einrichten (remote/lokal), Mandant/Sandbox/Zugriff/Umfang wählen, Anmeldeprobleme und fehlende Tools analysieren – **hier beginnen** |
| `timecockpit-time-tracking` | Eigene Stunden buchen und korrigieren (Buchungsmuster) |
| `timecockpit-reporting` | Summen, Budgets, Auslastung (Berichtsrezepte) |
| `timecockpit-tcql` | Ad-hoc-Abfragen in TCQL (Referenz und Kochbuch) |
| `timecockpit-model-discovery` | Das kundenspezifische Datenmodell erkunden (`get_entities`, `describe_entity`) |
| `timecockpit-record-management` | Objekte anlegen, ändern, löschen (`create_object`, `update_object`, `delete_object`) – mit Bestätigungsablauf |
| `timecockpit-lists-and-actions` | Benannte Listen finden und ausführen; Modellaktionen sind über MCP nicht verfügbar und werden in der Oberfläche von time cockpit ausgeführt |
| Agents (`agents/*.agent.md`) | time cockpit Time Assistant, Reporting Analyst, Tenant Admin – werden von `apm install` **nicht** bereitgestellt; verwenden Sie das Claude-Code-Plugin / ChatGPT-Plugin oder kopieren Sie sie manuell |

Skills werden pro Projekt (Repository) installiert und landen in den Client-Ordnern (`.claude/skills/`, `.agents/skills/`), sodass alle Clients dieselben Anweisungen sehen. Das empfohlene Werkzeug ist **Microsoft APM** (Agent Package Manager), das die Skills von GitHub holt, sie in die richtigen Ordner verteilt, sie versioniert (`apm.lock.yaml`) und aktualisiert. Alternativ kopieren Sie `skills/` und `agents/` manuell.

## APM installieren

```powershell
irm https://aka.ms/apm-windows | iex                            # Windows (PowerShell)
winget install --id Microsoft.APM --exact --source winget        # alternative
brew install apm                                                 # macOS
curl -sSL https://aka.ms/apm-unix | sh                           # Linux
python3 -m pip install apm-cli                                   # cross-platform (Python >= 3.10)
apm --version
```

## Projekt initialisieren: apm init

Im Stammverzeichnis des Repositorys erstellt `apm init` eine `apm.yml`. Interaktiv fragt es nach Name, Version, Beschreibung, Autor und den **Targets** – den Clients, für die bereitgestellt wird (`claude`, `codex`, `copilot` (= VS Code), `cursor`, `agent-skills`, …). Ohne Targets erkennt APM sie später anhand vorhandener Ordner (`.claude/`, `.codex/`, `.vscode/`, …).

```powershell
cd C:\Repos\my-project
apm init
# or without prompts:
apm init --yes --target claude,codex
```

Der interaktive Ablauf sieht so aus (Werte in Klammern sind die Standardwerte; Targets sind anhand erkannter Ordner vorausgewählt):

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

Resultierende `apm.yml` (Targets Claude Code und Codex):

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

## Skills installieren: apm install

Das Paket wird über eine Git-URL oder die GitHub-Kurzform installiert. APM fügt es der `apm.yml` hinzu, lädt es nach `apm_modules/` (wird automatisch zur `.gitignore` hinzugefügt), stellt die Skills in den Zielordnern bereit und schreibt `apm.lock.yaml` (Commit-SHA, Datei-Hashes – **committen Sie sie**, bearbeiten Sie sie nicht von Hand):

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

Was wohin geschrieben wird:

| Inhalt | Ziel |
|---------|--------|
| Skills (`skills/<name>/SKILL.md` + `references/`) | `.claude/skills/<name>/` (Target `claude`), `.agents/skills/<name>/` (`codex`, `copilot`, `cursor`, `agent-skills`) |
| MCP-Server-Deklaration `timecockpit` (`https://mcp.timecockpit.com`) | pro Target: `.mcp.json` (Claude Code), `.codex/config.toml` (Codex, nur wenn `.codex/` existiert), `.vscode/mcp.json` (VS Code), `.github/mcp.json` (Copilot CLI), `.cursor/mcp.json` (Cursor) |
| Paket-Cache | `apm_modules/software-architects/timecockpit-agents/` (in `.gitignore`) |
| Lock-Datei | `apm.lock.yaml` (committen) |
| Benutzerweit statt pro Projekt | `apm install -g …` → `~/.apm/`, Skills nach `~/.claude/skills/` oder `~/.agents/skills/`, MCP nach `~/.claude.json` / `~/.codex/config.toml` |

> [!NOTE]
> Der von APM geschriebene MCP-Eintrag enthält **keine Client-ID** (und keinen Mandanten) – das Paket kann sie nicht kennen. Ergänzen Sie nach `apm install` die Client-ID in der jeweiligen Client-Konfiguration ([Claude Code](~/doc/mcp/claude-code.md), [Codex](~/doc/mcp/codex.md), [VS Code](~/doc/mcp/vscode.md)), oder registrieren Sie den Server einmal per CLI mit `--client-id` / `--oauth-client-id` neu. Starten Sie den Client danach neu, damit er Skills und Server übernimmt.

## Aktualisieren und entfernen

```powershell
apm update --dry-run     # shows available new versions
apm update --yes         # updates according to apm.yml constraints
apm deps list            # installed packages and primitives
apm uninstall software-architects/timecockpit-agents
```

Ohne Pin (`#v0.1.7`) folgt das Paket dem Standard-Branch und erhält Updates beim nächsten `apm install` / `apm update`. Für Kundenprojekte wird empfohlen, auf ein Release-Tag zu pinnen.

## Weitere Installationswege

- **Claude-Code-Plugin-Marketplace:** Das Repository ist auch ein Claude-Code-Marketplace (`.claude-plugin/marketplace.json`). Installieren Sie mit `/plugin marketplace add software-architects/timecockpit-agents` und `/plugin install`. Dieser Weg installiert auch die Agents.
- **ChatGPT (Business/Enterprise):** Ein Workspace-Administrator importiert das Repository als Marketplace (Quelle `https://github.com/software-architects/timecockpit-agents`, Release-Tag). Der MCP-Server muss einmal als eigene MCP-App im Workspace registriert werden – siehe [ChatGPT](~/doc/mcp/chatgpt.md).
- **Manuell:** Kopieren Sie die Ordner `skills/` und `agents/` nach `.claude/`, `.agents/` oder `.github/` Ihres Projekts.

## Verwandte Seiten

- [Überblick über den MCP-Server](~/doc/mcp/ueberblick.md)
- [Verbindung prüfen](~/doc/mcp/verbindung-pruefen.md)
- [Anwendungsfälle und Prompts](~/doc/ki-assistenten/anwendungsfaelle-und-prompts.md)
- [Dokumentation zu Microsoft APM](https://microsoft.github.io/apm/)
