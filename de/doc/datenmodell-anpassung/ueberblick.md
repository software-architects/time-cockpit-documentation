---
title: Anpassung - Datenmodell und Benutzeroberfläche anpassen
description: "Passen Sie Datenmodell, Oberfläche, Berechtigungen und Geschäftslogik von time cockpit an: Entitäten, Eigenschaften, Formulare und Infrastructure as Code."
en_page: doc/data-model-customization/overview.md
---
# Anpassungsmöglichkeiten

> [!NOTE]
> Dieser Abschnitt gibt eine Einführung in die erweiterten Anpassungsmöglichkeiten von time cockpit. Kunden haben zwei Möglichkeiten, ihr time cockpit anzupassen: (1) selbst anpassen oder (2) die Anpassung vom time cockpit Team durchführen lassen. Wenn Sie time cockpit selbst anpassen möchten, müssen Sie den [OnCockpit Admin](https://update-admin.on-cockpit.com/general/Setup.exe) herunterladen und installieren. Mit dem OnCockpit Admin können Sie nahezu jeden Aspekt von time cockpit anpassen, etwa die Datenstrukturen oder die Benutzeroberfläche. Bitte beachten Sie, dass Änderungen an Ihrer Produktivumgebung Auswirkungen auf Ihre Teamkolleginnen und -kollegen haben können. Deshalb bieten wir Sandbox-Umgebungen an, in denen Sie Ihre Anpassungen testen können, bevor Sie sie in die Produktivumgebung übernehmen. Wenn Sie an einer der beiden Möglichkeiten interessiert sind, schreiben Sie uns bitte eine E-Mail an [support@timecockpit.com](mailto:support@timecockpit.com).

## Entwicklungsprozess

Wenn wir time cockpit Erweiterungen für einen Kunden umsetzen, folgen wir konsequent einem [Infrastructure-as-Code](https://learn.microsoft.com/en-us/devops/deliver/what-is-infrastructure-as-code)-Ansatz. Alle Änderungen werden als IronPython-Skripte entwickelt (keine Konfiguration über die Benutzeroberfläche von CoFX/time cockpit). IaC bringt folgende Vorteile:
1. Änderungen sind nachvollziehbar (Versionsverwaltung in Azure DevOps).
1. Änderungen können in andere time cockpit Systeme übertragen werden (z. B. Import der Änderungen in die Test- und Produktivumgebung).

## Sandboxes (Testsysteme) in time cockpit

### Warum eine Sandbox anlegen?
  - **Sicheres Testen:** Eine Sandbox-Umgebung bietet einen geschützten Bereich, in dem Sie experimentieren, Änderungen testen und neue Funktionen ausprobieren können, ohne Ihre Live-Daten zu beeinflussen.
  - **Übungsumgebung:** Sie eignet sich hervorragend zum Einarbeiten neuer Teammitglieder. Diese können das System kennenlernen und üben, ohne Echtdaten zu gefährden.
  - **Qualitätssicherung:** Stellen Sie die Qualität Ihrer Änderungen sicher, bevor Sie sie in Ihr Live-System übernehmen. Testen Sie Konfigurationen, Workflows, Berichte und Anpassungen mit gutem Gewissen.

### Eine Sandbox anfordern
Wenn Sie noch kein Testsystem haben, senden Sie einfach eine E-Mail an [support@timecockpit.com](mailto:support@timecockpit.com), um eines anzufordern. Wir richten es rasch für Sie ein.

Um Testbenutzer zu aktivieren, wenden Sie sich bitte an unser Support-Team. Leider können Benutzer Testkonten nicht selbst aktivieren. Geben Sie uns einfach Bescheid, wir kümmern uns darum.

Ihr Testsystem ist vorerst kostenlos. Nur wenn es unsere Systeme erheblich belastet, müssen wir über mögliche Kompromisse sprechen. Sie können die Vorteile eines Testsystems ohne unmittelbare Kosten nutzen.

### Zugriff auf die Sandbox OHNE Microsoft Entra (AAD)
Benutzer können sich ganz einfach unter [web.timecockpit.com](https://web.timecockpit.com) am Testsystem anmelden. Verwenden Sie für den Benutzernamen das Format `test/originalemailaddress`. Das Passwort ist dasselbe wie für Ihr produktives time cockpit Konto.

![Sandbox-Anmeldung](/doc/data-model-customization/images/sandbox-login.jpg "Sandbox-Anmeldung")

Wenn Sie den [OnCockpit Admin](https://update-admin.on-cockpit.com/general/Setup.exe) für Anpassungen und Entwicklung verwenden, können Sie sich mit der Sandbox verbinden, indem Sie im Startdialog des OnCockpit Admin über "Neu konfigurieren" eine Konfiguration hinzufügen. Verwenden Sie für den Benutzernamen unbedingt das Format `test/originalemailaddress`. Das Passwort ist dasselbe wie für Ihr produktives time cockpit Konto.

![Konfigurationsauswahl](/doc/data-model-customization/images/oncockpitadmin-configuration-selector.png "Konfigurationsauswahl")

### Zugriff auf die Sandbox MIT Microsoft Entra (AAD)

Wenn Sie Microsoft Entra (AAD) für die föderierte Authentifizierung verwenden, können Sie das Muster `test/originalemailaddress` nicht verwenden. Sie können direkt aus Ihrem time cockpit in die Sandbox wechseln.

1. Melden Sie sich über Microsoft Entra (AAD) bei Ihrem time cockpit an.
2. Klicken Sie rechts oben in time cockpit auf Ihren Benutzernamen.
3. Klicken Sie auf "Zur Sandbox wechseln". time cockpit wird neu geladen und leitet Sie zur Sandbox weiter.

![Zur Sandbox wechseln (AAD)](/doc/data-model-customization/images/ws-switch-to-sandbox.png "Zur Sandbox wechseln (AAD)")

>[!NOTE]
> Dass Sie sich in der Sandbox befinden, erkennen Sie am Sandbox-Kennzeichen, das time cockpit neben Ihrem Benutzernamen anzeigt.

![Sandbox-Kennzeichen](/doc/data-model-customization/images/sandbox-badge.png "Sandbox-Kennzeichen")

## Entitäten, Eigenschaften, Beziehungen usw.

time cockpit ist ein Standardprodukt, lässt sich aber dennoch vollständig anpassen. Sie können eigene Tabellen, Eigenschaften, Geschäftsregeln oder Geschäftslogik anlegen. time cockpit ist mit IronPython als Skriptsprache vollständig skriptfähig. Mit dieser Sprache können Sie eigene Geschäftslogik umsetzen. Ihr Code kann ausgerollt werden, ohne eine neue Version von time cockpit auszuliefern. Siehe [Entitäten anpassen](~/doc/datenmodell-anpassung/entitaet.md)

![Entität bearbeiten](/doc/data-model-customization/images/wc-edit-entity.png "Entität bearbeiten")

## Benutzeroberfläche

Auch die Benutzeroberfläche können Sie ganz nach Ihren Wünschen anpassen. Mit Anpassungen können Sie time cockpit an Ihre Organisationsstruktur und Ihre Abläufe anpassen. Außerdem können Sie eigene druckbare Berichte oder Dashboards erstellen, die Ihnen einzigartige Einblicke in Ihre Daten geben. Siehe [Formulare anpassen](~/doc/datenmodell-anpassung/formular.md)

![Entität bearbeiten](/doc/data-model-customization/images/wc-edit-form.png "Entität bearbeiten")

## Berechtigungen

Mit einem leistungsfähigen Berechtigungssystem können Sie ein eigenes Berechtigungsmodell konfigurieren, das genau zu Ihrer Organisationsstruktur und Ihren Anforderungen passt. Wenn Ihr Unternehmen im Lauf der Zeit wächst, wächst time cockpit mit. Dank der Anpassungsmöglichkeiten können Sie sicher sein, dass sich time cockpit an die Anforderungen Ihres Unternehmens anpassen lässt, ganz gleich, wie groß es geworden ist. Siehe [Formulare anpassen](~/doc/datenmodell-anpassung/formular.md)

![Berechtigungen](/doc/data-model-customization/images/wc-edit-permission.png "Berechtigungen")

## Web API

Zusätzlich bietet time cockpit eine leistungsfähige Web API, mit der Sie alle Ihre Daten abfragen und verwalten können. Die Web API kann für Datenanalyse usw. und Datenintegration verwendet werden. Siehe [Web API](~/doc/web-api/ueberblick.md)

## Sandbox (Testumgebung)

In time cockpit können Sie Sandbox-Umgebungen anlegen, um Ihre Änderungen zu testen, bevor Sie sie in Ihrer Produktivumgebung umsetzen.

Sandbox-Umgebungen sind im Wesentlichen Kopien Ihrer Produktivumgebung, in denen Sie neue Funktionen, Workflows und Konfigurationen testen können, ohne negative Auswirkungen auf Ihre Live-Daten zu riskieren. Mit Sandbox-Umgebungen können Sie frei experimentieren und Änderungen vornehmen, ohne sich über mögliche Fehler oder Folgen Gedanken machen zu müssen. Weitere Informationen finden Sie auch unter [Playing in the Sandbox](https://www.timecockpit.com/blog/2016/05/27/Playing-in-the-Sandbox).
