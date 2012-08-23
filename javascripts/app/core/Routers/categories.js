#! ce._core.routers.Categories extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Categories = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "categories/:id/show": "show"
    "categories/:id/edit": "edit"
  )

