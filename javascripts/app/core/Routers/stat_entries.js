#! ce._core.routers.Stat_entries extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Stat_entries = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "stat_entries/:id/show": "show"
    "stat_entries/:id/edit": "edit"
  )

