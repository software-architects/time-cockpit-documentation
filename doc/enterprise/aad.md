# Using Azure Active Directory (AAD) for Federated Authentication in Time Cockpit

Time cockpit allows you to enhance security and streamline authentication by integrating with Azure Active Directory (AAD). This guide explains how to configure AAD authentication for your time cockpit account and highlights its benefits.

## Prerequisites

Before you begin, ensure you have the following:

- A time cockpit account.
- An Azure Active Directory account.

## Benefits of Using AAD Authentication

Integrating AAD authentication with time cockpit offers several advantages:

- **Enhanced Security**: AAD provides robust security features, including Multi-Factor Authentication (MFA) and security defaults, to safeguard your time cockpit account.
- **Single Sign-On (SSO)**: Users can access time cockpit using their AAD credentials, simplifying login and reducing password fatigue.
- **User Management**: Simplify user provisioning and deprovisioning by syncing your AAD users with time cockpit (requires custom user provisioning).
- **Centralized Control**: Administer user access and permissions from your Azure portal, ensuring consistency across your organization.

## Configuring Time Cockpit for Azure Active Directory (AAD) Authentication

1. **Retrieve Your AAD Directory ID (Tenant ID):**
   - Log in to your Azure Active Directory (AAD) account.
   - Obtain the directory ID (also known as Tenant ID) associated with your AAD.

2. **Contact Time Cockpit Support:**
   - Send an email to support@timecockpit.com to request AAD authentication setup for your time cockpit account.

With this approach, you will still need to add users to your time cockpit account using the account management features within time cockpit. 

When logging in, time cockpit will attempt to match the email addresses you've provided with users in your Azure Active Directory. Your employees will no longer need a separate time cockpit password; instead, they can use their Azure Active Directory credentials and authentication methods to log in to time cockpit. If you deactivate a user in Azure Active Directory, that user won't be able to access time cockpit anymore.

## Configuring Custom Claim Matching in Time Cockpit with Azure Active Directory (AAD)

Time cockpit can also be configured to match not the email address, but a custom claim in your AAD. This can be, for example, the internal object ID of AAD or any other claim that you manage in your AAD. 

Please keep in mind that if you opt for this approach, you need to implement automatic user provisioning with your management API. That means that you need to write some custom code that is used to automatically create users in the Time Cockpit account. When adding a user, the custom job also needs to set the custom claim that should be used for user matching.

If you need help implementig automatic user provisioning, then drop us a mail at support@timecockpit.com

## Enabling Security Defaults and MFA

Azure Active Directory offers robust security options. You can enable "Security Defaults" to help protect your time cockpit account. Additionally, enabling "Multi-Factor Authentication (MFA)" adds an extra layer of security.

To enable "Security Defaults" and "MFA," refer to the following Azure documentation:

- [Azure AD Security Defaults](https://docs.microsoft.com/en-us/azure/active-directory/fundamentals/concept-fundamentals-security-defaults)
- [Azure AD Multi-Factor Authentication](https://docs.microsoft.com/en-us/azure/active-directory/authentication/concept-mfa-howitworks)

By following the steps above and taking advantage of Azure Active Directory's security features, you can enhance authentication security for your time cockpit account.

For additional assistance or troubleshooting, please refer to the [time cockpit Support](https://www.timecockpit.com/en/support) resources.
