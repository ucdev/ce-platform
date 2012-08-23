#! ce._core.routers.Entity_activities extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Entity_activities = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "entity_activities/:id/show": "show"
    "entity_activities/:id/edit": "edit"
  )

