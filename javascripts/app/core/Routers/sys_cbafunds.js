#! ce._core.routers.Sys_cbafunds extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Sys_cbafunds = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "sys_cbafunds/:id/show": "show"
    "sys_cbafunds/:id/edit": "edit"
  )

