#! ce._core.routers.Sys_prinemps extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Sys_prinemps = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "sys_prinemps/:id/show": "show"
    "sys_prinemps/:id/edit": "edit"
  )

