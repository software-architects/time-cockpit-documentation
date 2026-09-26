---
title: Systemarchitektur - Offlinefähige SaaS-Lösung
description: "Die Systemarchitektur von time cockpit: Offlinefähigkeit, Datensynchronisierung, lokale und zentrale Datenspeicher sowie SQL-Azure-Anbindung."
en_page: doc/getting-started/system-architecture.md
---
# Systemarchitektur

time cockpit ist eine offlinefähige SaaS-Lösung (Software as a Server). Sie können mit time cockpit arbeiten, unabhängig davon, ob Sie Internetzugang haben. Solange Sie verbunden sind, synchronisiert time cockpit Ihre Daten standardmäßig alle 15 Minuten automatisch mit dem Server. So stehen Ihnen Ihre aktuellen Daten auf allen Ihren Geräten zur Verfügung. Außerdem verlieren Sie keine Daten, wenn Ihr Computer defekt wird oder verloren geht.

## Überblick

Die folgende Abbildung zeigt, wie time cockpit Daten speichert:

![Systemarchitektur](/doc/getting-started/images/system-architecture.png "Systemarchitektur")

### Lokaler Datenspeicher

Lokaler Datenspeicher | Pfad
--- | ---
Zeiterfassungsdatenbank | `%LocalAppData%\software architects\time cockpit\data\time cockpit.tic`
BLOB-Speicher | `%LocalAppData%\software architects\time cockpit\data\time cockpit blob store`

### Anwendungskonfiguration

Anwendungskonfiguration | Pfad
--- | ---
Allgemeine Einstellungen | `%ProgramFiles%\software architects\time cockpit\time cockpit 2010\TimeCockpit.UI.exe.config`
Benutzerspezifische Einstellungen | `%LocalAppData%\software architects\time cockpit\Time Cockpit.config`

## Zeiterfassungsdatenbank und BLOB-Speicher

Die Daten in time cockpit lassen sich in zwei Kategorien einteilen:

- Stamm- und Zeiterfassungsdaten (z. B. Kunden, Projekte, Tätigkeiten, Zeitbuchungen, Rechnungen usw.)
- BLOB-Daten (z. B. Signale, Dateianhänge)

Stamm- und Zeiterfassungsdaten werden in einer relationalen Datenbank auf dem Client-PC gespeichert. Aufgezeichnete Signale (z. B. Computeraktivität, Titel des aktiven Fensters) werden als BLOBs (Binary Large Objects) im Dateisystem gespeichert. Wir behandeln Signaldaten anders als Stammdaten, weil die Datenmenge deutlich größer werden kann und weil Ihre privaten Daten aus unserer Sicht noch mehr Schutz verdienen. Aus diesen Gründen werden Signale mit Ihrem persönlichen [Signaldatenpasswort](~/doc/erste-schritte/konfigurationsassistent.md#schritt-5---signaldatenpasswort-wählen) verschlüsselt und komprimiert. So halten wir die Datenmenge gering, und Ihre Daten sind stark geschützt, weil Ihr Signaldatenpasswort Ihren PC nie verlässt.

Sie können das [Datenmodell](/doc/data-model-customization/entity.html) von time cockpit erweitern. Es gibt verschiedene Arten von Eigenschaften, die Sie hinzufügen können. Die meisten davon werden in der Datenbank gespeichert. Wenn Sie Daten als BLOB speichern möchten, können Sie die [TimeCockpit.Data.DataModel.BinaryProperty](/api/TimeCockpit.Data.DataModel.BinaryProperty.html) verwenden (siehe auch [How To: Eine FileProperty hinzufügen](/doc/scripting/add-file-property.html)).

## Lokale Datenspeicherung

Beim ersten Start von time cockpit legt der Konfigurationsassistent eine neue, lokale SQL Server CE-Datenbank an und führt dazu die folgenden Schritte aus (die angegebenen Pfade können Sie im [Konfigurationsassistenten](~/doc/erste-schritte/konfigurationsassistent.md) ändern):

1. Die lokale Datenbankdatei `time cockpit.tic` wird im Verzeichnis `%LocalAppData%\software architects\time cockpit\data` angelegt.
1. Im selben Verzeichnis wird ein Unterverzeichnis namens `time cockpit blob store` angelegt. Es enthält die BLOBs.
1. Der Speicherort der Datenbank wird in der Datei `%LocalAppData%\software architects\Time Cockpit\Time Cockpit.config`* gespeichert. Diese Datei enthält außerdem Ihren verschlüsselten Benutzernamen und Ihr verschlüsseltes Passwort, mit denen die Verbindung zum time cockpit-Server hergestellt wird. Hinweis: Diese Konfigurationsdatei kann nicht auf einen anderen Benutzer übertragen werden. Der verschlüsselte Benutzername und das verschlüsselte Passwort können nur von dem Microsoft Windows-Benutzer verschlüsselt werden, der die Datei angelegt hat.

*) Der Name der Konfigurationsdatei kann in der globalen Konfigurationsdatei `%ProgramFiles%\software architects\time cockpit\time cockpit 2010\TimeCockpit.UI.exe.config` geändert werden. Ist die Einstellung `configuration/appSettings/Configuration` leer, sprechen wir von einer Standardkonfiguration. Enthält sie einen Wert, sprechen wir von einer benannten Konfiguration. Bei benannten Konfigurationen enthält der Name der Konfigurationsdatei diesen Namen: z. B. Time Cockpit.Test.config für den Konfigurationsnamen "Test". Beachten Sie, dass beim Konfigurationsnamen die Groß- und Kleinschreibung unterschieden wird. Mit dieser Einstellung können Sie mehrere time cockpit-Instanzen gleichzeitig auf einem Computer ausführen. Ausführliche Informationen finden Sie in der [Installationsanleitung](~/doc/erste-schritte/installationsanleitung.md).

