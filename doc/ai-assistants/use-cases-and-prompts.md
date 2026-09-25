---
title: AI Assistants - Use Cases and Prompts by Role
description: "Ready-to-use prompts for project managers, controllers, HR administrators, time tracking users and department leads working with time cockpit via AI."
---
# Use Cases and Prompts by Role

All examples use only standard entities, standard fields, and standard MCP tools. Replace the placeholders in curly braces (`{FROM}`, `{TO}`, `{PROJECT_CODE}`, …) with your values.

The prompts are written so that they work unchanged in every configured assistant (Claude Code, Claude app, Codex, VS Code, Copilot). They follow the server's guardrails: check available fields first, point out truncated results, and perform writing actions only after your explicit confirmation.

The line *Data used* lists the time cockpit entities, lists, or tools the assistant typically draws on; you do not need to mention them in the prompt.

## Project Manager

### Project budget vs. actual hours

*Data used:* projects, timesheets, Budgetary Control of Projects list, TCQL

> Compare the budget with the actually booked hours of all my projects for the period {FROM} to {TO}. Group by project and show project code, project name, budget hours, booked hours, remaining budget, and percentage used. Use only standard entities and check the available fields first. Point out truncated results or missing budgets.

### Project status and open tasks

*Data used:* projects, tasks, default project and task lists

> Analyze my projects and show open and closed tasks per project. Output project code, project name, task code, task description, task budget, and status. Sort by project first, then by task status. Use only standard fields.

### Project hours per employee

*Data used:* timesheets, users, projects, TCQL

> Create an overview of booked hours per employee for project {PROJECT_CODE} in the period {FROM} to {TO}. Show employee, number of entries, booked hours, and billable hours. Use the duration in hours and flag if the result is incomplete.

### Projects with critical budget consumption

*Data used:* projects, timesheets, Budgetary Control of Projects list

> Find all open projects whose booked hours reach at least 80 percent of the project budget or exceed it. Show project code, project name, budget, booked hours, consumption in percent, and remaining budget. Sort by highest consumption.

### Close a project in a controlled way

*Data used:* projects, update tool

> Find project {PROJECT_CODE} and first show me the current status, the end date, and the key project data. Propose closing the project by setting it to closed and optionally setting the end date to {END_DATE}. Do not change anything yet and ask me explicitly for confirmation before making the change.

## Project Controller

### Unbilled timesheets

*Data used:* Unbilled Timesheets list, timesheets

> Determine all unbilled time entries for {FROM} to {TO}. Group them by customer and project and show employee, date, task, hours, billability, and invoice status. Prefer the existing standard list and state which data source you used.

### Budget control for projects and tasks

*Data used:* Budgetary Control of Projects list, Budgetary Control of Tasks list

> Create a budget control for all open projects and tasks. Show budget hours, booked hours, remaining budget, and percentage used. Highlight overruns clearly and distinguish project budget from task budget.

### Revenue by customer and project

*Data used:* timesheets, customers, projects

> Determine the billable hours and the calculated revenue per customer and project for {FROM} to {TO}. Also show the number of entries. Use the billable flag, the duration in hours, and the revenue field, and explain that these are calculated time entry values, not necessarily invoiced amounts.

### Timesheets without invoice assignment

*Data used:* timesheets, invoices

> Find all billable time entries in the period {FROM} to {TO} that are not yet assigned to an invoice. Show entry ID, employee, project, task, date, hours, and revenue. Do not present any entry as complete if the result was truncated.

### Monthly controlling report

*Data used:* timesheets, projects, invoices, TCQL

> Create a monthly controlling report for {MONTH} with booked hours, billable hours, revenue, budget consumption, unbilled time, number of invoices, and open payments. Group by customer and project. Provide totals at the end and state period, filters, data source, and possible limitations.

## HR Administrator

### Remaining vacation per employee

*Data used:* vacation entitlements, vacation, users, `:RemainingVacationWeeks`

> Determine the current remaining vacation for all active employees. Show employee, vacation entitlements, consumed vacation days or hours, and remaining entitlement. Use the time cockpit function :RemainingVacationWeeks(...) and point out that the result is returned in weeks.

### Open vacation requests

*Data used:* vacation, users

> Show all vacation entries that are not yet approved in the period {FROM} to {TO}. Output employee, start, end, duration, description, and approval status. Distinguish open, approved, and rejected entries and do not change any data.

