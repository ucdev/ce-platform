#! ce._core.routers.Sys_reports extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Sys_reports = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "sys_reports/:id/show": "show"
    "sys_reports/:id/edit": "edit"
  )

