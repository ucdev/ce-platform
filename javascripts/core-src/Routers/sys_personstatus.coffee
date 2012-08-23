#! ce._core.routers.Sys_personstatus.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Sys_personstatus.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "sys_personstatus.coffee/:id/show": "show"
    "sys_personstatus.coffee/:id/edit": "edit"
  )

