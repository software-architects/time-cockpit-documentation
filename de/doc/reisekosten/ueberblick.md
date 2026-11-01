---
title: Reisekosten - Dienstreisen erfassen
description: "Dienstreisen in time cockpit mit Reiseverlauf, Mahlzeiten, Übernachtungen und Belegen erfassen, Diäten live berechnen, als PDF ausgeben und einreichen."
en_page: doc/travel-expenses/overview.md
---
# Reisekosten

> [!WARNING]
> Preview: Reisekosten sind eine Preview-Funktion. Die Menüeinträge, die Reisekostenseiten und die Reisen im Zeiterfassungskalender erscheinen nur, wenn das Feature-Flag `APP_TravelExpensePreview` für Ihren Mandanten aktiviert ist. Zum Ausprobieren wenden Sie sich an [support@timecockpit.com](mailto:support@timecockpit.com). Bezeichnungen und Verhalten können sich noch ändern.

Mit den Reisekosten erfassen Mitarbeiter jede Dienstreise als eigene Reisekostenabrechnung: den Reiseverlauf mit Abfahrt, Ankunft und Grenzübertritten, die Mahlzeiten und Übernachtungen je Tag und die Belege. time cockpit berechnet Diäten, Mahlzeitenabzug, Nächtigungsgeld und Kilometergeld nach den österreichischen Regeln schon während der Eingabe. Sie reichen die Reise ein, Ihr Abteilungsleiter genehmigt sie, und HR markiert sie als ausbezahlt.

