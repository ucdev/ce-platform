#! ce._core.routers.Entity_persons extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Entity_persons = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "entity_persons/:id/show": "show"
    "entity_persons/:id/edit": "edit"
  )

