#! ce._core.routers.Sys_apiclients extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Sys_apiclients = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "sys_apiclients/:id/show": "show"
    "sys_apiclients/:id/edit": "edit"
  )

