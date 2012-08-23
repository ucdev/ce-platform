#! ce._core.routers.Person_users extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Person_users = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "person_users/:id/show": "show"
    "person_users/:id/edit": "edit"
  )

