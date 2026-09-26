---
title: Berechtigungen - Rollenbasierte Zugriffskontrolle
description: "Berechtigungen in time cockpit mit Rollen konfigurieren: Entitäts- und Eigenschaftsberechtigungen sowie Sicherheit auf Zeilenebene für Ihr Datenmodell."
en_page: doc/data-model-customization/permission.md
---
# Berechtigungen

time cockpit hat eine vollständig konfigurierbare und erweiterbare Berechtigungsverwaltung. In der Standardkonfiguration von time cockpit basiert die Berechtigungsverwaltung darauf, Benutzern Rollen zuzuweisen. 

time cockpit wird mit zwei vordefinierten Rollen ausgeliefert, ```Admin``` und ```User```. Auf Basis dieser beiden Rollen sind in der Standardkonfiguration von time cockpit Berechtigungen definiert. Alle Benutzer werden der Rolle ```User``` zugewiesen, wenn sie über die Website (www.timecockpit.com) angelegt werden. Je nachdem, ob einem Benutzer beim Anlegen auf der Website die Rolle ```Admin``` gegeben wurde, wird ihm auch in time cockpit die Rolle ```Admin``` zugewiesen. Administratoren dürfen das Modul Anpassung in time cockpit verwenden, das Datenmodell bearbeiten, Abfragen ausführen und IronPython-Skripte ausführen. Administratoren dürfen außerdem Rollen anlegen und anderen Benutzern Rollen zuweisen.

## Entitäten für die Berechtigungsverwaltung

Im Standarddatenmodell von time cockpit ist das Rollenkonzept mit drei Entitäten umgesetzt. ```APP_UserDetail``` enthält die Informationen über einen Benutzer. ```APP_UserRole``` enthält die verschiedenen Rollen, die time cockpit unterstützt (standardmäßig ```Admin``` und ```User```). ```APP_UserDetailRole``` enthält die Zuordnung eines Benutzers zu verschiedenen Rollen. In time cockpit kann ein Benutzer mehreren Rollen zugewiesen sein.

> [!WARNING]
> Es wird nicht empfohlen, restriktive Berechtigungen auf die Entität ```APP_UserDetail``` zu setzen. Die Anwendung muss ihren eigenen Benutzereintrag jederzeit speichern können, denn im Benutzereintrag wird die Sprache des Benutzers gespeichert. Ein Benutzer kann seine Sprache ändern und muss seinen eigenen Benutzereintrag immer speichern können. Falsche Berechtigungen können dazu führen, dass time cockpit nicht mehr funktioniert. Wenn Sie bei Berechtigungen auf der Entität ```APP_UserDetail``` unsicher sind, wenden Sie sich an support@timecockpit.com. Bei Berechtigungen empfehlen wir **KISS** - Keep it small and simple!

![Entitäten für Berechtigungen](/doc/data-model-customization/images/permission-entities.png "Entitäten für Berechtigungen")

## Rollen verwalten

Da Rollen ganz normale Datensätze sind, wie z. B. ein Projekt, eine Zeitbuchung oder ein Kunde, können sie ebenfalls mit der Schaltfläche ```Neu``` angelegt werden. Nur Benutzer mit der Rolle ```Admin``` können neue Rollen anlegen. Eine Rolle hat 3 Eigenschaften.

* Code: Der Code der Rolle. Der Code sollte kurz sein und **muss** eindeutig sein.
* Name: Der Name der Rolle. Er dient dazu, die Rolle leichter zu erkennen.
* Beschreibung: Eine optionale, ausführlichere Beschreibung der Rolle.

Im Modul ```Benutzer``` finden Sie im Abschnitt "Rolemanagement" die Liste ```Rollen```, in der Rollen hinzugefügt, bearbeitet und entfernt werden können. Zusätzlich bietet time cockpit eine Liste ```Rollen zuordnen```. In dieser Liste können Zuordnungen von Benutzern zu Rollen angelegt werden.

![Berechtigungsverwaltung im Modul Benutzer](/doc/data-model-customization/images/permission-management-in-users-module.png "Berechtigungsverwaltung im Modul Benutzer")

## Berechtigungen anlegen

