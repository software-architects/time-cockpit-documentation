---
title: Signal Tracker für Telefonate - Anrufliste importieren
description: Importieren Sie die Anrufliste Ihres Mobiltelefons in time cockpit. Unterstützt Android, iPhone und ältere Geräte über XML-Export.
en_page: doc/signal-tracker/phone-calls.md
---
# Signal Tracker für Telefonate	

Mit dem Signal Tracker für Telefonate können Sie die Anrufliste Ihres Mobiltelefons importieren. Diese Information ist besonders hilfreich für Benutzer, die oft Kunden oder Partner anrufen und ihre Telefonate verrechnen oder auswerten möchten. Aus dem Namen Ihres Kontakts können Sie üblicherweise den Kunden oder das Projekt ableiten, an dem Sie arbeiten.

## Gesammelte Daten

Der Signal Tracker für Telefonate zeichnet keine Daten ohne Eingabe des Benutzers auf. Mit Tools von Drittanbietern können Sie die Anrufliste Ihres Telefons in eine Textdatei exportieren. Der Signal Tracker kann einen Ordner auf Ihrem Computer überwachen. Wenn Sie die Textdatei mit der Anrufliste in diesen Ordner legen, importiert time cockpit Ihre Telefonate.

Wenn Sie den Signal Tracker beenden oder pausieren, überwacht er den angegebenen Ordner nicht.

## Unterstützte Dateiformate

Der Signal Tracker für Telefonate unterstützt die Formate mehrerer verbreiteter Tools, die Anruflisten von Android, iPhone und älteren Geräten exportieren können.

### Android

Für **Android**-Smartphones können Sie das Tool [SMS Backup & Restore](https://play.google.com/store/apps/details?id=com.riteshsahu.SMSBackupRestore) (früher [Call Logs Back Up & Restore](https://play.google.com/store/apps/details?id=com.riteshsahu.CallLogBackupRestore)) verwenden. Es erstellt XML-Dateien mit dem Namen `calls-*.xml`, die der Signal Tracker übernimmt, wenn sie in seinem Ordner abgelegt werden.

Das folgende Beispiel zeigt das XML-Format:

```
<?xml version='1.0' encoding='UTF-8' standalone='yes' ?>
<?xml-stylesheet type="text/xsl" href="calls.xsl"?>
<calls count="4" backup_set="..." backup_date="...">
  <call number="069910203040" duration="0" date="1493314076076" type="2" presentation="1" readable_date="27.04.2017 19:27:56" contact_name="Fritz" />
  <call number="+3133221115" duration="0" date="1493387887228" type="3" presentation="1" readable_date="28.04.2017 15:58:07" contact_name="(Unknown)" />
  <call number="0800664147" duration="4" date="1493449140916" type="2" presentation="1" readable_date="29.04.2017 08:59:00" contact_name="(Unknown)" />
  <call number="+43699112233" duration="139" date="1493725143465" type="1" presentation="1" readable_date="02.05.2017 13:39:03" contact_name="Franz" />
</calls>
```

### iPhone

Mit dem Tool [Macroplant iExplorer](http://www.macroplant.com/iexplorer/) können Sie Anruflisten von **iPhones** oder **iPhone-Backups** exportieren. Die erzeugten Dateien müssen `*.txt` oder `*.csv` heißen, damit der Signal Tracker sie übernimmt. Das Dateiformat sieht so aus:

```
"Contact","Number","Date","Duration","Call Type","Unformatted Number","Number Geo Description"
"Bob Smith","+46879111111","2017-06-02 09:45:48","1:43","Incoming","08791111111","Stockholm"
"Bob Smith","+46879111111","2017-06-02 10:42:23","2:10","Outgoing","08791111111","Stockholm"
```

Eine weitere Möglichkeit ist das Tool [iMazing 2](https://imazing.com). Es erzeugt ebenfalls CSV-Dateien aus iPhones oder Backups, allerdings in einem anderen Dateiformat:

```
Incoming,02/06/17 09:45,00:01:43,+46879111111,Bob Smith
Outgoing,02/06/17 10:42,00:02:10,+46879111111,Bob Smith
```

### Ältere Formate

Für **Microsoft Windows Mobile** können Sie das Tool [CallHistory export](http://www.accosto.com/?page_id=8) verwenden. Es erzeugt eine Textdatei `callhistory.tsv` mit den folgenden Informationen:

```
O        +436608480000        Muster, Max        Hdy        2010.02.08 18:27.16        0        Local        busy/no answer        Ended        CID_Available
O        +4366488540000        Mueller, Franz        Hdy        2010.02.08 16:51.48        0        Local        busy/no answer        Ended        CID_Available
O        +43 699 171 00 000        Huber, Karl        Hdy        2010.02.08 13:52.03        54        Local        Connected        Ended        CID_Available
O        +43660840000        Maier, Uwe        Hdy        2010.02.08 13:43.29        428        Local        Connected        Ended        CID_Available
```

Für **Nokia (Symbian)**-Smartphones können Sie das Tool [LogExport](http://tinyhack.com/freewarelist/s603rd/2007/03/02/logexport/) verwenden. Es erzeugt eine Textdatei `log-*.csv` mit den folgenden Informationen:

```
Date,"Time","Type","RemoteParty","Direction","DurationType","Duration","Status","Subject","Number","SentData","RecvData","MsgType","MsgTotalPart","MsgTotalSent","MsgTotalDelivered","MsgTotalFailed","MsgTotalReceived",
02/02/2009,"21:15","Voice call","Max Muster","Outgoing","1","58","","6","+436644300000",
02/02/2009,"21:12","Voice call","Max Muster","Missed call","1","0","","6","+436644300000",
01/30/2009,"17:31","Short message","Huber Karl","Outgoing","-1","0","Sent","Mozartstrasse, 4020 linz","+436644200000",
01/30/2009,"10:43","Voice call","Maier Uwe","Incoming","1","45","","6","+43650700000",
```

### Andere Plattformen

Wenn Sie ein anderes Telefon verwenden, können Sie ein beliebiges Tool zum Exportieren Ihrer Anrufliste verwenden. Sie müssen die exportierten Daten nur in eines der beschriebenen Formate umwandeln. Wir freuen uns, wenn Sie uns mitteilen, welches Telefon unterstützt werden soll.

## Konfigurationsparameter des Signal Trackers

Parametername | Datentyp | Beschreibung
--- | --- | ---
Delete imported files (`DeleteImportedFiles`) | Boolean (true / false) | Legt fest, ob die Datei nach dem Import gelöscht werden soll.
Points in time are in local time zone (`IsLocalTime`) | Boolean (true / false) | Ist der Parameter auf true gesetzt, werden alle Zeitpunkte in der Importdatei als Zeitpunkte in Ihrer lokalen Zeitzone interpretiert. Andernfalls geht time cockpit davon aus, dass die Zeitpunkte in UTC angegeben sind.
Abfrageintervall (`Interval`) | Zeitspanne | Intervall, in dem der Signal Tracker nach zu importierenden Dateien sucht. Die Einstellung `00:05:00` legt fest, dass der Tracker alle 5 Minuten nach neuen Dateien suchen soll. Kleinere Werte können die Performance Ihres Computers verringern, größere Werte führen zu ungenaueren Werten.
Path (`Path`) | Text | Pfad, in dem time cockpit nach zu importierenden Dateien suchen soll.
