# Screenshots for the documentation

Status: 2026-11-23, after the screenshot run of the same day (web client of the release deployed that day).

The pictures come from the Playwright run in the TimeCockpit repository
(`web/Source/CockpitFramework.Web.UI.Angular/apps/time-cockpit-e2e-pw/screenshots`, manifest `manifest.ts`,
output `out/<name>.<lang>.png`, raw 2x pictures, 1600×1000 CSS px viewport). The English picture goes to
`doc/<folder>/images/<file>`, the German one under the same file name to `de/doc/<German folder>/images/<file>`
(folder names in `tools/Translate/folders.de.json`); `relink-de.ps1` then uses the German picture. In German pages
the image link must be the relative `images/<file>`, not `/doc/<folder>/images/<file>`.

## 1. Already used (rerun copies these again)

| Manifest name | Documentation file (EN, DE under the same name) | Processing |
|---|---|---|
| calendar-week | `timesheet-calendar/images/wc-calendar-overview.png`, `getting-started/images/wc-calendar-overview.png`, `timesheet-calendar/images/wc-formatting-profile-billable.png` | none |
| calendar-week | `timesheet-calendar/images/wc-work-week-view.png` | cropped to x ≥ 575, y ≥ 80 (without app bar and sidebar), see request W1 |
| calendar-sidebar-statistics | `timesheet-calendar/images/wc-attendance-time-info.png` | none (page shows it at `width="247"`) |
| list-absence-calendar | `employee-time-tracking/images/absence-time-calendar.png` | none |
| list-time-report-pdf | `reporting/images/time-report.png` | none |
| form-invoice-detail | `project-time-tracking/images/invoice-item.png` | trimmed below the last field, see request W2 |
| form-invoice-pdf | `project-time-tracking/images/invoice-report.png` | none |
| form-import-definition | `data-exchange/images/wc-import-definition.png` | none |
| dashboard-project-manager | `data-model-customization/images/dashboard/wc-dashboard.png` | none |
| list-projects-budget | `getting-started/images/budgetary-control-of-projects.png`, `project-time-tracking/images/budgetary-control-of-projects.png` | none |
| form-customer | `project-time-tracking/images/customer-form.png` | trimmed, see W2 |
| form-project | `project-time-tracking/images/project-form.png` | trimmed, see W2 |
| form-task | `project-time-tracking/images/task-form.png` | none |
| form-timesheet | `project-time-tracking/images/timesheet-form.png` | none |
| list-create-invoice | `project-time-tracking/images/create-invoice.png` | none |
| form-weekly-hours | `employee-time-tracking/images/weekly-hours-of-work.png` | trimmed, see W2 |
| list-vacations | `employee-time-tracking/images/vacations.png` | none |
| list-legal-holidays | `employee-time-tracking/images/legal-holidays.png` | none |
| calendar-sidekick-week | `sidekick/images/calendar-activity-band.png` | none |
| calendar-sidekick-day | `sidekick/images/calendar-detail-lanes.png` | none |
| calendar-sidekick-proposal | `sidekick/images/calendar-proposal.png` | none |
| calendar-sidekick-pane | `sidekick/images/calendar-signals-pane.png` | none (page shows it at `width="320"`) |

Not used: `form-article` (see F1), `dashboard-employee`, `calendar-fragment`, `calendar-sidebar-templates`,
`calendar-sidebar-profile`, `calendar-sidekick-pane-ai` (no documentation page needs them yet).

## 2. Fixes to existing manifest entries

- **F1 form-article**: the field **Name** shows "Cells of type MultiLanguageTextCell are not supported yet." in both
  tenants. The web client cannot render the multi-language name of an article; until that is fixed the picture cannot
  replace `project-time-tracking/images/article.png` and `custom-article.png`. Either fix the cell in the web client or
  skip the entry (`skip`).
- **W1 calendar-work-week**: a variant of calendar-week clipped to the calendar without app bar and sidebar
  (toolbar, day headers, grid), so `wc-work-week-view.png` needs no manual crop.
- **W2 form clips**: the form pictures (form-customer, form-project, form-weekly-hours, form-invoice-detail, form-article)
  are the full viewport height with a large empty area and the Save bar. A clip to the form content (the sections,
  without the empty area and the footer) would save the manual trim.

## 3. New pictures

German tenant and English tenant as usual. "Replaces" names the English file; the German one has the same name under
`de/doc/<German folder>/images/`. Priority: A = old design still shown prominently, B = detail page, C = nice to have.

### Time sheet calendar (`doc/timesheet-calendar/`, DE `zeiterfassungskalender`)

