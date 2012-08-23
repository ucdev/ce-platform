#! ce._core.routers.Sys_statuses extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Sys_statuses = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "sys_statuses/:id/show": "show"
    "sys_statuses/:id/edit": "edit"
  )

