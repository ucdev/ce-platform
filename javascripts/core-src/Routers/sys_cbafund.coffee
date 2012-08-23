#! ce._core.routers.Sys_cbafund.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Sys_cbafund.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "sys_cbafund.coffee/:id/show": "show"
    "sys_cbafund.coffee/:id/edit": "edit"
  )

