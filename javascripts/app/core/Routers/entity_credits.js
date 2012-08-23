#! ce._core.routers.Entity_credits extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Entity_credits = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "entity_credits/:id/show": "show"
    "entity_credits/:id/edit": "edit"
  )

