#! ce._core.routers.Sys_profc.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Sys_profc.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "sys_profc.coffee/:id/show": "show"
    "sys_profc.coffee/:id/edit": "edit"
  )

