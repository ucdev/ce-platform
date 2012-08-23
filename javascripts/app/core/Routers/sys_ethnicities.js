#! ce._core.routers.Sys_ethnicities extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Sys_ethnicities = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "sys_ethnicities/:id/show": "show"
    "sys_ethnicities/:id/edit": "edit"
  )

