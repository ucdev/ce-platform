#! ce._core.routers.Image.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Image.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "image.coffee/:id/show": "show"
    "image.coffee/:id/edit": "edit"
  )

