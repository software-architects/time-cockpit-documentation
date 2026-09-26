---
title: Signal Tracker für gesendete E-Mails - Outlook
description: Zeichnen Sie in time cockpit mit Outlook gesendete E-Mails auf und erkennen Sie, wann Arbeitspakete fertig und an Kunden gesendet wurden.
en_page: doc/signal-tracker/sent-emails.md
---
# Signal Tracker für gesendete E-Mails

Der Signal Tracker für gesendete E-Mails zeichnet alle E-Mails auf, die mit Microsoft Office Outlook gesendet werden. Dieser Signal Tracker hilft Ihnen zu erkennen, wann Sie ein Arbeitspaket abgeschlossen und die Ergebnisse an Ihre Kunden oder Kollegen gesendet haben.

## Gesammelte Daten

Der Signal Tracker für gesendete E-Mails zeichnet alle E-Mails auf, die mit Microsoft Office Outlook gesendet werden. Andere E-Mail-Programme als Microsoft Office Outlook werden derzeit leider nicht unterstützt.

Wenn Sie den Signal Tracker beenden oder pausieren, zeichnet er keine in Microsoft Office Outlook gesendeten E-Mails auf.

Wenn Sie diesen Signal Tracker zum ersten Mal auf Ihrem Computer starten, importiert der Tracker alle E-Mails des aktuellen Tages. Danach zeichnet er alle neu gesendeten E-Mails auf. Gesendete E-Mails aus der Vergangenheit importiert der Tracker nicht.

## Konfigurationsparameter des Signal Trackers

Parametername | Datentyp | Beschreibung
--- | --- | ---
Abfrageintervall (IntervalValue) | Zeitspanne | Intervall, in dem der Signal Tracker in Microsoft Office Outlook nach neuen E-Mails sucht. Die Einstellung `00:05:00` legt fest, dass der Tracker alle 5 Minuten nach neuen E-Mails sucht. Kleinere Werte können die Leistung Ihres Computers verringern, größere Werte führen zu ungenaueren Werten. Wir empfehlen eine Zeitspanne von 5 Minuten.
E-Mail-Adressen abfragen (ResolveAddress) | Boolean | Legt fest, ob time cockpit die E-Mail-Adresse des Empfängers aus Microsoft Office Outlook auslesen soll. Wenn dieser Wert auf `True` gesetzt ist, fragt Microsoft Office Outlook beim Senden einer E-Mail nach, ob time cockpit auf die E-Mail-Adresse des Empfängers zugreifen darf.
