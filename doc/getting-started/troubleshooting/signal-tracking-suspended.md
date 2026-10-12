---
title: Signal Tracking Suspended - Fix Guide
description: Resolve signal tracking suspension in time cockpit caused by system time changes. Correct system clock and restart signal trackers.
---
# Signal tracking has been suspended

> [!NOTE]
> The classic signal tracker will be replaced by [time cockpit sidekick](~/doc/sidekick/overview.md) over the coming months. For new installations, use sidekick.

## Possible raised exception

MessageSecurityException

## Error cause
Due to an unexpected change in system time, signal tracking has been suspended to avoid overwriting or damaging existing signal data.

## How to solve it
1. Close time cockpit application and the signal tracker
1. Correct your system clock
1. Start time cockpit application and the signal tracker again?  
   Give time cockpit 10 minutes and check if it is recording signals again
