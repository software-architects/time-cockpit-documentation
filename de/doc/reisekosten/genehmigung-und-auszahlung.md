---
title: Reisekosten - Genehmigung und Auszahlung
description: "Eingereichte Reisen genehmigen oder zurückweisen, genehmigte als ausbezahlt markieren, alle Reisen und nicht verrechnete Reisebelege prüfen. Preview."
en_page: doc/travel-expenses/approval-and-payout.md
---
# Reisekosten: Genehmigung und Auszahlung

> [!WARNING]
> Preview: Reisekosten sind eine Preview-Funktion. Die Menüeinträge erscheinen nur, wenn das Feature-Flag `APP_TravelExpensePreview` für Ihren Mandanten aktiviert ist. Zum Ausprobieren wenden Sie sich an [support@timecockpit.com](mailto:support@timecockpit.com).

Nachdem ein Mitarbeiter eine Reise eingereicht hat, genehmigt oder weist sie der Abteilungsleiter seiner Abteilung oder ein HR-Administrator zurück. HR zahlt die Reise dann aus und markiert sie als ausbezahlt. Wie Mitarbeiter Reisen erfassen und einreichen, steht unter [Reisekosten](~/doc/reisekosten/ueberblick.md).

## Wer was erledigt

| Aufgabe | Wer | Wo |
|---|---|---|
| Eingereichte Reise genehmigen oder zurückweisen | Abteilungsleiter für Benutzer der Abteilungen, die sie leiten, HR-Administratoren | **Verwaltung** → **Reisekosten** → **[Genehmigen](https://web.timecockpit.com/app/lists/APP_TravelExpenseReportApprovalList)** |
| Genehmigte Reise als ausbezahlt markieren | HR-Administratoren | **Verwaltung** → **Reisekosten** → **[Auszahlung](https://web.timecockpit.com/app/lists/APP_TravelExpenseReportPayoutList)** |
| Genehmigte Reisen für die Lohnverrechnung exportieren (Excel oder CSV) | HR-Administratoren | **Verwaltung** → **Reisekosten** → **[Lohnverrechnung (Export)](https://web.timecockpit.com/app/lists/APP_TravelExpensePayrollList)** |
| Alle Reisen prüfen | Alle, beschränkt auf die Reisen, die sie lesen dürfen (siehe unten) | **Verwaltung** → **Reisekosten** → **[Reisen](https://web.timecockpit.com/app/lists/entity/APP_TravelExpenseReport)** |
| Belege zur Weiterverrechnung an Kunden finden | Abrechnungsadministratoren, HR-Administratoren | **Verwaltung** → **Verrechnung** → **[Nicht verrechnete Reisebelege](https://web.timecockpit.com/app/lists/APP_UnbilledTravelReceiptList)** |

Mit Standardberechtigungen steht die Liste **Genehmigen** Abteilungsleitern und HR-Administratoren zur Verfügung, die Listen **Auszahlung** und **Lohnverrechnung (Export)** nur HR-Administratoren.

## Eine Reise genehmigen oder zurückweisen

Die Liste **Genehmigen** zeigt alle eingereichten Reisen, die Sie lesen dürfen, die neuesten zuerst, mit Benutzer, Reisezweck, Projekt, Beginn, Ende, Status, Diäten, Kilometergeld, Belegen und Summe. Filtern Sie nach Benutzer, Abteilung, Projekt oder einem Zeitraum für den Beginn der Reise.

Jede Zeile bietet diese Aktionen:

| Aktion | Wirkung |
|---|---|
| **Reise genehmigen** | Berechnet die Reise neu, setzt den Status auf **Genehmigt** und speichert Sie als Genehmiger mit dem Zeitpunkt der Genehmigung. |
| **Reise zurückweisen** | Setzt den Status auf **Zurückgewiesen**. Geben Sie die **Begründung der Zurückweisung** ein; der Mitarbeiter sieht sie in der Benachrichtigung und an der Reise. Der Mitarbeiter kann die Reise ändern und erneut einreichen. |
| **Reisekostenabrechnung als PDF downloaden** | Öffnet die Reise zur Prüfung als PDF. |

Abteilungsleiter können nur Reisen von Benutzern der Abteilungen genehmigen und zurückweisen, die sie leiten. HR-Administratoren können jede Reise genehmigen und zurückweisen.

## Eine Reise als ausbezahlt markieren

Die Liste **Auszahlung** zeigt alle genehmigten Reisen, die neuesten zuerst, mit Benutzer, Reisezweck, Projekt, Beginn, Ende, Diäten, Kilometergeld, Belegen und Summe und mit denselben Filtern wie die Liste **Genehmigen**. Zahlen Sie die Summe über Ihre Lohnverrechnung oder Bank aus und wählen Sie dann in der Zeile **Reise als ausbezahlt markieren**. Der Status wechselt auf **Ausbezahlt**, und der Zeitpunkt der Auszahlung wird gespeichert.

Um die Beträge vorher an die Lohnverrechnung zu übergeben, verwenden Sie den [Export für die Lohnverrechnung](#export-für-die-lohnverrechnung).

## Export für die Lohnverrechnung

Die Liste **Lohnverrechnung (Export)** bereitet die genehmigten Reisen für Ihre Lohnverrechnung auf, eine Zeile je Reise, sortiert nach Mitarbeiter und Reiseende. Standardmäßig zeigt sie die Reisen, die genehmigt, aber noch nicht als ausbezahlt markiert sind, also die Reisen für den nächsten Abrechnungslauf. Wählen Sie **Auch ausbezahlte Reisen**, um bereits ausbezahlte Reisen dazuzunehmen.

| Spalte | Inhalt |
|---|---|
| **Personalnummer**, **Benutzer**, **Abteilung** | Der Mitarbeiter; die Personalnummer kommt aus den Benutzerdetails. |
| **Zweck**, **Beginn**, **Ende** | Die Reise. |
| **Status**, **Genehmigt am (UTC)**, **Ausbezahlt am (UTC)** | Genehmigt oder ausbezahlt, mit den Zeitpunkten. |
| **Diäten**, **Mahlzeitenabzug**, **Diäten nach Abzug** | Die Diäten vor und nach dem Abzug für gestellte Mahlzeiten. |
| **Nächtigungsgeld**, **Kilometergeld**, **Belege** | Die übrigen Teile der Auszahlung, damit Sie jeden einer Lohnart zuordnen können. |
| **Summe** | Der Auszahlungsbetrag der Reise. |

Filtern Sie nach Benutzer, Abteilung oder einem Zeitraum für das Reiseende (**Reiseende von**, **Reiseende bis**). Wählen Sie dann in der Symbolleiste der Liste **Export** und **Excel Export** oder **CSV Export**; die Datei enthält die Zeilen und Spalten wie angezeigt.

Ein typischer Abrechnungslauf: genehmigte Reisen des Monats exportieren, in die Lohnverrechnung übernehmen, dann die Reisen in **Auszahlung** als ausbezahlt markieren. Danach erscheinen sie nicht mehr in der Standardansicht des Exports.

> [!NOTE]
> Die Beträge folgen den österreichischen Diätensätzen Ihres Mandanten. Ob ein Teil steuerfrei oder steuerpflichtig ist, entscheidet Ihre Lohnverrechnung; der Export teilt die Beträge nicht nach steuerlicher Behandlung auf. Eine direkte Schnittstelle zu einem Lohnverrechnungsprogramm oder eine Bankdatei gibt es nicht.

## Benachrichtigungen

| Ereignis | Wer benachrichtigt wird |
|---|---|
| Eine Reise wird eingereicht | Alle Abteilungsleiter der Abteilung des Mitarbeiters, mit einem Link auf die Liste **Genehmigen** |
| Eine Reise wird genehmigt | Der Mitarbeiter |
| Eine Reise wird zurückgewiesen | Der Mitarbeiter, mit der Begründung |
| Eine Reise wird als ausbezahlt markiert | Der Mitarbeiter |

Niemand wird über die eigene Aktion benachrichtigt. Wird eine Reise genehmigt oder zurückgewiesen, werden die offenen Genehmigungsbenachrichtigungen dazu entfernt. Hat die Abteilung des Mitarbeiters keinen Abteilungsleiter, erhält niemand die Genehmigungsbenachrichtigung; HR findet die Reise dann in der Liste **Genehmigen**.

## Alle Reisen

**Reisen** listet alle Reisen, die Sie lesen dürfen, unabhängig vom Status. Filtern Sie nach Benutzer, Abteilung, Projekt, Reisezweck oder einem Zeitraum für den Beginn der Reise. Jede Zeile hat einen PDF-Link.

| Rolle | Sichtbare Reisen |
|---|---|
| Mitarbeiter | Die eigenen Reisen |
| Abteilungsleiter | Die eigenen Reisen und die der Benutzer der Abteilungen, die sie leiten |
| HR-Administratoren, Abrechnungsadministratoren, Projektcontroller | Alle Reisen |

Ändern können eine Reise nur der Mitarbeiter (solange sie ein Entwurf oder zurückgewiesen ist) und HR-Administratoren. Status, Beträge, Genehmiger und Zeitstempel setzen ausschließlich die Aktionen.

## Nicht verrechnete Reisebelege

Belege, die der Mitarbeiter mit **Weiterverrechnen** markiert hat und die noch keiner Rechnungsposition zugeordnet sind, erscheinen unter **Nicht verrechnete Reisebelege**, mit Datum, Art, Beschreibung, Betrag, Reisezweck, Benutzer und Projekt. Filtern Sie nach Kunde, Projekt, Benutzer oder einem Zeitraum für das Belegdatum.

> [!NOTE]
> Die automatische Übernahme dieser Belege in eine Rechnung ist für eine spätere Version geplant. Bis dahin fügen Sie sie von Hand zur Rechnung des Kunden hinzu.

## Wenn eine Aktion fehlschlägt

| Meldung | Ursache |
|---|---|
| Sie dürfen diese Reise nicht bearbeiten. | Sie sind weder Abteilungsleiter der Abteilung des Mitarbeiters noch HR-Administrator (bzw. bei **Reise als ausbezahlt markieren** kein HR-Administrator). |
| Die Reise hat nicht den passenden Status für diese Aktion. | Nur eingereichte Reisen können genehmigt oder zurückgewiesen werden, nur genehmigte Reisen können als ausbezahlt markiert werden. |

## Verwandte Seiten

- [Reisekosten](~/doc/reisekosten/ueberblick.md)
- [Einstellungen, Diätensätze und Rechenregeln](~/doc/reisekosten/einstellungen-diaetensaetze-und-rechenregeln.md)
- [Abteilungsleiter-FAQ](~/doc/abteilungsleiter-faq.md)
- [HR-Administrator-FAQ](~/doc/hr-administrator-faq.md)
