---
title: Dashboards - Eigene Datenvisualisierung
description: Erstellen Sie eigene Dashboards in time cockpit mit Diagrammen, Kennzahlen und Listen. Ordnen Sie Widgets in einem Raster mit 12 Spalten an.
en_page: doc/data-model-customization/dashboard.md
---
# Dashboards

![Einfaches Dashboard](/doc/data-model-customization/images/dashboard/wc-dashboard.png "Einfaches Dashboard")

Mit Dashboards können Sie verschiedene Arten von Daten auf einer Übersichtsseite anordnen. Folgende drei Arten von Widgets sind möglich:

- Diagramm (Chart)
- Kennzahl (Key Figure)
- Liste (List)

Widgets können in 12 Spalten angeordnet werden, die gleichmäßig auf jede Zeile verteilt sind. Jede Zeile ist 140px hoch.

![Dashboard-Raster](/doc/data-model-customization/images/dashboard/dashboard-grid.png "Dashboard-Raster")

## Dashboards anlegen und aktualisieren

Dashboard-Konfigurationen werden als time cockpit EntityView gespeichert. Das folgende Skript legt ein Dashboard mit dem angegebenen Namen an oder aktualisiert es

```
model = Context.GetWritableModel()
dashboard = "USR_RevenueAndProfitDashboard"
entity = model.Entities.APP_Invoice

if model.ModelEntityViews.Contains(dashboard):
   view = model.ModelEntityViews[dashboard]
else:
   view = EntityView()
   view.Name = dashboard
   view.TypeName = "TimeCockpit.Data.DataModel.View.Dashboard"
   model.ModelEntityViews.Add(view)

print view.ConfigurationMarkup
view.TypeName = "TimeCockpit.Data.DataModel.View.Dashboard"
view.TargetEntity = entity
view.ConfigurationMarkup = '''{
   "title": "Revenue & Profit",
   "widgets": [ ... ]
}
'''

Context.SaveModel(model)
```

## Dashboard zum Menü hinzufügen

Sie können Dashboards wie andere Entity Views in der Konfiguration der Module zum Menü hinzufügen. Die erforderliche Konfiguration sieht so aus:

![Menüeintrag konfigurieren](/doc/data-model-customization/images/dashboard/configure-menu-item.png "Menüeintrag konfigurieren")

## Konfiguration von Widgets

Alle Widgets haben einige gemeinsame Angaben wie `title` oder `type`:

```
{
   "title": "Title of the widget",
   "infoTooltip": "Tooltip that is displayed in the title bar of the widget",
   "type": "chart" | "list" | "keyFigure",
   "layoutXs": { ... },
   "layoutSm": { ... },
   "layoutMd": { ... },
   "layoutLg": { ... },
   "layoutXl": { ... },
   "configuration": { ... }
}
```

Die Eigenschaft `configuration` enthält die eigentliche Konfiguration entsprechend dem Typ des Widgets.

### Layout

Jedes Widget kann 5 verschiedene Layout-Konfigurationen für unterschiedliche Bildschirmgrößen enthalten, entsprechend den Breakpoints von [angular/flex-layout](https://github.com/angular/flex-layout/wiki/Responsive-API).

Die Standardkonfiguration für Diagramme und Listen lautet:

```
defaultLayoutXs = { colspan: 12, rowspan: 2, offset: 0, order: null };
defaultLayoutSm = { colspan: 6, rowspan: 2, offset: 0, order: null };
defaultLayoutMd = { colspan: 6, rowspan: 2, offset: 0, order: null };
defaultLayoutLg = { colspan: 4, rowspan: 2, offset: 0, order: null };
defaultLayoutXl = { colspan: 4, rowspan: 2, offset: 0, order: null };
```

Kennzahlen verwenden nur einen rowspan von 1 statt 2. Alle anderen Eigenschaften entsprechen den Standardwerten für Diagramme und Listen.

Die Eigenschaft `order` legt die Sortierreihenfolge innerhalb des Rasters fest. Ist keine Reihenfolge angegeben, wird die Reihenfolge der Elemente im Konfigurations-JSON des Widgets verwendet.

Ist kein eigenes Layout angegeben, werden die Standardwerte verwendet. 

Sind nicht alle Layoutgrößen angegeben, wird ein Layout für die angegebene Größe und alle größeren Bildschirmgrößen ohne eigenes Layout verwendet.

## Diagramm

Für Diagramme muss der Name einer Liste als Datenquelle angegeben werden. Zusätzlich können `series`, `seriesDefaults`, `categoryAxis`, `valueAxis` und `legend` gemäß der [Dokumentation von Kendo UI for Angular](https://www.telerik.com/kendo-angular-ui/components/charts/api/) angegeben werden.

```
{
   ...,
   "configuration": {
      "title": "Unbilled Timesheets",
      "listDataSource": "USR_Dashboard_UnbilledTimesheets",
      "series": [
            {
               "name": "Revenue",
               "field": "USR_Revenue",
               "categoryField": "USR_Month",
               "groupField": "USR_Customer",
               "type": "column",
               "stack": true
            }
      ],
      "legend": {
            "position": "bottom",
            "orientation": "horizontal",
            "labels": {
               "font": "10px Roboto, sans-serif"
            }
      },
      "valueAxis": { "labels": { "format": "n0" }}
   }
}
```

In `series` gibt es ein zusätzliches Feld `groupField`, das in der API von Kendo UI nicht existiert. Damit können Sie ein Feld angeben, nach dem die Daten innerhalb einer Kategorie gruppiert werden.

## Kennzahl

Für Kennzahlen müssen eine Liste und eine Ergebnisspalte dieser Liste angegeben werden:

```
{
   ...,
   "configuration": {
      "listDataSource": "USR_Dashboard_RevenueAndProfitForecast",
      "valueField": "USR_RevenuePlanned",
      "aggregate": "count" | "sum" | "average" | "min" | "max" | "first" | "last"
   }
}
```

Ist keine Aggregatfunktion angegeben, wird die erste Zeile des Ergebnisses verwendet.

## Liste

Für Listen muss der Name der Liste angegeben werden:

```
{
   ...,
   "configuration": {
      "listName": "USR_Dashboard_RevenueAndProfitForecast"
   }
}
```
