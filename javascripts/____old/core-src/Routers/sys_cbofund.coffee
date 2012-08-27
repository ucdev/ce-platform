#! ce._core.routers.Sys_cbofund.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Sys_cbofund.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "sys_cbofund.coffee/:id/show": "show"
    "sys_cbofund.coffee/:id/edit": "edit"
  )

