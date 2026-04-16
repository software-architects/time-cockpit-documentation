# Progress

Last updated: 2026-04-16

## Pickup Guide

Use this guide to continue work without the old one-off task briefs.

Execution pattern used in completed tasks:

1. Start from the next pending item in this tracker.
2. Remove generic business, policy, or coaching text.
3. Keep user-facing, product-specific how-to guidance.
4. Verify UI details before stating them as facts.
5. Prefer stable links to existing docs for deep detail.
6. Add `Review required` warnings only when important UI details cannot be verified.
7. Record completion notes in this tracker immediately after each page update.

Verification order used:

1. Existing user docs
2. `navigation-configuration.json`
3. Standard list/action definitions in `TimeCockpit.Classic`
4. Report/action code when required

Note:

- Completed task brief files under `specs/ai-doc-tightening-2026-04/tasks/` were retired intentionally after completion.
- Historical implementation detail is preserved in the Work Tracker notes below.

## Work Tracker

| Work Item | Target File | Status | Last Update | Notes |
|---|---|---|---|---|
| Planning and scope definition | `specs/ai-doc-tightening-2026-04/README.md` | completed | 2026-04-08 | Scope, editorial rules, verification standard, and alignment with `documentation-review-2026-02-09.md` documented. |
| Task 01: Department Lead FAQ | `doc/department-lead-faq.md` | completed | 2026-04-08 | AI-generated sections tightened, unsupported report/process guidance removed, and reporting references aligned to repository sources including `APP_OvertimePerEffectiveDateList` and `APP_TargetActualHoursComparisonList`. |
| Task 02: HR Administrator FAQ | `doc/hr-administrator-faq.md` | completed | 2026-04-08 | Tightened to product-focused HR guidance, corrected UI terms such as `Vacation Entitlement`, `Time Tracking User`, `Project Controller`, `Date of Separation`, and offboarding via `Active = false`. |
| Task 03: Project Manager FAQ | `doc/project-manager-faq.md` | completed | 2026-04-08 | Removed KPI, leadership, and forecasting advice that was not product-specific; aligned the file to projects, tasks, budgetary control, project time sheets, and billing handoff. |
| Task 04: Billing Administrator FAQ | `doc/billing-admin-faq.md` | completed | 2026-04-08 | Rewritten to standard invoice, rate, billing-address, and reporting workflows; removed finance-playbook language and aligned links to `Timesheets` and `Unbilled Timesheets`. |
| Task 05: User FAQ | `doc/user-faq.md` | completed | 2026-04-08 | Reduced broad explanations to short product-focused how-tos, aligned links to `Timesheets`, `Unbilled Timesheets`, and role-specific FAQs, and removed unsupported workflow claims. |
| Task 06: Employee FAQ | `doc/employee-faq.md` | completed | 2026-04-08 | Reduced the file to core employee workflows such as login, daily time entry, vacation, sick leave, and browser usage; removed policy-heavy and speculative guidance. |
| Task 07: Absence Time Management | `doc/employee-time-tracking/absence-time-management.md` | completed | 2026-04-08 | Removed the AI-generated business-case section and kept the verified workflow description for approval setup, role visibility, approval actions, and notifications. |
| Task 08: Working Time | `doc/employee-time-tracking/working-time.md` | completed | 2026-04-09 | Removed the AI-generated business-case section, aligned list names to navigation sources such as `Vacation per Effective Date`, `Overtime Corrections`, and `Target-Actual Hours Comparison`, and kept the functional calculation guidance. |
| Task 09: Reporting Overview | `doc/reporting/overview.md` | completed | 2026-04-10 | Removed the AI-generated ROI and management section, then rewrote the page into a shorter SSRS reference focused on data access, filters, and standard limitations. |
| Task 10: Customer / Project / Task Hierarchy | `doc/project-time-tracking/customer-project-task.md` | completed | 2026-04-09 | Removed the AI-generated business-case section, added direct links to the standard customer/project/task lists and customization overview, and tightened the remaining hierarchy and global-task guidance. |
| Task 11: Invoicing | `doc/project-time-tracking/billing.md` | completed | 2026-04-10 | Removed the AI-generated business-case section and then tightened the remaining page to verified billing navigation, invoice building blocks, generated invoice items, and manual invoice guidance. |
| Task 12: Navigation Access Permissions | `doc/navigation-access-permissions.md` | completed | 2026-04-10 | Rebuilt the page as a verified navigation reference, removed broken encoding, corrected entity/list/form deeplinks, and aligned menu names to current docs. |
| Task 13: Default Permissions Overview | `doc/employee-time-tracking/default-permissions.md` | completed | 2026-04-10 | Tightened the overview and role descriptions, linked the page to the navigation reference, and kept the technical TCQL permission table intact. |
| Task 14: For Users Landing Page | `doc/for-users.md` | completed | 2026-04-10 | Replaced the marketing-heavy landing page with a concise internal navigation page focused on documentation entry points and common user tasks. |
| Task 15: Developer FAQ | `doc/developer-faq.md` | completed | 2026-04-10 | Replaced speculative long-form examples with a compact technical FAQ that points to the canonical data model, TCQL, Web API, scripting, reporting, and permissions documentation. |
| Task 16+: Remaining AI-marked files | multiple files | pending | 2026-04-10 | Continue with remaining pages from the February AI-generated content wave that are still in the TOC without an April review marker. |
| Task 17: List and Action Reference Framework | `specs/ai-doc-tightening-2026-04/tasks/17-list-action-reference.md` | completed | 2026-04-10 | Defined the new workstream for user-facing list and action reference pages, including page structure, scope, and verification rules. |
| Task 18: TOC Cleanup and Reference Placement | `specs/ai-doc-tightening-2026-04/tasks/18-toc-cleanup.md` | completed | 2026-04-11 | Added the `For Users -> Reference` section, normalized the top-level TOC titles to plain text, and removed accidental `Release Notes 2017` entries while keeping intentional cross-links in place. |
| Task 19: First List Reference Page | `doc/reference/lists/unbilled-timesheets.md` | completed | 2026-04-10 | Added the first user-facing non-trivial list reference page with navigation, filters, visible columns, grouping, and the standard `Create Invoice` action. |
| Task 20: Budgetary Control of Projects Reference | `doc/reference/lists/budgetary-control-of-projects.md` | completed | 2026-04-10 | Added a user-facing reference page for the standard budgetary control list, including filters, calculated project-level columns, and drill-down links to timesheets and invoices. |
| Task 21: Overtime per Effective Date Reference | `doc/reference/lists/overtime-per-effective-date.md` | completed | 2026-04-10 | Added a user-facing reference page for the overtime snapshot list, including filters, visible columns, the overtime calculation context, and the link to overtime corrections. |
| Task 22: Create Invoice Action Reference | `doc/reference/actions/create-invoice.md` | completed | 2026-04-10 | Added the first action reference page with availability, prerequisites, parameters, standard side effects, and common validation failures. |
| Task 23: Additional Billing and Project List References | multiple files in `doc/reference/lists/` | completed | 2026-04-10 | Added reference pages for `Budgetary Control of Tasks` and `Invoice Report`, and grouped billing-related list pages under the reference TOC. |
| Task 24: Attendance and Leave List References | multiple files in `doc/reference/lists/` | completed | 2026-04-10 | Added reference pages for `Vacation`, `Vacation Entitlement`, `Vacation per Effective Date`, `Sick Leave`, `Compensatory Time`, `Weekly Hours of Work`, `Working Time Limits`, `Working Time Weights`, `Working Time Violations`, and `Absence Calendar`. |
| Task 25: Reporting and Analysis List References | multiple files in `doc/reference/lists/` | completed | 2026-04-10 | Added reference pages for `Target-Actual Hours Comparison`, `Time Report`, and `Home Office Overview`, and restructured the reference TOC into grouped list categories. |
| Task 26: Additional Action References | multiple files in `doc/reference/actions/` | completed | 2026-04-11 | Added reference pages for `Assign to Existing Outgoing Invoice`, `Approve Absence`, and `Reject Absence`, and linked them into the user-facing reference section. |

## Review Flags

Use this section to track open UI verification issues once rewrites begin.

Open flags:

- None yet. Add entries here when a document contains `Review required:` warnings.

Suggested entry format:

| File | Section | Open Issue | Status |
|---|---|---|---|
| `doc/example.md` | `How do I ...?` | Exact action name not verified from repository sources. | open |

## Open TODOs

- Create a dedicated help page for every non-trivial list in time cockpit and use those pages as canonical FAQ link targets.
- Convert UI path references such as `User -> Vacation` into real hyperlinks wherever stable target links exist.
- Before any repo-wide hyperlink cleanup, verify deeplinks against `navigation-configuration.json` so entity-based navigation commands use `/app/lists/entity/APP_*` and direct list commands use `/app/lists/APP_*List`.
