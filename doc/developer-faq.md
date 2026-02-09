---
title: Developer FAQ - Common Questions
description: Frequently asked questions for developers working with time cockpit's data model, Web API, and automation features.
---

# Developer FAQ

This page answers common questions for developers working with time cockpit, including data model customization, Web API integration, and workflow automation.

> [!NOTE]
> Code samples in this FAQ have been verified against the time cockpit data model (model-prod.2026-02-09). Entity names, properties, and relationships are accurate as of this date. Always test code samples in a development environment before deploying to production.

## Project Management & Budgeting

### How can I track my budget for a project?

Time cockpit provides built-in **Budgetary Control** lists that calculate real-time project profitability by combining timesheet and invoice data.

**Access the lists:**
- [Management → Billing → Budgetary Control of Projects](https://web.timecockpit.com/app/lists/APP_BudgetaryControlOfProjectsList)
- [Management → Billing → Budgetary Control of Tasks](https://web.timecockpit.com/app/lists/APP_BudgetaryControlOfTasksList)

**Key metrics tracked:**
- **Budget vs. Actual Hours**: Compare planned hours (`BudgetInHours`) with logged hours
- **Billable Hours**: Hours marked as billable with hourly rate > 0
- **Revenue**: Calculated from timesheets (hours × rate)
- **Unbilled Revenue**: Revenue from timesheets not yet invoiced
- **Effective Hourly Rate**: Actual revenue per hour worked
- **Billed Hours from Invoices**: Cross-reference with actual invoices

**Example TCQL Query - Get project budget status:**
```tcql
From T In APP_Timesheet
Where T.APP_Project.APP_ProjectUuid = @ProjectId
Group By T.APP_Project
Select New With {
  .Project = T.APP_Project,
  .BudgetHours = T.APP_Project.APP_BudgetInHours,
  .ActualHours = Sum(T.APP_DurationInHours),
  .BillableHours = Sum(:Iif(T.APP_Billable = True And T.APP_HourlyRateActual > 0, T.APP_DurationInHours, 0)),
  .Revenue = Sum(T.APP_Revenue),
  .UnbilledRevenue = Sum(:Iif(T.APP_Billed = False And T.APP_Billable = True, T.APP_Revenue, 0)),
  .PercentComplete = Sum(T.APP_DurationInHours) / T.APP_Project.APP_BudgetInHours * 100
}
```

**See Also:**
- [Budgetary Control Explained](use-cases/budgetary-control.md) - Deep dive into calculations
- [APP_Project Entity Reference](data-model/standard-entities.md#app_project)
- [APP_Timesheet Entity Reference](data-model/standard-entities.md#app_timesheet)

---

## Time & Attendance

### How can I add default working time for employees?

Configure employee working hours using the **APP_WeeklyHoursOfWork** entity with effective dates.

**Setting up weekly hours:**

1. **Via Web UI:**
   - Navigate to employee's form (Management → Master Data → Users)
   - Go to "Weekly Hours of Work" tab
   - Add new entry with effective date and hours per weekday

2. **Via Script:**
```python
# Set 40-hour work week (Monday-Friday, 8 hours each) for all users
model = Context.Model
users = Context.Select("From U In APP_UserDetail Where U.APP_IsHidden = False Select U")

for user in users:
    weeklyHours = model.Entities.APP_WeeklyHoursOfWork.CreateEntityObject()
    weeklyHours.APP_UserDetail = user
    weeklyHours.APP_EffectiveDate = DateTime(2026, 1, 1)
    weeklyHours.APP_MondayHours = 8.0
    weeklyHours.APP_TuesdayHours = 8.0
    weeklyHours.APP_WednesdayHours = 8.0
    weeklyHours.APP_ThursdayHours = 8.0
    weeklyHours.APP_FridayHours = 8.0
    weeklyHours.APP_SaturdayHours = 0.0
    weeklyHours.APP_SundayHours = 0.0
    Context.SaveObject(weeklyHours)
```

3. **Via Web API:**
```http
POST https://api.timecockpit.com/odata/APP_WeeklyHoursOfWork
Content-Type: application/json
Authorization: Bearer {your_token}

{
  "APP_EffectiveDate": "2026-01-01T00:00:00Z",
  "APP_MondayHours": 8.0,
  "APP_TuesdayHours": 8.0,
  "APP_WednesdayHours": 8.0,
  "APP_ThursdayHours": 8.0,
  "APP_FridayHours": 8.0,
  "APP_SaturdayHours": 0.0,
  "APP_SundayHours": 0.0,
  "APP_UserDetail@odata.bind": "APP_UserDetail(guid'{user-id}')"
}
```

**TCQL Function:**
Use `:GetWeeklyHoursOfWork(UserDetail, Date)` to retrieve hours for calculation:
```tcql
:GetWeeklyHoursOfWork(Current.APP_UserDetail, :Today())
```

**See Also:**
- [Working Time Management](employee-time-tracking/working-time.md)
- [APP_WeeklyHoursOfWork Entity](data-model/standard-entities.md#app_weeklyhoursofwork)

---

### How can I track working time violations (overtime, missing breaks)?

Time cockpit calculates working time violations based on **APP_WorkingTimeLimit** configurations.

**Setup Working Time Limits:**

The `APP_WorkingTimeLimit` entity defines legal/company regulations:
- Maximum daily working hours
- Minimum break times
- Weekly hour limits
- Rest period requirements

**Example: Create a working time limit rule**
```python
limit = Context.Model.Entities.APP_WorkingTimeLimit.CreateEntityObject()
limit.APP_UserDetail = myUser
limit.APP_EffectiveDate = DateTime(2026, 1, 1)
limit.APP_MaxDailyWorkingTime = 10.0  # Max 10 hours per day
limit.APP_MinDailyBreakTime = 0.5     # Min 30 minutes break
limit.APP_MaxWeeklyWorkingTime = 48.0 # Max 48 hours per week
Context.SaveObject(limit)
```

**View violations:**
Navigate to: [Management → Time Tracking → Working Time Violations](https://web.timecockpit.com/app/lists/APP_DefaultWorkingTimeViolationList)

**TCQL Functions for Working Time:**
```tcql
-- Get total work time for a day (excluding breaks)
:GetWorkTime(UserDetail, Date)

-- Get break time for a day
:GetBreakTime(UserDetail, Date)

-- Check if day violates limits
:GetWorkingTimeViolation(UserDetail, Date)
```

**Example Query - Find users with overtime this week:**
```tcql
From U In APP_UserDetail
Where :GetWorkTime(U, :Today()) > :GetWeeklyHoursOfWork(U, :Today())
Select New With {
  .User = U,
  .WorkTime = :GetWorkTime(U, :Today()),
  .PlannedTime = :GetWeeklyHoursOfWork(U, :Today()),
  .Overtime = :GetWorkTime(U, :Today()) - :GetWeeklyHoursOfWork(U, :Today())
}
```

**See Also:**
- [Working Time Regulations](employee-time-tracking/working-time-regulations.md)
- [TCQL Functions for Working Time](tcql/functions-for-working-time-and-holidays.md)

---

## Integration & Automation

### How can I integrate with JIRA or other external systems?

Time cockpit supports integration through **Signal Tracking** and the **Web API**.

**Approach 1: Signal Tracking (for Work Item Systems)**

Time cockpit can track work item changes from external systems:
- `APP_WorkItemChangeSignal` entity stores work item events
- Signal trackers sync data from TFS, Azure DevOps, or custom systems

**Example: Query work item signals**
```tcql
From W In APP_WorkItemChangeSignal
Where W.APP_EventTime >= :AddDays(:Today(), -7)
Order By W.APP_EventTime Desc
Select W
```

**Approach 2: Web API Integration**

**Example: Create timesheet from JIRA webhook**
```javascript
// Node.js example - JIRA webhook → time cockpit
const axios = require('axios');

async function createTimesheetFromJira(jiraIssue, worklog) {
  const timesheet = {
    APP_BeginTime: worklog.started,
    APP_EndTime: new Date(new Date(worklog.started).getTime() + worklog.timeSpentSeconds * 1000),
    APP_Description: `${jiraIssue.key}: ${jiraIssue.fields.summary}`,
    "APP_Project@odata.bind": `APP_Project(guid'${projectId}')`,
    "APP_UserDetail@odata.bind": `APP_UserDetail(guid'${userId}')`
  };
  
  await axios.post('https://api.timecockpit.com/odata/APP_Timesheet', timesheet, {
    headers: {
      'Authorization': `Bearer ${token}`,
      'Content-Type': 'application/json'
    }
  });
}
```

**Approach 3: Sync External Tasks to APP_Task**
```python
# Python script to sync JIRA issues to time cockpit tasks
import requests

def sync_jira_to_timecockpit(jira_api, tc_api):
    # Get JIRA issues
    issues = jira_api.get('/search?jql=project=MYPROJ')
    
    for issue in issues['issues']:
        # Create or update task in time cockpit
        task = {
            'APP_Code': issue['key'],
            'APP_TaskName': issue['fields']['summary'],
            'APP_Description': issue['fields']['description'],
            'APP_Project@odata.bind': f"APP_Project(guid'{project_guid}')"
        }
        
        tc_api.post('/odata/APP_Task', json=task)
```

**See Also:**
- [Web API Overview](web-api/overview.md)
- [Signal Tracker Documentation](signal-tracker/overview.md)
- [Data Import](data-exchange/import.md)

---

### How can I automate my workflow?

Time cockpit offers three automation approaches:

#### 1. Triggers (Server-Side Automation)

Execute Python code automatically when entities are saved. Perfect for approval workflows, notifications, and data validation.

**Example: Auto-approve vacation for senior employees**
```python
# Trigger on APP_Vacation - Insert Before Save
def autoApproveVacationTrigger(actionContext):
    dc = actionContext.DataContext
    
    for vacation in actionContext.InputSet:
        # Get user details
        user = vacation.APP_UserDetail
        
        # Auto-approve if user is senior (example: has SeniorEmployee role)
        hasRole = dc.SelectSingle(
            "From UR In APP_UserDetailRole " +
            "Where UR.APP_UserDetail.APP_UserDetailUuid = @UserId " +
            "And UR.APP_UserRole.APP_Code = 'SeniorEmployee' Select UR",
            { "@UserId": user.APP_UserDetailUuid })
        
        if hasRole is not None:
            vacation.APP_ApprovedTimestampUtc = DateTime.UtcNow
            vacation.APP_Approver = user
```

**See Also:** [Triggers Guide](scripting/triggers.md)

#### 2. Actions (User-Initiated Automation)

Custom business logic triggered by users from lists or forms.

**Example: Bulk invoice creation from timesheets**
```python
# Action: Create invoices for selected projects
def createInvoicesAction(actionContext):
    dc = actionContext.DataContext
    
    for project in actionContext.InputSet:
        # Get unbilled timesheets
        timesheets = dc.Select(
            "From T In APP_Timesheet " +
            "Where T.APP_Project.APP_ProjectUuid = @ProjectId " +
            "And T.APP_Billed = False And T.APP_Billable = True " +
            "Select T",
            { "@ProjectId": project.APP_ProjectUuid })
        
        if timesheets.Count > 0:
            # Create invoice
            invoice = dc.Model.Entities.APP_Invoice.CreateEntityObject()
            invoice.APP_Project = project
            invoice.APP_InvoiceDate = DateTime.Today
            dc.SaveObject(invoice)
            
            # Assign timesheets to invoice
            for ts in timesheets:
                ts.APP_Invoice = invoice
                ts.APP_HourlyRateBilled = ts.APP_HourlyRateActual
                dc.SaveObject(ts)
```

**See Also:** [Actions Guide](scripting/actions.md)

#### 3. Web API + External Scripts

Schedule external scripts (PowerShell, Python, Node.js) to automate via API.

**Example: PowerShell - Daily report of unbilled hours**
```powershell
# Run daily via Task Scheduler
$token = "your_pat_token"
$headers = @{ Authorization = "Bearer $token" }

# Query unbilled hours
$query = @"
From T In APP_Timesheet
Where T.APP_Billed = False And T.APP_Billable = True
Group By T.APP_Project
Select New With {
  .ProjectName = :DisplayValue(T.APP_Project),
  .UnbilledHours = Sum(T.APP_DurationInHours),
  .UnbilledRevenue = Sum(T.APP_Revenue)
}
"@

$result = Invoke-RestMethod `
    -Uri "https://api.timecockpit.com/query" `
    -Method POST `
    -Headers $headers `
    -Body (@{ query = $query } | ConvertTo-Json) `
    -ContentType "application/json"

# Send email report
Send-MailMessage -To "manager@company.com" `
    -Subject "Unbilled Hours Report" `
    -Body ($result | ConvertTo-Html) `
    -BodyAsHtml
```

**See Also:**
- [Web API Authentication](web-api/authentication.md)
- [Automating Scripts](scripting/automating-scripts.md)

---

## Data Model & Queries

### How do I calculate overtime or vacation balance?

Use built-in TCQL functions and entities designed for time calculations.

**Calculate Overtime:**
```tcql
From U In APP_UserDetail
Select New With {
  .User = U,
  .PlannedHours = :GetWeeklyHoursOfWork(U, :Today()),
  .ActualHours = :GetWorkTime(U, :Today()),
  .Overtime = :GetWorkTime(U, :Today()) - :GetWeeklyHoursOfWork(U, :Today())
}
```

**Calculate Vacation Balance:**
```tcql
From U In APP_UserDetail
Select New With {
  .User = U,
  .Entitlement = (From E In U.VacationEntitlements 
                  Where E.APP_Year = :Year(:Today()) 
                  Select New With { .Days = Sum(E.APP_Days) }),
  .Taken = (From V In U.Vacations 
            Where :Year(V.APP_BeginTime) = :Year(:Today()) 
            And V.APP_IsApproved = True
            Select New With { .Days = Sum(V.APP_DurationInHours / 8.0) }),
  .Remaining = .Entitlement - .Taken
}
```

**Access pre-built lists:**
- [Overtime per Effective Date](https://web.timecockpit.com/app/lists/APP_OvertimePerEffectiveDateList)
- [Vacation per Effective Date](https://web.timecockpit.com/app/lists/APP_VacationPerEffectiveDateList)

**See Also:**
- [Absence Time Management](employee-time-tracking/absence-time-management.md)
- [TCQL Functions](tcql/functions-for-working-time-and-holidays.md)

---

### How do I restrict data access by department?

Use **Row-Level Security** with Named Sets and department-based permissions.

**Example: Department leads see only their department**

**Step 1: Create Named Set** (if not exists - `APP_MyDepartmentsAsLead` is built-in)
```tcql
From DL In APP_DepartmentLead
Where DL.APP_UserDetail.APP_UserDetailUuid = Environment.CurrentUser.UserDetailUuid
Select New With { DL.APP_Department.APP_DepartmentUuid }
```

**Step 2: Add Read Permission to Entity**
```tcql
:Iif(
  'HumanResourcesAdmin' In Set('CurrentUserRoles') Or
  ('DepartmentLead' In Set('CurrentUserRoles') And 
   Current.APP_UserDetail.APP_Department In Set('APP_MyDepartmentsAsLead')),
  True,
  :Iif(Current.APP_UserDetail.APP_UserDetailUuid = Environment.CurrentUser.UserDetailUuid, 
       True, 
       False)
) = True
```

This pattern:
- HR Admins see all
- Department Leads see their departments
- Users see only their own data

**See Also:**
- [Permissions Guide](security/permissions-guide.md)
- [Named Sets](security/named-sets.md)

---

### How do I create custom approval workflows?

Implement approval workflows using **Triggers** and **Notifications**.

**Standard Approval Pattern (used by Vacation/SickLeave):**

**1. Add Approval Fields to Entity:**
- `APP_ApprovedTimestampUtc` (DateTime)
- `APP_Approver` (Relation to APP_UserDetail)
- `APP_IsApproved` (Calculated: `Current.APP_ApprovedTimestampUtc <> Null`)

**2. Create Insert Before Save Trigger** (auto-approve if not required):
```python
def insertBeforeSave(actionContext):
    dc = actionContext.DataContext
    
    for item in actionContext.InputSet:
        user = item.APP_UserDetail
        
        # Auto-approve if approval not required
        if user.APP_IsAbsenceApprovalRequired != True:
            item.APP_ApprovedTimestampUtc = DateTime.UtcNow
            item.APP_Approver = user
```

**3. Create Insert/Update After Save Trigger** (send notifications):
```python
def insertUpdateAfterSave(actionContext):
    dc = actionContext.DataContext
    notificationManager = NotificationManager(dc)
    
    for item in actionContext.InputSet:
        # Check if newly created and not approved
        inserted = Enumerable.FirstOrDefault(actionContext.Inserted, 
                                            lambda i: i.ObjectUuid == item.ObjectUuid)
        isNewUnapproved = inserted is not None and not item.APP_IsApproved
        
        if isNewUnapproved:
            # Notify department leads
            leads = dc.Select(
                "From DL In APP_DepartmentLead " +
                "Where DL.APP_Department = @DeptId " +
                "And DL.APP_ReceiveNotificationsForAbsenceApproval = True",
                { "@DeptId": item.APP_UserDetail.APP_Department.APP_DepartmentUuid })
            
            for lead in leads:
                notification = notificationManager.NewNotification()
                notification.UserDetail = lead.APP_UserDetail
                notification.NotificationContent = buildNotificationContent(item)
                notificationManager.CreateNotificationWithoutPermissionCheck(notification)
```

**4. Create Approve Action:**
```python
def approveAction(actionContext):
    dc = actionContext.DataContext
    
    for item in actionContext.InputSet:
        # Check permissions (dept lead or HR admin)
        if hasApprovalPermission(dc.Environment.CurrentUser, item):
            item.APP_ApprovedTimestampUtc = DateTime.UtcNow
            item.APP_Approver = dc.Environment.CurrentUser
            dc.SaveObject(item)
```

**See Also:**
- Full example in: [APP_Vacation Triggers](scripting/triggers-guide.md#vacation-approval-workflow)
- [Notifications API](scripting/notifications.md)

---

### How do I build custom aggregation reports?

Create custom **List Views** with Python scripts for complex calculations.

**Example: Project profitability report**

See the built-in `APP_BudgetaryControlOfProjectsList` as a template. Key patterns:

1. **Define Result Entity Structure:**
```python
def getResultModelEntity(context):
    entity = ModelEntity({ "Name": "Result" })
    entity.Properties.Add(TextProperty({ "Name": "ProjectName" }))
    entity.Properties.Add(NumericProperty({ "Name": "Revenue" }))
    entity.Properties.Add(NumericProperty({ "Name": "Costs" }))
    entity.Properties.Add(NumericProperty({ "Name": "Profit" }))
    return entity
```

2. **Query Data (combine multiple sources):**
```python
def getItems(context, queryParameters):
    dc = context
    
    # Query timesheets
    timesheets = dc.SelectWithParams({
        "Query": "From T In APP_Timesheet Where ... Select ...",
        "QueryParameters": queryParameters
    })
    
    # Query invoices
    invoices = dc.SelectWithParams({
        "Query": "From I In APP_Invoice Where ... Select ...",
        "QueryParameters": queryParameters
    })
    
    # Combine and calculate
    result = []
    for t in timesheets:
        entry = resultEntity.CreateEntityObject()
        entry.Revenue = t.Revenue
        entry.Costs = t.Costs
        entry.Profit = t.Revenue - t.Costs
        result.Add(entry)
    
    return result
```

**See Also:**
- [Budgetary Control Implementation](use-cases/budgetary-control.md)
- [Custom Lists Guide](data-model-customization/list.md)

---

### How do I export data via API?

Use the **Query** or **OData** endpoints to extract data.

**Option 1: Query Endpoint (TCQL)**
```bash
curl -X POST https://api.timecockpit.com/query \
  -H "Authorization: Bearer YOUR_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "query": "From T In APP_Timesheet Where T.APP_BeginTime >= #2026-01-01# Select T"
  }'
```

**Option 2: OData Endpoint**
```bash
# Get all timesheets from January 2026
curl -X GET "https://api.timecockpit.com/odata/APP_Timesheet?\$filter=APP_BeginTime ge 2026-01-01&\$expand=APP_Project,APP_UserDetail" \
  -H "Authorization: Bearer YOUR_TOKEN"
```

**Option 3: PowerShell Script**
```powershell
$token = "YOUR_TOKEN"
$headers = @{ Authorization = "Bearer $token" }

$timesheets = Invoke-RestMethod `
    -Uri "https://api.timecockpit.com/odata/APP_Timesheet?`$filter=APP_BeginTime ge 2026-01-01" `
    -Headers $headers

$timesheets.value | Export-Csv -Path "timesheets.csv" -NoTypeInformation
```

**See Also:**
- [Web API Overview](web-api/overview.md)
- [OData Endpoint](web-api/odata.md)
- [Query Endpoint](web-api/query.md)

---

## Need More Help?

- **User FAQs**: Looking for end-user questions? See [User FAQ](user-faq.md) and role-specific FAQs ([Project Manager](project-manager-faq.md), [HR Admin](hr-administrator-faq.md), [Department Lead](department-lead-faq.md), [Billing Admin](billing-admin-faq.md), [Employee](employee-faq.md))
- **Community**: [Time Cockpit Community (if available)]
- **API Reference**: [Web API Documentation](web-api/overview.md)
