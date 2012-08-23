#! ce._core.routers.Sys_status.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Sys_status.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "sys_status.coffee/:id/show": "show"
    "sys_status.coffee/:id/edit": "edit"
  )

