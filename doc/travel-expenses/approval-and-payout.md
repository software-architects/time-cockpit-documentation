---
title: Travel Expenses - Approval and Payout
description: "Approve or reject submitted trips, mark approved trips as paid, review all trips and unbilled travel receipts in time cockpit. Preview."
---
# Travel Expenses: Approval and Payout

> [!WARNING]
> Preview: Travel expenses are a preview feature. The menu entries appear only when the feature flag `APP_TravelExpensePreview` is enabled for your tenant. To try the feature, contact [support@timecockpit.com](mailto:support@timecockpit.com).

After an employee submits a trip, the department lead of the employee's department or an HR Administrator approves or rejects it. HR then pays the trip out and marks it as paid. How employees record and submit trips is described in [Travel Expenses](overview.md).

## Who Does What

| Task | Who | Where |
|---|---|---|
| Approve or reject a submitted trip | Department Leads for users in the departments they lead, HR Administrators | **Management** → **Travel Expenses** → **[Approval](https://web.timecockpit.com/app/lists/APP_TravelExpenseReportApprovalList)** |
| Mark an approved trip as paid | HR Administrators | **Management** → **Travel Expenses** → **[Payout](https://web.timecockpit.com/app/lists/APP_TravelExpenseReportPayoutList)** |
| Export approved trips for payroll (Excel or CSV) | HR Administrators | **Management** → **Travel Expenses** → **[Payroll Export](https://web.timecockpit.com/app/lists/APP_TravelExpensePayrollList)** |
| Review all trips | Everyone, limited to the trips they may read (see below) | **Management** → **Travel Expenses** → **[Travel Expense Reports](https://web.timecockpit.com/app/lists/entity/APP_TravelExpenseReport)** |
| Find receipts to re-bill to customers | Billing Administrators, HR Administrators | **Management** → **Billing** → **[Unbilled Travel Receipts](https://web.timecockpit.com/app/lists/APP_UnbilledTravelReceiptList)** |

With default permissions, the **Approval** list is available to Department Leads and HR Administrators, the **Payout** and **Payroll Export** lists to HR Administrators only.

## Approve or Reject a Trip

The **Approval** list shows all submitted trips you may read, newest first, with user, purpose, project, begin, end, status, per diem, mileage, receipts and total. Filter by user, department, project, or a period of the trip's begin.

Each row offers these actions:

| Action | Effect |
|---|---|
| **Approve Travel Expense Report** | Recalculates the trip, sets the status to **Approved** and stores you as approver with the time of approval. |
| **Reject Travel Expense Report** | Sets the status to **Rejected**. Enter the **Reason for Rejection**; the employee sees it in the notification and on the trip. The employee can change the trip and submit it again. |
| **Download Travel Expense Report as PDF** | Opens the trip as a PDF for review. |

Department Leads can approve and reject only trips of users in the departments they lead. HR Administrators can approve and reject every trip.

## Mark a Trip as Paid

The **Payout** list shows all approved trips, newest first, with user, purpose, project, begin, end, per diem, mileage, receipts and total, and the same filters as the **Approval** list. Pay the total out through your payroll or bank, then choose **Mark Travel Expense Report as Paid** in the row. The status changes to **Paid** and the time of payout is stored.

To hand the amounts to payroll first, use the [Payroll Export](#export-for-payroll).

## Export for Payroll

The **Payroll Export** list prepares the approved trips for your payroll, one row per trip, sorted by employee and trip end. By default it shows the trips that are approved but not marked as paid yet, that is, the trips for the next payroll run. Select **Include paid trips** to add the trips already paid.

| Column | Content |
|---|---|
| **Personnel Number**, **User**, **Department** | The employee; the personnel number comes from the user details. |
| **Purpose**, **Begin**, **End** | The trip. |
| **Status**, **Approved (UTC)**, **Paid (UTC)** | Approved or paid, with the dates. |
| **Per Diem**, **Meal Deduction**, **Per Diem after Deductions** | The per diem before and after the deduction for provided meals. |
| **Overnight Allowance**, **Mileage Allowance**, **Receipts** | The other parts of the payout, so you can map each to a wage type. |
| **Total** | The payout amount of the trip. |

Filter by user, department, or a period of the trip's end (**Trip end from**, **Trip end to**). Then choose **Export** in the list toolbar and **Excel Export** or **CSV Export**; the file contains the rows and columns as shown.

A typical payroll run: export the approved trips of the month, import or enter them in your payroll, then mark the trips as paid in **Payout**. After that they no longer appear in the default view of the export.

> [!NOTE]
> The amounts follow the Austrian per diem rates of your tenant. Whether a part is tax-free or taxable is decided in your payroll; the export does not split the amounts by tax treatment. There is no direct interface to a payroll system or a banking file.

## Notifications

| Event | Who is notified |
|---|---|
| A trip is submitted | All Department Leads of the employee's department, with a link to the **Approval** list |
| A trip is approved | The employee |
| A trip is rejected | The employee, with the reason |
| A trip is marked as paid | The employee |

Nobody is notified about their own action. When a trip is approved or rejected, the open approval notifications for it are removed. If the employee's department has no Department Lead, nobody receives the approval notification; HR then finds the trip in the **Approval** list.

## All Trips

**Travel Expense Reports** lists all trips you may read, regardless of status. Filter by user, department, project, purpose, or a period of the trip's begin. Each row has a PDF link.

| Role | Trips visible |
|---|---|
| Employees | Their own trips |
| Department Leads | Their own trips and those of users in the departments they lead |
| HR Administrators, Billing Administrators, Project Controllers | All trips |

Only the employee (while the trip is a draft or rejected) and HR Administrators can change a trip. Status, amounts, approver and timestamps are set by the actions only.

## Unbilled Travel Receipts

Receipts that the employee marked **Rebill** and that are not assigned to an invoice item yet appear in **Unbilled Travel Receipts**, with date, type, description, amount, trip purpose, user and project. Filter by customer, project, user, or a period of the receipt date.

> [!NOTE]
> Taking these receipts into an invoice automatically is planned for a later version. Until then, add them to the customer's invoice by hand.

## When an Action Fails

| Message | Cause |
|---|---|
| You are not allowed to modify this travel expense report. | You are not the Department Lead of the employee's department and not an HR Administrator (or, for **Mark Travel Expense Report as Paid**, not an HR Administrator). |
| The travel expense report is not in the right status for this action. | Only submitted trips can be approved or rejected, only approved trips can be marked as paid. |

## Related Pages

- [Travel Expenses](overview.md)
- [Settings, Per Diem Rates and Calculation Rules](settings-and-rates.md)
- [Department Lead FAQ](~/doc/department-lead-faq.md)
- [HR Administrator FAQ](~/doc/hr-administrator-faq.md)
