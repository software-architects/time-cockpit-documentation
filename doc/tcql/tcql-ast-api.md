---
title: TCQL AST API - Programmatic Query Creation
description: Create TCQL queries programmatically in time cockpit using the Abstract Syntax Tree API. Build queries with code instead of strings.
---
# Programmatically Create TCQL Queries With TCQL AST API

With Version 1.10 time cockpit introduced an API for constructing Abstract Syntax Trees (AST) for [TCQL](xref:tcql) queries. The AST API can be used to create all queries that could be written using the TCQL grammar. All of the classes representing the Nodes in a TCQL AST can be found in the <xref:TimeCockpit.Data.QueryLanguage.Syntax> namespace. The main entry point for producing TCQL AST nodes is the <xref:TimeCockpit.Data.QueryLanguage.Syntax.TCQLExpression> class holding static functions taking parameters for the nodes. The samples used in this document are designed against the time cockpit standard data model.

## Parts of a Query

Semantically, a query consists of five parts:

- <xref:TimeCockpit.Data.QueryLanguage.Syntax.QuerySource>
- [Where](xref:TimeCockpit.Data.QueryLanguage.Syntax.Expression) condition (optional)
- [Order By](order-by-clause.md) clause (optional)
- [Select](select-clause.md) clause
- <xref:TimeCockpit.Data.QueryLanguage.Syntax.QueryOptions> (optional)

The query source describes the pool of entity objects that is queried and can either be a <xref:TimeCockpit.Data.QueryLanguage.Syntax.EntitySource>, a <xref:TimeCockpit.Data.QueryLanguage.Syntax.BackReferenceSource> (for sub-selects) or a <xref:TimeCockpit.Data.QueryLanguage.Syntax.DeadOfSource> (used internally for sync, may be deprecated later).

The optional where condition describes a filter expression that indicates whether a specific entity should be part of the result set or not. The <xref:TimeCockpit.Data.QueryLanguage.Syntax.Expression> is a base class for all expression with its main representative being <xref:TimeCockpit.Data.QueryLanguage.Syntax.BinaryExpression>.

> [!NOTE]
Note that while an <xref:TimeCockpit.Data.QueryLanguage.Syntax.Expression> can have any result type, semantically it is necessary for an expression to produce a boolean result. The result of a query using a where condition with a result type other than boolean is undefined.

The order by clause describes the ordering of the query result and is described by an instance of the <xref:TimeCockpit.Data.QueryLanguage.Syntax.OrderBy> class node. An <xref:TimeCockpit.Data.QueryLanguage.Syntax.OrderBy> node consists of one or more <xref:TimeCockpit.Data.QueryLanguage.Syntax.OrderByExpression>s, with every expression holding a reference to an <xref:TimeCockpit.Data.QueryLanguage.Syntax.Expression> and a sort order (<xref:TimeCockpit.Data.QueryLanguage.Syntax.SortDirection>).

The select clause describes the structure of the returned items and optional limitations. The most basic representation of a select clause is the <xref:TimeCockpit.Data.QueryLanguage.Syntax.SelectAlias> node type, representing selection of the entity as defined in an alias. In the following statement, the `Select P` part is described by such a <xref:TimeCockpit.Data.QueryLanguage.Syntax.SelectAlias> node with an alias value of `P`.

```
From P In Project Select P
```

## Basic Examples

The most basic query is a query selecting all entities of a given entity such as:

```
From P In Project Select P
```

The TCQL AST equivalent can be created in C# code using the following code snippet:

```
var q = TCQLExpression.Query(TCQLExpression.From("Project"));
```

