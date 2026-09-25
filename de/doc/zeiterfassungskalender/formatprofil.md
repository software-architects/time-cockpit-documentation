---
title: Formatprofile - Kalender anpassen
description: "Passen Sie die Kalenderanzeige in time cockpit mit Formatprofilen an: bedingte Formatierung, Farben, Texte und Balkendiagramme für Zeitbuchungen."
en_page: doc/timesheet-calendar/formatting-profiles.md
---
# Formatprofile

Der grafische Kalender von time cockpit soll Ihnen auf einen Blick zeigen, womit Sie Ihre Zeit verbracht haben. Mit Formatprofilen definieren Sie bedingte Formatierungsregeln, die steuern, wie Zeitbuchungen im grafischen Kalender dargestellt werden. Sie können festlegen, welchen Text time cockpit in der Kopf- und Fußzeile von Zeitbuchungen im Kalender anzeigt. Außerdem können Sie die Hintergrundfarbe von Zeitbuchungen definieren. Einige Beispiele für Situationen, in denen bedingte Formatierung nützlich sein kann:

- Verrechenbare und nicht verrechenbare Zeitbuchungen in zwei verschiedenen Farben anzeigen, um schnell ein visuelles Feedback zum Anteil der verrechenbaren Zeit zu bekommen.
- Unvollständige Zeitbuchungen (z. B. Einträge ohne Projektzuordnung) rot anzeigen. So finden Sie sie am Monatsende leicht, wenn Sie Ihre Zeiterfassung vervollständigen müssen.
- Alle Zeitbuchungen, deren Beschreibung das Wort "Reise" enthält, in einer bestimmten Farbe anzeigen. Wenn Sie Ihre Reisekostenabrechnungen erstellen, finden Sie die Zeitbuchungen zu Reisen so ganz einfach.

Während die bedingte Formatierung einzelner Zeitbuchungen sofort Feedback zum Status jedes einzelnen Eintrags gibt, brauchen Sie vielleicht auch einen Überblick über die Struktur Ihrer Arbeit für einen ganzen Tag, eine Woche oder einen Monat. time cockpit bietet diesen Überblick im Navigationsbereich des Kalenders. Auf Basis der bedingten Formatierungsregel für die Hintergrundfarben erhalten Sie ein Balkendiagramm, das die Verteilung Ihrer Arbeit zeigt. Die im Balkendiagramm verwendete Kennzahl (KPI, Key Performance Indicator) ist anpassbar. Für die Formel der Kennzahl können Sie jedes numerische Feld von Zeitbuchungen verwenden (z. B. Dauer in Stunden, Umsatz). Einige Beispiele für Situationen, in denen Sie die Balkendiagramme nutzen können:

- Sie möchten wissen, für welche Projekte Sie in einer bestimmten Woche die meiste Zeit aufgewendet haben? time cockpit kann ein Balkendiagramm mit den gesamten Arbeitsstunden pro Projekt anzeigen.
- Sie möchten die Anzahl der verrechenbaren und der nicht verrechenbaren Stunden kennen? time cockpit kann ein Balkendiagramm mit zwei Balken anzeigen: verrechenbare Stunden und nicht verrechenbare Stunden.
- Sie möchten einen Überblick, wie viel Umsatz Sie in einem bestimmten Monat mit jedem Kunden erzielt haben? time cockpit kann ein Balkendiagramm mit dem Umsatz pro Kunde anzeigen.

## Formatprofile im Zeiterfassungskalender

Formatprofile beeinflussen drei Bereiche im Zeiterfassungskalender:

- Im Navigationsbereich (links) sehen Sie die oben erwähnten Balkendiagramme, konfigurieren die Formatprofile und wählen das aktuell aktive Profil aus.
- Im Hauptbereich des Kalenders legt das aktive Formatprofil fest, wie time cockpit die Titel- und Fußzeilentexte sowie die Hintergrundfarbe von Zeitbuchungen erzeugt.
- Auch die Musterbuchungen im Navigationsbereich werden auf Basis des aktuell aktiven Formatprofils eingefärbt.

![Formatprofil für verrechenbare Zeiten](/doc/timesheet-calendar/images/wc-formatting-profile-billable.png "Formatprofil für verrechenbare Zeiten")

## Einstellungen von Formatprofilen

## Formatprofile bearbeiten

Die Einstellungen für Formatprofile konfigurieren Sie im Navigationsbereich links im Zeiterfassungskalender. Wählen Sie das Formatprofil aus, das Sie bearbeiten möchten, und klicken Sie auf das ✏️ **Symbol**.

![Formatprofil bearbeiten](/doc/timesheet-calendar/images/edit-formatting-profile.png "Formatprofil bearbeiten")

Der Konfigurationsdialog für Formatprofile besteht aus drei Bereichen:

- Allgemeine Einstellungen
- Kennzahl (für die Balkendiagramme)
- Farbeinstellungen

![Dialog zum Bearbeiten eines Formatprofils](/doc/timesheet-calendar/images/edit-formatting-profile-dialog.png "Dialog zum Bearbeiten eines Formatprofils")

## Allgemeine Einstellungen
In den allgemeinen Einstellungen von Formatprofilen können Sie Folgendes festlegen:

### Name

Beachten Sie, dass das Namensfeld einen Ausdruck enthalten kann. In diesem Fall muss es mit einem Gleichheitszeichen ("=") beginnen, um anzuzeigen, dass der Wert keine konstante Zeichenkette, sondern ein Ausdruck ist. In der Regel geben Sie im Namensfeld eine konstante Zeichenkette ein. Die einzige Ausnahme ist ein Name, der für jede Sprache anders lauten soll. In diesem Fall können Sie im Namensausdruck die Funktion :Translate verwenden.