Wie für Validierungsregeln, berechnete Eigenschaften oder Standardwerte von Eigenschaften werden auch für Berechtigungen TCQL-Ausdrücke verwendet. Im Unterschied zu Validierungsregeln usw. gibt es in Berechtigungsausdrücken zusätzlich zu ```Current``` ein weiteres Schlüsselwort: ```Environment```. ```Environment``` gibt Zugriff auf globale und benutzerspezifische Eigenschaften. 
* Environment.CurrentUser: Der Benutzer, der aktuell am System angemeldet ist. ```Environment.CurrentUser``` ist der Datensatz der Entität APP_UserDetail, der dem aktuell angemeldeten Benutzer entspricht.
* Environment.GlobalSettings: Gibt Zugriff auf die systemweiten Einstellungen, die nicht von einem bestimmten Benutzer abhängen.

Der folgende Codeausschnitt zeigt eine einfache Berechtigung für einen Benutzer. Eine Aktion in time cockpit soll nur von einem Benutzer mit der Rolle ```Admin``` ausgeführt werden dürfen. Um diese Berechtigung umzusetzen, wird ein ```SetCurrentUserRoles``` verwendet, das im Standarddatenmodell enthalten ist. ```CurrentUserRoles``` liefert immer die Rollen eines angemeldeten Benutzers. Zur Veranschaulichung die Definition des Sets:

```
From R In APP_UserDetailRole 
Where R.UserDetail.UserDetailUuid = Environment.CurrentUser.UserDetailUuid 
Select New With 
{ 
  R.UserRole.Code 
}
```

Mit dem Set ```CurrentUserRoles``` können Sie Berechtigungen anlegen, die prüfen, ob der aktuell angemeldete Benutzer einer bestimmten Rolle zugewiesen ist. Die folgende Berechtigungsdefinition prüft, ob ein Benutzer der Rolle ```Admin``` zugewiesen ist. ```Set('CurrentUserRoles', 'Code')``` liefert das Ergebnis des Sets ```CurrentUserRoles``` für den angemeldeten Benutzer. Das Ergebnis des Sets ist eine Liste von Rollencodes. Die Berechtigung prüft, ob die Liste der Rollencodes eines Benutzers den Wert ```Admin``` enthält.

```
'Admin' In Set('CurrentUserRoles', 'Code')
```

> [!NOTE]
> Da ```CurrentUserRoles``` als **Logon-Set** konfiguriert ist, muss die Anwendung nach Änderungen an den Rollenzuordnungen neu gestartet werden. Logon-Sets werden **nur** einmal beim Start der Anwendung ausgeführt und bleiben während der Laufzeit der Anwendung unverändert!

## Arten von Berechtigungen

In time cockpit können Berechtigungen für verschiedene Elemente des Datenmodells vergeben werden. Im Folgenden werden alle Elemente beschrieben, für die Berechtigungen vergeben werden können. Die verschiedenen Arten von Berechtigungen werden anhand eines konkreten Szenarios beschrieben. Für das Szenario sollen folgende Anforderungen erfüllt werden:

1. Nur Benutzer mit der Rolle ```Projectadmin``` sollen Projekte anlegen können
1. Benutzer können Zeit nur auf Projekte erfassen, denen sie zugeordnet sind
1. Nur Benutzer mit der Rolle ```Projectadmin``` dürfen die Eigenschaft ```Projectbudget``` sehen
1. Die Liste ```Budgetkontrolle für Projekte``` soll nur für Benutzer mit der Rolle ```Evaluator``` verfügbar sein
1. Die Aktion ```Complete project``` soll nur von einem ```Projectadmin``` ausgeführt werden

Als Voraussetzung für die Anforderungen werden eine neue Rolle ```Projectadmin``` und ein neues Set ```MyProjects``` angelegt. Die Rolle ```Projectadmin``` soll einem Benutzer zugewiesen werden.

![Rolle Projectadmin anlegen](/doc/data-model-customization/images/create-project-admin-role-web.png "Rolle Projectadmin anlegen")

![Projectadmin zuweisen](/doc/data-model-customization/images/assign-project-admin-web.png "Projectadmin zuweisen")

