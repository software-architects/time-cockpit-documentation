---
title: Navigation - Eigene Module und Menüs
description: "Eigene Navigationsmodule, Abschnitte und Links in time cockpit anlegen: Anpassungen mit hierarchischen Menüs strukturieren und Listen ordnen."
en_page: doc/data-model-customization/navigation.md
---
# Navigation	

Dieses Kapitel beschreibt, wie Sie in time cockpit eigene Module, Abschnitte und Links definieren, um Ihre Anpassung besser zu strukturieren.

In time cockpit können Sie eigene Listen anlegen. Um diese eigenen Listen für Benutzer verfügbar zu machen, können Sie ein eigenes Menü anlegen, in dem Sie Ihre Listen verlinken. Für hierarchische Menüs bietet time cockpit drei Ebenen: Module, Abschnitte und Links.

## Module

Die oberste Ebene eines Menüs in time cockpit ist ein Modul. Module befinden sich oben in time cockpit. Standardmäßig wird time cockpit mit 3 vordefinierten Modulen ausgeliefert. Das Modul Zeiterfassung enthält den Zeiterfassungskalender. Im Modul Verwaltung verwalten Benutzer ihre Stammdaten. Das Modul Benutzer fasst alle benutzerbezogenen Informationen zusammen 

![Modulbereich](/doc/data-model-customization/images/wc-menu.png "Modulbereich")

Module werden im Modul Anpassung angelegt. Im Folgenden zeigen wir nur, wie Sie die häufigste Art von Modulen anlegen, ein Navigation Module. In einem Navigation Module können Sie Links auf Listen definieren, um beispielsweise durch Ihre Stammdaten zu navigieren. Im Folgenden definieren wir ein eigenes Modul für die Rechnungslegung (Invoicing).

![Neues Modul](/doc/data-model-customization/images/new-module.png "Neues Modul")

Um ein neues Modul anzulegen, wechseln Sie in das Modul Anpassung, wechseln auf Server und klicken wie in der obigen Abbildung auf Neues Modul. Ein Modul hat vier Pflichtfelder:

Feld | Beschreibung
--- | ---
Name |Der technische Name des Moduls. Dieser Name muss eindeutig sein.
Anzeigename | Der Name, der in der Benutzeroberfläche angezeigt wird.
Sortierreihenfolge | Die Sortierreihenfolge legt fest, in welcher Reihenfolge die Module links unten angezeigt werden.
Modultyp | Legt den Typ des Moduls fest. In diesem Thema legen wir nur ein Navigation Module an.

Die obigen Felder müssen einen Wert haben, damit das Modul gespeichert werden kann. Zusätzlich können Sie folgende Felder konfigurieren:

Feld | Beschreibung
--- | ---
Icon | time cockpit bietet standardmäßig eine vordefinierte Auswahl an Symbolen für Ihr Modul. Das gewählte Symbol erscheint links unten in time cockpit neben dem Anzeigenamen Ihres Moduls. Für unser Modul Invoicing wählen wir das Symbol Billing.
Formel für Sichtbarkeit | Mit der Formel für Sichtbarkeit steuern Sie zum Beispiel, welche Benutzer das Modul sehen dürfen. Wenn Sie das Modul Invoicing vor allen Benutzern außer Administratoren und Mitarbeitenden des Backoffice verbergen möchten, können Sie folgende Formel für Sichtbarkeit definieren: `'Admin' In Set('CurrentUserRoles') Or 'BackOffice' In Set('CurrentUserRoles')`. Formel für Verfügbarkeit: Deaktivierte Module werden links unten in time cockpit grau angezeigt.
Standard Datenkontext | Dieses Feld teilt time cockpit mit, welcher Kontext beim Öffnen eines Moduls standardmäßig verwendet wird. Sie können zwischen zwei Optionen wählen, Client und Server. Wählen Sie Client, zeigt das Modul die Daten aus Ihrer lokalen Datenbank an. Wählen Sie Server, zeigt das Modul die Daten aus Ihrer zentralen Datenbank an. Da unser Modul Invoicing nur auf dem Server verfügbar sein soll, wählen wir Server als Standard Datenkontext.

