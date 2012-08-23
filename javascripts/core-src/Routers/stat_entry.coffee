#! ce._core.routers.Stat_entry.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Stat_entry.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "stat_entry.coffee/:id/show": "show"
    "stat_entry.coffee/:id/edit": "edit"
  )

