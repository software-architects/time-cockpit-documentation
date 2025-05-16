default permissions sind im weselntlichen, dass es drei use cases gibt.

einerseits, wenn man sihc als neukunde einen account anlegt. indiesem fall bekommt man einen time cockpit account wo ausnahmslos alle features aktiveirt sind. und somit auch die default permissions. 

dann gibt es bestandskunden die keine permissions haben. für diese kunden ist es wichtig, dass sie entshceiden, ob sie nun berechtiugngen einsetzen wollen oder nicht. zu diesem zwecks ist es nötig sich mit dem arktikel [Default Permission](~/doc/employee-time-tracking/default-permissions.md) vertraut zu machen. es ist wchtig zu verstehen, welche rolle welche auswirkung hat und zu entscheinden welcher user welche rolle bekommt. nachdem die rollen wie gewoht bei einem benutzer zugeordnet wurden bitte ein mail an support@timecockpit.com und wir aktivieren dieses feature.

bei bestandskunden mit vielen anpassungen im bereich permissions empfeheln wir, dass man alle opermissions durchgehen und etnshceident, wo default permissions vielleicht hiflriehc sein könnten. wir empfehlen allderings in diesem fall das default permission feature nicht zu aktivieren.

ACHTUNG: Auf jeden Fall ist es bei Bestandskunden wichtig folgendes im Blick zu haben. vor dem Rollout des default permission war es immer für alle benutzer möglich Datensätze in `GlobalSettings`, `ImportDefinition` und `TemplateQuery` anzulgen, zu bearbeiten oder zu löschen. Dies ist nun nur noch Mitarbeitern mit der Rolle `BasedataAdmin` möglich. Bitte denken Sie daran diese Rolle an die entsprechenden Benutzer zu vergeben.

es gibt auch noch eine änderung bei der admin rolle. in unseren bestrebungen die rollen fein granularer zu machen haben wir auch die admin rolle geändert. die admin rolle ist jetzt nur noch der "customization" admin (siehe auch [Default Permission](~/doc/employee-time-tracking/default-permissions.md)). der darf datenmodell anpasusngen machen, permissions deaktivieren udn aktivieren, aber nicht mehr automatisch im system alles machen. auch impersonated kann sich der admin noch. somit kann sich ein customization admin z.b. auch zum AccountAdmin machen um sich Benutzer hinzuzufügen oder zu locken. 

wir märzen dadurch eine historische unschönheit aus. Warum soll man, nur weil man Datenmodellanpassungen machen kann auch alle anderen Aspekte des Systems managen können. und im umkehrschluss: warum soll man - weil man alle Zeitbuchungen bearbeiten können will - auch Datenmodellanpassungen machen können

wichtig: beim einspielen des desfault permission features werden dem klassischen admin ALLE rollen gegeben die man ahben kann, also AccountAdmin, BillingAdmin, HumanResourcesAdmin etc. Somit wird sichergestellt, dass der klassische Admin dieselben Berechtiugngen hat wie vor den Default Permissions. 

Vor den DefaultPermissions gab es ein Flag `IsTenantAdmin` dieses Flag wurde nun durch die Rolle `AccountAdmin` ersetzt. Ein `AccountAdmin` darf Benutzerverwalten bzw. Rechnungsdaten verwalten.

