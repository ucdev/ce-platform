#! ce._core.routers.Person_addresses extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Person_addresses = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "person_addresses/:id/show": "show"
    "person_addresses/:id/edit": "edit"
  )

