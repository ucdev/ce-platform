#! ce._core.routers.Locations extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Locations = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "locations/:id/show": "show"
    "locations/:id/edit": "edit"
  )