Die folgende Abbildung zeigt das konfigurierte Modul. Wir haben nun die oberste Ebene unserer Menüstruktur konfiguriert, ein Symbol gewählt und festgelegt, für wen das Modul sichtbar sein soll.

![Konfiguriertes Modul](/doc/data-model-customization/images/configured-module.png "Konfiguriertes Modul")

Als Nächstes definieren wir die weiteren Ebenen der Menühierarchie, nämlich Abschnitte und Links.

## Abschnitte

Abschnitte sind die zweite Ebene der Menühierarchie. Ein Abschnitt fasst mehrere Links, zum Beispiel auf Listen, zusammen. Im Unterschied zu Modulen kann ein Abschnitt zugeklappt werden, ansonsten unterscheiden sich Abschnitte kaum von Modulen. Das gilt auch für die Felder, die gesetzt werden müssen.

Feld | Beschreibung
--- | ---
Name of section | Der technische Name des Abschnitts. Dieser Name muss pro Modul eindeutig sein.
Anzeigename | Der Name, der in der Benutzeroberfläche angezeigt wird.

Außerdem können Sie TCQL-Ausdrücke definieren, die steuern, ob der Abschnitt sichtbar ist und ob er aktiviert sein soll. Wie bei Modulen können Sie einen Abschnitt vor Benutzern verbergen, die nicht zu einer bestimmten Gruppe gehören. Die **Formel für Verfügbarkeit** legt fest, ob ein Abschnitt deaktiviert angezeigt wird oder nicht.

Um einen neuen Abschnitt anzulegen, klicken Sie in der Baumansicht Sections mit der rechten Maustaste auf den Knoten Section und wählen Neuer Bereich. Für unser Modul Invoicing legen wir zwei Abschnitte für zwei unterschiedliche Themen an. Der erste Abschnitt, Time Sheet Related, fasst alle Links zusammen, die sich auf Zeitbuchungen beziehen. Der zweite Abschnitt, Invoices, fasst alle Links zusammen, die sich auf Rechnungen beziehen.

![Neuer Abschnitt](/doc/data-model-customization/images/new-section.png "Neuer Abschnitt")

Der erste Abschnitt, Time Sheet Related, soll für alle Benutzer zugänglich sein, die das Modul Invoicing sehen dürfen. Wir benötigen weder eine **Formel für Sichtbarkeit** noch eine **Formel für Verfügbarkeit**, weil nur Administratoren und Mitarbeitende des Backoffice das Modul Invoicing und alle seine Abschnitte sehen. Mitarbeitende des Backoffice dürfen diesen Abschnitt sehen, damit sie Korrekturen an nicht verrechneten Zeitbuchungen vornehmen können.

Der zweite Abschnitt, Invoices, soll nur für Administratoren zugänglich sein. Wir möchten den Abschnitt jedoch nicht vollständig verbergen, sondern ihn für Mitarbeitende des Backoffice nur deaktivieren. Die folgende **Formel für Verfügbarkeit** stellt sicher, dass der Abschnitt Invoicing nur für Administratoren zugänglich ist.

```
'Admin' In Set('CurrentUserRoles')
```

![Deaktivierter Abschnitt](/doc/data-model-customization/images/disabled-section.png "Deaktivierter Abschnitt")

Bevor wir prüfen, ob die **Formel für Verfügbarkeit** den Abschnitt Invoicing für Mitarbeitende des Backoffice deaktiviert, müssen wir die letzte Ebene der Menühierarchie hinzufügen, nämlich Links.

## Links

