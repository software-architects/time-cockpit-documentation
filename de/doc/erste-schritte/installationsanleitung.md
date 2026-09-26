---
title: Installationsanleitung - Setup und Systemanforderungen
description: So installieren Sie time cockpit unter Windows. Systemanforderungen, Installationsassistent und Verteilung durch IT-Administratoren.
en_page: doc/getting-started/installation-instructions.md
---
# Installationsanleitung

Laden Sie das aktuelle Installationsprogramm für time cockpit von https://update.timecockpit.com/general/Setup.exe herunter. Der Installationsassistent hilft Ihnen zu prüfen, ob alle Voraussetzungen installiert sind. Fehlen Voraussetzungen, hilft Ihnen das Installationsprogramm, die fehlenden Komponenten zu installieren.

Wenn Sie time cockpit zum ersten Mal starten, führt Sie der Konfigurationsassistent durch die ersten Schritte der Konfiguration.

## Systemanforderungen

time cockpit benötigt die folgenden Softwarekomponenten:

- Unterstützte Betriebssysteme: Microsoft Windows XP 32-Bit SP3 oder höher, Microsoft Windows Vista SP 1 oder höher (32 oder 64 Bit), Microsoft Windows 7 (32 oder 64 Bit), Microsoft Windows 8 (32 oder 64 Bit), Microsoft Windows 10 (32 oder 64 Bit)
- Microsoft .NET Framework 4.0
- Microsoft Sync Framework 2.0
- Microsoft Visual Studio 2010 ist erforderlich, um time cockpit mit Microsoft Team Foundation Server zu integrieren. Ist Microsoft Visual Studio 2010 nicht installiert, können keine Daten aus Microsoft Team Foundation Server importiert werden.

