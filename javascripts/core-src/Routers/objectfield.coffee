#! ce._core.routers.Objectfield.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Objectfield.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "objectfield.coffee/:id/show": "show"
    "objectfield.coffee/:id/edit": "edit"
  )

