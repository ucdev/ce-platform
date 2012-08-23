#! ce._core.routers.Sys_stepstatuses extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Sys_stepstatuses = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "sys_stepstatuses/:id/show": "show"
    "sys_stepstatuses/:id/edit": "edit"
  )

