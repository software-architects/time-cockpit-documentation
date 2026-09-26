---
title: MCP-Server - Lokaler MCP-Server in OnCockpit Admin
description: "Den lokalen MCP-Server von time cockpit in OnCockpit Admin über stdio betreiben, in Claude Code, VS Code oder Codex registrieren und Skripte nutzen."
en_page: doc/mcp/oncockpit-admin-local.md
---
# OnCockpit Admin: lokaler MCP-Server (stdio)

> [!WARNING]
> Im Aufbau: Der MCP-Server von time cockpit und diese Dokumentation werden aktiv weiterentwickelt, inkompatible Änderungen sind möglich. Tools können umbenannt, geändert oder entfernt werden, und Dialogbeschriftungen sowie Konfigurationsschritte können sich ohne Ankündigung ändern. Prüfen Sie diese Seite auf Aktualisierungen, bevor Sie die Einrichtung für Ihre Benutzer ausrollen, und rechnen Sie damit, Ihre Konfiguration, Skills und Prompts nach einem Update anpassen zu müssen.

Neben dem [Remote-MCP-Server](~/doc/mcp/ueberblick.md) liefert time cockpit einen **lokalen MCP-Server** in [OnCockpit Admin](~/doc/datenmodell-anpassung/ueberblick.md) aus, dem Windows-Werkzeug zur Anpassung von time cockpit. Mit `--mcp` gestartet, spricht OnCockpit Admin MCP über Standardein- und -ausgabe (stdio), statt seine Benutzeroberfläche anzuzeigen. Der KI-Client startet den Prozess selbst; kein OAuth, keine Server-URL.

Der lokale Server richtet sich an **Administratoren und Anpasser**, nicht an Endbenutzer, die Zeit buchen. Sein Unterscheidungsmerkmal ist die **Ausführung von IronPython-Skripten** gegen den Live-Datenkontext: Ein Assistent kann dieselben Skripte ausführen, die Sie sonst im Skripteditor von OnCockpit Admin oder über die Kommandozeile ausführen würden. Das ermöglicht Abläufe, die der Remote-Server bewusst nicht anbietet, etwa das Ändern des Datenmodells oder das Laden von Testdaten.

