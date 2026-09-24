---
title: MCP Limits, Truncation, and Long-Running Operations
description: What the row and size limits of the time cockpit MCP server mean, how to read a truncated result, why a list description can be derived from a sample, and which operations cannot be cancelled.
keywords: [MCP truncated, MCP row limit, MCP response limit, describe_list sample, cancel MCP operation, time cockpit]
---
# MCP Limits, Truncation, and Long-Running Operations

> [!WARNING]
> Under construction: The time cockpit MCP server and this documentation are under active development, and breaking changes are possible. Tools may be renamed, changed or removed, and dialog labels and configuration steps may change without notice. Check back for updates before rolling the setup out to your users, and expect to adapt your configuration, skills and prompts after an update.

Every read through the time cockpit MCP server is bounded. That is deliberate: an AI agent that pulls an unbounded result set is slow, expensive, and usually less useful than one that asks a narrower question. This page explains what the bounds are, how to tell that one was hit, and which operations cannot be stopped once they have started.

## Two kinds of bound

**Row caps** limit how many records come back. The cap is applied *before* the data is fetched — it is pushed into the query or the request — rather than by throwing rows away afterwards. By default a read returns at most 100 rows.

**Size caps** limit how large the answer may be, measured both in bytes and in estimated tokens. They exist because a small number of very wide records can be larger than a large number of narrow ones.

Both are configured per deployment, so your administrator may have set different values than the defaults.

## Reading a truncated result

A bounded result always says whether anything was left out:

- **`truncated: false`** — this is the complete answer to the question that was asked.
- **`truncated: true`** — there was more. The result is still valid, it is just not all of it, and a `warnings` entry names the limit that cut it short.
- **`count`** is always the number of rows actually returned. It is never the total number of matching records in the tenant.

What to do about it is almost always the same: **ask a narrower question**. Add a date range, a project or user filter, or fewer columns, and run it again. Raising the limit is an administrator decision and rarely the right first move.

The flag is exact, including for a raw TCQL query. The server asks for one record more than the cap allows and uses that extra record only to find out whether anything was left behind. So a result that happens to fill the cap exactly is reported as complete, not as a maybe — there is no "possibly truncated" answer to interpret.

## Results that shrink instead of failing

Some tools take no arguments worth narrowing, so failing on a size limit would leave the caller with nothing to do. Those results **shed content and report it** instead:

- `get_environment` drops parts of the answer in a fixed order — named-set rows first, then the tenant's global settings, then the least important parts of the acting user's record — and reports every drop through `truncated` and `warnings`. Nothing is dropped silently.
- `get_current_user` shortens an oversized record the same way, always keeping the record's identity and display value.
- `describe_entity` drops descriptions first and then properties. A truncated entity description is therefore **not** a complete property list — worth knowing before concluding that a property does not exist.

## Named sets have their own, much larger budget

`get_environment` stays deliberately lean, so a named set with more rows than the standard read limit is cut short there. `get_named_set` re-reads a single named set on its own, under a separate and far larger budget — by default up to 10,000 rows. If a named set in `get_environment` says `truncated: true`, this is the tool to use next.

Neither host can bound a named set at the source: the environment is evaluated as a whole before a single set can be picked out of it. The limit bounds what is transferred, not the work the tenant had already done.

## Sampled list descriptions

`describe_list` reports a named list's result columns and parameters so that an agent knows the shape of a list before running it. It never returns rows of its own — the row collection is always empty.

Where the server can derive the columns from the list's own definition, they are exact. Where it cannot, it derives them from a **sample execution of the list capped at 5 rows** instead, and reports that in `warnings`. The hosted server cannot run a list's query or script without executing it, so it always samples; the local host samples only for a script-backed list whose shape cannot be determined without running it.

Sampling affects the **columns** only. A column that is empty in every sampled row cannot be typed, and is reported as unknown. The `warnings` entry says whether the columns came from a sample and whether the sample was empty.

A list's **parameters** are always read from the list's own definition, on both hosts, with their real types and mandatory flags. They are never guessed from sampled data.

### A list that requires a parameter

Many lists will not run until a parameter has a value. `describe_list` still describes them without you supplying anything: it fills in the parameters you left out — using the default the list author declared on the filter field, or leaving the field empty where there is none — and samples the list with those values.

Because those filled-in values decide which rows the sample sees, `warnings` names every parameter that was filled in. If the sample comes back empty, that is usually why: supply the parameters you actually care about and call `describe_list` again. Values you supply are never overwritten.

Two limits worth knowing. A default written as an expression (anything starting with `=`) is not evaluated by the hosted server, so such a field counts as having no default. And if the list's definition cannot be read at all, the server falls back to what the tenant's own rejection tells it: no columns, the one parameter named in the rejection reported as mandatory with the type `Unknown`, and a warning that further such parameters may exist.

`execute_list` still fails on a missing parameter, with the message naming it. It owes you rows, and it has none.

> [!NOTE]
> `describe_list` is still offered to clients as a read-only, repeatable call, and it is not confirmation-gated. That is the same footing `execute_list` is on, and for the same reason: a named list is a signed model artifact, so describing one cannot be treated as riskier than running it. What the sampling does change is cost — describing an unfamiliar script-backed list can run that list's own script, so it is a cheap capped read rather than the free metadata lookup its name suggests.

## Operations that cannot be cancelled

Most operations stop when the client cancels. Two cannot, and the tools say so rather than reporting a cancelled outcome while work continues in the background:

- **IronPython scripts** on the local host (`execute_script_literal`, `execute_script_file`). Once a script has started, it runs to completion: cancellation is checked before the script starts, never during it.
- **The write phase of `create_timesheet_suggestion`.** Cancellation is honoured up to the first record written; after that the writes finish.

Practically: if an agent appears to hang on one of these, the work is probably still running. Do not assume it was rolled back, and check the affected records before retrying.

## Related pages

- [Local MCP Server: Tools](oncockpit-admin-local.md#tools)
- [Access, Scope, and Confirmation](access-and-confirmation.md)
- [AI Agents and the time cockpit MCP Server](overview.md)
