---
title: MCP-Zugriff, Umfang und Bestätigung
description: "Wie der MCP-Server von time cockpit einschränkt, was ein KI-Agent tun darf: Nur-Lese-Modus, eigene Daten, Berechtigungen und Bestätigungsablauf."
keywords: [mcp readonly, mcp owndata, mcp bestätigung, confirmed=true, berechtigungen für ki-agenten, time cockpit]
en_page: doc/mcp/access-and-confirmation.md
---
# MCP-Zugriff, Umfang und Bestätigung

> [!WARNING]
> Im Aufbau: Der MCP-Server von time cockpit und diese Dokumentation werden aktiv weiterentwickelt, inkompatible Änderungen sind möglich. Tools können umbenannt, geändert oder entfernt werden, und Dialogbeschriftungen sowie Konfigurationsschritte können sich ohne Ankündigung ändern. Prüfen Sie diese Seite auf Aktualisierungen, bevor Sie die Einrichtung für Ihre Benutzer ausrollen, und rechnen Sie damit, Ihre Konfiguration, Skills und Prompts nach einem Update anpassen zu müssen.

Drei Mechanismen entscheiden, was ein KI-Agent mit Ihren Daten in time cockpit tun darf. Zwei davon wählen Sie beim Verbinden; den dritten legt fest, wer den Server betreibt.

## 1. Ihre Berechtigungen in time cockpit gelten immer

Das ist die Untergrenze, die keine der folgenden Einstellungen aufheben kann. Jeder Aufruf wird erneut gegen das Berechtigungsmodell des Mandanten autorisiert, und zwar mit der Vereinigung der Rollen, die dem angemeldeten Benutzer zugewiesen sind. Eine Liste, Entität, Eigenschaft oder ein Objekt, das der Benutzer im Web-Client nicht erreichen kann, ist auch über einen Agent nicht erreichbar – und kann auch nicht durch Erraten eines technischen Namens erreicht werden, weil ein Tool oder Artefakt, das in der Erkennung verborgen ist, auch bei direktem Aufruf abgelehnt wird.

Darüber hinaus sind Systementitäten und eine feste Menge interner Entitäten (Telemetrie, Benachrichtigungen, Feature-Flags und ähnliche mitgelieferte Interna) vor allen Agent-Schnittstellen verborgen: Erkennung, Beschreibung, Abfragen, Objekte und Ressourcen gleichermaßen.

## 2. Zugriff und Umfang: Einstellungen, die Sie wählen

`access` und `scope` sind Teil der Verbindung. Beide können das, was die Verbindung darf, immer nur **einschränken** – deshalb darf ein Client sie überhaupt setzen. Keine der beiden ersetzt Berechtigungen.

| Einstellung | Wert | Wirkung |
|---|---|---|
| Zugriff (Access) | `readonly` | Jedes Tool, das Daten ändert, wird aus der Tool-Liste ausgeblendet und bei einem Aufruf abgelehnt. |
| Umfang (Scope) | `owndata` | Jedes Tool, dessen Ergebnis sich nicht auf den handelnden Benutzer einschränken lässt, wird ausgeblendet. `get_timesheets` und `create_timesheet` bleiben erhalten und werden auf dem Server auf diesen Benutzer festgelegt. |

Wenn Sie eine Einstellung weglassen oder `default` übergeben, bleibt sie uneingeschränkt. Einen Wert `readwrite` gibt es nicht.

Da diese Einstellungen Teil der Verbindung sind, **können sie später im Gespräch nicht verschärft werden**. Entscheiden Sie vor dem Verbinden:

| Wer verbindet sich | Zugriff | Umfang |
|---|---|---|
| Jemand, der zum ersten Mal einen persönlichen Assistenten einrichtet | `readonly` | `owndata` |
| Jemand, der eigene Stunden bucht und korrigiert | default | `owndata` |
| Ein Mandantenadministrator für Berichte oder Wartung | default | default |
| Jeder, der mit Live-Daten experimentiert oder vorführt | `readonly` | default |

Wie Sie die Einstellungen übergeben, ist unter [Verbindungseinstellungen](~/doc/mcp/ueberblick.md#verbindungseinstellungen-header-oder-url-segment) beschrieben.

## 3. Bestätigung: eine Einstellung, die Sie nicht wählen

Jedes generische Anlegen, Ändern und Löschen eines Objekts (`create_object`, `update_object`, `delete_object`) erfordert eine ausdrückliche Bestätigung, bevor es ausgeführt wird. Das ist die Standardrichtlinie, und sie verhindert, dass ein Agent ein Objekt als Nebeneffekt der Beantwortung einer Frage ändert.

In der Praxis ist das ein Ablauf in zwei Schritten:

1. Der Agent ruft das Tool auf. Der Server verändert **keine** Daten und antwortet mit `status: confirmation_required` sowie einer Meldung, die beschreibt, was passieren würde.
2. Der Agent teilt Ihnen mit, was er ändern möchte. Sobald Sie zustimmen, wiederholt er denselben Aufruf mit `confirmed=true`, und die Änderung wird ausgeführt.

Eine Antwort `confirmation_required` ist daher der normale Weg, kein Fehler.

> [!IMPORTANT]
> Die Bestätigung ist **keine** Client-Einstellung. Anders als Zugriff und Umfang würde ein Abschalten *erweitern*, was eine Anfrage tun darf. Daher kann sie nur konfiguriert werden, wer den Server betreibt: über die Bereitstellungskonfiguration beim gehosteten Server, über das Startargument `--mcp-confirmation` beim lokalen Host. Eine Anfrage, die versucht, die Bestätigung als Header oder URL-Segment zu senden, wird sofort abgelehnt.

Ein Betreiber kann die Richtlinie auf `Disabled` setzen – gedacht für kontrollierte Umgebungen wie eine Wegwerf-Sandbox. In diesem Fall laufen Änderungen ohne den zusätzlichen Zwischenschritt. Bei einem produktiven Mandanten sollten Sie davon ausgehen, dass eine Bestätigung erforderlich ist.

Das Löschen eines Objekts ist destruktiv und erfordert wie jede andere Änderung eine Bestätigung; ein eigenes Rückgängigmachen gibt es nicht.

## Verwandte Seiten

- [KI-Agenten und der MCP-Server von time cockpit](~/doc/mcp/ueberblick.md)
- [Verbindungseinstellungen](~/doc/mcp/ueberblick.md#verbindungseinstellungen-header-oder-url-segment)
- [Lokaler MCP-Server: Tools](~/doc/mcp/oncockpit-admin-lokal.md#tools)
- [Leitfaden zu Berechtigungen und Sicherheit](~/doc/datenmodell/berechtigungen-und-sicherheit.md)
