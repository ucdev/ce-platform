#! ce._core.routers.Person_client.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Person_client.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "person_client.coffee/:id/show": "show"
    "person_client.coffee/:id/edit": "edit"
  )

