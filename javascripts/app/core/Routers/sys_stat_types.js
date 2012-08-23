#! ce._core.routers.Sys_stat_types extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Sys_stat_types = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "sys_stat_types/:id/show": "show"
    "sys_stat_types/:id/edit": "edit"
  )

