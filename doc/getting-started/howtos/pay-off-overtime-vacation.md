---
title: Pay Off Overtime & Vacation - How To Guide
description: Learn how to pay off overtime and vacation in time cockpit. Use overtime corrections and vacation entitlements to manage employee payouts.
keywords: [overtime correction, overtime balance, effective date, start of day, end of day, termination]
---
# Pay Off Overtime/Vacation

## How to Pay Off Overtime
To pay off overtime, insert a new overtime correction. When you insert a new overtime correction, fill in the following fields:

| Field          | Description                                                         |
| -------------- | ------------------------------------------------------------------- |
| User           | the employee whose overtime is paid out                                  |
| Effective Date | the date from which the overtime correction applies (beginning of the day) |
| Overtime       | the desired overtime balance as of the effective date                    |

> [!IMPORTANT]
> The **Effective Date** applies from the beginning of the specified day. To correct the overtime balance at the end of a day, use the following calendar day as the **Effective Date**.

### Example: Pay off overtime at the end of a month
Tim Smith has 44 hours of overtime at the end of April 2017 and wants to be paid for 24 hours. Create an overtime correction with an **Effective Date** of 2017-05-01 and an **Overtime** value of 20 hours (44 - 24).

### Example: Set the balance to zero on the last employment day
If an employee leaves on July 15 and the overtime balance should be zero at the end of that day, create the correction with an **Effective Date** of July 16 and an **Overtime** value of 0 hours. The correction applies from 00:00 on July 16 and therefore sets the balance at the end of July 15 to 0 hours.


## How to Pay Off Vacation
To pay off vacation, insert a negative vacation entitlement. When you insert a new vacation entitlement, fill in the following fields:

| Field               | Description                                                          |
| ------------------- | -------------------------------------------------------------------- |
| User                | the employee whose vacation is paid out                               |
| Date of Entitlement | the desired date for the vacation entitlement                        |
| Number of Weeks     | the number of weeks to pay out                                        |

### Example
Tim Smith has 2 weeks of vacation at the end of June 2017 and wants to be paid for these 2 weeks because his employment ends in June 2017. In this case, create a vacation entitlement with a **Number of Weeks** value of -2 and a **Date of Entitlement** of 2017-06-30.

