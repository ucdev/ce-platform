#! ce._core.routers.Sys_degrees extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Sys_degrees = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "sys_degrees/:id/show": "show"
    "sys_degrees/:id/edit": "edit"
  )

