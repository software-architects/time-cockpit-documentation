---
title: Reisekosten - Einstellungen, Diätensätze, Rechenregeln
description: "Referenz zu Einstellungen, Diätensätzen, Kilometergeld, Wertelisten und den österreichischen Rechenregeln der Reisekosten in time cockpit. Preview."
en_page: doc/travel-expenses/settings-and-rates.md
---
# Reisekosten: Einstellungen, Diätensätze und Rechenregeln

> [!WARNING]
> Preview: Reisekosten sind eine Preview-Funktion. Die Menüeinträge und die Reisekostenfelder in den unten genannten Formularen erscheinen nur, wenn das Feature-Flag `APP_TravelExpensePreview` für Ihren Mandanten aktiviert ist. Zum Ausprobieren wenden Sie sich an [support@timecockpit.com](mailto:support@timecockpit.com).

Diese Seite beschreibt, was ein Administrator für die [Reisekosten](~/doc/reisekosten/ueberblick.md) einstellt und wie time cockpit die Beträge berechnet. Die Berechnung folgt den österreichischen Regeln für 2026. Regeln anderer Länder, etwa Deutschlands, werden noch nicht unterstützt.

## Wer was ändern darf

Mit Standardberechtigungen:

| Was | Wo | Wer es ändern darf |
|---|---|---|
| Reisekosten-Einstellungen | **Verwaltung** → **[Globale Einstellungen](https://web.timecockpit.com/app/forms/entity/APP_GlobalSettings)**, Abschnitt **Reisekosten** | Stammdatenadministratoren |
| Heimatland eines Benutzers | **Benutzer** → **[Benutzerdetails](https://web.timecockpit.com/app/lists/entity/APP_UserDetail)**, Feld **Heimatland für Reisekosten (abweichend)** im Abschnitt **Einstellungen** | HR-Administratoren |
| Diätensätze | **Verwaltung** → **Reisekosten** → **[Diätensätze](https://web.timecockpit.com/app/lists/entity/APP_PerDiemRate)** | HR-Administratoren, Stammdatenadministratoren |
| Kilometergeld eines Verkehrsmittels | **Verwaltung** → **[Verkehrsmittel](https://web.timecockpit.com/app/lists/entity/APP_MeansOfTransport)**, Abschnitt **Kilometergeld** | Stammdatenadministratoren |
| Belegarten | Auswahlliste des Felds **Art** eines Belegs | HR-Administratoren, Stammdatenadministratoren: anlegen, umbenennen, löschen |
| Übernachtungsarten, Berechnungsmethoden, Vergütungsarten, Verkehrsmittel-Arten | Auswahllisten in den Formularen | HR-Administratoren, Stammdatenadministratoren: nur umbenennen |

Sätze und Wertelisten dürfen alle lesen.

## Globale Einstellungen

Der Abschnitt **Reisekosten** in den globalen Einstellungen gilt für alle Benutzer des Mandanten.

| Einstellung | Vorgabe | Bedeutung |
|---|---|---|
| **Heimatland für Reisekosten** | Österreich | Das Inland. Zeit im Ausland ist Zeit außerhalb dieses Landes. |
| **Standard-Berechnungsmethode** | Kalendertag (00–24 Uhr) | Berechnungsmethode für neue Reisen. Jede Reise kann eine andere verwenden. |
| **Mindeststunden für Diäten** | 3 | Eine Reise muss länger dauern, um Diäten zu erhalten. |
| **Auslandsabzug ab gestellten Mahlzeiten** | 2 | Anzahl gestellter Mahlzeiten pro Tag, ab der der Abzug im Ausland greift. |
| **Inlandsabzug Frühstück** | 0 € | Abzug für ein gestelltes Frühstück an einem Inlandstag. |
| **Inlandsabzug Mittagessen** | 15 € | Abzug für ein gestelltes Mittagessen an einem Inlandstag. |
| **Inlandsabzug Abendessen** | 15 € | Abzug für ein gestelltes Abendessen an einem Inlandstag. |

Ein Benutzer kann ein anderes Heimatland haben, etwa ein Mitarbeiter einer deutschen Niederlassung: Setzen Sie dafür **Heimatland für Reisekosten (abweichend)** in den Benutzerdetails. Mindeststunden und Mahlzeitenabzüge kommen weiterhin aus den globalen Einstellungen.

## Diätensätze

Jeder Satz hat ein **Land**, eine optionale **Region** (zum Beispiel *London* oder Grenzorte), das **Tagesgeld**, das **Nächtigungsgeld**, **Gültig ab** und **Gültig bis**. Mitarbeiter wählen einen Satz als Land oder Region jedes Aufenthalts.

time cockpit liefert die österreichischen Sätze für 2026 mit: 173 Sätze für 159 Länder und 14 Regionen, gültig ab 1.1.2026. Länder, die im Mandanten noch fehlen, werden angelegt. Sätze, die Sie geändert oder ergänzt haben, bleiben bei einem Update von time cockpit erhalten.

Die Liste hat einen Filter **Gültig am** (Vorgabe heute), der die an einem Datum gültigen Sätze zeigt. Für neue Sätze legen Sie Zeilen mit dem neuen **Gültig ab** an und setzen bei den alten **Gültig bis**.

> [!NOTE]
> Die Erfassungsseite bietet jeden Satz der Tabelle an, unabhängig von seinen Gültigkeitsdaten, und die Berechnung verwendet den Satz, den der Mitarbeiter gewählt hat.

## Kilometergeld

Das Kilometergeld hängt vom Verkehrsmittel eines Abschnitts ab. Im Formular eines Verkehrsmittels hat der Abschnitt **Kilometergeld** diese Felder:

| Feld | Bedeutung |
|---|---|
| **Vergütungsart** | **Keine** (Vorgabe; Kosten werden als Beleg erfasst), **Kilometergeld** (je Kilometer) oder **Pauschale je Abschnitt** (der Mitarbeiter gibt den Betrag am Abschnitt ein). |
| **Satz je Kilometer** | Euro je Kilometer, zum Beispiel 0,50 für einen privaten PKW. |
| **Zuschlag je Mitfahrer und Kilometer** | Wird für jeden Mitfahrer zum Satz addiert, zum Beispiel 0,15. |
| **Mindeststrecke (km)** | Abschnitte bis einschließlich dieser Strecke erhalten kein Kilometergeld. |
| **Art** | Auto, Bahn, Flugzeug, Bus, Fahrrad, Zu Fuß oder Sonstiges. Bestimmt das Symbol der Reise im Zeiterfassungskalender. |

Die Sätze je Kilometer sind nicht voreingestellt. Tragen Sie sie für jedes Verkehrsmittel ein, das Kilometergeld erhält.

## Wertelisten

Die Werte in den Auswahllisten der Reisekostenformulare sind als kleine Tabellen gespeichert. Sie stehen nicht im Menü; Sie öffnen sie über die Auswahlliste des Felds.

| Werteliste | Werte | Änderbar |
|---|---|---|
| Belegart | Hotel, Parken, Bahn/Bus, Flug, Taxi, Maut/Vignette, Bewirtung, Sonstiges | Anlegen, umbenennen, löschen |
| Übernachtungsart | Hotel mit Beleg, Pauschale, Gestellt / keine Kosten | Nur umbenennen |
| Berechnungsmethode | Kalendertag (00–24 Uhr), 24-Stunden-Zeitraum | Nur umbenennen |
| Vergütungsart | Keine, Kilometergeld, Pauschale je Abschnitt | Nur umbenennen |
| Verkehrsmittel-Art | Auto, Bahn, Flugzeug, Bus, Fahrrad, Zu Fuß, Sonstiges | Nur umbenennen |

Die Namen werden in der Sprache des Datenmodells des Mandanten (Deutsch oder Englisch) angelegt und nicht je Benutzer übersetzt. Die festen Wertelisten steuern die Berechnung, deshalb lassen sich ihre Werte weder anlegen noch löschen noch umcodieren.

## Rechenregeln

Die Beträge werden nach den österreichischen Regeln und mit den Sätzen und Einstellungen Ihres Mandanten berechnet.

### Zeit je Land

- Während eines Abschnitts zählt die Zeit bis zum Grenzübertritt zum Herkunftsland, die Zeit danach zum Zielland. Ohne Grenzübertritt zählt der ganze Abschnitt zum Herkunftsland.
- Der Aufenthalt nach einem Abschnitt zählt zu dessen Zielland, bis der nächste Abschnitt abfährt.

### Diäten

- Eine Reise erhält nur Diäten, wenn sie länger als die Mindeststunden (Vorgabe 3) dauert. Das gilt für die ganze Reise.
- Die Reise wird in Einheiten geteilt: Kalendertage (00–24 Uhr) oder 24-Stunden-Zeiträume ab der Abfahrt, je nach Berechnungsmethode.
- Jede Einheit erhält je angefangene Stunde ein Zwölftel des Tagesgelds, höchstens zwölf Zwölftel.
- Die Zwölftel gehen zuerst an die Auslandsländer, absteigend nach Stunden, je Land höchstens die dort angefangenen Stunden und zusammen höchstens die im Ausland angefangenen Stunden. Die übrigen Zwölftel werden zum Inlandssatz bezahlt.
- Verbringt die Reise insgesamt höchstens 3 Stunden im Ausland, wird jedes Zwölftel zum Inlandssatz bezahlt.

### Mahlzeiten

Der Abzug wird je Kalendertag berechnet:

- **Inlandstag** (keine Zeit im Ausland): die Beträge aus den globalen Einstellungen für jede gestellte Mahlzeit, standardmäßig 0 € für das Frühstück und je 15 € für Mittag- und Abendessen.
- **Tag mit Zeit im Ausland**: ab 2 gestellten Mahlzeiten zwei Drittel des Tagesgelds des Auslandslands mit den meisten Stunden an diesem Tag. Bei weniger gestellten Mahlzeiten wird nichts abgezogen.

Der Abzug wird von der Einheit abgezogen, die sich am stärksten mit dem Tag überschneidet, und übersteigt nie deren Diäten.

### Übernachtungen

Es zählt jede Nacht, deren Mitternacht innerhalb der Reise liegt. Bei **Pauschale** wird das Nächtigungsgeld des Landes zu Mitternacht bezahlt. **Hotel mit Beleg** und **Gestellt / keine Kosten** erhalten kein Nächtigungsgeld; die Hotelrechnung wird als Beleg erfasst.

### Summe

**Summe** = Diäten − Mahlzeitenabzug + Nächtigungsgeld + Kilometergeld + Belege.

Die Beträge werden exakt berechnet. Die Summen werden einmal aus den exakten Werten auf Cent gerundet.

### Wann die Beträge feststehen

Die Erfassungsseite rechnet live. Speichern, **Einreichen** und **Genehmigen** speichern die berechneten Beträge. Genehmigte und ausbezahlte Reisen werden nicht neu berechnet, spätere Änderungen an Sätzen oder Einstellungen wirken sich also nicht auf sie aus.

### Berechnungshinweise

Eine Reise kann nicht eingereicht werden, solange die Berechnung ein Problem meldet, zum Beispiel:

- Die Reise enthält keine Reiseabschnitte.
- Bei einem Reiseabschnitt fehlen Abfahrt oder Ankunft, oder die Ankunft liegt vor der Abfahrt.
- Die Abfahrt liegt vor der Ankunft des vorherigen Reiseabschnitts.
- Der Grenzübertritt liegt außerhalb des Reiseabschnitts.
- Bei einem Reiseabschnitt fehlt das Zielland, oder dafür ist kein gültiger Diätensatz hinterlegt.
- Bei einem Reiseabschnitt fehlt das Verkehrsmittel, oder bei einem Abschnitt mit Kilometergeld fehlt die Strecke.

## Verwandte Seiten

- [Reisekosten](~/doc/reisekosten/ueberblick.md)
- [Genehmigung und Auszahlung](~/doc/reisekosten/genehmigung-und-auszahlung.md)
- [Standardberechtigungen](~/doc/arbeitszeiterfassung/standardberechtigungen.md)
