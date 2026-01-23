# Doku Freigabeprozess für Abwesenheiten

Der Freigabeprozess für Abwesenheiten kann in den Globalen Einstellungen separat für alle drei Arten der Abwesenheiten in time cockpit aktiviert werden:

- Urlaub/Sonderurlaub
- Zeitausgleich
- Krankenurlaub

Ab Aktivierung einer der Kategorien müssen Benutzer ihre eingetragenen Abwesenheiten der jeweiligen Kategorie von ihrem Vorgesetzten (Abteilungsleiter ihrer zugeordneten Abteilung - zusätzlich ist die Rolle Department-Lead erforderlich) oder einem Benutzer mit der Rolle HR-Admin freigegeben werden.

Die Freigabe der Abwesenheiten ist nur für jene Benutzer nötig die das auch in den Benutzerstammdaten eingestellt haben. Dies ist mit der Checkbox "Abwesenheitsgenehmigung erforderlich" möglich. Bei jenen Benutzern mit nicht erforderlicher Abwesenheitsgenehmigung werden alle neu eingetragenen Abwesenheiten automatisch als genehmigt markiert, sofern der Genehmigungsprozess in den globalen Einstellungen für die jeweilige Abwesenheitsart aktiviert ist.

Ab dem Zeitpunkt der Aktivierung in den globalen Einstellungen und den Benutzerstammdaten werden je nach Berechtigungen nicht genehmigten Abwesenheiten (auch alle in der Vergangenheit vor Aktivierung dieser Funktion) im Abwesenheitskalender als nicht genehmigte Abwesenheit angezeigt. Bereits erledigte Abwesenheiten vor Aktivierung der Funktion müssen somit nachträglich als genehmigt markiert werden.

**Sichtbare Daten im Abwesenheitskalender je nach zugeordneten Benutzerrollen**

**Time Tracking User**:

Sieht im Abwesenheitskalender alle Abwesenheiten der Benutzer seiner zugewiesenen Abteilung. Bei den Abwesenheiten der Kollegen kann man dabei bewusst nicht erkennen um welche Art der Abwesenheit (Urlaub, Krankenurlaub, Zeitausgleich) es sich dabei handelt. In der Liste oberhalb des Kalenders werden nur eigene noch nicht genehmigte Abwesenheiten angezeigt.

**Department Lead:**

Sieht im Abwesenheitskalender alle Abwesenheiten der Benutzer seiner eigenen zugewiesenen Abteilung sowie die Abwesenheiten der Benutzer jener Abteilungen, wo der Benutzer als Abteilungsleiter hinterlegt ist. Jeder Benutzer kann selbst nur in einer Abteilung zugeteilt sein (in den Benutzerstammdaten). Man kann jedoch in mehreren Abteilungen als Abteilungsleiter zugeteilt sein (Stammdaten der Abteilungen).

In der Liste der Abwesenheiten werden die eigenen noch nicht genehmigten Abwesenheiten angezeigt und die noch nicht genehmigten Abwesenheiten der Benutzer aus der Abteilung des Department Leads.

**Human Resources Admin:**

Sieht im Abwesenheitskalender alle Abwesenheiten der Benutzer seiner zugewiesenen Abteilung. In der Liste der nicht genehmigten Abwesenheiten werden nur eigene noch nicht genehmigte Abwesenheiten angezeigt. Als Human Resources Admin kann man in Vertretung der Abteilungsleiter die Abwesenheiten aller Benutzer freigeben. Dafür gibt es die Möglichkeit der Verwendung der weiteren Filter:

- Checkbox "Alle Benutzer anzeigen"

Bei Aktivierung der Checkbox werden die Abwesenheiten aller Benutzer im Abwesenheitskalender geladen. Sowie alle nicht genehmigten Abwesenheiten in der Liste. Um diese Daten einschränken zu können gibt es die beiden weiteren Filterfelder Abteilung und Benutzer

- Auswahlfeld "Abteilung"
- Auswahlfeld "Benutzer"

Department Leads und Human Resources Admins können Abwesenheiten mit ausstehender Genehmigung in der Liste oberhalb des Abwesenheitskalenders entweder genehmigen oder ablehnen. Das ist mit den beiden Aktionen in den Spalten rechts außen möglich. Vor Freigabe/Ablehnung der Abwesenheit kann durch Markierung der Zeile die betroffene Abwesenheit im Kalender darunter betrachtet werden. Der Kalender wird dabei automatisch auf den Startzeitraum der Abwesenheit gesetzt. Somit können auch die bereits eingetragenen Abwesenheiten der anderen Benutzer der betroffenen Abteilung verglichen werden und in der Entscheidung für die Freigabe/Ablehnung berücksichtigt werden.

Ansicht als Human Resources Admin:

![Absence Time Calendar](images/absence-time-calendar.png "Absence Time Calendar")

**Automatische Benachrichtigungen bei aktiviertem Freigabeprozess**

Wird eine neue Abwesenheit von einem Benutzer angelegt so werden die Abteilungsleiter des Benutzers automatisch über eine neue ausstehende Genehmigung via Benachrichtigung in time cockpit (Glocke im Menü rechts oben) informiert. Die Benachrichtigungen für Abteilungsleiter können bei Bedarf auch in den Stammdaten der Abteilung je Abteilungsleiter deaktiviert werden.

![Disable Receive Notifcation](images/department-lead-receive-notification.png "Disable Receive Notifcation")

Wurde eine Abwesenheit genehmigt oder abgelehnt so werden die dafür erstellten Benachrichtigungen an die Abteilungsleiter automatisch gelöscht.

Nach erfolgter Genehmigung/Ablehnung erhält der anfragende Benutzer ebenso eine Benachrichtigung, wann von wem die Abwesenheit bearbeitet wurde. Im Falle einer Ablehnung kann die bearbeitende Person auch einen Ablehnungsgrund anführen. Dieser ist auch in der Benachrichtigung an den anfragenden Benutzer enthalten. Weiters wird bei Ablehnung einer Abwesenheit diese auch gelöscht. Die Benachrichtigungen für genehmigte Abwesenheiten werden nicht automatisch gelöscht. Somit können diese als schriftliche Bestätigung aufbewahrt werden.

![Absence Time Notification](images/absence-time-notification.png "Absence Time Notification")