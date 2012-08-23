#! ce._core.routers.Entity_activity.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Entity_activity.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "entity_activity.coffee/:id/show": "show"
    "entity_activity.coffee/:id/edit": "edit"
  )

