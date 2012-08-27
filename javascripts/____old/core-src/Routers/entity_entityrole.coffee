#! ce._core.routers.Entity_entityrole.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Entity_entityrole.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "entity_entityrole.coffee/:id/show": "show"
    "entity_entityrole.coffee/:id/edit": "edit"
  )

