#! ce._core.routers.Imagetype.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Imagetype.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "imagetype.coffee/:id/show": "show"
    "imagetype.coffee/:id/edit": "edit"
  )

