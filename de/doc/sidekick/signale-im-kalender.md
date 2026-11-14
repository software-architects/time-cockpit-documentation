---
title: sidekick-Signale im Zeiterfassungskalender
description: So zeigt der Zeiterfassungskalender die Signale von time cockpit sidekick - Aktivitätsband, Detailspuren, Notizen, Schlagwörter und Buchungsvorschläge.
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

In der Wochenansicht zeigt der Kalender nur dieses Band. Für die Details eines Tages wechseln Sie in die Tagesansicht, zum Beispiel mit der Schaltfläche für die Tagesansicht (Kalendersymbol) oben im rechten Bereich.

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

## Notizen

Eine Notiz ist ein kurzer Text, den Sie in sidekick schreiben, standardmäßig mit **Strg** + **Alt** + **N** (**⌘⌥N** unter macOS). Der Kalender zeigt sie in jeder Ansicht zu ihrer Zeit. Eine Notiz ist eine Information wie ein Termin: Sie muss nicht zu einer Zeitbuchung werden, und nichts kennzeichnet sie als gebucht.

- Eine Notiz hat eine Kontur in der Farbe ihres Kontexts auf leicht getöntem Grund, eine Notiz ohne Kontext ist hellgelb.
- Liegt eine Zeitbuchung über einem Teil der Notiz, rückt ihr Text in den freien Teil. Liegen Zeitbuchungen über der ganzen Notiz, rückt sie in den schmalen Streifen rechts der Zeitbuchungen, in dem auch [Outlook-Termine](~/doc/zeiterfassungskalender/outlook-termine.md#so-erscheinen-termine-im-kalender) stehen.
- Notizen und Termine derselben Zeit teilen sich die Breite. Notizen derselben Zeit, für die jeweils zu wenig davon bliebe, werden ein Eintrag, zum Beispiel **3 Notizen**.
- Stehen Zeitbuchungen und Termine nebeneinander, stehen Notizen bei den Terminen.
- Eine Notiz ohne Dauer ist eine Zeile zu ihrer Zeit. Eine laufende Notiz wächst bis zur aktuellen Zeit.

| Was Sie tun | Was geschieht |
|---|---|
| Mit der Maus auf die Notiz zeigen | Nach einem Moment öffnet sich ihr [Tooltip](~/doc/zeiterfassungskalender/kalender.md#tooltips): die Zeit, die Dauer, der ganze Text und der Name des Kontexts. |
| Klicken oder tippen, oder **Eingabe** oder **Leertaste** auf der Notiz drücken | Der Tooltip öffnet sich sofort. Mit einer Taste rückt der Fokus auf den Link im Tooltip; **Esc** oder **Tab** über den letzten Link hinaus schließt ihn und bringt den Fokus zurück auf die Notiz. |
| Doppelklicken oder zweimal tippen, **Umschalt** + **Eingabe** auf der Notiz drücken oder **Buchen** im Tooltip klicken | Das Formular für eine neue Zeitbuchung öffnet sich mit dem Text der Notiz und ihrer Zeit, gerundet auf die Viertelstunde. Eine Notiz ohne Dauer bekommt eine Stunde. |
| Auf die Notiz drücken und ziehen | Eine neue Zeitbuchung wird gezogen, wie im freien Raster. |

Ein Eintrag für mehrere Notizen wird nicht als Ganzes gebucht: Sein Tooltip listet die Notizen auf, jede mit eigenem Link **Buchen**.

## Der rechte Bereich

Der rechte Bereich zeigt die Signale eines Tages: den Tag, den Sie in der Wochenansicht ausgewählt haben, sonst heute oder den ersten Tag der Ansicht. Wenn Sie Blöcke in den Spuren oder einen Block in der Spur **Vorschlag** auswählen, wird der rechte Bereich auf deren Zeitbereiche eingeschränkt. Der Bereich hat zwei Reiter.

### Signale

Der Reiter **Signale** listet die Signale nach Art, jede in einem eigenen Abschnitt:

- **KI**: Ihre Zeit mit Claude Code und Codex und die Zeit, in der die Agenten allein gearbeitet haben, je Projekt und Session.
- **Fenstertitel**: was im Vordergrund war. **Nach Titel** listet die Fenstertitel des Tages, **Nach Anwendung** die Anwendungen mit ihrer Dauer. Ihre Wahl bleibt gespeichert.
- **Dateien**: die Ordner und Dateien, die sich geändert haben.
- **Schlagwörter**: die Wörter, die in Fenstertiteln, Dateipfaden, Commit-Betreffen, Session-Titeln und Besprechungsnamen vorkamen, als Wortwolke.
- **WLAN**: die verbundenen WLANs und die Zeit ohne WLAN.

Jeder Abschnitt zeigt zuerst, was eine Buchung braucht. Das Reglersymbol im Band eines Abschnitts zeigt seine Details, ein zweiter Klick blendet sie wieder aus:

| Abschnitt | Details |
|---|---|
| **KI** | Die Tokens und geschätzte Kosten nach API-Listenpreisen, aufgeteilt nach Token-Art. Ein Abo wird anders abgerechnet. |
| **Fenstertitel** | Die Anwendung unter jedem Titel oder die Titel unter jeder Anwendung. |
| **Dateien** | Die Änderungen nach Art (neu, geändert, gelöscht) und die einzelnen Läufe der Massenänderungen. |
| **Schlagwörter** | Die Zeit nach den häufigsten Wörtern. |
| **WLAN** | Wann jedes WLAN verbunden war, und die WLANs in Reichweite. |

Zeigen Sie auf eine Zeile im Abschnitt **KI**, um ihre Zeit, Tokens und Kosten in einem Tooltip zu sehen. **Strg** + Mausrad über einem Abschnitt zeigt mehr oder weniger Zeilen, bei **Dateien** eine Ebene des Ordnerbaums mehr oder weniger. Die Zahl der offenen Ebenen bleibt erhalten, wenn Sie die Seite neu laden oder zu einem anderen Tag wechseln.

### Vorschlag

Der Reiter **Vorschlag** zeigt die vorgeschlagenen Zeitbuchungen des Tages nach Schablone: wann, was dafür sprach, und eine Schaltfläche **Buchen**. **Buchen** öffnet das Formular für eine neue Zeitbuchung mit Projekt, Tätigkeit und Text der Schablone.

Der Vorschlag lernt aus Ihren Buchungen der letzten 30 Tage und braucht eine aktuelle Version von sidekick. Passt ein Signal nicht zu einer Schablone, können Sie es für diese Schablone nicht mehr als Beleg zählen lassen; der Reiter listet solche Ausschlüsse, damit Sie sie zurücknehmen können.

Ein Block der Spur **Vorschlag** lässt sich auch mit einem Doppelklick buchen. Fand ein Office 365 Termin statt, während das Mikrofon benutzt wurde, schlägt die Spur ihn als eigenen Block mit dem Betreff des Termins vor. **Termin ignorieren** im Tooltip eines solchen Blocks schlägt ihn nicht mehr vor; ignorierte Termine stehen im Reiter **Vorschlag** unter **Ignorierte Termine**, wo Sie sie wieder vorschlagen lassen können.

## Zeiten markieren

- Klicken Sie im rechten Bereich auf ein Schlagwort, eine Datei, eine Anwendung oder einen anderen Eintrag, um im Kalender zu markieren, wann er vorkam. **Esc** hebt die Markierung auf.
- Klicken Sie auf einen Block in einer Spur, um seinen Zeitbereich auszuwählen. **Strg** + Klick fügt einen weiteren Block hinzu; ein Klick auf eine leere Stelle in den Spuren hebt die Auswahl auf.

## Signale durchsuchen

Die Suchschaltfläche (Lupensymbol) oben im rechten Bereich oder **/** öffnet ein Suchfeld über den Abschnitten des Reiters **Signale**. Jeder Abschnitt zeigt dann nur die Einträge, die jedes eingegebene Wort enthalten, in beliebiger Reihenfolge und unabhängig von Groß- und Kleinschreibung und Akzenten: Fenstertitel und Anwendungen, Dateipfade, Schlagwörter, WLANs sowie KI-Sessions nach Arbeitsbereich, Titel oder erstem Prompt. Der passende Text wird hervorgehoben, und ein Abschnitt ohne Treffer klappt zu und zeigt **keine Treffer**. Passende Schlagwörter werden außerdem im Kalender markiert.

Unter dem Feld zeigt ein Zeitstrahl des Tages, wann die Treffer vorkamen, und eine Schaltfläche für jeden Abschnitt mit Treffern springt zu ihm.

Wenn Sie Blöcke in den Spuren ausgewählt haben, durchsucht die Suche die Auswahl. **Ganzer Tag** durchsucht stattdessen den ganzen Tag und behält die Auswahl bei; der Zeitstrahl der Auswahl zeigt dann die Treffer des ganzen Tages. Beide Schaltflächen zeigen ihre Anzahl an Treffern.

**Esc** leert das Feld; in einem leeren Feld schließt es die Suche. Der Text bleibt erhalten, wenn Sie zu anderen Tagen wechseln, bis die Seite neu geladen wird.

## Aktualisierung

Solange heute im Kalender sichtbar ist, werden die Signale jede Minute neu geladen. Andere Tage werden nicht automatisch neu geladen.

## Verwandte Seiten

- [Zeiterfassungskalender](~/doc/zeiterfassungskalender/kalender.md)
- [time cockpit sidekick](~/doc/sidekick/ueberblick.md)
- [Datenschutz und Daten in sidekick](~/doc/sidekick/datenschutz-und-daten.md)
