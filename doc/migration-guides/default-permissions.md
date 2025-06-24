## Migration Guide for Default Permissions

### Introduction and Overview

Default Permissions were introduced to make permissions in Time Cockpit clearer, more structured, and easier to manage. One of the main goals is to provide new customers with a smoother and faster onboarding experience. By enabling all relevant features and permissions by default, new users can start working with the system right away without the need for extensive configuration. This eliminates friction during the first steps and helps teams to be productive from day one. See [Default Permissions](~/doc/employee-time-tracking/default-permissions.md).

For existing customers, Default Permissions bring clarity and structure to their permission setup. They provide a clear framework to decide which users should have access to specific parts of the system. To avoid impacting existing customers, we have implemented a **feature flag mechanism** that ensures compatibility with the data models of existing customers who have custom permissions. This mechanism guarantees that there are no conflicts or unexpected behaviors when Default Permissions are introduced. More details can be found in the article [Feature Flags](~/doc/data-model-customization/feature-flags.md).

> [!NOTE] Starting with 13.5.2025 we are gradually rolling out the new datamodel to all our clients. 

> [!NOTE] Activation is possible through a request sent to `support@timecockpit.com`. This ensures that changes are properly coordinated and do not interfere with existing configurations.

Depending on the type of customer, there are three main scenarios that are explained in detail in this guide.

### Overview of the Three Scenarios

#### 1️⃣ **New Customers**

When a new customer registers with Time Cockpit, all features, including Default Permissions, are enabled by default. This gives all users direct access to all functions without additional configuration.

#### 2️⃣ **Existing Customers without Permissions**

Existing customers who have not previously configured specific permissions must decide whether to use the new permissions. To make this decision, it is recommended to carefully read the article [Default Permissions](~/doc/employee-time-tracking/default-permissions.md). It is important to understand the impact of the different roles and to assign them to the respective users accordingly. After assigning the roles, an email to `support@timecockpit.com` is required to activate the feature.

#### 3️⃣ **Existing Customers with Many Custom Permissions**

Customers with many custom adjustments in the permissions area should carefully review where Default Permissions might be helpful. In these cases, however, we recommend not activating the Default Permission feature directly but rather reviewing the existing permissions carefully.

### Important Changes Due to Default Permissions

Before the rollout of Default Permissions, all users could create, edit, or delete records in **`GlobalSettings`**, **`ImportDefinition`**, and **`TemplateQuery`**. This is now only possible for employees with the **`BasedataAdmin`** role. Therefore, it is important to assign this role to the appropriate users.

### Changes to the Admin Role

As part of the introduction of Default Permissions, the classic admin role was renamed to a specialized role called **Customization Admin**. This role can still adjust the data model, enable and disable permissions, but no longer manage all aspects of the system. A Customization Admin can still impersonate, allowing them to make themselves `AccountAdmin` to add or lock users.

This change fixes a historical inconsistency: Previously, an administrator who could make data model adjustments could also manage all other aspects of the system. This is now more clearly separated.

### Ensuring Previous Rights for Existing Customers

To ensure that existing customers have the same rights as before after the introduction of Default Permissions, all classic administrators are automatically assigned all relevant roles (`AccountAdmin`, `BillingAdmin`, `HumanResourcesAdmin`, etc.).

### Replacement of the `IsTenantAdmin` Flag

The previous flag `IsTenantAdmin` has been replaced with the role `AccountAdmin`. This new role has the same rights as before, specifically the management of users and billing data.

### Best Practices and Recommendations

1. Review which roles are required for which users.
2. Assign the appropriate roles in Time Cockpit.
3. Contact `support@timecockpit.com` to activate the feature.
4. Thoroughly test the new permissions before using them in production.