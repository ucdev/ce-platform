#! ce._core.routers.Person_interest_excepts extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Person_interest_excepts = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "person_interest_excepts/:id/show": "show"
    "person_interest_excepts/:id/edit": "edit"
  )

