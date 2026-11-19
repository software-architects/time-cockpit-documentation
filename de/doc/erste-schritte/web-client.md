---
title: Web-Client - Moderne browserbasierte Zeiterfassung
description: Der Web-Client ist der Haupt-Client von time cockpit. Er läuft ohne Installation in jedem aktuellen Browser und lässt sich als App installieren.
en_page: doc/getting-started/web-client.md
---
# Web-Client

Der Web-Client ist der Haupt-Client von time cockpit und der Client, mit dem wir neuen Benutzern den Einstieg empfehlen. Er läuft ohne Installation in jedem aktuellen Browser, auf Desktop-Rechnern und Laptops ebenso wie auf Tablets und Smartphones (siehe [Mobile Zeiterfassung](~/doc/erste-schritte/mobile-zeiterfassung.md)). Sie können ihn auch als App installieren (siehe [time cockpit als App installieren](#time-cockpit-als-app-installieren)).

## Einschränkungen

- Der Web-Client selbst zeichnet keine Signale Ihres Rechners auf. Dafür gibt es [time cockpit sidekick](~/doc/sidekick/ueberblick.md), eine eigene kleine Anwendung, die Ihre Aktivitäten aufzeichnet und im Zeiterfassungskalender des Web-Clients anzeigt; sidekick ist derzeit in der Preview. Signale, die der [klassische Signal Tracker](~/doc/signal-tracker/ueberblick.md) des Fullclients aufzeichnet, sehen Sie ebenfalls im Web-Client.
- Das Datenmodell lässt sich im Web-Client nicht ändern. Änderungen, die Sie mit dem Fullclient vornehmen, stehen aber auch im Web-Client zur Verfügung (siehe [Anpassung des Datenmodells](~/doc/datenmodell-anpassung/ueberblick.md)).

Bei Fragen zu sidekick, zum Signal Tracker oder zur Anpassung von time cockpit schreiben Sie uns an [support@timecockpit.com](mailto:support@timecockpit.com).

## time cockpit als App installieren

time cockpit ist eine Progressive Web App (PWA): Sie können den Web-Client wie eine Anwendung installieren. Er läuft dann in einem eigenen Fenster und lässt sich aus dem Startmenü oder der Taskleiste starten.

1. Öffnen Sie [time cockpit](https://web.timecockpit.com) in Google Chrome oder Microsoft Edge.
2. Klicken Sie rechts in der Adressleiste auf das Symbol zum Installieren und dann auf **Installieren**. Der Browser nennt die App **time cockpit**.

### Mehrere Tabs im App-Fenster

Ohne weitere Einstellung öffnet die installierte App jede Seite in einem eigenen Fenster. Chrome und Edge können stattdessen Tabs im App-Fenster anzeigen. Die Einstellung dafür ist eine experimentelle Funktion des Browsers; ob es sie gibt und wie sie heißt, kann sich mit jeder Browserversion ändern.

1. Öffnen Sie in Chrome `chrome://flags/`, in Edge `edge://flags/`.
2. Suchen Sie die Einstellung **Desktop PWA tab strips** und setzen Sie sie auf **Enabled**.
3. Starten Sie den Browser neu, wenn er Sie dazu auffordert.

## Release-Plan

Sie öffnen time cockpit immer unter <https://web.timecockpit.com>. In welcher der vier Umgebungen Sie dort arbeiten, legen wir für Ihren Tenant oder für einzelne Benutzer fest; die Adresse im Browser bleibt dieselbe. Eine neue Version erscheint ungefähr am 10. jedes Monats in Prod, die anderen Umgebungen bekommen sie jeweils etwas früher.

Die Umgebung zeigt ein Badge rechts oben in der Menüleiste des Web-Clients. Auf einem schmalen Bildschirm zeigt es nur die ersten drei Buchstaben, zum Beispiel **PRE**.

Die Adressen unter **Gezielt testen** brauchen Sie nur, wenn Sie eine bestimmte Umgebung ausprobieren möchten: Sie öffnen genau diese Umgebung, unabhängig von unserer Einstellung.

| Umgebung | Beschreibung |
|---|---|
| **Dev**<br><img src="/doc/getting-started/images/environment-badge-dev.de.png" alt="Badge DEV" title="Badge DEV" width="240" style="min-width:240px" /> | Experimentelle Version, die wir laufend aktualisieren. Verwenden Sie Dev nicht für Ihre produktive Arbeit: Manches funktioniert dort wahrscheinlich nicht, und mit Ihrem produktiven Tenant kann Dev sogar Daten beschädigen. Wenn Sie Dev ausprobieren möchten, fragen Sie nach einer time cockpit-Sandbox.<br><br>Gezielt testen: <https://web-dev.timecockpit.com> |
| **Preview**<br><img src="/doc/getting-started/images/environment-badge-preview.de.png" alt="Badge PREVIEW" title="Badge PREVIEW" width="240" style="min-width:240px" /> | Bekommt eine neue Version vor dem Release Candidate. Deutlich stabiler als Dev, kann sich aber noch ändern. Nutzen Sie Preview, um Ihr Team auf eine neue Version vorzubereiten und uns Feedback zu geben.<br><br>Gezielt testen: <https://web-preview.timecockpit.com> |
| **Release Candidate (RC)**<br><img src="/doc/getting-started/images/environment-badge-rc.de.png" alt="Badge RC" title="Badge RC" width="240" style="min-width:240px" /> | Die Version, die als Nächstes in Prod kommt, idealerweise ein bis zwei Wochen vor dem Prod-Release. Im RC arbeiten deutlich mehr Benutzer als in Preview.<br><br>Gezielt testen: <https://web-rc.timecockpit.com> |
| **Prod**<br><img src="/doc/getting-started/images/environment-badge-prod.de.png" alt="Kein Badge in Prod" title="Kein Badge in Prod" width="240" style="min-width:240px" /><br>kein Badge | Die stabile Produktivumgebung. Eine neue Version erscheint ungefähr am 10. jedes Monats, zusammen mit unserem Newsletter. Während des Monats aktualisieren wir Prod nur für kritische Fehlerbehebungen.<br><br>Gezielt testen: <https://web-prod.timecockpit.com> |
