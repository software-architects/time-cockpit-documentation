# Billing

For billing the default data model of time cockpit contains the list **Management – Billing – Unbilled Time Sheets**. The list is similar to the default list for Zeitbuchungen, but contains an additional filter for billable and not billed hours. In default data model an action is deposited for this list, which allows to allocate time sheets to an invoice. For generating an invoice please proceed as follows:

1. Open the list **Unbilled Time Sheets**
1. Mark all time sheets you want to assign to your invoice
1. From the **Actions** menu choose **Create Invoice**
1. Enter your invoice data

When you execute **Create Invoice** all selected time sheets get assigned to the new invoice. That means that you are able to generate e.g. a time sheet journal for an invoice in the default list for Zeitbuchungen by filtering for an invoice number. After assigning time sheet entries to an invoice, they are automatically marked read-only. Thus, time sheets entries cannot be modified by mistake after billing.

Hourly rates for customers or projects can change over time. For this reason the action **Create Invoice** copies the concrete valid hourly rate into field `APP_HourlyRateBilled`. This field is also used in the calculated field `APP_Revenue` which shows you the revenue time sheet entries generated.