Unterstützt werden nur die österreichischen Regeln. HR exportiert genehmigte Reisen als Excel oder CSV für die Lohnverrechnung und hält die Auszahlung als Status fest; siehe [Export für die Lohnverrechnung](~/doc/reisekosten/genehmigung-und-auszahlung.md#export-für-die-lohnverrechnung).

## Wo Sie die Reisekosten finden

| Menüeintrag | Was er öffnet | Wer ihn verwendet |
|---|---|---|
| **Benutzer** → **Meine Reisekosten** → **[Meine Reisen](https://web.timecockpit.com/app/travel-expenses)** | Ihre Reisen mit gespeicherten Beträgen und Status | Alle Mitarbeiter |
| **Benutzer** → **Meine Reisekosten** → **[Neue Reise](https://web.timecockpit.com/app/travel-expenses/new)** | Eine leere Reise auf der Erfassungsseite | Alle Mitarbeiter |
| **Verwaltung** → **Reisekosten** | Listen für alle Reisen, Genehmigung, Auszahlung und Diätensätze | Abteilungsleiter, HR-Administratoren; siehe [Genehmigung und Auszahlung](~/doc/reisekosten/genehmigung-und-auszahlung.md) |

## Meine Reisen

**Meine Reisen** listet Ihre eigenen Reisen, die neuesten zuerst, mit Beginn, Reisezweck, Route, Projekt, Diäten, Kilometergeld, Belegen, Summe und Status. Über der Liste sehen Sie die Summe der Reisen, die zur Auszahlung offen sind (eingereicht oder genehmigt), und die bereits ausbezahlte Summe. Klicken Sie auf eine Reise, um sie zu öffnen, oder wählen Sie **Neu**, um eine neue zu erfassen.

## Eine Reise erfassen

Die Erfassungsseite zeigt alles auf einer Seite. Das Ergebnis rechts wird nach jeder Änderung neu berechnet, mit den Diätensätzen und Einstellungen Ihres Mandanten. Pflichtfelder sind hervorgehoben.

### Allgemein

- **Reisezweck** (Pflicht), zum Beispiel *Workshop beim Kunden*.
- **Projekt** (optional). Ein Projekt ist nötig, wenn Sie Belege an den Kunden weiterverrechnen möchten.
- **Berechnungsmethode**: **Kalendertag (00–24 Uhr)** oder **24-Stunden-Zeitraum**. Neue Reisen beginnen mit dem Standard aus den [Einstellungen](~/doc/reisekosten/einstellungen-diaetensaetze-und-rechenregeln.md#globale-einstellungen).
- **Beginn** und **Ende** ergeben sich aus dem Reiseverlauf.

### Reiseverlauf

Der Reiseverlauf ist eine Folge von Aufenthalten, ein Aufenthalt pro Ort. Eine neue Reise beginnt als Hin- und Rückreise ab dem Heimatland Ihres Mandanten: Geben Sie den Startort ein, dann jedes Ziel mit seinem Land oder seiner Region. Das Land bestimmt den Diätensatz. Mit **Aufenthalt einfügen** fügen Sie ein Ziel hinzu, mit **Aufenthalt entfernen** löschen Sie eines.

Für jeden Abschnitt zwischen zwei Aufenthalten geben Sie ein:

| Feld | Beschreibung |
|---|---|
| **Abfahrt**, **Ankunft** | Datum und Uhrzeit. Die Ankunft muss nach der Abfahrt liegen, und ein Abschnitt kann nicht vor der Ankunft des vorherigen abfahren. |
| **Grenzübertritt** | Datum und Uhrzeit des Grenzübertritts. Nur nötig, wenn das Land wechselt; sonst zeigt die Seite *kein Länderwechsel*. |
| **Verkehrsmittel** | Bestimmt, wie der Abschnitt vergütet wird (siehe unten). |
| **Strecke (km)**, **Mitfahrer/innen** | Erscheinen bei Verkehrsmitteln mit Kilometergeld. |
| **Pauschale (€)** | Erscheint bei Verkehrsmitteln mit einer Pauschale je Abschnitt. |

Ob ein Verkehrsmittel Kilometergeld, eine Pauschale oder nichts erhält, ist beim Verkehrsmittel festgelegt; siehe [Kilometergeld](~/doc/reisekosten/einstellungen-diaetensaetze-und-rechenregeln.md#kilometergeld). Kosten anderer Verkehrsmittel, etwa ein Bahnticket, erfassen Sie als Beleg.

### Reisetage

Die Reisetage ergeben sich aus Abfahrt und Ankunft im Reiseverlauf. Für jeden Tag markieren Sie die gestellten Mahlzeiten (**Frühstück**, **Mittag**, **Abend**) und wählen die Übernachtung für die Nacht nach diesem Tag:

| Übernachtung | Wirkung |
|---|---|
| **Hotel mit Beleg** | Kein Nächtigungsgeld; die Hotelrechnung erfassen Sie als Beleg. Das ist die Vorgabe. |
| **Pauschale** | Das Nächtigungsgeld des Landes, in dem Sie sich um Mitternacht befinden. |
| **Gestellt / keine Kosten** | Für diese Nacht wird nichts bezahlt. |

Gestellte Mahlzeiten kürzen die Diäten. Der Abzug und die angewendete Regel werden je Tag angezeigt; siehe [Mahlzeiten](~/doc/reisekosten/einstellungen-diaetensaetze-und-rechenregeln.md#mahlzeiten).

### Belege

Wählen Sie **Neuer Beleg** und geben Sie Datum, Art, Beschreibung und Betrag ein. Mit **Anhängen** fügen Sie den eingescannten Beleg oder die Rechnung als Datei hinzu, mit **Ersetzen** tauschen Sie sie aus. Markieren Sie **Weiterverrechnen** bei Belegen, die Sie dem Kunden verrechnen möchten; dafür braucht die Reise ein Projekt.

### Zeitbuchungen im Zeitraum

Dieser Abschnitt zeigt Ihre Zeitbuchungen während der Reise zur Information. Die Reise hängt nicht von ihnen ab.

### Ergebnis

Das Ergebnis zeigt den **Auszahlungsbetrag** und seine Teile: Diäten, Mahlzeitenabzug, Nächtigungsgeld, Kilometergeld und Pauschalen sowie Belege, dazu den Anteil, der an den Kunden weiterverrechnet werden kann. Darunter sehen Sie die Diäten je Kalendertag oder je 24-Stunden-Zeitraum mit den Zwölfteln je Land und das Kilometergeld je Abschnitt. Fehlen Angaben, listet das Ergebnis statt eines Betrags, was noch zu ergänzen ist. Wie die Beträge berechnet werden, steht unter [Rechenregeln](~/doc/reisekosten/einstellungen-diaetensaetze-und-rechenregeln.md#rechenregeln).

## Abschnitte aus Zeitbuchungen übernehmen

Wenn Sie Reisen auf Ihren Zeitbuchungen erfassen (Abreiseort, Zielort, Verkehrsmittel), wählen Sie **Aktionen** → **Aus Zeitbuchungen übernehmen**. Der Dialog listet die Zeitbuchungen mit Reiseangaben; Buchungen, die schon zu einer Reise gehören, sind markiert. Jede ausgewählte Buchung wird ein Abschnitt mit ihrem Beginn als Abfahrt und ihrem Ende als Ankunft. Prüfen Sie danach Land und Grenzübertritt. Die Reise bleibt von der Zeitbuchung unabhängig; der Abschnitt merkt sich nur, woher er stammt.

## Speichern, PDF erstellen und einreichen

| Schaltfläche | Wirkung |
|---|---|
| **Speichern**, **Speichern und schließen** | Speichert die Reise mit Abschnitten, Tagen und Belegen und legt die berechneten Beträge ab. |
| **PDF** (oder **Aktionen** → **PDF erstellen**) | Erstellt die Reisekostenabrechnung als PDF: Mitarbeiter, Reisezweck, Ergebnis, Reiseverlauf, Diäten je Einheit und Land, Kilometergeld, Belege, Reisetage, Status und Unterschriftszeilen. |
| **Einreichen** | Berechnet die Reise neu und schickt sie Ihrem Abteilungsleiter zur Genehmigung. Nur möglich, wenn die Berechnung keine Probleme meldet. |
| **Aktionen** → **Löschen** | Löscht einen Entwurf mit Abschnitten, Tagen und Belegen. |

Nach dem Einreichen ist die Reise schreibgeschützt. Wird sie zurückgewiesen, können Sie sie ändern und erneut einreichen.

## Status einer Reise

| Status | Bedeutung | Kann der Mitarbeiter sie ändern? |
|---|---|---|
| **Entwurf** | Erfasst, noch nicht eingereicht | Ja |
| **Eingereicht** | Wartet auf Genehmigung | Nein |
| **Zurückgewiesen** | Mit Begründung zurückgegeben | Ja, danach erneut einreichen |
| **Genehmigt** | Vom Abteilungsleiter oder von HR genehmigt | Nein |
| **Ausbezahlt** | Von HR als ausbezahlt markiert | Nein |

Sie erhalten eine Benachrichtigung, wenn Ihre Reise genehmigt, zurückgewiesen (mit Begründung) oder ausbezahlt wird. Die Beträge werden beim Einreichen und beim Genehmigen neu berechnet. Genehmigte und ausbezahlte Reisen werden nicht neu berechnet, auch wenn sich Sätze später ändern.

## Reisen im Zeiterfassungskalender

Der [Zeiterfassungskalender](~/doc/zeiterfassungskalender/kalender.md) zeigt jede Reise des angezeigten Benutzers als Balken in der Ganztageszeile über ihre Reisetage, mit Verkehrsmittel, Reisezweck, Route, Summe und Status. Die Farbe zeigt den Status. Ein Klick auf den Balken öffnet die Reise. Im Kalender lassen sich Reisen weder anlegen noch verschieben.

## Verwandte Seiten

- [Genehmigung und Auszahlung](~/doc/reisekosten/genehmigung-und-auszahlung.md)
- [Einstellungen, Diätensätze und Rechenregeln](~/doc/reisekosten/einstellungen-diaetensaetze-und-rechenregeln.md)
- [MCP-Server: Reisekosten-Tools](~/doc/mcp/ueberblick.md#reisekosten-tools)
- [Zeiterfassungskalender](~/doc/zeiterfassungskalender/kalender.md)
