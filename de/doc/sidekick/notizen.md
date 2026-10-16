---
title: Notizen mit time cockpit sidekick
description: Halten Sie mit time cockpit sidekick in einer Notiz fest, was Sie gerade getan haben, und buchen Sie sie später im Zeiterfassungskalender. Early Preview.
en_page: doc/sidekick/notes.md
---
# Notizen mit sidekick

> [!WARNING]
> Early Preview: time cockpit sidekick befindet sich in einer frühen Vorschauphase. Funktionen, Bezeichnungen und Einrichtungsschritte können sich ohne Vorankündigung ändern. sidekick läuft unter Windows 10/11; die macOS-Version wird noch getestet. Während der Preview funktioniert sidekick nur mit `https://web-preview.timecockpit.com`. Feedback: [support@timecockpit.com](mailto:support@timecockpit.com)

Signale zeigen, wann Sie gearbeitet haben und mit welchen Anwendungen, aber nicht immer, woran. Ein Telefonat, ein Gespräch am Schreibtisch oder eine schnelle Korrektur hinterlassen kaum Spuren. Mit einer Notiz halten Sie es am Ende der Tätigkeit in wenigen Worten fest, ohne die Anwendung zu verlassen, in der Sie gerade sind. sidekick behält die Notiz mit ihrer Zeit, und der [Zeiterfassungskalender](~/doc/zeiterfassungskalender/kalender.md) zeigt sie neben den Signalen, sodass Sie sie später mit ihrem Text buchen können.

## Das Notizfenster öffnen

