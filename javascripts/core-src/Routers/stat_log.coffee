#! ce._core.routers.Stat_log.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Stat_log.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "stat_log.coffee/:id/show": "show"
    "stat_log.coffee/:id/edit": "edit"
  )

