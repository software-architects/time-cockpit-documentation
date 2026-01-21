---
title: Customer, Project & Task Hierarchy
description: Understand time cockpit's hierarchical data model for customers, projects, and tasks. Learn about hourly rates, budgets, billable projects, and global tasks.
---
# Customer / Project / Task Hierarchy

This chapter describes the default data model that is shipped with time cockpit.

> [!NOTE]
Please note, that you are able to extend entities of the default data model but you cannot delete them. This is necessary to provide upgrades of the default data model. Your changes always stay untouched in case of upgrades. <br/><br/>You cannot change standard lists and forms. If you want to create your own lists and forms please copy the relevant list and form definitions in the module **Customization**, perform your customization in the copy and link it to menu. Please note that changes of standard lists and forms will not be adopted in your copies.

## Customer

In time cockpit, customer, projects and tasks are administered hierarchically. You find the customer on top of this hierarchy.

For each customer you can enter a default hourly rate (`APP_HourlyRate`). If you do not enter a differing hourly rate in a project or a task, the hourly rate of the customer applies to all projects and tasks assigned to the customer.

## Project

Each customer can have assigned various projects.

Per project you can set the project budget can be set in hours (`APP_BudgetInHours`) and the monetary budget (`APP_Budget`). These fields can be used for controlling a project's budget.

For each project you can define an hourly rate (`APP_HourlyRate`) that differs from a customer's hourly rate. If you do not enter a differing rate, the default hourly rate of a customer will be used. You find the effective hourly rate of a project in the calculated property `APP_HourlyRateActual.`

Time cockpit differentiates between billable and not billable projects (`APP_Billable`).

## Tasks

Each project can have assigned various tasks.

For each task you can set the budget in hours (`APP_BudgetInHours`) and the monetary budget (`APP_Budget`). These fields can be used for controlling a project's budget.

For each task you can define an hourly rate (`APP_HourlyRate`) that differs a project's hourly rate. If you do not enter a differing rate, the default hourly rate of a project will be used. You find the effective hourly rate of a project in the calculated property `APP_HourlyRateActual`.

Tasks can me marked as not billable (`APP_NoBilling`).

Since time cockpit version 1.7 you can activate global tasks. Global tasks are tasks which are not assigned to a specific project but are available for all projects (e.g. travel, sales, support, etc.). To activate global tasks in version greater than 1.7 you need to configure the relation between task and project as optional ("nullable"). Global tasks are not activated by default. If you want to use this function please proceed as follows:

- Switch to menu Customization.
- Switch to Server.
- In the entity tree locate the entity APP_Task. Right click the node and click Edit Entity.
- Switch to Validation Rules.
- Double-click the rule APP_ProjectRequired and disable the rule (check the Disable box).
- Save your changes.

After this modification you can create tasks without assigning them to a project. You will see these tasks for each project in the time sheet entry form.

> [!WARNING]
If you customized the time sheet entry form, you have to take the settings for the field Task from the default form in the default time sheet form (`APP_TimesheetForm`) and insert it into your modified form.

> [!WARNING]
If you query tasks, please keep in mind that the relation between entities task and project need not be set ("null"). For example, if you want a report to time sheet entries per project, you cannot access a project via `Timesheet.Task.Project`. You need to use `Timesheet.Task` and `Timesheet.Project`.