#! ce._core.routers.Person_pref.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Person_pref.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "person_pref.coffee/:id/show": "show"
    "person_pref.coffee/:id/edit": "edit"
  )

