# Screenshots for the documentation

Status: 2026-11-24, after the screenshot run of 2026-11-23 (web client of the release deployed that day) and an
inventory of all 210 pictures of the English pages.

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
| list-absence-calendar | `employee-time-tracking/images/absence-time-calendar.png` (absence-time-management.md and approval-workflows.md) | none |
| list-time-report-pdf | `reporting/images/time-report.png` | none |
| form-invoice-detail | `project-time-tracking/images/invoice-item.png` | trimmed below the last field, see request W2 |
| form-invoice-pdf | `project-time-tracking/images/invoice-report.png` | none |
| form-import-definition | `data-exchange/images/wc-import-definition.png` | none |
| dashboard-project-manager | `data-model-customization/images/dashboard/wc-dashboard.png` | none |
| list-projects-budget | `getting-started/images/budgetary-control-of-projects.png`, `project-time-tracking/images/budgetary-control-of-projects.png`, `use-cases/images/budgetary-control-of-projects.png` | none |
| form-customer | `project-time-tracking/images/customer-form.png` | trimmed, see W2 |
| form-project | `project-time-tracking/images/project-form.png` (also on hourly-rates.md) | trimmed, see W2 |
| form-task | `project-time-tracking/images/task-form.png` (also on hourly-rates.md) | none |
| calendar-sidebar-templates | `timesheet-calendar/images/calendar-sidebar-templates.png` | none (page shows it at `width="262"`) |
| form-timesheet | `project-time-tracking/images/timesheet-form.png` | none |
| list-create-invoice | `project-time-tracking/images/create-invoice.png` | none |
| form-weekly-hours | `employee-time-tracking/images/weekly-hours-of-work.png` | trimmed, see W2 |
| list-vacations | `employee-time-tracking/images/vacations.png` | none |
| list-legal-holidays | `employee-time-tracking/images/legal-holidays.png` | none |
| calendar-sidekick-week | `sidekick/images/calendar-activity-band.png` | none |
| calendar-sidekick-day | `sidekick/images/calendar-detail-lanes.png` | none |
| calendar-sidekick-proposal | `sidekick/images/calendar-proposal.png` | none |
| calendar-sidekick-pane | `sidekick/images/calendar-signals-pane.png` | none (page shows it at `width="320"`) |

Not used: `form-article` (see F1), `dashboard-employee`, `calendar-fragment`, `calendar-sidebar-profile`,
`calendar-sidekick-pane-ai` (no documentation page needs them yet).

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
- **W3 environment-badge on web-prod**: `getting-started/images/environment-badge-prod.{en,de}.png` still shows the old
  blue app bar (Prod still ran the old version on 2026-11-19). Retake with
  `SHOT_ONLY=environment-badge SHOT_BASE_URL=https://web-prod.timecockpit.com/`.

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
| A | calendar-week-billable | calendar-week with the formatting profile "Verrechenbar" / "Billable" selected in the sidebar, so bookings and bars show billable and not billable. | `formatting-profiles.md`: `wc-formatting-profile-billable.png` (shows the same picture as the overview today) |
| B | calendar-office365 | Settings with Office 365 switched on, the sign-in button, appointments in the calendar, converting an appointment with a double-click. Needs a demo user with an Office 365 calendar. | `office365.md`, `outlook-appointments.md`: `wc-enable-office365.png`, `wc-office365-login.png`, `wc-office365-enabled.png`, `wc-transform-appointments.png` |
| B | calendar-week-dark | calendar-week in dark mode. | new for `ui/dark-mode.md` (page has no picture) |
| B | calendar-mobile | Calendar and the time sheet form at phone width (mobile viewport, e.g. 390×844). | new for `getting-started/mobile-guide.md` (page has no picture) |

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
| B | list-vacation-effective-date | List "Vacation per Effective Date" with a prorated entitlement. | new for `prorated-vacation.md` (page has no picture) |
| C | department-leads | Department form, tab Department Leads, with "Receive Notifications for Absence Approval". | `absence-time-management.md`: `department-lead-receive-notification.png` |
| C | notifications-absence | Notification panel with an approved absence. | `absence-time-management.md`: `absence-time-notification.png` |
| C | form-payout | The form used to pay off overtime or vacation, as described in the how-to. | new for `getting-started/howtos/pay-off-overtime-vacation.md` (page has no picture) |

