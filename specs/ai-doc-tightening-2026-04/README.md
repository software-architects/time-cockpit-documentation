# AI Documentation Tightening Plan

## Summary

This workspace tracks the tightening of AI-generated user documentation added in early 2026. The goal is to turn verbose, generic, and partially unverified content into concise product documentation focused on how time cockpit works.

This workspace does not change product APIs or data types. It contains planning and tracking artifacts only.

## Scope

The initial focus is on the highest-risk FAQ files:

1. `doc/department-lead-faq.md`
2. `doc/hr-administrator-faq.md`

Follow-up tasks should then continue in this order:

1. `03-project-manager-faq.md`
2. `04-billing-admin-faq.md`
3. `05-user-faq.md`
4. `06-employee-faq.md`
5. `07-thematic-pages.md`

The thematic pages task should cover:

- `doc/employee-time-tracking/absence-time-management.md`
- `doc/employee-time-tracking/working-time.md`
- `doc/project-time-tracking/billing.md`
- `doc/project-time-tracking/customer-project-task.md`
- `doc/reporting/overview.md`

The next workstream after the AI-text tightening is a user-facing reference layer for important standard lists and actions. This workstream should focus on non-trivial lists with calculations, aggregations, or role-specific behavior, and on user-visible standard actions with non-obvious side effects.

## Alignment with Existing Review

This plan must stay aligned with the principles in `specs/documentation-review-2026-02-09.md`.

Key points to preserve from that review:

- keep user documentation audience-focused
- keep role-based entry points and role-specific FAQs
- keep task-oriented guidance such as "How do I...?"
- keep discoverability through landing pages and cross-links
- keep separation between functional documentation and developer documentation
- build on existing practical how-to guides instead of replacing them with abstract summaries

This tightening effort is therefore a reduction of noise, not a rollback of the user-oriented structure introduced in February 2026.

## Editorial Rules

### Content Focus

- Write how-to documentation for time cockpit.
- Prefer concrete product usage over general explanation.
- Keep answers short and operational.
- Prefer linking to existing detailed product pages over duplicating explanations.
- Preserve the role-based and task-oriented structure that improves discoverability for end users.
- Avoid technical implementation terms in user-facing text such as `EntityView`, XAML, model internals, or other developer-facing storage/configuration language.

### Remove or Heavily Reduce

- Generic business advice
- HR, leadership, or management coaching
- Policy catalogs and country comparisons
- ROI calculations and marketing language
- Meeting rhythms, stakeholder communication, and training recommendations
- Fairness, seniority, or staffing decision frameworks unrelated to the product UI

### Preserve While Tightening

- role-specific FAQ structure
- clear "How do I...?" framing
- links to verified detailed documentation pages
- practical user-facing workflows when they are grounded in the product
- audience separation between user docs and developer docs

### User-Facing Language Rule

- Do not explain user-facing behavior with technical implementation terms.
- If repository verification comes from technical artifacts, translate that knowledge into user-facing language before writing.
- Use terms such as `list`, `form`, `filter`, `view`, or `report` instead of implementation terms unless the page is explicitly for developers.

### UI Verification Rule

UI statements must be backed by repository evidence before they are written as fact.

Examples of statements that require verification:

- exact navigation paths
- action names
- field labels
- auto-fill or automatic workflow behavior
- role-based visibility and permissions
- existence of specific reports, views, or calendar behavior

If a UI detail cannot be verified, use one of these options in order:

1. Rewrite it in neutral, lower-risk wording.
2. Replace it with a link to an existing verified documentation page.
3. Mark it for review if it is still important.

Use this marker for open UI verification points:

```md
> [!WARNING]
> Review required: Exact UI path / label / behavior not verified from repository sources.
```

## Continuation Playbook

Use this process for every remaining rewrite so work stays consistent with the completed April wave:

1. Pick the next pending page from `progress.md`.
2. Remove or compress generic business/process text first.
3. Keep the user task framing (`How do I ...?`) and role focus where present.
4. Verify concrete UI claims against repository sources before writing them as facts.
5. Prefer links to existing verified pages over repeating long explanations.
6. If a UI detail cannot be verified, rewrite neutrally or add the standard `Review required` warning.
7. After editing, update `progress.md` with status, date, and a short note about what changed.

Verification source order:

1. Existing user documentation
2. `navigation-configuration.json`
3. Standard list/action definitions in `TimeCockpit.Classic`
4. Report/action code when needed

Task brief files for completed items were intentionally removed to reduce maintenance overhead. The canonical handover artifacts are this file and `progress.md`.

## Deliverables in This Folder

- `README.md`: Overall plan and editorial rules
- `progress.md`: Progress tracker and review-flag overview

## Open TODOs

- Create a dedicated help page for every non-trivial list in time cockpit.
- Prefer one focused help page per list over burying list behavior in role FAQs.
- Use these pages as canonical targets for future FAQ links and UI verification.
- Continue adding focused help pages for further standard actions with non-obvious behavior or side effects as needed. Core billing and absence actions are now covered in the reference section.
- Place list and action reference pages under a user-facing `Reference` section in the TOC instead of the developer documentation.
- Convert UI path references such as `User -> Vacation` into real hyperlinks wherever stable target links exist.
- Before any repo-wide hyperlink cleanup, verify menu deeplinks against `navigation-configuration.json` and distinguish between entity-based navigation commands (`/app/lists/entity/APP_*`) and direct list commands (`/app/lists/APP_*List`).

## Acceptance Criteria

- This folder is self-contained and clear enough for follow-up work without additional planning.
- `progress.md` shows what is completed, in progress, and still pending.
- Follow-up work can continue directly from `progress.md` and the open TODOs in this file.
