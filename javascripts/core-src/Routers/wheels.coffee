#! ce._core.routers.Wheels.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Wheels.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "wheels.coffee/:id/show": "show"
    "wheels.coffee/:id/edit": "edit"
  )

