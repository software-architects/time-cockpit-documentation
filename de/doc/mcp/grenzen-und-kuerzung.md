---
title: MCP-Grenzen, Kürzung und lang laufende Vorgänge
description: "Zeilen- und Größengrenzen des MCP-Servers von time cockpit: gekürzte Ergebnisse lesen, Stichproben bei Listenbeschreibungen, nicht abbrechbare Vorgänge."
keywords: [mcp gekürzt, mcp truncated, mcp zeilengrenze, mcp antwortgrenze, describe_list stichprobe, mcp-vorgang abbrechen, time cockpit]
en_page: doc/mcp/limits.md
---
# MCP-Grenzen, Kürzung und lang laufende Vorgänge

> [!WARNING]
> Im Aufbau: Der MCP-Server von time cockpit und diese Dokumentation werden aktiv weiterentwickelt, inkompatible Änderungen sind möglich. Tools können umbenannt, geändert oder entfernt werden, und Dialogbeschriftungen sowie Konfigurationsschritte können sich ohne Ankündigung ändern. Prüfen Sie diese Seite auf Aktualisierungen, bevor Sie die Einrichtung für Ihre Benutzer ausrollen, und rechnen Sie damit, Ihre Konfiguration, Skills und Prompts nach einem Update anpassen zu müssen.

Jeder Lesezugriff über den MCP-Server von time cockpit ist begrenzt. Das ist Absicht: Ein KI-Agent, der eine unbegrenzte Ergebnismenge abruft, ist langsam, teuer und meist weniger nützlich als einer, der eine engere Frage stellt. Diese Seite erklärt, welche Grenzen es gibt, woran Sie erkennen, dass eine erreicht wurde, und welche Vorgänge sich nach dem Start nicht mehr stoppen lassen.

## Zwei Arten von Grenzen

**Zeilengrenzen** begrenzen, wie viele Datensätze zurückkommen. Die Grenze wird angewendet, *bevor* die Daten abgerufen werden – sie wird in die Abfrage oder die Anfrage übernommen –, statt nachträglich Zeilen zu verwerfen. Standardmäßig liefert ein Lesezugriff höchstens 100 Zeilen.

**Größengrenzen** begrenzen, wie groß die Antwort sein darf, gemessen sowohl in Bytes als auch in geschätzten Tokens. Es gibt sie, weil wenige sehr breite Datensätze größer sein können als viele schmale.

Beide werden pro Bereitstellung konfiguriert, daher kann Ihr Administrator andere Werte als die Standardwerte festgelegt haben.

## Ein gekürztes Ergebnis lesen

Ein begrenztes Ergebnis gibt immer an, ob etwas weggelassen wurde:

- **`truncated: false`** – das ist die vollständige Antwort auf die gestellte Frage.
- **`truncated: true`** – es gab mehr. Das Ergebnis ist trotzdem gültig, nur nicht vollständig, und ein Eintrag in `warnings` nennt die Grenze, die es gekürzt hat.
- **`count`** ist immer die Anzahl der tatsächlich zurückgegebenen Zeilen. Es ist nie die Gesamtzahl der passenden Datensätze im Mandanten.

Was dagegen zu tun ist, ist fast immer dasselbe: **Stellen Sie eine engere Frage.** Ergänzen Sie einen Datumsbereich, einen Projekt- oder Benutzerfilter oder weniger Spalten und führen Sie die Abfrage erneut aus. Die Grenze anzuheben ist eine Entscheidung des Administrators und selten der richtige erste Schritt.

Das Kennzeichen ist exakt, auch bei einer reinen TCQL-Abfrage. Der Server fordert einen Datensatz mehr an, als die Grenze erlaubt, und verwendet diesen zusätzlichen Datensatz nur, um festzustellen, ob etwas zurückgeblieben ist. Ein Ergebnis, das die Grenze zufällig genau ausfüllt, wird daher als vollständig gemeldet, nicht als ungewiss – es gibt keine Antwort „möglicherweise gekürzt“, die Sie interpretieren müssten.

## Ergebnisse, die schrumpfen statt fehlzuschlagen

Manche Tools haben keine Argumente, mit denen sich die Abfrage sinnvoll eingrenzen ließe; ein Fehlschlag wegen einer Größengrenze ließe dem Aufrufer also keine Handlungsmöglichkeit. Diese Ergebnisse **lassen stattdessen Inhalte weg und melden das**:

- `get_environment` lässt Teile der Antwort in einer festen Reihenfolge weg – zuerst Zeilen von Named Sets, dann die globalen Einstellungen des Mandanten, dann die am wenigsten wichtigen Teile des Datensatzes des handelnden Benutzers – und meldet jedes Weglassen über `truncated` und `warnings`. Nichts wird stillschweigend weggelassen.
- `get_current_user` kürzt einen übergroßen Datensatz auf dieselbe Weise und behält dabei immer die Identität und den Anzeigewert des Datensatzes.
- `describe_entity` lässt zuerst Beschreibungen und dann Eigenschaften weg. Eine gekürzte Entitätsbeschreibung ist daher **keine** vollständige Eigenschaftsliste – gut zu wissen, bevor Sie schließen, dass eine Eigenschaft nicht existiert.

## Named Sets haben ein eigenes, viel größeres Budget

`get_environment` bleibt bewusst schlank, daher wird ein Named Set mit mehr Zeilen als die normale Lesegrenze dort gekürzt. `get_named_set` liest ein einzelnes Named Set eigenständig erneut, mit einem separaten und weit größeren Budget – standardmäßig bis zu 10.000 Zeilen. Wenn ein Named Set in `get_environment` `truncated: true` meldet, ist dies das nächste Tool, das Sie verwenden sollten.

