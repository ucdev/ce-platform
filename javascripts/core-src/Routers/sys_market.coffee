#! ce._core.routers.Sys_market.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Sys_market.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "sys_market.coffee/:id/show": "show"
    "sys_market.coffee/:id/edit": "edit"
  )

