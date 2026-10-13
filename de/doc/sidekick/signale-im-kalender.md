---
title: sidekick-Signale im Zeiterfassungskalender
description: So zeigt der Zeiterfassungskalender die Signale von time cockpit sidekick - Aktivitätsband, Detailspuren, Schlagwörter und Buchungsvorschläge.
en_page: doc/sidekick/calendar-signals.md
---
# sidekick-Signale im Zeiterfassungskalender

> [!WARNING]
> Early Preview: time cockpit sidekick befindet sich in einer frühen Vorschauphase. Funktionen, Bezeichnungen und Einrichtungsschritte können sich ohne Vorankündigung ändern. sidekick läuft unter Windows 10/11; die macOS-Version wird noch getestet. Während der Preview funktioniert sidekick nur mit `https://web-preview.timecockpit.com`. Feedback: [support@timecockpit.com](mailto:support@timecockpit.com)

Sobald time cockpit sidekick [mit dem Kalender gekoppelt](~/doc/sidekick/installation-und-koppeln.md) ist, zeigt der [Zeiterfassungskalender](~/doc/zeiterfassungskalender/kalender.md) seine Signale neben Ihren Zeitbuchungen an. Diese Seite beschreibt, was Sie sehen und wie Sie damit arbeiten.

Die Signale erscheinen nur in Ihrem eigenen Kalender. Öffnen Sie den Kalender eines anderen Benutzers, zeigt der rechte Bereich **Nur im eigenen Kalender**.

## Das Aktivitätsband

In jeder Ansicht des Kalenders zeigt ein schmales Band neben jedem Tag Ihre Aktivität, wie sidekick sie aufgezeichnet hat. Es unterscheidet:

- Zeit, in der Sie aktiv waren und die bereits gebucht ist,
- Zeit, in der Sie aktiv waren und die noch nicht gebucht ist,
- Zeit, in der der Rechner ohne Ihre Eingaben lief.

Die nicht gebuchte aktive Zeit ist die Zeit, die Sie höchstwahrscheinlich noch buchen müssen.

In der Wochenansicht zeigt der Kalender nur dieses Band. Für die Details eines Tages wechseln Sie in die Tagesansicht, zum Beispiel mit der Schaltfläche **Tagesansicht** oben im rechten Bereich.

## Detailspuren in der Tagesansicht

In der Tagesansicht zeichnet der Kalender Detailspuren neben Ihre Zeitbuchungen. Der Kopf der Spuren gruppiert sie unter **Präsenz**, **Arbeit** und **Vorschlag** und zeigt für jede Spur eine Kennzahl, zum Beispiel die abgedeckte Zeit oder die Anzahl der Commits.

| Spur | Was sie zeigt |
|---|---|
| **Aktiv** | Wann Sie am Rechner aktiv waren. |
| **Mikrofon** | Wann eine Anwendung das Mikrofon benutzt hat. Der Tooltip nennt die Anwendung; sidekick zeichnet niemals Ton auf. |
| **Claude** | Claude-Code-Sessions, eine Spalte je Session, nach Projekt gruppiert, mit den Zeitpunkten Ihrer Prompts und dem Tokenverbrauch. |
| **Codex** | Codex-Sessions, genauso wie bei Claude. |
| **Git** | Commits und Branchwechsel. |
| **Dateien** | Dateiänderungen je Ordner. Ein Klick auf einen Ordnerblock zeigt seinen Ordnerbaum im rechten Bereich. |
| **WLAN** | Das verbundene WLAN. |
| **SSH** | Anmeldungen auf entfernten Rechnern. Nur an Tagen mit einer Anmeldung sichtbar. |
| **Projekte** | Je Viertelstunde die Schablonen, auf die die Signale hindeuten. Eine Schablone ist eine Kombination, die Sie bereits gebucht haben, zum Beispiel ein Projekt und eine Aufgabe. |
| **Vorschlag** | Die vorgeschlagenen Zeitbuchungen des Tages (siehe unten). |

