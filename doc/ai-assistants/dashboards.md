---
title: AI Assistants - Dashboards and Visualizations
description: Prompts for building HTML, Excel and Markdown dashboards from time cockpit data with an AI assistant: project portfolio, controlling, utilization, absences.
---
# Dashboards and Visualizations

The MCP server delivers data, not graphics. The dashboard is built by the AI client (Claude, Codex, Copilot) from the query results: as a standalone HTML file with embedded charts, as an Excel workbook with charts, as a Markdown report, or — with Claude — as a reusable artifact.

Rules that have proven useful:

- Aggregate on the server with TCQL (totals, groupings) instead of loading raw entries into the client.
- Always write data timestamp, period, and filters visibly into the dashboard.
- Show the server's truncation notices as warnings.
- Dashboards are snapshots. Re-run the prompt for current data, or set it up as a scheduled task in your assistant.

Replace the placeholders in curly braces with your values.

## Project portfolio dashboard (HTML)

*Data used:* projects, timesheets, Budgetary Control of Projects list, TCQL → HTML file

> Create a project portfolio dashboard for all open projects as a single HTML file. Load the data via the time cockpit MCP server: per project the budget hours, booked hours in the period {FROM} to {TO}, billable hours, and remaining budget, aggregated with TCQL. Show KPI tiles at the top (number of projects, total budget, total booked, number of projects above 80 % consumption), below that a horizontal bar chart of budget consumption per project with traffic-light colors (green < 80 %, yellow 80–100 %, red > 100 %) and a sortable table. Write data timestamp, period, and filters into the header. Use only standard entities and point out truncated results in the dashboard.

## Controlling dashboard as Excel with charts

*Data used:* timesheets, customers, projects, invoices, TCQL → Excel

> Create an Excel workbook as a controlling dashboard for {MONTH}. Sheet "Overview": KPI cells (booked hours, billable hours, revenue, unbilled hours, number of invoices), a column chart of revenue per customer, and a pie chart billable vs. non-billable. Sheet "Data": the aggregated values per customer and project that the charts reference. Sheet "Source": period, filters, entities and queries used, data timestamp. Fetch the data aggregated with TCQL from the time cockpit MCP server; explain that revenues are calculated time entry values and not invoiced amounts.

## Team utilization heatmap

*Data used:* timesheets, users, working time limits, vacation, sick leave, TCQL → HTML

> Build a heatmap of my department's utilization for {FROM} to {TO}: rows = employees, columns = calendar weeks, cell color = booked hours relative to planned weekly working time (below 70 % blue, 70–110 % green, above 110 % red). Mark weeks with approved vacation or sick leave in gray. Deliver the result as an HTML file with a legend, a tooltip per cell (hours, target, absences), and a summary of the three highest and lowest utilizations. Aggregate per employee and week on the server with TCQL.

## Personal weekly dashboard

*Data used:* current user, timesheets, projects, tasks → Markdown or HTML

> Create my personal dashboard for calendar week {WEEK}: daily bars of booked hours against my daily target, distribution of hours by project as a donut, share of billable hours, a list of days with gaps or below target, and the five largest entries. Use only my own timesheets, no other people. Output the dashboard as an HTML file plus a three-line text summary that I can post in the team chat.

## Budget traffic light as a recurring report

*Data used:* Budgetary Control of Projects list, Budgetary Control of Tasks list → Markdown, scheduled task

> Create a budget traffic light for all open projects and tasks: a table with project, task, budget, booked, consumption in percent, and traffic-light status, sorted by consumption descending, with the number of green, yellow, and red entries above it. Prefer the standard lists. Phrase the report so that it can be repeated unchanged as a weekly scheduled task: state the data timestamp, highlight changes compared to the previous run if I attach the last report, and do not make any changes to data.

## Absence calendar of the department

*Data used:* vacation, sick leave, compensatory time, users, departments → HTML

> Generate an absence calendar of my department for {MONTH} as an HTML file: rows = employees, columns = calendar days, colored blocks for vacation, sick leave, and compensatory time, open requests hatched or outlined. Below it show the days with the most simultaneous absences and a list of the requests not yet approved. Use only employees of my department and do not change any data.

## Customer cockpit

*Data used:* customers, projects, timesheets, invoices, TCQL → HTML

> Create a customer cockpit for customer {CUSTOMER_CODE} as an HTML file for the last twelve months: monthly hours and revenue as a combination chart (columns for hours, line for revenue), distribution across projects, share of billable hours, open and paid invoices, and the five most active employees for this customer. Aggregate per month with TCQL, mark incomplete months, and write data timestamp and filters into the header. Standard entities only.

## Interactive dashboard as a Claude artifact

*Data used:* TCQL aggregates → Claude artifact (HTML with embedded data)

> Build an interactive dashboard as an artifact from the time cockpit data for {FROM} to {TO}: filters by customer and project, a toggle between hours and revenue, charts and table reacting to the filters. Embed the aggregated data (per customer, project, month) directly in the page so that it works without a server connection, and show the data timestamp prominently. Fetch the data in as few TCQL queries as possible and report if the server truncated results.

## Related Pages

- [AI Assistants Overview](overview.md)
- [Use Cases and Prompts](use-cases-and-prompts.md)
- [Reporting Overview](~/doc/reporting/overview.md) — built-in reports without an AI assistant
