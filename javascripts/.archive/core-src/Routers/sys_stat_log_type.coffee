#! ce._core.routers.Sys_stat_log_type.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Sys_stat_log_type.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "sys_stat_log_type.coffee/:id/show": "show"
    "sys_stat_log_type.coffee/:id/edit": "edit"
  )

