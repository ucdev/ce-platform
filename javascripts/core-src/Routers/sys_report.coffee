#! ce._core.routers.Sys_report.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Sys_report.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "sys_report.coffee/:id/show": "show"
    "sys_report.coffee/:id/edit": "edit"
  )

