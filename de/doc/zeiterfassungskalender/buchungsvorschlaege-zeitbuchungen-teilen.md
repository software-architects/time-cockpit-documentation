---
title: Buchungsvorschläge - Zeitbuchungen teilen
description: Teilen Sie bestehende Zeitbuchungen als Vorschläge mit Kollegen. Empfänger können sie prüfen, annehmen (Zeitbuchung anlegen) oder ablehnen.
en_page: doc/timesheet-calendar/timesheet-suggestions-share-timesheet.md
---

# Buchungsvorschläge / Zeitbuchungen teilen

time cockpit enthält die Funktion **Buchungsvorschläge**, mit der Sie **eine oder mehrere bestehende Zeitbuchungen** mit anderen Benutzern teilen.
Die geteilten Einträge erscheinen beim Empfänger als **Vorschläge** im Zeiterfassungskalender. Der Empfänger kann einen Vorschlag dann **annehmen** (dadurch wird eine neue Zeitbuchung auf Basis der geteilten Vorlage angelegt) oder **ablehnen**.

## Anwendungsfall

Ein typisches Szenario:

- Ein Berater erfasst Zeiten auf einen bestimmten Kunden, ein Projekt und eine Tätigkeit.
- Ein Kollege hat am selben Arbeitspaket gearbeitet und soll seine Zeit ähnlich buchen, ist sich aber über den richtigen Umfang, die Beschreibung oder die Dauer nicht sicher.
- Statt eine lange Erklärung per Chat oder E-Mail zu schicken, **teilt der Berater eine bestehende Zeitbuchung** als Vorschlag.
- Der Kollege prüft den Vorschlag direkt im Kalender und **nimmt ihn an** (bei Bedarf passt er die Details vor dem Speichern an).

So vereinheitlichen Teams ihre Buchungen und sparen sich Rückfragen.

## Überblick

Buchungsvorschläge bestehen aus zwei Teilen:

- **Teilen**: Ein Absender teilt ausgewählte Zeitbuchungen mit einer kurzen Nachricht mit einem oder mehreren Empfängern.
- **Prüfen**: Empfänger sehen die Vorschläge in ihrem Zeiterfassungskalender und können
  - sie **bearbeiten und akzeptieren** (legt eine neue Zeitbuchung auf Basis des Vorschlags an) oder
  - sie **ablehnen** (markiert den Vorschlag als abgelehnt).

Vorschläge werden als Datensätze in `APP_TimesheetSuggestion` gespeichert. Sie enthalten eine serialisierte Momentaufnahme der ursprünglichen Zeitbuchung sowie Absender und Empfänger, Nachricht und Zeitraum.

## Wichtige Funktionen

### Ausgewählte Zeitbuchungen teilen

- Wenn die Funktion aktiviert ist, steht die Aktion zum Teilen in der Symbolleiste des Zeiterfassungskalenders zur Verfügung.
- Sie können **mehrere ausgewählte** Zeitbuchungen in einem Schritt teilen.
- Sie müssen angeben:
  - **Empfänger** (ein oder mehrere aktivierte, nicht ausgeblendete Benutzer; sich selbst können Sie nicht auswählen)
  - **Nachricht an Empfänger** (Pflichtfeld; maximal 100 Zeichen)

### Vorschläge erscheinen als Kalendereinträge

- Vorschläge werden im Zeiterfassungskalender des Empfängers im passenden Zeitraum angezeigt.
- Sie erscheinen als **schreibgeschützte** Einträge mit Absender und Nachricht (z. B. „Suggestion by …“).

### Vorschlag annehmen

- Der Empfänger kann **Vorschlag bearbeiten und akzeptieren** wählen.
- time cockpit öffnet das normale Formular für Zeitbuchungen mit **vorbelegten Werten** aus der geteilten Zeitbuchung.
- Sobald der Empfänger die Zeitbuchung speichert, wird der Vorschlag als **angenommen** markiert.

### Vorschlag ablehnen

- Der Empfänger kann **Vorschlag ablehnen** wählen.
- Ein Bestätigungsdialog wird angezeigt.
- Der Vorschlag wird als **abgelehnt** markiert.

### Benachrichtigungen (wenn vom Tenant unterstützt)

Wenn Ihr Tenant Systembenachrichtigungen unterstützt und Buchungsvorschläge aktiviert sind, fügt time cockpit einen eigenen Benachrichtigungsanbieter für Buchungsvorschläge hinzu.
Je nach Einrichtung Ihrer Benachrichtigungen können neue Vorschläge auch in Ihren Benachrichtigungen (Glockensymbol) erscheinen.

## Voraussetzungen und Abhängigkeiten

Um Zeitbuchungen teilen bzw. Buchungsvorschläge zu verwenden, müssen alle folgenden Bedingungen erfüllt sein:

1. **In den Globalen Einstellungen aktiviert**
   - Die Einstellung `Zeitbuchungsvorschläge aktivieren` in den Globalen Einstellungen muss `true` sein.
