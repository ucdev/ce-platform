#! ce._core.routers.Sys_cbofunds extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Sys_cbofunds = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "sys_cbofunds/:id/show": "show"
    "sys_cbofunds/:id/edit": "edit"
  )

