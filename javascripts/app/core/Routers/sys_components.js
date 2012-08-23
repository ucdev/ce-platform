#! ce._core.routers.Sys_components extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Sys_components = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "sys_components/:id/show": "show"
    "sys_components/:id/edit": "edit"
  )