> [!WARNING]
> Skripte laufen mit den vollen Berechtigungen der Konfiguration, mit der Sie sich verbinden, und können das gesamte Modell und alle Daten ändern. Verwenden Sie für alles Experimentelle eine [Sandbox](~/doc/datenmodell-anpassung/ueberblick.md#sandboxes-testsysteme-in-time-cockpit) oder eine eigene Testkonfiguration.

## Remote oder lokal?

| | Remote-Server (`https://mcp.timecockpit.com`) | Lokaler Server (`OnCockpit.Admin.exe --mcp`) |
|---|---|---|
| Läuft | In der Cloud, pro Benutzer über Entra ID | Auf Ihrem Windows-PC, als Kindprozess des KI-Clients |
| Anmeldung | OAuth 2.1 mit Microsoft Entra ID | Die OnCockpit-Admin-**Konfiguration** (`-c <name>`), die Sie bereits verwenden |
| Clients | Jeder MCP-Client mit HTTP-Transport, einschließlich Claude App, Copilot, ChatGPT | Clients, die stdio-Server starten können: Claude Code, VS Code, Codex, Claude Desktop, Cursor, Copilot CLI |
| Datenzugriff | Typisierte Tools, TCQL-Abfragen, Listen, Objekt-CRUD | TCQL-Abfragen, Listen sowie **beliebige IronPython-Skripte** |
| Änderungen am Datenmodell | Nicht möglich | Möglich per Skript (`DataModel.py`-Migrationen) |
| Typische Verwendung | Zeit buchen, Berichte, alltägliche Fragen | Anpassung, Migrationen, Testdaten, automatisierte Tests, komplexe einmalige Analysen |

Beide Server können unter unterschiedlichen Namen nebeneinander registriert werden.

## Voraussetzungen

- Windows. OnCockpit Admin ist eine Windows-Desktopanwendung; der lokale MCP-Server ist unter macOS oder Linux nicht verfügbar.
- **OnCockpit Admin aus dem Dev-Feed.** Der MCP-Modus ist derzeit nur im Dev-Kanal enthalten. Laden Sie das Installationsprogramm von `https://update-admin.on-cockpit.com/dev/Setup.exe` herunter und führen Sie es aus. Die Anwendung aktualisiert sich danach aus demselben Feed; den aktiven Feed sehen Sie in den Optionen unter **Statistik** (Zeile **Update Feed**).
- Eine funktionierende **Konfiguration** in OnCockpit Admin. Starten Sie OnCockpit Admin einmal, legen Sie im Startdialog über **Neu konfigurieren** eine Konfiguration an und melden Sie sich an. Für eine Sandbox verwenden Sie das Benutzernamensmuster `test/your.email@example.com` (siehe [Zugriff auf die Sandbox](~/doc/datenmodell-anpassung/ueberblick.md#zugriff-auf-die-sandbox-ohne-microsoft-entra-aad)).
- Ein MCP-Client, der stdio-Server unterstützt.

> [!NOTE]
> Das Installationsprogramm legt unter `%LOCALAPPDATA%\OnCockpitAdmin\OnCockpit.Admin.exe` einen versionsunabhängigen Launcher ab. Er leitet alle Argumente an die aktuell installierte Version weiter; verwenden Sie daher diesen Pfad in Ihrer Client-Konfiguration. Die versionierten Ordner darunter (`app-<version>\`) ändern sich mit jedem Update.

## Startbefehl

```powershell
%LOCALAPPDATA%\OnCockpitAdmin\OnCockpit.Admin.exe --mcp [-c <configuration>]
```

| Option | Bedeutung |
|--------|---------|
| `--mcp` | Als MCP-Server über stdio laufen, statt die Benutzeroberfläche zu starten. |
| `-c <configuration>` | Optional. Name der OnCockpit-Admin-Konfiguration (Mandant, Sandbox und Benutzer sind Teil der Konfiguration). Ohne diese Option öffnet sich beim Start des Servers durch den Client der Dialog zur Konfigurationsauswahl, in dem Sie die Konfiguration wählen. Übergeben Sie den Namen, um ohne Dialog zu starten, etwa in gemeinsam genutzten Teamkonfigurationen. |
| `--mcp-access Default\|ReadOnly` | Optional, Standard `Default`. `ReadOnly` blendet jedes Tool aus, das Daten ändert, einschließlich der Skript-Tools. |
| `--mcp-scope Default\|OwnData` | Optional, Standard `Default`. `OwnData` blendet jedes Tool aus, dessen Ergebnis sich nicht auf den angemeldeten Benutzer einschränken lässt. |
| `--mcp-confirmation Required\|Disabled` | Optional, Standard `Required`. Legt fest, ob die generischen Objekt-Tools (`create_object`, `update_object`, `delete_object`) den Bestätigungsablauf mit `confirmed=true` benötigen. Nur eine Betreibereinstellung; es gibt keine Übersteuerung pro Anfrage. |

Zugriff und Umfang haben dieselbe Bedeutung wie die Verbindungseinstellungen des Remote-Servers; Mandant, Sandbox und Profil sind keine eigenen Optionen, weil sie aus der Konfiguration stammen. Siehe [Zugriff, Umfang und Bestätigung](~/doc/mcp/zugriff-umfang-und-bestaetigung.md).

`--mcp` kann nicht mit `-f`/`--file`, `--action` oder `--no-data-context` kombiniert werden. Die Standardausgabe ist für das MCP-Protokoll reserviert; Diagnosen und Fehler gehen an die Standardfehlerausgabe, die die meisten Clients in ihrem MCP-Log anzeigen. Wenn der Datenkontext nicht geöffnet werden kann (falscher Konfigurationsname, abgelaufenes Passwort), endet der Prozess mit einer Fehlermeldung auf der Standardfehlerausgabe statt mit einem Dialog.

Normalerweise führen Sie diesen Befehl nicht von Hand aus. Der Client startet den Prozess, wenn er den Server benötigt, und beendet ihn, wenn die Sitzung endet.

## Server registrieren

Die Beispiele verwenden eine Konfiguration namens `test`. Ersetzen Sie `<you>` durch Ihren Windows-Benutzernamen, wo ein vollständiger Pfad erforderlich ist; Umgebungsvariablen wie `%LOCALAPPDATA%` werden in JSON-Dateien nicht aufgelöst.

### Claude Code

```powershell
claude mcp add timecockpit-local --scope user -- "C:\Users\<you>\AppData\Local\OnCockpitAdmin\OnCockpit.Admin.exe" -c test --mcp
```

Oder in der `.mcp.json` eines Projekts, damit das ganze Team den Server erhält. Verwenden Sie für den Pfad eine Umgebungsvariable, wenn Teammitglieder unterschiedliche Benutzernamen haben:

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

Setzen Sie `OnCockpitAdminBinary` als Benutzer-Umgebungsvariable auf `C:\Users\<you>\AppData\Local\OnCockpitAdmin\OnCockpit.Admin.exe` und starten Sie dann das Terminal neu. `claude mcp list` sollte den Server als verbunden melden; `/mcp` in einer Sitzung zeigt seine Tools.

### Visual Studio Code (Copilot-Agent-Modus)

`.vscode/mcp.json` im Projekt oder die `mcp.json` auf Benutzerebene:

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

VS Code zeigt den Server im Bereich **MCP Servers** von Copilot Chat mit **Start**/**Stop** an. Tools erscheinen als `mcp_timecockpit-local_<tool>`.

### OpenAI Codex

```powershell
codex mcp add timecockpit-local -- "C:\Users\<you>\AppData\Local\OnCockpitAdmin\OnCockpit.Admin.exe" -c test --mcp
```

Das schreibt einen Eintrag `[mcp_servers.timecockpit-local]` mit `command` und `args` in `%USERPROFILE%\.codex\config.toml`.

### Claude Desktop

Claude Desktop startet stdio-Server aus `%APPDATA%\Claude\claude_desktop_config.json`:

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

## Prüfen

Bitten Sie den Assistenten, `ping` aufzurufen und anschließend die Ressource `timecockpit://currentUser` zu lesen (oder `get_resource` mit dieser URI). Das Ergebnis muss den erwarteten Benutzer der Konfiguration in der erwarteten Sandbox zeigen. Ein Prompt wie *„Rufe ping auf dem lokalen time cockpit Server auf und zeige mir dann, mit welchem Benutzer und Mandanten ich verbunden bin“* funktioniert in jedem Client.

Wenn der Server nicht startet:

- Suchen Sie im MCP-Log des Clients nach der Meldung aus der Standardfehlerausgabe. `Could not get a data context` bedeutet, dass der Konfigurationsname falsch ist oder die gespeicherte Anmeldung nicht mehr funktioniert. Starten Sie OnCockpit Admin normal, öffnen Sie die Konfiguration, melden Sie sich an und versuchen Sie es erneut.
- Stellen Sie sicher, dass der Pfad auf den Launcher in `%LOCALAPPDATA%\OnCockpitAdmin\` zeigt, nicht auf einen entfernten Ordner `app-<version>`.
- Pro Konfiguration sollte immer nur eine MCP-Sitzung gleichzeitig laufen. Modelländerungen sind nicht durch optimistisches Sperren geschützt; zwei Skripte, die gleichzeitig das Modell desselben Mandanten schreiben, überschreiben einander stillschweigend.

## Tools

Der lokale Server bietet dieselben gemeinsamen Tools wie der Remote-Server, mit denselben Namen, Parametern und Ergebnisstrukturen, plus einige nur lokal verfügbare Tools. Die Präfixe der Clients unterscheiden sich (`timecockpit-local__ping`, `mcp_timecockpit-local_ping`). Welche Tools Sie sehen, hängt von `--mcp-access` und `--mcp-scope` sowie von Ihren Berechtigungen in time cockpit ab; siehe [Zugriff, Umfang und Bestätigung](~/doc/mcp/zugriff-umfang-und-bestaetigung.md).

| Tool | Ändert Daten | Ausgeblendet mit `OwnData` | Zweck |
|------|--------------|----------------------|---------|
| `ping` | nein | | Prüft, ob der Server erreichbar und der Datenkontext geöffnet ist. |
| `get_environment` | nein | | Der angemeldete Benutzer, die globalen Einstellungen des Mandanten und die ausgewerteten Named Sets. |
| `get_named_set` | nein | | Ein ausgewertetes Named Set vollständig, mit einer höheren Zeilengrenze als `get_environment`. |
| `get_current_user` | nein | | Der vollständige Datensatz des angemeldeten Benutzers. |
| `get_timesheets` | nein | | Zeitbuchungen mit typisierten Filtern lesen (Datumsbereich, Projekt- oder Tätigkeitscode, Beschreibung, Benutzer). |
| `create_timesheet` | **ja** | | Eine Zeitbuchung anlegen. |
| `create_timesheet_suggestion` | **ja** | ja | **Nur lokal.** Eine bestehende Zeitbuchung anderen Benutzern als Buchungsvorschlag anbieten. Benötigt `confirmed=true`. |
| `get_entities` | nein | | Die Entitäten des Datenmodells des Mandanten auflisten. Systementitäten sind ausgeblendet. |
| `describe_entity` | nein | | Vollständige Metadaten einer Entität: Eigenschaften, Typen, Beziehungen. |
| `get_lists` | nein | | Die für den Benutzer verfügbaren benannten Listen auflisten. |
| `describe_list` | nein | | Parameter und Ergebnisspalten einer benannten Liste. |
| `execute_list` | nein | ja | Eine benannte Liste ausführen, optional mit einer zusätzlichen TCQL-Bedingung. Bevorzugen Sie eine vorhandene Liste gegenüber einer selbst geschriebenen Abfrage, wenn eine passt. |
| `execute_tcql_query` | nein | ja | Eine begrenzte, lesende TCQL-Abfrage mit optionalen benannten Parametern (`@Name`) ausführen. |
| `create_object`, `update_object`, `delete_object` | **ja** | ja | Ein Objekt einer sichtbaren Entität anlegen, ändern oder löschen. Benötigen `confirmed=true`. |
| `get_resource` | nein | | **Nur lokal.** Eine der unten aufgeführten Ressourcen lesen, für Clients, die MCP-Ressourcen nicht nativ unterstützen. |
| `execute_script_literal` | **ja** | ja | **Nur lokal.** Inline-IronPython-2.7-Quellcode gegen den Live-Datenkontext ausführen. Mit `print` geschriebene Ausgaben werden als Ergebnis zurückgegeben. Das Skript sieht den Datenkontext als globales Objekt `Context`. |
| `execute_script_file` | **ja** | ja | **Nur lokal.** Eine vorhandene `.py`-Datei von der lokalen Festplatte ausführen. Verwenden Sie das für größere Skripte wie `DataModel.py`-Migrationen, die weitere Dateien relativ zu ihrem eigenen Speicherort lesen. Ein Betreiber kann die erlaubten Ordner einschränken. |

Alles, was als datenändernd gekennzeichnet ist, wird mit `--mcp-access ReadOnly` ausgeblendet. `entra_whoami` gibt es nur auf dem Remote-Server. Die Skript-Tools erfordern keine Bestätigung; der Bestätigungsablauf gilt für die generischen Objekt-Tools und `create_timesheet_suggestion`. Modellaktionen werden nicht als Tools bereitgestellt; führen Sie sie in der Oberfläche von time cockpit aus. Lesezugriffe sind in der Zeilenzahl begrenzt und melden `truncated`; siehe [Grenzen und Kürzung](~/doc/mcp/grenzen-und-kuerzung.md).

Die Serveranweisungen fordern den Assistenten auf, eine TCQL-Abfrage oder eine Liste zu bevorzugen, wann immer sich die Aufgabe so ausdrücken lässt, und Skripte nur für das zu verwenden, was Abfragen nicht leisten können. Sobald ein Skript gestartet ist, kann es vom Client aus nicht unterbrochen werden.

> [!NOTE]
> Ältere OnCockpit-Admin-Builds im Dev-Feed stellen eine kleinere, anders benannte Tool-Menge bereit (`tcql_query` statt `execute_tcql_query`, kein `get_entities`, keine `--mcp-*`-Optionen). Aktualisieren Sie OnCockpit Admin, wenn die hier aufgeführten Tools fehlen.

## Ressourcen

Der Server veröffentlicht das Modell des verbundenen Mandanten als MCP-Ressourcen. Clients mit nativer Ressourcenunterstützung zeigen sie unter **Resources** an; andere verwenden `get_resource`.

| URI | Inhalt |
|-----|---------|
| `timecockpit://ServerInstructions.md` | Wie der Assistent mit time cockpit arbeiten soll: Vorrang der Tools, TCQL-Referenz. Zuerst lesen. |
| `timecockpit://datamodel` | Kompakter Index des Live-Datenmodells: Entitäten mit Eigenschaften und Beziehungen, Listen mit Spalten, Aktionen mit Berechtigungen, Zusammenfassungen von Triggern und Validierungen. Quellcode wird weggelassen, um den Index klein zu halten. |
| `timecockpit://datamodel/lists/{listName}` | Vollständige Details einer Liste einschließlich TCQL-Abfrage oder Skriptquelle, Spalten und Bearbeitungseinstellungen. |
| `timecockpit://datamodel/actions/{actionName}` | Vollständige Details einer Aktion einschließlich ihres IronPython-Quellcodes. Nur lesbare Modellmetadaten: Die Aktion kann nicht über MCP ausgeführt werden. |
| `timecockpit://datamodel/entities/{entityName}/triggers/{triggerName}` | Vollständige Details eines Triggers einschließlich seines IronPython-Quellcodes. |
| `timecockpit://currentUser` | Der angemeldete Benutzer (`APP_UserDetail`). |
| `timecockpit://globalSettings` | Die globalen Einstellungen des Mandanten (`APP_GlobalSettings`). |

Da das Modell kundenspezifisch ist, sorgen diese Ressourcen dafür, dass generiertes TCQL und generierte Skripte zu Ihrem Mandanten passen: `USR_`-Entitäten, eigene Eigenschaften und Listen sind dort alle sichtbar.

## Was Sie mit Skripten tun können

Der lokale Server macht den Assistenten zu einem Scripting-Partner für OnCockpit Admin. Typische Muster, alle nur unter Windows und alle gegen den Mandanten der gewählten Konfiguration:

**Komplexe Analysen über eine einzelne Abfrage hinaus.** Wenn eine Frage mehrere Abfragen, Gruppierung im Code oder Zugriff auf Modellmetadaten (Berechtigungen, Trigger, Validierungsregeln) erfordert, schreibt der Assistent ein IronPython-Skript, führt es mit `execute_script_literal` aus und arbeitet mit der gedruckten Ausgabe weiter. Das Objekt `Context` bietet `Select`, `SelectWithParams`, das Modell (`Context.Model.Entities`, `.Actions`, `.ModelEntityViews`) und die vollständige Scripting-API, die unter [Scripting](~/doc/scripting/ueberblick.md) beschrieben ist.

**Von der Spezifikation zum Datenmodell.** Beschreiben Sie eine Funktion in Prosa. Mit den [begleitenden Skills](~/doc/mcp/begleitende-skills.md) für die Anpassung des Datenmodells liest der Assistent das Live-Modell, erzeugt eine `DataModel.py`-Migration (Entitäten, Eigenschaften, Beziehungen, Listen, Formulare, Trigger, Aktionen), validiert sie in einer Transaktion, die immer zurückgerollt wird, und stellt sie erst dann mit `execute_script_file` bereit. Anschließend prüft er das Ergebnis, indem er `timecockpit://datamodel` erneut liest.

**Testdaten.** Ein zweites Skript befüllt die neuen Entitäten mit Beispieldatensätzen. Da derselbe Server liest und schreibt, bleibt der Kreislauf *Modell bereitstellen, Testdaten laden, prüfen, anpassen, wiederholen* innerhalb einer Sitzung.

**End-to-End-Prüfungen im Web-Client.** Kombinieren Sie den lokalen Server mit einem Browser-Tool Ihres Clients (zum Beispiel einer Chrome-Browsersteuerung in Codex oder Claude Code). Der Assistent stellt eine Modelländerung bereit, lädt Testdaten über den lokalen Server, öffnet dann den Web-Client von time cockpit im Browser, probiert die neue Liste oder das neue Formular aus und lässt das Gesehene in die nächste Iteration einfließen.

**Strukturierte Tests in IronPython.** Skripte können auch als Tests dienen: Datensätze anlegen, eine Aktion oder einen Trigger ausführen, mit TCQL prüfen, eine Zusammenfassung mit bestanden/fehlgeschlagen ausgeben und die Transaktion zurückrollen. Wenn Sie diese Skripte in Ihrem Anpassungs-Repository ablegen und mit `execute_script_file` ausführen, erhalten Sie wiederholbare Regressionsprüfungen für einen Mandanten.

Empfohlene Schutzmaßnahmen für all diese Muster:

- Richten Sie die Konfiguration auf eine **Sandbox** oder einen Testmandanten aus. Stellen Sie in der Produktivumgebung nur aus einem geprüften Skript bereit.
- Validieren Sie Migrationen mit einem Lauf, der nur zurückrollt, bevor Sie sie festschreiben.
- Führen Sie nie zwei modellschreibende Skripte gleichzeitig gegen denselben Mandanten aus.
- Bitten Sie den Assistenten, ein Skript zu zeigen, bevor er etwas Schreibendes ausführt.

## Begleitende Skills

Das unter [Begleitende Skills](~/doc/mcp/begleitende-skills.md) beschriebene Paket [timecockpit-agents](https://github.com/software-architects/timecockpit-agents) deckt auch den lokalen Server ab: `timecockpit-mcp-setup` hilft bei der stdio-Registrierung und bei der Diagnose eines Servers, der nicht startet, `timecockpit-tcql` und `timecockpit-model-discovery` gelten unverändert. Skills für Datenmodellmigrationen, Skriptausführungsschleifen und Funktionstests, die auf `execute_script_literal` und `execute_script_file` aufbauen, werden im selben Repository veröffentlicht.

## Verwandte Seiten

- [Überblick über den MCP-Server](~/doc/mcp/ueberblick.md) und die Seiten zu den Remote-Clients
- [Begleitende Skills und APM](~/doc/mcp/begleitende-skills.md)
- [Anpassung des Datenmodells](~/doc/datenmodell-anpassung/ueberblick.md) und [Sandbox](~/doc/datenmodell-anpassung/ueberblick.md#sandboxes-testsysteme-in-time-cockpit)
- [Scripting](~/doc/scripting/ueberblick.md) und [TCQL](~/doc/tcql/ueberblick.md)
