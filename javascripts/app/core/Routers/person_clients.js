#! ce._core.routers.Person_clients extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Person_clients = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "person_clients/:id/show": "show"
    "person_clients/:id/edit": "edit"
  )

