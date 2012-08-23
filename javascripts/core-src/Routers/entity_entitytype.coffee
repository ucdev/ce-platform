#! ce._core.routers.Entity_entitytype.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Entity_entitytype.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "entity_entitytype.coffee/:id/show": "show"
    "entity_entitytype.coffee/:id/edit": "edit"
  )

