# Billing

Time cockpit not only serves as a time tracking tool but also enables streamlined billing for your tracked time. This article explains how you can create invoices for the recorded hours with time cockpit. In time cockpit you can

* create invoices with invoice positions
* automatically create invoice positions from time sheet entries (service time, travel time)
* create your own arcticles for invoice positions
* add your own invoice positions to an existing invoice
* generate an invoice document

## Building Blocks of an Invoice

In time cockpit, an invoice does not exist on its own, but is composed of different building blocks. 

### Invoice Item

An invoice always consists of one or more invoice items. An invoice item is a detailed entry on an invoice that represents a specific product, service, or charge along with its associated quantity, unit price, and total cost. Invoice items provide a breakdown of the products or services being billed, making it clear for both the seller and the buyer what is being charged.

An invoice item consists of the following data:

- **Position:** A numerical position identifier for the item on the invoice.
- **Task:** Associated task or project (if applicable).
- **Description:** A brief description of the product, service, or charge.
- **Quantity:** The quantity or units of the product or service included.
- **Unit:** The unit of measurement for the item.
- **Price:** The unit price or rate for the product or service.
- **VAT Rate:** The applicable Value Added Tax (VAT) rate for the item.
- **Total:** The total cost for this item (Price x Quantity).
- **Total (incl. VAT):** The total cost including VAT.

![Invoice Item](images/invoice-item.png "Invoice Item")

### Article

In time cockpit, you can either create your own invoice items or you can create invoice items based on articles. An article in time cockpit is a predefined item or service description with associated pricing information that can be easily added to an invoice. Articles are essentially templates for common products or services a business provides. Rather than entering the same details for frequently used items on every invoice, users can select articles to populate the invoice item with the relevant product or service information automatically.

An article consists of the following fields:

- **Code:** A unique code identifier for the article.
- **Name:** The name or title of the article.
- **Description:** A brief description of the article's content.
- **Unit:** The unit of measurement for the item.
- **Price:** The unit price or rate for the article.
- **SortOrder:** The order in which the article appears in the list.
- **VAT [%]:** The applicable Value Added Tax (VAT) rate for the article. 
- **Hidden:** Indicates whether the article is hidden or visible in the selection.
- **Total (incl. VAT):** The total price, including VAT, for the article.

![Article](images/article.png "Article")

> [!NOTE]
Time cockpit ships articles for service time and travel time. See a list of your articles in the [articles list](https://web.timecockpit.com/app/lists/entity/APP_Article).

## Automatic Creation of Invoice Items

When you create an invoice in time cockpit, it analyzes the selected time sheet entries for a project to generate invoice items. If the entries are related to travel, time cockpit uses the "travel time" article as the basis for the invoice item. If they represent actual work for a customer, it creates an invoice item for each task within the project, using the "service time" article. The system calculates the total hours for each invoice item from the associated time sheet entries.

The following example shows an invoice with three invoice items.

* Support: An invoice item created for the "Support" task in the given project
* Meeting: An invoice item created for the "Meeting" task in the given project
* Travel Costs: An invoice item created for travels in the given project. Travels are not assigned to any task, so the invoice item is not either.

![Example Invoice Items](images/invoice-items-example.png "Example Invoice Items")

## How to Create an Invoice

For billing the default data model of time cockpit contains the list **Management – Billing – Unbilled Time Sheets**. The list is similar to the default list for timesheet entries, but contains an additional filter for billable and not billed hours. In the default data model you can call the `Create Invoice` action, which allows to allocate time sheet entries to an invoice. For generating an invoice please proceed as follows:

1. Open the list **Unbilled Time Sheets**
1. Mark all time sheets you want to assign to your invoice
1. From the **Actions** menu choose **Create Invoice**
1. Enter your invoice data

When you execute **Create Invoice** all selected time sheets get assigned to the new invoice/invoice items. That means that you are able to generate e.g. a time sheet journal for an invoice in the default list for Zeitbuchungen by filtering for an invoice number. After assigning time sheet entries to an invoice, they are automatically marked read-only. Thus, time sheets entries cannot be modified by mistake after billing.

Hourly rates for customers or projects can change over time. For this reason the action **Create Invoice** copies the concrete valid hourly rate into field `APP_HourlyRateBilled`. This field is also used in the calculated field `APP_Revenue` which shows you the revenue time sheet entries generated.

TODO: Video

> [!NOTE]
Until version [2023-10](~/doc/release-notes/2023-10.md), time cockpit could only aggregate time bookings into invoices. The time bookings assigned to an invoice were no longer editable by users. With version 2023-10, this functionality was expanded to allow the creation of multiple invoice items for a single invoice. As a result, the total invoice amount is now calculated based on the sum of all invoice items.


### Custom Invoice Items and Articles

If the automated invoice item generation logic doesn't meet your requirements, you have the flexibility to create custom invoice items and articles. For instance, if your business offers both time-tracking consulting services and sells hardware time-tracking terminals, and you need to include both on a single invoice, you can define a custom article like "Time Tracking Terminal." It might be structured as follows.

<div style="padding:56.27% 0 0 0;position:relative;"><iframe src="https://player.vimeo.com/video/870320759?badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479" frameborder="0" allow="autoplay; fullscreen; picture-in-picture" style="position:absolute;top:0;left:0;width:100%;height:100%;" title="custom-invoice-item"></iframe></div><script src="https://player.vimeo.com/api/player.js"></script>

**Creating a Custom Article:**

1. Navigate to the "Management" module in time cockpit.
2. Open the "Articles" section.
3. Click the "Add" button.
5. Provide all necessary information for the article.
8. Save the article.

![Custom Article](images/custom-article.png "Custom Article")

**Using the Custom Article in an Invoice:**

1. Navigate to the "Outgoing Invoices" section in the "Management" module
2.  Search for the project to which you want to add the custom article.
3.  Locate your invoice.
4.  In the invoice details, add a new item.
5.  Select your new article (e.g., "Time Tracking Terminal") from the list of available articles.
6.  Hit "Excute Action."
7.  The information from the article template is copied to the actual invoice.
8.  You can edit the quantity (e.g., increase it to 25).
9.  Save and close the custom invoice item with the custom article.