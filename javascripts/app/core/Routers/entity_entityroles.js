#! ce._core.routers.Entity_entityroles extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Entity_entityroles = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "entity_entityroles/:id/show": "show"
    "entity_entityroles/:id/edit": "edit"
  )

