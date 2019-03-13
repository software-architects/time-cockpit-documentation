# Dashboards (PREVIEW)

Dashboards allow you to arrange different type of data on a board. The following three types of widgets are allowed:

- Chart
- Key Figure
- List

Widgets can be arranged in 12 columns that are distributed evenly per line. Each line has a height of 140px.

![Dashboard Grid](images/dashboard/dashboard-grid.png "Dashboard Grid")

## Create and Update Dashboards

Dashboard configurations are stored as time cockpit EntityView. The following creates or updates a dashboard with the specified name

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

## Add Dashboard to Menu

You can add dashboards to the menu similar to other entity views in the Modules configuration. The required configuration is as follows:

![Configure Menu Item](images/dashboard/configure-menu-item.png "Configure Menu Item")

## Layout Configuration of Widgets

...

## Chart

...

## Key Figure

...

## List

...