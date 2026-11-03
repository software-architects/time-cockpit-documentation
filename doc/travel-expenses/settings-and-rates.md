---
title: Travel Expenses - Settings, Rates and Calculation Rules
description: "Reference for travel expense settings, per diem rates, mileage, value lists and the Austrian calculation rules in time cockpit. Preview."
---
# Travel Expenses: Settings, Per Diem Rates and Calculation Rules

> [!WARNING]
> Preview: Travel expenses are a preview feature. The menu entries and the travel expense fields in the forms below appear only when the feature flag `APP_TravelExpensePreview` is enabled for your tenant. To try the feature, contact [support@timecockpit.com](mailto:support@timecockpit.com).

This page describes what an administrator configures for [travel expenses](overview.md) and how time cockpit calculates the amounts. The calculation follows the Austrian rules for 2026. Rules of other countries, for example Germany, are not supported yet.

## Who May Change What

With default permissions:

| What | Where | Who may change it |
|---|---|---|
| Travel expense settings | **Management** → **[Global Settings](https://web.timecockpit.com/app/forms/entity/APP_GlobalSettings)**, section **Travel Expenses** | Base Data Admins |
| Home country of a user | **User** → **[User Details](https://web.timecockpit.com/app/lists/entity/APP_UserDetail)**, field **Travel Home Country (Override)** in the **Configuration** section | HR Administrators |
| Per diem rates | **Management** → **Travel Expenses** → **[Per Diem Rates](https://web.timecockpit.com/app/lists/entity/APP_PerDiemRate)** | HR Administrators, Base Data Admins |
| Mileage of a means of transport | **Management** → **[Means of Transport](https://web.timecockpit.com/app/lists/entity/APP_MeansOfTransport)**, section **Mileage Allowance** | Base Data Admins |
| Receipt types | Selection list of the **Type** field of a receipt | HR Administrators, Base Data Admins: add, rename, delete |
| Overnight stay types, calculation methods, mileage reimbursement types, transport types | Selection lists in the forms | Nobody (fixed values, also without default permissions) |

Everyone can read rates and value lists.

## Global Settings

The section **Travel Expenses** in the global settings applies to all users of the tenant.

| Setting | Default | Meaning |
|---|---|---|
| **Travel Home Country** | Austria | The domestic country. Time abroad is time outside this country. |
| **Default Calculation Method** | Calendar day (00:00–24:00) | Calculation method for new trips. Each trip can use another one. |
| **Minimum Hours for Per Diem** | 3 | A trip must last longer than this to earn per diem. |
| **Abroad Deduction from Provided Meals** | 2 | Number of provided meals per day from which the deduction abroad applies. |
| **Domestic Deduction Breakfast** | 0 € | Deduction for a provided breakfast on a domestic day. |
| **Domestic Deduction Lunch** | 15 € | Deduction for a provided lunch on a domestic day. |
| **Domestic Deduction Dinner** | 15 € | Deduction for a provided dinner on a domestic day. |

A user can have a different home country, for example an employee of a German branch: set **Travel Home Country (Override)** in the user details. The minimum hours and the meal deductions still come from the global settings.

## Per Diem Rates

Each rate has a **Country**, an optional **Region** (for example *London* or border towns), the **Daily Allowance**, the **Overnight Allowance**, **Valid From** and **Valid To**. Employees choose a rate as the country or region of each stay.

time cockpit ships the Austrian rates for 2026: 173 rates for 159 countries and 14 regions, valid from 1 January 2026. Countries that do not exist in the tenant yet are added. Rates you have changed or added are kept when time cockpit is updated.

The list has a **Valid on** filter (default today) that shows the rates valid on a date. To introduce new rates, add rows with the new **Valid From** and set **Valid To** on the old ones.

All rates of a trip are the ones valid on its first day, the earliest departure. The capture page offers only these rates. If a departure moves to a day on which a selected rate is no longer valid, the page switches to the rate of the same country and region valid on that day. If there is no such rate, the calculation reports an issue.

## Mileage

Mileage depends on the means of transport of a leg. In the form of a means of transport, the section **Mileage Allowance** has these fields:

| Field | Meaning |
|---|---|
| **Mileage Reimbursement** | **None** (default; costs are entered as receipts), **Mileage allowance** (per kilometer) or **Flat amount per leg** (the employee enters the amount on the leg). |
| **Rate per Kilometer** | Euro per kilometer, for example 0.50 for a private car. |
| **Surcharge per Passenger and Kilometer** | Added to the rate for each passenger, for example 0.15. |
| **Minimum Distance (km)** | Legs up to and including this distance earn no mileage allowance. |
| **Transport Type** | Car, train, plane, bus, bicycle, on foot or other. Decides the icon of the trip in the Time Sheet Calendar. |

The rates per kilometer are not preset. Enter them for every means of transport that earns mileage allowance.

## Value Lists

The values in the selection lists of the travel expense forms are stored as small tables. They are not in the menu; open them from the selection list of the field.

| Value list | Values | Changeable |
|---|---|---|
| Receipt Type | Hotel, Parking, Train/bus, Flight, Taxi, Toll/vignette, Hospitality, Other | Add, rename, delete |
| Overnight Stay Type | Hotel with receipt, Flat rate, Provided / no costs | No |
| Calculation Method | Calendar day (00:00–24:00), 24-hour period | No |
| Mileage Reimbursement | None, Mileage allowance, Flat amount per leg | No |
| Transport Type | Car, Train, Plane, Bus, Bicycle, On foot, Other | No |

The names are created in the language of the tenant's data model (English or German) and are not translated per user. The fixed value lists drive the calculation, so nobody can add, rename, change or delete their values, whatever the permission setup.

## Calculation Rules

The amounts are calculated with the Austrian rules and the rates and settings of your tenant.

### Time per Country

- During a leg, the time up to the border crossing counts to the country of origin, the time after it to the destination country. Without a border crossing, the whole leg counts to the country of origin.
- The stay after a leg counts to its destination country until the next leg departs.

### Per Diem

- A trip earns per diem only if it lasts more than the minimum hours (3 by default). This applies to the whole trip.
- The trip is split into units: calendar days (00:00–24:00) or 24-hour periods starting at the departure, depending on the calculation method.
- Each unit earns one twelfth of the daily allowance per started hour, at most twelve twelfths.
- The twelfths go to the foreign countries first, in descending order of hours, each at most the started hours spent there and together at most the started hours abroad. The remaining twelfths are paid at the domestic rate.
- If the trip spends no more than 3 hours abroad in total, every twelfth is paid at the domestic rate.

### Meals

The deduction is calculated per calendar day:

- **Domestic day** (no time abroad): the amounts from the global settings for each provided meal, by default 0 € for breakfast and 15 € each for lunch and dinner.
- **Day with time abroad**: from 2 provided meals, two thirds of the daily allowance of the foreign country with the most hours on that day. With fewer provided meals, nothing is deducted.

The deduction is taken from the unit that overlaps the day most and never exceeds that unit's per diem.

### Overnight Stays

Each night whose midnight lies within the trip counts. With **Flat rate**, the overnight allowance of the country at midnight is paid. **Hotel with receipt** and **Provided / no costs** pay no allowance; the hotel bill is entered as a receipt.

### Total

**Total** = per diem − meal deduction + overnight allowance + mileage + receipts.

The amounts are calculated exactly. The totals are rounded to cents once, from the exact sums.

### When the Amounts Are Fixed

The capture page calculates live. Saving, **Submit** and **Approve** store the calculated amounts. Approved and paid trips are not recalculated, so later changes to rates or settings do not affect them.

### Calculation Issues

A trip cannot be submitted while the calculation reports an issue, for example:

- The travel expense report contains no legs.
- A leg is missing its departure or arrival time, or arrival is before departure.
- Departure is before the arrival of the previous leg.
- The border crossing is outside the leg.
- A leg has no destination country, or no valid per diem rate exists for it.
- A selected per diem rate is not valid on the first day of the trip.
- A leg has no means of transport, or a leg with mileage allowance has no distance.

## Related Pages

- [Travel Expenses](overview.md)
- [Approval and Payout](approval-and-payout.md)
- [Default Permissions](~/doc/employee-time-tracking/default-permissions.md)
