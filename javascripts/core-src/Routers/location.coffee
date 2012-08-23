#! ce._core.routers.Location.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Location.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "location.coffee/:id/show": "show"
    "location.coffee/:id/edit": "edit"
  )

