#! ce._core.routers.Person_degree.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Person_degree.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "person_degree.coffee/:id/show": "show"
    "person_degree.coffee/:id/edit": "edit"
  )

