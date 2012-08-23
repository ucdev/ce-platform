#! ce._core.routers.Sys_roles extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Sys_roles = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "sys_roles/:id/show": "show"
    "sys_roles/:id/edit": "edit"
  )

