---
title: Kontoverwaltung - Benutzer und Rechnungsdaten
description: "Verwalten Sie Ihr time cockpit-Konto: Benutzer hinzufügen, Rechnungsdaten pflegen, Rechnungen herunterladen. Mit Tenant-Admin-Rechten und Stripe."
en_page: doc/account-management/account-management.md
---
# Kontoverwaltung

Time cockpit bietet eine intuitive Oberfläche zur Verwaltung Ihrer Kontodaten, einschließlich Benutzerverwaltung, Rechnungsdaten und Zugriff auf Rechnungen. Das Modul Kontoverwaltung gibt Ihnen umfassende Kontrolle über das Hinzufügen von Benutzern, das Aktualisieren der Rechnungsdaten und das Herunterladen von Rechnungen.

![Kontoübersicht](/doc/account-management/images/account-overview.png "Kontoübersicht")

>[!NOTE]
> Bis Juli 2023 erfolgte die Kontoverwaltung über die time cockpit-Website (www.timecockpit.com). Seitdem ist die Kontoverwaltung in die time cockpit-Web-App umgezogen und bietet Benutzern ein einheitliches, schlankes Erlebnis.

## Benutzer hinzufügen

So fügen Sie Ihrem time cockpit-Konto Benutzer hinzu:

![Benutzerverwaltung](/doc/account-management/images/manage-users.png "Benutzerverwaltung")

1. Öffnen Sie das Modul Kontoverwaltung über [Kontoinformationen](https://web.timecockpit.com/app/account/account-information).
2. Auf der Hauptseite fügen Sie Benutzer über "Benutzerverwaltung" hinzu.
3. time cockpit zeigt eine Liste der Benutzer an, standardmäßig die aktivierten und sichtbaren Benutzer.
4. Stellen Sie den Filter bei Bedarf so ein, dass auch deaktivierte und ausgeblendete Benutzer angezeigt werden.
5. Um einen Benutzer hinzuzufügen, klicken Sie auf "Hinzufügen" und geben Sie die nötigen Informationen ein.
6. Pflichtfelder sind "E-Mail (Benutzername)", "Vorname" und "Nachname".
7. Legen Sie die Eigenschaften "Aktiv" und "Tenant Admin" fest
   - Aktivierte Benutzer werden nach ihren aktiven Tagen im Monat verrechnet.
   - Der Status "Tenant Admin" berechtigt dazu, das Konto zu verwalten, Benutzer hinzuzufügen, Zahlungsdaten zu aktualisieren und das Konto zu kündigen.

## Rechnungsdaten eingeben

Für eine reibungslose Verrechnung und Kontoverwaltung benötigt time cockpit bestimmte Angaben im Bereich Rechnungsdaten. So geben Sie Ihre Rechnungsdaten ein:

1. **Rechnungsdaten öffnen:**
   - Öffnen Sie in Ihrem time cockpit-Konto die Seite [Kontoinformationen](https://web.timecockpit.com/app/account/account-information).

![Rechnungsdaten](/doc/account-management/images/billing-info.png "Rechnungsdaten")

2. **Pflichtfelder:**
   - Die folgenden Felder sind Pflichtfelder:
     - **Firma:** Geben Sie den Namen Ihres Unternehmens ein.
     - **Vorname:** Geben Sie Ihren Vornamen ein.
     - **Nachname:** Geben Sie Ihren Nachnamen ein.
     - **E-Mail:** Geben Sie eine gültige E-Mail-Adresse ein.
     - **Straße:** Geben Sie Ihre Straße und Hausnummer ein.
     - **Stadt:** Geben Sie den Namen Ihrer Stadt ein.
     - **Postleitzahl:** Geben Sie die Postleitzahl ein.
     - **Land:** Geben Sie Ihr Land an.
   
3. **Optionale Felder:**
   - Die folgenden Felder sind optional, für eine bessere Kontoverwaltung aber empfohlen:
     - **Telefonnummer:** Geben Sie Ihre Telefonnummer für Rückfragen ein.
     - **Bestellnummer:** Geben Sie gegebenenfalls Ihre Bestellnummer an.
     - **USt-IdNr.:** Geben Sie Ihre Umsatzsteuer-Identifikationsnummer an.
     - **Zusätzliche Adressinformationen:** Ergänzen Sie weitere Angaben zu Ihrer Adresse.

>[!NOTE]
> Wenn Sie Fragen zur Verrechnung haben, schreiben Sie uns bitte an [support@timecockpit.com](mailto:support@timecockpit.com)

### Stripe

Die Verrechnung in time cockpit erfolgt über **Stripe**, einen sicheren und vertrauenswürdigen Zahlungsdienstleister, der für Online-Transaktionen weit verbreitet ist.

Stripe ist ein globales Technologieunternehmen, das wirtschaftliche Infrastruktur für das Internet aufbaut. Es bietet Unternehmen eine sichere Plattform für Online-Zahlungen, Abrechnung und Abonnements. Die Plattform ist bekannt für ihre robusten Sicherheitsmaßnahmen, benutzerfreundlichen Oberflächen und die breite Unterstützung verschiedener Zahlungsmethoden.

Stripe unterstützt zahlreiche Zahlungsmethoden, darunter Kredit- und Debitkarten (Visa, Mastercard, American Express), Banküberweisungen und mehr. Diese Vielfalt an Zahlungsoptionen gibt Benutzern Flexibilität und Komfort bei der Verwaltung ihrer Zahlungseinstellungen. 

## Rechnungen herunterladen

Time cockpit stellt alle bisherigen Rechnungen direkt im Modul Kontoverwaltung zum Download bereit. Benutzer können ihre Rechnungen für Buchhaltung und Ablage aufrufen und herunterladen.
