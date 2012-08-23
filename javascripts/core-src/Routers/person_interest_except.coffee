#! ce._core.routers.Person_interest_except.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Person_interest_except.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "person_interest_except.coffee/:id/show": "show"
    "person_interest_except.coffee/:id/edit": "edit"
  )

