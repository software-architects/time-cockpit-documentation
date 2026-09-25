---
title: MCP-Server - Einrichtung in Cursor
description: "Den MCP-Server von time cockpit in Cursor (Editor und CLI) per mcp.json mit statischer OAuth-Client-ID einrichten, mit Entra ID anmelden, Fehler beheben."
en_page: doc/mcp/cursor.md
---
# Cursor (Editor und CLI)

> [!WARNING]
> Vorläufige Dokumentation: Der MCP-Server von time cockpit und diese Dokumentation werden aktiv weiterentwickelt. Tool-Namen, Dialogbeschriftungen und Konfigurationsschritte können sich ohne Ankündigung ändern. Prüfen Sie diese Seite auf Aktualisierungen, bevor Sie die Einrichtung für Ihre Benutzer ausrollen.

> [!WARNING]
> Nicht getestet: Diese Seite basiert auf der [MCP-Dokumentation von Cursor](https://cursor.com/docs/context/mcp) und wurde **noch nicht** gegen den MCP-Server von time cockpit verifiziert. Konfigurationsschlüssel, Redirect-URIs und das Anmeldeverhalten können in der Praxis abweichen. Bis ein Test erfolgreich ist, betrachten Sie Cursor als *in Evaluierung* und verwenden Sie für den produktiven Einsatz bevorzugt einen [getesteten Client](~/doc/mcp/ueberblick.md#welcher-client-welche-konfiguration) wie [Visual Studio Code](~/doc/mcp/vscode.md) oder [Claude Code](~/doc/mcp/claude-code.md).

Cursor liest MCP-Server aus `mcp.json` – entweder im Projekt (`.cursor/mcp.json`, über das Repository teilbar) oder global in Ihrem Benutzerprofil (`%USERPROFILE%\.cursor\mcp.json`). Die Cursor-CLI (`agent`) verwendet dieselben Dateien. Da der MCP-Server von time cockpit keine Dynamic Client Registration unterstützt, konfigurieren Sie die Client-ID Ihrer App-Registrierung statisch im Objekt `auth`.

## mcp.json

Beispiel für `%USERPROFILE%\.cursor\mcp.json` (oder `.cursor/mcp.json` im Projekt):

```json
{
  "mcpServers": {
    "timecockpit": {
      "url": "https://mcp.timecockpit.com",
      "headers": { "X-tc-tenant-id": "<tenant-id>" },
      "auth": {
        "CLIENT_ID": "<client-id>"
      }
    }
  }
}
```

- `url` – Streamable-HTTP-Endpunkt (erforderlich). Um [Verbindungseinstellungen](~/doc/mcp/ueberblick.md#verbindungseinstellungen-header-oder-url-segment) wie `access` oder `scope` zu übergeben, verwenden Sie entweder Header oder URL-Segmente, z. B. `https://mcp.timecockpit.com/access/readonly/scope/owndata`.
- `headers` – statische Header, die mit jeder Anfrage gesendet werden. Lassen Sie `X-tc-tenant-id` weg, wenn Ihr Entra-Mandant genau einem time cockpit Mandanten zugeordnet ist. Setzen Sie keinen eigenen `Authorization`-Header – darum kümmert sich OAuth.
- `auth.CLIENT_ID` – Client-ID der App-Registrierung aus [Einrichtung in Entra ID](~/doc/mcp/entra-id-einrichtung.md) (erforderlich).
- `auth.CLIENT_SECRET` – nicht nötig; die Desktop-App ist ein Public Client mit PKCE. Speichern Sie keine Secrets in einer geteilten `.cursor/mcp.json`.
- `auth.scopes` – optional. Der Server gibt seinen Scope über die Protected-Resource-Metadaten bekannt. Setzen Sie ihn nur explizit, wenn die Anmeldung ohne ihn fehlschlägt: `"scopes": ["https://mcp.timecockpit.com/mcp.access"]`.

Werte können mit `${env:NAME}` in `url` und `headers` aus Umgebungsvariablen übernommen werden, zum Beispiel `"X-tc-tenant-id": "${env:TC_TENANT_ID}"`. So bleiben mandantenspezifische Werte aus einer geteilten Projektdatei heraus.

## Redirect-URI

Cursor verwendet feste Callback-URLs, die nicht von der Server-URL abhängen. Tragen Sie sie in Ihrer App-Registrierung ein:

| Oberfläche | Redirect-URI | Plattformtyp in Entra |
|---------|--------------|------------------------|
| Cursor-Desktop-App (und CLI) | `http://localhost:8787/callback` | Mobile and desktop |
| Cursor Web / Cloud Agents | `https://www.cursor.com/agents/mcp/oauth/callback` | Web – nicht getestet; würde vermutlich einen Confidential Client erfordern |

Siehe [Redirect-URIs pro Client](~/doc/mcp/entra-id-einrichtung.md#redirect-uris-pro-client). Port `8787` ist fest, daher blockiert ein anderer Prozess, der diesen Port belegt, die Anmeldung.

## Authentifizierung

Öffnen Sie nach dem Speichern der `mcp.json` in der Seitenleiste von Cursor **Customize** (je nach Version: **Cursor Settings → Tools & MCP**). Der Server `timecockpit` erscheint in der Liste; benötigt er eine Anmeldung, bietet Cursor eine Aktion **Login** / **Connect** an, die den Browser für die Anmeldung bei Microsoft Entra ID öffnet. Melden Sie sich mit dem Konto an, das Sie für time cockpit verwenden.

Mit der Cursor-CLI:

```powershell
agent mcp list
agent mcp login timecockpit
agent mcp list-tools timecockpit
```

| Befehl | Zweck |
|---------|---------|
| `agent mcp list` | Konfigurierte Server und Verbindungsstatus |
| `agent mcp login <name>` | OAuth-Anmeldung starten |
| `agent mcp list-tools <name>` | Tools, die ein Server anbietet |
| `agent mcp enable <name>` / `agent mcp disable <name>` | Server aktivieren / deaktivieren |

## Prüfen

Stellen Sie im Chat von Cursor (Agent Mode) sicher, dass der Server `timecockpit` aktiviert ist, und stellen Sie eine Frage, zum Beispiel *An welchen Projekten habe ich laut time cockpit diese Woche gearbeitet?* Cursor fragt standardmäßig nach einer Freigabe, bevor ein MCP-Tool ausgeführt wird. Folgen Sie danach [Verbindung prüfen](~/doc/mcp/verbindung-pruefen.md).

## Installationslink

Für interne Portale unterstützt Cursor Deep Links der Form `cursor://anysphere.cursor-deeplink/mcp/install?name=timecockpit&config=<base64 JSON>`, wobei das JSON der Servereintrag ohne Namen ist, z. B. `{"url":"https://mcp.timecockpit.com","auth":{"CLIENT_ID":"<client-id>"}}`.

## Fehlerbehebung

MCP-Protokolle: **Output panel** (STRG+UMSCHALT+U) → in der Dropdown-Liste **MCP Logs** auswählen. Sie zeigen Verbindungsfehler, Authentifizierungsprobleme und Tool-Aufrufe.

| Meldung / Symptom | Ursache / Lösung |
|-------------------|------------------|
| Anmeldung schlägt mit einem Fehler bei der Client-Registrierung fehl | `auth.CLIENT_ID` fehlt; Cursor greift auf Dynamic Client Registration zurück, die der MCP-Server von time cockpit nicht unterstützt. |
| `AADSTS50011: redirect URI … does not match` | `http://localhost:8787/callback` ist in Ihrer App-Registrierung nicht eingetragen oder als *Web* statt als *Mobile and desktop* eingetragen. |
| `AADSTS7000218` / *client secret required* | Die App-Registrierung wird als Confidential Client behandelt. Setzen Sie **Allow public client flows** auf *Yes*, siehe [Einrichtung in Entra ID](~/doc/mcp/entra-id-einrichtung.md). |
| `AADSTS9010010` / `invalid_target` | Entra lehnt den `resource`-Parameter oder den angeforderten Scope ab. Setzen Sie `auth.scopes` explizit auf `["https://mcp.timecockpit.com/mcp.access"]`. Wenden Sie sich an den Support, wenn der Fehler bestehen bleibt. |
| Anmeldung wird nicht abgeschlossen | Port `8787` wird von einem anderen Prozess belegt. Beenden Sie ihn und versuchen Sie es erneut. |
| Server wird im Chat nicht angezeigt | Der Server ist in **Customize** deaktiviert, oder `mcp.json` enthält einen JSON-Fehler (siehe MCP Logs). |

## Verwandte Seiten

- [Überblick über den MCP-Server](~/doc/mcp/ueberblick.md)
- [Einrichtung in Entra ID](~/doc/mcp/entra-id-einrichtung.md)
- [Zuordnung der Konfigurationsfelder](~/doc/mcp/verbindung-pruefen.md#zuordnung-der-konfigurationsfelder)
- [MCP-Dokumentation von Cursor](https://cursor.com/docs/context/mcp)
