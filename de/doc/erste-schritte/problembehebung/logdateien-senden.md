---
title: Logdateien senden - Diagnoseinformationen
description: Logdateien von time cockpit zur Problembehebung sammeln und senden. Speicherorte, Formate und Log-Level der Logdateien im Überblick.
en_page: doc/getting-started/troubleshooting/send-log-files.md
---
# Logdateien an software architects senden

Bei der Nutzung der Software und Dienste von time cockpit stehen mehrere Quellen für Diagnose- und Fehlerbehebungsinformationen zur Verfügung. Die folgenden Abschnitte zeigen, wie Sie für typische Nutzungsszenarien Diagnoseinformationen zur Problembehebung sammeln.

## Logdateien des Vollclients

Die Hauptanwendung, der Signal Tracker und die Anwendung zur Skriptausführung protokollieren relevante Aktionen und auftretende Fehler in Logdateien. Die Logdateien des time cockpit-Vollclients liegen in `%LOCALAPPDATA%\software architects\Time Cockpit`, und die Dateinamen enden je nach Softwareversion auf `.log` oder `.log.xml`. Über verschiedene Log-Level wählen Sie den Detailgrad und die Menge der aufgezeichneten Daten. Im Normalbetrieb reicht der Level Warning oder Error. Bei Fehlern können Sie den Log-Level auf Information oder Verbose erhöhen, um zusätzliche Details aufzuzeichnen und die Fehlerdiagnose zu erleichtern.

![Logdateien senden](/doc/getting-started/troubleshooting/images/send-log-files-en.png "Logdateien senden")

Das aktuelle Format ist ein log4j-kompatibles XML-Format, das sich mit einem der zahlreichen Logdatei-Viewer von Drittanbietern lesen und darstellen lässt. Zwei kostenlose Optionen sind [YALV! - Yet Another Log4Net Viewer](https://github.com/LukePet/YALV) und [LogExpert](https://logexpert.codeplex.com/).
