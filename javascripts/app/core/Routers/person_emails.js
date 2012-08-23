#! ce._core.routers.Person_emails extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Person_emails = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "person_emails/:id/show": "show"
    "person_emails/:id/edit": "edit"
  )

