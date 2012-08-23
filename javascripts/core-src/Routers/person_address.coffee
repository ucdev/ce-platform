#! ce._core.routers.Person_address.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Person_address.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "person_address.coffee/:id/show": "show"
    "person_address.coffee/:id/edit": "edit"
  )