### Check vacation entitlements

*Data used:* vacation entitlements

> Check the vacation entitlements of all active employees for the year {YEAR}. Show accrual date, number of entitlement weeks, employee, and description. Mark missing or unusual entitlement entries, but do not change anything automatically.

### Sick leave and compensatory time

*Data used:* sick leave, compensatory time, users

> Create an absence overview with sick leave and compensatory time for {FROM} to {TO}. Show employee, start, end, duration, description, and approval status. List the categories separately and provide a total per category.

### Planned time, actual time, and overtime

*Data used:* users, working time limits, working time weights, TCQL

> Compare planned working time, actually booked working time, and overtime of all active employees for {FROM} to {TO}. Show deviations per employee and sort by the largest positive or negative difference. Take the configured working time rules into account.

## Time Tracking User

### My working time violations

*Data used:* Working Time Violations list, timesheets

> Check my own working time violations for the period {FROM} to {TO}. Show date, affected entries, violation type, and relevant time values. Prefer the standard list and use my timesheets only as a supplement. Do not make any corrections automatically.

### Unusual gaps and overlaps

*Data used:* current user, timesheets

> Analyze my time entries in the period {FROM} to {TO} for unusually long gaps, overlaps, and possible duplicates. Ignore pure duration entries when checking for gaps. For each finding show date, start, end, duration, and affected entry IDs. Do not propose any entries automatically.

### My hours per project

*Data used:* timesheets, projects, tasks

> Summarize my time entries for {FROM} to {TO} by project and task. Show number of entries, booked hours, billable hours, and non-billable hours. Provide a grand total at the end and state the exact data period.

### Create vacation

*Data used:* vacation, create tool

> I want to enter vacation from {START} to {END}. First check whether an absence already exists for this period. Then show me the planned record with start, end, full-day flag, and description. Do not change anything yet and ask me explicitly for confirmation before creating it.

### Missing daily entries

*Data used:* timesheets, vacation, sick leave

> Check my working days in the period {FROM} to {TO} for missing time entries. Take vacation, sick leave, and weekends into account. Show only possible gaps on working days and for each gap state the date, existing entries, and the missing time span.

## Department Lead

### Absences in my department

*Data used:* users, departments, vacation

> Show the absences of my department for {FROM} to {TO}. Group by employee and absence type. Output start, end, duration, and approval status. Use only employees assigned to my department.

### Team hours per week

*Data used:* timesheets, users, TCQL

> Create a weekly overview of booked hours for my department in the period {FROM} to {TO}. Per employee show number of entries, hours, and deviation from the weekly working time. Point out missing or truncated data.

### Missing entries in the team

*Data used:* timesheets, vacation, sick leave

> Check the employees of my department for possible missing entries in the period {FROM} to {TO}. Take approved vacation, sick leave, weekends, and public holidays into account. Output only findings and do not change any entries.

### Open vacation requests

*Data used:* vacation, users

> Show all open or not yet approved vacation requests of my department. Output employee, period, duration, description, and request status. Sort by start date and summarize the number of open requests.

### Team utilization

*Data used:* timesheets, users, working time limits

> Analyze the utilization of my department in the period {FROM} to {TO}. Compare planned working time, booked hours, billable hours, and absences per employee. Flag significant over- or under-utilization.

## Additional Use Case: Derive Time Entries from ChatGPT or Claude Chats

*Data used:* chat export, projects, tasks, timesheets, TCQL

> I am attaching an export of my ChatGPT or Claude chats. Identify possible work activities, time references, projects, and tasks from it. Where possible, map the identified activities to my projects and tasks. Compare them with my existing time entries in the period {FROM} to {TO}. Show already booked activities, possible missing entries, and uncertain assignments separately. Only create proposals and do not create any time entries without my explicit confirmation.
>
> Treat chat timestamps only as an indication. If no reliable duration can be derived from the chat, mark the activity as uncertain and ask instead of inventing a duration.

## Related Pages

- [AI Assistants Overview](overview.md)
- [Dashboards and Visualizations](dashboards.md)
- Role FAQs: [Project Manager](~/doc/project-manager-faq.md), [Billing Administrator](~/doc/billing-admin-faq.md), [HR Administrator](~/doc/hr-administrator-faq.md), [Employee](~/doc/employee-faq.md), [Department Lead](~/doc/department-lead-faq.md)
