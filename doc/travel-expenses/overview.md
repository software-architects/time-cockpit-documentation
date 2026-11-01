---
title: Travel Expenses - Record Business Trips
description: "Record business trips in time cockpit with route, meals, overnight stays and receipts, see per diem and mileage live, create a PDF and submit. Preview."
---
# Travel Expenses

> [!WARNING]
> Preview: Travel expenses are a preview feature. The menu entries, the travel expense pages and the trips in the Time Sheet Calendar appear only when the feature flag `APP_TravelExpensePreview` is enabled for your tenant. To try the feature, contact [support@timecockpit.com](mailto:support@timecockpit.com). Labels and behavior can still change.

With travel expenses, employees record each business trip as a travel expense report: the route with departure, arrival and border crossings, the meals and overnight stays per day, and the receipts. time cockpit calculates per diem allowances, meal deductions, overnight allowances and mileage according to the Austrian rules while you type. You submit the trip, your department lead approves it, and HR marks it as paid.

Only the Austrian rules are supported. HR exports approved trips for payroll as Excel or CSV and records the payout as a status; see [Export for Payroll](approval-and-payout.md#export-for-payroll).

## Where to Find It

| Menu entry | What it opens | Who uses it |
|---|---|---|
| **User** → **My Travel Expenses** → **[My Trips](https://web.timecockpit.com/app/travel-expenses)** | Your trips with their stored amounts and status | Every employee |
| **User** → **My Travel Expenses** → **[New Trip](https://web.timecockpit.com/app/travel-expenses/new)** | An empty trip on the capture page | Every employee |
| **Management** → **Travel Expenses** | Lists for all trips, approval, payout and per diem rates | Department Leads, HR Administrators; see [Approval and Payout](approval-and-payout.md) |

## My Trips

**My Trips** lists your own trips, newest first, with begin, purpose, route, project, per diem, mileage, receipts, total and status. Above the list you see the sum of trips that are open for payout (submitted or approved) and the sum already paid. Click a trip to open it, or choose **New** to record a new one.

## Record a Trip

The capture page shows everything on one page. The result on the right is recalculated after every change, using the per diem rates and settings of your tenant. Required fields are highlighted.

### General

- **Purpose** (required), for example *Workshop at the customer*.
- **Project** (optional). A project is required if you want to re-bill receipts to the customer.
- **Calculation method**: **Calendar day (00:00–24:00)** or **24-hour period**. New trips start with the default from the [settings](settings-and-rates.md#global-settings).
- **Begin** and **End** are taken from the route.

### Route

The route is a sequence of stays, one stay per place. A new trip starts as a round trip from the home country of your tenant: enter the start place, then each destination with its country or region. The country decides which per diem rate applies. Use **Insert stay** to add a destination and **Remove stay** to delete one.

For each leg between two stays, enter:

| Field | Description |
|---|---|
| **Departure**, **Arrival** | Date and time. Arrival must be after departure, and a leg cannot depart before the previous one arrived. |
| **Border crossing** | Date and time you crossed the border. Only needed when the country changes; otherwise the page shows *no change of country*. |
| **Means of transport** | Selects how the leg is reimbursed (see below). |
| **Distance (km)**, **Passengers** | Shown for means of transport with mileage allowance. |
| **Flat amount (€)** | Shown for means of transport with a flat amount per leg. |

Whether a means of transport earns mileage allowance, a flat amount or nothing is set in the means of transport; see [Mileage](settings-and-rates.md#mileage). Costs of other means of transport, such as a train ticket, are entered as a receipt.

### Travel Days

The travel days follow from departure and arrival in the route. For each day you mark the meals that were provided (**Breakfast**, **Lunch**, **Dinner**) and choose the overnight stay for the night after that day:

| Overnight stay | Effect |
|---|---|
| **Hotel with receipt** | No overnight allowance; enter the hotel bill as a receipt. This is the default. |
| **Flat rate** | The overnight allowance of the country you are in at midnight. |
| **Provided / no costs** | Nothing is paid for that night. |

Provided meals reduce the per diem. The deduction and the rule applied are shown per day; see [Meals](settings-and-rates.md#meals).

### Receipts

Choose **New receipt** and enter the date, type, description and amount. Use **Attach** to add the scanned receipt or invoice as a file, and **Replace** to exchange it. Mark **Rebill** for receipts you want to charge to the customer; this requires a project on the trip.

### Timesheets in the Period

This section shows your timesheets during the trip for information. The trip does not depend on them.

### Result

The result panel shows the **Payout amount** and its parts: per diem, meal deduction, overnight allowance, mileage and flat amounts, and receipts, plus the share that can be re-billed to the customer. Below it you see the per diem per calendar day or per 24-hour period with the twelfths per country, and the mileage per leg. If data is missing, the panel lists what to complete instead of a result. How the amounts are calculated is described in [Calculation Rules](settings-and-rates.md#calculation-rules).

## Import Legs from Timesheets

If you record journeys on your timesheets (journey from, journey to, means of transport), choose **Actions** → **Import from timesheets**. The dialog lists the timesheets with journey data; timesheets that already belong to a trip are marked. Each selected timesheet becomes a leg with its begin as departure and its end as arrival. Check country and border crossing afterwards. The trip stays independent of the timesheet; the leg only remembers where it came from.

## Save, Create a PDF and Submit

| Button | Effect |
|---|---|
| **Save**, **Save and close** | Saves the trip with its legs, days and receipts and stores the calculated amounts. |
| **PDF** (or **Actions** → **Create PDF**) | Creates the travel expense report as a PDF: employee, purpose, result, route, per diem per unit and country, mileage, receipts, travel days, status and signature lines. |
| **Submit** | Recalculates the trip and sends it to your department lead for approval. Only possible when the calculation reports no issues. |
| **Actions** → **Delete** | Deletes a draft with its legs, days and receipts. |

After submitting, the trip is read-only. If it is rejected, you can change it and submit it again.

## Status of a Trip

| Status | Meaning | Can the employee change it? |
|---|---|---|
| **Draft** | Recorded, not submitted yet | Yes |
| **Submitted** | Waiting for approval | No |
| **Rejected** | Returned with a reason | Yes, then submit again |
| **Approved** | Approved by the department lead or HR | No |
| **Paid** | Marked as paid by HR | No |

You receive a notification when your trip is approved, rejected (with the reason) or paid. The amounts are recalculated on submit and on approval. Approved and paid trips are not recalculated, even if rates change later.

## Trips in the Time Sheet Calendar

The [Time Sheet Calendar](~/doc/timesheet-calendar/calendar.md) shows each trip of the displayed user as a bar in the all-day row across its travel days, with the means of transport, purpose, route, total and status. The color shows the status. Click the bar to open the trip. Trips cannot be created or moved in the calendar.

## Related Pages

- [Approval and Payout](approval-and-payout.md)
- [Settings, Per Diem Rates and Calculation Rules](settings-and-rates.md)
- [MCP Server: Travel Expense Tools](~/doc/mcp/overview.md#travel-expense-tools)
- [Time Sheet Calendar](~/doc/timesheet-calendar/calendar.md)
