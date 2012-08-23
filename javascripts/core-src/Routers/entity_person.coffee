#! ce._core.routers.Entity_person.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Entity_person.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "entity_person.coffee/:id/show": "show"
    "entity_person.coffee/:id/edit": "edit"
  )

