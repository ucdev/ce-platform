#! ce._core.routers.Entity_entitytypes extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Entity_entitytypes = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "entity_entitytypes/:id/show": "show"
    "entity_entitytypes/:id/edit": "edit"
  )

