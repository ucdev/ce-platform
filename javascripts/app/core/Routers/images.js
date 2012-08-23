#! ce._core.routers.Images extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Images = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "images/:id/show": "show"
    "images/:id/edit": "edit"
  )