In the example above, a query is created passing only a <xref:TimeCockpit.Data.QueryLanguage.Syntax.QuerySource>, created using the [From()](xref:TimeCockpit.Data.QueryLanguage.Syntax.TCQLExpression#TimeCockpit_Data_QueryLanguage_Syntax_TCQLExpression_From_System_String_TimeCockpit_Data_QueryLanguage_Syntax_EntitySourceInclude___) method.

> [!NOTE]
Note that no alias was given. If the alias is redundant because only a single query is involved, it can be omitted by setting it to null (the default value). If the alias is null, it is automatically derived from the query source of the parenting query by choosing the first letter of the entity or back reference being selected. If the alias is already taken by a parenting query an incrementing number is appended.

In order to filter the projects returned, a where condition can be added, such as in the following TCQL statement:

```
From P In Project Where P.Code = 'time cockpit' Select P
```

```
var q = TCQLExpression.Query("Project",
            TCQLExpression.MakeBinary(
                BinaryOperator.Equals,
                TCQLExpression.Property("Code"),
                TCQLExpression.Constant("time cockpit")));
```

In this example, a binary expression is constructed using the [MakeBinary()](xref:TimeCockpit.Data.QueryLanguage.Syntax.TCQLExpression#TimeCockpit_Data_QueryLanguage_Syntax_TCQLExpression_MakeBinary_TimeCockpit_Data_QueryLanguage_Syntax_BinaryOperator_TimeCockpit_Data_QueryLanguage_Syntax_Expression_TimeCockpit_Data_QueryLanguage_Syntax_Expression_) function. The function takes a <xref:TimeCockpit.Data.QueryLanguage.Syntax.BinaryOperator> and two sub expressions. In this example, the left-hand expression is a member access to a property which is created using the [Property()](xref:TimeCockpit.Data.QueryLanguage.Syntax.TCQLExpression#TimeCockpit_Data_QueryLanguage_Syntax_TCQLExpression_Property_System_String_) method. The second, right hand operand of the binary expression is a constant string literal, created using the [Constant()](xref:TimeCockpit.Data.QueryLanguage.Syntax.TCQLExpression#TimeCockpit_Data_QueryLanguage_Syntax_TCQLExpression_Constant_System_String_) function.

## Expressions

The expression tree in TCQL is a tree with <xref:TimeCockpit.Data.QueryLanguage.Syntax.BinaryExpression> being the node class for all binary operators, no matter if boolean or not. The constructor to a binary expression takes one of the enum values defined in <xref:TimeCockpit.Data.QueryLanguage.Syntax.BinaryOperator>, the left hand expression and the right hand expression. The leaf nodes of a TCQL expressions can be one of the following types:

- Constant (String, Boolean, Decimal, Date, DateTime, Guid, Null)
- Parameter Access
- Set
- NamedSetReference

The constant values can be created by calling the corresponding overload to [Constant()]((xref:TimeCockpit.Data.QueryLanguage.Syntax.TCQLExpression#TimeCockpit_Data_QueryLanguage_Syntax_TCQLExpression_Constant_System_String_)). Function calls can be created using the [FunctionCall()](xref:TimeCockpit.Data.QueryLanguage.Syntax.TCQLExpression#TimeCockpit_Data_QueryLanguage_Syntax_TCQLExpression_FunctionCall_System_String_TimeCockpit_Data_QueryLanguage_Syntax_Expression___) function. Consider following TCQL statement:

```
From T In Timesheet Where T.BeginTime < :Now() Select T
```

The TCQL AST equivalent can be found in the snippet below:

```
var q = TCQLExpression.Query(
            TCQLExpression.From("Timesheet"),
            TCQLExpression.MakeBinary(BinaryOperator.Less,
                TCQLExpression.Property("BeginTime"),
                TCQLExpression.FunctionCall("Now")),
            TCQLExpression.SelectAlias());
```

Additional parameter expressions can be passed to the [TCQLExpression.FunctionCall()]((xref:TimeCockpit.Data.QueryLanguage.Syntax.TCQLExpression#TimeCockpit_Data_QueryLanguage_Syntax_TCQLExpression_FunctionCall_System_String_TimeCockpit_Data_QueryLanguage_Syntax_Expression___) method as additional parameters.

## Select New With
In previous examples, the simplistic [SelectAlias()](xref:TimeCockpit.Data.QueryLanguage.Syntax.TCQLExpression#TimeCockpit_Data_QueryLanguage_Syntax_TCQLExpression_SelectAlias_System_String_System_Int32_) was used to define the structure of the returned EntityObjects. With TCQL Select New queries can be expressed in the following way:

```
From P In Project Select New With { P.Code, .TheTitle = P.ProjectName }
```

This would correspond to the following TCQL AST code snippet:

```
var q = TCQLExpression.Query(
            "P",
            TCQLExpression.From("Project"),
            TCQLExpression.SelectNewWith(
                TCQLExpression.Member(TCQLExpression.Property("Code")),
                TCQLExpression.Member("TheTitle", TCQLExpression.Property("ProjectName")
            )
        )
    );
```

## Include Statements

TCQL allows fine grained selection of which relations should be loaded using so called include clauses. The most basic include clause is the [IncludeAll](xref:TimeCockpit.Data.QueryLanguage.Syntax.TCQLExpression#TimeCockpit_Data_QueryLanguage_Syntax_TCQLExpression_IncludeAll) clause, causing the the full tree of relations to be selected. As an example, consider the TCQL statement:

```
From P In Project.Include(*) Select P
```

Using the TCQL API, this statement would be constructed using the following code snippet:

```
var q = TCQLExpression.Query(TCQLExpression.From("Project", TCQLExpression.IncludeAll));
```

The sample above constructs a query for a <xref:TimeCockpit.Data.QueryLanguage.Syntax.EntitySource> with a single include all clause. More specific includes can be constructed using the [IncludeRelation()](xref:TimeCockpit.Data.QueryLanguage.Syntax.TCQLExpression#TimeCockpit_Data_QueryLanguage_Syntax_TCQLExpression_IncludeRelation_System_String_) method. The following TCQL statement includes a specific relation:

```
From P In Project.Include('Customer') Select P
```

The statement above is equivalent to the following TCQL AST code:

```
var q = TCQLExpression.Query(TCQLExpression.From("Project", TCQLExpression.IncludeRelation("Customer")));
```

Another type of include is a conditional include, which includes a back reference with a condition. An example in time cockpit is evaluation of the current hours of work per week for all users. The query produces a table showing the current work hours per week per user.

```
From U In UserDetail.Include(W, WeeklyHoursOfWork, ((U.W.ValidFrom <= :Now()) And (U.W.ValidUntil > :Now()))) Select New With { U.Username, U.W.SumHours }
```

The equivalent TCQL AST code is shown below:

```
var q = TCQLExpression.Query(
            TCQLExpression.From("UserDetail",
                TCQLExpression.IncludeConditional("WeeklyHoursOfWork",
                    TCQLExpression.MakeBinary(
                        BinaryOperator.AndAlso,
                        TCQLExpression.MakeBinary(
                            BinaryOperator.LessEqual,
                            TCQLExpression.Property("W", "ValidFrom"),
                            TCQLExpression.FunctionCall("Now")),
                        TCQLExpression.MakeBinary(
                            BinaryOperator.Greater,
                            TCQLExpression.Property("W", "ValidUntil"),
                            TCQLExpression.FunctionCall("Now"))
                    ),
                    "W"
                )
                ),
                TCQLExpression.SelectNewWith(
                    TCQLExpression.Member(TCQLExpression.Property("Username")),
                    TCQLExpression.Member(TCQLExpression.Property("W", "SumHours"))
                )
);
```