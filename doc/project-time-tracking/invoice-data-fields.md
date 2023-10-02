# Invoice Data Fields

This section provides a detailed overview of the most important data fields related to invoices in time cockpit. Learn how to effectively utilize these fields to create and manage invoices.

![Invoice](images/invoice.png "Invoice")

## Invoice Number
Time cockpit can automatically create an invoice number for your next invoice. Per default, it will create an invoice number following the pattern: `:FormatDate(@InvoiceDate, "yyyy") + '-' + :FormatDate(@InvoiceDate, "MM") + '-'`. That is, if you create an invoice in October 2023, it will create the prefix **2023-10-** and add a sequential number for the invoice, e.g. **2023-10-001**. You can control the pattern of the invoice number in your [global settings](https://web.timecockpit.com/app/lists/entity/APP_GlobalSettings).

![Invoice](images/global-settings-invoice-number.png "Invoice")

If you want to set a custom invoice number for a single invoice, you can use the `Set individual` action and set your custom invoice number. 

## Billing Address
The billing address is required for generating the invoice document. Per default, the billing address is derived from the billing address of the customer. However, you can override the billing address for each invoice. To manage the billing address of your customers navigate to your [customer list](https://web.timecockpit.com/app/lists/entity/APP_Customer).

The address also has impact on your invoice document in regard to VAT. If your customers address is in the European Union, the text "information for the calculation and remittance of value-added tax" is added to your invoice document. 

TODODOD

. In the master data of the Countries, a new field 'EU Member' has been added. This controls the display of information on the invoice document (information for the calculation and remittance of value-added tax). This text is included on the invoice document when an invoice with invoice items without value-added tax is created. The text to be printed differs depending on whether a country is an EU member or not.

## Service Period Start and End

The start and end date is printed on the invoice document. If the invoice is created using `Create Invoice` on selected time sheet entries, the service period is automatically determined according to the first and last time entry.

## Calculated and Deviating Revenue

> [!NOTE]
In past versions of time cockpit, it provided the fields `Calculated Revenue` and `Deviating Revenue`. Both fields are no longer required for future invoices. We recommend disabling the display of these fields in the global settings. For existing invoices, the value entered in the 'Deviating Net Revenue' field is still considered in the 'Net Revenue' field. It is not possible to simultaneously use deviating revenue and invoice items in a single invoice.

The calculated revenue, when generating invoices based on time entries using the `Create Invoice` action, is now recorded in one or more invoice items. The determination of unit and VAT for invoice items is based on the standard item 'Service' (Code: serviceTime). The descriptions of the invoice items correspond to the project (or activity) to which they were booked.

If one of the time entries to be billed has also filled in the 'Driven KM by Car' field, an additional invoice item 'Travel Expenses' is created. This includes the total distance traveled in all selected time entries. The determination of description, unit, price, and VAT for the invoice item is based on the standard item 'Travel Costs' (Code: travelCosts).

The automatically generated invoice items can be adjusted as needed or supplemented with additional invoice items.

## Create Articles

## Create Custom Invoice Positions