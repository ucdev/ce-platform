#! ce._core.routers.Sys_funrn.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Sys_funrn.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "sys_funrn.coffee/:id/show": "show"
    "sys_funrn.coffee/:id/edit": "edit"
  )