Um das Set ```MyProjects``` umzusetzen, muss eine Mehrfachzuordnung zwischen einem Benutzer (```APP_UserDetail```) und einem Projekt (```APP_Project```) angelegt werden (siehe [M:N-Beziehungen zur Umsetzung von Mehrfachzuordnungen](~/doc/datenmodell-anpassung/entitaet.md)). Das Set ```MyProjects``` ist wie folgt definiert:

```
From P In UserDetailProject 
Where P.UserDetail.UserDetailUuid = Environment.CurrentUser.UserDetailUuid 
Select New With
{
  P.Project.Code
}
```

Das Set ist als **Logon**-Set definiert und liefert alle Projekte, die dem aktuell angemeldeten Benutzer zugeordnet sind.

## Berechtigungen auf Entitäten (Berechtigungen auf Zeilenebene)

Berechtigungen auf Entitäten sind Berechtigungen auf Zeilenebene, weil z. B. ein Projektdatensatz durch eine einzige Zeile in der Datenbank dargestellt wird. Entitätsberechtigungen stellen sicher, dass Datensätze einer Entität (z. B. Projekt) nicht gelesen oder bearbeitet werden können. In unserem Beispiel wäre Anforderung (1) ein Kandidat für eine Entitätsberechtigung. Projektdatensätze können nur von Benutzern angelegt werden, die der Rolle ```Projectadmin``` zugewiesen sind.

## Anforderung 1

Eine Schreibberechtigung für eine Entität wird im Modul Anpassung unter ```Edit entity -> Permissions``` hinzugefügt. Grundsätzlich werden Berechtigungen für Entitäten und für Eigenschaften / Beziehungen mit demselben Mechanismus angelegt. Ob eine Berechtigung für eine Entität definiert wird, legen Sie im Formular ```Neue Berechtigung``` fest. Beim Hinzufügen einer neuen Berechtigung können Sie entweder die Entität selbst oder Eigenschaften und Beziehungen auswählen. Wählen Sie im Kombinationsfeld den Namen der Entität aus, wird eine Berechtigung für die Entität angelegt (in diesem Beispiel Projekt). Wählen Sie eine Eigenschaft oder Beziehung aus, wird eine Berechtigung angelegt, die nur für diese Eigenschaft / Beziehung gilt. Da für Anforderung (1) eine Entitätsberechtigung benötigt wird, wird der Name der Entität (```APP_Project```) ausgewählt.

![Entitäts- und Eigenschaftsberechtigung](/doc/data-model-customization/images/entity-vs-property-permission-web.png "Entitäts- und Eigenschaftsberechtigung")

Wie eine Validierungsregel hat eine Berechtigung einen ```Name```, eine ```Error message``` und eine ```Condition```, die festlegt, ob ein Benutzer die Berechtigung hat oder nicht. Zusätzlich hat eine Berechtigung eine Eigenschaft ```Type```, die angibt, ob es sich um eine Lese- oder Schreibberechtigung handelt.

![Bedingung einer Berechtigung](/doc/data-model-customization/images/permission-condition.png "Bedingung einer Berechtigung")

Um sicherzustellen, dass nur Benutzer mit der Rolle ```Projectadmin``` Projekte anlegen dürfen, wird ```WriteProject``` mit der Bedingung ```'PA' In Set ('CurrentUserRoles', 'Code')``` definiert. Diese Berechtigung stellt sicher, dass nur Benutzer mit der Rolle ```Projectadmin``` Projekte anlegen können. **Benutzer ohne die Rolle ```Projectadmin``` haben damit nur Lesezugriff auf Projektdatensätze.**

![Schreibgeschütztes Projektformular](/doc/data-model-customization/images/read-only-project-form-web.png "Schreibgeschütztes Projektformular")

> [!NOTE]
> Wenn Sie die Schreibberechtigung für ein Element allen Benutzern entziehen möchten, müssen Sie als Bedingung einen Ausdruck eingeben, der immer falsch ist (zum Beispiel ```1 = 0```). Die aktuelle Version der TCQL-Ausdruckssprache unterstützt es nicht, ```False``` als Bedingung einzugeben.