Keiner der beiden Hosts kann ein Named Set an der Quelle begrenzen: Die Umgebung wird als Ganzes ausgewertet, bevor ein einzelnes Set daraus herausgegriffen werden kann. Die Grenze beschränkt, was übertragen wird, nicht die Arbeit, die der Mandant bereits erledigt hat.

## Listenbeschreibungen aus Stichproben

`describe_list` meldet die Ergebnisspalten und Parameter einer benannten Liste, damit ein Agent die Struktur einer Liste kennt, bevor er sie ausführt. Es liefert nie eigene Zeilen – die Zeilensammlung ist immer leer.

Wo der Server die Spalten aus der Definition der Liste selbst ableiten kann, sind sie exakt. Wo er das nicht kann, leitet er sie stattdessen aus einer **Stichprobenausführung der Liste mit höchstens 5 Zeilen** ab und meldet das in `warnings`. Der gehostete Server kann die Abfrage oder das Skript einer Liste nicht auswerten, ohne es auszuführen, und nimmt daher immer eine Stichprobe; der lokale Host nimmt nur bei einer skriptbasierten Liste eine Stichprobe, deren Struktur sich ohne Ausführung nicht bestimmen lässt.

Die Stichprobe betrifft nur die **Spalten**. Eine Spalte, die in jeder Stichprobenzeile leer ist, kann keinem Typ zugeordnet werden und wird als unbekannt gemeldet. Der Eintrag in `warnings` gibt an, ob die Spalten aus einer Stichprobe stammen und ob die Stichprobe leer war.

Die **Parameter** einer Liste werden auf beiden Hosts immer aus der Definition der Liste selbst gelesen, mit ihren tatsächlichen Typen und Pflichtkennzeichen. Sie werden nie aus Stichprobendaten erraten.

### Eine Liste, die einen Parameter erfordert

Viele Listen laufen erst, wenn ein Parameter einen Wert hat. `describe_list` beschreibt sie trotzdem, ohne dass Sie etwas angeben müssen: Es füllt die Parameter aus, die Sie weggelassen haben – mit dem Standardwert, den der Autor der Liste am Filterfeld festgelegt hat, oder es lässt das Feld leer, wo es keinen gibt – und nimmt mit diesen Werten eine Stichprobe der Liste.

Da diese ausgefüllten Werte bestimmen, welche Zeilen die Stichprobe sieht, nennt `warnings` jeden Parameter, der ausgefüllt wurde. Wenn die Stichprobe leer zurückkommt, liegt es meist daran: Geben Sie die Parameter an, die für Sie tatsächlich relevant sind, und rufen Sie `describe_list` erneut auf. Werte, die Sie angeben, werden nie überschrieben.

Zwei Grenzen sollten Sie kennen. Ein Standardwert, der als Ausdruck geschrieben ist (alles, was mit `=` beginnt), wird vom gehosteten Server nicht ausgewertet; ein solches Feld gilt daher als Feld ohne Standardwert. Und wenn die Definition der Liste überhaupt nicht gelesen werden kann, greift der Server auf das zurück, was ihm die Ablehnung durch den Mandanten verrät: keine Spalten, der eine in der Ablehnung genannte Parameter als Pflichtparameter mit dem Typ `Unknown` gemeldet, und eine Warnung, dass weitere solche Parameter existieren können.

`execute_list` schlägt bei einem fehlenden Parameter weiterhin fehl, mit einer Meldung, die ihn nennt. Es schuldet Ihnen Zeilen, und es hat keine.

> [!NOTE]
> `describe_list` wird Clients weiterhin als lesender, wiederholbarer Aufruf angeboten und erfordert keine Bestätigung. Das ist dieselbe Grundlage, auf der auch `execute_list` steht, und aus demselben Grund: Eine benannte Liste ist ein signiertes Modellartefakt, daher kann ihre Beschreibung nicht als riskanter gelten als ihre Ausführung. Was die Stichprobe allerdings ändert, sind die Kosten – die Beschreibung einer unbekannten skriptbasierten Liste kann das eigene Skript dieser Liste ausführen. Sie ist daher ein günstiger, begrenzter Lesezugriff und nicht der kostenlose Metadatenabruf, den ihr Name nahelegt.

## Vorgänge, die nicht abgebrochen werden können

Die meisten Vorgänge stoppen, wenn der Client abbricht. Zwei können das nicht, und die Tools sagen das auch, statt ein abgebrochenes Ergebnis zu melden, während die Arbeit im Hintergrund weiterläuft:

- **IronPython-Skripte** auf dem lokalen Host (`execute_script_literal`, `execute_script_file`). Sobald ein Skript gestartet ist, läuft es bis zum Ende: Ein Abbruch wird vor dem Start des Skripts geprüft, nie währenddessen.
- **Die Schreibphase von `create_timesheet_suggestion`.** Ein Abbruch wird bis zum ersten geschriebenen Datensatz berücksichtigt; danach werden die Schreibvorgänge abgeschlossen.

In der Praxis heißt das: Wenn ein Agent bei einem dieser Vorgänge zu hängen scheint, läuft die Arbeit wahrscheinlich noch. Gehen Sie nicht davon aus, dass sie zurückgerollt wurde, und prüfen Sie die betroffenen Datensätze, bevor Sie es erneut versuchen.

## Verwandte Seiten

- [Lokaler MCP-Server: Tools](~/doc/mcp/oncockpit-admin-lokal.md#tools)
- [Zugriff, Umfang und Bestätigung](~/doc/mcp/zugriff-umfang-und-bestaetigung.md)
- [KI-Agenten und der MCP-Server von time cockpit](~/doc/mcp/ueberblick.md)
