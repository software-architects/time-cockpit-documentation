---
title: Vacation Entitlement
description: Reference for the standard Vacation Entitlement list in time cockpit, including filters and the entitlement fields per user.
---

# Vacation Entitlement

The **Vacation Entitlement** list contains the entitlement records that add or adjust vacation weeks for a user.

## Typical Audience

This list is typically relevant for:

- employees who review their own entitlement history
- HR Admins who maintain entitlements

## Navigation

- Standard navigation: `User -> Vacation Entitlement`
- Deeplink: `https://web.timecockpit.com/app/lists/entity/APP_VacationEntitlement`

## Standard Filters

| Filter | Technical Reference | Meaning |
|---|---|---|
| User | `@UserDetail` | Limits the list to one user |
| Include Hidden Users | `@IncludeHiddenUsers` | Includes hidden users |

## Columns

| Column | Technical Reference | Meaning | How the Value Is Determined |
|---|---|---|---|
| User | `UserDetailName`, `UserDetailUuid` | User of the entitlement record | Display value of the user detail |
| Vacation Entitlement Date | `APP_VacationEntitlementDate` | Date on which the entitlement becomes effective | Taken from the entitlement record |
| Number of Weeks | `APP_NumberOfWeeks` | Number of vacation weeks granted or deducted | Taken from the entitlement record |
| Description | `APP_Description` | Free-text description of the entitlement | Taken from the entitlement record |

## Related Pages

- [Vacation](vacation.md)
- [Vacation per Effective Date](vacation-per-effective-date.md)
