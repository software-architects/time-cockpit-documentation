---
title: Prorated Vacation (Urlaubsaliquotierung)
description: How time cockpit prorates vacation entitlements that have not yet reached a full year since their entitlement date.
---

# Prorated Vacation (Urlaubsaliquotierung)

When a vacation entitlement has been granted recently, the employee may not yet be entitled to the full amount. The **Prorated Vacation** feature calculates how much of a recent entitlement is available as of a given effective date.

## Overview

Without proration, the remaining vacation balance includes the full entitlement from the moment it is created. With proration enabled, time cockpit deducts the portion of each recent entitlement that has not yet been "earned" — i.e. the days remaining until a full year after the entitlement date.

The proration applies to the **Vacation per Effective Date** list. You can switch it on or off using the **Prorate** filter on that list.

## How It Works

1. The remaining vacation balance is calculated as usual (without proration).
2. All entitlements whose entitlement date is within one year before (and including) the effective date are identified. Entitlements outside this one-year window are already fully earned and are not affected.
3. For each qualifying entitlement, the days elapsed since the entitlement date are compared to the length of the entitlement year. The portion of the entitlement that is not yet earned is deducted from the balance.
4. The result is displayed in weeks, rounded to two decimal places.

### Calculation Details

The proration is calculated per day and accounts for leap years:

- **Days elapsed** = number of days from the entitlement date to the effective date + 1 (the entitlement date itself counts as earned)
- **Year length** = 366 if the entitlement year is a leap year, 365 otherwise
- **Ratio** = days elapsed / year length
- If ratio < 1: **deduction** = entitlement weeks × (1 − ratio)
- If ratio ≥ 1: no deduction (the entitlement is fully earned)

Because the calculation uses the actual number of days, it does not matter whether a calendar-year boundary falls within the period.

### Which Entitlements Are Prorated?

An entitlement is prorated only if **all** of the following are true:

- Its entitlement date is within the one-year window before the effective date (i.e. from `effective date minus one year plus one day` to `effective date`)
- It is **not** marked as an extraordinary entitlement

Entitlements marked as **Extraordinary Entitlement** are never prorated. Use this flag for one-time grants (e.g. bonus vacation) that should be available in full immediately.

## Example

An employee receives a standard vacation entitlement of **5 weeks** on **January 1, 2026**. The HR administrator checks the prorated balance with an effective date of **April 1, 2026**.

| Step | Value |
|---|---|
| Entitlement date | January 1, 2026 |
| Effective date | April 1, 2026 |
| Days elapsed | (April 1 − January 1) + 1 = 91 days |
| Year length (2026 is not a leap year) | 365 |
| Ratio | 91 / 365 ≈ 0.2493 |
| Deduction | 5 × (1 − 0.2493) = 5 × 0.7507 ≈ 3.75 weeks |

If the employee has not taken any vacation, the standard remaining balance is 5.00 weeks. With proration, the balance is reduced by 3.75 weeks, resulting in a prorated balance of approximately **1.25 weeks**.

This means that as of April 1, the employee has earned roughly one quarter of the annual entitlement — which matches the intuition that three months have passed out of twelve.

> [!NOTE]
> If the same employee also receives an **extraordinary entitlement** of 1 week on February 1, 2026, that extra week is **not** prorated. The prorated balance would be 1.25 + 1.00 = **2.25 weeks** (before any vacation usage).

## Extraordinary Entitlement

The **Extraordinary Entitlement** checkbox on a vacation entitlement record marks the entitlement as a one-time grant that should not be prorated. Typical use cases:

- Bonus vacation for a company anniversary or special achievement
- Additional vacation granted as part of a settlement or agreement
- Compensatory entitlements that should be immediately available

To mark an entitlement as extraordinary, open the entitlement in `User -> Vacation Entitlement` and check **Extraordinary Entitlement**. If the checkbox is unchecked, the entitlement is treated as a regular (proratable) entitlement.

## Using Proration in the Vacation per Effective Date List

1. Open `User -> Vacation per Effective Date`.
2. Set the **Effective Date** filter to the date you want to check.
3. Set the **Prorate** filter to **Yes** to see prorated balances, or **No** (default) to see the standard balance.

The **Remaining Leave in Weeks** column reflects the prorated balance when the filter is active.

## Related Pages

- [Vacation per Effective Date](../reference/lists/vacation-per-effective-date.md)
- [Vacation Entitlement](../reference/lists/vacation-entitlement.md)
- [Working Time / Leave](working-time.md)
- [Absence Management](absence-time-management.md)
