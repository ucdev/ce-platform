#! ce._core.routers.Hub.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Hub.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "hub.coffee/:id/show": "show"
    "hub.coffee/:id/edit": "edit"
  )

