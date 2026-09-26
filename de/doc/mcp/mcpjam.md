---
title: MCP-Server - Test mit MCPJam Inspector
description: "Den MCP-Server von time cockpit vor der Integration eines KI-Clients mit MCPJam Inspector verbinden: OAuth und Sandbox-Header, lesende Tests."
en_page: doc/mcp/mcpjam.md
---
# Den MCP-Server mit MCPJam Inspector testen

> [!WARNING]
> Im Aufbau: Der MCP-Server von time cockpit und diese Dokumentation werden aktiv weiterentwickelt, inkompatible Änderungen sind möglich. Tools können umbenannt, geändert oder entfernt werden, und Dialogbeschriftungen sowie Konfigurationsschritte können sich ohne Ankündigung ändern. Prüfen Sie diese Seite auf Aktualisierungen, bevor Sie die Einrichtung für Ihre Benutzer ausrollen, und rechnen Sie damit, Ihre Konfiguration, Skills und Prompts nach einem Update anpassen zu müssen.

[MCPJam Inspector](https://github.com/MCPJam/inspector) eignet sich, um die MCP-Verbindung zu time cockpit zu prüfen, bevor Sie einen KI-Assistenten konfigurieren. Die folgenden Schritte verwenden den produktiven Remote-MCP-Server und leiten die Anfragen an eine Test-Sandbox von time cockpit weiter.

> [!NOTE]
> Ein normaler Benutzer muss keine Mandanten-ID eingeben. Der Server ermittelt den time cockpit Mandanten aus der Microsoft-Entra-Anmeldung, wenn einem Entra-Mandanten genau ein time cockpit Mandant zugeordnet ist. Fügen Sie `X-tc-tenant-id` nur hinzu, wenn Ihnen der time cockpit Support oder Ihr Administrator mitgeteilt hat, dass Ihrem Entra-Mandanten mehrere time cockpit Mandanten zugeordnet sind.

## Server hinzufügen

1. Öffnen Sie MCPJam Inspector und wählen Sie **Connect**.
2. Wählen Sie **Add Server**.
3. Geben Sie die folgenden Verbindungswerte ein:

   | Feld | Wert |
   |-------|-------|
   | Server Name | `Time Cockpit MCP` |
   | Connection Type | `HTTP` |
   | Server URL | `https://mcp.timecockpit.com` |
   | Authentication | `Auto` |

4. Klappen Sie **Advanced Settings** auf.
5. Setzen Sie **Registration Strategy** auf **Preregistration (Client Credentials)**.
6. Geben Sie die vorregistrierte Client-ID des MCP-Servers von time cockpit ein. Lassen Sie **Client Secret** leer; der Client ist öffentlich.
7. Klappen Sie **Connection overrides** auf und fügen Sie die Header aus dem nächsten Abschnitt hinzu.
8. Wählen Sie **Add Server**. Wenn MCPJam Sie auffordert, den Server zu autorisieren, wählen Sie **Continue** und melden Sie sich mit dem Microsoft-Entra-Geschäftskonto an, das Sie für time cockpit verwenden.

Die automatische OAuth-Erkennung kann mit der Meldung `Automatic OAuth could not find a usable CIMD or DCR flow` fehlschlagen. Das ist bei einem Server mit vorregistriertem Client zu erwarten. Wenn Sie **Preregistration (Client Credentials)** wählen und die Client-ID eingeben, ist das Problem behoben.

## Screenshots der Konfiguration

Die folgenden Screenshots zeigen, wo Server-URL, OAuth-Registrierungsstrategie, Client-ID und Verbindungs-Header eingegeben werden. Gespeicherte Header-Werte sind absichtlich maskiert, und der OAuth-Screenshot verwendet einen Platzhalter statt der öffentlichen Client-ID.

![OAuth- und Serververbindungseinstellungen in MCPJam](/doc/mcp/images/mcpjam-oauth-setup.png)

![Connection overrides und Sandbox-Header in MCPJam](/doc/mcp/images/mcpjam-headers-setup.png)

## Screenshots der Tools

Diese bereinigten Beispiele zeigen die lesenden Prüfungen, nachdem die Verbindung hergestellt ist. Sie enthalten keine Kundendatensätze, Benutzerkennungen, Zugriffstokens oder Mandanten-GUIDs.

![Ergebnis des Tools ping in MCPJam](/doc/mcp/images/mcpjam-tool-ping.png)

![Ergebnis des Tools describe_entity in MCPJam](/doc/mcp/images/mcpjam-tool-describe-entity.png)

![Ergebnis von get_timesheets in MCPJam ohne zurückgegebene Zeilen](/doc/mcp/images/mcpjam-tool-get-timesheets-empty.png)

## Sandbox- und Mandanten-Header konfigurieren

Für einen sicheren Test vor der Integration fügen Sie diesen Header hinzu:

| Header | Wert | Zweck |
|--------|-------|---------|
| `X-sandbox-environment` | `test` | Leitet die Anfrage an die Test-Sandbox des Mandanten statt an die Produktivumgebung. |

Fügen Sie den Mandanten-Header nur hinzu, wenn er für das Mandanten-Routing erforderlich ist:

| Header | Wert | Zweck |
|--------|-------|---------|
| `X-tc-tenant-id` | `<tenant-id>` | Wählt einen bestimmten time cockpit Mandanten aus, wenn dem Entra-Mandanten mehr als ein time cockpit Mandant zugeordnet ist. |

Die beiden Header für einen Sandbox-Test mit mehreren Mandanten sehen daher so aus:

```text
X-sandbox-environment: test
X-tc-tenant-id: <tenant-id>
```

Konfigurieren Sie dieselbe Einstellung nicht gleichzeitig als Header und als URL-Segment. Der Server lehnt diese Kombination ab. Die Alternative mit URL-Segmenten finden Sie unter [Verbindungseinstellungen](~/doc/mcp/ueberblick.md#verbindungseinstellungen-header-oder-url-segment).

Wenn Sie MCPJam-Screenshots weitergeben, lassen Sie gespeicherte Header-Werte maskiert. Zeigen Sie in einem Screenshot niemals die Mandanten-ID, das Zugriffstoken, die Benutzer-ID oder zurückgegebene Geschäftsdaten. Die Header-Namen und die Platzhalterwerte in dieser Anleitung reichen aus, um die Einrichtung zu dokumentieren.

## Verbindung prüfen

Sobald MCPJam **Connected** anzeigt, wählen Sie **Tools**. Der Remote-Server stellt Diagnose-Tools und lesende Daten-Tools bereit. Führen Sie diese Tests in der angegebenen Reihenfolge aus:

### 1. `ping`

Wählen Sie `ping` und dann **Run**. Die Antwort sollte `pong` enthalten. Damit ist bestätigt, dass MCPJam eine authentifizierte Anfrage an den Server senden kann.

### 2. `entra_whoami`

Führen Sie `entra_whoami` aus, um das Routing zu prüfen. Kontrollieren Sie, dass die Antwort den erwarteten time cockpit Mandanten meldet und:

- `SandboxEnvironment` den Wert `test` hat.
- `TcTenantId` dem für den Test ausgewählten Mandanten entspricht.
- `Scope` und `Access` die für die Verbindung erwarteten Werte haben.

Dieses Diagnose-Tool ändert keine Daten und vergibt keine Berechtigungen.

### 3. `get_entities`

Führen Sie `get_entities` ohne Parameter aus, oder setzen Sie `nameContains` auf `timesheet`, um die Antwort klein zu halten. Damit ist bestätigt, dass der MCP-Server das Datenmodell des verbundenen Mandanten lesen kann.

### 4. `describe_entity`

Setzen Sie `entityName` auf `APP_Project` oder `APP_Timesheet` und führen Sie das Tool aus. Verwenden Sie die zurückgegebenen Eigenschaftsnamen, wenn Sie später Abfragen erstellen; mandantenspezifische `USR_`-Eigenschaften existieren nicht zwingend in jedem Mandanten.

### 5. `get_timesheets`

Führen Sie eine enge, lesende Abfrage aus, bevor Sie einen umfassenderen Bericht versuchen. Zum Beispiel:

```json
{
  "from": "2026-09-01",
  "to": "2026-09-17",
  "fields": ["APP_BeginTime", "APP_EndTime", "APP_Project", "APP_Description"],
  "top": 10
}
```

Wenn Sie `userDetailId` weglassen, bleibt die Abfrage auf den angemeldeten Benutzer beschränkt. Ein leeres `rows`-Array ist ein gültiges Ergebnis, wenn im gewählten Zeitraum keine Buchungen vorhanden sind; es weist nicht auf einen Verbindungsfehler hin.

## Problembehebung

| Symptom | Prüfung |
|---------|-------|
| Automatisches OAuth findet weder CIMD noch DCR | Setzen Sie **Registration Strategy** auf **Preregistration (Client Credentials)** und geben Sie die vorregistrierte Client-ID ein. |
| Server ist verbunden, aber der Mandant ist falsch | Führen Sie `entra_whoami` aus; prüfen Sie den ermittelten Mandanten und die angeforderte `TcTenantId`. |
| Ergebnisse sind leer | Prüfen Sie den Datumsbereich und führen Sie `get_timesheets` ohne Projekt- oder Tätigkeitsfilter aus. |
| Schreibende Tools fehlen | Prüfen Sie, ob die Verbindung `access=readonly` verwendet; das blendet schreibende Tools absichtlich aus. |
| Die Sandbox wurde nicht ausgewählt | Prüfen Sie, ob `X-sandbox-environment: test` vorhanden ist und kein widersprüchliches URL-Segment konfiguriert ist. |

Verwenden Sie `create_object`, `update_object`, `delete_object` oder `create_timesheet` nicht als Verbindungstest. Diese Tools können Daten in time cockpit ändern und erfordern einen eigenen Bestätigungsablauf.

## Verwandte Seiten

- [Überblick über den MCP-Server](~/doc/mcp/ueberblick.md)
- [Verbindung prüfen](/doc/mcp/verify-connection.html)
- [Einrichtung in Entra ID](/doc/mcp/entra-id-setup.html)
- [Begleitende Skills und APM](/doc/mcp/companion-skills.html)
