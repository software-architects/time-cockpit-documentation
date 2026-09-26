---
title: Aliquoter Urlaub (Urlaubsaliquotierung)
description: Wie time cockpit Urlaubsansprüche aliquotiert, deren Anspruchsdatum noch kein volles Jahr zurückliegt.
en_page: doc/employee-time-tracking/prorated-vacation.md
---

# Aliquoter Urlaub (Urlaubsaliquotierung)

Wurde ein Urlaubsanspruch erst vor Kurzem gewährt, steht dem Mitarbeiter möglicherweise noch nicht der volle Umfang zu. Die Funktion **Urlaubsaliquotierung** berechnet, wie viel eines aktuellen Anspruchs zu einem bestimmten Stichtag verfügbar ist.

## Überblick

Ohne Aliquotierung enthält der Resturlaub den vollen Anspruch ab dem Zeitpunkt, an dem er angelegt wird. Mit aktivierter Aliquotierung zieht time cockpit den Teil jedes aktuellen Anspruchs ab, der noch nicht „erworben“ ist – also die Tage, die noch bis zu einem vollen Jahr nach dem Anspruchsdatum fehlen.

Die Aliquotierung gilt für die Liste **Resturlaub**. Sie schalten sie mit dem Filter **Aliquotieren** in dieser Liste ein oder aus.

## Funktionsweise

1. Der Resturlaub wird wie gewohnt berechnet (ohne Aliquotierung).
2. Alle Ansprüche, deren Anspruchsdatum innerhalb eines Jahres vor dem Stichtag liegt (einschließlich des Stichtags), werden ermittelt. Ansprüche außerhalb dieses Einjahreszeitraums sind bereits vollständig erworben und nicht betroffen.
3. Für jeden betroffenen Anspruch werden die seit dem Anspruchsdatum vergangenen Tage mit der Länge des Anspruchsjahres verglichen. Der noch nicht erworbene Teil des Anspruchs wird vom Saldo abgezogen.
4. Das Ergebnis wird in Wochen angezeigt, auf zwei Nachkommastellen gerundet.

### Details der Berechnung

Die Aliquotierung wird tageweise berechnet und berücksichtigt Schaltjahre:

- **Vergangene Tage** = Anzahl der Tage vom Anspruchsdatum bis zum Stichtag + 1 (das Anspruchsdatum selbst gilt als erworben)
- **Jahreslänge** = 366, wenn das Anspruchsjahr ein Schaltjahr ist, sonst 365
- **Verhältnis** = vergangene Tage / Jahreslänge
- Wenn Verhältnis < 1: **Abzug** = Anspruch in Wochen × (1 − Verhältnis)
- Wenn Verhältnis ≥ 1: kein Abzug (der Anspruch ist vollständig erworben)

Da die Berechnung die tatsächliche Anzahl der Tage verwendet, spielt es keine Rolle, ob ein Jahreswechsel in den Zeitraum fällt.

### Welche Ansprüche werden aliquotiert?

Ein Anspruch wird nur dann aliquotiert, wenn **alle** folgenden Bedingungen erfüllt sind:

- Sein Anspruchsdatum liegt innerhalb des Einjahreszeitraums vor dem Stichtag (also von `effective date minus one year plus one day` bis `effective date`)
- Er ist **nicht** als außerordentlicher Anspruch markiert

Ansprüche, die als **Außerordentlicher Urlaubsanspruch** markiert sind, werden nie aliquotiert. Verwenden Sie diese Markierung für einmalige Gewährungen (z. B. Bonusurlaub), die sofort in voller Höhe verfügbar sein sollen.

## Beispiel

Ein Mitarbeiter erhält am **1.1.2026** einen regulären Urlaubsanspruch von **5 Wochen**. Die HR-Administratorin prüft den aliquoten Saldo mit dem Stichtag **1.4.2026**.

| Schritt | Wert |
|---|---|
| Anspruchsdatum | 1.1.2026 |
| Stichtag | 1.4.2026 |
| Vergangene Tage | (1.4. − 1.1.) + 1 = 91 Tage |
| Jahreslänge (2026 ist kein Schaltjahr) | 365 |
| Verhältnis | 91 / 365 ≈ 0,2493 |
| Abzug | 5 × (1 − 0,2493) = 5 × 0,7507 ≈ 3,75 Wochen |

Hat der Mitarbeiter noch keinen Urlaub genommen, beträgt der normale Resturlaub 5,00 Wochen. Mit Aliquotierung verringert sich der Saldo um 3,75 Wochen, sodass sich ein aliquoter Saldo von etwa **1,25 Wochen** ergibt.

Zum 1. April hat der Mitarbeiter also etwa ein Viertel des Jahresanspruchs erworben – was der Überlegung entspricht, dass drei von zwölf Monaten vergangen sind.

> [!NOTE]
> Erhält derselbe Mitarbeiter am 1.2.2026 zusätzlich einen **außerordentlichen Anspruch** von 1 Woche, wird diese zusätzliche Woche **nicht** aliquotiert. Der aliquote Saldo beträgt dann 1,25 + 1,00 = **2,25 Wochen** (vor Abzug des verbrauchten Urlaubs).

## Außerordentlicher Anspruch

Das Kontrollkästchen **Außerordentlicher Urlaubsanspruch** in einem Urlaubsanspruch markiert den Anspruch als einmalige Gewährung, die nicht aliquotiert werden soll. Typische Anwendungsfälle:

- Bonusurlaub für ein Firmenjubiläum oder eine besondere Leistung
- Zusätzlicher Urlaub, der im Rahmen einer Vereinbarung oder Einigung gewährt wird
- Ausgleichsansprüche, die sofort verfügbar sein sollen

Um einen Anspruch als außerordentlich zu markieren, öffnen Sie ihn unter `Benutzer -> Urlaubsanspruch` und aktivieren Sie **Außerordentlicher Urlaubsanspruch**. Ist das Kontrollkästchen nicht aktiviert, wird der Anspruch als regulärer (aliquotierbarer) Anspruch behandelt.

## Aliquotierung in der Liste Resturlaub verwenden

1. Öffnen Sie `Benutzer -> Resturlaub`.
2. Setzen Sie den Filter **Stichtag** auf das Datum, das Sie prüfen möchten.
3. Setzen Sie den Filter **Aliquotieren** auf **Ja**, um aliquote Salden zu sehen, oder auf **Nein** (Standard), um den normalen Saldo zu sehen.

Die Spalte **Resturlaub in Wochen** zeigt den aliquoten Saldo, wenn der Filter aktiv ist.

## Verwandte Seiten

- [Resturlaub](/doc/reference/lists/vacation-per-effective-date.html)
- [Urlaubsanspruch](/doc/reference/lists/vacation-entitlement.html)
- [Arbeitszeit / Urlaub](~/doc/arbeitszeiterfassung/arbeitszeit.md)
- [Abwesenheitsverwaltung](~/doc/arbeitszeiterfassung/abwesenheitsverwaltung.md)
