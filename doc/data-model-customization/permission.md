# Permissions

> [!WARNING]
This chapter is under construction. 

Time cockpit has a fully configurable and extensible permission management system. In the standard configuration of time cockpit, the permission management system is based on assigning roles to users. 

Time cockpit is delivered with two predefined roles, ```Admin``` and ```User```. Based on these two roles, permissions are defined in the time cockpit default configuration. All users are assigned to the ```User``` role when they are created via the website (www.timecockpit.com). Depending on whether a user was given the ```Admin``` role during the creation on the website, a user is also assigned the ```Admin``` role in time cockpit. Administrators have the right to use the customization module in time cockpit, edit the data model, issue queries, and to run IronPython scripts. Administrators may also create roles and assign roles to other users.

## Entities for Permission Management

In the standard data model of time cockpit, the role concept is implemented with three entities. ```APP_UserDetail``` contains the information about a user. ```APP_UserRole``` contains the various roles supported by time cockpit (in standard ```Admin``` and ```User```). ```APP_UserDetailRole``` contains the assignment of a user to different roles. Time cockpit allows a user to be assigned to multiple roles.

> [!WARNING]
It is not recommended to set restrictive permissions on the entity ```APP_UserDetail```. It must be possible for the application to store its own user entry at any time. This is because the user's language is stored in the user entry. A user can change his / her language and must always be able to store his / her own user entry. Incorrect permissions can cause time cockpit to stop working. If you are not sure about permissions on the ```APP_UserDetail``` entity, contact support@timecockpit.com. In terms of permissions we recommend **KISS** - Keep it small and simple
