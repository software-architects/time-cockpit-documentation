# Standard Permissions in time cockpit

## Overview

**time cockpit** provides predefined standard permissions to streamline user access management. These roles cover common use cases and can be customized to meet specific needs. Below is an overview of the new standard permissions.

## New Standard Permissions

To simplify the initial configuration, the standard roles in **time cockpit** have been revised. These roles encompass various responsibilities and facilitate effective management.

### Roles and Permissions

#### **Account Admin**
- **Permissions:** 
  - Manage account settings
  - Manage user roles
  - Add new users
  - Activate/deactivate existing users
- **Target Audience:** Administrators responsible for general account management

#### **Customization Admin**
- **Permissions:** 
  - Manage the data model in **time cockpit**
  - Use the TCQL editor
- **Target Audience:** Users customizing the data model and creating complex queries

#### **Base Data Admin**
- **Permissions:** 
  - Manage base data entities and global settings:
    - Global settings
    - Formatting profiles
    - Import definitions
    - Template queries
  - Manage master data (e.g., customers, projects, countries, departments, vehicles, holiday calendars)
- **Target Audience:** Administrators managing key organizational data

#### **Billing Admin**
- **Permissions:** 
  - Manage all entities required for billing:
    - Create and delete invoices
    - Access timesheets of all users
  - Manage articles and units
- **Target Audience:** Users overseeing billing and financial data

#### **Human Resources Admin**
- **Permissions:** 
  - Manage all entities required for attendance time tracking:
    - User data and planned working times
    - Absence times (e.g., vacation, time-off, sick leave)
    - Holiday calendars
    - Vacation entitlement, overtime corrections, and maximum working times
    - Working time weightings
- **Target Audience:** Administrators responsible for HR and attendance management

#### **Notification Manager**
- **Permissions:** 
  - Send and manage application notifications
- **Target Audience:** Users handling communication tasks within the application

#### **Time Tracking User**
- **Permissions:** 
  - Access and use all time tracking features for their own user:
    - Manage their time tracking and absence times within the open booking period
    - Manage activities
- **Target Audience:** End users tracking their own working hours

---

## Role Overview Table

| **Internal Name**        | **Display Name**           | **Description**                                                                                     |
|---------------------------|----------------------------|-----------------------------------------------------------------------------------------------------|
| `AccountAdmin`            | Account Admin             | Members can manage account settings and user roles, add new users, and activate/deactivate existing users. |
| `CustomizationAdmin`      | Customization Admin       | Members can manage the data model and use the TCQL editor.                                         |
| `BaseDataAdmin`           | Base Data Admin           | Members can manage base data entities and global settings (formatting profiles, import definitions, template queries). |
| `BillingAdmin`            | Billing Admin             | Members can manage all billing-related entities, create/delete invoices, and access user timesheets. |
| `HumanResourcesAdmin`     | Human Resources Admin     | Members can manage attendance tracking data, user work schedules, absences, vacation entitlements, and overtime corrections. |
| `NotificationManager`     | Notification Manager      | Members can send and manage application notifications.                                             |
| `User`                    | Time Tracking User        | Members can access and use all time tracking functionalities for their own user.                   |

---

## Customization Options

The standard permissions are designed to cover common use cases. However, if special requirements arise, permissions can be customized to meet the specific needs of your organization.