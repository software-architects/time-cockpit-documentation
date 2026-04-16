---
title: Customer, Project & Task Hierarchy
description: Understand time cockpit's hierarchical data model for customers, projects, and tasks. Learn about hourly rates, budgets, billable projects, and global tasks.
---
# Customer / Project / Task Hierarchy

> [!NOTE]
> Reviewed in April 2026.

This page describes the default customer, project, and task hierarchy that is part of the standard time cockpit data model.

> [!NOTE]
> You can extend entities of the default data model, but you cannot delete them. This is necessary to support upgrades of the default data model. Your changes stay untouched during upgrades. <br/><br/>You cannot change standard lists and forms directly. If you want to create your own lists and forms, copy the relevant definitions in the [Customization module](../data-model-customization/overview.md), customize the copy, and link it in your navigation. Changes to standard lists and forms are not adopted automatically in your copies.

## Customer

In time cockpit, customers, projects, and tasks are administered hierarchically. The customer is on top of this hierarchy.

You can manage customers in [Management -> Customers](https://web.timecockpit.com/app/lists/entity/APP_Customer).

For each customer you can enter a default hourly rate (`APP_HourlyRate`). If you do not enter a differing hourly rate in a project or a task, the hourly rate of the customer applies to all projects and tasks assigned to the customer.

## Project

Each customer can have multiple projects.

You can manage projects in [Management -> Projects](https://web.timecockpit.com/app/lists/entity/APP_Project).

Per project, you can set the budget in hours (`APP_BudgetInHours`) and the monetary budget (`APP_Budget`). These fields can be used for project budget control.

For each project you can define an hourly rate (`APP_HourlyRate`) that differs from a customer's hourly rate. If you do not enter a differing rate, the default hourly rate of a customer will be used. You find the effective hourly rate of a project in the calculated property `APP_HourlyRateActual.`

Time cockpit differentiates between billable and non-billable projects (`APP_Billable`).

## Tasks

Each project can have multiple tasks.

You can manage tasks in [Management -> Tasks](https://web.timecockpit.com/app/lists/entity/APP_Task).

For each task you can set the budget in hours (`APP_BudgetInHours`) and the monetary budget (`APP_Budget`). These fields can be used for controlling a project's budget.

For each task you can define an hourly rate (`APP_HourlyRate`) that differs from a project's hourly rate. If you do not enter a differing rate, the default hourly rate of the project will be used. You find the effective hourly rate of a task in the calculated property `APP_HourlyRateActual`.

Tasks can be marked as not billable (`APP_NoBilling`).

Since time cockpit version 1.7, you can activate global tasks. Global tasks are tasks that are not assigned to a specific project but are available for all projects, for example travel, sales, or support. To activate global tasks in versions greater than 1.7, you need to configure the relation between task and project as optional ("nullable"). Global tasks are not activated by default. If you want to use this function, proceed as follows:

- Switch to the [Customization module](../data-model-customization/overview.md).
- Switch to Server.
- In the entity tree, locate the entity `APP_Task`. Right-click the node and click `Edit Entity`.
- Switch to Validation Rules.
- Double-click the rule `APP_ProjectRequired` and disable the rule.
- Save your changes.

After this modification you can create tasks without assigning them to a project. You will see these tasks for each project in the time sheet entry form.

> [!WARNING]
> If you customized the time sheet entry form, you have to take the settings for the field `Task` from the default time sheet form (`APP_TimesheetForm`) and insert them into your modified form.

> [!WARNING]
> If you query tasks, please keep in mind that the relation between task and project need not be set (`null`). For example, if you want a report for time sheet entries per project, you cannot access a project via `Timesheet.Task.Project`. You need to use `Timesheet.Task` and `Timesheet.Project`.
