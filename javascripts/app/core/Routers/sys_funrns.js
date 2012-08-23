#! ce._core.routers.Sys_funrns extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Sys_funrns = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "sys_funrns/:id/show": "show"
    "sys_funrns/:id/edit": "edit"
  )

