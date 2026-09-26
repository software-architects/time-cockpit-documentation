---
title: Web API - REST-API für Integrationen
description: REST-API mit OData, Query-Endpunkt und Aktionen für Daten in time cockpit. Integration mit PowerBI, Excel und eigenen Anwendungen.
en_page: doc/web-api/overview.md
---
# Web API
Time cockpit bietet eine webbasierte API. Über HTTP, REST und JSON können Sie Informationen abrufen und ändern, Geschäftslogik ausführen oder einen Bericht erzeugen, ohne von unserem .NET SDK abhängig zu sein. Dieser Dienst wird öffentlich gehostet, Kunden müssen keine zusätzlichen Installations- oder Konfigurationsschritte durchführen.

Die time cockpit API bietet verschiedene Endpunkte:

- [OData-Endpunkt](~/doc/web-api/odata-endpunkt.md): Unterstützt gefilterte Abfragen, Metadaten-Reflection und Datenmanipulation (d. h. Einfügen, Ändern, Löschen)
- [Query-Endpunkt](~/doc/web-api/query-endpunkt.md): Unterstützt Abfragen von Daten in time cockpit mit der [time cockpit Abfragesprache](~/doc/tcql/ueberblick.md) (TCQL).
- [ExecuteList-Endpunkt](~/doc/web-api/executelist-endpunkt.md): Führt time cockpit [Listen](~/doc/datenmodell-anpassung/liste.md) aus. Listen zeigen Daten in der Benutzeroberfläche in Tabellenform an, ihre Daten können aber auch über die Web API abgerufen werden.
- [ExecuteAction-Endpunkt](~/doc/web-api/executeaction-endpunkt.md): Führt time cockpit [Aktionen](~/doc/scripting/aktionen.md) aus. Eine Aktion ist eigene Geschäftslogik, die in Ihrem time cockpit Tenant gehostet wird.
- [Reporting-Endpunkt](~/doc/web-api/reporting-endpunkt.md): Führt einen time cockpit [SSRS-Bericht](~/doc/berichte/ueberblick.md) aus.

## Basisadresse

Die Basisadresse unserer Web API ist https://api.timecockpit.com. Sie ist nur über HTTPS erreichbar, und Sie müssen sich authentifizieren, bevor Sie die API verwenden können.

## Authentifizierung

Derzeit werden drei Arten der Authentifizierung unterstützt:

- [Token-Authentifizierung](http://en.wikipedia.org/wiki/Access_token) bietet eine einfache und effiziente Möglichkeit, Webanfragen zu authentifizieren. Ein Header überträgt das Zugriffstoken und identifiziert den Inhaber (Bearer).
- [Basic-Authentifizierung](http://en.wikipedia.org/wiki/Basic_access_authentication) mit Benutzername und Passwort wird von Werkzeugen verwendet, die keine Token-Authentifizierung anbieten (z. B. [OData in Excel](http://office.microsoft.com/en-001/excel-help/connect-to-an-odata-feed-HA104019824.aspx)), sowie zum erstmaligen Abrufen von Authentifizierungstokens.
- [PAT-Authentifizierung](https://en.wikipedia.org/wiki/Personal_access_token).

> [!WARNING]
> Wir raten dringend von Token- oder Basic-Authentifizierung ab. Diese Authentifizierungsarten werden in absehbarer Zeit deaktiviert. Wir empfehlen dringend, sich mit PATs zu authentifizieren.

Wie Sie sich bei unserer Web API authentifizieren, lesen Sie unter [Authentifizierung](~/doc/web-api/authentifizierung.md).