## Anforderung 2

Um die Anforderung zu erfüllen, dass Benutzer nur die ihnen zugeordneten Projekte lesen können, muss eine Leseberechtigung für die Entität Projekt definiert werden. Dazu wird eine Berechtigung auf Basis des Sets ```MyProjects``` definiert.

![Leseberechtigung für Projekte](/doc/data-model-customization/images/read-project-permission-web.png "Leseberechtigung für Projekte")

Die Leseberechtigung ```Current.Code In Set ('MyProjects') Or 'PA' Set ('CurrentUserRoles')``` prüft, ob ein Projektdatensatz einem Benutzer zugeordnet ist oder ob ein Benutzer ```Projectadmin``` ist. Ist das der Fall, wird der Datensatz in der Projektliste des Benutzers angezeigt. Wie die folgende Abbildung zeigt, werden beim Anlegen einer Zeitbuchung im Auswahlfeld für Projekte nur die Projekte angezeigt, die dem angemeldeten Benutzer zugeordnet sind. Ist die Leseberechtigung ```ReadProject``` aktiviert, werden in der Benutzeroberfläche also nur Projekte angezeigt, die dem angemeldeten Benutzer zugeordnet sind.

![Nur zugeordnete Projekte lesen](/doc/data-model-customization/images/read-only-assinged-projects-web.png "Nur zugeordnete Projekte lesen")

<!-- ## Berechtigungen auf Eigenschaften und Beziehungen

Eine Schreibberechtigung für eine Eigenschaft und Beziehung wird im Modul Anpassung unter ```Edit entity -> Permissions``` hinzugefügt oder bearbeitet. Grundsätzlich werden Berechtigungen für Eigenschaften / Beziehungen und für Entitäten mit demselben Mechanismus angelegt. Ob eine Berechtigung für eine Eigenschaft / Beziehung definiert wird, legen Sie im Formular ```Neue Berechtigung``` fest. Wie die folgende Abbildung zeigt, können Sie im Kombinationsfeld für Berechtigungen auch Eigenschaften und Beziehungen sowie den _Namen der Entität_ auswählen. Wählen Sie im Kombinationsfeld den Namen einer Eigenschaft / Beziehung aus, wird eine Berechtigung für die Eigenschaft / Beziehung angelegt.

![Leseberechtigung für das Budget](/doc/data-model-customization/images/read-permission-on-budget.png "Leseberechtigung für das Budget") -->

<!-- ## Anforderung 3

Für Anforderung 3 muss eine Berechtigung für die Eigenschaft ```Budget``` der Entität ```APP_Project``` definiert werden. Die Eigenschaft Budget soll nur von Benutzern gelesen werden, die der Rolle ```Projectadmin``` zugewiesen sind. Diese Anforderung wird mit dem Berechtigungsausdruck ```'PA' In Set ('CurrentUserRoles', 'Code')``` umgesetzt. Diese Bedingung besagt, dass das Budget eines Projekts nur lesbar ist, wenn der angemeldete Benutzer die Rolle ```Projectadmin``` hat. Das gilt sowohl für eigene Listen als auch für Formulare.

Die folgende Abbildung zeigt zwei Projektlisten. Die linke Projektliste wurde mit der Berechtigung ```Projectadmin``` geöffnet, die rechte Projektliste mit den Berechtigungen eines normalen Benutzers. In der Projektliste des Benutzers mit der Rolle ```Projectadmin``` wird das Budget angezeigt. In der rechten Liste ohne die Rolle ```Projectadmin``` wird das Budget nicht angezeigt. Außerdem zeigt die Abbildung das Eingabeformular eines Projekts, das ohne die Rolle ```Projectadmin``` geöffnet wurde. Das Budget ist im Formular nicht sichtbar.

![Vergleich der Projektlisten](/doc/data-model-customization/images/project-list-comparison.png "Vergleich der Projektlisten")

> [!NOTE]
> An dieser Stelle wird die Definition einer Berechtigung für eine Eigenschaft gezeigt. Berechtigungen auf Beziehungen sind in vielerlei Hinsicht gleich und werden daher in diesem Dokument nicht gesondert behandelt. -->