- Drücken Sie die Tastenkombination für eine neue Notiz: **Strg+Alt+N** unter Windows, **⌘⌥N** unter macOS. Sie können die Kombination in den Einstellungen ändern oder abschalten (siehe [Tastenkombination](#tastenkombination)).
- Oder wählen Sie **Notiz…** im Menü des Symbols im Infobereich.

Das Fenster **Notiz** öffnet sich über jeder Anwendung, auf dem Bildschirm mit dem Mauszeiger, und der Cursor steht im Textfeld. Tippen Sie, was Sie gerade getan haben, und drücken Sie **Enter**.

## Das Notizfenster

| Feld | Was es bewirkt |
|---|---|
| Textfeld | Was Sie getan haben, in wenigen Worten. **Umschalt+Enter** beginnt eine neue Zeile. |
| **Zeitpunkt** | Wann die Notiz gilt. Er beginnt mit der aktuellen Uhrzeit (Hinweis **jetzt**) und lässt sich ändern. |
| **Schließt ab** | Ob die Notiz einen Zeitraum abdeckt. **Keine** ist vorausgewählt; siehe unten. |
| **Arbeitsbereich** | Zu welchem der heutigen Arbeitsbereiche oder Termine die Notiz gehört. |

**Enter** oder **Speichern** speichert die Notiz, und sidekick bestätigt sie mit einer stillen Benachrichtigung **Notiz gespeichert**. **Esc** verwirft die Notiz. Schließen Sie das Fenster stattdessen mit seiner Schließen-Schaltfläche, bleibt der Text für das nächste Öffnen erhalten.

### Eine Notiz mit Beginn

Ist unter **Schließt ab** **Keine** ausgewählt, können Sie einen optionalen **Beginn** eingeben. Die Notiz deckt dann die Zeit vom Beginn bis zu ihrem Zeitpunkt ab; ohne Beginn markiert sie einen einzelnen Zeitpunkt. Die Chips neben dem Beginn setzen ihn mit einem Klick:

- „seit 10:12 · zurück am Platz“: das Ende Ihrer letzten Pause von mindestens 15 Minuten heute, mit seiner Uhrzeit.
- **−15 min**, **−30 min** und **−1 h**: so lange vor dem Zeitpunkt.

Wenn Sie zum Beispiel nach einem Anruf auflegen, öffnen Sie das Notizfenster, tippen „Telefonat mit dem Kunden zum Angebot“ und wählen **−30 min**.

### Eine frühere Notiz abschließen

Unter **Keine** listet **Schließt ab** die heutigen Notizen, die noch kein Ende haben, höchstens fünf, die neueste zuerst. Wählen Sie eine aus, um sie zum Zeitpunkt der neuen Notiz zu beenden. Die neue Notiz selbst ist dann ein einzelner Zeitpunkt.

Schreiben Sie zum Beispiel „Workshop vorbereiten“, wenn Sie beginnen, und wenn Sie fertig sind, schreiben Sie die nächste Notiz und wählen unter **Schließt ab** „Workshop vorbereiten“.

### Arbeitsbereich

**Arbeitsbereich** zeigt die heutigen Arbeitsbereiche und Termine als Chips, in denselben Farben wie in der Tagesansicht von sidekick. Der Bereich, der in der letzten Viertelstunde im Vordergrund war, ist vorausgewählt. Wählen Sie einen anderen Chip oder **Keiner** für eine Notiz ohne Arbeitsbereich. Der Kalender zeichnet die Notiz in der Farbe ihres Arbeitsbereichs.

## Notizen bearbeiten und löschen

Notizen werden nur in sidekick bearbeitet und gelöscht. Öffnen Sie den Reiter **Tagesansicht**:

- An einem Tag mit Notizen zeigt die Spur **Notizen** rechts von **Aktiv** für jede Notiz ein Blattsymbol zu ihrer Zeit, in der Farbe ihres Arbeitsbereichs. Eine Notiz mit Ende hat einen dünnen Balken bis zu ihrem Ende. Der Tooltip zeigt den Text.
- Der rechte Bereich beginnt mit dem Abschnitt **Notizen**: den Notizen des Tages oder des ausgewählten Bereichs. Die Suche des Bereichs findet auch Notizen.
- **Bearbeiten** öffnet in der Zeile ein kleines Formular mit dem Text, **Beginn**, **Ende (optional)** und **Kontext**. **Strg+Enter** oder **Speichern** speichert die Änderungen, **Esc** oder **Abbrechen** verwirft sie.
- **Löschen** fragt in der Zeile **Notiz löschen?**. Bestätigen Sie mit **Löschen**, oder behalten Sie die Notiz mit **Abbrechen**.

## Tastenkombination

Öffnen Sie in sidekick **Einstellungen** und in der Gruppe **Für alle Rechner** den Bereich **Notizen**.

- Klicken Sie in das Feld **Tastenkombination für eine neue Notiz** und drücken Sie die gewünschten Tasten. Eine Kombination braucht **Strg** (**⌘** unter macOS), **Alt** oder **Win** und genau eine weitere Taste.
- **Aus** schaltet die Tastenkombination ab. **Standard** stellt **Strg+Alt+N** (**⌘⌥N** unter macOS) wieder her.
- Die Änderung gilt, sobald Sie die Einstellungen speichern.

Solange sidekick läuft, bekommt keine andere Anwendung diese Tastenkombination. Verwendet eine andere Anwendung sie bereits, sagt der Bereich das; wählen Sie dann eine andere Kombination. **Notiz…** im Menü des Symbols im Infobereich funktioniert in jedem Fall weiter.

## Notizen im Zeiterfassungskalender

Der Kalender liest Ihre Notizen zusammen mit den Signalen von sidekick:

- In der Tagesansicht zeigt die Spur **Notizen** jede Notiz zu ihrer Zeit. Ihr Tooltip zeigt den Text, kopiert ihn und bucht die Notiz mit ihrem Text. Siehe [Notizen](~/doc/sidekick/signale-im-kalender.md#notizen).
- In der Wochenansicht markiert ein kleiner Reiter am linken Rand der Zeitbuchungen eines Tages jede Notiz. Ein Klick auf den Reiter bucht die Notiz.
- Eine Notiz, die einen Zeitraum abdeckt, weil sie einen Beginn hat oder von einer späteren Notiz abgeschlossen wurde, wird zu einem Entwurf in den Zeitbuchungen über diesem Zeitraum, solange dort noch nichts gebucht ist. Ein Doppelklick bucht ihn mit dem Text der Notiz. Siehe [Entwürfe aus Notizen](~/doc/sidekick/signale-im-kalender.md#entwürfe-aus-notizen).

Der Kalender ändert oder löscht nie eine Notiz.

## Datenschutz und Löschen

Notizen bleiben auf Ihrem Rechner, in derselben Datenbank wie die Signale, und sind in den täglichen Sicherungen enthalten. sidekick lädt sie nie hoch, und der Kalender liest sie genauso wie die Signale: nur aus dem Browser auf demselben Rechner und nur für gekoppelte Kalender.

Anders als Signale werden Notizen nach Ablauf der Aufbewahrungsdauer nicht gelöscht; sie bleiben, bis Sie sie löschen. **Daten löschen** im Reiter **Daten** behält Ihre Notizen, außer Sie wählen **Notizen mitlöschen**. Siehe [Datenschutz und Daten in sidekick](~/doc/sidekick/datenschutz-und-daten.md#daten-löschen).

## Verwandte Seiten

- [time cockpit sidekick](~/doc/sidekick/ueberblick.md)
- [sidekick-Signale im Zeiterfassungskalender](~/doc/sidekick/signale-im-kalender.md)
- [Datenschutz und Daten in sidekick](~/doc/sidekick/datenschutz-und-daten.md)