2. **Zugriff auf den Zeiterfassungskalender**
   - Benutzer brauchen die Berechtigung, Zeitbuchungen im Zeiterfassungskalender anzuzeigen und anzulegen.

> [!NOTE]
> Ist die Funktion nicht installiert oder nicht aktiviert, stehen die Schaltfläche **Teilen** und die zugehörigen Elemente der Oberfläche nicht zur Verfügung.

## Buchungsvorschläge aktivieren (Globale Einstellungen)

1. Öffnen Sie **Globale Einstellungen**:
   - Typische URL: https://web.timecockpit.com/app/forms/entity/APP_GlobalSettings
2. Suchen Sie die Einstellung **Zeitbuchungsvorschläge aktivieren** (technischer Name `APP_TimesheetSuggestionsEnabled`).
3. Setzen Sie sie auf **aktiviert/true**.
4. Laden Sie die Web-App neu.

![Buchungsvorschläge in den Globalen Einstellungen aktivieren](/doc/timesheet-calendar/images/enable-timesheet-suggestions.png "Buchungsvorschläge in den Globalen Einstellungen aktivieren")

> [!TIP]
> Wenn Sie die Einstellung im Formular der Globalen Einstellungen nicht sehen, ist sie möglicherweise nicht in Ihrer aktuellen Anpassung dieses Formulars enthalten.
> In diesem Fall müssen Sie die Eigenschaft `APP_TimesheetSuggestionsEnabled` zu Ihrer Formularanpassung der Globalen Einstellungen hinzufügen.

## So verwenden Sie die Funktion

### Zeitbuchung teilen (Absender)

1. Öffnen Sie den **Zeiterfassungskalender**.
2. Wählen Sie eine oder mehrere bestehende Zeitbuchungen aus.
3. Verwenden Sie eine dieser Möglichkeiten:
   - Klicken Sie in der Symbolleiste auf **Teilen** (Teilen-Symbol).
   - Verwenden Sie den Kontextmenüeintrag **Teilen**.
   - Tastenkürzel: `STRG + M`.

   ![Schaltfläche Teilen in der Symbolleiste (mehrere Einträge teilen)](/doc/timesheet-calendar/images/share-multiple-timesheet-entries-with-menu-button.png "Schaltfläche Teilen in der Symbolleiste")

4. Im Dialog zum Teilen:
   - Wählen Sie einen oder mehrere **Empfänger**.
   - Geben Sie eine **Nachricht an Empfänger** ein.
5. Bestätigen Sie mit **Teilen**.

![Zeitbuchungen mit anderen Benutzern teilen](/doc/timesheet-calendar/images/share-with-other-users.png "Zeitbuchungen mit anderen Benutzern teilen")

Nach dem Teilen zeigt time cockpit eine Bestätigung an, etwa:

- „Timesheet entry \"…\" has been shared.“

Wenn Benachrichtigungen in Ihrem Tenant aktiviert sind, erhalten die Empfänger möglicherweise auch eine Benachrichtigung über den neuen Vorschlag.

![Benachrichtigung über einen Buchungsvorschlag](/doc/timesheet-calendar/images/share-timesheet-suggestion-notification.png "Benachrichtigung über einen Buchungsvorschlag")

### Vorschläge prüfen (Empfänger)

1. Öffnen Sie den **Zeiterfassungskalender**.
2. Wechseln Sie zu dem Tag bzw. der Woche mit dem vorgeschlagenen Zeitraum.
3. Vorschläge erscheinen als Kalendereinträge mit Absender und Nachricht.

### Annehmen (echte Zeitbuchung anlegen)

1. Klicken Sie auf den Vorschlag.
2. Wählen Sie **Vorschlag bearbeiten und akzeptieren** (oder doppelklicken Sie einfach auf den Vorschlag).
3. Prüfen Sie die vorbelegten Werte und passen Sie sie bei Bedarf an.
4. Speichern Sie die Zeitbuchung.

![Vorschlag bearbeiten und akzeptieren](/doc/timesheet-calendar/images/share-timesheet-edit-or-accept.png "Vorschlag bearbeiten und akzeptieren")

Der Vorschlag wird dann als angenommen markiert und nicht mehr als offener Vorschlag angezeigt.

### Ablehnen

1. Klicken Sie auf den Vorschlag.
2. Wählen Sie **Vorschlag ablehnen**.
3. Bestätigen Sie den Dialog.

Der Vorschlag wird als abgelehnt markiert und nicht mehr als offener Vorschlag angezeigt.

## Hinweise und Einschränkungen

- Vorschläge werden nur angezeigt, wenn sie **weder angenommen noch abgelehnt** sind.
- Vorschläge werden für den **aktuell ausgewählten Benutzer** und den **aktuell sichtbaren Zeitraum** im Kalender geladen.
- Die Empfängerliste enthält aktivierte, nicht ausgeblendete Benutzer, ausgenommen den aktuellen Benutzer.
- Die Nachricht ist auf **100 Zeichen** begrenzt.