Bewegen Sie die Maus über einen Block, um seine Details in einem Tooltip zu sehen. Die Schaltfläche **Legende** (Palettensymbol) oben im rechten Bereich zeigt die Farben der Detailspuren des Tages. Lokale Kontexte, zum Beispiel ein Claude-Code-Projekt, ein Git-Repository oder ein Ordner, haben im Kalender dieselbe Farbe wie in sidekick. Die Schablonen in den Spuren **Projekte** und **Vorschlag** färbt der Kalender.

Zeitbuchungen werden wie gewohnt im Raster des Kalenders angelegt, nie in den Spuren.

## Der rechte Bereich

Der rechte Bereich zeigt die Signale eines Tages: den Tag, den Sie in der Wochenansicht ausgewählt haben, sonst heute oder den ersten Tag der Ansicht. Wenn Sie Blöcke in den Spuren auswählen, wird der rechte Bereich auf deren Zeitbereiche eingeschränkt. Der Bereich hat zwei Reiter.

### Signale

Der Reiter **Signale** listet die Signale nach Art, jede in einem eigenen Abschnitt:

- **Schlagwörter**: die Wörter, die in Fenstertiteln, Dateipfaden, Commit-Betreffen, Session-Titeln und Besprechungsnamen vorkamen, als Wortwolke.
- **Dateien**: die Ordner und Dateien, die sich geändert haben.
- **KI**: Ihre Zeit mit Claude Code und Codex, die Tokens und geschätzte Kosten nach API-Listenpreisen. Ein Abo wird anders abgerechnet.
- **Anwendungen**: die Anwendungen im Vordergrund, mit ihrer Dauer und ihren Fenstertiteln.
- **Fenstertitel**: die Fenstertitel des Tages.
- **WLAN**: die verbundenen WLANs und die WLANs in Reichweite.

### Vorschlag

Der Reiter **Vorschlag** zeigt die vorgeschlagenen Zeitbuchungen des Tages nach Schablone: wann, was dafür sprach, und eine Schaltfläche **Buchen**. **Buchen** öffnet das Formular für eine neue Zeitbuchung mit Projekt, Tätigkeit und Text der Schablone.

Der Vorschlag lernt aus Ihren Buchungen der letzten 30 Tage und braucht eine aktuelle Version von sidekick. Passt ein Signal nicht zu einer Schablone, können Sie es für diese Schablone nicht mehr als Beleg zählen lassen; der Reiter listet solche Ausschlüsse, damit Sie sie zurücknehmen können.

Ein Block der Spur **Vorschlag** lässt sich auch mit einem Doppelklick buchen. Fand ein Office 365 Termin statt, während das Mikrofon benutzt wurde, schlägt die Spur ihn als eigenen Block mit dem Betreff des Termins vor. **Termin ignorieren** im Tooltip eines solchen Blocks schlägt ihn nicht mehr vor; ignorierte Termine stehen im Reiter **Vorschlag** unter **Ignorierte Termine**, wo Sie sie wieder vorschlagen lassen können.

## Zeiten markieren

- Klicken Sie im rechten Bereich auf ein Schlagwort, eine Datei, eine Anwendung oder einen anderen Eintrag, um im Kalender zu markieren, wann er vorkam. **Esc** hebt die Markierung auf.
- Drücken Sie **/**, um die Schlagwörter zu durchsuchen. Die Suche filtert die Wortwolke und markiert im Kalender, wann die passenden Wörter vorkamen. **Esc** leert die Suche.
- Klicken Sie auf einen Block in einer Spur, um seinen Zeitbereich auszuwählen. **Strg** + Klick fügt einen weiteren Block hinzu; ein Klick auf eine leere Stelle in den Spuren hebt die Auswahl auf.

## Aktualisierung

Solange heute im Kalender sichtbar ist, werden die Signale jede Minute neu geladen. Andere Tage werden nicht automatisch neu geladen.

## Verwandte Seiten

- [Zeiterfassungskalender](~/doc/zeiterfassungskalender/kalender.md)
- [time cockpit sidekick](~/doc/sidekick/ueberblick.md)
- [Datenschutz und Daten in sidekick](~/doc/sidekick/datenschutz-und-daten.md)
