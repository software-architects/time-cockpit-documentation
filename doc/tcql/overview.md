---
uid: tcql
name: TCQL
title: TCQL - Query Language Guide
description: Learn time cockpit's query language (TCQL) similar to LINQ. Query data, use aggregation functions, sub-queries, and integrate with IronPython scripts and .NET applications.
---

# Time Cockpit Query Language (TCQL)

For querying purposes time cockpit offers a query language (time cockpit query language (TCQL)). The grammar of TCQL is very similar to [LINQ in Visual Basic](http://msdn.microsoft.com/en-us/library/bb385100.aspx). However, there are some differences that reflect the domain-specific logic of time cockpit or technical restrictions. In this chapter the basic structure of TCQL is described.

## The Basics of TCQL

Every TCQL statement has the following structure:

```
<statement> ::=
  <fromClause> 
  [<whereClause>] 
  [<orderByClause>] 
  <selectClause>
```

The `fromClause` defines the source of the query. The whereClause can be used to add conditions that the data from the source has to fulfill in order to be included in the query's result. orderByClause is used to sort the result. The selectClause defines the structure of the query result.

> [!NOTE]
Keywords in TCQL are case sensitive. Therefore you have to write From, you cannot write from. Additionally identifiers have to start with a capital letter. Therefore you cannot write From p In Project.... Instead you have to write From P In Project... . This behavior may change in future versions of time cockpit so that TCQL may be case insensitive in the future.

Here are some simple examples for TCQL queries:

```
// Return all Project entities                                        
From P In Project Select P

// Return all billable timesheet entities
From T In Timesheet Where T.Billable=True Select T

// Look for two project entities
From P In Project Where P.ProjectName="ProjectName9" Or P.ProjectName="ProjectName8" Select P

// Return all projects that have a specified number of hours
From P In Project Where P.NumberOfHours=(6 + 4)*4 Select P

// Return all projects that start on a specified date
From P In Project Where P.StartDate=#2010-01-01# Select P

// Return all projects for which number of hours is set
From P In Project Where P.NumberOfHours <> Null Select P
```

In TCQL you do not have to worry about joining tables. The relations that are defined in time cockpit's data model are automatically available in TCQL:

```
// Return all projects of a certain customer
From P In Project Where P.Customer = "ABC" Select P
```

As mentioned before you can use the `orderByClause` to sort the result of TCQL queries:

```
From P In Project
Order By P.ProjectName
Select P
```

> [!WARNING]
time cockpit does not support sorting by aggregated values when querying the local data store.

TCQL supports a number of functions that you can use inside expressions. Functions always start with a colon followed by the function name. Parameters are separated with commas.

```
// Use :Iif in where clause
From P In Project 
Where :Iif(P.ProjectName="Software Architects' time cockpit", "Hello World", "Nevermind") = "Hello World" 
Select P

// Find all projects whose name starts with "ti"
From P In Project 
Where :Substring(P.ProjectName, 1, 2) = "ti" 
Select P
```

You can change the structure of the query result using the `selectClause`. On the one hand you can generate a new anonymous entity on the fly or generate instances of entity types that already exist in time cockpit's data model:

```
// Generate an anonymous entity
From T In Timesheet 
Select New With {
  .BeginTime = T.BeginTime,
  .Duration = T.EndTime - T.BeginTime,
  T.Description,
  .Project = T.Project,
  T.Project.CustomerRelation
}

// Generate Project entities
From P In Project
Select New Project With {
  .CustomerRelation = P.CustomerRelation
}
```

TCQL supports the use of aggregation functions.

> [!NOTE]
TCQL does not have a group by clause. The system generates grouping expressions for all expressions that are not used within an aggregation functions.

```
From T In Timesheet 
Where T.BeginTime >= #2009-04-30 08:00:00# And T.BeginTime <= #2009-04-30 12:00:00#
Select New With { 
  .ProjectName = T.Project.ProjectName,
  T.Project.StartDate,
  .TotalHours = Sum(T.DurationInHours) 
}
```

## Sub-Queries

TCQL supports the use of sub-queries in the `select` and the `where`-clause. You can reference entities using the relations' back reference names.

The following example shows the use of a sub-query in the `select`-clause:

```
From P In Project
Order By P.ProjectName
Select New With {
        P.ProjectName,
        .TotalHours = ( From T In P.Timesheets Select New With { .TotalHours = Sum(T.DurationInHours) } )
}
```

Find more information about [sub-queries](expression-language.md#sub-queries).

## Using TCQL

You can use TCQL statements in different ways:

- Execute TCQL queries in time cockpit's script console.
- Use TCQL queries in IronPython scripts. You can execute such script in the IronPython environment or in time cockpit's script console.
- Use TCQL queries in .NET applications (e.g. from C#). You will need time cockpit's SDK to connect to the application's database.