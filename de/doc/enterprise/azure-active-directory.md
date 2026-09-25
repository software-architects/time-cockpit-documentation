---
title: Azure-AD-Authentifizierung - SSO-Integration
description: "Konfigurieren Sie die Authentifizierung mit Azure Active Directory (AAD) für time cockpit: SSO, MFA und zentrale Benutzerverwaltung."
en_page: doc/enterprise/aad.md
---
# Azure Active Directory (AAD) für die föderierte Authentifizierung in time cockpit verwenden

Mit time cockpit können Sie die Sicherheit erhöhen und die Authentifizierung vereinfachen, indem Sie Azure Active Directory (AAD) integrieren. Diese Anleitung erklärt, wie Sie die AAD-Authentifizierung für Ihr time cockpit Konto konfigurieren, und zeigt ihre Vorteile.

## Voraussetzungen

Bevor Sie beginnen, stellen Sie sicher, dass Sie Folgendes haben:

- Ein time cockpit Konto.
- Ein Azure Active Directory-Konto.

## Vorteile der AAD-Authentifizierung

Die Integration der AAD-Authentifizierung in time cockpit bietet mehrere Vorteile:

- **Höhere Sicherheit**: AAD bietet leistungsfähige Sicherheitsfunktionen, darunter Multi-Faktor-Authentifizierung (MFA) und Sicherheitsstandards, um Ihr time cockpit Konto zu schützen.
- **Single Sign-On (SSO)**: Benutzer greifen mit ihren AAD-Anmeldedaten auf time cockpit zu. Das vereinfacht die Anmeldung und reduziert die Passwortmüdigkeit.
- **Benutzerverwaltung**: Vereinfachen Sie das Anlegen und Entfernen von Benutzern, indem Sie Ihre AAD-Benutzer mit time cockpit synchronisieren (erfordert eine individuelle Benutzerbereitstellung).
- **Zentrale Steuerung**: Verwalten Sie Benutzerzugriffe und Berechtigungen im Azure-Portal und sorgen Sie so für Einheitlichkeit in Ihrer gesamten Organisation.

## time cockpit für die Authentifizierung mit Azure Active Directory (AAD) konfigurieren

1. **Ermitteln Sie Ihre AAD-Verzeichnis-ID (Tenant-ID):**
   - Melden Sie sich bei Ihrem Azure Active Directory-Konto (AAD) an.
   - Ermitteln Sie die Verzeichnis-ID (auch Tenant-ID genannt) Ihres AAD.

2. **Kontaktieren Sie den time cockpit Support:**
   - Senden Sie eine E-Mail an support@timecockpit.com, um die Einrichtung der AAD-Authentifizierung für Ihr time cockpit Konto anzufordern.

Bei diesem Ansatz müssen Sie Benutzer weiterhin über die Funktionen der Kontoverwaltung in time cockpit zu Ihrem time cockpit Konto hinzufügen. 

Bei der Anmeldung versucht time cockpit, die von Ihnen angegebenen E-Mail-Adressen den Benutzern in Ihrem Azure Active Directory zuzuordnen. Ihre Mitarbeiter benötigen kein eigenes time cockpit Passwort mehr, sondern melden sich mit ihren Azure Active Directory-Anmeldedaten und Authentifizierungsmethoden bei time cockpit an. Wenn Sie einen Benutzer in Azure Active Directory deaktivieren, kann dieser Benutzer nicht mehr auf time cockpit zugreifen.

## Zuordnung über einen eigenen Claim in time cockpit mit Azure Active Directory (AAD) konfigurieren

time cockpit kann auch so konfiguriert werden, dass nicht die E-Mail-Adresse, sondern ein eigener Claim in Ihrem AAD für die Zuordnung verwendet wird. Das kann z. B. die interne Objekt-ID in AAD oder ein beliebiger anderer Claim sein, den Sie in Ihrem AAD verwalten. 

Beachten Sie: Wenn Sie sich für diesen Ansatz entscheiden, müssen Sie eine automatische Benutzerbereitstellung mit Ihrer Management-API umsetzen. Das bedeutet, dass Sie eigenen Code schreiben müssen, der Benutzer automatisch im time cockpit Konto anlegt. Beim Hinzufügen eines Benutzers muss der eigene Job auch den eigenen Claim setzen, der für die Zuordnung der Benutzer verwendet werden soll.

Wenn Sie Unterstützung bei der Umsetzung der automatischen Benutzerbereitstellung benötigen, schreiben Sie uns an support@timecockpit.com.

## Sicherheitsstandards und MFA aktivieren

Azure Active Directory bietet leistungsfähige Sicherheitsoptionen. Sie können die „Sicherheitsstandards“ (Security Defaults) aktivieren, um Ihr time cockpit Konto zu schützen. Zusätzlich sorgt die Aktivierung der „Multi-Faktor-Authentifizierung (MFA)“ für eine weitere Sicherheitsebene.

Wie Sie die „Sicherheitsstandards“ und „MFA“ aktivieren, lesen Sie in der folgenden Azure-Dokumentation:

- [Azure AD-Sicherheitsstandards](https://docs.microsoft.com/en-us/azure/active-directory/fundamentals/concept-fundamentals-security-defaults)
- [Azure AD Multi-Faktor-Authentifizierung](https://docs.microsoft.com/en-us/azure/active-directory/authentication/concept-mfa-howitworks)

Wenn Sie die oben beschriebenen Schritte befolgen und die Sicherheitsfunktionen von Azure Active Directory nutzen, erhöhen Sie die Sicherheit der Authentifizierung für Ihr time cockpit Konto.

Weitere Unterstützung und Hilfe bei der Problembehebung finden Sie in den Ressourcen des [time cockpit Supports](https://www.timecockpit.com/en/support).
