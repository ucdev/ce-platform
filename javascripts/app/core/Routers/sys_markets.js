#! ce._core.routers.Sys_markets extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Sys_markets = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "sys_markets/:id/show": "show"
    "sys_markets/:id/edit": "edit"
  )

