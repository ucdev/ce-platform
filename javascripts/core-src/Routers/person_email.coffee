#! ce._core.routers.Person_email.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Person_email.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "person_email.coffee/:id/show": "show"
    "person_email.coffee/:id/edit": "edit"
  )