### Ausdruck für die Fußzeile (optional) und Ausdruck für die Beschreibung (optional)

Geben Sie einen Ausdruck ein, der die Titel- und Fußzeilentexte einer Zeitbuchung im Kalender liefert. Mit Current greifen Sie auf die angezeigte Zeitbuchung zu. Sie können auf alle Eigenschaften und Beziehungen von APP_Timesheet zugreifen.

Beispiele:

- `Current.Description` zeigt die Beschreibung der Zeitbuchung im Kalender an
- `Current.Description + ' (' + Current.Project.Description + ')'` zeigt die Beschreibung der Zeitbuchung verkettet mit der Beschreibung des zugeordneten Projekts an

> [!NOTE]
> Die Beschreibung kann auch eine konstante Zeichenkette enthalten. In der Praxis verwenden Sie aber meist eine Formel.

### Ausdruck für die Gruppierung von Zeitbuchungen (optional)

Geben Sie einen Ausdruck ein, der eine Zeichenkette zurückgibt. time cockpit erzeugt für jeden eindeutigen Wert eine Zeile und berechnet dafür die aggregierte Kennzahl.

Beispiele:

- `:Iif(Current.Billable=True, 'Billable', 'Not Billable')`
- `:Current.Project.Description`
- `:Iif(Current.Billable=True, :Translate('FormattingProfile.Billable.Billable'), :Translate('FormattingProfile.Billable.NotBillable'))`

> [!NOTE]
> Geben Sie keinen Farbcode und keinen Farbnamen zurück. Die Farbe wird später in der Konfiguration zugewiesen (siehe unten). In diesem Schritt brauchen wir nur die Beschriftung der Zeile im Balkendiagramm. Wenn Sie mehrere Sprachen unterstützen müssen, können Sie die Funktion :Translate verwenden.

### Formatprofil anzeigen für

Wählen Sie einen bestimmten Benutzer aus (z. B. sich selbst), wenn das Formatprofil nur für diesen Benutzer angezeigt werden soll. Wenn Sie keinen Benutzer auswählen, steht das Formatprofil allen Benutzern des Kontos zur Verfügung.

## Bereich Kennzahl

Im Bereich Kennzahl legen Sie fest, welche Kennzahl im Balkendiagramm verwendet wird.

### Ausdruck für die Kennzahl

Geben Sie einen [Ausdruck](/doc/tcql/expression-language.html) für die Kennzahl ein, aus der das Balkendiagramm erzeugt wird. Mit `Current` greifen Sie auf die angezeigte Zeitbuchung zu. Sie können auf alle Eigenschaften und Beziehungen von `APP_Timesheet` zugreifen.

Die Kennzahl wird für alle eindeutigen Werte des Gruppierungsausdrucks (siehe oben) aggregiert. In unserem Beispiel (siehe Screenshots) werden die Zeitbuchungen in zwei Gruppen eingeteilt: verrechenbare und nicht verrechenbare Einträge. Als Kennzahl ist `APP_DurationInHours` angegeben. Sie erhalten daher im Diagramm zwei Balken, die die Anzahl der verrechenbaren und der nicht verrechenbaren Stunden zeigen.

Beispiele:

- `Current.APP_DurationInHours`
- `Current.APP_Revenue`

### Formatmuster für die Kennzahl

Geben Sie ein Formatmuster ein, mit dem die aggregierte Kennzahl angezeigt wird.

Beispiele:

- `#,##0.00 h`
- `#,##0 EUR`

### Kennzahl in Prozent anzeigen

Wenn Sie dieses Kontrollkästchen aktivieren, sehen Sie neben den Balken nicht den absoluten Wert der aggregierten Kennzahl, sondern den Prozentwert. Im Tooltip sehen Sie immer sowohl den Prozentwert als auch den absoluten Wert. Das Formatmuster (siehe oben) wird nur für den absoluten Wert verwendet.

### Geplante Arbeitszeit als Basis für den Prozentwert verwenden

Dieses Kontrollkästchen können Sie nur aktivieren, wenn Sie die Kennzahl in Prozent anzeigen. Es legt fest, dass die Basis des Prozentwerts nicht die Summe aller Kennzahlwerte ist, sondern die geplante Arbeitszeit für den ausgewählten Monat, die ausgewählte Woche oder das ausgewählte Jahr. Wenn Sie am dritten Arbeitstag eines Monats 27 Stunden gearbeitet haben und davon 24 verrechenbar sind, haben Sie 100 % verrechenbare Stunden, sofern Sie acht Stunden pro Tag arbeiten möchten. Wenn Sie die geplante Arbeitszeit nicht als Basis verwenden, haben Sie nur 88 % verrechenbare Stunden von 27 Stunden. Diese Option ist nur sinnvoll, wenn Sie eine Kennzahl verwenden, die Stunden liefert. Bei Kennzahlen wie `APP_Revenue`, die einen Geldbetrag liefern, wäre der berechnete Prozentwert nicht sinnvoll.

![Kennzahlen im Formatprofil](/doc/timesheet-calendar/images/formatting-profile-key-figures.png "Kennzahlen im Formatprofil")

## Farbeinstellungen

Im Bereich Farben weisen Sie den eindeutigen Werten des Gruppierungsausdrucks Farben zu. Sie müssen nicht für jeden Wert eine Farbe angeben. time cockpit wählt automatisch eine Farbe für jeden Wert, sobald es eine für den Kalender braucht. Die automatisch zugewiesenen Farben können sich bei jedem Start von time cockpit ändern. Wenn Sie für einen bestimmten Wert immer dieselbe Farbe erhalten möchten, müssen Sie sie manuell zuweisen.

![Farben im Formatprofil](/doc/timesheet-calendar/images/formatting-profile-colors-web.png "Farben im Formatprofil")
