#! ce._core.routers.Person_degrees extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Person_degrees = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "person_degrees/:id/show": "show"
    "person_degrees/:id/edit": "edit"
  )