Sie können alle erforderlichen Softwarekomponenten mit dem [Installationsassistenten](~/doc/erste-schritte/konfigurationsassistent.md) installieren oder sie von Microsoft herunterladen und automatisiert verteilen (siehe [Installation für IT-Administratoren](#installation-für-it-administratoren)).

time cockpit synchronisiert alle Daten mit Microsoft SQL Azure (weitere Informationen finden Sie unter [Systemarchitektur](~/doc/erste-schritte/systemarchitektur.md)). Damit die Synchronisierung funktioniert, öffnen Sie in Ihrer Firewall die ausgehenden Ports 443 (Webservice-Aufrufe über HTTPS) und 1433 (SQL Azure).

## Standardinstallation

### Installationsassistent

> [!NOTE]
> Für die Installation und Konfiguration von time cockpit benötigen Sie einen Internetzugang, und die unter Systemanforderungen genannten Ports müssen geöffnet sein, sonst schlägt die Installation fehl.

![Installationsassistent](/doc/getting-started/images/installer.png "Installationsassistent")

> [!NOTE]
> Beachten Sie, dass Originalversionen von time cockpit immer mit einem Zertifikat von software architects signiert sind. Installieren Sie keine Versionen mit einem anderen Herausgeber als software architects.

Der Installationsassistent führt Sie durch die folgenden Schritte zur Installation von time cockpit:

1. Starten Sie den Installationsassistenten TimeCockpit_[Version].exe.
1. Der Installationsassistent zeigt Ihnen, ob Systemanforderungen fehlen. Installieren Sie fehlende Voraussetzungen über die jeweiligen Links.
1. Sind alle Voraussetzungen erfüllt, starten Sie das time cockpit-Setup mit der Schaltfläche "Start the installation of time cockpit" und folgen Sie den Anweisungen am Bildschirm.

> [!NOTE]
> Der Installationsassistent von time cockpit erkennt automatisch, ob Sie mit einem 32-Bit- oder 64-Bit-Betriebssystem arbeiten, und installiert die entsprechenden Dateien im richtigen Ordner.

### Konfigurationsassistent

Nach der erfolgreichen Installation hilft Ihnen der Konfigurationsassistent beim ersten Start, time cockpit einzurichten. Mehr zum [Konfigurationsassistenten ...](~/doc/erste-schritte/konfigurationsassistent.md)

## Installation für IT-Administratoren

Als IT-Administrator möchten Sie möglicherweise alle Komponenten einzeln installieren und genau nach Ihren Anforderungen konfigurieren. Die folgende Anleitung zeigt, wie Sie die Voraussetzungen installieren.

### Microsoft .NET Framework 4.0 installieren

time cockpit basiert auf dem Microsoft .NET Framework 4.0. Sie können es unter [Microsoft .NET Framework 4.0](http://www.microsoft.com/downloads/details.aspx?FamilyID=9cfb2d51-5ff4-4491-b0e5-b386f32c0992&displaylang=en) herunterladen.

> [!NOTE]
> Beachten Sie, dass Sie Ihren Computer nach der Installation von Microsoft .NET Framework 4.0 möglicherweise neu starten müssen. Weitere Informationen finden Sie in diesem Blogeintrag.

### Sync Framework 2.0 installieren

time cockpit verwendet das Microsoft Sync Framework 2.0, um Daten mit SQL Azure zu synchronisieren. Laden Sie das Sync Framework unter [Microsoft Sync Framework 2.0 Redistributable Package](http://www.microsoft.com/downloads/details.aspx?FamilyID=109DB36E-CDD0-4514-9FB5-B77D9CEA37F6&displaylang=en) herunter.

Sie müssen nur die Kernkomponente `Synchronization-v2.0-x64-ENU.msi` (für 64-Bit-Systeme) oder `Synchronization-v2.0-x86-ENU.msi` (für 32-Bit-Systeme) installieren. Andere Komponenten des Sync Frameworks, etwa die Datenbankprovider, benötigt time cockpit nicht.

### time cockpit installieren

Sind alle Voraussetzungen für time cockpit installiert, können Sie entweder den Installationsassistenten oder die schlanken Installationsroutinen `TimeCockpit.Setup.x86.Release.Productive.msi` oder `TimeCockpit.Setup.x64.Release.Productive.msi` verwenden, um time cockpit automatisiert ohne Benutzerinteraktion auszurollen. Weitere Informationen zur automatisierten Installation finden Sie unter [MSIEXEC](http://msdn.microsoft.com/en-us/library/aa367988(VS.85).aspx). Der Installationsassistent von time cockpit bietet den Befehlszeilenparameter [/EXTRACT:[path]](https://help.timecockpit.com/html/93de1e41-f31c-41e4-968b-44166e8be97b.htm#CommandLineSetup), mit dem Sie die MSI-Pakete extrahieren können.

Sie können time cockpit auch verteilen, indem Sie alle Dateien aus dem Programmordner kopieren (üblicherweise `%ProgramFiles%\software architects\time cockpit`). Zusätzlich müssen Sie bei Bedarf eine Verknüpfung im Startmenü anlegen. time cockpit registriert keine COM- oder sonstigen Komponenten.

Sie können mehrere Instanzen von time cockpit auf einem Computer betreiben (z. B. zu Testzwecken oder wenn Sie für mehrere Unternehmen arbeiten, die time cockpit verwenden). So legen Sie eine zweite Instanz an:

1. Öffnen Sie den Ordner `C:\program files\software architects\time cockpit` (oder Ihren time cockpit-Installationsordner, falls Sie einen anderen Ordner gewählt haben).
1. Kopieren Sie den Ordner `time cockpit 2010`.
1. Öffnen Sie im neuen Ordner die XML-Konfigurationsdatei `TimeCockpit.UI.exe.config` mit einem Texteditor. Suchen Sie das Attribut `/configuration/appSettings/add[@key='Configuration']/@value` und tragen Sie den Namen Ihrer neuen Instanz ein (z. B. instance2). Verwenden Sie keine Leerzeichen oder Sonderzeichen. Tragen Sie denselben Namen im Attribut `/configuration/system.serviceModel/client/endpoint/@name` ein.
1. Wiederholen Sie den letzten Schritt für die XML-Konfigurationsdateien `TimeCockpit.SignalTracker.UI.exe.config` und `TimeCockpit.ExecuteScript.exe.config`.
1. Starten Sie `TimeCockpit.UI.exe` im neuen Ordner, um Ihre neue Instanz zu starten. Im Fenstertitel sehen Sie den Namen Ihrer Instanz. Beachten Sie, dass Sie Ihre neue Instanz beim ersten Start mit dem [Konfigurationsassistenten](~/doc/erste-schritte/konfigurationsassistent.md) konfigurieren müssen.

## Autostart-Verhalten der Signal Tracker

Standardmäßig konfiguriert time cockpit die [Signal Tracker](~/doc/signal-tracker/ueberblick.md) so, dass sie bei jeder Anmeldung automatisch starten. Endbenutzer, die keine Datenerfassung durch Signal Tracker wünschen, können sie in der [Konfigurationsoberfläche der Signal Tracker](~/doc/signal-tracker/ueberblick.md#signal-tracker-konfiguration) beenden. Ein beendeter Signal Tracker startet nicht mehr automatisch, auch nicht nach einem Neustart des Computers.

Unternehmen können das Autostart-Verhalten der Signal Tracker vom oben beschriebenen Opt-out-Modell auf ein Opt-in-Modell umstellen, indem sie einen Schlüssel in die Registry des Computers eintragen, bevor ein Benutzer die Signal Tracker von time cockpit zum ersten Mal startet. In der Praxis empfehlen wir, die Änderung der Registry automatisiert auf alle Computer zu verteilen, z. B. mit Active Directory-Gruppenrichtlinien oder Softwareverteilungswerkzeugen von Drittanbietern. Der Registry-Schlüssel, der das time cockpit-Installationsprogramm von Opt-out auf Opt-in umstellt, lautet `HKEY_LOCAL_MACHINE\SOFTWARE\software architects\SkipInitialSignalTrackerAutostart` (Typ `DWORD`, Wert `1`).

Beim ersten Start der Signal Tracker wird der Registry-Schlüssel geprüft, um das Autostart-Verhalten festzulegen. Existiert er nicht, werden die Signal Tracker auf automatischen Start gesetzt (Standardverhalten). Existiert er, werden alle Signal Tracker auf den Status "beendet" gesetzt. In diesem Fall müssen Sie sie ausdrücklich starten, wenn sie Daten erfassen sollen.

## Befehlszeilenparameter des Installationsassistenten
Der [Installationsassistent](#installationsassistent) unterstützt die folgenden Befehlszeilenparameter:

Parameter | Beschreibung
--- | ---
`/?` | Zeigt eine Kurzhilfe zu den verfügbaren Befehlszeilenparametern an.
`/EXTRACT:[path]` | Extrahiert die eingebetteten MSI-Pakete in den angegebenen Pfad. Administratoren können diese Option nutzen, um die Komponenten mit bestimmten Optionen zu installieren oder automatisiert zu verteilen.
`/LOG:[path]` | Protokolliert Fehler und Warnungen während der Installation im angegebenen Pfad.

## Problembehebung

Wenn bei der Installation ein Fehler auftritt, empfehlen wir die folgenden Schritte:

1. Prüfen Sie, ob alle nötigen Voraussetzungen erfüllt sind. Der [Installationsassistent](#installationsassistent) zeigt Ihnen fehlende Voraussetzungen an.
1. Starten Sie die Installation erneut mit dem Befehlszeilenparameter `/LOG` des [Installationsassistenten](#installationsassistent). Öffnen Sie danach die Logdatei und prüfen Sie sie auf Fehler.
1. Installieren Sie die Komponenten von time cockpit einzeln, wie unter [Installation für IT-Administratoren](#installation-für-it-administratoren) beschrieben. Erstellen Sie für fehlschlagende Komponenten eine Logdatei mit der [MSIEXEC-Option /L](http://msdn.microsoft.com/en-us/library/aa367988(VS.85).aspx). Öffnen Sie danach die Logdatei und prüfen Sie sie auf Fehler.

Wenn Sie mit diesen Schritten keinen Erfolg haben, senden Sie uns bitte die Logdateien aus Schritt zwei oder drei an [support@timecockpit.com](mailto:support@timecockpit.com). Wir tun unser Bestes, um Sie bei der Installation von time cockpit zu unterstützen.
