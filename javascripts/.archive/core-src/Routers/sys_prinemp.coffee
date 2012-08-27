#! ce._core.routers.Sys_prinemp.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Sys_prinemp.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "sys_prinemp.coffee/:id/show": "show"
    "sys_prinemp.coffee/:id/edit": "edit"
  )

