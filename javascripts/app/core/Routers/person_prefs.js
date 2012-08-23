#! ce._core.routers.Person_prefs extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Person_prefs = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "person_prefs/:id/show": "show"
    "person_prefs/:id/edit": "edit"
  )

