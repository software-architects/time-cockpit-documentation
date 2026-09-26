---
title: Web-Client - Moderne browserbasierte Zeiterfassung
description: Der Web-Client von time cockpit basiert auf HTML5, CSS3 und JavaScript. Erfassen Sie Zeiten auf jedem Gerät mit modernem Browser oder als PWA.
en_page: doc/getting-started/web-client.md
---
# Web-Client

time cockpit hat sich seit seiner Veröffentlichung im Jahr 2010 stark weiterentwickelt. Am Anfang stand ein Fat Client auf Basis von Windows Presentation Foundation (WPF) mit einer umfangreichen und reaktionsschnellen Benutzeroberfläche. Zusätzlich haben wir einen Silverlight-Client eingeführt, der plattformübergreifend nutzbar war.

Aus mehreren Gründen, etwa weil das Silverlight-Framework abgekündigt wurde, haben wir den Silverlight-Client vor einigen Jahren eingestellt. Seit einigen Jahren ist der Web-Client der primäre Client von time cockpit.

Der Web-Client basiert auf modernen Webtechnologien wie HTML5, CSS3 und JavaScript und läuft in jedem modernen Webbrowser. Er bietet eine responsive, anpassungsfähige Benutzeroberfläche und ist damit auf verschiedenen Geräten nutzbar, darunter Desktops, Laptops und Tablets.

Wenn Sie gerade erst mit time cockpit beginnen, empfehlen wir den Web-Client. Er ist eine moderne und robuste Lösung für die Zeiterfassung.

## Einschränkungen

- Mit dem Web-Client können Sie keine Computersignale aufzeichnen. Wenn Sie jedoch den Vollclient installiert haben, um Signale aufzuzeichnen, können Sie die aufgezeichneten Signale auch im Web-Client ansehen. Derzeit arbeiten wir an einer schlanken Version des Signal Trackers, die ohne den WPF-Vollclient funktioniert.
- Das Datenmodell lässt sich im Web-Client nicht ändern. Alle Änderungen, die Sie mit dem Vollclient vornehmen, stehen aber auch im Web-Client zur Verfügung.

Wenn Sie Fragen zu Signal Trackern oder zu den Anpassungsmöglichkeiten von time cockpit haben, schreiben Sie uns an [support@timecockpit.com](mailto:support@timecockpit.com) oder lesen Sie [Anpassung des Datenmodells](~/doc/datenmodell-anpassung/ueberblick.md).


## time cockpit als Progressive Web App (PWA) verwenden

- Um time cockpit als Progressive Web App zu verwenden, öffnen Sie [time cockpit](https://web.timecockpit.com) in Ihrem Browser.
- Wählen Sie rechts im Adressfeld "Time Cockpit installieren".


### Desktop-PWA-Tableisten in Google Chrome aktivieren
- Öffnen Sie Chrome und navigieren Sie zu: chrome://flags/
- Suchen Sie nach der Einstellung "Desktop PWA tab strips" und setzen Sie den Status auf "Enabled".
- Wählen Sie "Neu starten", um den Browser neu zu starten.

### Desktop-PWA-Tableisten in Microsoft Edge aktivieren
- Öffnen Sie Edge und navigieren Sie zu: edge://flags/
- Suchen Sie nach der Einstellung "Desktop PWA tab strips" und setzen Sie den Status auf "Enabled".
- Wählen Sie "Neu starten", um den Browser neu zu starten.


## Release-Plan

Wir bieten drei verschiedene time cockpit-Umgebungen an:

### Dev: <https://web-dev.timecockpit.com>

Dies ist eine experimentelle Version, die wir laufend mit neuen Releases aktualisieren. Verwenden Sie sie niemals produktiv! Manches wird wahrscheinlich nicht funktionieren. Die Verwendung mit Ihrem produktiven Tenant kann sogar zu beschädigten Daten führen. Wenn Sie diese Version verwenden möchten, fragen Sie nach einer time cockpit-Sandbox.

### Preview: <https://web-preview.timecockpit.com>

In dieser Umgebung veröffentlichen wir Preview-Releases. Zwischen dem 10. und dem Ende jedes Monats kann das Preview-Release instabil sein. Es ist aber trotzdem deutlich stabiler als Dev. Zwischen dem 1. und dem 9. jedes Monats sollte sich die Preview-Umgebung nicht ändern. Sie enthält dann den Release Candidate für die kommende Version. Nutzen Sie diesen Zeitraum, um Ihr Team vorzubereiten und uns Feedback zu geben. Zwischen dem 1. und dem 9. aktualisieren wir Preview nur, wenn es unbedingt notwendig ist.

### Prod: <https://web.timecockpit.com>

Dies ist die stabile Produktivumgebung von time cockpit. Am 10. jedes Monats (bzw. am ersten Arbeitstag nach dem 10.) erstellen wir Prod aus dem neuesten Preview-Release. An diesem Datum erscheint auch unser Newsletter. Während des Monats aktualisieren wir Prod nur bei kritischen Hotfixes.

Die folgende Abbildung zeigt unseren Release-Rhythmus:

![Release-Plan von time cockpit](/doc/getting-started/images/tc-release-plan.png "Release-Plan von time cockpit")
