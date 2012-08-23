#! ce._core.routers.Sys_sitelms extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Sys_sitelms = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "sys_sitelms/:id/show": "show"
    "sys_sitelms/:id/edit": "edit"
  )

