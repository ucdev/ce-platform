#! ce._core.routers.Hubs extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Hubs = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "hubs/:id/show": "show"
    "hubs/:id/edit": "edit"
  )