## Zentrale Datenspeicherung

In der Cloud werden Ihre time cockpit-Daten auf der [Microsoft Windows Azure Platform](http://www.microsoft.com/windowsazure/) gespeichert. Wie auf Ihrem lokalen Computer verwenden wir eine relationale Datenbank (SQL Azure) für Ihre Stamm- und Zeiterfassungsdaten und BLOBs (Microsoft Windows Azure Blob Storage) für Ihre Signale.

Die Zugangsdaten für den zentralen Datenspeicher speichern wir nicht auf Ihrem Computer, sondern ermitteln sie zur Laufzeit anhand Ihres Benutzernamens und Passworts. Beachten Sie, dass wir den Zugriff auf den zentralen Datenspeicher mit anderen Werkzeugen als time cockpit nicht unterstützen. Wenn Sie z. B. mit Berichtswerkzeugen lesend auf Ihre Serverdatenbank zugreifen möchten, wenden Sie sich für weitere Informationen an [support@timecockpit.com](mailto:support@timecockpit.com).

Auf dem Server speichern wir Signale nur verschlüsselt und komprimiert. Ihr Signaldatenpasswort wird nie an den Server übertragen, daher gibt es keine Möglichkeit, Ihre Signaldaten zu entschlüsseln.

Um eine Verbindung zum zentralen Datenspeicher SQL Azure herzustellen, müssen Sie Ihre Umgebung so konfigurieren, dass ausgehende TCP-Verbindungen über Port TCP/1433 erlaubt sind. Microsoft veröffentlicht [Sicherheitsrichtlinien für SQL Azure](http://social.technet.microsoft.com/wiki/contents/articles/security-guidelines-for-sql-azure.aspx). Sie können die [IP-Bereiche aller Windows Azure-Rechenzentren herunterladen](https://www.microsoft.com/en-us/download/details.aspx?id=56519). Wenn möglich, sollten Sie die Firewallregel auf diese IP-Bereiche beschränken. Auf Wunsch nennen wir Ihnen auch den DNS-Namen Ihrer time cockpit-Datenbank.

## Synchronisierung

Wenn Sie Internetzugang haben, versucht time cockpit regelmäßig, den lokalen und den zentralen Datenspeicher zu synchronisieren. Ihre Daten werden in den folgenden Schritten synchronisiert:

1. Synchronisieren von Schemaänderungen (z. B. neue Entitäten, Eigenschaften, Beziehungen)
1. Synchronisieren neuer und geänderter Datensätze
1. Synchronisieren gelöschter Datensätze
1. Synchronisieren von BLOBs

Schlägt ein Schritt der Synchronisierung fehl, werden alle Änderungen rückgängig gemacht, sodass Ihre Datenbank nie in einem inkonsistenten Zustand bleibt.

Ändern zwei Benutzer gleichzeitig denselben Datensatz, überschreibt der Benutzer, der zuletzt synchronisiert, die Daten der Benutzer, die vorher synchronisiert haben (der letzte Client gewinnt). Wir versionieren auf Zeilenebene, nicht auf Spaltenebene.
