#! ce._core.routers.Object.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Object.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "object.coffee/:id/show": "show"
    "object.coffee/:id/edit": "edit"
  )

