#! ce._core.routers.Person.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Person.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "person.coffee/:id/show": "show"
    "person.coffee/:id/edit": "edit"
  )