Um einen neuen Link anzulegen, klicken Sie mit der rechten Maustaste auf den Abschnittsknoten, dem Sie einen neuen Link hinzufügen möchten. Wir fügen dem Abschnitt Timesheets einen neuen Link hinzu, der die Liste aller nicht verrechneten Zeitbuchungen öffnen soll.

![Neuer Link](/doc/data-model-customization/images/new-link.png "Neuer Link")

Ein Link hat viele Felder mit Modulen und Abschnitten gemeinsam. Zusätzlich bietet ein Link folgende Felder zur Konfiguration:

Feld | Beschreibung
--- | ---
Zielfenster | Das Feld Zielfenster gibt an, ob time cockpit beim Klick auf den Link einen neuen Tab öffnen oder einen bestehenden Tab mit demselben Namen wiederverwenden soll. Es ähnelt stark dem Attribut Target in HTML. In der folgenden Abbildung haben wir UnbilledTS als Zielfenster für den Link festgelegt. Wenn wir kein Zielfenster festlegen, sondern das Feld leer lassen, öffnet time cockpit bei jedem Klick auf den Link einen neuen Tab.
Typ des Links | time cockpit unterstützt standardmäßig 5 verschiedene Arten von Links. Im Folgenden beschreiben wir die Verwendung der häufigsten Linkart, NamedList. Ein Link vom Typ NamedList zeigt eine Liste von Datensätzen einer bestimmten Entität an.

![Link konfigurieren](/doc/data-model-customization/images/configure-link.png "Link konfigurieren")

Bei Links vom Typ NamedList können Sie zwischen einer Entität und einer bestimmten Liste wählen. Wählen Sie eine Entität, sucht time cockpit nach der konfigurierten Standardliste und öffnet diese, wenn Sie auf den Link klicken. Das hat den Vorteil, dass sich bei einer Änderung der Standardliste der Entität auch die Liste ändert, die beim Klick auf den Link geöffnet wird. Wenn Sie auf eine bestimmte Liste verlinken möchten, wählen Sie diese Liste im Dropdown-Feld aus. In unserem Beispiel möchten wir die Liste öffnen, die die nicht verrechneten Zeitbuchungen enthält.

![Bestimmte Liste](/doc/data-model-customization/images/specific-list.png "Bestimmte Liste")

Im Abschnitt Invoicing definieren wir einen weiteren Link, der eine Liste von Rechnungen öffnet. Da es keine eigene Liste für Rechnungen gibt, wählen wir die Standardliste, die für die Entität Invoice definiert ist.

![Link auf Rechnungen](/doc/data-model-customization/images/invoice-link.png "Link auf Rechnungen")

Öffnet ein Benutzer mit der Rolle Admin time cockpit, sieht das Menü Invoicing wie in der folgenden Abbildung aus. Das Modul Invoicing ist sichtbar, und sowohl der Abschnitt Invoicing als auch der Abschnitt Time Sheet Related sind aktiviert. Administratoren können auf die entsprechenden Links klicken, um nicht verrechnete Zeitbuchungen und Rechnungen anzuzeigen.

![Ansicht für Administratoren](/doc/data-model-customization/images/admin-view.png "Ansicht für Administratoren")

Öffnen dagegen Benutzer, die nur die Rolle Backoffice haben, time cockpit, sehen sie die folgende Ansicht des Menüs Invoicing. Beachten Sie, dass nun der gesamte Abschnitt Invoicing deaktiviert ist.

![Ansicht für das Backoffice](/doc/data-model-customization/images/back-office-view.png "Ansicht für das Backoffice")

Alle Änderungen an der Menüstruktur werden mit dem integrierten Synchronisierungsmechanismus von time cockpit an die Clients übertragen. Das heißt, nachdem Benutzer synchronisiert und neu gestartet haben, zeigt ihnen time cockpit die neue Menüstruktur an. Verwenden Benutzer nur den Silverlight-Client, stehen ihnen die Änderungen an der Menüstruktur bei der nächsten Anmeldung zur Verfügung.
