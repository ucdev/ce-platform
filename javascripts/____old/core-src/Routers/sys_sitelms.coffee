#! ce._core.routers.Sys_sitelms.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Sys_sitelms.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "sys_sitelms.coffee/:id/show": "show"
    "sys_sitelms.coffee/:id/edit": "edit"
  )

