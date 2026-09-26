---
title: Migrationsleitfaden - Standardberechtigungen
description: Umstieg auf die neuen Standardberechtigungen von time cockpit. Feature Flags, Aktivierungsszenarien und Kompatibilität für Bestandskunden.
en_page: doc/migration-guides/default-permissions.md
---
# Migrationsleitfaden für die Standardberechtigungen

## Einführung und Überblick

Die Standardberechtigungen wurden eingeführt, um Berechtigungen in time cockpit übersichtlicher, strukturierter und einfacher verwaltbar zu machen. Ein Hauptziel ist ein reibungsloserer und schnellerer Einstieg für Neukunden. Da alle relevanten Funktionen und Berechtigungen standardmäßig aktiviert sind, können neue Benutzer sofort mit dem System arbeiten, ohne umfangreiche Konfiguration. Das beseitigt Hürden bei den ersten Schritten und hilft Teams, vom ersten Tag an produktiv zu sein. Siehe [Standardberechtigungen](~/doc/arbeitszeiterfassung/standardberechtigungen.md).

Für Bestandskunden bringen die Standardberechtigungen Klarheit und Struktur in die Einrichtung der Berechtigungen. Sie bieten einen klaren Rahmen, um zu entscheiden, welche Benutzer Zugriff auf bestimmte Teile des Systems haben sollen. Damit Bestandskunden nicht beeinträchtigt werden, haben wir einen **Feature-Flag-Mechanismus** umgesetzt, der die Kompatibilität mit den Datenmodellen von Bestandskunden mit eigenen Berechtigungen sicherstellt. Dieser Mechanismus garantiert, dass es bei der Einführung der Standardberechtigungen zu keinen Konflikten oder unerwartetem Verhalten kommt. Weitere Details finden Sie im Artikel [Feature Flags](~/doc/datenmodell-anpassung/feature-flags.md).

> [!NOTE]
> Ab dem 13.5.2025 rollen wir das neue Datenmodell schrittweise für alle unsere Kunden aus. 

> [!NOTE]
> Die Aktivierung erfolgt auf Anfrage an `support@timecockpit.com`. So wird sichergestellt, dass Änderungen richtig abgestimmt werden und bestehende Konfigurationen nicht beeinträchtigen.

Je nach Art des Kunden gibt es drei Hauptszenarien, die in diesem Leitfaden ausführlich erklärt werden.

## Überblick über die drei Szenarien

### 1️⃣ **Neukunden**

Wenn sich ein neuer Kunde bei time cockpit registriert, sind alle Funktionen einschließlich der Standardberechtigungen standardmäßig aktiviert. Damit haben alle Benutzer ohne zusätzliche Konfiguration direkten Zugriff auf alle Funktionen.

### 2️⃣ **Bestandskunden ohne Berechtigungen**

Bestandskunden, die bisher keine eigenen Berechtigungen konfiguriert haben, müssen entscheiden, ob sie die neuen Berechtigungen verwenden möchten. Für diese Entscheidung empfehlen wir, den Artikel [Standardberechtigungen](~/doc/arbeitszeiterfassung/standardberechtigungen.md) sorgfältig zu lesen. Es ist wichtig, die Auswirkungen der verschiedenen Rollen zu verstehen und sie den jeweiligen Benutzern entsprechend zuzuweisen. Nach dem Zuweisen der Rollen ist eine E-Mail an `support@timecockpit.com` erforderlich, um die Funktion zu aktivieren.

### 3️⃣ **Bestandskunden mit eigenen Berechtigungen**

Kunden mit vielen eigenen Anpassungen im Bereich Berechtigungen sollten sorgfältig prüfen, wo die Standardberechtigungen hilfreich sein können. In diesen Fällen empfehlen wir jedoch, die Funktion Standardberechtigungen nicht direkt zu aktivieren, sondern die bestehenden Berechtigungen sorgfältig zu überprüfen.

## Wichtige Änderungen durch die Standardberechtigungen

Vor der Einführung der Standardberechtigungen konnten alle Benutzer Datensätze in **`GlobalSettings`**, **`ImportDefinition`** und **`TemplateQuery`** anlegen, bearbeiten oder löschen. Das ist jetzt nur noch für Mitarbeiter mit der Rolle **`BasedataAdmin`** möglich. Deshalb ist es wichtig, diese Rolle den passenden Benutzern zuzuweisen.

## Änderungen an der Rolle Admin

Mit der Einführung der Standardberechtigungen wurde die klassische Rolle Admin in eine spezialisierte Rolle namens **Customization Admin** umbenannt. Diese Rolle kann weiterhin das Datenmodell anpassen sowie Berechtigungen aktivieren und deaktivieren, aber nicht mehr alle Bereiche des Systems verwalten. Ein Customization Admin kann weiterhin die Identität wechseln und sich so selbst zum `AccountAdmin` machen, um Benutzer hinzuzufügen oder zu sperren.

Diese Änderung behebt eine historisch gewachsene Inkonsistenz: Bisher konnte ein Administrator, der Anpassungen am Datenmodell vornehmen durfte, auch alle anderen Bereiche des Systems verwalten. Das ist jetzt klarer getrennt.

## Bisherige Rechte für Bestandskunden sicherstellen

Damit Bestandskunden nach der Einführung der Standardberechtigungen dieselben Rechte wie zuvor haben, werden allen klassischen Administratoren automatisch alle relevanten Rollen zugewiesen (`AccountAdmin`, `BillingAdmin`, `HumanResourcesAdmin` usw.).

## Ersatz des Flags `IsTenantAdmin`

Das bisherige Flag `IsTenantAdmin` wurde durch die Rolle `AccountAdmin` ersetzt. Diese neue Rolle hat dieselben Rechte wie bisher, nämlich die Verwaltung von Benutzern und Rechnungsdaten.

## Best Practices und Empfehlungen

1. Prüfen Sie, welche Rollen für welche Benutzer erforderlich sind.
2. Weisen Sie die passenden Rollen in time cockpit zu.
3. Wenden Sie sich an `support@timecockpit.com`, um die Funktion zu aktivieren.
4. Testen Sie die neuen Berechtigungen gründlich, bevor Sie sie produktiv verwenden.
