#! ce._core.routers.Sys_profn.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Sys_profn.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "sys_profn.coffee/:id/show": "show"
    "sys_profn.coffee/:id/edit": "edit"
  )