### Billing (`doc/project-time-tracking/`, DE `projektzeiterfassung`)

| Prio | Proposed name | Shows | Replaces |
|---|---|---|---|
| A | form-timesheet-journey | form-timesheet of the journey booking with the tab **Journey** active (means of transport, distance relevant for the mileage allowance, from, to). | `travel-timesheet.png` |
| A | list-invoice-details | Invoice details of an invoice with task positions and a travel costs position (km). | `invoice-items-example.png` |
| A | form-invoice | The outgoing invoice form (invoice date and number, billing address, service period, revenue, discount, payment, invoice report section). | `invoice-data-fields.md`: `invoice.png` |
| B | form-company | The company form with the corporate information printed on the invoice. | `company-form.png` |
| B | assign-to-existing-invoice | Parameter form of the action that assigns unbilled timesheets to an existing invoice. Nothing is executed. | `assign-to-existing-invoice.png` |
| B | form-article (after F1) | Article "Service" and a custom article. | `article.png`, `custom-article.png` |
| B | settings-invoice-number | Global settings, tab Outgoing Invoices, with the structure of the invoice number. | `invoice-data-fields.md`: `global-settings-invoice-number.png` |

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
| B | menu-search | Menu search for "Invoices" (the picture from 2026-07 still has the old blue app bar). | `ui/menu-search.md`: `menu-search-invoices.png` |
| B | list-grouping | A list grouped by one column, one group expanded, one collapsed. | new for `ui/lists/grouping.md` (page has no picture) |
| B | list-filter-dates | A list filter with the date quick picks opened. | new for `ui/lists/filter-dates.md` (page has no picture) |
| B | sandbox-switch | Account menu with the switch to the sandbox, and the app bar with the sandbox badge. | `data-model-customization/overview.md`: `ws-switch-to-sandbox.png`, `sandbox-badge.png` |
| C | permission-readonly | Read-only project form and the project list of a user who may only read the projects assigned to them (needs a demo role). | `data-model-customization/permission.md`: `read-only-project-form-web.png`, `read-only-assinged-projects-web.png` |
| C | form-examples | The example forms of the customization page (sections, columns, expressions); needs the example forms in the demo model. | `data-model-customization/form.md` (7 pictures from 2017) |

## 4. Outside the web client run

| Prio | Picture | What is needed | File(s) |
|---|---|---|---|
| B | Annotated calendar overview | calendar-week with labels for app bar, date selection, toolbar, user, working time, formatting profile and templates (the old picture had them). Overlay the labels after the run. | `timesheet-calendar/images/wc-calendar-overview.png` |
| B | Architecture schema | New drawing: web client, sidekick, MCP server, Azure. The current one shows "Windows Azure" and a client PC. | `getting-started/images/system-architecture.png` |
| B | Customization picture for the start page | Web client menu Customization or a model schema instead of the Cockpit.Admin window. | `getting-started/images/data-model.png` |
| B | sidekick pairing and settings | Pictures of the sidekick window from its own screenshot run (`web/Tools/SignalTracker`, demoShots). | new for `sidekick/installation-and-pairing.md`, `sidekick/privacy-and-data.md` |
| C | Login, password reset, PAT | Check whether the login portal has a new design; if so, retake. | `getting-started/howtos/images/reset-password-1..3.png`, `web-api/images/create-pat-1.jpg` |
| C | Account management | Check whether the account pages have a new design. | `account-management/images/account-overview.png`, `manage-users.png`, `billing-info.png` |
| C | AI dashboard example | A dashboard an AI assistant built from time cockpit data. | new for `ai-assistants/dashboards.md` |

Out of scope: pictures of the classic client and Cockpit.Admin (2017 pictures in `data-model-customization/`,
`reporting/`, `data-exchange/export.md`), the classic signal tracker (`timesheet-calendar/signals.md`,
`signal-details.md`, `signal-tracker/`; replaced by sidekick, so the pages need a decision rather than new pictures),
e-mails, Excel files and third-party tools (MCP pages).
