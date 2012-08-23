#! ce._core.routers.Stat_logs extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Stat_logs = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "stat_logs/:id/show": "show"
    "stat_logs/:id/edit": "edit"
  )

