---
title: Developer FAQ - Common Questions
description: Frequently asked questions for developers working with time cockpit's data model, queries, Web API, reporting, and automation.
---

# Developer FAQ

This page answers common technical questions about customizing and integrating time cockpit.

> [!NOTE]
> Examples and references in this FAQ are meant as starting points. Always verify custom scripts, queries, and integrations in a development environment before using them in production.

## Data Model and Lists

### Where should I start if I want to understand the standard data model?

Start with these pages:

- [Entity Relationships](data-model/entity-relationships.md)
- [Standard Entities Reference](data-model/standard-entities.md)
- [Data Model Customization Overview](data-model-customization/overview.md)

### How can I create custom fields, entities, lists, or forms?

Use the data model customization documentation:

- [Entities](data-model-customization/entity.md)
- [Lists](data-model-customization/list.md)
- [Forms](data-model-customization/form.md)
- [Navigation](data-model-customization/navigation.md)
- [Permissions](data-model-customization/permission.md)

## Queries and Calculations

### How do I query time cockpit data?

Use TCQL for queries inside time cockpit and the Query endpoint if you want to execute TCQL over the Web API.

Start here:

- [TCQL Overview](tcql/overview.md)
- [From Clause](tcql/from-clause.md)
- [Where Clause](tcql/where-clause.md)
- [Select Clause](tcql/select-clause.md)
- [Expression Language](tcql/expression-language.md)

### How do I work with overtime, working time, or holiday calculations?

Use the built-in working-time functions and the existing attendance entities as your reference.

See:

- [Functions for Working Time and Holidays](tcql/functions-for-working-time-and-holidays.md)
- [Working Time](employee-time-tracking/working-time.md)
- [Absence Time Management](employee-time-tracking/absence-time-management.md)

### How can I analyze project budget or profitability data?

Use the standard budgetary control implementation and related entities as your reference point.

See:

- [Budgetary Control Implementation](use-cases/budgetary-control.md)
- [Customer / Project / Task](project-time-tracking/customer-project-task.md)
- [Invoicing](project-time-tracking/billing.md)

## Web API and Integrations

### How do I access time cockpit from external applications?

Use the Web API.

Start with:

- [Web API Overview](web-api/overview.md)
- [Authentication](web-api/authentication.md)
- [OData Endpoint](web-api/odata.md)
- [Query Endpoint](web-api/query.md)
- [ExecuteAction Endpoint](web-api/executeaction.md)

### Should I use OData or the Query endpoint?

Use:

- `OData` for standard CRUD-style access to entities
- `Query` if you need TCQL, aggregations, or more complex projections

### How can I export data for external systems or reporting tools?

Depending on the scenario, use:

- [Data Export](data-exchange/export.md)
- [OData Endpoint](web-api/odata.md)
- [Query Endpoint](web-api/query.md)

## Automation and Scripting

### How do I automate workflows in time cockpit?

The standard options are:

- [Actions](scripting/actions.md) for user-triggered logic
- [Triggers](scripting/triggers.md) for logic on save
- [Automating Scripts](scripting/automating-scripts.md) for scheduled or repeated execution

### How do I implement approval or notification workflows?

Approval workflows are usually implemented with a combination of:

- entity fields for status and approver information
- triggers for automation and notifications
- actions for approve or reject steps
- permissions that control who can see or execute the workflow

See:

- [Triggers](scripting/triggers.md)
- [Actions](scripting/actions.md)
- [Approval Workflows](employee-time-tracking/approval-workflows.md)
- [Permissions](data-model-customization/permission.md)

## Reporting

### How do custom reports work in time cockpit?

Custom reports are based on SSRS and typically work on top of a time cockpit list.

See:

- [Reporting Overview](reporting/overview.md)
- [Custom Reports](reporting/custom-reports.md)
- [Standard Print View](reporting/standard-print-view.md)

### Can I combine multiple sources in one report?

Not directly in the standard reporting workflow. A common approach is to prepare the data in a dedicated list first and build the report on top of that list.

## Security and Permissions

### How do I restrict access to data by role or department?

Use entity permissions, role assignments, and where needed named sets or similar row-level patterns in the data model.

See:

- [Permissions & Security Guide](data-model/permissions-guide.md)
- [Default Permissions](employee-time-tracking/default-permissions.md)
- [Navigation Access Permissions & Menu Structure](navigation-access-permissions.md)

### How do I migrate to the newer default permissions model?

See:

- [Migration Guide Default Permissions](migration-guides/default-permissions.md)
- [Default Permissions](employee-time-tracking/default-permissions.md)

## Examples and Further Reading

### Where can I find practical examples?

Useful starting points:

- [Budgetary Control Implementation](use-cases/budgetary-control.md)
- [Scripting Overview](scripting/overview.md)
- [Use C# to Access Time Cockpit API](scripting/use-c-sharp-to-access-time-cockpit-api.md)
- [Import Data From CSV](scripting/import-data-from-csv.md)
- [Export Data to Microsoft Excel](scripting/export-data-to-excel.md)

## Need More Help?

If you are looking for end-user workflows instead of technical customization, continue with [For Users](for-users.md).
