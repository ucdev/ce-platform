#! ce._core.routers.Person_user.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Person_user.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "person_user.coffee/:id/show": "show"
    "person_user.coffee/:id/edit": "edit"
  )