| Prio | Proposed name | Shows | Replaces |
|---|---|---|---|
| A | calendar-absences | Work week with a whole-day vacation, whole-day compensatory time, a sick leave day, compensatory time with begin and end, and bookings. Needs a week in the demo data with these absences. | `wc-timesheet-calendar.png` (calendar.md, "Time Sheet Calendar") |
| A | calendar-day | Day view of a fully booked day (sidebar visible as in calendar-week). | `wc-day-view.png` |
| A | calendar-week-full | Week view with 7 days. | `wc-week-view.png` |
| A | calendar-new-entry | The form for a new time sheet entry opened from the calendar (drag in the grid), empty description, the validation message "Description is a mandatory field" visible. Nothing is saved. | `working-with-timesheet-entries.md`: `wc-first-timesheet-entry.png` |
| B | calendar-main-menu | App bar with the menu **Management** opened. | `wc-menu.png` (calendar.md), and `data-model-customization/images/wc-menu.png` (navigation.md) |
| B | calendar-toolbar | Clip of the calendar toolbar (Today, navigation, date, zoom, settings, search, Add … Actions). | `wc-toolbar.png` |
| B | calendar-user-selection | Sidebar block **User** with the user combo box opened. | `wc-user-selection.png` |
| B | calendar-view-mode | The **View Mode** menu opened. | `wc-select-view.png` |
| B | calendar-side-by-side | The side-by-side setting and the calendar with side-by-side view switched on (two pictures). | `wc-side-by-side.png`, `wc-side-by-side-enabled.png` |
| B | calendar-date-picker | The date picker opened from the date in the toolbar. | `wc-date-picker.png` |
| B | calendar-actions | The **Actions** menu opened with a booking selected. | `working-with-timesheet-entries.md`: `wc-action-in-calendar.png` |
| B | form-formatting-profile | The formatting profile form, one picture per tab: general, key figure, colors. Plus the place in the sidebar where a profile is edited. | `formatting-profiles.md`: `edit-formatting-profile.png`, `edit-formatting-profile-dialog.png`, `formatting-profile-key-figures.png`, `formatting-profile-colors-web.png` |
| C | calendar-drag-end-time, calendar-copy-drag | Changing the end of a booking by dragging, copying a booking with Ctrl + drag (mid-drag state). | `wc-drag-end-time.png`, `copy-drag-drop.png` |
| C | calendar-share | Share dialog, the suggestion notification, a suggestion in the calendar with edit/accept, and the global setting that enables suggestions. | `timesheet-suggestions-share-timesheet.md` (5 pictures) |

### Working time, absences, time report (`doc/employee-time-tracking/`, DE `arbeitszeiterfassung`)

| Prio | Proposed name | Shows | Replaces |
|---|---|---|---|
| A | time-report-pdf-page | The time report PDF page alone (like form-invoice-pdf): a full month with the overtime, vacation and telework blocks at the bottom. | `time-report.png` (time-report.md "Report Key Elements"), `wc-work-from-home-time-report-pdf.png` |
| B | time-report-menu | Menu **Users** opened with the entry **Time Report**. | `time-report-menu.png` |
| B | list-working-time-violations | List **Working Time Violations** with a few violations of one user (needs demo bookings that violate the limits). | `working-time-violations-web.png` |
| B | form-weekly-hours-limits | Tab **Working Time Limit** of the weekly hours of work. | `working-time-limits-web.png` |
| B | calendar-work-location | Day header with the work location (Office / Home Office / none), the toggle, and the three states. | `work-from-home.md`: `wc-work-from-home-flag.png`, `wc-work-from-home-toggle.png`, `wc-work-from-home-three-states.png` |
| B | list-time-report-print-view | The time report list with the print view selection. | `wc-work-from-home-time-report-print-view.png` |
| C | booking-completion | Setting of the booking completion date and the form to change it. | `passive-booking-completion.md` (2 pictures) |

### Billing (`doc/project-time-tracking/`, DE `projektzeiterfassung`)

| Prio | Proposed name | Shows | Replaces |
|---|---|---|---|
| A | form-timesheet-journey | form-timesheet of the journey booking with the tab **Journey** active (means of transport, distance relevant for the mileage allowance, from, to). | `travel-timesheet.png` |
| A | list-invoice-details | Invoice details of an invoice with task positions and a travel costs position (km). | `invoice-items-example.png` |
| A | form-invoice | The outgoing invoice form (invoice date and number, billing address, service period, revenue, discount, payment, invoice report section). | `invoice-data-fields.md`: `invoice.png` |
| B | form-company | The company form with the corporate information printed on the invoice. | `company-form.png` |
| B | assign-to-existing-invoice | Parameter form of the action that assigns unbilled timesheets to an existing invoice. Nothing is executed. | `assign-to-existing-invoice.png` |
| B | form-article (after F1) | Article "Service" and a custom article. | `article.png`, `custom-article.png` |

### Excel import (`doc/data-exchange/`, DE `datenaustausch`)

| Prio | Proposed name | Shows | Replaces |
|---|---|---|---|
| B | list-import-definitions | Menu entry and list of import definitions. | `wc-import-definitions-link.png`, `wc-import-definitions-list.png` |
| B | import-entity-selection | The dialog of **Create template** with the entity selection. | `wc-model-entity-selection.png` |
| B | form-import-definition-customer | Generated import definition for **Customer**, worksheet and column mapping. | `wc-autogenerated-customer-import-definition.png` |
| C | import-run | Import dialog with a selected source file, and the result of a successful test import (file via `setInputFiles`). | `wc-select-source-file.png`, `wc-import-test-successful.png` |
| C | form-import-definition-project-minimal | Import definition with only Project Name, Project Code and Customer (reference criteria Customer Code). | `wc-import-definition-project-minimal.png` |

### Other web client pages

| Prio | Proposed name | Shows | Replaces |
|---|---|---|---|
| B | list-view-profiles | List with the view menu, setting a view as default. | `ui/lists/entityview-profiles.md`: `wc-profile-default.png` |
| B | customization-menu | The menu **Customization** with entity, form and permission editing. | `data-model-customization/overview.md`: `wc-edit-entity.png`, `wc-edit-form.png`, `wc-edit-permission.png` |
| C | menu-search | Menu search for "Invoices" (picture from 2026-07, check whether the new app bar changed it). | `ui/menu-search.md`: `menu-search-invoices.png` |

Out of scope for the Playwright run: pictures of the classic client and Cockpit.Admin (2017 pictures in
`data-model-customization/`, `reporting/`, `data-exchange/export.md`), the signal tracker (classic, being replaced by
sidekick), Office 365 sign-in, e-mails, Excel files and third-party tools (MCP pages).
