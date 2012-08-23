#! ce._core.routers.Person_file.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Person_file.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "person_file.coffee/:id/show": "show"
    "person_file.coffee/:id/edit": "edit"
  )

