---
title: MCP Access, Scope, and Confirmation
description: How the time cockpit MCP server restricts what an AI agent may do - the read-only access mode, the own-data scope, permission enforcement, and the confirmation handshake for changes.
keywords: [MCP readonly, MCP owndata, MCP confirmation, confirmed=true, AI agent permissions, time cockpit]
---
# MCP Access, Scope, and Confirmation

> [!WARNING]
> Preliminary documentation: The time cockpit MCP server and this documentation are under active development. Tool names, dialog labels and configuration steps may change without notice. Check back for updates before rolling the setup out to your users.

Three mechanisms decide what an AI agent may do with your time cockpit data. Two of them you choose when you connect; the third is set by whoever operates the server.

## 1. Your time cockpit permissions always apply

This is the floor that none of the settings below can lift. Every call is authorized again against the tenant's permission model, using the union of the roles assigned to the signed-in user. A list, entity, property, or object that the user cannot reach in the web client is not reachable through an agent either — and it cannot be reached by guessing a technical name, because a tool or artifact hidden from discovery is also rejected when it is called directly.

On top of that, system entities and a fixed set of internal entities (telemetry, notification, feature-flag, and similar shipped internals) are hidden from every agent surface: discovery, description, queries, objects, and resources alike.

## 2. Access and scope: settings you choose

`access` and `scope` are part of the connection. Both can only ever **narrow** what the connection may do, which is why a client is allowed to set them at all. Neither replaces permissions.

| Setting | Value | Effect |
|---|---|---|
| Access | `readonly` | Every tool that changes data is hidden from the tool list and rejected if called. |
| Scope | `owndata` | Every tool whose result cannot be restricted to the acting user is hidden. `get_timesheets` and `create_timesheet` remain and are forced to that user on the server. |

Omitting a setting, or passing `default`, leaves it unrestricted. There is no `readwrite` value.

Because these are part of the connection, they **cannot be tightened later in a conversation**. Decide before you connect:

| Who is connecting | Access | Scope |
|---|---|---|
| Someone wiring up a personal assistant for the first time | `readonly` | `owndata` |
| Someone who books and corrects their own hours | default | `owndata` |
| A tenant administrator doing reporting or maintenance | default | default |
| Anyone exploring or demonstrating on live data | `readonly` | default |

How to supply them is described in [Connection Settings](overview.md#connection-settings-header-or-url-segment).

## 3. Confirmation: a setting you do not choose

Every generic create, update, and delete of an object (`create_object`, `update_object`, `delete_object`) requires an explicit confirmation before it is carried out. This is the default policy, and it is what stops an agent from changing an object as a side effect of answering a question.

In practice it is a two-step handshake:

1. The agent calls the tool. The server does **not** touch any data and answers `status: confirmation_required` together with a message describing what would happen.
2. The agent tells you what it is about to change. Once you agree, it repeats the same call with `confirmed=true`, and the change is carried out.

An answer of `confirmation_required` is therefore the normal path, not an error.

> [!IMPORTANT]
> Confirmation is **not** a client setting. Unlike access and scope, turning it off would *widen* what a request may do, so it can only be configured by whoever operates the server: deployment configuration for the hosted server, the `--mcp-confirmation` launch argument for the local host. A request that tries to send confirmation as a header or a URL segment is rejected outright.

An operator may set the policy to `Disabled` — intended for controlled environments such as a disposable sandbox — in which case mutations run without the extra round trip. On a production tenant, expect confirmation to be required.

Deleting an object is destructive and confirmation-gated like every other change; there is no separate undo.

## Related pages

- [AI Agents and the time cockpit MCP Server](overview.md)
- [Connection Settings](overview.md#connection-settings-header-or-url-segment)
- [Local MCP Server: Tools](oncockpit-admin-local.md#tools)
- [Permissions & Security Guide](../data-model/permissions-guide.md)
