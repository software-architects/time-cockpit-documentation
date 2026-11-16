---
title: Dates in List Filters - Quick Picks and Dynamic Dates
description: Set common dates with one click and keep list filters current with dynamic dates, such as last month, that a list profile recalculates each time.
---
# Dates in List Filters

Every date field in the time cockpit web client opens a calendar. Below the calendar, quick picks set common dates with one click. In the filter of a list these dates are dynamic: a [list profile](~/doc/ui/lists/entityview-profiles.md) saves the rule instead of the date, so the filter is recalculated every time the list opens.

## Quick Picks

The quick picks of a field that selects a day stand in two columns, the earlier date of each pair on the left:

| Left | Right |
|------|-------|
| **Yesterday** | **Today** |
| **Start of week** | **End of week** |
| **Start of month** | **End of month** |
| **Start of last month** | **End of last month** |

- Below each name, the quick pick shows the weekday and date it stands for today.
- The first day of the week follows your culture settings.
- **Today**, **End of month**, and **End of last month** show the key that sets the same date in the date field: **T**, **N**, and **P** (see [Keyboard](#keyboard)).
- A field that selects a month offers **Last month** and **This month**, a field that selects a year **Last year** and **This year**.
- A quick pick whose date lies outside the range the field allows is disabled.
- Outside list filters, for example in a form, a quick pick sets a fixed date.

## Dynamic Dates in List Filters

In the filter of a list the quick picks are titled **Dynamic date**. Choosing one sets a dynamic date:

- The date field shows the date in italics with an fx icon after it. Its tooltip names the rule and today's date, for example "Dynamic: First day of last month (currently Thu, 10/1/2026)".
- The chosen quick pick is marked with a check mark. Below the quick picks, a line says that the date is recalculated every time the list opens.
- When you save a list profile, it saves the rule. A profile with **From** set to the first day of last month and **To** set to the last day of last month always shows the previous month.

**Use fixed date** next to the title keeps the current date and removes the rule. Picking a day in the calendar or typing a date also replaces a dynamic date with a fixed one.

## Custom Rule

For other dynamic dates, expand **Custom rule** below the quick picks. It reads like a sentence: a reference point, an amount, a unit, and **before today** or **after today**. The reference points use the same words as the quick picks, plus **The exact day**, **Start of year**, and **End of year**. With an amount of 0, the direction does not apply and is disabled.

| Dynamic date | Reference point | Amount and unit | Direction |
|--------------|-----------------|-----------------|-----------|
| 7 days ago | **The exact day** | 7 days | **before today** |
| First day of the month three months ago | **Start of month** | 3 months | **before today** |
| Last day of next week | **End of week** | 1 week | **after today** |

The custom rule is available in list filter fields that select a day. It opens by itself when a filter holds a dynamic date that none of the quick picks stands for.

If a field allows only a certain range and a custom rule or a shortcut key gives a date outside it today, the field turns red and its tooltip says "Today this dynamic date is outside the allowed range."

## Keyboard

- **Alt** + **Down** or **F4** in a date field opens and closes the calendar.
- With the calendar open, **Tab** moves to the quick picks.
- **Esc** closes the calendar and returns to the date field.
- In a field that selects a day, **T** (or **C**) sets today, **N** the last day of this month, and **P** the last day of last month. In a list filter these keys set the same dynamic date as the quick pick that shows them; elsewhere they set a fixed date.

## Related Pages

- [List Profiles](~/doc/ui/lists/entityview-profiles.md): save filters, columns, grouping, and sorting of a list
- [Grouping Lists](~/doc/ui/lists/grouping.md): group a list, collapse and expand groups or a whole grouping level
